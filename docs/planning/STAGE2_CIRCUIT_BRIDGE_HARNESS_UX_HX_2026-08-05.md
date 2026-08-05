# Stage 2 Circuit Bridge Harness UX/HX — 2026-08-05

## 문서 계약

```yaml
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
sync_id: GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX
status: HX_SPEC_COMPLETE_READY_FOR_CODEX_TDD
artifact_class: LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART
platform: MOBILE_LANDSCAPE_FIRST_PC_LATER
runtime_glyphs: EXACTLY_6
human_execution: NOT_RUN
grill_counter_change: false
```

이 문서는 최종 전투 HUD나 최종 아트가 아니다. `GR-TEST-032`의 Stage 2에서 입력 문제와 핵심 회로 문제를 분리·연결하기 위한 최소 검증 Harness의 정보 구조, 상태, 전환, 피드백을 고정한다.

## 핵심 목표

```text
상황을 잃지 않는다
→ 의미와 자원 출처를 명시한다
→ 글자를 작성하거나 기존 자원을 선택한다
→ 대상과 3×3 회로를 구성한다
→ Preview에서 의미·비용·위험을 읽는다
→ 별도 확인 후 Commit한다
→ 결과와 대가의 인과를 설명한다
```

정본 경계:

```text
NO_AUTOMATIC_SOLUTION_OR_BEST_GLYPH_RECOMMENDATION
SCENARIO_CONTEXT_SURVIVES_RECOGNITION_RETRY
EXPLICIT_VAULT_OR_STOCK_SOURCE_PER_GLYPH
```

## 기존 모바일 HUD 공간 권위 보존

### 상단 — 상황 정보 상시 영역

```text
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
```

- Objective, Threat, Situation을 모든 상태에서 표시한다.
- 압박 상황 Fixture에는 Pressure Clock을 함께 표시하며 Panel 전환 중에도 멈추거나 숨기지 않는다.
- Recognition Retry, 오류 복구, Preview, Commit 확인 중에도 상단 정보를 유지한다.
- 진행자가 제공한 해법이나 추천 글자는 표시하지 않는다.

### 좌측 — 읽기 전용 글자 Rail

```text
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
```

- `MAIN`, `S1`, `S2`, `S3` 위치를 기존 모바일 HUD와 동일한 공간 언어로 유지한다.
- Harness에서는 Drag 이동·장기 보관함 관리·정렬 기능을 제외한다.
- 선택된 글자의 의미, 타입, 출처 상태만 읽기 전용으로 표시한다.
- 비어 있는 슬롯은 `미선택` 텍스트와 윤곽 아이콘으로 구분한다.

### 중앙 — 대상과 3×3 회로

```text
CENTER_TARGET_AND_3X3_CIRCUIT
```

- 상단 절반은 현재 대상 1~4개와 상황 관계를 표시한다.
- 하단 절반은 3×3 회로를 표시한다.
- 노드는 Main 1, Support 0~2, Target 1~4의 의미·출처 배지를 함께 보여준다.
- 유효하지 않은 연결은 자동 수정하지 않고 이유를 텍스트로 설명한다.
- 자동 최적화, Best Glyph, 추천 회로, 확률 숫자를 표시하지 않는다.

### 우측 — 필사 Focus Panel

```text
RIGHT_WRITING_FOCUS_PANEL
ACTIVE_STROKE_OWNER_WRITING_CANVAS
```

- 글자 작성 중에는 Writing Canvas만 Stroke Pointer를 소유한다.
- Active Stroke 중 전역 Scroll, Drawer Drag, Circuit Pan, Long Press를 비활성화한다.
- 획 종료 후 인식 후보·Retry·성공 상태를 텍스트와 아이콘으로 표시한다.
- Retry해도 상단 상황, 중앙 대상, 기존 회로, 자원 출처 선택은 유지한다.
- `취소`, `초기화`, `후보 직접 선택`은 Tap 대안으로 제공한다.

### 하단 — 자원·Preview·Commit

```text
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
```

- HP·Mana와 선택 글자별 `VAULT` 또는 `STOCK` 출처를 표시한다.
- 출처는 각 글자마다 명시적으로 선택한다.
- Preview는 의미, 비용, 위험, 대상, 무효 이유를 보여준다.
- Commit은 Preview 완료 후 별도 확인 단계에서만 가능하다.
- 취소는 자원·회로·결과를 변경하지 않고 이전 상태로 돌아간다.

## 입력 규칙

```text
EXPLICIT_VAULT_OR_STOCK_SOURCE_PER_GLYPH
NON_DRAG_ALTERNATIVE_REQUIRED
CANCEL_RETURNS_WITHOUT_MUTATION
COMMIT_REQUIRES_SEPARATE_CONFIRMATION
```

