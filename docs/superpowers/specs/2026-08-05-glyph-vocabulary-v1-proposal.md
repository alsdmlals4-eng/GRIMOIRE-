# Glyph Vocabulary v1 — 핵심·보조 단어 10+10 제안

## Status

```yaml
status: PROPOSED_FOR_USER_REVIEW
parent_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
proposal_counter_increment: false
purpose: VERTICAL_SLICE_AND_FUTURE_VOCABULARY_DIRECTION
visual_assets: NOT_CREATED
recognizer: NOT_IMPLEMENTED
human_comprehension_test: NOT_RUN
```

이 문서는 글자 목록과 입력 문양 방향을 제안한다. 사용자 승인 전 확정 Vocabulary가 아니며, 이름·형태·획수는 인지·혼동 테스트 결과에 따라 바뀔 수 있다.

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

문양 후보는 실제 SVG나 이미지가 아니라 **입력 형태 설계 지시**다. 장식형은 기본 획에 외곽 원·눈금·룬·광원을 더하지만 인식 입력에는 포함하지 않는다.

## 2. 핵심 단어 후보 10종

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

- `열`과 `빛`: 열은 삼각·상향, 빛은 십자·방사로 구별한다.
- `냉기`와 `빛`: 냉기는 3분기 결정, 빛은 2획 직교 십자로 구별한다.
- `물`과 `어둠`: 물은 닫히는 방울, 어둠은 열린 초승달이다.
- `보호`와 `정화`: 보호는 둥근 방패, 정화는 각진 열린 마름모다.

## 3. 보조 단어 후보 10종

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

- `흐름`과 `반복`: 흐름은 열린 S 한 획, 반복은 분리된 두 반원이다.
- `집중`과 `흡수`: 집중은 좌우 대칭 V 수렴, 흡수는 용기형 U와 하강선이다.
- `고정`과 `지속`: 고정은 각진 마름모, 지속은 원이다.
- `분산`과 `폭발`: 분산은 방향성 Y, 폭발은 중심 교차 별이다.
- `투사`와 `지연`: 투사는 앞쪽 열린 꺾쇠, 지연은 뒤쪽 아래 갈고리다.

## 4. Vertical Slice 우선 범위

20종을 한꺼번에 구현하지 않는다.

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

- Frostbloom POC의 필수 인식 문양은 우선 6종이다.
- 나머지 14종은 의미·실루엣 후보로만 유지한다.
- 첫 플레이테스트에서 6종이 안정적으로 구분되지 않으면 Vocabulary 확대를 금지한다.

## 5. Recognition TDD plan

제품 인식 코드보다 먼저 다음 테스트 데이터를 만든다.

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

### RED tests before recognizer

1. `HEAT` 입력이 `LIGHT`로 오인되는 샘플을 구별한다.
2. `FLOW`와 `REPEAT`의 열린/닫힌 특성을 구별한다.
3. 획 순서 보정 모드에서도 의미가 같은 문양으로 인식된다.
4. 미완성 문양을 가장 가까운 글자로 자동 확정하지 않는다.
5. 인식 신뢰가 낮으면 후보와 재시도를 제시하고 자원을 생성하지 않는다.

## 6. Comprehension acceptance test

라벨을 2초간 숨긴 뒤 다음을 확인한다.

```yaml
questions:
  - main_or_support_role
  - intended_meaning
  - most_confusable_other_glyph
  - confidence
pass_gate_before_expansion:
  meaning_accuracy: TEST_THRESHOLD_TO_BE_SET_BEFORE_SESSION
  role_accuracy: TEST_THRESHOLD_TO_BE_SET_BEFORE_SESSION
  no_single_confusion_pair_dominates: required
```

임계치는 플레이테스트 계획 단계에서 사전 등록한다. 결과를 본 뒤 기준을 낮추지 않는다.

## 7. Visual consistency

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

- 글자마다 다른 미술 사조를 사용하지 않는다.
- 입력형은 읽기 쉬운 단색 선으로도 성립해야 한다.
- 장식형의 색·입자·외곽 장식이 사라져도 같은 글자로 인식돼야 한다.

## 8. Review questions

1. 핵심 단어 10종의 범위가 현상 중심으로 충분한가.
2. `보호`를 핵심 단어로 유지하는가.
3. `폭발`을 보조 단어로 유지하는가.
4. Slice 우선 6종이 너무 많거나 적지 않은가.
5. `정화·흡수·반복·지연`을 첫 정식 Vocabulary에 포함할 가치가 있는가.

사용자 검토 후 승인된 목록만 별도 Decision으로 승격한다.
