# GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01 — 10~23분 Lens-only 자유준비·순차 조사

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01
sync_id: GR-SYNC-20260820-24-10-23-LENS-INVESTIGATION
approved_at_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
segment: MINUTE_10_TO_23
free_schedule_contract: FREE_SCHEDULE_LENS_ONLY
investigation_access: ALL_FOUR_INVESTIGATION_NODES_REMAIN_ACCESSIBLE
investigation_selection: SEQUENTIAL_PICK_2_OF_4
w6_entry_summary: KNOWN_2_UNKNOWN_2
w5_role: W5_FIRST_INVESTIGATION_NONCOMBAT_APPLICATION
clue_unlock_ownership: NO_CLUE_UNLOCK_OWNERSHIP
required_resource_ownership: NO_REQUIRED_RESOURCE_OWNERSHIP
answer_recommendation: NO_SPELL_CIRCUIT_TARGET_BEST_INTENT_RECOMMENDATION
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자는 2026-08-20 KST에 A안, 즉 **자유일정은 조사 단서를 잠금해제하지 않고 Lens/affordance만 바꾸며, 네 조사 노드는 모두 접근 가능하고 첫 조사 결과를 본 뒤 두 번째 조사 노드를 고르는 방식**을 승인했다.

이 결정은 46분 `SINGLE_INCIDENT_SPIRAL`, 기존 2-of-4 여섯 조합, W1~W7, W6/W7 major FIVE_POINT_STAR, 5축 Result를 교체하지 않는다. 첫 10분의 `수업 → 지도 현장실습 → Micro-Star 결과` 뒤 10~23분의 학습 전이를 더 자연스럽게 만드는 child refinement다.

## 2. Player Value Trace

```yaml
player_promise: "방금 배운 마법을 썼다는 이유만으로 정답을 받는 것이 아니라, 무엇을 준비하고 무엇부터 조사할지 스스로 정한다."
meaningful_choice: "출동 전 관점/affordance 1개를 고르고, 첫 조사에서 얻은 사실을 근거로 두 번째 조사 질문을 선택한다."
expected_experience: "준비가 내 관찰 방식을 바꿨다 → 첫 사실을 확인했다 → 남은 질문 중 무엇을 더 알아야 할지 내가 골랐다 → 완전하지 않은 정보로 W6 판단을 한다."
research_question: "신규 플레이어가 자유준비를 최적화 메뉴가 아니라 사건을 보는 관점으로 이해하고, 2-of-4 조사를 무작위 클릭이 아니라 질문 선택으로 경험하는가?"
observable_signal:
  - "자유일정 선택 이유를 수치 보너스보다 관점/도구/대화 방식으로 설명한다."
  - "첫 조사 결과를 본 뒤 두 번째 조사처를 선택한 이유를 말할 수 있다."
  - "W6 직전 확인한 사실 2개와 남은 불확실성 2개를 구분한다."
  - "선택하지 않은 조사처를 실패/누락 정답으로 오해하지 않는다."
evidence_ceiling: INTERNAL_DESIGN_HYPOTHESIS_UNTIL_HUMAN_PLAYTEST
slice_acceptance: "Human test에서 준비 선택의 의미, 조사 선택 이유, Known/Unknown 구분이 확인되면 유지; 아니면 10~23분만 재작업한다."
```

## 3. 10~23분 흐름

```text
10:00–14:00 출동 전 자유 준비 1회
→ 14:00–16:00 온실 진입 + 네 질문 범주 확인
→ 16:00–19:00 조사 1 + W5 비전투 현장 적용
→ 19:00–22:00 조사 2를 새 정보에 따라 순차 선택
→ 22:00–23:00 Known 2 / Unknown 2 간단 복기
→ 23:00 W6 첫 주요 FIVE_POINT_STAR 판단 진입
```

시간은 내부 목표 배분이다. 실제 사람이 이 시간에 이해·선택·작성할 수 있는지는 `NOT_RUN`이다.

## 4. 자유일정 — Lens/affordance만 변경

네 선택은 그대로 유지한다.

