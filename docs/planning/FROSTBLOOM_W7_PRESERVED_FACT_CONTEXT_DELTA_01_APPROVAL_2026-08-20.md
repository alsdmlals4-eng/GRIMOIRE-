# GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01 — W7 보존 사실 + 문맥 변화 재설계

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
sync_id: GR-SYNC-20260820-26-W7-PRESERVED-FACT-CONTEXT-DELTA
approved_at_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
segment: MINUTE_30_TO_39
reveal_contract: PRESERVED_FACT_CONTEXT_DELTA
first_phase: W6_RESULT_ANCHOR
new_context_source: POST_W6_DEEPER_REVISION_COUPLING
summary_fields: STILL_TRUE_NEWLY_LEARNED_NEW_TENSION
redesign_contract: MEANINGFUL_JUDGMENT_CHANGE_REQUIRED
number_only_contract: NO_NUMBER_ONLY_AMPLIFICATION
old_repair_contract: NO_OLD_REPAIR_RECORD_REPLAY
rollback_contract: NO_W6_ROLLBACK
route_contract: NO_NAMED_CORRECT_ROUTE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자는 2026-08-20 KST에 W7 권장 A안 **Preserved Fact + Context Delta**를 승인하고 연속 진행을 요청했다.

W7의 목적은 W6를 오답으로 뒤집는 것이 아니다. 플레이어가 W6에서 실제로 개선한 사실을 먼저 보존한 뒤, **W6가 세계 상태를 바꿨기 때문에 새로 관찰 가능해진 deeper revision coupling**을 공개하고, 그 새 문맥 때문에 다음 주문 설계의 판단 구조를 바꾸게 하는 것이다.

## 2. 플레이어 약속

```yaml
player_promise: "내 첫 해결은 실제로 효과가 있었다. 다만 세계를 바꾸자 이전에는 보이지 않던 연결이 드러났고, 이제 그 사실까지 포함해 다시 판단해야 한다."
meaningful_choice: "같은 주문을 더 세게 반복하는 대신 새 coupling을 보고 회로·Target·tradeoff·사용 문맥 중 무엇을 바꿀지 결정한다."
expected_experience: "내 선택이 무효화된 것이 아니라 지식이 늘어 판단 기준이 진화했다."
research_question: "플레이어가 W6의 성취와 W7의 재설계를 동시에 사실로 받아들이는가?"
evidence_ceiling: STRUCTURAL_ONLY_UNTIL_HUMAN_DEVICE_TEST
```

## 3. 30~39분 흐름

```text
30:00~31:00  W6_RESULT_ANCHOR
31:00~33:00  POST_W6_DEEPER_REVISION_COUPLING reveal
33:00~35:00  STILL_TRUE / NEWLY_LEARNED / NEW_TENSION
35:00~38:00  W7 redesign with existing FIVE_POINT_STAR + Stage 2/3
38:00~39:00  explicit W7 Commit
```

각 시간은 Human Slice에서 조정할 `TEST_VALUE`이며 실제 9분 달성 증거가 아니다.

## 4. W6 Result Anchor

Reveal보다 먼저 W6의 실제 결과를 짧게 고정 표시한다.

예:

```text
STILL TRUE — W6에서 실제로 일어난 개선
- 압력이 낮아졌다.
- 특정 뿌리 구역이 안정됐다.
- 정령 충격이 줄었다.
```

표시하는 사실은 실제 W6 consequence receipt에서 나온 것만 사용할 수 있다.

Hard invariant:

```text
W6_RESULT_ANCHOR
FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
NO_W6_ROLLBACK
```

Reveal 이후에도 이 사실은 삭제·실패 전환·거짓 판정되지 않는다.

## 5. Deeper Revision Reveal

Reveal은 10~23분의 네 조사 노드 중 `OLD_REPAIR_RECORD`를 다시 읽게 하는 장면이 아니다.

```text
FORBIDDEN: OLD_REPAIR_RECORD_REPLAY
REQUIRED: POST_W6_DEEPER_REVISION_COUPLING
```

새 정보는 **W6 이후의 상태 변화가 없었다면 관찰하기 어려웠던 coupling**이어야 한다.

