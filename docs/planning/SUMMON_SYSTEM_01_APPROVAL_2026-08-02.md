# GM-SUMMON-SYSTEM-01 — 소환 주문·상주 소환수·정수 스탯 상세 계약

## 1. 승인 상태

```yaml
decision_id: GM-SUMMON-SYSTEM-01
status: USER_APPROVED_REVISED_DEFAULTS
approved_by: USER_DIRECTED_INTEGER_STAT_AND_PERSISTENCE_REVISION
approved_at: 2026-08-02T23:14:00+09:00
approved_option: B_PERSISTENT_MAIN_PLUS_ONE_SUMMONED_INTEGER_STAT_SUPPORT
benchmark_id: GR-BM-STOCK-SUMMON-01
grill_me_batch: 2_of_10_reapproval_no_increment
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

이 문서는 PR #51 초안의 퍼센트 출력·30초 지속·20초 Cooldown 계약을 폐기한다.

## 2. 핵심 역할

> 소환수는 `[소환 주문]`으로 전개하고, 시간 제한 없이 유지하면서 `[스톡]·[방어도]·[공격]·[치유]` 정수 수치로 플레이어의 전투·주문 준비를 지원한다.

- 메인 소환수는 상시 적용한다.
- 다른 소환수는 `[소환 주문]`을 사용해야 적용된다.
- 지속시간 대신 최대 활성 수만 제한한다.
- 소환수는 고정 역할과 고정 대상 규칙을 사용하며 자동 최적 해법을 선택하지 않는다.

## 3. 활성 구조

```text
메인 소환수 1체
= 항상 활성
= 추가 소환 슬롯을 사용하지 않음

