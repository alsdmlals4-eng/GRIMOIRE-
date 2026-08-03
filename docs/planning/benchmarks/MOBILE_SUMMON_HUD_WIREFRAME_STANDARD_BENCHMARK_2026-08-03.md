# GR-BM-MOBILE-SUMMON-HUD-20260803-01 — Mobile Summon HUD Standard Benchmark

## Status

```yaml
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
scale: STANDARD
status: COMPLETE_HARDENED_AFTER_USER_SPEC_REVIEW
related_decision: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
initial_completed_at: 2026-08-03T07:49:00+09:00
hardened_review_approved_at: 2026-08-03T21:11:00+09:00
product_runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## Decision question

How should one persistent main summon and up to three secondary summons remain readable on a Mobile Landscape battle and writing screen without obscuring target, intent, timer, environmental risk, player resources, or the right Writing Focus Panel?

The user-spec review added four implementation-risk questions:

1. When may summon management pause the Active Pressure Clock?
2. How can four same-time events remain deterministic without causing a multi-second presentation backlog?
3. How must the HUD behave at Android maximum font scaling and with screen readers?
4. Which layer owns active-stroke input and event deduplication?

## Project constraints

- Mobile first, PC later.
- Landscape fixed.
- Right-side expandable Writing Focus Panel.
- Target, enemy intent, timer, environmental risk, HP, and mana remain visible during writing.
- Summon event order is `MAIN → S1 → S2 → S3`.
- Secondary roles are unique in the Slice.
- HUD reads State and does not mutate it.
- Runtime, device, accessibility, and human validation remain `NOT_RUN`.

## Sources

### Platform and engine standards

1. Apple Human Interface Guidelines — Designing for games
   - `https://developer.apple.com/design/human-interface-guidelines/designing-for-games/`
   - Preserve primary content, keep controls usable, accommodate safe areas, and avoid unnecessary permanent controls.

2. Apple Human Interface Guidelines — Game controls
   - `https://developer.apple.com/design/human-interface-guidelines/game-controls/`
   - Contextual controls reduce visual competition; frequent touch controls require practical target sizes.

3. Apple accessibility guidance — larger text and touch targets
   - `https://developer.apple.com/design/human-interface-guidelines/accessibility`
   - Use adaptable layouts and maintain discoverable interaction when text grows.

4. Android Developers — Make apps more accessible
   - `https://developer.android.com/guide/topics/ui/accessibility/apps`
   - Interactive elements require usable touch targets and unique accessible descriptions.

5. Android 14 behavior changes — nonlinear font scaling to 200%
   - `https://developer.android.com/about/versions/14/features#non-linear-font-scaling`
   - Android supports nonlinear font scaling up to 200%; applications should test maximum settings instead of assuming proportional growth.

6. Android `ViewCompat` accessibility live-region behavior
   - `https://developer.android.com/reference/androidx/core/view/ViewCompat`
   - `NONE` is the default; `POLITE` queues non-urgent changes and `ASSERTIVE` interrupts current announcements. Rapid timers should not be treated as continuously assertive content.

7. Godot Engine stable documentation — `DisplayServer.get_display_safe_area()`
   - `https://docs.godotengine.org/en/stable/classes/class_displayserver.html`
   - Provides the unobscured display region for safe-area-aware layout.

8. Godot Engine stable documentation — `Control` input propagation
   - `https://docs.godotengine.org/en/stable/classes/class_control.html`
   - `mouse_filter`, GUI input, and accepted events determine whether UI elements intercept or propagate pointer input; the writing canvas must retain the active stroke sequence.

### Direct mobile game comparison cases

9. League of Legends: Wild Rift — developer store materials
   - Edge-aligned persistent controls protect central battlefield visibility.

10. Pokémon UNITE — developer store materials
    - Team and match state remain near edges while the center stays readable.

11. Diablo Immortal — developer store materials
    - Persistent companion identity does not require a permanently expanded management dashboard.

The direct game observations are interface-pattern inferences from developer-provided materials, not claims that those games use GRIMOIRE's architecture.

## Comparison axes

| Approach | Situation visibility | Writing Panel compatibility | Touch reliability | Event-source clarity | Production and QA cost |
|---|---|---|---|---|---|
| Top horizontal rail | weak; competes with intent and timer | medium | medium | high | medium |
| Left compact vertical rail | high when safe-area anchored | high | high with compliant hit areas | high; order matches slots | medium |
| Bottom horizontal rail | medium; competes with HP, mana, Stock | weak during hand writing | high | high | medium |
| Four full cards always visible | low | very low | high | high | very high |
| One icon plus carousel | high | high | medium | low; hidden slot state | low |

## ADOPT / ADAPT / REJECT

### ADOPT

- Stable edge anchoring that preserves the central situation.
- One persistent main companion identity separated from secondary roles.
- Android `48dp` and iOS `44pt` minimum touch contracts.
- Safe-area-aware relative layout.
- Unique accessible descriptions and color-independent state labels.
- Android maximum `200%` font-scale testing.
- Non-interruptive accessibility announcements for ordinary state changes.

### ADAPT

