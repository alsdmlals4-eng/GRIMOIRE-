# GM-STOCK-SUMMON-STATE-INTERFACE-01 — Stock·소환수 State/Ledger/Save 계약

## 1. 승인 상태

```yaml
decision_id: GM-STOCK-SUMMON-STATE-INTERFACE-01
status: USER_DELEGATED_RECOMMENDED_OPTION_REVISED_FOR_THREE_SECONDARIES
approved_at: 2026-08-03T00:04:00+09:00
approved_option: A_SINGLE_ACTIVE_PRESSURE_CLOCK_WITH_ATOMIC_EVENT_LEDGER
grill_me_batch: 3_of_10_reapproval_no_increment
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

사용자의 보조 소환수 최대 3체 결정에 따라 기존 단일 `secondary_summon_state`를 `S1/S2/S3` 배열 계약으로 확장한다.

## 2. 소유권 분리

| 책임 | 단일 소유자 |
|---|---|
| 준비 Stock 편성·용량 | `StockLoadoutState` |
| 대상별 충전 진행도 | `StockChargeState` |
| 현재 충전 대상 | `StockChargeState` |
| 메인·보조 소환 상태 | `SummonRosterState` |
| 소환수별 행동 주기 | `SummonActionState` |
| HP·마나·방어도 | `PlayerCombatState` |
| 적 불안정도·공격 | `SituationCombatState` |
| 원자 결과·중복 방지 | `ResultLedger` |
| Pause·Resume 저장 | `SessionSnapshot` |

한 상태를 둘 이상의 시스템이 직접 수정하지 않는다.

## 3. Stock 데이터

### 준비 항목

```yaml
stock_entry_id: string
stock_type: FULL_SPELL | SUB_GLYPH
blueprint_or_glyph_id: string
functional_glyph_count: integer
capacity_cost: integer
prepared_max_count: integer
current_count: integer
base_charge_seconds: integer
```

### 충전 상태

```yaml
active_stock_target_id: string | null
remaining_charge_ms: integer
progress_by_stock_target: map<string, integer>
charge_pause_remaining_ms: integer
minimum_charge_ms: 3000
last_completed_charge_event_id: string | null
```

- `base_charge_seconds = 10 + 5 × (functional_glyph_count - 1)`.
- 지정 대상이 없으면 자연충전과 `[스톡]` 지원을 적용하지 않는다.
- 완료 초과 감소량은 다음 충전으로 이월하지 않는다.

## 4. 소환수 데이터

### 단일 소환수 상태

```yaml
summon_id: string
is_main: boolean
slot_id: MAIN | S1 | S2 | S3
primary_role: MAIN | PRODUCTION | GUARDIAN | ASSAULT | RECOVERY
is_active: boolean
summon_spell_transaction_id: string | null
action_cycle_ms: integer
remaining_action_cycle_ms: integer
stock_stat: integer
defense_stat: integer
attack_stat: integer
heal_stat: integer
target_rule_id: string
fixed_spell_id: string | null
forced_recall_reason: string | null
last_applied_summon_event_id: string | null
```

### Roster 상태

```yaml
main_summon_state: object
secondary_summon_states: array<object>
secondary_slot_cap: 3
secondary_role_duplicate_cap: 1
```

Prototype:

- 메인 슬롯은 항상 활성.
- 보조 슬롯은 `S1/S2/S3`, 최대 3개다.
- 보조 네 역할 중 같은 역할은 한 번만 활성화한다.
- 메인의 `MAIN` 역할과 `[스톡] 1`은 보조 역할 중복 검사에서 제외한다.
- 공통 행동 주기는 `5000ms`다.
- 지속시간·만료시간·Cooldown 필드는 두지 않는다.

## 5. Roster 불변식

```text
활성 보조 수 <= 3
각 slot_id는 유일
각 보조 primary_role은 유일
MAIN은 정확히 1개
```

실패 처리:

- 중복 슬롯: Snapshot을 자동 덮어쓰지 않고 복구 UI로 이동.
- 중복 보조 역할: 가장 최근 Transaction을 롤백하고 기존 상태 유지.
- 알 수 없는 역할: 안전 귀환 처리.
- 보조 4개 이상: 초과 항목을 임의 삭제하지 않고 Save 오류로 처리.

## 6. 파생 전투 수치

```text
총 방어도
= 모든 활성 소환수 defense_stat 합계
```

```text
최종 직접 피해
= max(1, 원래 직접 피해 - 총 방어도)
```

```text
소환 공격 효과
= attack_stat만큼 유효 대상 불안정도 감소
= 결과 하한 1
```

```text
소환 치유 효과
= min(heal_stat, 최대 HP - 현재 HP)
```

```text
소환 Stock 지원
= 현재 남은 충전시간 - stock_stat초
```

Prototype 상한:

```yaml
active_stock_stat_cap: 3
active_defense_stat_cap: 2
active_attack_stat_cap: 2
active_heal_stat_cap: 2
```

퍼센트 계수 필드를 두지 않는다.

## 7. 원자 Transaction

### `[소환 주문]`

한 Transaction에서 처리:

1. 주문 문법·대상·마나 검증.
2. 요청 역할이 기존 보조 역할과 중복되지 않는지 검증.
3. 배치 슬롯 또는 교체 슬롯 검증.
4. 고정 `마나 2` 차감.
5. 교체라면 지정 기존 보조 귀환.
6. 새 보조 활성.
7. 행동 주기 `5000ms` 초기화.
8. Result Ledger 기록.

중간 단계 실패 시 모두 롤백한다.

### 보조 귀환

한 Transaction에서 처리:

1. 슬롯과 소환수 ID 일치 검증.
2. 보조 비활성화.
3. 해당 슬롯 행동 주기 제거.
4. 파생 스탯 재계산.
5. Result Ledger 기록.

수동 귀환의 마나 환불은 없다.

### Stock 사용

한 Transaction에서 처리:

1. 보유량 확인.
2. 대상·상황 검증.
3. Stock 1회분 차감.
4. 주문·글자 효과 적용.
5. Result Ledger 기록.

효과 적용 실패 시 Stock 차감도 롤백한다.

## 8. 소환수 주기 Event

각 소환수 주기마다 고유 `summon_event_id`를 생성한다.

```yaml
event_id: string
summon_id: string
slot_id: MAIN | S1 | S2 | S3
role: string
due_active_pressure_ms: integer
transaction_parent_id: string | null
```

- 동일 ID는 정확히 한 번만 적용한다.
- Save 직전 적용된 Event는 복귀 후 재실행하지 않는다.
- Background 경과시간으로 Event를 생성하지 않는다.
- 비활성화된 슬롯의 예약 Event는 취소 Ledger를 남긴다.

## 9. 동일 시각 Event 순서

```text
1. 강제 귀환·봉인 상태 반영
2. 활성 소환수 방어도 합계 확정
3. 적·환경 직접 피해 적용
4. 직접 피해에 따른 Stock 충전 정지 판정
5. 메인 소환수 Event
6. 보조 S1 Event
7. 보조 S2 Event
8. 보조 S3 Event
9. 자연충전 시간 진행
10. Stock 완성 Event
11. Result·Grimoire Ledger 기록
```

각 슬롯 Event 내부는 `치유 → [스톡] → 공격` 순서로 처리한다. 해당 스탯이 0이면 단계를 건너뛴다.

플레이어 주문 Commit과 System Resolve 중에는 Active Pressure Clock이 정지하므로 주기 Event와 동시에 진행하지 않는다.

## 10. Save Snapshot

필수 필드:

```yaml
snapshot_version: integer
active_pressure_clock_ms: integer
stock_loadout: array
stock_charge_state: object
main_summon_state: object
secondary_summon_states: array
player_hp: integer
player_mana: integer
situation_instability: integer
applied_transaction_ids: array
applied_summon_event_ids: array
applied_stock_charge_event_ids: array
```

복귀 규칙:

- Snapshot 시점의 남은 충전시간·각 소환수 주기시간에서 재개한다.
- 메인과 S1/S2/S3 소환 상태를 유지한다.
- 슬롯·역할 유일성 검증 후 HUD View Model을 만든다.
- Offline·Background 경과시간을 반영하지 않는다.
- 복귀 순간 공격·치유·Stock 완성을 몰아서 실행하지 않는다.

## 11. HUD가 읽는 View Model

```yaml
stock_capacity_text: string
active_stock_name: string
stock_current_count: integer
stock_max_count: integer
stock_remaining_seconds: integer
active_stock_support_total: integer
main_summon_summary: object
secondary_summon_summaries: array<object>
selected_secondary_slot_detail: object | null
defense_total: integer
summon_target_rule_text: string
```

보조 요약 View Model:

```yaml
slot_id: S1 | S2 | S3
summon_name: string
role: string
primary_stat_label: string
primary_stat_value: integer
next_action_seconds: integer | null
state_label: string
```

HUD는 State를 수정하지 않고 읽기 전용 View Model만 사용한다.

## 12. 실패 처리

- 손상된 소환수 ID: 해당 보조 안전 귀환, 메인은 유지, Save 오류 기록.
- 손상된 Stock 대상: 충전 대상 해제, 보존 가능한 대상별 진행도 유지.
- 음수 남은 시간: 0으로 보정 후 Event 중복 ID 검사.
- 중복 Transaction ID: 재적용하지 않고 기존 결과 반환.
- 준비 용량 초과 Save: 자동 덮어쓰지 않고 복구 UI로 이동.
- 슬롯·역할 중복 Save: 자동 수정하지 않고 복구 후보와 충돌 원인을 표시.

## 13. 필수 Test

1. S1/S2/S3 각각 소환·귀환·교체 Transaction.
2. 네 번째 보조 활성 시도 차단.
3. 같은 보조 역할 두 번째 활성 시도 롤백.
4. 교체 Transaction 중간 실패 시 마나·기존 소환 상태 복구.
5. Stock 사용과 효과 적용 원자성.
6. Pause·Background 중 Clock 0 진행.
7. 같은 시각 MAIN/S1/S2/S3 Event 순서 결정성.
8. Save 직전·직후 동일 `summon_event_id` 중복 0.
9. `[스톡]` 감소 초과분 다음 충전 이월 0.
10. 방어도 계산 후 최소 직접 피해 1 유지.
11. 공격으로 불안정도 0 도달 0.
12. 치유 초과 저장 0.
13. 장면 전환·Save/Resume 후 보조 3체 상태 유지.
14. 손상 Snapshot 자동 덮어쓰기 0.

## 14. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
THIS_DECISION_AUTHORIZES_RUNTIME = false
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```