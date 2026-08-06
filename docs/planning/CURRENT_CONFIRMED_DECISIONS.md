# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_CONTRACT_V4_3_GUT_SPEC_IN_REVIEW
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3
contract_binding_decision: GM-CONTRACT-V4-3-BINDING-01
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
runtime_layout: FIVE_POINT_STAR
current_gate: BLOCKED_BY_GUT_ADOPTION_SPEC
spell_workflow_implementation_pr: 82
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_design_pr: 83
tool_authority_design_status: MERGED_MAIN_252063cc
gut_adoption_spec_pr: 84
gut_adoption_spec_status: OPEN_DRAFT_IN_REVIEW
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
higodot_authority: SOLE_AUTHORING_AUTHORITY
gut_version: 9.7.1
gut_status: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
merge_authorized: false
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## GM-CONTRACT-V4-3-BINDING-01

사용자 승인일: 2026-08-06.

업로드된 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3.md`를 GRIMOIRE의 활성 통합 계약으로 사용한다.

프로젝트별 바인딩:

```text
docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
```

### 프로젝트 권위 입력

```yaml
project_repository: alsdmlals4-eng/GRIMOIRE-
project_default_branch: main
project_local_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
godot_project_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
project_google_sheet: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
shared_audio_vault_path: C:/Users/user/Documents/GitHub/shered audio vault
```

v4.3 원문의 Switchy-Express 경로는 범용 예시이며 GRIMOIRE 권위 값이 아니다. v4.2는 역사·비교 증거로만 남긴다.

### v4.3 핵심 변경

- 작업 진입 전에 Decision Ledger·미확정 목록·이미지 검수 Sheet를 다시 읽고 상태를 재계산한다.
- `[이미지 완료]`는 `[이미지·오디오 완료]`와 같은 단계로 해석한다.
- 공유 오디오 Vault를 새 사운드 생성보다 먼저 확인한다.
- GUT 정식 설치 전에 adoption-spec 전용 branch와 Draft PR을 먼저 병합한다.
- 별도 인간 reviewer가 있다고 가장하지 않는다. `GPT 역할 분리 검토 + 사용자 결정권 + GUT/CI 증거 + exact-HEAD Check`를 사용한다.

## 보존되는 제품 정본

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, 중앙 Main 1개, Auxiliary 0~5개, 글자별 숙련도, Typed Glyph Stock, 명시 Preview, Exactly-once 자원 처리를 유지한다.

`GM-SPELL-WORKFLOW-UI-V2-01`의 주문 흐름도 유지한다.

```text
1. 글자 그리기 → 인식·획득·보관함 저장
2. 회로 배치 → 보관함/스톡 예약·Preview·글자 소비·완성 주문 생성
3. 주문 사용 → 대상 선택·상세 예상 결과·마나 소비·실제 판정
```

PR #82 Task 1은 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환을 구현해 자동 회귀를 통과했다. Task 2는 시작하지 않는다.

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

### HiGodot

- `project.godot`, Scene·Node·`*.tscn`, `*.tres`, `*.res`, Resource, Theme, Animation, signal, Project Settings의 단일 저작 권위.
- protected diff에는 `HIGODOT_AUTHORING_MANIFEST`와 Scene/Resource/Project Settings readback이 필요하다.
- 테스트 assertion·expected value·fixture·CI 성공 기준 수정 금지.
- canonical source commit·license·Godot 4.7.x·telemetry는 아직 `BLOCKED_UNVERIFIED`다.

### GUT 9.7.1

```yaml
canonical_repository: bitwes/Gut
source_branch_or_release: godot_4_7
version: 9.7.1
license: MIT
godot_compatibility: 4.7.x
repository_state: VENDORED_NOT_CONSUMED
formal_adoption: NOT_YET_IMPLEMENTED
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
editor_plugin: DISABLED
adoption_spec_branch: chore/gut-9.7.1-adoption-spec
adoption_spec_pr: 84
```

채택 명세:

```text
docs/testing/GUT_9_7_1_ADOPTION_SPEC.md
docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md
```

PR #84는 원칙적으로 명세·Decision·검증 계획만 포함한다. `.gutconfig.json`, actual `GutTest`, GUT runtime workflow, `project.godot`, Scene, Resource, asset 변경은 금지한다.

## v4.3 진입 상태 재판정

```yaml
prior_state: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
current_state: BLOCKED_BY_GUT_ADOPTION_SPEC
reconciliation: docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
reason: GUT adoption spec Draft PR must merge before formal installation
```

동결 브랜치:

```yaml
branch: agent/gut-9-7-1-formal-adoption-tdd
status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
merge_authorized: false
counts_as_adoption_evidence: false
```

PR #84 병합 후 최신 main에서 구현 브랜치를 새로 만든다. 동결 브랜치 commit은 자동 병합·cherry-pick하지 않는다.

## 리뷰 정책

```yaml
active_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
required:
  - exact diff와 정본·테스트 결과를 구현자 설명에서 분리해 검토
  - P0/P1 finding 0
  - GUT/CI 객관 증거
  - exact-HEAD PR Check
  - 사용자 결정 권위
```

PR #83의 사용자 한정 리뷰 예외는 당시 병합의 역사 증거로 유효하지만 후속 PR 검토 모델이 아니다.

## Base 정합성

프로젝트 Base pin은 9.4.3이다. Base 최신 main `4f98f968a377f7b6a11aafa4fc94d11bddbebedc`의 선택적 애드온 소비 정책은 GUT의 실제 소비·제거 계획을 요구하는 v4.3과 정합한다. pin 변경은 승인·수행하지 않았다.

## 이미지·오디오 상태

```yaml
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
audio_vault_path: BLOCKED_UNVERIFIED
audio_rights: BLOCKED_UNVERIFIED
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

## 현재 금지

- PR #82 Task 2.
- GUT formal installation 또는 채택 완료 선언.
- GUT Editor Plugin 활성화.
- UI v2 Main Scene 전환.
- 최종 시각·오디오·Runtime·기기 완료 선언.
- 로컬 sync·Godot run 완료 주장.

## 다음 Gate

PR #84의 v4.3 바인딩·adoption-spec·Decision을 같은 ID로 Google Sheet에 동기화하고 exact-HEAD CI와 역할 분리 검토를 통과시킨다. 병합·main readback 후에만 새 GUT formal-installation TDD PR을 시작한다.
