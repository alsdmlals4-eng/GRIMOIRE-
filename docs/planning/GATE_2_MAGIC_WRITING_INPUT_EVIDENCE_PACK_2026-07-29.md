# 마법 글자 작성·인식 Evidence Pack Pilot

```yaml
evidence_pack_id: GRIMOIRE-EVP-001
project: 스펠 / GRIMOIRE
baseline_branch: main
baseline_commit: 9dec9f72217e61b67f5c0b6339c7c26779404df0
created_at: 2026-07-29
work_mode: PLAN
status: PILOT_RECOMMENDATION
implementation_authority: NONE
human_validation: NOT_RUN
method_reference: Base dc9603595155989e13fb92edff347df5c725217e
```

> 이 문서는 승인된 코어·Vertical Slice·화면 구조를 재개방하지 않는다. Godot 구현이나 Codex Build를 승인하지 않으며, 향후 마법 작성 오버레이와 입력 Prototype의 검증 계약을 정의한다.

## 1. 현재 코어와 보호 경계

- 플레이어는 마법 글자의 의미를 배우고 상황에 맞는 주문을 직접 설계한다.
- 기본 조합은 `메인 글자 1개 + 보조 글자 0개 이상`이다.
- 신규·미숙·중요 글자는 직접 작성한다.
- 입력 실패와 설계 실패를 분리한다.
- 주문 결과는 즉각적이고 설명 가능한 세계 변화로 이어진다.
- 마법 작성은 현재 화면 감속·암전과 전용 작성 오버레이를 사용한다.
- 소환수는 글자·회로 작성, 글자 선택, 정답 제시를 대행하지 않는다.
- 별도 CORE_POC를 재도입하지 않고 Vertical Slice 안의 작은 기술 Prototype로 검증한다.

## 2. 결정 질문

> 손가락 또는 스타일러스로 글자를 직접 쓰는 과정에서 **입력 인식 실패**와 **주문 설계 실패**를 명확히 분리하면서, 플레이어가 손맛·학습·표현을 잃지 않게 하려면 작성 오버레이는 어떤 피드백과 확인 단계를 가져야 하는가?

### 성공 조건

- 플레이어가 시스템이 어떤 글자로 인식했는지 시전 전에 안다.
- 인식 오류와 의미 조합 오류를 서로 다른 원인으로 설명한다.
- 잘못 인식된 획만 빠르게 수정하고 전체 주문을 처음부터 반복하지 않는다.
- 손가락 입력에서도 궤적과 대상·위험 정보를 잃지 않는다.
- 숙련 증가가 직접 작성의 정체성을 없애지 않는다.
- 결과 화면이 `인식된 글자 → 조합 의미 → 세계 변화`를 연결한다.

### 실패 조건

- 낮은 인식 확신 상태에서 다른 글자가 즉시 시전된다.
- 잘 썼는데 설계가 틀린 경우와 못 써서 인식이 틀린 경우가 같은 실패 연출을 쓴다.
- 손가락이 궤적·분기·목표를 가려 입력 중 상태를 볼 수 없다.
- 작은 버튼·좁은 캔버스·지연된 선 표시로 쓰기 자체가 피로해진다.
- 자동 보정이 강해져 아무렇게나 그려도 정답이 된다.

## 3. 선택 Coverage

| Coverage | 상태 | 이유 |
|---|---|---|
| 프로젝트 코어·게임 기획 | EVIDENCED | 직접 쓰는 마법과 의미 조합이 코어다. |
| 플레이어 경험·게임 필 | EVIDENCED | 손맛·학습·실패 귀인을 검증한다. |
| UX·UI·접근성 | EVIDENCED | 손가락 가림·터치 크기·피드백이 핵심이다. |
| AI·기술 기획 | EVIDENCED | 인식기는 후보·확신을 반환하되 의미 판단을 소유하지 않아야 한다. |
| Godot 구현 | NOT_APPLICABLE | 이번 Pilot은 구현 방식을 확정하지 않는다. |

## 4. Evidence

