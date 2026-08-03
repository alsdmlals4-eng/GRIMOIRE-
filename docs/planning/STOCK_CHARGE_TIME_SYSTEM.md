# Spell Stock 충전시간 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_REVISED_DEFAULTS
decision_id: GM-STOCK-SYSTEM-01
updated_at: 2026-08-02T23:14:00+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

연결 문서:

- 상위 Stock 시스템: `docs/planning/STOCK_SYSTEM.md`
- 준비 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- 직접 피해 정지: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- 소환수: `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`

## 1. 기본 시간 공식

`1.0단위`를 Active Pressure `10초`로 확정한다.

```text
기능 마법 글자 수 n인 Stock 1회분 기준 충전시간
= 10 + 5 × (n - 1)초
```

| 기능 글자 수 | 기준 충전시간 |
|---:|---:|
| 1 | 10초 |
| 2 | 15초 |
| 3 | 20초 |
| 4 | 25초 |
| 5 | 30초 |
| 6 | 35초 |

- `n`은 설계도에 포함된 기능 마법 글자 수다.
- 선 길이·획수·시각 장식은 계산하지 않는다.
- 하위 글자 Stock은 `n=1`, 기준 `10초`다.

## 2. 지정 대상 충전

- 한 번에 준비 대상 `1종`만 자연 충전한다.
- 동일 대상의 빈 Stock을 1회분씩 순차 충전한다.
- 대상별 진행도를 별도 보존한다.
- 최대 수량에 도달해도 자동으로 다른 대상으로 바꾸지 않는다.

## 3. 자연 시간 진행

Active Pressure Clock이 `1초` 진행하면 남은 충전시간도 `1초` 감소한다.

정지 조건:

- 플레이어 주문·소환수 행동·적 공격 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·App Background.
- Save/Load·입력을 막는 Recognition·Loading.
- 직접 피해에 따른 Stock 정지 상태.

Offline·Background catch-up은 없다.

## 4. 소환수 `[스톡]` 정수 가속

소환수는 충전 배율 `%`를 제공하지 않는다.

```text
소환수 지원 주기 도달
→ 현재 지정 대상의 남은 충전시간
→ 활성 [스톡] 합계 N초 감소
```

Prototype 기본값:

```yaml
support_cycle_seconds: 5
main_summon_stock_stat: 1
secondary_stock_summon_stat: 2
slice_total_stock_stat_cap: 3
minimum_actual_charge_seconds: 3
```

예시 1:

```text
1글자 Stock 기준 10초
메인 [스톡] 1
5초 시점 추가 -1초
실제 완성 약 9초
```

예시 2:

```text
1글자 Stock 기준 10초
메인 [스톡] 1 + 생산형 보조 [스톡] 2
5초 시점 추가 -3초
실제 완성 약 7초
```

규칙:

- 추가 감소량은 해당 1회분 충전에만 적용한다.
- 완료를 초과한 감소량은 다음 1회분으로 이월하지 않는다.
- 충전 대상이 없거나 최대 수량이면 주기 효과는 소멸한다.
- 소환수는 충전 대상을 변경하지 않는다.
- 단축 후에도 Stock 1회분은 최소 `3초`의 Active Pressure를 요구한다.

## 5. 플레이어 능동 기여

직접 작성·정확 입력·방어·반격·주문 연계는 후속 정수 보너스를 제공할 수 있다.

후속 후보:

```text
정확한 직접 Commit
→ 현재 남은 충전시간 -1초

방어·반격 성공
→ 현재 남은 충전시간 -1초
```

이 값은 `BATTLE-TUNING-01` 전까지 확정하지 않는다. 퍼센트 속도 배율은 사용하지 않는다.

## 6. 피격 처리

```text
진행 중 직접 피해 발생
→ 현재 진행도 보존
→ STOCK_HIT_PAUSE_SYSTEM의 정지시간 적용
→ 정지 종료 후 같은 남은 시간부터 재개
```

- 지속 피해는 충전을 정지하지 않는다.
- 완전 방어로 최종 직접 피해가 0이면 정지하지 않는다.
- 정지 중 자연 시간·소환수 `[스톡]`·능동 보너스는 모두 적용하지 않는다.

## 7. Event 순서

같은 시각에 여러 Event가 도달하면 다음 순서를 사용한다.

```text
1. 방어도 적용·피해 확정
2. 직접 피해 Stock 정지 판정
3. 치유 Event
4. 자연충전 시간 감소
5. 소환수 [스톡] 추가 감소
6. Stock 완성 Event
7. 소환수 공격 Event
```

각 완성 Event는 고유 `stock_charge_event_id`를 사용한다.

## 8. Save·Resume

필수 저장 필드:

- `stock_target_id`.
- `stock_base_charge_seconds`.
- `stock_remaining_charge_seconds`.
- `stock_progress_by_target`.
- `summon_stock_cycle_remaining_seconds`.
- `stock_charge_event_id`.
- `stock_pause_remaining_seconds`.

복귀 규칙:

- Snapshot 값에서 정확히 재개한다.
- Background 경과시간을 차감하지 않는다.
- 복귀 순간 여러 완성 Event를 한꺼번에 만들지 않는다.

## 9. UI 필수 정보

- 기준 충전시간.
- 현재 남은 초.
- 자연 진행 상태.
- 활성 소환수 `[스톡]` 합계.
- 다음 5초 지원 주기.
- 피격 정지·봉인·교란 상태.
- 실제 예상 완성 시각.

## 10. Prototype 검증

| 가설 | 통과 신호 |
|---|---|
| 1글자 10초가 빠른 기본 순환으로 이해된다 | 기본 주문·하위 글자를 즉응용으로 사용 |
| 추가 글자당 5초가 복잡도 차이를 만든다 | 고위 주문을 준비된 대응으로 사용 |
| `[스톡] 1/2`가 읽기 쉬운 정수 지원이다 | 플레이어가 완성 예상 시각을 설명 가능 |
| 지원이 직접 작성을 대체하지 않는다 | Stock 대기만 하는 전략이 우세하지 않음 |
| Save/Resume가 정확하다 | 중복 완성·진행도 손실 0건 |

## 11. 후행 조정 범위

- 1.0단위 `8~12초`.
- 추가 글자 증가량 `4~6초`.
- 지원 주기 `4~6초`.
- 소환수 `[스톡] 1~3`.
- 최소 실제 충전시간 `2~4초`.

상용 최종값은 Runtime·사람 검증 뒤 확정한다.
