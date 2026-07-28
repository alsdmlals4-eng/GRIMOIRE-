# GRIMOIRE 마법 글자 작성·인식 사람 검증 Artifact 실행 계획

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans only after a separate product-build approval. This document authorizes low-fidelity research preparation and human observation only.

**Goal:** 직접 쓰는 손맛을 유지하면서 입력 인식 실패와 주문 설계 실패를 플레이어가 명확히 구분하고, 잘못된 획만 빠르게 수정할 수 있는지 검증한다.

**Architecture:** Godot이나 인식 알고리즘을 구현하지 않는다. Android의 오프라인 전체화면 그리기 표면 또는 인쇄 캔버스에서 참가자가 연구용 글자를 작성하고, 진행자가 미리 정한 인식 후보·확신 카드를 공개한다. 이후 의미 조합 카드와 상황 판정 카드를 별도로 사용해 입력 실패와 설계 실패를 의도적으로 분리한다.

**Tech Stack:** Android 손가락 입력, 선택적 스타일러스, 인쇄 또는 Markdown 카드, 정규화 좌표 캔버스, 타이머, 수기 또는 스프레드시트 관찰 기록. 제품 Godot 코드·Scene·Resource는 변경하지 않는다.

## Global Constraints

- 기준 `main`: `f6e380b10b4f9a9f260cef998f1a6af94f752317`.
- 상위 Evidence Pack: `docs/planning/GATE_2_MAGIC_WRITING_INPUT_EVIDENCE_PACK_2026-07-29.md`.
- 현재 확정 결정: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`.
- 제품 단계는 `PROTOTYPE_AND_VERTICAL_SLICE`, 구현은 `NOT_STARTED`다.
- 별도 Core PoC를 재도입하지 않는다.
- 신규·미숙·중요 글자의 직접 작성 원칙을 유지한다.
- 인식기는 후보·확신 상태만 소유하며 주문 의미와 상황 적합성을 판정하지 않는다.
- 낮은 확신에서 자동 시전하지 않는다.
- 소환수는 작성·글자 선택·정답 제시를 대행하지 않는다.
- 아래 글자와 의미는 모두 `RESEARCH_ONLY_GLYPH`이며 세계관·아트·최종 룬 정본이 아니다.
- `ART-STYLE-01`과 `ART-BIBLE-01`을 이 문서로 확정하지 않는다.

---

## 1. 최소 Artifact 구성

1. **16:9 작성 오버레이 판:** 중앙 작성 캔버스와 상단 위험·대상 요약.
2. **연구용 글자 카드 4장:** 획 순서와 의미를 제시하되 최종 세계관 자산이 아님을 표시.
3. **인식 후보 카드:** 후보 글자, 확신 상태, 수정 가능한 범위.
4. **의미 조합 카드:** 메인 글자 1개와 보조 글자 0개 이상을 배치.
5. **상황 카드:** 주문이 해결해야 할 목표·위험.
6. **결과 카드:** 인식된 글자→조합 의미→세계 변화의 인과.
7. **관찰 기록지:** 입력·수정·설계·가림·오터치·설명 지표.

## 2. 작성 오버레이 판

정규화 좌표는 가로 0~100, 세로 0~100을 사용한다.

```text
┌──────────────────────────────────────────────────────────────┐
│ 대상: 훈련 장치        위험 경고: 상단 우측        [감속]   │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│                    작성 캔버스 70×70                         │
│                                                              │
│                손가락 위 축소 미리보기                       │
│                                                              │
├──────────────────────────────────────────────────────────────┤
│ [마지막 획 취소]   [전체 지우기]   [글자 확인]               │
└──────────────────────────────────────────────────────────────┘
```

조작 원칙:

- 세 버튼의 실제 터치 영역은 검증 화면에서 최소 48dp 후보 크기로 둔다.
- 버튼 간 간격은 최소 터치 영역의 절반 이상으로 둔다.
- 선은 손가락 이동과 동시에 표시한다.
- 캔버스 상단의 대상·위험 문구를 완전히 가리지 않는다.
- 상태는 색상 외에 문구와 아이콘으로 중복 표현한다.

## 3. 연구용 글자 세트

### G-A — `PUSH` / 밀기

```yaml
id: RESEARCH_GLYPH_A
status: RESEARCH_ONLY_GLYPH
meaning: "대상을 지정 방향으로 민다"
strokes: 1
stroke_recipe:
  start: [20, 50]
  end: [80, 50]
  direction_matters: true
