# GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01 적대적 검토

## 검토 상태

```yaml
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
approved_option: C_STAGED_RECOGNITION_THEN_CORE_LOOP
review_status: SPEC_ADVERSARIAL_REVIEW_COMPLETE
human_execution: NOT_RUN
result: CONDITIONAL_PASS_FOR_HARNESS_HX_DESIGN
merge_authorized: false
runtime_expansion_7_plus: BLOCKED
```

## 현업·플랫폼 비교

- Android 접근성 지침의 권장 Touch Target 48dp를 기본 하한으로 채택한다: `ANDROID_TOUCH_TARGET_48DP`.
- Apple 접근성·디자인 지침의 44×44pt를 iOS 기본 하한으로 채택한다: `IOS_TOUCH_TARGET_44PT`.
- WCAG 2.2 Target Size Minimum 24×24 CSS px는 웹 하한 비교값으로 기록한다: `WCAG_2_2_TARGET_SIZE_MINIMUM_24_CSS_PX`.
- 본 모바일 프로젝트는 더 엄격한 플랫폼 기준을 사용한다: `PROJECT_USES_STRICTER_PLATFORM_TARGETS`.
- Drag만 가능한 입력은 접근성·운동 제약 사용자에게 불리하므로 취소·초기화·후보 선택·확정에 탭 대안을 둔다: `NON_DRAG_ALTERNATIVE_REQUIRED`.

전이 한계: 48dp·44pt·24px는 Target 크기 기준이며, 실제 손가락 필사 정확도·회로 이해·게임 재미를 보장하지 않는다. 따라서 플랫폼 준수와 사람 검증 결과를 분리한다.

## 핵심 적대 질문

1. 참가자가 Stage 1에서 글자 모양을 외워 Stage 2를 쉽게 통과하는 것을 핵심 재미로 오인하지 않는가?
2. Non-dominant hand 결과가 실제 플레이를 대표하지 않는데 전체 품질을 과도하게 낮추지 않는가?
3. 6명 TEST_VALUE 결과를 출시 품질이나 모집단 통계로 과장하지 않는가?
4. 같은 참가자를 사용하면서 Stage 1 피로·학습이 Stage 2를 왜곡하지 않는가?
5. Recognition 성공률이 높아도 상황·의미·회로 판단이 약한 문제를 숨기지 않는가?
6. 짧은 Harness 결과를 46–53분 전체 Vertical Slice 대표성 PASS로 오해하지 않는가?

## 주요 Finding

### P1 — 학습 효과가 핵심 회로 이해로 오인될 위험

Stage 1에서 반복한 글자를 Stage 2에서 다시 사용하면 모양 학습이 의미 이해처럼 보일 수 있다.

대응:

- Stage 2는 모양 재현 점수가 아니라 상황 목표·의도 설명·출처·Preview·결과 인과를 측정한다.
- 글자 순서와 상황 순서를 교차 배치한다.
- `FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED`를 유지한다.

### P1 — 피로와 입력 결함 혼재

24회 Scored attempt 후 바로 회로를 수행하면 피로가 핵심 루프 실패로 보일 수 있다.

대응:

- `SAME_PARTICIPANT_WITH_BREAK`를 적용하고 최소 10분 휴식한다.
- 12회와 24회 피로를 따로 기록한다.
- 손·기기·시도 순서를 분리 집계한다.

### P1 — 진행자 개입이 사용성을 과장할 위험

진행자가 의미나 회로 정답을 설명하면 시스템이 아니라 진행자가 문제를 해결한다.

대응:

- 고정 진행 Script를 사용한다.
- first attempt와 intervention 이후를 분리한다.
- 해법·회로·최적 조합 직접 제시는 금지한다.
- 진행자 해법 Prompt 1건 이상이면 해당 과제는 독립 성공으로 집계하지 않는다.

### P1 — 기기 표본이 좁아 레이아웃 결함을 놓칠 위험

