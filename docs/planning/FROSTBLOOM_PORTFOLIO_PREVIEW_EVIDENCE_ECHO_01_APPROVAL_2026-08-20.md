# GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01 — Portfolio / Preview Evidence Echo

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01
sync_id: GR-SYNC-20260820-28-PORTFOLIO-PREVIEW-EVIDENCE-ECHO
approved_at_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
segment: MINUTE_44_TO_46
contract: EVIDENCE_ECHO_ONE_OPEN_QUESTION
mentor_contract: MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT
portfolio_contract: PORTFOLIO_RECEIPT
open_question_contract: OPEN_QUESTION_NOT_OBJECTIVE
festival_contract: FESTIVAL_PREVIEW_ONLY
session_end_contract: NO_NEW_GAMEPLAY_DECISION
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자는 2026-08-20 KST에 마지막 44~46분 Portfolio / Preview의 권장 A안 **Evidence Echo + One Open Question**을 승인하고 연속 진행을 요청했다.

이 결정은 새 평가 시스템이나 후속 퀘스트 시스템을 만드는 것이 아니다. 39~44분 Result / Grimoire에서 이미 정리한 결과·인과·플레이어 원리를 반복 채점하지 않고, **게임이 플레이어의 실제 행동을 기억하고 있음을 짧게 인정한 뒤 세션을 닫고 다음 세계에 대한 궁금증만 남기는 마감 계약**이다.

## 2. 플레이어 약속

```yaml
player_promise: "멘토는 내가 실제로 한 일을 기억해 되돌려주지만, 내 선택을 정답/오답 점수로 다시 평가하지 않는다."
closing_experience: "내 원리와 실제 사건 결과가 저장되었다는 감각을 얻고, 다음에는 무엇을 더 알아볼 수 있을지 질문 하나만 품은 채 세션을 끝낸다."
evidence_ceiling: STRUCTURAL_ONLY_UNTIL_HUMAN_DEVICE_TEST
```

## 3. 44~46분 흐름

```text
44:00~44:40  MAREN_EVIDENCE_ECHO
44:40~45:10  PORTFOLIO_RECEIPT
45:10~46:00  ONE_OPEN_QUESTION + FESTIVAL_GLIMPSE
```

위 배분은 Human Slice용 가역적 `TEST_VALUE`다. 46분 상위 종료 목표를 유지하는 범위에서 Human test 후 조정할 수 있다.

## 4. 44:00~44:40 · Maren Evidence Echo

### 4.1 역할

Maren의 마지막 반응은 `MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT`다.

```yaml
max_echo_elements: 3
source_scope: ACTUAL_RECEIPTS_ONLY
allowed_echo_slots:
  - PLAYER_PRINCIPLE
  - ACTUAL_IMPROVEMENT_OR_COST
  - DISCOVERY_OR_UNRESOLVED_TENSION
new_fact: FORBIDDEN
mentor_grade: NO_MENTOR_GRADE
result_rescore: NO_RESULT_RESCORING
hidden_portfolio_score: FORBIDDEN
hidden_best_answer: FORBIDDEN
```

Maren은 실제 기록에서 최대 세 요소만 되받아준다.

예시 구조:

```text
"네가 붙인 원리는 [player principle]이군."
"이번에 실제로 [improvement/cost]가 남았고,"
"[discovery/unresolved tension]은 아직 열린 문제다."
```

위 문구는 구조 예시일 뿐 최종 대사 정본이 아니다.

멘토는 다음을 말하지 않는다.

```text
정답이었다 / 틀렸다
최고의 해법이었다
A/B/C 등급
이번 선택은 90점
다음에는 반드시 X를 써라
사실 숨은 최적해는 Y였다
```

39~44분의 `NO_GLOBAL_SUCCESS_GRADE`, `CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY`, `PRINCIPLE_NOT_GRADED`를 우회하지 않는다.

## 5. 44:40~45:10 · Portfolio Receipt

Portfolio Receipt는 결과 화면의 재방송이 아니라 **저장 확인**이다.

```yaml
contract: PORTFOLIO_RECEIPT
fields:
  - principle_saved
  - causal_evidence_linked
  - unresolved_tension_carried
replay_five_axis_result: false
replay_full_causal_thread: false
new_grade: false
new_reward_track: false
```

