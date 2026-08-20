# GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01 — Result / Grimoire Layered Causal Debrief

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01
sync_id: GR-SYNC-20260820-27-RESULT-GRIMOIRE-CAUSAL-DEBRIEF
approved_at_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
segment: MINUTE_39_TO_44
contract: LAYERED_CAUSAL_DEBRIEF_PLAYER_PRINCIPLE
result_phase: FIVE_AXIS_RESULT_SNAPSHOT
causal_thread_contract: CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY
unobserved_cause_contract: UNOBSERVED_CAUSE_FORBIDDEN
debrief_contract: COST_FORGONE_DISCOVERY_SEPARATE
intent_tags_contract: INTENT_TAGS_DERIVED_NEUTRAL
player_principle_contract: SHORT_PLAYER_PRINCIPLE_NAMING
system_principle_contract: SYSTEM_DOES_NOT_AUTHOR_PRINCIPLE
principle_grade_contract: PRINCIPLE_NOT_GRADED
principle_reward_contract: NO_IMMEDIATE_STAT_BONUS_FROM_PRINCIPLE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자는 2026-08-20 KST에 39~44분 Result / Grimoire의 권장 A안 **Layered Causal Debrief + Player Principle**을 승인하고 연속 진행을 요청했다.

이 결정은 새로운 결과 판정기나 저널 시스템을 만드는 것이 아니다. 기존 Frostbloom의 5축 Result, W6/W7 actual receipt, 기존 Grimoire causal-record 필드를 그대로 사용하면서 **정보를 어떤 순서로 보여주고 어디까지 시스템이 정리하며 어디서 플레이어가 자기 언어를 붙이는지**를 정하는 child refinement다.

## 2. 플레이어 약속

```yaml
player_promise: "게임은 내가 실제로 만든 결과와 그 원인을 정리해 주지만, 이 사건에서 내가 무엇을 배웠는지는 대신 정답으로 써주지 않는다."
meaningful_reflection: "나는 결과를 총점이 아니라 여러 축의 변화, 대가, 발견, 내가 고른 회로와 Target의 인과로 다시 읽고 마지막에 내 원리명을 붙인다."
expected_experience: "잘한 것과 놓친 것, 남은 tradeoff가 동시에 보이고 내 선택이 왜 이런 결과를 만들었는지 추적할 수 있다."
evidence_ceiling: STRUCTURAL_ONLY_UNTIL_HUMAN_DEVICE_TEST
```

## 3. 39~44분 흐름

```text
39:00~40:00  FIVE_AXIS_RESULT_SNAPSHOT
40:00~42:00  CAUSAL_THREAD
42:00~43:00  COST / FORGONE VALUE / DISCOVERY
43:00~44:00  SHORT_PLAYER_PRINCIPLE_NAMING
```

위 시간은 Human Slice용 가역적 `TEST_VALUE`다. 46분 상위 목표와 44~46 Preview를 보존하는 범위에서 Human test 후 조정할 수 있다.

## 4. 39~40 · Five-Axis Result Snapshot

### 4.1 고정 축

```text
FACILITY
LIFE
SPIRIT
RELATIONSHIP
DISCOVERY
```

각 축은 독립적으로 결과를 보여준다.

```yaml
result_contract: FIVE_AXIS_RESULT_SNAPSHOT
global_success_grade: NO_GLOBAL_SUCCESS_GRADE
global_total_score: FORBIDDEN
star_rating: FORBIDDEN
mixed_result_preservation: REQUIRED
all_positive_result_still_not_collapsed: REQUIRED
```

### 4.2 왜 한 점수로 합치지 않는가

Frostbloom의 핵심은 하나의 정답 루트를 찾는 것이 아니라 어떤 상태를 개선했고 어떤 비용·불확실성·관계를 남겼는지 이해하는 것이다. `FACILITY +2 / LIFE +1 / SPIRIT -1 / RELATIONSHIP 0 / DISCOVERY +2` 같은 결과를 “B급 성공”으로 압축하면 플레이어가 실제로 만든 tradeoff와 W7의 이유가 사라진다.

따라서 다음은 금지한다.

```text
SUCCESS_GRADE
TOTAL_SCORE
STAR_RATING
PERFECT / GOOD / BAD ending grade
single win/lose badge replacing five axes
```

## 5. 40~42 · Causal Thread

### 5.1 시스템이 자동 정리하는 것

Causal Thread는 새로운 원인을 추론하지 않고 **이미 게임이 실제로 기록한 receipt를 시간순·인과순으로 연결**한다.

```yaml
contract: CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY
ordered_fields:
  - observations
  - w6_meaning_and_circuit
  - w6_selected_target
  - w6_actual_result
  - post_w6_context_delta
  - w7_changed_judgment
  - w7_actual_result
unobserved_cause: UNOBSERVED_CAUSE_FORBIDDEN
```

