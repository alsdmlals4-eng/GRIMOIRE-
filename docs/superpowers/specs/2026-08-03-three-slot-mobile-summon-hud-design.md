# Three-slot Mobile Summon HUD Design

## Status

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
status: USER_APPROVED_HARDENED_SPEC_ACTIVE
approved_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
initial_approval_at: 2026-08-03T07:49:00+09:00
user_spec_review_approved_at: 2026-08-03T21:11:00+09:00
review_result: APPROVE_AFTER_TARGETED_HARDENING
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
implementation_plan: WRITTEN_NOT_EXECUTED
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. Problem

The Mobile Landscape screen must show one persistent main summon and up to three secondary summons without obscuring the target, enemy intent, remaining time, environmental risk, player HP and mana, or the expandable right Writing Focus Panel.

The HUD must expose deterministic support events without becoming a second dashboard, a free tactical pause, or an owner of gameplay State.

## 2. Selected approach

Three approaches were compared:

- top horizontal rail: rejected because it competes with objective, intent, threat, and timer;
- left compact vertical rail with one contextual drawer: selected;
- bottom horizontal rail: rejected because it competes with HP, mana, Stock, Commit controls, and hand occlusion.

Selected structure:

```text
Safe Area
┌──────────────────────────────────────────────────────────────┐
│ Objective · target intent · timer · environmental risk       │
│                                                              │
│ MAIN ┐                                                       │
│ S1   │  battlefield / target / consequence preview           │
│ S2   │                                                       │
│ S3   ┘                         ┌────────────────────────────┐ │
│                               │ expandable Writing Panel   │ │
│ HP · Mana · Stock             │ canvas / candidates / cost│ │
└───────────────────────────────┴────────────────────────────┘
```

The diagram defines responsibility zones, not final pixels.

## 3. Stable rail contract

Visual and deterministic event order are identical:

```text
MAIN → S1 → S2 → S3
```

Each compact slot shows:

1. slot ID;
2. portrait or stable silhouette;
3. primary role icon and text;
4. representative integer stat;
5. remaining seconds or `상시`;
6. explicit state text: `정상`, `정지`, `봉인`, `무효`, `오류`, or `빈 슬롯`.

Color is supplementary. Slot, role, number, timer, and state remain understandable in grayscale.

## 4. Contextual detail drawer

Selecting one slot opens one drawer toward the center. Selecting another replaces the current drawer; drawers never stack.

The drawer shows:

- summon name and role;
- fixed target rule;
- representative stat;
- expected before/after value for the next valid event;
- cycle time and paused reason;
- last event ID and result summary;
- recall and replace actions only when management is permitted.

Reading or comparing slots is non-modal and does not pause the Active Pressure Clock.

## 5. Management confirmation and Clock ownership

`귀환` or `교체` does not pause immediately.

```text
OBSERVE or WRITING_FOCUS
→ request management
→ finish active stroke
→ preserve Draft safely
→ enter MANAGEMENT_CONFIRM
→ pause Active Pressure Clock
→ confirm or cancel
```

- `MANAGEMENT_CONFIRM` is the only HUD management state that may pause the Clock.
- Cancelling confirmation changes no State and consumes no mana.
- Confirming emits a Command to the Transaction layer.
- The HUD never performs recall, replacement, mana deduction, or cycle reset directly.

This prevents the drawer from becoming a free tactical pause while still allowing safe confirmation.

## 6. Writing Focus and active-stroke ownership

When the right Writing Focus Panel is expanded:

- the compact rail remains visible;
- the full drawer closes;
- selecting a slot shows only read-only micro detail;
- recall and replace actions are hidden;
- the Writing Canvas owns the active pointer/touch sequence until the stroke ends;
- touching the rail during an active stroke causes no slot selection, focus transfer, recall, or replacement;
- decorative portraits, tooltips, and FX do not intercept input;
- the canvas remains the highest-priority input surface.

The Draft must survive panel collapse, management request, app interruption, and safe resume according to the parent Writing Focus contract.

## 7. Event resolution and presentation

Gameplay resolution and HUD presentation are separate.

```text
Summon events
→ Transaction / ResultLedger exactly-once resolution
→ canonical presentation records
→ HUD presentation queue
```

The `ResultLedger` owns duplicate detection and application. The HUD must not infer whether an event was already applied.

Same-time events are resolved in `MAIN → S1 → S2 → S3` order. The presentation may highlight sources sequentially, but the entire same-time batch must fit inside `1.2 seconds total TEST_VALUE`; it must not spend `0.8–1.2 seconds` per slot and accumulate multi-second delay.

Each presented event keeps:

- source slot;
- event ID;
- signed integer delta or concise state result;
- batch index and batch size when more than one source exists.

Automatic assault never lowers instability below 1 and never becomes the final Situation resolution event.

## 8. State matrix

| State | Rail | Detail | Clock | Interaction |
|---|---|---|---|---|
| OBSERVE | full compact rail | one drawer | running | inspect, request management |
| WRITING_FOCUS | full compact rail | read-only micro detail | running except approved blockers | inspect only |
| MANAGEMENT_CONFIRM | full compact rail | confirmation summary | paused | confirm or cancel |
| SYSTEM_RESOLVE | source highlighted | closed | paused | none |
| RESULT | source and delta | result summary | paused until result completes | acknowledge only |
| PAUSE/BACKGROUND | static `정지` | closed | stopped | none |
| RESUME | restored remaining values | closed | resumes after validation | inspect |
| ERROR | explicit slot and error text | recovery explanation | stopped for invalid state | safe recovery only |

