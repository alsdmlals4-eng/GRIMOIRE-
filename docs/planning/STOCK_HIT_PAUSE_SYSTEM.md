# 범용 Stock 피격 정지·보관함 필사 중단 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: USER_APPROVED_PENDING_MERGE_RESPONSIBILITY_SOURCE
primary_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
historical_parent_decisions:
  - GM-3X3-CIRCUIT-STOCK-FOCUS-01
  - GM-STOCK-SYSTEM-01
updated_at: 2026-08-05T00:31+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

상위 문서:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`.
- `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` `[폐기]`.
- `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` `[보류/재설계 필요]`.

## 1. 핵심 원칙

직접 피해로 실제 HP가 감소하면:

1. 범용 Stock 자연충전을 짧게 정지한다.
2. 단일 충전 진행도는 삭제하지 않고 보존한다.
3. 집중 필사 중이면 필사를 중단하고 미완성 획과 필사 슬롯 예약을 폐기한다.

```text
직접 피해로 실제 HP 감소
→ 0.25초 직접 피해 집계
→ 비례 정지시간 계산
→ UNIVERSAL_STOCK_CHARGE_PAUSE
→ FOCUS_SCRIBE_VAULT_INTERRUPTED
→ 정지 종료 후 같은 범용 충전 진행도에서 재개
```

## 2. 피해 0 처리

방어·소환수 수호·보호막·회피·무적·상쇄 후 최종 직접 피해가 0이면:

```text
최종 직접 피해 0
→ 범용 Stock 충전 정지 없음
→ 집중 필사 유지
```

Prototype 권장안은 피해 0의 피격 연출만으로 필사를 끊지 않는 것이다.

## 3. 피격 정지 공식

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

이 수치와 피해 0 예외는 Runtime·사람 검증 전 `TEST_VALUE`다.

## 4. 범용 Stock 자연충전 중 직접 피해

```text
다음 범용 Stock 충전 65%
→ 최대 HP 10% 직접 피해
→ 진행도 65% 보존
→ 0.30초 정지
→ 65%부터 자동 재개
```

정지 중 적용하지 않음:

- Active Pressure 범용 Stock 자연충전.
- 소환수 `[스톡]` 지원 주기.
- 후속 능동 충전 보너스.

특정 글자 충전 대상과 전환 지연은 존재하지 않는다. 정지 중 누락된 효과를 나중에 소급 적립하지 않는다.

## 5. 집중 필사 중 직접 피해

```text
[집중 필사]로 열 문양 작성 중
→ 직접 피해로 실제 HP 감소
→ 필사 즉시 중단
→ 미완성 획 폐기
→ RESERVED_FOR_SCRIBE 슬롯을 EMPTY로 복구
→ 보관함 생성 없음
→ 실제 시간 마나 지속 소모 종료
```

- 이미 소비한 마나와 흐른 시간은 환불하지 않는다.
- 선택한 글자와 완성되지 않은 인식 진행도는 저장하지 않는다.
- 피격 정지 종료 후 필사를 자동 재개하지 않는다.
- 범용 Stock을 보상으로 지급하지 않는다.

## 6. 지속 피해

화상·독·출혈 등 지속 피해 틱은 HP를 감소시키지만 범용 Stock 자연충전을 정지시키지 않는다.

```text
지속 피해 틱
→ HP 감소
→ 범용 Stock 자연충전 계속
```

집중 필사도 기본적으로 자동 중단하지 않는다. 별도의 경직·침묵·집중 방해 상태가 함께 있다면 해당 상태 효과가 필사를 중단할 수 있다.

## 7. 상태이상 책임 분리

```text
지속 피해
→ HP 압박

직접 피해
→ 범용 Stock 자연충전 짧은 정지 + 집중 필사 중단

집중 방해 상태
→ 별도 데이터로 집중 필사 시작·유지 제한

자원 봉인 상태
→ 범용 Stock·보관함 사용 제한을 새 자원 모델로 재설계
```

상태 효과를 직접 피해 정지 공식에 은밀히 중복 가산하지 않는다.

## 8. Event 순서

```text
1. 방어도·보호막·회피 적용
2. 최종 직접 피해 확정
3. 집중 필사 중단과 보관함 슬롯 예약 해제
4. 직접 피해 집계·범용 Stock 정지 갱신
5. 치유 Event
6. 범용 Stock 자연충전 Event
7. 소환수 [스톡] Event
8. 범용 Stock 완료 Event
9. 필사 인식 완료·보관함 생성 Event
```

집중 필사 인식 완료와 직접 피해가 같은 시각이면 최종 피해 확정이 먼저다. 실제 HP 감소가 있으면 보관함 생성 Event를 만들지 않는다.

## 9. UI 필수 정보

- 범용 Stock 피격 정지 게이지.
- 단일 자연충전 진행도 보존 표시.
- 완전 방어 시 정지·필사 중단 없음 피드백.
- 집중 필사 중단 원인.
- 미완성 획 폐기와 보관함 미생성 표시.
- 지속 피해와 직접 피해의 서로 다른 자원 영향.

## 10. 가드레일

```text
DAMAGE_ZERO_INTERRUPTS_FOCUS = PROHIBITED_IN_PROTOTYPE
DOT_PAUSES_UNIVERSAL_STOCK = PROHIBITED
DOT_INTERRUPTS_FOCUS_BY_DEFAULT = PROHIBITED
DIRECT_DAMAGE_DELETES_CHARGE_PROGRESS = PROHIBITED
FOCUS_AUTO_RESUME_AFTER_HIT = PROHIBITED
REFUND_MANA_AFTER_FOCUS_INTERRUPTION = PROHIBITED
MULTIHIT_STACKS_MINIMUM_PAUSE_PER_HIT = PROHIBITED
HIT_CHANGES_CHARGE_GLYPH_TARGET = NOT_APPLICABLE
```

## 11. Save·Resume

- 단일 범용 Stock 충전 진행도.
- 범용 Stock 정지 남은 시간.
- 집중 필사 선택 글자·보관함 예약 슬롯.
- 처리 완료 Event ID.

Background·Focus loss에서 필사를 종료하고 부분 획을 저장하지 않는다.

## 12. 검증 경계

피격 중 필사 UX, 피해 0 유지, 직접 피해와 인식 완료의 동시 Event, 모바일 터치 복구는 제품 구현·사람 검증 전 `NOT_RUN`이다.
