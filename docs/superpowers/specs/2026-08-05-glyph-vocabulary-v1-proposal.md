# Glyph Vocabulary v1 — 핵심·보조 단어 10+10 승인 Spec

## Status

```yaml
decision_id: GM-GLYPH-VOCABULARY-V1-01
status: USER_APPROVED_ACTIVE_PENDING_MERGE
approved_at: 2026-08-05T07:52+09:00
parent_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
counter_increment: true
grill_counter_after_approval: 3_of_10
purpose: VERTICAL_SLICE_AND_FUTURE_VOCABULARY_DIRECTION
visual_assets: NOT_CREATED
recognizer: NOT_IMPLEMENTED
human_comprehension_test: NOT_RUN
```

이 문서는 승인된 Vocabulary 의미 범위와 입력 문양 방향을 정의한다. 20종의 의미·역할 분류는 승인됐지만 정확한 좌표·인식 임계치·실제 조작감은 검증 전 `TEST_VALUE`다. Runtime 인식 범위는 우선 6종으로 제한한다.

```text
HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

## 1. 공통 문양 문법

```yaml
preferred_strokes: 1_to_3
advanced_max_strokes: 4
input_area: normalized_square
required_properties:
  - simple
  - semantic
  - distinct
  - drawable_with_finger
  - recognizable_without_color
ornament_rule: DISPLAY_ONLY_KEEP_BASE_SILHOUETTE
```

문양 정의는 실제 SVG 완성물이 아니라 **입력 형태 설계 지시**다. 장식형은 기본 획에 외곽 원·눈금·룬·광원을 더할 수 있지만 인식 입력에는 포함하지 않는다.

## 2. 핵심 단어 10종

핵심 단어는 “무엇을 일으키는가”를 나타낸다.

| ID | 이름 | 의미 | 기본 입력 형태 | 목표 획수 | 장식형 방향 |
|---|---|---|---|---:|---|
| `HEAT` | 열 | 온도 상승·가열 | 위가 열린 삼각 불꽃 안에 짧은 중심선 | 2 | 방사광·열 아지랑이 |
| `COLD` | 냉기 | 온도 하강·결빙 | 한 중심에서 갈라지는 세 갈래 결정 | 3 | 육각 결정·서리 |
| `WATER` | 물 | 액체·습윤·세척 | 아래에서 닫히는 한 방울 곡선 | 1 | 물결 고리 |
| `WIND` | 바람 | 공기 이동·압력 이동 | 같은 방향의 두 열린 곡선 | 2 | 흐르는 입자 |
| `LIGHT` | 빛 | 조명·노출·광선 | 짧은 세로선과 가로선의 십자 광점 | 2 | 사방 광선 |
| `SHADOW` | 어둠 | 차광·은폐·감쇠 | 한 획 초승달 | 1 | 안쪽 암영 |
| `PROTECT` | 보호 | 차단·완충·방벽 | 위가 둥근 방패 외곽과 짧은 바닥선 | 2 | 이중 방벽 링 |
| `LIFE` | 생명 | 회복·성장·활성 | 줄기 한 획과 양쪽 잎 한 획 | 2 | 맥동·잎맥 |
| `IMPACT` | 충격 | 순간 힘·타격·진동 | 한 획 번개형 지그재그 | 1 | 파동 균열 |
| `PURIFY` | 정화 | 오염·저주·이물 제거 | 열린 마름모와 중앙 세로선 | 2 | 바깥으로 벗겨지는 입자 |

### 핵심 단어 적대 검토

- `HEAT`와 `LIGHT`: 삼각·상향 대 십자·방사.
- `COLD`와 `LIGHT`: 3분기 결정 대 직교 십자.
- `WATER`와 `SHADOW`: 닫히는 방울 대 열린 초승달.
- `PROTECT`와 `PURIFY`: 둥근 방패 대 각진 열린 마름모.

## 3. 보조 단어 10종

보조 단어는 “어떻게 작동하는가”를 나타낸다.

| ID | 이름 | 의미 | 기본 입력 형태 | 목표 획수 | 장식형 방향 |
|---|---|---|---|---:|---|
| `FLOW` | 흐름 | 효과를 경로로 전달 | 한 획 S자 곡선 | 1 | 선을 따라 이동하는 광점 |
| `FOCUS` | 집중 | 범위·출력을 한 점에 수렴 | 양쪽에서 중앙으로 모이는 두 대각선 | 2 | 중심 수렴 링 |
| `DISPERSE` | 분산 | 여러 방향·대상으로 나눔 | 아래 한 줄기에서 위로 갈라지는 Y | 2 | 분기 끝 광점 |
| `BURST` | 폭발 | 축적 효과를 순간 방출 | 중심을 교차하는 세 짧은 선 | 3 | 바깥 충격파 |
| `ANCHOR` | 고정 | 위치·상태를 붙잡음 | 한 획 닫힌 마름모 | 1 | 네 모서리 고정점 |
| `SUSTAIN` | 지속 | 효과 시간을 유지 | 한 획 닫힌 원 | 1 | 천천히 도는 외곽 링 |
| `DELAY` | 지연 | 발동을 뒤로 미룸 | 가로선 뒤에 아래로 꺾이는 갈고리 | 1 | 대기 눈금 |
| `REPEAT` | 반복 | 효과를 다시 실행 | 서로 마주 보는 두 반원 | 2 | 순환 화살 광점 |
| `PROJECT` | 투사 | 효과를 한 방향으로 발사 | 직선과 끝의 열린 꺾쇠 | 2 | 전방 꼬리광 |
| `ABSORB` | 흡수 | 외부 효과를 안으로 받아들임 | 위가 열린 U형과 중앙 하강선 | 2 | 안쪽으로 빨려드는 입자 |

### 보조 단어 적대 검토

- `FLOW`와 `REPEAT`: 열린 S 한 획 대 분리된 두 반원.
- `FOCUS`와 `ABSORB`: 좌우 수렴 대 U형 용기와 하강선.
- `ANCHOR`와 `SUSTAIN`: 각진 마름모 대 원.
- `DISPERSE`와 `BURST`: 방향성 Y 대 중심 교차 별.
- `PROJECT`와 `DELAY`: 앞쪽 열린 꺾쇠 대 뒤쪽 아래 갈고리.

## 4. Vertical Slice Runtime 범위

```text
SLICE_GLYPHS_6
```

```yaml
slice_main:
  - HEAT
  - PROTECT