| ID | 층 | 출처 | 확인된 활용점 | 한계 |
|---|---|---|---|---|
| EVD-GR-01 | T1_PRIMARY_OFFICIAL | Wobbrock, Wilson, Li, UIST 2007, $1 Recognizer | 적은 템플릿으로 단일 획 제스처를 Prototype에서 인식하는 단순 접근을 제시한다. | 실제 마법 글자가 다중 획·회전·순서 의미를 가지면 그대로 사용할 수 없다. |
| EVD-GR-02 | T5_SYNTHESIS | Zhai et al., Foundational Issues in Touch-Surface Stroke Gesture Design, 2012 | 제스처 UI의 운동 제어, 피드백, 기억·학습, 인식 설계 문제를 종합한다. | 게임의 의미 조합과 재미를 자동 보장하지 않는다. |
| EVD-GR-03 | T1_PRIMARY_OFFICIAL | Google Research, FFitts Law / Bayesian Touch | 손가락 터치는 작은 목표 선택에서 불확실성을 가지며 대상 크기와 위치를 고려한 모델이 정확도를 높일 수 있다. | 자유 필기 인식과 동일한 문제는 아니다. |
| EVD-GR-04 | T1_PRIMARY_OFFICIAL | Android Accessibility, Touch target size | 터치 가능한 요소는 최소 48dp 수준의 신뢰 가능한 영역을 권장한다. | Godot의 실제 Control과 손 사용성 검증은 별도다. |
| EVD-GR-05 | T1_PRIMARY_OFFICIAL | Android Developers, Stylus input | 스타일러스의 그리기·필기·압력·기울기·저지연·오동작 방지 지원 방향과 테스트 경계를 제공한다. | 스타일러스 보유를 필수 전제로 만들 수 없다. |
| EVD-GR-06 | T2_PROFESSIONAL_PRACTICE | Holly Gramazio, GDC 2017, Inviting Player Creativity Through Game Mechanics | 제약을 포함한 여러 기법으로 플레이어 창작을 유도하고 각 방식의 함정을 비교한다. | 주문 작성 입력 규격을 직접 제시하지 않는다. |
| EVD-GR-07 | T6_AI_INFERENCE | 본 Pilot 종합 | `획 입력 → 인식 후보 확인 → 의미 조합 → 시전 결과`를 단계 분리해야 손맛과 설명 가능성을 함께 검증할 수 있다. | 사람·기기 검증 전 가설이다. |

## 5. 대안 비교

### A. 입력 완료 즉시 자동 시전

- 장점: 빠르고 연출이 강하다.
- 위험: 오인식이 곧 잘못된 주문이 되어 입력·설계 실패가 섞인다.
- 판정: 신규·중요 글자 기본 흐름으로 `AVOID`.

### B. 인식 후보 확인 후 의미 조합·시전

- 획을 그리는 동안 저지연 궤적을 표시한다.
- 입력 완료 후 인식된 글자, 확신 상태, 수정 가능한 마지막 획을 보여준다.
- 인식 확정 뒤 메인·보조 글자의 의미 관계를 별도 검증한다.
- 시전 후 글자·조합·세계 변화의 인과를 설명한다.
- 판정: `ADAPT`.

### C. 글자 선택 버튼 중심, 작성은 장식

- 장점: 접근성과 안정성이 높다.
- 위험: 직접 쓰는 마법의 손맛과 숙련 약속이 사라진다.
- 판정: 대체 입력 보조안으로 `TEST`, 기본안으로 `AVOID`.

## 6. Pilot 권장안

최종 판정: **`ADAPT` — B안을 Vertical Slice 내부 입력 Prototype로 검증한다.**

### 입력 파이프라인 책임 분리

```text
Raw Stroke Capture
→ Stroke Normalization
→ Glyph Candidate Recognition
→ Player Confirmation / Correction
→ Main + Support Semantic Composition
→ Situation Validation
→ Cast
→ Explainable World Change
```

- 인식기는 `후보 글자 + 확신 상태 + 오류 근거`만 반환한다.
- 주문 의미와 상황 적합성은 별도 규칙 계층이 책임진다.
- 낮은 확신에서는 자동 시전하지 않는다.
- 인식 실패는 글자 다시 쓰기·마지막 획 취소·후보 선택으로 복구한다.
- 설계 실패는 인식된 글자를 보존한 채 조합·대상·순서를 수정한다.

### 작성 오버레이 후보 계약

1. 손가락 아래 선을 즉시 표시하고 약간 앞쪽 또는 상단에 축소 미리보기를 병행한다.
2. 캔버스는 전투 핵심 대상과 위험 경고를 완전히 가리지 않는다.
3. `마지막 획 취소`, `전체 지우기`, `확정`은 실제 터치 영역 48dp 이상을 후보 기준으로 둔다.
4. 색상 외에 선 형태·문구·아이콘으로 상태를 중복 표현한다.
5. 스타일러스는 정밀도 향상 선택지이며 손가락으로 완주 가능해야 한다.
6. 저지연·오동작 방지·화면 비율은 목표 Android 기기에서 별도 측정한다.
7. 자동 보정은 획 떨림 완화에 제한하고 다른 글자 의미로 바꾸지 않는다.

### 성장과 자동화 경계

- 신규·미숙·중요 글자 직접 작성 원칙은 유지한다.
- 숙련 글자의 단축 입력·보조 후보는 `TEST`이며 이번 Pilot에서 확정하지 않는다.
- 자동화가 글자 선택과 상황 판단을 대신하지 않는다.