따라서:

- 앞서 OLD_REPAIR_RECORD를 조사한 플레이어에게도 새 정보다.
- 앞서 OLD_REPAIR_RECORD를 조사하지 않은 플레이어에게도 누락 벌점 없이 새 정보다.
- earlier 2-of-4 선택이 W7 접근권을 잠그거나 정답 루트를 결정하지 않는다.

예시 관계:

```text
복구된 흐름 ↔ 정령 shock response
분산된 압력 ↔ 약한 root layer
보호막 위치 ↔ spirit-trace pressure concentration
```

이 예시는 내부 consequence case의 bounded example이며 canonical route가 아니다.

## 6. Context Delta UI

Reveal 직후 정보는 세 덩어리만 사용한다.

### STILL_TRUE

W6에서 실제로 개선된 사실.

### NEWLY_LEARNED

post-W6 상태에서 새로 관찰된 deeper coupling.

### NEW_TENSION

새 coupling 때문에 다음 판단에서 고려해야 할 긴장/비용/상충.

```text
STILL_TRUE
→ 무엇이 실제로 해결됐는가

NEWLY_LEARNED
→ 무엇을 새로 알게 됐는가

NEW_TENSION
→ 그 새 사실 때문에 다음 판단에서 무엇이 달라지는가
```

이 UI는 해결법을 주지 않는다.

금지:

```text
correct_spell
best_circuit
best_target
best_intent
correct_route
named_priority_route
```

## 7. Reveal의 정보량 상한

첫 Slice에서는 다음을 고정한다.

```yaml
new_coupling_count: 1
strong_pressure_source_count: 1
new_mandatory_clue_chain: 0
mob_wave_count: 0
hp_sponge_escalation: false
```

새 coupling 1개가 충분히 강해야 하며, 여러 새 단서와 전투 압박을 동시에 쌓지 않는다.

## 8. W7 redesign 계약

W7은 기존 Spell Workflow Stage 2/3와 FIVE_POINT_STAR를 재사용한다.

새 spell engine, reveal engine, route selector, priority selector를 만들지 않는다.

W7은 다음 차원 중 최소 하나를 실제로 바꿔야 한다.

```yaml
allowed_meaningful_change_dimensions:
  - meaning_and_circuit
  - target
  - tradeoff
  - contextual_use
derived_only_dimension:
  - intent_emphasis
minimum_changed_dimensions: 1
```

`intent_emphasis`는 별도 named intent 버튼이 아니라 회로·Target·결과에서 사후 파생한다.

## 9. number-only amplification 금지

다음은 W7 redesign으로 인정하지 않는다.

```text
W6: FLOW + FOCUS 50
W7: FLOW + FOCUS 80
```

또는:

```text
same Target
same circuit meaning
same tradeoff
same contextual use
only stronger output
```

Hard guard:

```text
NO_NUMBER_ONLY_AMPLIFICATION
MEANINGFUL_JUDGMENT_CHANGE_REQUIRED
```

출력 변화가 있어도 반드시 판단 차원 변화가 동반되어야 한다.

## 10. W7 Commit

W7도 명시적 major FIVE_POINT_STAR Commit이다.

```text
updated observed context
→ Stage 2 redesign
→ explicit Target in Stage 3
→ bounded final preview
→ explicit W7 Commit
```

W6와 마찬가지로 자동 시전·숨은 Target 변경·숨은 Mana 증가는 허용하지 않는다.

## 11. W7 이후 결과

W7은 새 긴장을 다뤄야 하지만 완전히 지울 필요는 없다.

```yaml
new_tension_must_be_addressed: true
new_tension_must_be_fully_eliminated: false
remaining_tradeoff_allowed: true
w6_preserved_fact_still_true: true
```

W7 결과는 다음을 동시에 보여줄 수 있다.

- W6에서 이미 얻은 개선 유지
- 새 coupling 때문에 추가된 긴장 완화
- 아직 남은 비용/한계
- 새 발견

이는 39~44분 Result/Grimoire의 causal record로 이어진다.

## 12. 기존 3개 consequence case와의 정합성

### CASE W6-A