slice_support:
  - FLOW
  - FOCUS
  - DISPERSE
  - BURST
slice_targets:
  - CASSIAN
  - SEEDLING
  - VALVE
  - PIPE
  - GROUND
  - FROST_SPIRIT
```

- Frostbloom의 필수 문법은 `HEAT`, `FLOW`, 선택 `FOCUS·DISPERSE`다.
- `PROTECT`, `BURST`는 전투·비교 문법과 혼동 검증을 위한 Slice 범위다.
- 나머지 14종은 승인된 의미 Vocabulary지만 Runtime 인식 템플릿을 만들지 않는다.
- 첫 6종이 안정적으로 구분되지 않으면 확대를 금지한다.

## 5. Recognition TDD 계약

```yaml
per_glyph_templates:
  developer_examples_min: 3_TEST_VALUE
  target_user_examples_min: HUMAN_TEST_PENDING
input_variants:
  - slow_finger
  - normal_finger
  - fast_finger
  - guided_trace
  - left_handed
  - right_handed
required_reports:
  - confusion_matrix
  - first_attempt_match_rate
  - median_draw_time
  - retry_count
  - false_accept_rate
  - false_reject_rate
```

제품 인식 코드보다 먼저 다음 RED를 작성한다.

1. `HEAT`와 `LIGHT` 혼동 샘플.
2. `FLOW`와 `REPEAT`의 열린/닫힌 차이.
3. 허용된 획 순서·방향 변형.
4. 미완성 문양 자동 확정 금지.
5. 낮은 확신 후보·재시도와 자원 미생성.
6. stale revision 결과 폐기.
7. 선택한 필사 글자와 인식 글자가 다르면 보관함 미생성.

```text
LOW_CONFIDENCE_REQUIRES_RETRY
```

## 6. 사람 인지 수용 테스트

라벨을 2초간 숨긴 뒤 다음을 확인한다.

```yaml
questions:
  - main_or_support_role
  - intended_meaning
  - most_confusable_other_glyph
  - confidence
pass_gate_before_expansion:
  meaning_accuracy: PRE_REGISTER_BEFORE_SESSION
  role_accuracy: PRE_REGISTER_BEFORE_SESSION
  no_single_confusion_pair_dominates: required
```

임계치는 결과 확인 전에 사전 등록하며 결과를 본 뒤 낮추지 않는다.

## 7. 시각 일관성

```yaml
shared_style:
  line_cap: rounded_or_tapered_consistent
  line_weight: single_family
  node_frame: role_specific_not_glyph_specific
  core_frame: central_radiant_seal
  support_frame: directional_runic_seal
  target_frame: identity_tag_seal
  palette: secondary_to_shape
```

- 입력형은 단색 선으로도 성립한다.
- 장식형의 색·입자·외곽 장식을 제거해도 같은 글자로 인식돼야 한다.
- 색상만으로 역할이나 의미를 구분하지 않는다.

## 8. 구현 경계

- 자원 계획: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
- 인식 계획: `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.
- Resource Stop Gate 통과 전 인식 계획을 실행하지 않는다.
- 자동 fixture 검증은 실제 손가락·사람 인지 검증을 대체하지 않는다.
- 제품 구현·실기기·사람 검증은 현재 `NOT_STARTED / NOT_RUN`이다.
