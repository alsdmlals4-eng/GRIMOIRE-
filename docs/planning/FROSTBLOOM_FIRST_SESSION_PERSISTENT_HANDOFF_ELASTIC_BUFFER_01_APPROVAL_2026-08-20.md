# GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01
sync_id: GR-SYNC-20260820-29-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
contract: PERSISTENT_HANDOFF_ELASTIC_BUFFER
session_target: TARGET_46_UNCHANGED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

2026-08-20 KST의 00~46분 end-to-end 검토에서 연속 recap 두 곳이 발견되었고, 사용자는 권장 A안 **Persistent Handoff + Elastic Buffer**를 승인했다.

이 결정은 새 콘텐츠를 추가하거나 W6/W7의 의미를 바꾸지 않는다. 이미 읽은 정보를 다음 단계가 다시 설명하지 않도록 **직전 상태를 다음 단계에 지속 표시**하고, 그 결과 생기는 시간 여유는 실제 Human pacing·입력·가독성 편차를 흡수하는 가변 buffer로만 보존한다.

## 2. 첫 번째 handoff · Investigation → W6

기존 의미:

```text
22~23 Known 2 / Unknown 2 / Lens 1
→ 23~24 같은 정보의 Decision Brief
→ 24~26 W6 Stage 2
```

현재 의미:

```text
22~23 Known 2 / Unknown 2 / Lens 1
→ 같은 summary가 W6 화면에 그대로 pin
→ ELASTIC_HANDOFF_WINDOW (0~60초 TEST_VALUE, 별도 recap 콘텐츠 없음)
→ W6 Stage 2
```

고정 계약:

```text
INVESTIGATION_SUMMARY_PERSISTS_INTO_W6
NO_DUPLICATE_W6_DECISION_BRIEF
ELASTIC_BUFFER_NOT_CONTENT
```

- `Known 2 / Unknown 2 / Lens 1`은 W6 진입 정보로 그대로 남는다.
- W6는 같은 내용을 새 modal/page/mentor line으로 다시 읽히지 않는다.
- 플레이어가 즉시 준비되면 Stage 2를 더 일찍 시작할 수 있다.
- 터치 입력, 읽기, 화면 전환, 짧은 애니메이션 때문에 시간이 필요하면 최대 60초의 기존 여유를 사용할 수 있다.
- buffer가 남았다고 tutorial, dialogue, lore, reward, 새 choice를 채워 넣지 않는다.

## 3. 두 번째 handoff · W6 → W7

기존 의미:

```text
29~30 W6 Actual Consequence Receipt
→ 30~31 W6 Result Anchor 재읽기
→ 31~33 post-W6 deeper coupling
```

현재 의미:

```text
29~30 W6 Actual Consequence Receipt
→ 실제 개선 receipt를 W7의 W6_RESULT_ANCHOR로 그대로 pin
→ ELASTIC_W6_TO_W7_HANDOFF (0~60초 TEST_VALUE, 별도 recap 화면 없음)
→ post-W6 deeper coupling
```

고정 계약:

```text
W6_RECEIPT_PINS_AS_W7_ANCHOR
NO_DUPLICATE_W7_RESULT_ANCHOR_SCREEN
FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
```

`W6_RESULT_ANCHOR`라는 의미는 삭제하지 않는다. W7이 새 coupling을 보여주기 전에 “W6에서 실제로 좋아진 것은 여전히 사실”이라는 기준점이 반드시 있어야 한다. 다만 그 기준점은 바로 직전 W6 receipt의 **persistent pin state**로 충족한다.

## 4. Elastic Buffer 규칙

```yaml
contract: ELASTIC_BUFFER_NOT_CONTENT
must_be_filled: false
new_content_allowed: false
fixed_pause_required: false
may_absorb:
  - transition_latency
  - input_latency
  - reading_variance
  - short_existing_animation_variance
  - accessibility_pacing_variance
may_not_absorb:
  - new_tutorial
  - new_lore
  - new_reward
  - new_gameplay_choice
  - second_incident
  - extra_mandatory_dialogue
```

