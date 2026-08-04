# Spell 글자 Stock 충전 대상 전환 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_ACTIVE
primary_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decision: GM-STOCK-SYSTEM-01
updated_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

상위 문서:

- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`

## 1. 핵심 결정

전투 중 자연충전 대상 글자를 변경할 수 있다.

```text
현재 글자 Stock 충전 중
→ 새로운 숙련 글자 선택
→ 기존 글자의 진행도 보존
→ 짧은 전환 지연
→ 새 글자의 저장 진행도부터 충전
```

- 한 번에 글자 1종만 자연충전한다.
- 완성 주문은 충전 대상이 아니다.
- 전환 대상과 시점은 플레이어가 결정한다.
- 소환수는 자동으로 충전 글자를 변경하지 않는다.

## 2. 글자별 진행도 보존

```yaml
열:
  remaining_seconds: 3

보호:
  remaining_seconds: 7

집중:
  remaining_seconds: 10
```

- 보존되는 것은 각 글자의 다음 Stock 1개 충전 진행도다.
- 이미 완성된 글자 Stock 수량은 그대로 유지된다.
- 여러 글자가 부분 진행도를 보유할 수 있다.
- 공용 용량을 초과해 완성되지는 않는다.

## 3. 전환 지연

```text
전환 요청
→ 현재 충전 정지
→ 진행도 저장
→ 전환 지연 게이지
→ 새 글자 활성화
```

전환 지연 중:

- 자연충전 진행 없음.
- 소환수 `[스톡]` 지원 적용 없음.
- 전투와 3×3 주문 조합은 정상 진행.
- 이미 보유한 글자 Stock은 정상적으로 예약·사용 가능.
- 집중 필사는 별도 행동이므로 전환 지연 중 시작할 수 없다.

전환 지연 실제 값은 Runtime 검증 전 확정하지 않는다.

## 4. 선택 가능한 대상

선택 가능:

- 학습·숙련해 Stock화가 허용된 메인 글자.
- 학습·숙련해 Stock화가 허용된 보조 글자.
- 현재 준비 편성에 포함된 글자.

선택 불가:

- 완성 주문.
- 대상 키워드.
- 연결선.
- 미학습·미숙련 글자.
- 준비 편성에 없는 글자.
- 공용 용량이 가득 차 추가 생산이 불가능한 상태.

## 5. 집중 필사와 전환

집중 필사는 자연충전 대상과 다른 글자를 선택할 수 있다.

```text
자연충전 대상: 보호
집중 필사 대상: 집중
→ 성공 시 집중 Stock +1
→ 보호 자연충전 진행도는 보존
```

단, 집중 필사 중 자연충전은 Active Pressure의 느려진 시간만큼만 진행한다.

집중 필사 성공은 자연충전 대상을 자동으로 바꾸지 않는다.

## 6. UI 필수 정보

- 현재 자연충전 글자 강조.
- 현재 글자의 다음 Stock 남은 초.
- 다른 준비 글자의 저장 진행도.
- 전환 요청 글자.
- 전환 지연 게이지.
- 전환 중 자연충전·소환수 지원 정지 표시.
- 공용 용량 가득 참 표시.
- 집중 필사 글자와 자연충전 글자를 명확히 구분.

## 7. 피격 중 전환

```text
전환 지연 40% 진행
→ 직접 피해
→ 40% 보존
→ 피격 정지
→ 40%부터 전환 지연 재개
```

- 피격으로 전환 요청이 취소되지 않는다.
- 피격 정지 중 전환 지연·자연충전·소환수 지원은 진행하지 않는다.
- 연속 피격은 하나의 정지 타이머만 갱신한다.

## 8. 가드레일

```text
COMPLETED_SPELL_AS_CHARGE_TARGET = PROHIBITED
TARGET_KEYWORD_AS_CHARGE_TARGET = PROHIBITED
AUTO_SWITCH_ON_CAPACITY_FULL = PROHIBITED
SUMMON_AUTO_SWITCH = PROHIBITED
FOCUS_SCRIBE_AUTO_SWITCH = PROHIBITED
MULTIPLE_SIMULTANEOUS_NATURAL_TARGETS = PROHIBITED
```

## 9. 검증 경계

전환 지연 초 단위, 전환 취소 처리, 모바일 UI는 제품 구현과 사람 검증 전 `NOT_RUN`이다.
