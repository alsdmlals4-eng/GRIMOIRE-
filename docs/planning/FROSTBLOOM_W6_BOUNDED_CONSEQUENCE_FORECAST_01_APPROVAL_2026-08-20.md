# GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01 — W6 첫 주요 해결의 제한적 결과 예측

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
sync_id: GR-SYNC-20260820-25-W6-BOUNDED-CONSEQUENCE-FORECAST
approved_at_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
segment: MINUTE_23_TO_30
forecast_contract: BOUNDED_CONSEQUENCE_FORECAST
forecast_source_scope: OBSERVED_EVIDENCE_ONLY
known_effect_field: KNOWN_IMPROVEMENT
uncertainty_field: UNCERTAIN_CONSEQUENCE
success_field: FINAL_TARGET_SUCCESS_BREAKDOWN
mana_field: MANA_COST
commit_contract: EXPLICIT_COMMIT_REQUIRED
intent_route_contract: NO_NAMED_INTENT_ROUTE_BUTTONS
unknown_fact_contract: UNKNOWN_FACTS_NOT_INVENTED
preservation_contract: FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자는 2026-08-20 KST에 W6의 A안, 즉 **Bounded Consequence Forecast**를 승인했다. W6는 `Known 2 / Unknown 2 / Lens 1`을 가지고 시작하며, 플레이어가 직접 만든 FIVE_POINT_STAR와 명시적으로 고른 Target에 대해 **관찰 근거가 있는 예상 개선, 아직 장담할 수 없는 위험, 최종 성공률 근거, Mana 비용**을 구분해 본 뒤 명시적으로 사용한다.

이 결정은 새 spell system이나 별도 intent/route selector를 만들지 않는다. 기존 `GM-SPELL-WORKFLOW-UI-V2-01`의 Stage 2/3와 기존 W6 consequence authority를 소비하는 child refinement다.

## 2. 핵심 플레이어 약속

```yaml
player_promise: "게임은 내가 이미 알아낸 인과를 숨기지 않지만, 아직 조사하지 않은 사실을 정답처럼 대신 알려주지도 않는다."
meaningful_choice: "내가 확보한 근거를 바탕으로 회로와 Target을 정하고, 무엇을 개선할 수 있으며 무엇은 아직 불확실한지 읽은 뒤 Commit한다."
expected_experience: "나는 답을 찍은 것이 아니라 현재 근거로 책임 있는 결정을 내렸다. 결과가 혼합되어도 왜 그런 판단을 했는지 추적할 수 있다."
research_question: "신규 플레이어가 Known과 Unknown을 구분한 상태에서 W6 Commit을 공정한 선택으로 느끼는가?"
observable_signal:
  - "플레이어가 Preview에서 확실한 개선과 불확실 위험을 구분한다."
  - "회로/Target 선택 이유를 named route가 아니라 관찰 사실과 기대 효과로 설명한다."
  - "Commit 전에 Mana와 최종 성공률 근거를 읽는다."
  - "Reveal 이후에도 W6에서 실제로 개선된 사실을 기억하고, 새 정보가 판단을 확장했다고 인식한다."
evidence_ceiling: INTERNAL_DESIGN_AND_CONTRACT_ONLY_UNTIL_HUMAN_TEST
```

## 3. 기존 권위와의 연결

### Stage 2 — 회로 배치

Stage 2는 기존 권위를 그대로 유지한다.

```text
Known 2 / Unknown 2 / Lens 1 확인
→ Main 1 + Auxiliary 0~5 FIVE_POINT_STAR 설계
→ BASE_SPELL_SUCCESS / 기본 효과 / 기본 예상 Mana Preview
→ 주문 확정
```

Stage 2의 계약은 `CIRCUIT_PREPARATION_BASE_PREVIEW_NO_TARGET`이다.

- Target 선택은 **금지**한다.
- 대상 난도·대상 저항을 반영한 최종 성공률을 보여주지 않는다.
- 회로를 확정해도 Mana는 소비하지 않는다.
- `시설복구`, `생명구조`, `정령안정`, `봉쇄` 같은 named intent/route 버튼을 제공하지 않는다.
- Lens는 UI 강조·도구 활용·문맥 읽기 affordance일 뿐 숨은 clue를 추가하지 않는다.

### Stage 3 — 주문 사용

Stage 3에서 처음으로 Target을 명시적으로 선택한다.

```text
explicit Target
→ BOUNDED_CONSEQUENCE_FORECAST
→ FINAL_TARGET_SUCCESS_BREAKDOWN
→ MANA_COST
→ EXPLICIT_COMMIT_REQUIRED
→ actual consequence
```

Target을 바꾸면 Forecast를 다시 계산한다. 사용 전까지 결과·Mana를 적용하지 않는다.

## 4. Bounded Consequence Forecast

화면의 중심 질문은 다음 하나다.

> **내가 아는 사실 기준으로, 이 주문을 이 대상에 쓰면 무엇이 좋아지고 무엇을 아직 장담할 수 없는가?**

Forecast는 네 구획을 사용한다.

### 4.1 KNOWN_IMPROVEMENT

