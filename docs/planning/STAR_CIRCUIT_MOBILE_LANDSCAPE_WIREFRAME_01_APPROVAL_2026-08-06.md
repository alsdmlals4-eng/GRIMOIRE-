# 별형 회로 Mobile Landscape Wireframe 01 승인

```yaml
status: USER_AUTHORIZED_IMPLEMENTATION_DEFAULT
parent_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
platform: MOBILE_LANDSCAPE_FIXED
fidelity: LOW_FI_VALIDATION_HARNESS
final_art: NOT_INCLUDED
mobile_device_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
```

## 목적

작은 모바일 가로 화면에서 `조사 → 의도 → 별형 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit`의 단계가 섞이지 않고 읽히는지 검증한다.

## 고정 구조

```yaml
CENTER_MAIN_GLYPH: EXACTLY_ONE
FIVE_EQUIVALENT_OPTIONAL_VERTICES: ZERO_TO_FIVE
CIRCUIT_PREVIEW_BEFORE_TARGET: true
TARGET_KEYWORD_OUTSIDE_CIRCUIT: true
FINAL_NUMERIC_SUCCESS_AND_MANA_PREVIEW: true
EXPLICIT_COMMIT: true
```

- 중앙에는 주문 현상을 결정하는 메인 글자 1개를 배치한다.
- 외곽 다섯 꼭짓점은 기능적으로 동등하며 빈 슬롯을 허용한다.
- 별 위치·선 길이에 숨은 성공률·마나·위력 보너스를 두지 않는다.
- 대상은 회로 안에 넣지 않고 1차 Preview 후 열린 키워드에서 선택한다.

## 화면 영역

1. 좌측: 상황·목표·위협을 모든 단계에서 유지한다.
2. 중앙: 메인 글자, 외곽 다섯 슬롯, 선택 Source, 회로 연결 시각화.
3. 우측 상단: 사용 글자별 숙련도와 성공률·마나 변화 Breakdown.
4. 우측 하단: 대상 키워드와 최종 Preview.
5. 하단: 교체·취소·접근성 입력·명시적 Commit.

## 상태

```text
CIRCUIT_EDIT
→ CIRCUIT_PREVIEW
→ TARGET_KEYWORD_SELECT
→ FINAL_PREVIEW
→ COMMIT_CONFIRM
→ SYSTEM_RESOLVE
→ RESULT_EXPLAIN
```

별도 오류·보조 상태:

- `INSUFFICIENT_MANA_STATE`
- `UNSTABLE_CIRCUIT_STATE`
- `ACCESSIBILITY_INPUT_STATE`
- `CANCEL_WITHOUT_RESOURCE_MUTATION`

오류 상태에서도 상황·대상·현재 회로 Draft를 보존한다.

## 표시 계약

- 숙련도 숫자와 함께 글자 이름을 표시한다.
- 성공률 하락 원인을 보조 개수·낮은 숙련도·대상 난이도로 분리한다.
- 마나 증가 원인을 기본 비용·보조 비용·복잡도·정밀·절감으로 분리한다.
- 불안정 원인 글자를 명시하며 정답 글자나 최적 회로를 추천하지 않는다.
- Preview 전과 취소 시 Stock·Vault·마나를 소비하지 않는다.

## 접근성

```yaml
minimum_touch_target: 48dp
TEXT_SCALE_130_PERCENT: REQUIRED_WITHOUT_CLIPPING
COLOR_NOT_SOLE_SIGNAL: REQUIRED
reduced_motion: 0ms
stylus_alternative: TAP_AND_GUIDED_TRACE
screen_reader_labels: REQUIRED
```

색상 외에 텍스트·아이콘·상태명을 함께 사용한다. Active Stroke 중에는 회로 이동·전역 스크롤·Long press를 금지한다.

## 승인 경계

이 문서는 Low-fi Harness의 자동 계약을 승인한다. 실제 Android/iOS 기기, 손가락 가림, Narrow/Tall Landscape, Screen Reader, 성능과 사람 이해도는 `NOT_RUN`이며 완료로 주장하지 않는다.
