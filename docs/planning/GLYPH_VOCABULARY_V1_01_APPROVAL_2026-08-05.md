# GM-GLYPH-VOCABULARY-V1-01 — 핵심·보조 글자 Vocabulary v1 승인

## 승인 상태

```yaml
decision_id: GM-GLYPH-VOCABULARY-V1-01
status: USER_APPROVED_ACTIVE_PENDING_MERGE
approved_at: 2026-08-05T07:52+09:00
approval_source: conversation_user_explicit_approval
parent_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
counter_increment: true
grill_counter_after_approval: 3_of_10
checkpoint_pull_request: 61
implementation: NOT_STARTED
recognizer_validation: NOT_RUN
mobile_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인 범위

이번 승인은 다음을 확정한다.

1. 핵심 단어는 **무엇을 일으키는가**를 나타낸다.
2. 보조 단어는 **어떻게 작동하는가**를 나타낸다.
3. 입력형 문양과 장식 표시형 문양을 분리한다.
4. 입력형은 일반 1~3획, 고급 후보 최대 4획을 원칙으로 한다.
5. Vertical Slice는 6종만 우선 구현·검증한다.
6. 나머지 14종은 Vocabulary v1 의미 범위로 승인하되 Slice 구현 대상은 아니다.
7. Vocabulary 확대 전 사람 인지·혼동 검증을 반드시 수행한다.

```text
HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

정확한 벡터 좌표, 인식 임계치, 획 순서 허용 범위, 장식 강도는 제품·사람 검증 전 `TEST_VALUE`다.

## 핵심 단어 10종

```yaml
main_glyphs:
  - HEAT
  - COLD
  - WATER
  - WIND
  - LIGHT
  - SHADOW
  - PROTECT
  - LIFE
  - IMPACT
  - PURIFY
```

| ID | 이름 | 의미 중심 |
|---|---|---|
| `HEAT` | 열 | 온도 상승·가열 |
| `COLD` | 냉기 | 온도 하강·결빙 |
| `WATER` | 물 | 액체·습윤·세척 |
| `WIND` | 바람 | 공기·압력 이동 |
| `LIGHT` | 빛 | 조명·노출·광선 |
| `SHADOW` | 어둠 | 차광·은폐·감쇠 |
| `PROTECT` | 보호 | 차단·완충·방벽 |
| `LIFE` | 생명 | 회복·성장·활성 |
| `IMPACT` | 충격 | 순간 힘·타격·진동 |
| `PURIFY` | 정화 | 오염·저주·이물 제거 |

## 보조 단어 10종

```yaml
support_glyphs:
  - FLOW
  - FOCUS
  - DISPERSE
  - BURST
  - ANCHOR
  - SUSTAIN
  - DELAY
  - REPEAT
  - PROJECT
  - ABSORB
```

| ID | 이름 | 작동 방식 |
|---|---|---|
| `FLOW` | 흐름 | 효과를 경로로 전달 |
| `FOCUS` | 집중 | 범위·출력을 한 점에 수렴 |
| `DISPERSE` | 분산 | 여러 방향·대상으로 분배 |
| `BURST` | 폭발 | 축적 효과를 순간 방출 |
| `ANCHOR` | 고정 | 위치·상태를 붙잡음 |
| `SUSTAIN` | 지속 | 효과 시간을 유지 |
| `DELAY` | 지연 | 발동 시점을 뒤로 미룸 |
| `REPEAT` | 반복 | 효과를 다시 실행 |
| `PROJECT` | 투사 | 효과를 한 방향으로 발사 |
| `ABSORB` | 흡수 | 외부 효과를 안으로 받아들임 |

## Vertical Slice 우선 6종

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
```

- Frostbloom 사건은 `HEAT`, `FLOW`, 선택 `FOCUS`·`DISPERSE`를 우선 사용한다.
- `PROTECT`, `BURST`는 전투·비교 문법과 혼동 검증을 위한 Slice 보조 범위다.
- 첫 6종이 의미·역할·입력 형태에서 안정적으로 구별되지 않으면 Vocabulary 구현 범위를 확대하지 않는다.

## 입력형·장식형 계약

```yaml
input_glyph:
  preferred_strokes: 1_to_3
  advanced_max_strokes: 4
  normalized_input_area: square
  required:
    - SIMPLE
    - SEMANTIC
    - DISTINCT
    - FINGER_DRAWABLE
    - COLOR_INDEPENDENT

ornamented_display_glyph:
  preserves_base_silhouette: true
  recognition_input: false
  optional_additions:
    - outer_ring
    - runic_ticks
    - glow
    - material_fx
```

- 장식을 제거해도 기본 글자를 판독할 수 있어야 한다.
- 색상만으로 핵심·보조 역할이나 글자 의미를 구분하지 않는다.
- 그림 정확도는 위력·마나 효율·보관함 지급량을 높이지 않는다.
- 낮은 인식 확신에서는 자동 확정하지 않고 후보·재시도를 제공한다.

## 검증 Gate

구현 전 TDD로 다음을 고정한다.

```yaml
required_reports:
  - confusion_matrix
  - first_attempt_match_rate
  - median_draw_time
  - retry_count
  - false_accept_rate
  - false_reject_rate
required_input_variants:
  - slow_finger
  - normal_finger
  - fast_finger
  - guided_trace
  - left_handed
  - right_handed
```

사람 검증 전에는 다음을 주장하지 않는다.

- 문양이 직관적이다.
- 손가락 입력에서 안정적으로 인식된다.
- 6종의 혼동률이 허용 가능하다.
- 획수와 피로도가 적절하다.

## 벤치마크 적용

- `$1 Unistroke Recognizer`: 단일 획 기준선과 알고리즘 회귀 테스트에 사용.
- `$N Multistroke Recognizer`: 2~3획 Slice 문양 후보 비교에 사용.
- `LOSTMAGIC`: 직접 마법을 쓴다는 저작성 감각만 전이하고, 모든 주문에 직접 그리기를 강제하는 구조는 채택하지 않는다.
- Apple·Android 터치 기준: 아이콘의 시각 크기와 실제 터치 영역을 분리한다.

상세 근거는 `docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`를 따른다.

## 구현 계획

- 자원 생명주기: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
- Vocabulary·인식 POC: `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.

두 계획은 독립적인 TDD 작업 단위이며 Foundation POC의 순수 상태 계층과 입력 계층에 각각 연결한다.

## 병합 경계

이 Decision은 승인됐지만 승인 Batch는 `3/10`이며 `merge_required: false`다. PR #61은 Draft·미병합 상태를 유지한다. 최신 exact-head CI, Sheet Readback, 적대적 검토와 별도 병합 승인이 없으면 main에 병합하지 않는다.
