# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_current_main_observed: 6d2feba2bc49fda2d8d273248b55087853615d5d
base_project_pin: v9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_RECEIPT_HERA_REVIEW_PR
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
local_execution_policy: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_policy: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_local_environment_policy: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
higodot_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_live_session: task8-spell-use-screen-v2@3cfa
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
higodot_direct_tool_state_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
tracked_project_godot_editor_plugins: GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_task8_acceptance: REQUIRED_PENDING_HERA_SOURCE_DELTA_NONE
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
```

v4.5 r2는 Base current canon을 복제하지 않는 thin adapter다. Base `7ce3fb64...`는 v4.5 원문 작성 시점의 `HISTORICAL_OBSERVATION_ONLY`이고, 현재 work unit에서 관찰한 Base main은 `6d2feba2...`다. 이 값도 영구 project pin이 아니며 실제 Base `main`은 매 작업 다시 읽는다. Base v9.4.3 pin은 변경하지 않았다.

## 로컬 실행 시작 규칙

로컬 작업은 항상 사용자가 직전 PowerShell을 닫았다고 가정한다.

```text
새 PowerShell 열기
→ 전용 self-contained GRIMOIRE Godot 존재/정확성 확인
→ 없으면 제품 작업 전에 전용 환경 생성·복구
→ exact requested GRIMOIRE project/worktree의 Godot만 재사용/실행
→ project-scoped HiGodot profile/server/ports 확인·attach/start
→ project-scoped CODEX_HOME 설정
→ live QA가 필요하면 project-approved Hera exact pair/profile 확인
→ exact worktree에서 Codex 실행
→ Codex 내부 fresh HiGodot exact-project/version/readiness receipt
→ 이후에만 persistent authoring
```

사용자에게는 **Codex prompt보다 먼저 한 덩어리 PowerShell bootstrap block**을 준다. 이전 shell 변수나 current directory를 재사용하지 않는다. wrong worktree/editor, 다른 프로젝트 HiGodot/Hera profile·port, global CODEX_HOME leakage, duplicate editor, path quoting, process-but-not-ready를 fail-closed로 확인한다.

Bootstrap은 `reset`, `restore`, `clean`, stage, rewrite, unrelated process kill 권한이 아니다. 이미 분류된 LF/CRLF/stat noise나 broad Git diff를 Codex 시작 전에 장문 출력하지 않는다. process/port 존재는 readiness 증거가 아니며 Codex 내부에서 fresh receipt를 다시 읽는다.

Hera shared token 원문은 저장소·prompt·log·evidence에 기록하지 않는다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 핵심 흐름은 계속 다음과 같다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재까지 병합된 구현:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen

Task8은 Task5 Stage3 authority의 thin UI consumer이며 새 target/use authority를 만들지 않는다.

사용자 제공 최신 Codex 실행 증거에서는 exact Task8 V2 project session `task8-spell-use-screen-v2@3cfa`, Godot 4.7.1, HiGodot server/plugin 3.1.4, readiness `ready`가 관찰됐다. 별도 `expected_version` field는 surfaced되지 않았으므로 그 equality는 주장하지 않는다.

Task8 local refinement는 다음까지 GREEN으로 보고됐다.

```yaml
focused_gut: 15_TESTS_90_ASSERTIONS_0_FAILURES
predecessor_regression: 42_SUITES_1588_ASSERTIONS_0_FAILURES
ui_behaviors:
  - actual_target_controls
  - prepared_spell_summary
  - stale_invalid_visual_fail_closed
  - two_stage_explicit_confirmation
  - actual_cancel_button
  - deterministic_focus_and_text_semantics
```

이것은 아직 merged-main 제품 증거가 아니다. 다음 gate는:

```text
fresh dedicated local environment bootstrap
→ fresh exact-project HiGodot receipt
→ protected-delta HiGodot authoring receipt/readback
→ pre-Hera tracked-source snapshot
→ Hera LIVE_QA_AND_OBSERVABILITY_ONLY
→ post-Hera tracked-source snapshot
→ HERA_SOURCE_DELTA: NONE
→ independent/adversarial review
→ PR exact-head CI
→ merge / merged-main readback
```

Task 9은 기존 승인된 Mobile landscape device matrix(16:9, 18:9, 19.5:9, 20:9, cutout/safe-area, foldable/tablet)를 계속 소유한다.

## 도구 권위

- HiGodot/Godot AI `v3.1.4`: tracked plugin subtree는 공식 v3.1.4 `69010571e11123dfc4e09483f80cb9e6ca93511a`와 exact identity PASS이며 persistent `.gd/.tscn/.tres/.res/project.godot` 저작의 단일 권위를 유지한다.
- latest Task8 live session은 exact-project server/plugin `3.1.4 / 3.1.4`, readiness `ready`로 관찰됐다. `expected_version` field는 surfaced되지 않았다.
- direct tool-state commit `257a0dba33f8288d24b1cd291bb407f4505224b4`의 formal HiGodot receipt는 여전히 `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`이다.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation 금지. Task8 acceptance에는 `HERA_SOURCE_DELTA: NONE`이 필요하다.

## 역사 증거와 현재 권위 분리

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
historical_higodot_v3_1_3_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
historical_higodot_v3_1_3_tree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

v3.1.3 / Task 2 / Task 3 / v4.4 자료는 삭제하지 않고 provenance로 보존한다. Sync19의 당시 live-pending 문구도 역사 evidence에서는 변경하지 않는다.

## 현재 완료로 주장하지 않는 항목

```text
TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING
TASK8_HERA_ACCEPTANCE_PENDING
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

## 읽기 순서

1. `AGENTS.md`
2. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md`
3. `docs/planning/sync/GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING.md`
4. `docs/ACTIVE_CONTEXT.md`
5. `docs/DEVELOPMENT_GATES.md`
6. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
8. `docs/planning/CANON_SYNC_STATE.json`
9. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT.md`
11. `docs/planning/sync/GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION.md` — historical predecessor sync
12. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md` — historical only

## 계약 바인딩

현재 GitHub 정본 계약은 v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`이다. v4.4는 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 보존한다. Sync20은 운영 실행환경 consumer이며 제품 Decision을 변경하지 않는다.