`KNOWN_IMPROVEMENT`는 다음 자료에서 직접 정당화할 수 있는 변화만 보여준다.

```text
Observed Evidence 2
+ 현재 Target의 관찰 가능한 상태
+ 선택한 FIVE_POINT_STAR의 알려진 의미
+ 현재 사건의 공개 상태
```

허용 예:

- `관개 압력 감소 가능성이 높음`
- `뿌리 지지층의 추가 침수 압력을 낮출 수 있음`
- `현재 확인된 정령 충격을 넓게 완화하는 방향`

금지 예:

- 미조사 `OLD_REPAIR_RECORD`를 알고 있는 것처럼 결과를 확정한다.
- 미조사 `SPIRIT_TRACE`가 반드시 안전하다고 보장한다.
- 내부 ending/route label을 정답처럼 표시한다.

### 4.2 UNCERTAIN_CONSEQUENCE

`UNCERTAIN_CONSEQUENCE`는 **UNKNOWN_FACTS_NOT_INVENTED**를 따른다.

Unknown 2에 대해 게임은 구체적 숨은 사실이나 결과를 발명하지 않는다. 대신 현재 근거로 무엇을 장담할 수 없는지 범주 수준에서 알린다.

예:

- `정령 반응은 확인되지 않음`
- `과거 수복 구조와의 결합 영향은 미확인`
- `압력 근원이 직접 확인되지 않아 장기 안정은 보장할 수 없음`

Unknown은 다음으로 변환하지 않는다.

```text
hidden wrong-answer flag
hidden required clue
secret route lock
silent success-rate penalty presented as known certainty
post-hoc "you should have investigated X" punishment
```

미확인 요인이 실제 결과의 새 문맥으로 드러날 수는 있지만, Commit 전 UI가 그것을 이미 알고 있던 것처럼 숫자나 정답으로 위장하지 않는다.

### 4.3 FINAL_TARGET_SUCCESS_BREAKDOWN

Stage 3의 `FINAL_TARGET_SUCCESS_BREAKDOWN`은 **현재 확인 가능한 계산 근거**를 설명한다.

권장 구조:

```text
BASE_SPELL_SUCCESS
+ selected Target difficulty
+ observed current state
+ observed environmental resistance
= FINAL_TARGET_SUCCESS (known-information-conditioned)
```

미조사 사실은 별도 `UNCERTAIN_CONSEQUENCE`에 남기며, 확인된 modifier인 것처럼 Breakdown에 집어넣지 않는다.

숫자를 표시할 경우 `현재 확인 정보 기준`임을 분명히 한다. 확률을 표시하지 않는 품질 모드에서도 동일한 근거 순서는 유지한다.

### 4.4 MANA_COST

`MANA_COST`는 선택한 완성 주문 + Target 기준 최종 예상 비용이다.

- 사용 전에는 소비하지 않는다.
- 사용 시 exactly-once 소비한다.
- 숨은 추가 Mana를 사용 뒤 청구하지 않는다.
- Unknown 2는 `숨은 Mana surcharge`가 아니다.

## 5. 23~30분 흐름

시간은 Human test 전까지 `TEST_VALUE`다.

### 23:00–24:00 — Decision Brief

표시:

```text
Known 2
Unknown 2
Lens 1
현재 사건 상태 한 줄
```

여기서 정답 주문·Target·의도는 추천하지 않는다.

### 24:00–26:00 — Stage 2 · FIVE_POINT_STAR 설계

플레이어는 현재 사용 가능한 글자로 Main/Auxiliary를 배치하고 기본 Preview를 본다.

- Target 없음.
- `BASE_SPELL_SUCCESS`와 기본 의미를 읽는다.
- 주문 확정 전 자유롭게 수정·취소 가능하다.
- 이 단계가 두 주문을 나란히 점수화하는 optimizer가 되지 않는다.

### 26:00–28:30 — Stage 3 · Target + Forecast

플레이어가 Target을 직접 고른 뒤 다음 순서로 읽는다.

```text
Observed evidence
Target
Circuit effect
KNOWN_IMPROVEMENT
UNCERTAIN_CONSEQUENCE
FINAL_TARGET_SUCCESS_BREAKDOWN
MANA_COST
```

Target 변경 시 같은 주문의 Forecast를 다시 본다. UI는 `best target`, `recommended route`, `optimal intent`를 표시하지 않는다.

### 28:30–29:00 — Explicit Commit

`EXPLICIT_COMMIT_REQUIRED`.

사용 버튼은 다음을 한 문장으로 요약한다.

```text
이 주문을 [Target]에 사용한다.
확인된 기대: [Known Improvement]
미확인: [Uncertain Consequence]
비용: [Mana]
```

자동 시전, timeout 시전, Preview 진입만으로 시전하는 동작은 금지한다.

### 29:00–30:00 — Actual Consequence Receipt

성공적으로 수용된 W6 결과는 최소 한 실제 상태를 개선한다.

결과 Receipt는 다음만 우선 표시한다.

```text
실제로 개선된 것
지불한 비용 / 포기한 가치
아직 남은 불확실성
```

