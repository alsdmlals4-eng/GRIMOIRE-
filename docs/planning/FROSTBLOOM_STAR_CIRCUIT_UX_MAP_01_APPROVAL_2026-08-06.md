# Frostbloom 별형 회로 UX Map 01 승인

```yaml
status: USER_AUTHORIZED_IMPLEMENTATION_DEFAULT
parent_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
scenario: FROSTBLOOM_GREENHOUSE
professor_example_is_answer: false
NO_BEST_ROUTE_RECOMMENDATION: true
human_validation: NOT_RUN
```

## 목적

Frostbloom 사건을 교수의 정답 주문 복사 튜토리얼이 아니라, 조사한 단서와 플레이어가 정한 우선순위에 따라 여러 합리적 주문을 설계하는 대표 상황으로 사용한다.

## UX 흐름

```text
SITUATION_BRIEF
→ INVESTIGATE_CLUES
→ CHOOSE_INTENT
→ BUILD_FIVE_POINT_STAR_CIRCUIT
→ CIRCUIT_PREVIEW
→ SELECT_TARGET_KEYWORD
→ FINAL_PREVIEW
→ EXPLICIT_COMMIT
→ NPC_AND_ENVIRONMENT_REACTION
→ GRIMOIRE_RECORD
```

- 선택지는 완성 주문이 아니라 해결 의도를 확인한다.
- 대상 키워드는 조사로 열리며 회로 Preview 이후 선택한다.
- 최종 Preview는 효과 범주·마나·성공률·위험을 보여주되 결말을 공개하지 않는다.
- 교수 회로와 같다는 이유로 보너스나 채점 우대를 주지 않는다.

## 해결 의도

### FACILITY_REPAIR

시설·결계·관수 장치를 복구한다. 생명 구조나 정령 안정화가 지연될 수 있다.

### LIFE_RESCUE

학생·소환수·Frostbloom 생명체를 우선한다. 시설 손상이 남을 수 있다.

### SPIRIT_STABILIZATION

빙결 정령과 마나 흐름을 진정시킨다. 즉각적인 시설 복구보다 장기 안정성을 선택한다.

### CONTAIN_AND_EVACUATE

확산을 막고 안전한 철수 경로를 만든다. 사건 자체를 즉시 해결하지 않을 수 있다.

### SUPPRESS_AND_BUY_TIME

위협을 일시 억제해 추가 행동 시간을 확보한다. 자원과 후속 위험을 감수한다.

### REASONABLE_UNREGISTERED_SOLUTION

관찰된 단서와 주문 문법을 지키는 플레이어 고유 해법을 허용한다. 등록된 다섯 의도와 다르다는 이유만으로 거부하지 않는다.

## 키워드 예시

```yaml
facility: [ward, heater, irrigation]
life: [student, familiar, frostbloom]
spirit: [ice_spirit, mana_current, root_network]
containment: [door, corridor, greenhouse_boundary]
suppression: [cold_surge, fracture, pressure_point]
```

키워드는 정답 점수표가 아니라 실제 대상으로 사용한다.

## 반응 계약

결과는 다음 축을 독립적으로 갱신한다.

- NPC 안전과 신뢰.
- 시설 상태.
- Frostbloom 생존·손상.
- 정령 안정도.
- 확산 정도와 남은 시간.
- 사용 글자 숙련 근거와 실패 원인.

같은 결과 등급이라도 선택한 의도와 대상에 따라 환경·NPC 반응이 달라질 수 있다.

## 금지

- `NO_BEST_ROUTE_RECOMMENDATION`.
- 교수 예시 자동 복사.
- 교수와 같은 회로에 숨은 보너스.
- 자동 대상·자동 Commit.
- Preview에서 결말·정답 공개.
- 등록되지 않은 합리적 해법의 자동 거부.

## 검증 경계

Fixture와 상태 흐름은 자동 검증한다. 실제 서사 만족도, 선택 이해도, NPC 반응의 감정적 설득력은 `HUMAN_NOT_RUN`이다.