두 window는 각각 `0~60초`의 Human Slice용 TEST_VALUE다. 둘 다 반드시 60초를 소비해야 하는 것이 아니다. 실제 플레이가 빠르면 세션이 46분보다 짧아질 수 있으며, 남은 시간을 인위적으로 채우지 않는다.

따라서:

```text
NO_NEW_CONTENT_FROM_RECOVERED_TIME
TARGET_46_UNCHANGED
REWORK_53_UNCHANGED
HARD_STOP_60_UNCHANGED
```

## 5. Existing Solution First

재사용:

```text
Known 2 / Unknown 2 / Lens 1 summary
W6 Stage 2/3
W6 Actual Consequence Receipt
W6_RESULT_ANCHOR semantic invariant
W7 post-W6 deeper coupling
existing 46 / 53 / 60 timing contract
```

새로 만들지 않음:

```text
new decision-brief system
new result-anchor transaction
buffer event system
new tutorial step
new story beat
new reward/currency
new gameplay decision
```

## 6. 선택 대안 기록

### A · Persistent Handoff + Elastic Buffer — 승인
동일 정보의 연속 재복기를 제거하고 남는 시간은 비콘텐츠 buffer로 둔다.

### B · 회수 시간을 W6/W7 판단 시간에 고정 재배분 — 기각
실제 Human evidence 없이 새 고정 배분을 확정하면 또 다른 pacing 가정을 만든다.

### C · 15~20초 micro-recap 유지 — 기각
중복은 줄지만 직전 화면을 곧바로 다시 요약할 이유가 아직 없다.

### D · 현행 1분 recap 유지 — 기각
end-to-end 검토에서 이미 연속 반복으로 확인됐다.

## 7. Benchmark disposition

본 결정은 직전 `FROSTBLOOM_FIRST_SESSION_END_TO_END_REVIEW`와 같은 work unit이다. 범위와 핵심 가정이 바뀌지 않았으므로 같은 work-unit research를 재사용한다.

- Nintendo Game Builder Garage — 작은 점진적 완료 단위와 recall-only 진행 의존 회피 패턴을 ADAPT.
- GDC Mushroom 11 — 실제 gameplay 안에서 점진적이고 집중적으로 학습시키는 패턴을 ADAPT.

표현·콘텐츠는 복제하지 않는다.

## 8. 5회 적대적 검토

### Pass 1 · 정보 삭제 공격
요약을 없애면서 W6가 어떤 Known/Unknown/Lens를 받았는지 사라지는가?

가드: summary는 삭제가 아니라 persistent pin. **PASS**.

### Pass 2 · W6 성취 삭제 공격
Result Anchor 화면을 없애면서 W6 개선 보존도 없어지는가?

가드: actual W6 receipt 자체가 anchor로 pin되고 `FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE` 유지. **PASS**.

### Pass 3 · 빈 시간 content-creep 공격
회수 시간을 새 tutorial/lore/reward로 채우는가?

가드: `ELASTIC_BUFFER_NOT_CONTENT`, `NO_NEW_CONTENT_FROM_RECOVERED_TIME`. **PASS**.

### Pass 4 · 무조건 대기 공격
buffer가 60초 강제 pause가 되는가?

가드: `must_be_filled=false`, `fixed_pause_required=false`. **PASS**.

### Pass 5 · 46분 계약 붕괴 공격
buffer를 제거하면서 46분 target 자체를 44분으로 재정의하는가?

가드: `TARGET_46_UNCHANGED`; 46은 Human target hypothesis이며 빠른 플레이가 더 짧아지는 것은 허용. **PASS**.

## 9. 재검토 조건

Human/Device test에서 다음이 발생하면 buffer cap과 persistent presentation을 다시 본다.

- summary pin이 지나치게 화면을 점유함.
- W6 receipt pin이 W7 reveal의 주목도를 방해함.
- 실제 전환 지연이 반복적으로 60초를 초과함.
- 빠른 플레이어가 갑작스러운 전환으로 느낀다고 보고함.
- mobile에서 pin + active UI가 동시에 보이기 어려움.

그 전까지 구조적 결정만 PASS이며 실제 pacing, 피로, comprehension, mobile readability는 `NOT_RUN`이다.
