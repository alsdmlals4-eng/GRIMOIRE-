# GM-SUMMON-FATIGUE-DELEGATION-01 — 적대적 검토

## 판정

```yaml
decision_id: GM-SUMMON-FATIGUE-DELEGATION-01
review_status: PASS_WITH_HARD_GUARDS
core_fun_alignment: PASS_IF_AUTOMATION_REMAINS_SUPPORTIVE
scope_risk: HIGH
implementation_readiness: NOT_READY
p0: 0
p1_design_guards: 5
```

## 핵심 적합성

소환수의 주기 주문·Stock 보충은 반복 필기와 전투 시간 압박을 줄여 플레이어가 상황 판독과 의미 설계에 집중하게 할 수 있다. 반면 자동 행동의 효율이 지나치면 플레이어 주문 설계보다 소환수 세팅과 대기가 상위 전략이 되어 핵심 재미를 침식한다.

## P1 위험과 보호선

### P1-AUTO-PLAY-DOMINANCE

위험: 메인 소환수 상시 주문과 추가 소환수 주기 주문이 전투를 자동 해결한다.

보호선:

- 주요 Situation 종결 조건은 플레이어의 결정적 주문 또는 책임 선택을 요구한다.
- 소환수 자동 주문은 지원·준비·완화·누적 기여 역할을 우선한다.
- 자동 행동만으로 핵심 조우를 통과하는 비율을 사람 테스트에서 측정한다.

### P1-STOCK-INFINITE-LOOP

위험: Stock 보충 → 소환 주문 → 추가 보충이 반복되어 무한 자원이 된다.

보호선:

- Stock 상한.
- 소환 주문에 Stock 외 비용 또는 재소환 제한.
- 소환수의 Stock 보충으로 동일 소환수 재소환 비용을 직접 충당하지 못하게 하는 순환 차단 규칙 검토.

### P1-DECISION-OPACITY

위험: 자동 주문의 대상·실패·비용이 보이지 않아 결과 인과가 불명확해진다.

보호선:

- 발동 예고, 대상 규칙, 남은 주기 표시.
- 자동 행동 전용 Ledger event와 Result 로그.
- 플레이어 주문 결과와 소환수 결과를 UI에서 구분.

### P1-RESUME-DUPLICATION

위험: 앱 중단·재개 직후 주기 타이머가 중복 복원되어 주문 또는 Stock이 두 번 적용된다.

보호선:

- 절대 시각 또는 결정론적 tick 소유권 중 하나를 정본으로 지정.
- 마지막 적용 event ID 저장.
- Atomic Result Ledger idempotency key 적용.

### P1-MAIN-SUMMON-CHOICE-EROSION

위험: 메인 소환수의 상시 효과가 너무 강하거나 고정되어 다른 소환수 선택과 직접 작성의 의미를 약화한다.

보호선:

- 메인 소환수는 편의·정체성 축으로 설계하고 범용 최상위 효율을 피한다.
- 기타 소환수는 `[소환]` 주문의 기회비용과 상황 적합성으로 차별화한다.
- 역할별 상위호환 금지.

## 검증 지표 후보

- 직접 작성 횟수와 수정 횟수 감소율.
- 의미 판단 시간 대비 획 입력 시간 비율.
- 소환수 자동 행동만으로 해결된 주요 조우 비율.
- Stock 상한 도달·낭비·고갈 빈도.
- 자동 주문 결과 이해도와 원인 회상률.
- pause/resume 중복 발동 0건.

모든 수치는 Prototype 전 `TEST_VALUE`다.

## 결론

소환수 자동 지원은 핵심 재미와 양립할 수 있지만, 단순 편의 기능이 아니라 자원·시간·전투·저장에 걸친 높은 결합도의 시스템이다. 현재는 기획 계약만 승인하며 Foundation POC 코드 범위에는 포함하지 않는다.
