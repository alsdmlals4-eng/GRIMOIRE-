# GRIMOIRE Planning Index

이 디렉터리의 Gate 2 문서는 `docs/DOCUMENTATION_MAP.md`, `docs/ACTIVE_CONTEXT.md`, `CURRENT_CONFIRMED_DECISIONS.md`를 대체하지 않는다. 현재 제품 차단 결정은 계속 `ART-STYLE-01`이다.

## 마법 글자 작성·인식

| 질문 | 문서 | 상태 |
|---|---|---|
| 입력·인식·의미 설계 책임을 어떻게 분리하는가 | `GATE_2_MAGIC_WRITING_INPUT_EVIDENCE_PACK_2026-07-29.md` | `PILOT_RECOMMENDATION / NOT_CANON` |
| 실제 사람·Android 저충실도 세션을 어떻게 준비하는가 | `../superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md` | `HUMAN_VALIDATION_INPUT / HUMAN_AND_DEVICE_NOT_RUN` |
| 합성 테스터를 어떤 Skill·작업 구조로 적용하는가 | `GATE_2_SYNTHETIC_TESTER_STRUCTURE_ANALYSIS_2026-07-29.md` | `T6_AI_INFERENCE / NOT_CANON` |
| 현재 시나리오의 정답 누출·책임 혼합·복구 편향은 무엇인가 | `GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md` | `AI_SIMULATION_COMPLETED / REWORK / HUMAN_NOT_RUN` |

## 합성 검토 결론

- 의도 후보가 항상 목록에 있는 조건은 복구 발견을 과도하게 쉽게 만든다.
- 순수 주문 설계 실패는 작성 의도와 인식 결과가 일치한 상태에서 분리해야 한다.
- “마지막 획이 틀림”은 부분 수정 정답을 누출하므로 중립 오류 자극물로 바꿔야 한다.
- 손가락 가림·오터치·인식 정확도·지연은 실제 Android·recognizer Prototype 전 `TEST_REQUIRED`다.

## 권한 경계

```yaml
base_governance_commit: 9c4071c5ecefe28769b512d426442338ceb7acdd
validation_method: SYNTHETIC_TESTER_SIMULATION
evidence_tier: T6_AI_INFERENCE
human_validation: NOT_RUN
android_touch_validation: NOT_RUN
recognizer_validation: NOT_RUN
implementation_authority: NONE
canon_changed: false
next_blocking_decision: ART-STYLE-01
```

합성 보고서는 실제 사람 행동·재미·조작감·인식 성능을 증명하지 않으며, 룬·세계관·아트·Godot·Scene·Resource·Save Schema를 변경하지 않는다.
