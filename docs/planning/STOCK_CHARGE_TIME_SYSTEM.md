# 범용 Stock 자연충전·시간 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: USER_APPROVED_PENDING_MERGE_RESPONSIBILITY_SOURCE
primary_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
historical_parent: GM-STOCK-SYSTEM-01
updated_at: 2026-08-05T00:31+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

연결 문서:

- 상위 자원: `docs/planning/STOCK_SYSTEM.md`.
- 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`.
- 피격 정지: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`.
- 충전 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` `[폐기]`.

## 1. 충전 단위

```text
UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
```

```yaml
output: UNIVERSAL_GLYPH_STOCK_PLUS_1
base_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
clock: ACTIVE_PRESSURE
capacity_rule: NATURAL_CHARGE_RESPECTS_STOCK_CAPACITY
completed_spell_charge: prohibited
vault_charge: prohibited
```

자연충전에는 글자별 대상이나 글자별 진행도가 없다. 하나의 범용 Stock 충전 게이지만 존재한다.

## 2. 충전 진행

Active Pressure가 `1초` 진행하면 자연충전 남은 시간도 `1초` 감소한다.

정지 조건:

- 플레이어 주문·소환수 행동·적 공격의 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·App Background.
- Save/Load·Recognition·Loading.
- 직접 피해 Stock 정지 상태.
- 범용 Stock 용량 가득 참.

Offline·Background catch-up은 없다.

## 3. 완료 처리

```text
충전 완료
→ 범용 Stock 용량 재확인
→ 여유 있으면 Universal Stock +1
→ 다음 1회 충전 시작
```

Stock 용량이 가득 차면 완료 직전 상태에서 정지하고 Stock 소비 후 재개한다.

- 보관함 슬롯 상태는 자연충전에 영향을 주지 않는다.
- 범용 Stock을 특정 글자 보관함으로 변환하지 않는다.
- 완료 초과분을 다음 충전으로 이월하지 않는다.
- 각 완료 Event는 고유 `universal_stock_charge_event_id`로 Exactly-once 처리한다.

## 4. 집중 필사 중 시간

```yaml
focus_scribe_active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
focus_output: EXACT_GLYPH_VAULT_PLUS_1
```

- Active Pressure와 적·환경은 느려지지만 멈추지 않는다.
- 범용 Stock 자연충전은 느려진 Active Pressure만큼만 진행한다.
- 소환수 `[스톡]` 지원 주기도 Active Pressure 기준이다.
- 필사 마나 소모는 실제 시간 기준이다.
- 필사 성공은 범용 Stock이 아니라 선택한 글자의 보관함을 증가시킨다.

따라서 집중 필사로 범용 Stock과 보관함을 실제 시간 기준으로 동시에 가속할 수 없다.

## 5. 소환수 `[스톡]` 지원

```text
소환수 지원 주기 도달
→ 현재 범용 Stock 충전의 남은 시간
→ 활성 [스톡] 합계 N초 감소
```

Prototype 후보:

```yaml
support_cycle_seconds: 5_TEST_VALUE
main_summon_stock_stat: 1_TEST_VALUE
secondary_stock_summon_stat: 2_TEST_VALUE
slice_total_stock_stat_cap: 3_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
```

- 현재 범용 Stock 1회분에만 적용한다.
- 완료를 초과한 감소량은 다음 충전으로 이월하지 않는다.
- Stock 용량이 가득 차면 효과는 소멸한다.
- 소환수가 글자 종류를 선택하거나 바꾸지 않는다.

## 6. 피격 처리

```text
직접 피해로 실제 HP 감소
→ 범용 Stock 진행도 보존
→ UNIVERSAL_STOCK_CHARGE_PAUSE 적용
→ 같은 남은 시간부터 재개
```

집중 필사 중 실제 HP 감소가 발생하면 필사를 중단하고 예약한 보관함 슬롯을 해제한다.

## 7. Event 순서

```text
1. 방어도·보호막·회피 적용
2. 최종 직접 피해 확정
3. 집중 필사 중단 판정
4. 범용 Stock 피격 정지 갱신
5. 치유 Event
6. Active Pressure 충전 감소
7. 소환수 [스톡] 감소
8. 범용 Stock 완료·용량 검증
9. 필사 인식 완료·보관함 생성
10. 후속 전투 Event
```

## 8. Save·Resume

필수 저장 필드:

- `universal_stock_remaining_charge_ms`.
- `summon_stock_cycle_remaining_ms`.
- `universal_stock_charge_event_id`.
- `universal_stock_pause_remaining_ms`.
- 범용 Stock 총량·예약·용량.
- 보관함 슬롯과 집중 필사 예약은 별도 자원 문서를 따른다.

집중 필사 중 Background·Save 진입 시 집중 상태를 종료하고 미완성 획을 폐기한다.

## 9. UI

- 범용 Stock 현재/최대 수량.
- 다음 범용 Stock까지 남은 Active Pressure 초.
- 활성 소환수 `[스톡]` 합계와 다음 지원 주기.
- 피격 정지·봉인·교란 상태.
- 집중 필사 중 느린 시간과 실제 시간 마나 소모.
- 필사 성공 시 생성될 특정 글자 보관함.

특정 글자 자연충전 대상·전환 UI는 표시하지 않는다.

## 10. Prototype 검증

| 가설 | 통과 신호 |
|---|---|
| 단일 범용 충전 게이지가 이해하기 쉽다 | 플레이어가 다음 Stock 시각과 용도를 예측 |
| 범용 Stock이 준비 전략을 전부 없애지 않는다 | 보관함 사전 준비도 상황별로 사용 |
| 집중 0.25배가 완전 Pause로 느껴지지 않는다 | 적 위협과 시간 비용을 계속 인식 |
| 자연충전만으로 기본 전투가 가능하다 | 그리기 강제 없이 핵심 전투 수행 |
| Save/Resume가 정확하다 | 중복 Stock·진행도 손실 0건 |

## 11. 금지

```text
PER_GLYPH_NATURAL_CHARGE_PROGRESS
CHARGE_TARGET_GLYPH_SELECTION
CHARGE_TARGET_SWITCH_DELAY
NATURAL_CHARGE_TO_VAULT
FOCUS_SCRIBE_TO_UNIVERSAL_STOCK
OFFLINE_CATCH_UP
COMPLETED_SPELL_CHARGE
```

초기 수치는 Runtime·사람 검증 전 상용 최종값이 아니다.
