# Spell 글자 Stock 피격 정지·집중 필사 중단 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_ACTIVE
primary_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decisions:
  - GM-STOCK-SYSTEM-01
  - GM-00-24
  - GM-00-28
  - GM-00-30
updated_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

상위 문서:

- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md`

## 1. 핵심 원칙

직접 피해로 실제 HP가 감소하면:

1. 자연충전과 충전 대상 전환을 짧게 정지한다.
2. 진행도는 삭제하지 않고 보존한다.
3. 집중 필사 중이라면 필사를 중단하고 미완성 획을 폐기한다.

```text
직접 피해로 실제 HP 감소
→ 0.25초 직접 피해 집계
→ 비례 정지시간 계산
→ 자연충전·전환 진행도 보존
→ 집중 필사 즉시 중단
→ 정지 종료 후 자연충전·전환 재개
```

## 2. 피해 0 처리

방어·소환수 수호·보호막·회피·무적·상쇄 후 최종 직접 피해가 0이면:

```text
최종 직접 피해 0
→ 자연충전·전환 정지 없음
→ 집중 필사 유지
```

Prototype 권장안은 피해 0의 피격 연출만으로 필사를 끊지 않는 것이다.

## 3. 확정 피격 정지 공식

```text
직접 피해 손실 비율 r
= 0.25초 집계 구간의 직접 피해 HP 감소 합계
  / 집계 시작 시 최대 HP

피격 정지시간(초)
= clamp(r × 3.0, 0.10, 0.80)
```

| 최대 HP 대비 직접 피해 | 정지시간 |
|---:|---:|
| 1% | 0.10초 |
| 5% | 0.15초 |
| 10% | 0.30초 |
| 20% | 0.60초 |
| 30% 이상 | 0.80초 |

- 같은 0.25초 안의 다단 피해는 하나로 합산한다.
- 타격 횟수마다 최소 정지시간을 반복 적용하지 않는다.
- 정지 상한은 0.80초다.

## 4. 자연충전 중 직접 피해

```text
보호 글자 Stock 다음 1개 65% 충전
→ 최대 HP 10% 직접 피해
→ 진행도 65% 보존
→ 0.30초 정지
→ 65%부터 자동 재개
```

정지 중 적용하지 않음:

- Active Pressure 자연충전.
- 소환수 `[스톡]` 지원 주기.
- 충전 대상 전환 지연.
- 후속 능동 충전 보너스.

정지 중 누락된 효과를 나중에 소급 적립하지 않는다.

## 5. 집중 필사 중 직접 피해

```text
[집중 필사]로 집중 글자 작성 중
→ 직접 피해로 실제 HP 감소
→ 필사 즉시 중단
→ 미완성 획 폐기
→ Stock 생성 없음
→ 실제 시간 마나 지속 소모 종료
```

- 이미 소비한 마나와 흐른 시간은 환불하지 않는다.
- 선택한 글자와 완성되지 않은 인식 진행도는 저장하지 않는다.
- 피격 정지 종료 후 필사를 자동 재개하지 않는다.
- 플레이어가 다시 명시적으로 집중 필사를 시작해야 한다.

## 6. 지속 피해

화상·독·출혈 등 지속 피해 틱은 HP를 감소시키지만 자연충전·전환을 정지시키지 않는다.

```text
지속 피해 틱
→ HP 감소
→ 자연충전·전환 계속
```

집중 필사도 자동 중단하지 않는다. 따라서 플레이어는 느린 시간 속에서도 지속 피해와 남은 HP를 고려해야 한다.

지속 피해와 별도의 경직·침묵·집중 방해 상태가 함께 있다면 해당 상태 효과가 필사를 중단할 수 있다.

## 7. 상태이상 책임 분리

```text
지속 피해
→ HP 압박

직접 피해
→ 자연충전·전환 짧은 정지 + 집중 필사 중단

집중 방해 상태
→ 별도 데이터로 집중 필사 시작·유지 제한

Stock 봉인 상태
→ 글자 Stock 사용 제한
```

상태 효과를 직접 피해 정지 공식에 은밀히 중복 가산하지 않는다.

## 8. Event 순서

```text
1. 방어도·보호막·회피 적용
2. 최종 직접 피해 확정
3. 집중 필사 중단 판정
4. 직접 피해 집계·피격 정지 갱신
5. 치유 Event
6. 자연충전·전환 Event
7. 소환수 [스톡] Event
8. Stock 완료 Event
```

집중 필사 인식 완료와 직접 피해가 같은 시각이면 최종 피해 확정이 먼저다. 실제 HP 감소가 있으면 필사 성공 Event를 생성하지 않는다.

## 9. UI 필수 정보

- 피격 정지 게이지.
- 자연충전·전환 진행도 보존 표시.
- 완전 방어 시 정지·필사 중단 없음 피드백.
- 집중 필사 중단 원인.
- 미완성 획 폐기와 Stock 미생성 표시.
- 지속 피해와 직접 피해의 서로 다른 Stock 영향.

## 10. 가드레일

```text
DAMAGE_ZERO_INTERRUPTS_FOCUS = PROHIBITED_IN_PROTOTYPE
DOT_PAUSES_STOCK = PROHIBITED
DOT_INTERRUPTS_FOCUS_BY_DEFAULT = PROHIBITED
DIRECT_DAMAGE_DELETES_CHARGE_PROGRESS = PROHIBITED
FOCUS_AUTO_RESUME_AFTER_HIT = PROHIBITED
REFUND_MANA_AFTER_FOCUS_INTERRUPTION = PROHIBITED
MULTIHIT_STACKS_MINIMUM_PAUSE_PER_HIT = PROHIBITED
```

## 11. 검증 경계

피격 중 필사 UX, 피해 0 유지, 직접 피해와 인식 완료의 동시 Event, 모바일 터치 복구는 제품 구현·사람 검증 전 `NOT_RUN`이다.