플레이어가 확인해야 하는 것은 세 가지다.

1. 내가 붙인 원리가 저장되었다.
2. 그 원리가 실제 사건의 관찰/회로/Target/결과와 연결되어 있다.
3. 끝까지 해결하지 않은 긴장·불확실성도 지워지지 않고 기록된다.

이 Receipt는 Year-One portfolio의 장기 평가 숫자를 표시하거나 이번 사건을 새 점수로 환산하지 않는다.

## 6. 45:10~46:00 · One Open Question

### 6.1 질문의 소스

마지막 질문은 현재 플레이어가 실제로 확인한 `DISCOVERY` 또는 `Remaining Uncertainty`에서만 파생한다.

```yaml
contract: OPEN_QUESTION_NOT_OBJECTIVE
source_scope: OBSERVED_DISCOVERY_OR_REMAINING_UNCERTAINTY_ONLY
count: 1
quest_marker: false
reward: false
required_tracking: false
choice_branch: false
mandatory_followup: false
```

질문은 다음 세션의 curiosity hook이다. 새 quest/objective가 아니다.

가능한 형태:

```text
"같은 원리가 다른 장소에서도 성립할까?"
"정령이 반응한 것은 흐름 자체였을까, 변화의 속도였을까?"
"이번에 남긴 제약은 다음 문맥에서는 비용일까 안전장치일까?"
```

이 예시도 정답 질문 목록이 아니라 표현 범위 예시다.

금지:

```text
새 퀘스트 마커
보상 수치
필수 추적 체크박스
다음 조사 2~4개 선택
다음 route 잠금/해금
```

## 7. Festival Glimpse

기존 상위 정본의 Festival은 계속 `PREVIEW_ONLY`다.

```yaml
contract: FESTIVAL_PREVIEW_ONLY
glimpse_count: 1
allowed_channels:
  - VISUAL
  - AUDIO
  - SHORT_DIALOGUE
playable: false
second_incident: NO_SECOND_INCIDENT
new_tutorial: FORBIDDEN
required_system_intro: FORBIDDEN
lore_dump: NO_LORE_DUMP
```

Festival glimpse는 학교가 이번 사건 이후에도 살아 있고 더 넓은 생활·관계·마법 문맥이 있다는 감각만 준다. 플레이어를 Festival gameplay로 넘기지 않는다.

예를 들어 다음 중 **한 가지 정도의 짧은 감각**이면 충분하다.

- 복도 끝에 준비 중인 장식과 멀리 들리는 연주.
- 학생들이 축제용 마법 회로를 시험하는 짧은 배경 연출.
- 동급생이 “축제 때 그 원리도 써볼 수 있을까?”라고 흘리는 한 문장.

새 NPC 소개, 시스템 튜토리얼, 행사 선택, 두 번째 사건 발단을 동시에 넣지 않는다.

## 8. 세션 종료 입력

```yaml
contract: NO_NEW_GAMEPLAY_DECISION
allowed_input_role: SESSION_CLOSE_CONFIRMATION_ONLY
next_quest_choice: false
new_branch_selection: false
new_gameplay_decision: false
```

`계속`, `마도서 닫기`, `세션 종료`와 같은 확인 입력은 허용한다. 전략적 선택·후속 임무 선택을 요구하지 않는다.

## 9. Existing Solution First

재사용:

```text
39~44 Five-Axis Result / Causal Thread / Player Principle receipt
existing Portfolio evidence semantics
Maren mentor role
Festival PREVIEW_ONLY
existing Discovery / Remaining Uncertainty
```

새로 만들지 않음:

```text
mentor grade engine
result rescoring layer
hidden portfolio incident score
quest generator
next-inquiry branch selector
second incident
festival gameplay
new tutorial
new reward track
```

## 10. 대안 비교

### A · Evidence Echo + One Open Question — 승인
- 실제 행동에 대한 반응성과 세션 소유감을 가장 잘 보존한다.
- 채점/새 퀘스트 없이 다음 궁금증을 남긴다.
- 기존 PREVIEW_ONLY 경계와 2분 cap에 가장 잘 맞는다.

### B · Mentor Evaluation + Teaser — 기각
- 명료하지만 멘토가 Result/Grimoire 위에 새 최종 등급을 씌울 위험이 있다.

