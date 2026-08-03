# Three-slot Mobile Summon HUD Design

## Status

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
status: USER_DELEGATED_RECOMMENDED_DESIGN_WRITTEN
approved_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
approved_at: 2026-08-03T07:49:00+09:00
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
parent_decisions:
  - GM-MOBILE-UX-FLOW-01
  - GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. Problem

The Mobile Landscape screen must show one persistent main summon and up to three secondary summons without obscuring:

1. target or enemy;
2. enemy intent and remaining time;
3. environmental risk and protected target;
4. player HP and mana;
5. the expandable right Writing Focus Panel.

The summon HUD must explain deterministic support events without becoming a second dashboard or replacing player judgment.

## 2. Explored approaches

### A. Top horizontal rail

- Places MAIN, S1, S2, and S3 below the objective and timer.
- Advantage: easy left-to-right reading.
- Rejected for the prototype because it competes with objective, target intent, threat, and timer information.

### B. Left compact vertical rail with contextual detail drawer — selected

- Places MAIN, S1, S2, and S3 in one safe-area-aware left rail.
- Opens one selected slot toward the center as a temporary detail drawer.
- Keeps the right side free for the Writing Focus Panel.
- Preserves a stable slot order and deterministic event source.

### C. Bottom horizontal rail

- Places the four summon states near player resources and common touch reach.
- Advantage: easy thumb access.
- Rejected because it competes with player HP, mana, Stock, Commit controls, and hand occlusion during writing.

## 3. Selected architecture

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

The diagram shows responsibility zones, not final pixels.

### 3.1 Rail anchor

- Default anchor: left safe-area column, vertically centered below the objective and threat block.
- The rail must not overlap the target silhouette, HP and mana, or the left cutout.
- If the target block uses the left column, the rail moves to the nearest lower-left safe anchor without changing slot order.
- The right Writing Panel never owns or repositions the rail.

### 3.2 Stable order

```text
MAIN
S1
S2
S3
```

The visual order matches the deterministic event order `MAIN → S1 → S2 → S3`.

## 4. Compact slot contract

Each compact slot shows only:

1. slot ID: `MAIN`, `S1`, `S2`, or `S3`;
2. summon identity portrait or silhouette;
3. primary role icon and text abbreviation;
4. representative integer stat;
5. next action remaining seconds, or `상시` for Guardian defense;
6. state label: `정상`, `정지`, `봉인`, `무효`, `오류`, or `빈 슬롯`.

Examples:

```text
S1  생산  [스톡] 2   03초
S2  수호  [방어도] 2 상시
S3  공격  [공격] 2   정지
```

Color is supplementary. Slot, role, number, icon, timer, and state text remain readable without color.

## 5. Detail drawer contract

Selecting one compact slot opens one contextual detail drawer toward the screen center.

The drawer shows:

- summon name and primary role;
- fixed target rule;
- representative integer stat;
- expected before and after value for the next valid event;
- remaining cycle time and paused reason;
- last event ID and result summary;
- `귀환` and `교체` actions when interaction is permitted.

Only one drawer may be open. Selecting another slot replaces the previous drawer; it does not stack drawers.

### 5.1 Non-modal behavior

- Reading the drawer does not pause the Active Pressure Clock.
- Pressing `귀환` or `교체` enters an explicit confirmation state.
- Confirmation may pause the Clock only after the player has committed to management mode.
- Closing the drawer changes no State and consumes no mana.

This prevents the drawer from becoming a free tactical pause.

## 6. Writing Focus behavior

When the right Writing Focus Panel is expanded:

- the compact rail remains visible;
- the full detail drawer closes;
- selecting a slot opens a read-only micro detail containing only target rule, representative stat, next action, and state;
- `귀환` and `교체` actions are hidden until the Writing Panel is collapsed or the current Draft is safely preserved;
- rail selection never steals the active drawing stroke;
- the Writing Panel canvas receives priority over rail hover, tooltip, and animation.

This preserves the approved requirement that target, intent, timer, environmental risk, HP, and mana remain visible during writing.

## 7. Result and event-source behavior

When a summon event resolves:

1. the source slot briefly enters `RESULT_SOURCE`;
2. the affected value shows a signed integer delta;
3. the result log records the source slot and event ID;
4. the next cycle starts only after the current event resolves;
5. simultaneous events display in `MAIN → S1 → S2 → S3` order.

Examples:

```text
S1 [스톡] -2초 · event: SUM-S1-0041
S3 [공격] 불안정도 7→5 · event: SUM-S3-0018
```

The HUD must never imply that an automatic attack completed the Situation. Automatic assault cannot lower instability below 1 or become the final resolution event.

## 8. State matrix

| State | Rail | Detail | Clock | Interaction |
|---|---|---|---|---|
| OBSERVE | full compact rail | one drawer allowed | running | select, recall, replace |
| WRITING_FOCUS | full compact rail | read-only micro detail | running except approved blocking states | inspect only |
| SYSTEM_RESOLVE | source slot highlighted | closed | paused | none |
| RESULT | source and delta | result summary | paused until result completes | acknowledge only |
| PAUSE/BACKGROUND | static with `정지` | closed | stopped | none |
| RESUME | restored state and remaining time | closed | resumes after validation | inspect |
| ERROR | slot ID plus explicit error text | recovery explanation | stopped for invalid state | safe recovery only |

