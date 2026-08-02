# GM-STOCK-SUMMON-STATE-INTERFACE-01 — Stock·소환수 State/Ledger/Save 계약

## 1. 승인 상태

```yaml
decision_id: GM-STOCK-SUMMON-STATE-INTERFACE-01
status: USER_DELEGATED_RECOMMENDED_OPTION
approved_at: 2026-08-02T23:14:00+09:00
approved_option: A_SINGLE_ACTIVE_PRESSURE_CLOCK_WITH_ATOMIC_EVENT_LEDGER
grill_me_batch: 3_of_10
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

사용자의 `좋아 진행해`와 정수 스탯·무기한 소환 지시에 따라 다음 구현 중립 인터페이스를 승인 기본안으로 사용한다.

## 2. 소유권 분리

| 책임 | 단일 소유자 |
|---|---|
| 준비 Stock 편성·용량 | `StockLoadoutState` |
| 대상별 충전 진행도 | `StockChargeState` |
| 현재 충전 대상 | `StockChargeState` |
| 메인·추가 소환 상태 | `SummonRosterState` |
| 소환수 행동 주기 | `SummonActionState` |
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

```yaml
summon_id: string
is_main: boolean
slot_index: integer
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

Prototype:

- 메인 슬롯은 항상 활성.
- 추가 슬롯은 `1개`.
- 공통 행동 주기 `5000ms`.
- 지속시간·만료시간·Cooldown 필드는 두지 않는다.

## 5. 파생 전투 수치

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

퍼센트 계수 필드를 두지 않는다.

## 6. 원자 Transaction

### `[소환 주문]`

한 Transaction에서 처리:

1. 주문 문법·대상·마나 검증.
2. 고정 `마나 2` 차감.
3. 슬롯이 가득 찼으면 명시한 기존 보조 귀환.
4. 새 보조 활성.
5. 행동 주기 `5000ms` 초기화.
6. Result Ledger 기록.

중간 단계 실패 시 모두 롤백한다.

### Stock 사용

한 Transaction에서 처리:

1. 보유량 확인.
2. 대상·상황 검증.
3. Stock 1회분 차감.
4. 주문·글자 효과 적용.
5. Result Ledger 기록.

효과 적용 실패 시 Stock 차감도 롤백한다.

### 소환수 주기 Event

각 주기마다 고유 `summon_event_id`를 생성한다.

- 동일 ID는 정확히 한 번만 적용한다.
- Save 직전 적용된 Event는 복귀 후 재실행하지 않는다.
- Background 경과시간으로 Event를 생성하지 않는다.

## 7. 동일 시각 Event 순서

```text
1. 강제 귀환·봉인 상태 반영
2. 활성 소환수 방어도 합계 확정
3. 적·환경 직접 피해 적용
4. 직접 피해에 따른 Stock 충전 정지 판정
5. 소환수 [치유]
6. 자연충전 시간 진행
7. 소환수 [스톡] 시간 감소
8. Stock 완성 Event
9. 소환수 [공격]
10. Result·Grimoire Ledger 기록
```

플레이어 주문 Commit과 System Resolve 중에는 Active Pressure Clock이 정지하므로 주기 Event와 동시에 진행하지 않는다.

## 8. Save Snapshot

필수 필드:

```yaml
snapshot_version: integer
active_pressure_clock_ms: integer
stock_loadout: array
stock_charge_state: object
main_summon_state: object
secondary_summon_state: object | null
player_hp: integer
player_mana: integer
situation_instability: integer
applied_transaction_ids: array
applied_summon_event_ids: array
applied_stock_charge_event_ids: array
```

복귀 규칙:

- Snapshot 시점의 남은 충전시간·주기시간에서 재개한다.
- 소환 상태는 유지한다.
- Offline·Background 경과시간을 반영하지 않는다.
- 복귀 순간 공격·치유·Stock 완성을 몰아서 실행하지 않는다.

## 9. HUD가 읽는 View Model

```yaml
stock_capacity_text: string
active_stock_name: string
stock_current_count: integer
stock_max_count: integer
stock_remaining_seconds: integer
active_stock_support_total: integer
main_summon_status: string
secondary_summon_status: string | null
next_summon_action_seconds: integer | null
defense_total: integer
attack_stat: integer
heal_stat: integer
summon_target_rule_text: string
```

HUD는 State를 수정하지 않고 읽기 전용 View Model만 사용한다.

## 10. 실패 처리

- 손상된 소환수 ID: 안전 귀환 후 메인만 유지, Save 오류 기록.
- 손상된 Stock 대상: 충전 대상 해제, 대상별 진행도는 보존 가능한 항목만 유지.
- 음수 남은 시간: 0으로 보정 후 Event 중복 ID 검사.
- 중복 Transaction ID: 재적용하지 않고 기존 결과를 반환.
- 준비 용량 초과 Save: 해당 Save를 자동 덮어쓰지 않고 복구 UI로 이동.

## 11. 필수 Test

1. 소환 교체 Transaction 중간 실패 롤백.
2. Stock 사용과 효과 적용 원자성.
3. Pause·Background 중 Clock 0 진행.
4. Save 직전·직후 동일 `summon_event_id` 중복 0.
5. `[스톡]` 감소 초과분 다음 충전 이월 0.
6. 방어도 계산 후 최소 직접 피해 1 유지.
7. 공격으로 불안정도 0 도달 0.
8. 치유 초과 저장 0.
9. 장면 전환·Save/Resume 후 추가 소환 상태 유지.
10. 슬롯 상한 초과 0.

## 12. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
THIS_DECISION_AUTHORIZES_RUNTIME = false
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```