플레이어가 보게 되는 질문은 다음과 같다.

> “내가 무엇을 확인했고, 그 근거로 무엇을 설계했으며, 실제로 무엇이 바뀌었고, 새 문맥 때문에 무엇을 다시 판단했는가?”

### 5.2 인과 소스 경계

허용 소스:

```text
실제로 방문한 조사 노드의 observation receipt
W5 field-use receipt
W6 FIVE_POINT_STAR / Target / actual consequence receipt
W6 preserved fact
post-W6 deeper revision coupling receipt
W7 changed judgment / FIVE_POINT_STAR / Target / actual consequence receipt
```

금지:

```text
방문하지 않은 조사 노드의 숨은 정답
미관찰 old repair 사실
시스템이 사후에 꾸며낸 motive
"사실 최적해는 이것이었다" 식의 hidden route explanation
결과를 도덕적 정답으로 재해석하는 문장
```

미관찰 정보가 최종 사건에서 여전히 미지라면 원인으로 쓰지 않고 `remaining uncertainty`로만 남긴다.

## 6. 42~43 · Cost / Forgone / Discovery

### 6.1 결과와 대가를 섞지 않는다

```yaml
debrief_contract: COST_FORGONE_DISCOVERY_SEPARATE
actual_result: SEPARATE\ side_effects_and_forgone_values: SEPARATE
discoveries: SEPARATE
remaining_uncertainty: PRESERVE_IF_ANY
```

표시 의미:

- **Actual Result**: 실제로 좋아지거나 악화된 상태.
- **Cost / Forgone Value**: Mana를 포함한 이미 발생한 비용, 더 강하게 밀어붙이지 않아 포기한 가치, 남겨 둔 제약.
- **Discovery**: 사건을 통해 새로 알게 된 관계·원리 후보.
- **Remaining Uncertainty**: 끝까지 관찰되지 않은 사실 또는 아직 확인할 수 없는 관계.

이 분리는 플레이어가 “좋아진 것이 많으니 부작용은 무시해도 된다” 또는 “부작용이 있었으니 전부 실패다”라고 한 덩어리로 읽지 않게 한다.

### 6.2 intent tag

`intent_tags`는 사후에 실제 행동에서 파생되는 중립 descriptor다.

```yaml
intent_tags_contract: INTENT_TAGS_DERIVED_NEUTRAL
input_selector: false
moral_score: false
correctness_grade: false
route_id: false
```

예: `restore flow`, `limit state shock`, `protect root zone` 같은 문구는 기록을 찾기 쉽게 하는 descriptor일 뿐 “올바른 플레이 스타일” 점수가 아니다.

## 7. 43~44 · Player Principle Naming

### 7.1 시스템이 사실을 정리하고 플레이어가 원리를 명명한다

```yaml
contract: SHORT_PLAYER_PRINCIPLE_NAMING
system_authors_principle: false
prewritten_correct_principle_cards: false
graded: false
immediate_stat_bonus: false
hidden_correctness_score: false
```

플레이어는 직전 네 레이어를 본 뒤 **짧은 원리명/문구 1개**를 자기 언어로 붙인다.

예시는 QA용 내부 예시일 뿐 실제 UI의 선택지가 아니다.

```text
"안정된 흐름에는 정령 여유가 필요하다"
"분산에는 안전한 도착지가 필요하다"
"보호에는 빠져나갈 길이 필요하다"
```

시스템은 이 문구를 정답 문장으로 자동 생성하지 않는다. 단어 자동완성·입력기 같은 접근성 구현 여부는 나중 UI work unit의 문제이며, planning canon에서는 **내용의 저자(author)는 플레이어**라는 경계만 고정한다.

### 7.2 왜 채점하지 않는가

첫 세션에서 원리명을 즉시 채점하거나 스탯 보너스에 연결하면 플레이어는 다시 “개발자가 원하는 문구”를 추측하게 된다. 이 단계의 목적은 이해의 외화와 다음 상황에서 다시 볼 수 있는 개인 기록이다.

따라서:

```text
PRINCIPLE_NOT_GRADED
NO_IMMEDIATE_STAT_BONUS_FROM_PRINCIPLE
NO_HIDDEN_MORAL_SCORE
NO_CORRECT_WORDING_REWARD
```

후속 성장 시스템이 장기적으로 Grimoire 기록의 존재나 다양성을 참고할 수 있는지는 별도 승인 대상이며 이 결정이 소유하지 않는다.

## 8. Progressive Disclosure

8개 기존 Grimoire 필드를 한 화면에 동시에 펼치지 않는다.

```text
RESULT
→ WHY
→ COST / FORGONE / DISCOVERY
→ PRINCIPLE
```