```

왼쪽→오른쪽 진행 방향을 가진 단일 획이다. 반대 방향 입력은 동일 글자로 자동 보정하지 않는다.

### G-B — `SHIELD` / 막기

```yaml
id: RESEARCH_GLYPH_B
status: RESEARCH_ONLY_GLYPH
meaning: "대상 앞에 짧은 방호면을 만든다"
strokes: 1
stroke_recipe:
  start: [25, 75]
  through: [50, 25]
  end: [75, 75]
  shape: "위로 솟은 단일 호"
```

단순 단일 획이지만 G-A와 형태가 명확히 다르다.

### G-C — `OPEN` / 열기

```yaml
id: RESEARCH_GLYPH_C
status: RESEARCH_ONLY_GLYPH
meaning: "닫힌 구조의 결합을 푼다"
strokes: 1
stroke_recipe:
  start: [25, 25]
  through: [50, 70]
  end: [75, 25]
  direction_matters: true
```

왼쪽 상단→하단 중앙→오른쪽 상단 순서로 그린다. 반대 진행 방향은 후보 충돌 테스트에 사용하며 자동 정답 처리하지 않는다.

### G-D — `ANCHOR` / 고정

```yaml
id: RESEARCH_GLYPH_D
status: RESEARCH_ONLY_GLYPH
meaning: "현재 위치나 상태를 짧게 고정한다"
strokes: 2
stroke_1:
  start: [50, 20]
  end: [50, 80]
stroke_2:
  start: [25, 50]
  end: [75, 50]
order_matters: true
```

다중 획과 `마지막 획 취소`를 검증하기 위한 글자다.

## 4. 의미 조합 규칙

연구 세션에서만 다음 조합을 사용한다.

| 조합 | 연구용 의미 | 판정 목적 |
|---|---|---|
| 메인 `PUSH` | 대상을 밀어낸다 | 단일 글자 성공 |
| 메인 `SHIELD` | 방호면을 만든다 | 입력은 맞지만 상황 부적합 가능 |
| 메인 `PUSH` + 보조 `ANCHOR` | 특정 방향으로 밀어낸 뒤 위치를 고정한다 | 메인+보조 조합 |
| 메인 `OPEN` + 보조 `ANCHOR` | 잠금을 풀되 주변 상태는 고정한다 | 방향·다중 획 복합 |

이 의미는 최종 마법 체계가 아니다. 사람 테스트에서 입력과 설계 책임을 분리하기 위한 자극물이다.

## 5. 시나리오 1 — 낮은 확신 오인식 수정

```yaml
scenario_id: GR-WRITE-1
situation: "훈련 구체를 오른쪽 표식 밖으로 밀어내라"
required_design: "PUSH"
participant_action: "G-A를 손가락으로 작성"
facilitator_recognition_card:
  top_candidate: OPEN
  confidence: LOW
  alternate_candidate: PUSH
allowed_recovery:
  - alternate_candidate_select
  - rewrite_glyph
forbidden:
  - automatic_cast
success_world_change: "구체가 오른쪽으로 이동"
```

관찰 핵심: 참가자가 낮은 확신을 보고 시전 전 후보를 수정하는가.

## 6. 시나리오 2 — 입력 성공·설계 실패 분리

```yaml
scenario_id: GR-WRITE-2
situation: "밀려오는 상자를 멈춘 뒤 지정 위치에 고정하라"
required_design: "PUSH + ANCHOR"
participant_prompt: "먼저 가장 익숙한 글자를 작성"
facilitator_recognition_card:
  recognized: SHIELD
  confidence: HIGH
semantic_result:
  input_valid: true
  design_valid: false
  reason: "방호면은 상자를 잠시 막지만 지정 위치로 이동·고정하지 못한다"
allowed_recovery:
  - preserve_recognized_glyph
  - replace_main_glyph
  - add_support_glyph
forbidden:
  - force_full_rewrite_due_to_design_error
```

관찰 핵심: 참가자가 `글자는 제대로 인식됐지만 주문 설계가 상황에 맞지 않는다`고 설명하는가.

## 7. 시나리오 3 — 마지막 획 취소

```yaml
scenario_id: GR-WRITE-3
situation: "G-D ANCHOR를 작성해 흔들리는 표식을 고정하라"
participant_action:
  stroke_1: correct
  stroke_2: intentionally_outside_tolerance
facilitator_recognition_card:
  candidate: ANCHOR
  confidence: LOW
  error_basis: "두 번째 획이 중심 교차 영역을 벗어남"
allowed_recovery:
  - undo_last_stroke
  - redraw_stroke_2
forbidden:
  - clear_all_required