| 선택 | 바꾸는 것 | 바꾸지 않는 것 |
|---|---|---|
| REST | 정령 반응·불편 신호를 읽는 감정/상태 Lens | 새 사실 잠금해제, 필수 단서, 필수 자원 |
| PREPARE | 이미 가진 도구의 관찰/취급 affordance | 조사 노드 접근권, 필수 재료, 정답 조합 |
| SOCIAL | 사람·시설 보호가치에 대한 대화 Lens | 기계적 진실 독점, 특정 결말 권한 |
| PRACTICUM | 현장 취급 시 주의점·비교 관찰 Lens | 추가 Frostbloom 사실, 필수 압력 clue, 최적 루트 |

모든 선택은 `lens_only: true`, `owns_clue_unlock: false`다. 기존 선택형 PRACTICUM은 05~10의 필수 지도 현장실습과 다르며, **추가 실습을 통해 정보를 더 받는 우월 루트**가 아니다.

## 5. 조사 노드 — 위치보다 질문을 먼저 보여준다

네 노드는 그대로다. 단, 선택 전 UI/연출은 결과 보상이 아니라 질문 범주를 먼저 보여준다.

| Node | 플레이어에게 보이는 질문 |
|---|---|
| IRRIGATION_PRESSURE | `흐름은 어디서 어긋나고 있는가?` |
| ROOT_LAYER | `무엇이 피해를 받고 있으며 무엇을 지탱하고 있는가?` |
| SPIRIT_TRACE | `정령은 무엇에 반응하고 있는가?` |
| OLD_REPAIR_RECORD | `과거에는 무엇을 바꿨고 지금도 그 전제가 맞는가?` |

질문 문구는 해당 노드의 답을 미리 주지 않는다. `correct_route_id`, `required_spell`, `best_intent`, `mandatory_hidden_third_clue`를 노출하지 않는다.

## 6. 순차 2-of-4

기존 여섯 unordered pair의 유효성은 그대로 보존한다. 변경되는 것은 플레이 경험의 순서다.

```text
네 질문 모두 열림
→ 첫 질문 하나 선택
→ 실제 관찰 결과 확인
→ 남은 세 질문 중 두 번째 질문 선택
→ 두 사실을 확보
→ 선택하지 않은 두 질문은 실패가 아니라 명시적 불확실성으로 남음
```

두 번째 선택은 첫 선택 전에 미리 고정하지 않는다. 첫 조사 결과가 새 우선순위를 만들 수 있어야 한다. 그렇다고 첫 노드가 두 번째 노드를 자동 추천하거나 강제하지 않는다.

## 7. W5 위치

W5는 첫 조사에서 발생하는 `W5_FIRST_INVESTIGATION_NONCOMBAT_APPLICATION`이다.

- 이미 배운 의미를 실제 Frostbloom 조건에 비전투적으로 적용한다.
- 조사 정보를 얻기 위한 단순 열쇠가 아니다.
- W6 spell/circuit/target을 미리 결정하지 않는다.
- W4 지도 실습의 반복이 아니라 실제 사건 조건을 해석하는 필드 적용이다.

## 8. W6 직전 — Known 2 / Unknown 2

22~23분에는 복잡한 clue board나 점수표를 만들지 않는다.

```text
확인한 사실 2
+ 아직 확인하지 않은 질문/불확실성 2
+ 현재 자유준비 Lens/affordance 1
→ W6 설계 화면으로 이동
```

Unknown은 벌점이나 숨은 실패 조건이 아니다. 플레이어가 **무엇을 모르는 상태에서 결정하는지** 인식하게 하는 책임 정보다.

## 9. 대안 검토

### A. Lens-only — 승인

- 모든 조사 노드 접근권을 보존한다.
- 자유준비 선택은 관점/도구/대화 affordance만 바꾼다.
- 기존 anti-dominance와 6-pair matrix를 그대로 재사용한다.
- GRIMOIRE의 문맥·판단 중심 재미를 유지한다.

### B. Soft clue bias — 제외