이는 정보 자체를 삭제하는 것이 아니라 **한 번에 읽어야 할 질문을 하나씩 줄이는 표시 계약**이다.

모바일 landscape에서 실제 스크롤 길이·폰트·키보드 부담·44분 달성은 Device/Human test 전까지 확정하지 않는다.

## 9. Existing Solution First

재사용:

```text
Frostbloom five-axis result authority
existing Grimoire causal record fields
W6 actual receipt + preserved fact
W7 context delta + changed judgment + actual receipt
AtomicResultLedger semantics where applicable
```

새로 만들지 않음:

```text
result engine
SUCCESS_GRADE engine
journal database authority
morality meter
principle correctness scorer
route selector
new currency
new reward track
```

## 10. Fresh benchmark disposition

Research receipt:

`docs/planning/research/2026-08-20-result-grimoire-causal-debrief-research-receipt.md`

Pattern-level disposition:

- **Outer Wilds**: ADAPT — discoveries를 기록·조직하지만 mystery answer를 대신 주지 않는 journal/detective-board 역할.
- **Return of the Obra Dinn**: ADAPT — 대량 사건 정보를 chronology와 clues로 조직하는 book metaphor.
- **Chants of Sennaar**: ADAPT — notebook이 관찰·문맥을 돕고 deduction의 저자는 플레이어로 남는 경계.
- **Heaven's Vault**: REFERENCE / ADAPT BOUNDARY — 현재 해석을 기억하되 즉시 객관적 정답으로 확정하지 않는 불확실성 보존.

콘텐츠·문구·UI 표현을 복제하지 않는다.

## 11. 5회 전체 적대적 검토

각 회차는 전체 39~44 state를 다시 공격한다.

### Pass 1 · 점수 축약 공격

공격:
- mixed result를 보기 좋게 `A/B/C` 또는 별점 하나로 줄일 유혹이 있는가?

수정/가드:
- `NO_GLOBAL_SUCCESS_GRADE`.
- 5축은 항상 독립 표시.
- 모두 양수인 case도 total score로 합치지 않는다.

판정: STRUCTURAL_PASS.

### Pass 2 · 인과 발명 공격

공격:
- Grimoire가 플레이어가 조사하지 않은 사실까지 사후 해설로 채우는가?

수정/가드:
- `CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY`.
- `UNOBSERVED_CAUSE_FORBIDDEN`.
- 미관찰 정보는 uncertainty로만 남긴다.

판정: STRUCTURAL_PASS.

### Pass 3 · 자동 결론 공격

공격:
- 시스템이 “이번 교훈은 X”를 자동 작성해 player_naming을 형식적으로 만드는가?

수정/가드:
- `SYSTEM_DOES_NOT_AUTHOR_PRINCIPLE`.
- prewritten correct-principle card 없음.

판정: STRUCTURAL_PASS.

### Pass 4 · 정보벽 공격

공격:
- 기존 8개 Grimoire field와 5축 결과를 한 화면에 동시에 던지는가?

수정/가드:
- `Result → Why → Cost/Forgone/Discovery → Principle` progressive disclosure.
- 각 단계는 하나의 중심 질문만 가진다.

판정: STRUCTURAL_PASS; 실제 mobile readability는 NOT_RUN.

### Pass 5 · 숨은 도덕·최적화 점수 공격

공격:
- intent tag, relationship, tradeoff, principle wording에 숨은 good/bad score나 즉시 보상을 붙이는가?

수정/가드:
- `INTENT_TAGS_DERIVED_NEUTRAL`.
- `PRINCIPLE_NOT_GRADED`.
- `NO_IMMEDIATE_STAT_BONUS_FROM_PRINCIPLE`.

판정: STRUCTURAL_PASS.

## 12. 재검토 조건

다음 중 하나가 Human/Device test에서 나타나면 이 39~44분 배분과 표시 순서를 재검토한다.

- 5축의 의미를 1분 내 읽지 못함.
- Causal Thread를 “시스템이 정답을 알려주는 화면”으로 오인함.
- Cost/Forgone/Discovery 구분이 중복·혼란으로 느껴짐.
- 원리명 입력 때문에 first-session pacing 또는 mobile keyboard 부담이 과도함.
- 플레이어가 원리명을 자기 선택의 복기로 쓰지 않고 정답 문구 맞히기로 인식함.

재검토 전까지 상위 invariant는 유지한다: **5축 독립 결과 / observed-only causality / player-authored principle / no scalar grade**.

## 13. Evidence ceiling

```text
STRUCTURAL_DESIGN: PASS
TDD_CONTRACT: REQUIRED
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
FUN_VERIFIED: NO
FIVE_MINUTE_COMPLETION_VERIFIED: NO
```
