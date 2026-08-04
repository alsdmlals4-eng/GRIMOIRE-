# GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS

## Sync Status

```yaml
sync_id: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
status: WORKING_BRANCH_CANON_SYNCED
synced_at: 2026-08-04T09:14+09:00
repository: alsdmlals4-eng/GRIMOIRE-
branch: agent/foundation-poc-readiness-review
pull_request: 57
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter_before: 4_of_10
grill_counter_after: 5_of_10
pending_approved_decisions: 5
merge_trigger: NONE
merge_authorized: false
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## User-approved decision

```text
3×3 회로판에 메인 글자·보조 글자·대상 키워드 노드를 배치
→ 노드를 방향성 있게 연결
→ 글자·대상·배치·연결 구조 전체가 주문

Stock
→ 특정 글자 하나의 직접 그리기를 대체

전투 중 그리기
→ [집중 필사]
→ 시간이 느려지지만 멈추지 않음
→ 실제 시간 기준 마나 소모
→ 성공 시 같은 글자 Stock +1
```

## Canonical changes

### New approval and design

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`

### Updated circuit and Stock authorities

- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`

### Updated project pointers

- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- `AGENTS.md`
- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`

## Explicit supersession

```yaml
completed_spell_stock:
  previous: ALLOWED
  current: PROHIBITED
  reason: BYPASSES_3X3_CIRCUIT_TARGET_AND_TOPOLOGY_DECISIONS

stock_scope:
  previous: COMPLETED_SPELL_AND_SUB_GLYPH
  current: TYPED_GLYPH_ONLY

charge_formula:
  previous: 10_PLUS_5_TIMES_N_MINUS_1_FOR_COMPLETED_SPELL
  current: ONE_TYPED_GLYPH_EQUALS_10_ACTIVE_PRESSURE_SECONDS_TEST_VALUE

direct_drawing:
  previous: PARALLEL_OR_PRIMARY_CIRCUIT_INPUT
  current: OPTIONAL_TYPED_STOCK_REPLENISHMENT
```

## Prototype values

```yaml
shared_stock_capacity: 8_TEST_VALUE
one_glyph_natural_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
focus_active_pressure_scale: 0.25_TEST_VALUE
focus_mana_drain_per_real_second: 1_TEST_VALUE
successful_scribe_stock_gain: 1
```

These are not commercial final balance values.

## Protected boundaries

```text
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
MULTIPLE_MAIN_GLYPHS_IN_SLICE = PROHIBITED
CROSSING_EDGES_IN_SLICE = PROHIBITED
TARGET_NODE_STOCK_COST = PROHIBITED
CONNECTION_EDGE_STOCK_COST = PROHIBITED
GENERIC_STOCK_FROM_DIFFERENT_GLYPH = PROHIBITED
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
PASSIVE_CHARGE_REAL_TIME_ACCELERATION_DURING_FOCUS = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
AUTO_OPTIMAL_TARGET_OR_CIRCUIT = PROHIBITED
```

## Adversarial review result

1. 완성 주문 Stock은 3×3 조합을 우회하므로 폐기했다.
2. 필사 중 자연충전과 소환수 주기를 Active Pressure 기준으로 유지해 시간 감속 악용을 차단했다.
3. Stock을 글자별로 분리해 쉬운 글자 반복 필사로 어려운 글자를 충전하는 악용을 차단했다.
4. 직접 필사에 위력 보너스를 주지 않아 접근성 입력이 하위 선택이 되지 않게 했다.
5. 직접 피해로 HP가 감소하면 미완성 필사를 폐기해 전투 위험을 유지했다.

## Next work

```text
3×3 회로판 Mobile Landscape Wireframe
→ 집중 필사 오버레이·시간·마나 UX
→ 서리꽃 온실 UX Map에 적용
→ Art Direction·Asset Brief
→ 승인 범위 Codex handoff
```

PR #57 remains Draft. No merge was performed.