같은 해상도·크기만 시험하면 Safe Area·손가락 가림·Panel 과밀 결함을 놓친다.

대응:

- 최소 2개 Smartphone Landscape 비율군을 사용한다.
- 기기군별 결과를 합산만 하지 않고 별도 표기한다.
- iOS 대상이 활성화되면 실제 iPhone Smoke를 추가한다.

### P1 — 합격 임계값 과적합

80%·95%·5/6 같은 후보값은 근거가 부족한 소표본 `TEST_VALUE`다.

대응:

- `ALL_NUMERIC_THRESHOLDS_ARE_TEST_VALUE`로 명시한다.
- Hard Stop과 Tune Candidate를 분리한다.
- 첫 세션 관측 후 임계값을 유지·변경한 이유를 기록한다.

### P1 — Recognition이 핵심 재미를 대체할 위험

사용자가 글자를 잘 그리는 것에만 집중하면 상황·의미·결과 책임이 약해진다.

대응:

- Stage 2에서 Commit 전 의도 설명과 Commit 후 인과 회상을 필수로 한다.
- Recognition 지표와 Core-loop 지표를 하나의 평균 점수로 합치지 않는다.
- Recognition은 입력 기반이며 핵심 재미가 아니라는 정본을 유지한다.

### P1 — 짧은 Bridge가 전체 Slice 대표성으로 과장될 위험

상황 2종만으로 수업·학교생활·제작·자유일정·전투·평가의 전체 대표성을 증명할 수 없다.

대응:

- `NOT_A_FULL_VERTICAL_SLICE_REPRESENTATIVENESS_PASS`를 결과 표제에 포함한다.
- 기존 `GR-TEST-021` 46–53분 전체 Slice 검증을 별도 Gate로 유지한다.

### P1 — 안전·데이터 무결성

오인식 승인, accidental Commit, 중복 비용·결과, stale 저장은 재미 문제가 아니라 제품 신뢰 중대 결함이다.

대응:

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
RUNTIME_EXPANSION_7_PLUS_BLOCKED
```

한 건이라도 발생하면 Stage 2 또는 확대를 중단한다.

## 수용·거부 사례

### 수용

- 첫 시도는 실패했지만 Retry 이유를 이해하고 올바른 글자를 저장한다.
- Non-dominant hand만 느리지만 오인식 승인은 없고 Dominant hand는 안정적이다.
- 회로 문법 오류를 Preview가 명확히 설명해 사용자가 Commit 전에 수정한다.
- 결과가 기대와 달라도 사용자가 자신의 의미·대가와 인과를 설명한다.

### 거부

- 가장 가까운 후보가 오답인데 자동 확정된다.
- 글자 입력 실패를 상황 해법 실패로 잘못 설명한다.
- 진행자가 정답을 알려준 뒤의 성공을 독립 성공으로 집계한다.
- 6명 결과를 출시 품질 PASS로 선언한다.
- 짧은 2상황 Harness를 전체 Vertical Slice 대표성으로 선언한다.
- 최종 아트·7번째 글자·대량 콘텐츠를 사람 검증 전에 제작한다.

## PR 체크 결론

```yaml
planning_conflict: RESOLVED_BY_USER_APPROVAL
protocol_spec: PASS
adversarial_review: PASS_WITH_GATES
human_execution: NOT_RUN
visual_hx: NEXT_REQUIRED
codex: BLOCKED_UNTIL_HX_COMPLETE
pr_63_ready_or_merge: NOT_AUTHORIZED
```

```text
FINAL_ART_AND_CODEX_BLOCKED_UNTIL_REVIEW_GATE
```

본 적대 검토로 Spec Review Gate는 완료됐지만 Stage 2 Harness에 필요한 최소 UX/HX 상태팩은 아직 작성되지 않았다. 따라서 다음 작업은 최종 아트가 아니라 검증용 최소 상태·전환·피드백 HX를 정의하는 것이다.