## 9. Accessibility and touch contract

- Android interactive target: at least `48dp × 48dp`.
- iOS interactive target: at least `44pt × 44pt` for primary touch controls.
- Visual icons may be smaller only when the interactive hit area remains compliant.
- Each slot receives a unique accessible name containing slot, summon, role, stat, timer, and state.
- Role and state are never conveyed by color alone.
- Text scale `130%` is a required layout case.
- Reduced Motion replaces slot pulses and drawer motion with immediate state changes and static emphasis.
- Haptic or sound feedback supplements, but never replaces, visible state feedback.

Exact Godot logical-unit conversion is a device-calibrated `TEST_VALUE`.

## 10. Safe area and responsive layout

- Query the display safe area at runtime.
- Test landscape `16:9`, `19.5:9`, and `20:9` phone classes.
- Test left and right cutout orientations.
- The rail uses relative anchors and container constraints rather than fixed screen pixels.
- The rail may reduce decorative portrait size before reducing touch targets or hiding state text.
- If `130%` text cannot fit, the compact slot may use two lines but must not overlap another slot.
- The detail drawer may scroll its history section, but target rule and action buttons remain fixed.

Prototype starting values, not final balance or production pixels:

```yaml
rail_visual_width_safe_area_ratio: 0.07_to_0.10
compact_slot_min_touch_target_android_dp: 48
compact_slot_min_touch_target_ios_pt: 44
compact_slot_gap_test_value: 4_to_8
detail_drawer_max_safe_width_ratio: 0.28
result_source_emphasis_seconds: 0.8_to_1.2
text_scale_required: 1.30
```

## 11. View-model boundary

The HUD reads a view model and does not mutate gameplay State directly.

```text
SummonRosterState
+ ActivePressureClock
+ ResultLedger
→ SummonHudViewModel
→ Rail / Detail Drawer / Result Source View
```

Required view-model fields:

```yaml
slot_id: MAIN | S1 | S2 | S3
summon_id: string | null
primary_role: MAIN | PRODUCTION | GUARDIAN | ASSAULT | RECOVERY
representative_stat_type: STOCK | DEFENSE | ATTACK | HEAL
representative_stat_value: integer
remaining_cycle_ms: integer | null
target_rule_text: string
state_code: EMPTY | ACTIVE | PAUSED | SEALED | INVALID | ERROR
last_event_id: string | null
last_result_summary: string | null
can_recall: boolean
can_replace: boolean
error_message: string | null
```

Button actions emit commands to the transaction layer. The HUD never subtracts mana, changes slots, applies events, or repairs Save data itself.

## 12. Error handling

- Fourth secondary summon: reject before confirmation and identify the full slot cap.
- Duplicate secondary role: reject before confirmation and identify the conflicting slot.
- Missing or duplicated slot in Save: stop the affected slot, show an explicit error, and offer safe-anchor recovery; do not silently rewrite the Save.
- Unknown event ID: display a non-destructive log warning and prevent duplicate application.
- Missing portrait or icon: use a stable silhouette and text; never hide the slot.
- Text overflow: preserve slot, role, number, and state before decorative names.

## 13. Acceptance tests

### Layout

1. `16:9`, `19.5:9`, and `20:9` with no cutout.
2. Left and right cutout orientations.
3. Writing Panel collapsed and expanded.
4. Text scale `100%` and `130%`.
5. MAIN plus zero, one, two, and three secondary summons.
6. Empty, active, paused, sealed, invalid, and error states.

### Interaction

1. Slot selection changes only the selected detail view.
2. Drawer reading does not pause the Clock.
3. Recall or replace requires explicit confirmation and valid transaction.
4. Writing stroke is not cancelled by rail input.
5. Management actions are unavailable during active drawing.
6. Fourth summon and duplicate role attempts fail without cost.

### Event and Save

1. Same-time events render in `MAIN → S1 → S2 → S3` order.
2. Each event source and integer delta remain identifiable.
3. Pause, background, and resume preserve each independent remaining cycle.
4. Already applied event IDs are not displayed or applied twice.
5. Damaged slot or role duplication in Save is not silently corrected.

### Accessibility

1. Touch targets meet Android and iOS minimums on measured devices.
2. Every slot has a unique accessible description.
3. Color-blind and grayscale review preserves role and state distinction.
4. Reduced Motion removes nonessential motion.
5. `130%` text preserves critical information and actions.

## 14. Rework conditions

Rework the wireframe if any condition occurs:

- the rail or drawer hides enemy intent, timer, environmental risk, HP, mana, or the writing canvas;
- a slot cannot be reliably selected at platform minimum touch size;
- three secondary slots cannot be distinguished at a glance;
- result source or event order is ambiguous;
- the detail drawer becomes a free tactical pause;
- rail input cancels a drawing stroke;
- `130%` text removes role, stat, timer, or state;
- the HUD mutates gameplay State directly;
- Save corruption is silently repaired;
- runtime, device, accessibility, or human validation is reported as complete without execution.

## 15. Scope boundary

This specification approves a wireframe and interface contract only.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED_BY_THIS_SPEC
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
FINAL_PIXEL_VALUES = TEST_VALUE
```

The next step after user review is a TDD implementation plan and test matrix, not direct product implementation.