- 선택 효과는 더 즉각적이다.
- 그러나 PREPARE/PRACTICUM이 선행 정보를 주면 최적화 루트가 형성되기 쉽다.
- 2-of-4의 잔여 불확실성을 선택 이전에 왜곡할 위험이 있다.

### C. Resource buff — 제외

- Mana/Timer/회복 등 체감은 분명하다.
- 그러나 첫 세션의 의사결정이 문맥 읽기보다 수치 효율 비교로 이동할 위험이 높다.

## 10. Benchmark disposition

이 승인안은 직전 동일 work unit에서 수행한 benchmark/industry research를 재사용한다. 범위와 핵심 가정이 변하지 않았으므로 fresh-research receipt 재사용 조건을 만족한다.

- **Outer Wilds 계열 탐색 원리 — ADAPT:** 지시받은 체크리스트보다 플레이어가 가진 질문이 다음 탐색을 이끌게 한다.
- **Pentiment 계열 조사 원리 — ADAPT:** 모든 사실을 확보한 뒤 정답을 제출하는 구조보다 불완전한 정보에서 판단과 책임을 남긴다.
- 직접 콘텐츠·표현·퀘스트 구조를 복제하지 않고 정보 선택 원리만 사용한다.

## 11. 5회 적대적 검토

### Loop 1 — 자유일정이 장식인가?

공격: clue도 resource도 주지 않으면 선택이 무의미할 수 있다.

대응: 각 선택은 사건 중 최소 한 번 관찰 가능한 Lens/affordance 차이를 만든다. 단, 사실 자체의 소유권은 갖지 않는다.

### Loop 2 — PRACTICUM/PREPARE가 다시 최적 루트가 되는가?

공격: 현장 관련 이름 때문에 플레이어가 이것을 정답 준비로 오해할 수 있다.

대응: 모든 선택에 같은 접근권을 유지하고 `owns_clue_unlock=false`; PRACTICUM은 새 clue가 아니라 처리 방식 비교 Lens다.

### Loop 3 — 조사 2-of-4가 무작위 클릭인가?

공격: 노드 이름만 보면 무엇을 얻는지 알 수 없어 선택이 맹목적이다.

대응: 결과가 아닌 **질문 범주**를 미리 보여준다. 첫 결과를 본 뒤 두 번째 질문을 고른다.

### Loop 4 — 정보가 너무 많아지는가?

공격: 네 질문, 자유일정 효과, W5, 단서, W6 준비를 한 화면에 쌓으면 인지부하가 커진다.

대응: W6 직전 요약은 `Known 2 / Unknown 2 / Lens 1`로 제한한다. 전체 clue tree를 첫 세션에 요구하지 않는다.

### Loop 5 — W6 정답이 새 UI에서 누출되는가?

공격: 질문 범주나 Lens가 특정 주문/대상과 연결되어 사실상 추천이 될 수 있다.

대응: `NO_SPELL_CIRCUIT_TARGET_BEST_INTENT_RECOMMENDATION`을 hard guard로 둔다. 조사 결과는 조건만 기술하고 해결 수단을 선택하지 않는다.

현재 내부 설계 판정: `STRUCTURAL_PASS / HUMAN_NOT_RUN`.

## 12. 장기 적합성·재검토 조건

이 구조는 장기적으로 `관찰 → 부분 지식 → 책임 있는 개정 → 마도서 복기`를 반복할 수 있어 1~3학년 성장 질문과 잘 맞는다.

재검토 조건:

1. Human test에서 자유일정 네 선택을 대부분 장식으로 느낀다.
2. 두 번째 조사 선택 이유를 설명하지 못하고 무작위 클릭이 반복된다.
3. Known/Unknown 요약이 오히려 정답 목록처럼 읽힌다.
4. PRACTICUM/PREPARE 선택률이 압도적이고 이유가 정보 우위 기대다.
5. 10~23분 구간이 13분 배분을 반복적으로 초과해 W6 진입을 지연한다.

그 전에는 clue unlock이나 resource buff를 추가하지 않는다.
