# GM-CORE-SYSTEM-ALIGNMENT-01 — 소환수 보완 정의 적대적 검토

## 상태

```yaml
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
clarification: MAIN_ALWAYS_ACTIVE_AND_SUMMON_SPELL_ACTIVATED_PERIODIC_SUPPORT
clarified_at: 2026-08-02T21:57:00+09:00
new_grill_count: false
review_status: PASS_WITH_HARD_GUARDS
core_fun_alignment: PASS_IF_AUTOMATION_REMAINS_SUPPORTIVE
implementation_readiness: NOT_READY
p0: 0
p1_design_guards: 5
```

사용자 보완 정의:

```text
메인 소환수 = 상시 활성
기타 소환수 = 플레이어가 [소환] 주문으로 호출한 뒤 활성
활성 소환수 = 일정 시간마다 [주문]을 사용하거나 [Stock]을 충전
```

이 내용은 기존 소환수 시스템의 실제 의도를 바로잡는 설명 교정이며 별도 Grill Decision으로 집계하지 않는다.

## 핵심 적합성

소환수 주기 주문·Stock 충전은 반복 필기와 전투 시간 압박을 줄여 플레이어가 상황 판독과 의미 설계에 집중하게 할 수 있다. 반면 자동 행동 효율이 지나치면 플레이어 주문 설계보다 소환수 세팅과 대기가 상위 전략이 되어 핵심 재미를 침식한다.

## P1 위험과 보호선

### P1-AUTO-PLAY-DOMINANCE

위험: 메인 소환수 상시 주문과 추가 소환수 주기 주문이 주요 Situation을 자동 해결한다.

보호선:

- 주요 Situation 종결 조건은 플레이어의 결정적 주문 또는 책임 선택을 요구한다.
- 자동 행동만으로 핵심 조우를 통과하는 비율을 사람 테스트에서 측정한다.
- 소환수 지원은 준비·완화·누적 기여를 우선하며 범용 최적 해법이 되지 않는다.

### P1-STOCK-INFINITE-LOOP

위험: Stock 충전 → `[소환]` 주문 → 추가 충전이 반복되어 무한 자원이 된다.

보호선:

- Stock 상한.
- 재소환 대기·지속·동시 활성 제한.
- 소환수 Stock 충전이 동일 소환수 재소환 비용을 무한 충당하지 못하도록 순환 차단 규칙 검토.
- 소환수가 다른 소환수를 자동 소환하지 않는다.

### P1-DECISION-OPACITY

위험: 자동 주문의 대상·실패·비용이 보이지 않아 결과 인과가 불명확해진다.

보호선:

- 발동 예고·대상 규칙·남은 주기·Stock 충전량 표시.
- 자동 행동 전용 Ledger event와 Result 로그.
- 플레이어 Commit과 소환수 행동의 결과 소유권 분리.

### P1-RESUME-DUPLICATION

위험: 앱 중단·재개 직후 주기 타이머가 중복 복원되어 주문 또는 Stock이 두 번 적용된다.

보호선:

- 결정론적 tick/event 계약.
- 마지막 적용 event ID와 남은 주기 저장.
- Atomic Result Ledger idempotency key 적용.
- Background·Offline 시간 진행 여부를 후속 정본에서 명시.

### P1-MAIN-SUMMON-CHOICE-EROSION

위험: 메인 소환수의 상시 효과가 너무 강해 다른 소환수와 직접 작성의 의미를 약화한다.

보호선:

- 메인 소환수는 정체성·편의 축이며 범용 최상위 효율을 피한다.
- 기타 소환수는 `[소환]` 주문의 비용과 상황 적합성으로 차별화한다.
- 역할별 상위호환을 금지한다.

## 검증 지표 후보

- 직접 작성 횟수와 수정 횟수 감소율.
- 의미 판단 시간 대비 획 입력 시간 비율.
- 소환수 자동 행동만으로 해결된 주요 조우 비율.
- Stock 상한 도달·낭비·고갈 빈도.
- 자동 주문 결과 이해도와 원인 회상률.
- pause/resume 중복 발동 0건.

모든 수치는 Prototype 전 `TEST_VALUE`다.

## 결론

소환수 주기 지원은 핵심 재미와 양립할 수 있지만 자원·시간·전투·저장에 걸친 높은 결합도의 시스템이다. 기획 정의는 활성화하되 Foundation POC 코드 범위에는 포함하지 않고, Stock·소환수 상세 규칙과 Runtime 구현은 후속 설계·Execution Readiness에서 다룬다.