```text
W6 preserved fact:
pressure reduction + root stability

new coupling:
restored flow ↔ spirit state shock

W7 meaningful change:
contextual use / intent-derived emphasis
```

단, intent는 사전 route button이 아니다.

### CASE W6-B

```text
W6 preserved fact:
spirit shock + pressure reduction

new coupling:
dispersal ↔ weak root mat

W7 meaningful change:
target / tradeoff
```

### CASE W6-C

```text
W6 preserved fact:
root protection + evacuation time

new coupling:
barrier location ↔ spirit pressure

W7 meaningful change:
meaning_and_circuit / contextual use
```

세 case는 정답 루트 목록이 아니라 preservation/distinctness를 검증하는 bounded internal examples이다.

## 13. 5회 적대적 검토

전체 W7 상태를 다섯 번 반복 공격한다.

### Pass 1 — W6 무효화 공격

공격:
Reveal이 "네 첫 해결은 틀렸다"로 읽히는가?

수정/가드:
- Reveal 전 `W6_RESULT_ANCHOR`를 고정한다.
- `STILL_TRUE`를 첫 칸으로 둔다.
- W6 성공/실제 개선 rollback을 금지한다.

### Pass 2 — OLD_REPAIR_RECORD 중복 공격

공격:
앞서 OLD_REPAIR_RECORD를 조사했다면 Reveal이 이미 아는 정보가 되는가?

수정/가드:
- Reveal source를 `POST_W6_DEEPER_REVISION_COUPLING`으로 고정한다.
- 이전 node 방문 여부와 무관하게 새 정보여야 한다.

### Pass 3 — 숨은 오답 공격

공격:
새 coupling이 사실상 "2-of-4에서 틀린 두 노드를 골랐다"는 벌점인가?

수정/가드:
- earlier investigation pair와 W7 접근권/성공을 분리한다.
- 새 coupling은 W6 성공을 뒤집지 않는다.
- 누락 node는 계속 uncertainty였고, W7은 post-W6 state에서 새로 생긴 evidence를 사용한다.

### Pass 4 — 정답 누출 공격

공격:
`NEW_TENSION`이 곧 정답 회로/Target 추천이 되는가?

수정/가드:
- Delta는 changed condition만 설명한다.
- spell/circuit/Target/best intent를 추천하지 않는다.
- W7은 플레이어가 판단 차원을 선택한다.

### Pass 5 — 전투/과부하 공격

공격:
W7을 극적으로 만들려고 mob wave, 추가 clue chain, 다수 coupling을 쌓는가?

수정/가드:
- new coupling 1개
- strong pressure source 1개
- mob wave 0
- HP sponge 0
- 새 mandatory clue chain 0

## 14. 대안 처분

| 안 | 처분 | 이유 |
|---|---|---|
| A · Preserved Fact + Context Delta | `ADOPT` | W6 성취와 W7 재설계를 동시에 보존 |
| B · Live Disturbance First | `AVOID_FOR_FIRST_SLICE` | W6 실패/롤백처럼 읽힐 위험 |
| C · Archive Interpretation First | `DEFER` | 별도 추리 퀴즈와 인지부하 추가 |
| D · Dual-Objective Tradeoff | `AVOID_FOR_NOW` | named priority/route selector로 굳을 위험 |

## 15. Revisit 조건

다음 Human Slice에서 아래가 발생하면 재검토한다.

```text
- 플레이어 다수가 Reveal을 W6 실패 판정으로 해석
- OLD_REPAIR_RECORD 방문 여부에 따라 정보 신선도가 크게 달라짐
- STILL_TRUE / NEWLY_LEARNED / NEW_TENSION을 구분하지 못함
- W7이 같은 주문의 수치 강화로 반복됨
- 30~39분 구간이 목표 시간보다 반복적으로 과도하게 길어짐
- mobile에서 Delta + redesign 정보가 과밀함
```

## 16. 증거 한계

```text
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
```

현재 확정 가능한 것은 구조·정보 경계·기존 authority 재사용·W6 보존·W7 distinctness 계약뿐이다. 실제 감정적 납득, 재미, 9분 달성, 터치 부담, 가독성은 Human/Device Slice가 필요하다.