- Use a left vertical rail because GRIMOIRE reserves the right side for writing.
- Keep all four slot identities visible, but expand details for only one selected slot.
- Reading is non-modal; only explicit management confirmation after safe Draft preservation may pause.
- Same-time events resolve atomically in deterministic order while presentation is compressed into one total budget.
- The Writing Canvas owns an active stroke; the rail remains observational until the stroke ends.
- ResultLedger owns exactly-once application and emits canonical presentation records to the HUD.

### REJECT

- Four permanently expanded summon cards.
- A top rail that competes with enemy intent and timer.
- A bottom rail that competes with HP, mana, Stock, Commit, and hand occlusion.
- Hidden carousel pages that make inactive slots invisible.
- Color-only role or error states.
- Opening or reading a detail panel as a free tactical pause.
- Per-slot event animation durations that accumulate beyond the next action cycle.
- Screen-reader announcement of every timer second.
- HUD-owned event deduplication or gameplay-State mutation.
- Fixed pixel coordinates that ignore safe areas and aspect ratios.

## Recommended hardened design

```text
left safe-area compact rail
= MAIN + S1 + S2 + S3 always identifiable

one contextual detail drawer
= selected target rule + expected integer result + last event + management request

management confirmation
= only after active stroke ends and Draft is safely preserved

Writing Focus
= compact rail remains + read-only micro detail + canvas input ownership

same-time event batch
= ResultLedger resolution in MAIN→S1→S2→S3 order
+ total HUD presentation budget 1.2 seconds TEST_VALUE
```

## Industry and production implications

### UX

- The rail remains subordinate to target, intent, timer, risk, HP, mana, and writing canvas.
- The player identifies role and next event without opening management.
- Management requires explicit confirmation and cannot become a pause exploit.
- Empty and error slots require genuine nullable data rather than fabricated values.

### Art and content

- Four compact identity assets are needed: MAIN plus S1/S2/S3.
- Missing portraits require a stable silhouette fallback.
- Role, state, and result-source visuals require icon and text variants, including grayscale and Reduced Motion.
- At maximum font scale, decorative portrait size is reduced before critical text or touch areas.

### Engineering

- Use a read-only, nullable `SummonHudViewModel`.
- Query safe area at runtime.
- Separate ResultLedger resolution from presentation timing.
- Canvas owns the active pointer sequence; decorative and rail nodes must not intercept it during a stroke.
- Use explicit `MANAGEMENT_CONFIRM` state rather than deriving pause from drawer visibility.

### QA

Combinatorial cases grow across:

- MAIN plus zero to three secondary summons;
- four role choices with unique-role limits;
- active, paused, sealed, invalid, error, and empty states;
- three aspect-ratio classes and both cutout sides;
- Writing Panel collapsed and expanded;
- text scale `100%`, `130%`, and Android maximum `200%`;
- screen-reader focus and live announcements;
- active-stroke contact with the rail;
- simultaneous event order, presentation budget, and Save/Resume.

The selected design controls this cost through one drawer, unique Slice roles, canonical event records, and explicit ownership boundaries.

## Adversarial findings

1. Left rail may overlap a left-aligned target or dialogue card.
   - Guard: alternate lower-left safe anchor without changing slot order.

2. Detail drawer can become a free pause.
   - Guard: drawer reading continues the Clock; only safe `MANAGEMENT_CONFIRM` pauses.

3. Rail taps can interfere with handwriting.
   - Guard: canvas owns the active stroke; rail selection is suppressed until completion.

4. Four simultaneous event cues can overwhelm the player or create animation debt.
   - Guard: deterministic atomic resolution and one `1.2-second total TEST_VALUE` presentation budget.

5. Accessibility enlargement can break the stack.
   - Guard: test Android maximum `200%`, reduce decoration first, allow two-line slots or safe scrolling.

6. A second-by-second timer can make screen readers unusable.
   - Guard: announce on focus or meaningful state changes only.

7. HUD deduplication can create divergent gameplay truth.
   - Guard: ResultLedger alone owns exactly-once application; HUD receives canonical display records.

## Verification plan

- Layout: `16:9`, `19.5:9`, `20:9`; left and right cutouts.
- Text scale: `100%`, `130%`, Android maximum `200%`.
- Touch target measurements on Android and iOS devices.
- Grayscale and Reduced Motion review.
- Screen-reader timer non-spam and meaningful-change announcements.
- Same-time event resolution order and total presentation budget.
- Writing stroke preservation while rail is visible and touched.
- Safe Draft preservation before management pause.
- Save/Resume with three independent cycle times.
- ResultLedger/HUD ownership boundary.

## Verdict

```yaml
recommended_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
confidence: USER_APPROVED_HARDENED_DESIGN_RUNTIME_UNVERIFIED
adopt: EDGE_ANCHOR_SAFE_AREA_TOUCH_MAX_FONT_SCALE_ACCESSIBILITY
adapt: LEFT_RAIL_ONE_DETAIL_SAFE_MANAGEMENT_CONFIRM_TOTAL_EVENT_BUDGET
reject: DENSE_RAIL_FREE_PAUSE_TIMER_SPAM_HUD_DEDUP
```
