# GM-SUMMON-SYSTEM-01 — 소환 주문·상주 소환수·정수 스탯 상세 계약

## 1. 승인 상태

```yaml
decision_id: GM-SUMMON-SYSTEM-01
status: USER_APPROVED_REVISED_DEFAULTS
approved_by: USER_DIRECTED_SECONDARY_CAP_THREE_AND_RECOMMENDED_GUARDS
approved_at: 2026-08-03T00:04:00+09:00
approved_option: C_PERSISTENT_MAIN_PLUS_THREE_ROLE_UNIQUE_INTEGER_SUPPORT
benchmark_id: GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01
grill_me_batch: 2_of_10_reapproval_no_increment
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

이 문서는 다음 과거 초안을 폐기한다.

- PR #51 초기 퍼센트 출력·30초 지속·20초 Cooldown 계약.
- 보조 소환수 동시 활성 상한 `1체` 계약.

## 2. 핵심 역할

> 소환수는 `[소환 주문]`으로 전개하고, 시간 제한 없이 유지하면서 `[스톡]·[방어도]·[공격]·[치유]` 정수 수치로 플레이어의 주문 준비와 상황 해결을 지원한다.

- 메인 소환수는 상시 적용한다.
- 보조 소환수는 `[소환 주문]`을 사용해야 적용된다.
- 지속시간 대신 최대 활성 수와 역할 편성으로 통제한다.
- 소환수는 고정 역할과 고정 대상 규칙을 사용하며 자동 최적 해법을 선택하지 않는다.

## 3. 활성 구조

```text
메인 소환수 1체
= 항상 활성
= 보조 소환 슬롯을 사용하지 않음

보조 소환수
= [소환 주문] Commit 후 활성
= S1 / S2 / S3
= 최대 3체
```

Prototype·Slice 상한:

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slot_ids:
  - S1
  - S2
  - S3
summon_duration_limit: NONE
resummon_cooldown: NONE
```

소환 상태 종료 조건:

- 플레이어 수동 귀환.
- 세 슬롯이 가득 찬 상태에서 다른 소환수를 불러 지정 슬롯 교체.
- 패배·봉인·스토리 강제 귀환.
- 소환 불가 구역 진입.

일반 장면 전환과 Save/Resume만으로는 자동 해제하지 않는다. 시간 압박이 없는 학교·메뉴 장면에서는 소환 상태는 유지하지만 주기 행동 Clock은 진행하지 않는다.

## 4. 보조 역할 편성

보조 소환수 역할은 다음 네 가지다.

```yaml
secondary_roles:
  - PRODUCTION
  - GUARDIAN
  - ASSAULT
  - RECOVERY
secondary_role_duplicate_cap_in_slice: 1
```

- 보조 3칸에는 네 역할 중 최대 세 역할을 선택한다.
- Slice·Prototype에서는 보조 사이 같은 역할 중복을 금지한다.
- 메인 동반 정령의 `[스톡] 1`은 보조 역할 중복 판정에서 제외한다.
- 혼합형 소환수는 하나의 `primary_role`을 반드시 가진다.
- 동일 역할 복수 편성은 Slice 사람 검증 이후 별도 재승인 항목이다.

이 가드레일은 보조 3체 허용이 생산·방어·공격·치유 한 역할 몰아넣기로 변질되는 것을 막는다.

## 5. `[소환 주문]`

```text
소환수 선택
→ 소환 글자·Seal 작성 또는 준비된 완성 소환 주문 Stock 선택
→ 역할·대상·비용·배치 슬롯 확인
→ [소환] Commit
→ 마나 소비
→ 지정 슬롯 활성
```

Prototype 기본값:

```yaml
summon_spell_mana_cost: 2
replacement_requires_new_summon_commit: true
manual_recall_refund: 0
free_replacement: false
```

- 소환 비용은 최대 마나 비율이 아니라 고정 `마나 2`다.
- 마나 부족·문법 실패·취소는 비용과 Stock을 소비하지 않는다.
- 빈 슬롯이 있으면 `S1 → S2 → S3` 순서로 기본 제안하되 플레이어가 선택할 수 있다.
- 세 슬롯이 가득 차면 교체할 기존 보조 슬롯을 먼저 명시한다.
- 교체에도 새 `[소환 주문]` Commit과 마나 `2`가 필요하다.
- 무료 교체와 자동 소환 연쇄를 금지한다.

## 6. 공통 행동 주기