### C · Cinematic Festival Stinger — 기각
- 연출 후킹은 강하지만 직전 플레이어 원리·대가·인과를 덮고 광고성 마감이 될 위험이 있다.

### D · Next-Inquiry Choice Hook — 기각
- agency는 높지만 새 branch/objective authority를 만들고 첫 세션 종료를 늦춘다.

## 11. Fresh benchmark disposition

Research receipt:

`docs/planning/research/2026-08-20-portfolio-preview-evidence-echo-research-receipt.md`

Pattern-level disposition:

- **Hades**: ADAPT — 플레이어 행동을 기억하고 반응해 “게임이 내 행동을 보고 있다”는 감각을 만드는 reactive acknowledgement.
- **Outer Wilds**: ADAPT — 명시적 임무가 아니라 열린 질문과 curiosity가 다음 탐색 동력이 되는 구조.
- **Heaven's Vault**: ADAPT — 선택·경로를 기억하고 인물/서사가 반응하되 해석을 단일 정답으로 즉시 고정하지 않는 구조.
- **Pentiment**: REFERENCE_ONLY — 선택의 결과가 이후 공동체에 남는 consequence continuity. 이번 2분에는 대규모 결과 설명을 복제하지 않는다.

콘텐츠·대사·UI 표현을 복제하지 않는다.

## 12. 5회 전체 적대적 검토

### Pass 1 · 숨은 채점 공격

공격:
- Maren의 “좋았다/아쉬웠다”가 사실상 최종 등급이 되는가?

가드:
- `MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT`.
- `NO_MENTOR_GRADE`.
- 실제 receipt를 되받아주는 묘사만 허용한다.

판정: STRUCTURAL_PASS.

### Pass 2 · 결과 재점수화 공격

공격:
- Portfolio Receipt가 5축 Result를 다시 합산하거나 최종 성과점수로 바꾸는가?

가드:
- `NO_RESULT_RESCORING`.
- Receipt는 `principle_saved / causal_evidence_linked / unresolved_tension_carried` 존재 확인만 한다.

판정: STRUCTURAL_PASS.

### Pass 3 · 열린 질문 퀘스트화 공격

공격:
- 질문 1개가 사실상 next quest marker가 되는가?

가드:
- `OPEN_QUESTION_NOT_OBJECTIVE`.
- reward / tracking / branch / mandatory followup 모두 false.

판정: STRUCTURAL_PASS.

### Pass 4 · Festival scope-creep 공격

공격:
- Preview가 실제 Festival gameplay, 두 번째 사건, 신규 튜토리얼로 자라는가?

가드:
- `FESTIVAL_PREVIEW_ONLY`.
- `NO_SECOND_INCIDENT`.
- `NO_LORE_DUMP`.
- glimpse 1개로 제한한다.

판정: STRUCTURAL_PASS.

### Pass 5 · 2분 과부하 공격

공격:
- mentor feedback + portfolio + hook + festival + 선택지를 모두 넣어 46분 종료가 무너지는가?

가드:
- echo 최대 3요소.
- receipt 3필드.
- open question 1개.
- festival glimpse 1개.
- `NO_NEW_GAMEPLAY_DECISION`.

판정: STRUCTURAL_PASS; 실제 2분 달성은 NOT_RUN.

## 13. 재검토 조건

Human/Device test에서 다음이 확인되면 배분·표시량을 재검토한다.

- Maren의 반응을 플레이어가 채점/도덕평가로 읽음.
- Portfolio Receipt가 불필요한 반복으로 느껴짐.
- 열린 질문을 플레이어가 반드시 수행해야 할 quest로 오인함.
- Festival glimpse가 직전 사건의 감정적 마감을 덮음.
- 2분 cap을 반복적으로 초과함.

재검토 전에도 상위 invariant는 유지한다: **비채점 mentor echo / 저장 확인만 하는 Portfolio / objective 아닌 질문 / Festival PREVIEW_ONLY / 새 gameplay decision 없음**.

## 14. Evidence ceiling

```text
STRUCTURAL_DESIGN: PASS
TDD_CONTRACT: REQUIRED
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
FUN_VERIFIED: NO
TWO_MINUTE_COMPLETION_VERIFIED: NO
```