success_world_change: "표식이 현재 위치에 고정"
```

관찰 핵심: 전체 지우기보다 마지막 획 취소를 발견하고 사용하는가.

## 8. 시나리오 4 — 손가락 가림과 위험 확인

```yaml
scenario_id: GR-WRITE-4
situation: "OPEN을 작성하는 동안 상단 우측 위험 경고가 한 번 변함"
glyph: OPEN
warning_change_at: "획이 하단 중앙을 지날 때"
warning_text_before: "대상 안정"
warning_text_after: "대상 균열 — 확정 전 확인"
required_observation: "참가자가 확정 전에 경고 변화를 확인"
```

진행자는 경고 변화를 소리로 알리지 않는다. 참가자가 놓치면 그대로 기록한다.

## 9. 진행자 스크립트

### 시작 안내

> "이 테스트에는 글씨를 잘 쓰는 정답이 없습니다. 시스템이 어떤 글자로 인식했는지 확인하고 필요하면 수정한 뒤, 그 글자가 상황에 맞는 주문인지 별도로 판단해 주세요. 인식 실패와 설계 실패는 다른 문제입니다."

### 시나리오당 순서

1. 상황 카드와 연구용 글자 카드를 보여준다.
2. 참가자가 손가락으로 글자를 작성한다.
3. 진행자는 미리 정해진 인식 후보 카드를 공개한다.
4. 참가자가 후보를 확인·수정·확정한다.
5. 의미 조합 영역에서 메인·보조 글자를 배치한다.
6. 상황 판정 카드를 공개한다.
7. 참가자에게 실패 원인이 입력인지 설계인지 말하게 한다.
8. 결과 카드에서 `인식된 글자 → 조합 의미 → 세계 변화`를 설명하게 한다.

진행자는 후보 선택을 대신하지 않는다.

## 10. 기기와 참가자 구성

```yaml
minimum_participants: 6
segments:
  low_touch_action_experience: 3
  drawing_rhythm_gesture_experienced: 3
devices:
  - small_android_phone_finger
  - medium_android_phone_finger
optional:
  - supported_stylus_device
session_minutes: 25-35
scenario_order:
  participant_1_3: [1, 2, 3, 4]
  participant_4_6: [4, 3, 2, 1]
```

각 참가자는 손가락 세션을 반드시 수행한다. 스타일러스는 추가 비교이며 손가락 결과를 대체하지 않는다.

## 11. 관찰 기록지

| 필드 | 기록 규칙 |
|---|---|
| `participant_id` | 개인 식별정보 없는 코드 |
| `segment` | `LOW` 또는 `EXPERIENCED` |
| `device_class` | `SMALL_PHONE / MEDIUM_PHONE / STYLUS_OPTIONAL` |
| `scenario_id` | 1~4 |
| `first_attempt_candidate` | 후보 ID |
| `first_attempt_confidence` | LOW/HIGH |
| `first_attempt_accepted` | 0/1 |
| `correction_method` | `ALTERNATE / UNDO_LAST / REWRITE / CLEAR_ALL / NONE` |
| `final_recognition_correct` | 0/1 |
| `automatic_wrong_cast` | 항상 0이어야 함 |
| `input_seconds` | 첫 터치부터 후보 표시까지 |
| `correction_seconds` | 후보 표시부터 인식 확정까지 |
| `full_rewrite_count` | 수 |
| `last_stroke_undo_used` | 0/1 |
| `input_vs_design_explained` | 0/1 |
| `warning_seen_before_confirm` | 0/1 |
| `occlusion_reported` | 0/1 |
| `mis_touch_count` | 수 |
| `hand_fatigue` | 1~5 |
| `auto_correction_too_strong` | 1~5 |
| `observer_note` | 실제 행동·발화 |

## 12. 계산과 판정

- 최종 인식 성공률: 수정 뒤 올바른 글자를 확정한 비율.
- 전체 재작성률: `correction_method=REWRITE 또는 CLEAR_ALL` 비율.
- 부분 수정 발견률: 시나리오 3에서 `UNDO_LAST`를 사용한 참가자 비율.
- 실패 유형 설명률: 입력 성공/실패와 설계 성공/실패를 정확히 구분한 비율.
- 경고 확인률: 시나리오 4에서 확정 전 경고 변화를 확인한 비율.
- 오시전률: 낮은 확신 또는 오인식 상태에서 잘못 시전된 비율. 저충실도 Artifact에서는 반드시 0이어야 한다.

```yaml
ADOPT_PIPELINE_RESPONSIBILITY:
  final_recognition_rate: ">= 0.80"
  failure_type_explanation_rate: ">= 0.75"
  partial_correction_discovery_rate: ">= 0.67"
  warning_seen_rate: ">= 0.67"
  automatic_wrong_cast_rate: "0"