공격·치유·Stock 지원은 `Active Pressure Clock`의 주기 Event로 실행한다.

```yaml
prototype_support_cycle_seconds: 5
independent_cycle_per_summon: true
```

Clock 진행:

- 플레이어가 상황을 관찰·작성·조합하며 조작할 수 있는 Active Pressure 상태.

Clock 정지:

- 플레이어 주문·소환수 행동·적 공격 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·App Background.
- Save/Load·Recognition Blocking·Loading.

다중 Event 규칙:

- 소환수별 남은 주기를 독립 저장한다.
- 같은 시각에 여러 보조 Event가 도달하면 `S1 → S2 → S3` 순서로 처리한다.
- 메인 소환수 Event는 보조 슬롯 Event보다 먼저 처리한다.
- 각 Event 해결 중 Active Pressure Clock은 정지한다.
- Offline catch-up과 복귀 순간 누적 실행은 없다.

## 7. 정수 스탯 모델

모든 소환수 지원은 퍼센트가 아닌 정수로 표시·계산한다.

### `[스톡] N`

```text
지원 주기 도달
→ 현재 지정 Stock 남은 자연충전시간
→ N초 감소
```

- Stock을 직접 생성하지 않는다.
- 감소량 초과분은 다음 충전으로 이월하지 않는다.
- 충전 대상이 없거나 최대 수량이면 누적하지 않는다.
- 대상 변경은 플레이어만 수행한다.

### `[방어도] N`

```text
총 방어도
= 활성 소환수 defense_stat 합계

최종 직접 피해
= max(1, 원래 직접 피해 - 총 방어도)
```

- 지속 피해·마나 비용·스토리 고정 피해에는 기본 적용하지 않는다.
- 방어도는 적 공격 Timer를 정지하지 않는다.
- 피해가 1 미만으로 내려가 상시 무적이 되지 않게 한다.

### `[공격] N`

지원 주기마다 고정 공격 주문이 `N`의 정수 효과를 적용한다.

- 일반 적에게는 HP 피해 대신 `불안정도 N 감소`로 해석한다.
- 소환 전 대상 규칙과 공격 태그를 표시한다.
- 상황 태그와 맞지 않으면 효과가 감소하거나 0이 될 수 있으며 원인을 표시한다.
- 자동 공격은 불안정도를 `1` 아래로 낮출 수 없다.
- 자동 공격은 전투·Situation의 마지막 해결 Event가 될 수 없다.

### `[치유] N`

```text
실제 회복량
= min(N, 최대 HP - 현재 HP)
```

- 초과 회복은 저장하지 않는다.
- HP가 가득 차면 해당 주기 효과는 소멸한다.
- 패배 상태를 자동 복구하지 않는다.

## 8. Slice 기본 소환수

| 소환수 | 슬롯 | 역할 | 주기 | 정수 스탯 |
|---|---|---|---:|---:|
| 메인 동반 정령 | MAIN | 별도 상시 | 5초 | `[스톡] 1` |
| 생산형 보조 | S1~S3 | PRODUCTION | 5초 | `[스톡] 2` |
| 수호형 보조 | S1~S3 | GUARDIAN | 상시 | `[방어도] 2` |
| 공격형 보조 | S1~S3 | ASSAULT | 5초 | `[공격] 2` |
| 치유형 보조 | S1~S3 | RECOVERY | 5초 | `[치유] 2` |

Slice는 보조 역할 네 가지를 모두 소개할 수 있지만 동시 편성은 세 역할까지만 허용한다. 실제 Art·FX를 가진 보조 모델도 최대 3체만 동시에 표시한다.

## 9. 중첩·상한

```yaml
slice_active_stock_stat_cap: 3
slice_active_defense_stat_cap: 2
slice_active_attack_stat_cap: 2
slice_active_heal_stat_cap: 2
secondary_role_duplicate_cap: 1
```

- 메인 `[스톡] 1`과 생산형 `[스톡] 2`는 합산해 최대 `[스톡] 3`이다.
- 보조 역할 중복 금지로 수호·공격·치유 수치는 현재 각 1체 값까지만 활성화된다.
- 성장으로 개별 정수 스탯이 증가할 경우 상한은 `BATTLE-TUNING-01`에서 재검증한다.
- 역할 중복·추가 슬롯·혼합형 합산은 별도 재승인 없이는 허용하지 않는다.

## 10. Mobile HUD

기본 표시:

```text
메인 소환수 배지
+ 보조 S1 / S2 / S3 압축 Rail
+ 선택 슬롯 상세 Panel
```

각 압축 슬롯:

- 역할 아이콘과 소환수 식별자.
- 대표 정수 스탯.
- 다음 행동까지 남은 초.
- 정상·봉인·무효 상태.

선택 슬롯 상세:

- 고정 대상 규칙.
- 적용 전·후 예상값.
- 마지막 Event 출처.
- 귀환·교체 조작.

세 보조 소환수의 모든 상세 문구를 동시에 상시 노출하지 않는다.

## 11. Save·Resume 상태

필수 저장 필드:

- 메인 소환수 ID·성장 상태.
- `secondary_summon_states` 배열, 최대 3개.
- 각 보조의 슬롯 `S1/S2/S3`, 역할, 활성 상태.
- 각 소환수 `[스톡]·[방어도]·[공격]·[치유]` 값.
- 각 소환수 다음 행동까지 남은 Active Pressure 시간.
- 고정 대상 규칙과 장착 주문 ID.
- 소환 주문 Transaction ID.
- 이미 적용한 `summon_event_id`.
- 강제 귀환·봉인 상태.

복귀 규칙:

- 세 슬롯과 남은 행동 주기를 정확히 복원한다.
- Background 경과시간으로 공격·치유·Stock 보조를 적용하지 않는다.
- 이미 처리한 Event를 재적용하지 않는다.

## 12. Result·Grimoire 기록

자동 행동마다 다음을 기록한다.

- 소환수 ID와 슬롯.
- 역할·스탯 종류·수치.
- 대상.
- 적용 전·후 값.
- 실패·무효 원인.
- `summon_event_id`와 상위 Transaction ID.

같은 시각 다중 Event도 슬롯별 결과를 분리해 기록한다. 플레이어 주문과 소환수 기여를 결과 화면에서 구분한다.

## 13. 이전 계약 대체

이 Decision은 다음을 명시적으로 대체한다.

- `GM-BATTLE-RULES-01` 수호 소환수의 수동 단발·자동 행동 금지.
- PR #51 초기안의 `30초 지속 / 20초 Cooldown`.
- 최대 마나 `20%` 소환 비용.
- 자동 주문 출력·기여 퍼센트.
- 퍼센트 피해 완화.
- 메인 20초 직접 Token 생성.
- 보조 동시 활성 상한 `1체`.

유지하는 경계:

- 적 공격 Timer를 정지하지 않는다.
- 자동 최적 주문·대상 AI를 사용하지 않는다.
- 자동 소환 연쇄를 금지한다.
- 마지막 Situation 해결은 플레이어가 담당한다.
- Offline 자동 행동은 없다.

## 14. 검증 기준

자동화·합성 Test:

- 보조 슬롯 초과 0건.
- 보조 역할 중복 0건.
- 소환 교체 Transaction 중간 실패 시 전체 롤백.
- 같은 시각 Event 순서 변동 0건.
- 중복 `summon_event_id` 0건.
- Pause·Background·Save/Resume 중 주기 진행 0건.
- `[스톡]` 감소 초과분 이월 0건.
- 방어도 적용 후 최소 직접 피해 1 위반 0건.
- 공격으로 불안정도 0 도달 0건.
- 치유 초과 저장 0건.

사람 검증:

- 네 역할 중 세 역할을 고르는 선택이 의미 있는가.
- 보조 3체가 플레이어 직접 작성보다 우세하지 않은가.
- 세 개의 다음 5초 결과를 Mobile HUD에서 예측할 수 있는가.
- 세 소환수 결과의 출처를 구분할 수 있는가.
- 메인 상시 효과가 생산형 보조 선택을 자동 정답으로 만들지 않는가.

## 15. 후행 튜닝

Prototype 범위에서 조정 가능:

- 공통 주기 `4~7초`.
- 소환 주문 비용 `마나 1~4`.
- 개별 정수 스탯 `1~4`.
- 보조 3슬롯의 해금 시점.

별도 재승인이 필요한 변경:

- 보조 활성 4체 이상.
- 보조 같은 역할 중복.
- 시간 제한 재도입.
- Offline 행동.
- 자동 공격의 최종 해결 허용.
- 동적 최적 대상·주문 AI.

## 16. 검증 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
PROTOTYPE_DEFAULTS_ARE_FINAL_BALANCE = false
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```