기타 소환수
= [소환 주문] Commit 후 활성
= Slice 추가 활성 상한 1체
```

Prototype 상한:

```yaml
persistent_main_summon: 1
additional_active_summon_cap: 1
total_active_summons: 2
summon_duration_limit: NONE
resummon_cooldown: NONE
```

소환 상태 종료 조건:

- 플레이어 수동 귀환.
- 최대 수에서 다른 소환수를 불러 교체.
- 패배·봉인·스토리 강제 귀환.
- 소환 불가 구역 진입.

일반 장면 전환과 Save/Resume만으로는 자동 해제하지 않는다. 시간 압박이 없는 학교·메뉴 장면에서는 소환 상태는 유지하지만 주기 행동 Clock은 진행하지 않는다.

## 4. `[소환 주문]`

```text
소환수 선택
→ 소환 글자·Seal 작성 또는 준비된 소환 주문 Stock 선택
→ 고정 역할·대상·소환 비용 확인
→ [소환] Commit
→ 마나 소비
→ 활성 슬롯 배치
```

Prototype 기본값:

```yaml
summon_spell_mana_cost: 2
first_summon_in_focus_task: DIRECT_WRITING_OR_PREPARED_FULL_SPELL_STOCK
replacement_requires_new_summon_commit: true
manual_recall_refund: 0
```

- 소환 비용은 최대 마나 비율이 아니라 고정 `마나 2`다.
- 마나 부족·문법 실패·취소는 비용과 Stock을 소비하지 않는다.
- 추가 슬롯이 가득 찬 상태에서 새 소환을 Commit하면 교체할 기존 보조 소환수를 먼저 명시한다.
- 무료 교체와 자동 소환 연쇄를 금지한다.

## 5. 공통 행동 주기

공격·치유·Stock 지원은 `Active Pressure Clock`의 주기 Event로 실행한다.

```yaml
prototype_support_cycle_seconds: 5
```

Clock 진행:

- 플레이어가 상황을 관찰·작성·조합하며 조작할 수 있는 Active Pressure 상태.

Clock 정지:

- 플레이어 주문·소환수 행동·적 공격 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·App Background.
- Save/Load·Recognition Blocking·Loading.

- Offline catch-up은 없다.
- 복귀 순간에 누적 행동을 몰아서 실행하지 않는다.
- 소환수별 주기 잔여시간은 Save에 기록한다.

## 6. 정수 스탯 모델

모든 소환수 지원은 퍼센트가 아닌 정수로 표시·계산한다.

### `[스톡] N`

```text
지원 주기 도달
→ 현재 지정 Stock 남은 자연충전시간
→ N초 감소
```

- 직접 Stock을 생성하지 않는다.
- 감소량 초과분은 다음 충전으로 이월하지 않는다.
- 충전 대상이 없거나 최대 수량이면 누적하지 않는다.
- 대상 변경은 플레이어만 수행한다.

### `[방어도] N`

활성 중 플레이어의 총 방어도에 `N`을 더한다.

```text
최종 직접 피해
= max(1, 원래 직접 피해 - 총 방어도)
```

- 지속 피해·마나 비용·스토리 고정 피해에는 기본 적용하지 않는다.
- 동일한 방어도는 합산한다.
- 방어도는 적 공격 Timer를 정지하지 않는다.
- 피해가 1 미만으로 내려가 상시 무적이 되지 않게 한다.

### `[공격] N`

지원 주기마다 소환수의 고정 공격 주문이 `N`의 정수 효과를 적용한다.

- 일반 적에게는 HP 피해 대신 `불안정도 N 감소`로 해석한다.
- 소환 전 대상 규칙과 공격 태그를 표시한다.
- 상황 태그와 맞지 않으면 효과가 감소하거나 0이 될 수 있으며 원인을 표시한다.
- 자동 공격은 불안정도를 `1` 아래로 낮출 수 없다.
- 자동 공격은 전투·Situation의 마지막 해결 Event가 될 수 없다.

### `[치유] N`

지원 주기마다 플레이어 HP를 `N` 회복한다.

```text
실제 회복량
= min(N, 최대 HP - 현재 HP)
```

- 초과 회복은 저장하지 않는다.
- HP가 가득 차면 해당 주기 효과는 소멸한다.
- 패배 상태를 자동 복구하지 않는다.

## 7. Slice 기본 소환수

| 소환수 | 활성 | 주기 | 정수 스탯 | 역할 |
|---|---|---:|---:|---|
| 메인 동반 정령 | 상시 | 5초 | `[스톡] 1` | 지정 Stock 자연충전 보조·위험 감지 |
| 생산형 보조 | `[소환]` | 5초 | `[스톡] 2` | 준비 주문 순환 가속 |
| 수호형 보조 | `[소환]` | 상시 효과 | `[방어도] 2` | 직접 피해 정수 경감 |
| 공격형 보조 | `[소환]` | 5초 | `[공격] 2` | 유효 태그 대상 불안정도 보조 감소 |
| 치유형 보조 | `[소환]` | 5초 | `[치유] 2` | 플레이어 HP 회복 |

Slice 실제 플레이에서는 메인 1체와 보조 대표 1체만 사용한다. 나머지 유형은 동일 수치 모델의 Preview 또는 합성 Test 데이터로 검증할 수 있다.

## 8. 중첩·상한

```yaml
slice_active_stock_stat_cap: 3
slice_active_defense_cap: 4
slice_active_attack_cap: 3
slice_active_heal_cap: 3
```

- 메인 `[스톡] 1`과 생산형 `[스톡] 2`는 합산해 최대 `[스톡] 3`이다.
- Slice 추가 소환수 상한이 1체이므로 공격·치유·방어 역할은 동시에 모두 활성화할 수 없다.
- 향후 소환 슬롯 증가 시 동일 스탯 합산 상한을 별도 재승인한다.
- 같은 시각의 Event 순서는 `방어도 상태 확정 → 치유 → Stock 시간 감소 → 공격`으로 고정한다.

## 9. Save·Resume 상태

필수 저장 필드:

- 메인 소환수 ID·성장 상태.
- 활성 추가 소환수 ID와 슬롯.
- 각 소환수 `[스톡]·[방어도]·[공격]·[치유]` 값.
- 다음 행동까지 남은 Active Pressure 시간.
- 고정 대상 규칙과 장착 주문 ID.
- 소환 주문 Transaction ID.
- 이미 적용한 `summon_event_id`.
- 강제 귀환·봉인 상태.

복귀 규칙:

- 소환 상태와 남은 행동 주기를 정확히 복원한다.
- Background 경과시간으로 공격·치유·Stock 보조를 적용하지 않는다.
- 이미 처리한 Event를 재적용하지 않는다.

## 10. Result·Grimoire 기록

자동 행동마다 다음을 기록한다.

- 소환수 ID.
- 스탯 종류와 수치.
- 대상.
- 적용 전·후 값.
- 실패·무효 원인.
- `summon_event_id`와 상위 Transaction ID.

플레이어 주문과 소환수 기여를 결과 화면에서 분리해 설명한다.

## 11. 이전 계약 대체

이 Decision은 다음을 명시적으로 대체한다.

- `GM-BATTLE-RULES-01` 수호 소환수의 수동 단발·자동 행동 금지.
- PR #51 초기안의 `30초 지속 / 20초 Cooldown`.
- 최대 마나 `20%` 소환 비용.
- 자동 주문 출력 `60%`.
- 자동 기여 `25%`.
- 플레이어 피해 `35%`·환경 피해 `25%` 완화.
- 메인 20초 직접 Token 생성.

유지하는 경계:

- 적 공격 Timer를 정지하지 않는다.
- 자동 최적 주문·대상 AI를 사용하지 않는다.
- 자동 소환 연쇄를 금지한다.
- 마지막 Situation 해결은 플레이어가 담당한다.
- Offline 자동 행동은 없다.

## 12. 검증 기준

자동화·합성 Test:

- 중복 소환 Event 0건.
- Pause·Background·Save/Resume 중 주기 진행 0건.
- `[스톡]` 감소 초과분 이월 0건.
- 방어도 적용 후 최소 피해 규칙 위반 0건.
- 공격으로 불안정도 0 도달 0건.
- 치유 초과 저장 0건.
- 슬롯 상한 초과 0건.

사람 검증:

- 시간 제한이 없어도 소환수 교체 선택이 의미 있는가.
- 소환수만 기다리는 플레이가 직접 작성보다 우세하지 않은가.
- 정수 수치를 보고 다음 5초의 결과를 예측할 수 있는가.
- 메인 상시 효과가 다른 보조 선택을 무의미하게 만들지 않는가.

## 13. 후행 튜닝

Prototype 범위에서 조정 가능:

- 공통 주기 `4~7초`.
- 소환 주문 비용 `마나 1~4`.
- `[스톡] 1~3`.
- `[방어도] 1~4`.
- `[공격] 1~4`.
- `[치유] 1~4`.

별도 재승인이 필요한 변경:

- 추가 활성 소환수 2체 이상.
- 소환수 시간 제한 재도입.
- Offline 행동.
- 자동 공격의 최종 해결 허용.
- 동적 최적 대상·주문 AI.
