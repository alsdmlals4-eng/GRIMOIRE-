# Frostbloom W6 Decision Loop — Human / Player Observation Script

> 이 문서는 W6의 자동화·런타임 스모크 이후 필요한 실제 사람 관찰을 준비하는 실행 스크립트다. 결과를 추정하거나 자동 테스트로 대체하지 않는다.

```yaml
validation_id: W6-VFY08
feature_id: FTR-FROSTBLOOM-W6-DECISION-LOOP-01
status: PREPARED_NOT_RUN
execution_owner: USER_OR_DESIGNATED_HUMAN_TESTER
runtime_build_to_record: origin/main at or after 8ab5fead2c02492f2c183e40118d785cfd9612bc
test_scope: >-
  one W6 preservation decision loop: context -> completed spell -> target -> forecast
  -> explicit cast -> causal receipt
separate_gates:
  - mobile device / touch ergonomics
  - performance
  - accessibility audit
  - export
  - full vertical slice
not_a_pass_claim: true
```

## 1. Purpose

Validate the player meaning that automation cannot prove:

```text
What each target protects
→ what changes now, remains at risk, and stays unknown
→ why the player chose it
→ what the receipt says actually happened
→ what they want to investigate next
```

This is not a search for a correct target. `희귀 서리 묘목` and `온실 동쪽 지지대` are equal-valid preservation priorities; the observer must never present one as cheaper, safer, or preferred.

## 2. Setup and boundary

- Record the exact Git revision, platform, resolution, input method, locale/font state, tester role, and any pre-existing runtime errors.
- Start from the development Product Root and use the W6 typed context. Do not substitute historical `WARD` / `FLOWER` prototype data.
- A desktop 1280×720 observation may assess the meaning flow only. It cannot close the mobile-device, touch-target, accessibility, performance, or export gates.
- Do not explain the meanings of `확인된 개선`, `남는 위험`, or `아직 미확인` before the participant attempts to read them. Clarification is evidence, not a correction to erase.
- Do not use the planning board as runtime proof or add a runtime asset during the session.

## 3. Moderator flow

| Moment | Participant prompt | Observe without leading | Evidence to record |
| --- | --- | --- | --- |
| Context → target | “지금 화면에서 무엇을 먼저 지켜야 한다고 읽히나요?” | Whether both target values are discoverable and distinct. | Exact words, missed information, time/order of discovery. |
| Before selection | “각 선택은 무엇을 지키고, 다른 한쪽에는 무엇을 남기나요?” | Whether the player identifies both protected value and remaining risk, rather than a hidden best answer. | Target named, explanation, ambiguity or perceived optimal answer. |
| Forecast | “지금 바로 확인되는 변화와 아직 모르는 것은 무엇인가요?” | Whether known improvement, remaining risk, and unknown stay separate. | Participant explanation and any category conflation. |
| Explicit cast | “왜 이 대상을 먼저 시전하겠나요?” | Whether the player experiences authorship/responsibility and understands that cast is explicit. | Choice reason; any expectation of auto-cast or cost/success manipulation. |
| Receipt | “실제로 무엇이 바뀌었고, 무엇이 남았으며, 무엇이 아직 모르는 상태인가요?” | Whether receipt causality maps back to the selected target without moral-grade reading. | Actual / remaining / unknown restatement and mismatch. |
| Next motivation | “다음에 무엇을 확인하거나 해결하고 싶나요?” | Whether the remaining risk/unknown motivates inquiry rather than dead-end frustration. | Follow-up intent, confusion, disengagement, suggested fix. |

## 4. Observation criteria

| Criterion | Evidence that supports it | Failure signal | Disposition if observed |
| --- | --- | --- | --- |
| Target parity | Player can articulate a defensible reason for either target. | One target is described as obviously best because of unexplained numbers or hierarchy. | Reopen data/UI parity review; do not tune hidden values. |
| Forecast clarity | Player separates confirmed improvement, remaining risk, and unknown. | Player treats unknown as a hidden failure chance, mana cost, or outcome guarantee. | Reopen copy/information-hierarchy review. |
| Explicit authorship | Player expects to choose, preview, then cast. | Player expects selection to resolve automatically or does not recognize the cast boundary. | Reopen action affordance/flow review. |
| Causal receipt | Player connects the observed result to their selected target and can identify what remains. | Receipt reads as a generic success grade or obscures the forgone value. | Reopen receipt structure/copy review. |
| Next-question motivation | Player can name a plausible next investigation prompted by remaining risk or unknown. | Player experiences an unexplained dead end or assumes the other target was secretly wrong. | Reopen W6→W7 handoff design; do not invent W7 implementation. |

No single session automatically makes this gate `PASS`. Record all observations, including contradictory ones, and let the project owner decide whether the evidence is sufficient for the intended audience and platform.

## 5. Result record template

```yaml
session_id: UNASSIGNED
date_kst: UNASSIGNED
git_revision: UNASSIGNED
platform_and_resolution: UNASSIGNED
input_method: UNASSIGNED
locale_and_font_state: UNASSIGNED
participant_context: UNASSIGNED
runtime_errors_before_or_during: []
target_value_understanding:
  seedlings: UNOBSERVED
  structure: UNOBSERVED
  perceived_hidden_best_answer: UNOBSERVED
forecast_understanding:
  confirmed_improvement: UNOBSERVED
  remaining_risk: UNOBSERVED
  unknown: UNOBSERVED
cast_authorship: UNOBSERVED
receipt_causality: UNOBSERVED
next_question_motivation: UNOBSERVED
observed_confusions: []
participant_words: []
moderator_interventions: []
recommended_disposition: NOT_EVALUATED
separate_gates_left_not_run:
  - mobile_device
  - performance
  - accessibility
  - export
  - full_vertical_slice
```

## 6. Evidence handling

- Preserve raw participant wording before interpreting it.
- Record an Incident / Solution / Lesson only when a concrete player, UX, content, or runtime finding exists.
- A negative result is valid evidence. Do not repair the game during observation, and do not change W7, Task8, runtime visuals, or production assets under this script.
- Update the W6 traceability packet and implementation receipt only with the exact session record and the resulting evidence class. Leave `NOT_RUN` unchanged for every gate that was not actually exercised.