ADAPT:
  condition: "책임 분리는 이해되지만 후보 표시·부분 수정·가림 중 한 항목에서 반복 혼란 발생"
REWORK_OVERLAY:
  condition: "손가락 가림·작은 조작·전체 재작성 때문에 입력 흐름이 반복 중단됨"
REJECT_FLOW:
  condition: "참가자가 입력 오류와 설계 오류를 구분하지 못하거나 자동 확정이 더 낫다고 일관되게 판단함"
STOP:
  condition: "연구용 글자가 최종 세계관 정본으로 사용되거나 별도 Core PoC 범위로 확장됨"
```

## 13. 알고리즘 선정 경계

이 세션은 `$1 Recognizer`, DTW, 템플릿 매칭, ML 모델 중 하나를 선택하지 않는다. 진행자 후보 카드로 UX 책임 분리만 검증한다.

후속 기술 Prototype가 승인되면 별도 문서에서 다음을 비교한다.

- 단일 획 지원 범위.
- 다중 획·획 순서·방향 의미 지원.
- 후보 확신 산정.
- Android 저지연 입력.
- 손가락·스타일러스 차이.
- 오프라인 실행·데이터 보존.

## 14. 증거 저장 계약

사람 테스트 뒤에만 다음 보고서를 별도 PR로 만든다.

```text
docs/validation/2026-XX-XX_MAGIC_WRITING_INPUT_HUMAN_VALIDATION_REPORT.md
```

필수 내용:

- 실행 `main` SHA와 Artifact 버전.
- 기기 분류·입력 방식·참가자 구분.
- 시나리오별 원자료.
- 입력·수정·설계·가림 계산 결과.
- `ADOPT / ADAPT / REWORK / REJECT` 판정.
- 알고리즘은 여전히 `TECHNICAL_REVIEW_PROPOSAL`인지 여부.
- `ART-STYLE-01`, Godot 구현, Android 성능·접근성은 별도 상태라고 명시.

## 15. 실행 작업

### Task 1: 패킷 준비

- [ ] 네 글자에 `RESEARCH_ONLY_GLYPH`를 표시한다.
- [ ] 정규화 좌표와 획 순서를 카드에 동일하게 기록한다.
- [ ] 인식 후보 카드는 참가자 입력 전에 숨긴다.
- [ ] Android 작성 표면에서 선 표시 지연이 체감상 즉시인지 사전 확인한다.

### Task 2: 기기 검증

- [ ] 소형·중형 Android 화면에서 캔버스와 세 조작을 확인한다.
- [ ] 손가락이 상단 경고를 가리는 위치를 기록한다.
- [ ] 48dp 후보보다 작은 조작은 사람 세션 전에 수정한다.
- [ ] 스타일러스가 없어도 모든 시나리오를 완주할 수 있게 한다.

### Task 3: 사람 세션

- [ ] 두 경험군 각 3명 이상을 실행한다.
- [ ] 시나리오 순서를 역전 배정한다.
- [ ] 입력 행동과 사후 설명을 분리 기록한다.
- [ ] 진행자가 후보·조합을 대신 선택하지 않는다.

### Task 4: 판정

- [ ] 인식 알고리즘을 UX 결과만으로 확정하지 않는다.
- [ ] 연구 글자를 최종 룬 정본으로 승격하지 않는다.
- [ ] 제품 구현은 보고서와 사용자 승인 뒤 별도 PR로 분리한다.

## 16. 적대적 셀프 리뷰

- 진행자 후보 카드가 실제 인식 성능처럼 오인될 수 있음 → `SIMULATED_RECOGNITION_RESULT`를 모든 카드에 표시.
- 연구 글자의 의미가 세계관 정본으로 굳을 수 있음 → ID와 상태를 `RESEARCH_ONLY_GLYPH`로 유지.
- Android 그리기 앱 차이가 결과에 영향을 줄 수 있음 → 기기·표면 종류를 기록하고 알고리즘 성능 주장을 금지.
- 마지막 획 취소가 지나치게 유리하게 연출될 수 있음 → 발견 여부를 관찰하며 진행자가 버튼을 지시하지 않음.
- 경고 확인 실패가 글자 인식 문제로 섞일 수 있음 → 가림 지표를 별도로 기록.

## 17. 현재 상태

```yaml
artifact_status: READY_FOR_LOW_FIDELITY_TOUCH_SESSION
product_code_changed: false
vertical_slice_implementation_started: false
research_glyphs_canonized: false
art_style_decided: false
human_validation: NOT_RUN
android_performance_validation: NOT_RUN
implementation_authority: NONE
next_gate: RUN_SIX_PARTICIPANT_FOUR_SCENARIO_TOUCH_PILOT
rollback: remove this document only
```
