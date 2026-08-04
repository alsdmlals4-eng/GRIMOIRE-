# Spell 글자 Stock 충전시간 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_ACTIVE
primary_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decision: GM-STOCK-SYSTEM-01
updated_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

연결 문서:

- 상위 Stock: `docs/planning/STOCK_SYSTEM.md`
- 준비 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- 직접 피해 정지: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- 소환수: `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`

## 1. 기본 충전 단위

활성 Stock은 글자 Stock뿐이다.

```text
특정 숙련 글자 Stock 1개
= Active Pressure 10초 TEST_VALUE
```

```yaml
base_charge_seconds_per_glyph: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
completed_spell_charge: PROHIBITED
```

기존 `10 + 5 × (n - 1)` 완성 주문 충전 공식은 활성 시스템에서 폐기한다. 주문은 언제나 3×3 회로에서 글자 Stock을 각각 소비해 조합한다.

## 2. 지정 글자 충전

- 한 번에 특정 글자 `1종`만 자연충전한다.
- 동일 글자의 빈 Stock을 1개씩 순차 충전한다.
- 글자별 다음 1회분 진행도를 별도로 보존한다.
- 공용 용량이 가득 차면 완료하지 않고 정지한다.
- 최대 용량 또는 지정 글자 보유 목표에 도달해도 다른 글자로 자동 전환하지 않는다.

## 3. Active Pressure 시간 진행

Active Pressure가 `1초` 진행하면 자연충전 남은 시간도 `1초` 감소한다.

정지 조건:

- 플레이어 주문·소환수 행동·적 공격 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·App Background.
- Save/Load·Recognition·Loading.
- 직접 피해 Stock 정지 상태.

Offline·Background catch-up은 없다.

## 4. 집중 필사 중 시간

```yaml
focus_scribe_active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
manual_stock_gain_on_success: 1
```

집중 필사 중:

- Active Pressure와 적·환경 진행은 느려지지만 멈추지 않는다.
- 자연충전은 Active Pressure 기준으로만 진행한다.
- 소환수 `[스톡]` 지원 주기도 Active Pressure 기준으로만 진행한다.
- 필사 마나 소모는 실제 시간 기준이다.
- 인식 성공 시 선택한 글자 Stock을 즉시 1개 생성한다.

따라서 집중 상태를 오래 유지해 자연충전과 소환수 생산을 실제 시간 기준으로 가속할 수 없다.

## 5. 소환수 `[스톡]` 정수 가속

```text
소환수 지원 주기 도달
→ 현재 지정 글자의 남은 충전시간
→ 활성 [스톡] 합계 N초 감소
```

Prototype 기존값:

```yaml
support_cycle_seconds: 5_TEST_VALUE
main_summon_stock_stat: 1_TEST_VALUE
secondary_stock_summon_stat: 2_TEST_VALUE
slice_total_stock_stat_cap: 3_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
```

규칙:

- 현재 지정 글자 1회분에만 적용한다.
- 완료를 초과한 감소량은 다음 Stock으로 이월하지 않는다.
- 지정 글자가 없거나 공용 용량이 가득 차면 효과는 소멸한다.
- 소환수는 충전 글자를 자동 변경하지 않는다.

## 6. 집중 필사 성공 Event

```text
필사할 glyph_id 선택
→ 유효한 획 완성
→ 인식 결과 glyph_id 일치
→ 공용 용량 확인
→ stock_generation_event_id 발급
→ 해당 글자 Stock +1
```

- 필사 생성은 자연충전 진행도를 초기화하지 않는다.
- 같은 시각 자연충전 완료와 필사 성공이 겹치면 Transaction 순서로 용량을 확인해 초과 생성을 막는다.
- 쉬운 글자를 그려 다른 글자 Stock으로 전환할 수 없다.
- 정확도에 따른 추가 Stock 보너스는 없다.

## 7. 집중 필사 실패·중단

다음 상황에서는 Stock을 얻지 못한다.

- 수동 취소.
- 인식 실패.
- 직접 피해·제어 상태로 중단.
- 마나 0.
- Focus loss·Background.
- 공용 용량 가득 참.

미완성 획은 저장하지 않으며 이미 흐른 시간과 소비한 마나는 환불하지 않는다.

## 8. 피격 처리

### 자연충전

```text
직접 피해
→ 진행도 보존
→ STOCK_HIT_PAUSE_SYSTEM 정지 적용
→ 같은 남은 시간부터 재개
```

### 집중 필사

```text
직접 피해
→ 집중 필사 중단
→ 미완성 획 폐기
→ 마나 지속 소모 종료
```

완전 방어로 최종 직접 피해가 0이면 집중 중단 여부는 후속 전투 튜닝에서 검증한다. Prototype 권장안은 `0 피해면 중단하지 않음`이다.

## 9. Event 순서

같은 시각 Event가 도달하면:

```text
1. 방어도 적용·피해 확정
2. 집중 필사 중단 판정
3. 직접 피해 자연충전 정지 판정
4. 치유 Event
5. Active Pressure 자연충전 감소
6. 소환수 [스톡] 추가 감소
7. 자연충전 완료 Event
8. 필사 인식 완료 Event
9. 공용 용량 원자 검증·Stock 생성
10. 소환수 공격 Event
```

각 완료·생성 Event는 고유 ID를 사용한다.

## 10. Save·Resume

필수 저장 필드:

- `stock_target_glyph_id`.
- `stock_remaining_charge_ms_by_glyph`.
- `summon_stock_cycle_remaining_ms`.
- `stock_generation_event_id`.
- `stock_charge_event_id`.
- `stock_pause_remaining_ms`.

집중 필사 중 Background·Save 진입 시:

- 집중 상태 종료.
- 미완성 획 폐기.
- Stock 생성 없음.
- 복귀 후 일반 전투 상태에서 재개.

## 11. UI 필수 정보

- 현재 자연충전 글자.
- 남은 Active Pressure 초.
- 활성 소환수 `[스톡]` 합계와 다음 지원 주기.
- 피격 정지·봉인·교란 상태.
- 집중 필사 중 시간 진행 상태.
- 실제 시간 마나 소모.
- 성공 시 생성될 글자 Stock.

## 12. Prototype 검증

| 가설 | 통과 신호 |
|---|---|
| 1글자 10초가 이해되는 기본 순환이다 | 플레이어가 자연충전 완료 시각을 예측 |
| 집중 0.25배가 완전 Pause로 느껴지지 않는다 | 적 위협과 시간 비용을 계속 인식 |
| 마나 1/초가 필사의 의미 있는 대가다 | 항상 필사하지 않고 상황별로 선택 |
| 수동 필사가 자연충전을 대체하지 않는다 | 자연충전만으로 기본 전투 수행 가능 |
| typed Stock이 악용을 막는다 | 쉬운 글자로 다른 Stock 생성 0건 |
| Save/Resume가 정확하다 | 중복 Stock·진행도 손실 0건 |

초기 수치는 Runtime·사람 검증 전 상용 최종값이 아니다.