- Drag는 회로 연결 또는 필사에만 사용한다.
- 모든 Drag 기반 조작에는 Tap 기반 선택·취소·초기화 대안을 제공한다.
- Source가 없는 글자, stale Recognition, 낮은 확신, 선택/인식 불일치, 무효 회로에서는 Commit을 비활성화한다.
- Commit 확인 Dialog는 의도, 글자, 출처, 대상, 비용, 위험을 한 화면에서 요약한다.
- Confirm과 Cancel은 서로 충분히 분리된 위치와 명시적 텍스트를 사용한다.

## 상태 전환

```text
SCENARIO_BRIEF
→ INTENT_AND_SOURCE_SELECT
↔ WRITING_FOCUS
↔ CIRCUIT_EDIT
→ PREVIEW_READY
→ COMMIT_CONFIRM
→ SYSTEM_RESOLVE
→ RESULT_EXPLAIN
```

오류 시:

```text
ERROR_SAFE_RECOVERY
→ 원래 Context를 보존한 직전 편집 상태
```

- 오류가 발생해도 상황·목표·대상·선택 글자·출처·회로 Draft를 보존한다.
- 오인식 승인, stale 반영, 중복 저장, accidental Commit은 복구 가능한 일반 오류가 아니라 Hard Stop으로 기록한다.

## 피드백 계층

1. **행동 가능 상태**: 버튼 Label과 활성/비활성 이유.
2. **입력 상태**: 획 입력, 분석 중, Retry, 후보 확인, 저장 성공.
3. **회로 상태**: 유효/무효 이유, 출처 누락, 대상 도달성, 비용·위험.
4. **결과 상태**: Commit 결과와 선택·대가의 인과.

```text
COLOR_IS_NOT_THE_ONLY_STATE_SIGNAL
```

색상은 보조 표현만 사용하고, 아이콘·텍스트·윤곽·상태 제목을 함께 제공한다.

## HX·모션

```text
TRANSITION_DURATION_120_TO_180_MS_TEST_VALUE
REDUCED_MOTION_ZERO_DURATION_STATE_SWAP
NO_MOTION_DURING_ACTIVE_STROKE
```

- Panel 전환과 상태 강조는 120~180ms `TEST_VALUE` 범위의 단순 Fade/Scale만 사용한다.
- Reduced Motion에서는 애니메이션을 0ms 상태 교체로 바꾼다.
- Active Stroke 중에는 Canvas, 상황 정보, 회로, Clock에 움직임을 추가하지 않는다.
- Error 상태에서 흔들기·점멸을 사용하지 않고 정적 윤곽·아이콘·문구를 사용한다.
- 성공 연출은 짧은 윤곽 강조와 결과 문구로 제한한다.
- 최종 VFX, 캐릭터 애니메이션, 카메라 Shake, 파티클은 필요하지 않다.

## 접근성 기준

```text
ANDROID_TOUCH_TARGET_48DP
IOS_TOUCH_TARGET_44PT
NON_DRAG_ALTERNATIVE_REQUIRED
PROJECT_USES_STRICTER_PLATFORM_TARGETS
```

- Android Target은 최소 48dp.
- iOS Target은 최소 44×44pt.
- 웹 WCAG 2.2의 24×24 CSS px는 비교 하한이며 모바일 기본값으로 축소하지 않는다.
- Text Scale 100%, 130%, 200%에서 Objective·Threat·Situation·Preview·Commit 이유를 읽을 수 있어야 한다.
- Safe Area 침범, 손가락 가림, Source Badge 과밀을 2개 Smartphone Landscape 비율군에서 검증한다.

## 검증 로그

```text
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_RAW_PERSONAL_IDENTIFIER
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED
```

- 참가자는 익명 Session ID만 사용한다.
- 이름, 연락처, 계정, 원본 생체 정보는 저장하지 않는다.
- Recognition 이벤트와 Core-loop 이벤트를 별도 Stream으로 기록한다.
- 진행자 개입 시 시각, 개입 유형, 제공 문구를 기록한다.
- Fixture ID, Build/Artifact SHA, 기기군, 손 조건을 각 Session에 묶는다.
- 원시 Stroke를 저장하는 경우에도 개인식별정보와 결합하지 않으며 보존 정책을 별도로 명시한다.

## Hard Stop

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
```

## 범위 제외

- 최종 아트·VFX·애니메이션 제작.
- 7번째 Runtime 글자.
- 전체 학교·전투·제작 콘텐츠.
- 자동 추천·최적해·확률 표시.
- Human 결과를 미리 생성하거나 PASS로 가정.

## Codex 인계 상태

```text
READY_FOR_CODEX_TDD_HARNESS
HUMAN_EXECUTION_NOT_RUN
```

이 문서와 State Matrix가 Green이면 Stage 2 최소 Harness 구현만 Codex로 넘긴다.