## 7. Prototype 검증 계약

```yaml
artifact: vertical_slice_embedded_input_prototype
device_matrix:
  - 소형 Android 휴대전화 손가락 입력
  - 중형 Android 휴대전화 손가락 입력
  - 지원 기기 스타일러스 입력 선택 테스트
tester_segment:
  - 터치 액션 경험이 낮은 참가자 3명 이상
  - 그리기·리듬·제스처 게임 경험자 3명 이상
glyph_set:
  - 단순 단일 획 2개
  - 방향 차이가 의미를 바꾸는 글자 1개
  - 다중 획 또는 교차가 있는 중요 글자 1개
primary_metrics:
  - 첫 시도 인식 성공률
  - 수정 후 최종 인식 성공률
  - 오인식 자동 시전 건수
  - 마지막 획 취소·전체 재작성 비율
  - 입력 완료 시간
  - 입력 실패와 설계 실패 구분 설명률
guardrails:
  - 손가락 가림으로 목표·경고를 놓치는가
  - 자동 보정 때문에 다른 형태가 같은 글자로 통과하는가
  - 48dp 미만 조작·오터치·손 피로가 있는가
success:
  - 자동 오시전 없이 참가자가 두 실패 유형을 구분하고 빠르게 수정한다
failure:
  - 인식 오류가 설계 오류로 오해되거나 재작성 반복이 코어 경험을 압도한다
stop:
  - 필수 글자가 손가락 입력으로 안정적으로 구분되지 않으면 글자 문법을 재설계
```

## 8. 적대적 검토

| Finding | 공격 | 판정 | 대응 |
|---|---|---|---|
| ADV-GR-01 | 인식 정확도를 위해 직접 쓰기를 사실상 없앤다. | REJECT | 보조 입력은 대안이며 핵심 글자는 직접 작성한다. |
| ADV-GR-02 | $1 Recognizer를 최종 기술로 조기 확정한다. | MUST_FIX | Prototype 후보일 뿐 다중 획·의미 문법 검증 뒤 기술을 결정한다. |
| ADV-GR-03 | 스타일러스 문서만 보고 모바일 검증을 통과 처리한다. | MUST_FIX | 손가락 완주와 실제 기기 검증을 별도 요구한다. |
| ADV-GR-04 | 확인 단계가 매 주문의 리듬을 끊는다. | SHOULD_FIX | 신규·중요 글자와 낮은 확신 상태에 우선 적용하고 시간 지표를 측정한다. |
| ADV-GR-05 | 자동 보정이 정답을 대신한다. | MUST_FIX | 떨림 완화와 의미 변경을 분리하고 후보를 시전 전 공개한다. |
| ADV-GR-06 | 입력 Prototype가 별도 CORE_POC로 팽창한다. | MUST_FIX | 승인 Vertical Slice 안의 작은 기술 실험으로 제한한다. |

## 9. 현재 결정에 미치는 영향

- 승인된 코어·Vertical Slice·시각 구조·소환수: `NO_CHANGE`.
- 마법 작성 오버레이 기술 검수: `PILOT_RECOMMENDATION`.
- `ART-STYLE-01`: `NO_CHANGE / STILL_BLOCKING`.
- Godot 구현·Codex Build·PR 제품 병합: `NOT_AUTHORIZED`.
- Android·접근성·성능: `NOT_RUN`.

## 10. 원출처

- https://faculty.washington.edu/wobbrock/software.html
- https://faculty.washington.edu/wobbrock/pubs/
- https://research.google/pubs/foundational-issues-in-touch-surface-stroke-gesture-design-an-integrative-review/
- https://research.google/pubs/ffitts-law-modeling-finger-touch-with-fitts-law/
- https://research.google/pubs/bayesian-touch-a-statistic-criterion-of-target-selection-with-finger-touch/
- https://support.google.com/accessibility/android/answer/7101858
- https://developer.android.com/develop/ui/views/touch-and-input/stylus-input
- https://www.gdcvault.com/play/1024069/Inviting-Player-Creativity-Through-Game

Android 문서는 실제 구현 시 최신 API·기기 요구를 다시 확인한다.

## 11. 실행 보고

```yaml
selected_skills:
  - managing-project-intake-and-work-contract
  - analyzing-and-refining-game-concepts
  - governing-game-user-research-coverage
  - evaluating-godot-assets-and-plugins-before-creation
  - running-adversarial-review-and-refinement
work_modes_used: PLAN -> REVIEW
product_paths_changed: false
runtime_validation: NOT_APPLICABLE
human_validation: NOT_RUN
rollback: remove this planning-input document and its Documentation Map link
```