사후 분석 태그가 생성될 수는 있지만, 이를 “네가 선택한 정답 루트”로 되돌려 쓰지 않는다.

## 6. W6 writing event와 Commit

W6는 기존 `W1~W7` 중 여섯 번째 successful direct writing event이며, 이 child refinement는 총 작성 횟수를 늘리지 않는다.

- Preview 취소·Target 변경·회로 수정은 새로운 successful writing event를 추가하지 않는다.
- W6의 성공 기록은 기존 recovery accounting을 따른다.
- `major_five_point_star_commits_min: 2`는 유지되며 W6가 첫 major commit, W7이 새 문맥 아래 두 번째 major commit이다.

## 7. FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE

W6의 첫 수용 결과는 이후 Reveal/W7에서도 사실로 남아야 한다.

```text
W6: 실제 개선
→ Reveal: 새 coupling/context 발견
→ W7: 판단 수정
```

금지:

```text
W6: 실제로 아무 변화도 없었음
W6: 숨은 정답을 틀렸으므로 전부 롤백
W6: 새 정보 때문에 과거 개선 사실 자체가 거짓으로 변경
```

허용:

```text
W6로 압력은 실제 감소했다.
하지만 이후 정령 충격과의 결합이 드러나 추가 판단이 필요하다.
```

## 8. 내부 예시 — route가 아닌 Forecast 사례

아래는 기존 W6 consequence case를 Forecast 관점으로 재표현한 내부 예시다. 입력 route가 아니다.

| Case | Observed | Circuit + Target | KNOWN_IMPROVEMENT | UNCERTAIN_CONSEQUENCE | Preserved fact |
|---|---|---|---|---|---|
| A | pressure + root | FLOW+FOCUS → irrigation interface | 압력 감소·뿌리 안정 방향 | 정령 반응·과거 결합 미확인 | 실제 pressure reduction/root stability |
| B | spirit + pressure | DISPERSE+FOCUS → vent field | 충격·압력 완화 방향 | 뿌리 포화·과거 결합 미확인 | 실제 spirit shock/pressure reduction |
| C | root + old repair | PROTECT+FLOW → root barrier edge | 뿌리 보호·대피 시간 확보 방향 | 압력 근원·정령 반응 미확인 | 실제 root protection/evacuation time |

## 9. 대안과 폐기 이유

### A · Bounded Consequence Forecast — 승인

관찰 사실 기준으로 Known/Unknown을 분리한다. 기존 Stage 2/3 권위를 재사용하며 플레이어 조합을 보존한다.

### B · Explicit Priority Declaration — 미선택

`시설/생명/정령`을 먼저 고르게 하면 의도는 명확하지만, 실제 회로와 Target이 표현해야 할 판단을 named route 메뉴가 대신할 위험이 있다.

### C · Minimal Forecast / Cast-to-Learn — 미선택

성공률·Mana만 보여주고 효과를 숨기면 신비감은 커지지만 현재 Stage 3 상세 Preview와 충돌하고, Unknown이 불공정한 함정으로 체감될 가능성이 있다.

### D · Two-Draft Compare — 보류

전략 비교는 쉽지만 첫 세션 W6를 optimizer 화면으로 만들고 7분 목표의 인지부하를 높인다.

## 10. 5회 적대적 검토 계약

1. **정답 누출 공격** — Known Improvement가 사실상 best route를 말하고 있지 않은가?
2. **거짓 정밀도 공격** — Unknown을 알고 있는 숫자처럼 Success breakdown에 섞지 않았는가?
3. **의도 메뉴 회귀 공격** — 시설/생명/정령 버튼이 Circuit/Target을 대체하지 않는가?
4. **W6 무효화 공격** — Reveal 이후 W6의 실제 개선이 삭제되지 않는가?
5. **인지부하 공격** — 한 화면에서 두 주문·여러 Target·모든 결과축을 한꺼번에 최적화하게 만들지 않는가?

모든 패스에서 hard invariant 위반이 발견되면 W6 refinement는 `REWORK`다.

## 11. 재검토 조건

다음 중 하나가 Human Slice에서 관찰되면 A안을 재검토한다.

- 플레이어가 `UNCERTAIN_CONSEQUENCE`를 사실상 실패 경고/정답 힌트로 읽는다.
- 23~30분 W6가 7분 목표를 반복적으로 초과한다.
- `Known Improvement`가 회로/Target 선택을 사실상 자동화한다.
- 모바일에서 성공률 Breakdown과 Mana/위험을 동시에 읽기 어렵다.
- 플레이어가 W6 이후 “게임이 숨겨둔 정답 때문에 속았다”고 반복적으로 느낀다.

우선 조정 순서는 정보량 축소 → 문구/계층 개선 → 시간 재배분이다. `NO_NAMED_INTENT_ROUTE_BUTTONS`와 `FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE`는 장기 핵심 원칙으로 유지한다.

## 12. 증거 한계

현재 문서·fixture·자동 테스트는 구조, 권위, 정보 경계만 검증한다.

```yaml
actual_23_30_completion: NOT_RUN
forecast_comprehension: NOT_RUN
perceived_fairness: NOT_RUN
mobile_readability: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```