## 9. View-model boundary

```text
SummonRosterState
+ ActivePressureClock
+ canonical ResultLedger presentation records
→ SummonHudViewModel
→ Rail / Drawer / Result Source View
```

Required slot fields:

```yaml
slot_id: MAIN | S1 | S2 | S3
summon_id: string | null
primary_role: MAIN | PRODUCTION | GUARDIAN | ASSAULT | RECOVERY | null
representative_stat_type: STOCK | DEFENSE | ATTACK | HEAL | null
representative_stat_value: integer | null
remaining_cycle_ms: integer | null
timing_mode: PERSISTENT | CYCLIC | NONE
target_rule_text: string | null
state_code: EMPTY | ACTIVE | PAUSED | SEALED | INVALID | ERROR
last_event_id: string | null
last_result_summary: string | null
can_recall: boolean
can_replace: boolean
unavailable_reason: string | null
error_message: string | null
```

Nullable fields are required for empty and invalid slots. `timing_mode` distinguishes persistent MAIN behavior, cyclic secondary behavior, and empty/error states without inventing fake timers.

The HUD never:

- subtracts mana;
- changes slots;
- applies summon effects;
- decides event deduplication;
- mutates Stock or combat State;
- silently repairs a damaged Save.

## 10. Accessibility and responsive layout

- Android interactive target: at least `48dp × 48dp`.
- iOS primary touch target: at least `44pt × 44pt`.
- Test text at `100%`, `130%`, and Android maximum `200%`.
- At 200%, reduce decorative portrait size first; allow two-line slots or safe scrolling while retaining slot, role, stat, state, and touch target.
- Timer text is available when a slot receives accessibility focus, but is not announced every second.
- Announce meaningful state changes, events, errors, and important thresholds only.
- Use non-interrupting queued announcements for ordinary changes; reserve immediate interruption for critical errors only.
- Reduced Motion replaces pulses and drawer travel with immediate state change and static emphasis.
- Query safe area at runtime and test `16:9`, `19.5:9`, `20:9`, left cutout, and right cutout.

Prototype values:

```yaml
rail_visual_width_safe_area_ratio: 0.07_to_0.10_TEST_VALUE
compact_slot_gap: 4_to_8_TEST_VALUE
detail_drawer_max_safe_width_ratio: 0.28_TEST_VALUE
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_cases: [1.00, 1.30, ANDROID_MAX_2.00]
```

## 11. Error handling

- fourth secondary summon: reject before confirmation and identify the cap;
- duplicate secondary role: reject before confirmation and identify the conflicting slot;
- missing or duplicate slot in Save: stop the affected slot, preserve the source Save, and offer explicit recovery;
- unknown event ID: ResultLedger records a non-destructive warning and does not reapply it; HUD displays only the canonical warning record;
- missing portrait or icon: use silhouette plus text;
- text overflow: preserve slot, role, stat, state, and touch area before decorative names;
- active-stroke conflict: keep canvas ownership and ignore management interaction until stroke completion.

## 12. Acceptance matrix

Layout:

- `16:9`, `19.5:9`, `20:9`;
- left and right cutouts;
- Writing Panel collapsed and expanded;
- text `100%`, `130%`, Android maximum `200%`;
- MAIN plus zero to three secondary summons;
- empty, active, paused, sealed, invalid, and error slots.

Interaction:

- drawer reading does not pause;
- management confirmation pauses only after safe Draft preservation;
- cancel changes no State;
- active stroke survives rail contact;
- management actions remain hidden while writing;
- fourth summon and duplicate role fail without cost.

Event and Save:

- same-time events resolve deterministically;
- full same-time presentation remains inside the total budget;
- source, event ID, and integer delta remain identifiable;
- ResultLedger, not HUD, blocks duplicates;
- pause/background/resume preserve independent remaining cycles;
- damaged Save is not silently rewritten.

Accessibility:

- platform touch targets pass measured-device checks;
- each slot has a unique accessible name;
- timer does not announce every second;
- meaningful changes are announced once;
- grayscale and Reduced Motion remain usable;
- required information survives 200% Android font scaling.

## 13. Rework conditions

Rework when any of the following occurs:

- rail or drawer hides intent, timer, environmental risk, HP, mana, or canvas;
- drawer reading pauses the Clock;
- management pause starts before safe Draft preservation;
- rail contact cancels a stroke or steals focus;
- same-time presentation delay obscures the next cycle;
- source or event order is ambiguous;
- 130% or 200% text removes critical information;
- timer announces every second;
- HUD mutates gameplay State or owns event deduplication;
- Save corruption is silently repaired;
- unexecuted validation is reported as complete.

## 14. Scope boundary

This specification approves the hardened wireframe, interfaces, TDD plan, and test matrix only.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED_BY_THIS_SPEC
TDD_PLAN = WRITTEN_NOT_EXECUTED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
FINAL_PIXEL_VALUES = TEST_VALUE
```
