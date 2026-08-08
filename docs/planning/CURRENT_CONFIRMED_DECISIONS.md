# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_V4_4_GUT_FORMALLY_ADOPTED
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_pr: 87
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
gut_vendor_equivalence_decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_merged_main: a35baed94fe064e57529ffee7b8c48e14ac5e1bb
hera_sheet_sync: SHEET_WRITE_READBACK_PASS
gut_status: GUT_FORMALLY_ADOPTED
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

현재 `main` 자체는 저장된 SHA가 아니라 `project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK`로 판정한다. 역사적 merge SHA는 역할 증거로만 보존한다.

## GM-CONTRACT-V4-4-BINDING-01

```yaml
project_repository: alsdmlals4-eng/GRIMOIRE-
project_default_branch: main
project_local_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
godot_project_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
project_google_sheet: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
base_binding_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
base_latest_main_observed: a912cc001ff4d4e3415fb4b4931723c49eb08d9a
base_release_pin: 9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
codex_handoff: NOT_REQUESTED
```

## 보존 제품 결정

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, Typed Glyph Stock, Exactly-once 처리와 `GM-SPELL-WORKFLOW-UI-V2-01`의 `글자 그리기 → 회로 배치 → 주문 사용`을 유지한다.

PR #82 Task 1 GREEN은 보존한다. Task 2 제품 구현은 아직 `NOT_STARTED_ON_BRANCH`이고 `spell_workflow_task2_authorized: false`다. 다만 잘못된 순환 선행조건을 제거해 `READY_FOR_HIGODOT_AUTHORING`으로 분류한다. Persistent Godot authoring은 HiGodot 단일 권위와 receipt Gate를 반드시 사용한다.

## GM-SPELL-WORKFLOW-UI-V2-01 — visual/platform gate sequencing

```yaml
sync_id: GR-SYNC-20260808-07-VISUAL-PLATFORM-GATE-SEQUENCING
shared_core_status: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
shared_core_evidence: docs/validation/WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL.json
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
visual_audio_complete: false
audio_vault: AUDIO_VAULT_PATH_UNVERIFIED
audio_rights: AUDIO_RIGHTS_UNVERIFIED
```

Base PC·Android guide의 one-core/platform-adapter 원칙에 따라 `src/core`가 gameplay/data/deterministic authority를 유지하고 `mobile_safe_root`가 layout adapter 역할을 한다. `export_presets.cfg`가 없으므로 실제 export/device 완료를 주장하지 않는다.

승인된 UI v2 구현 계획에서 root/end-to-end는 Task 9, render/CI evidence는 Task 10이다. 따라서 `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`은 구현 이후 acceptance 대기이며 Task 2 선행 blocker가 아니다.

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

```yaml
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_editor_plugin: DISABLED
gut_full_vendor_tree_identity: false
gut_critical_runtime_equivalence: APPROVED
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_live_canary_run: 31254032278
hera_acceptance_qa_authorized: true
hera_persistent_source_mutation_authorized: false
```

## GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01

```yaml
repo_wide_actions_full_sha: PASS
status: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
```

## Google Sheet

이 visual/platform sequencing 결과는 PR #93 merged-main readback 후 동일 `GM-SPELL-WORKFLOW-UI-V2-01`로 Sheet에 최종 동기화한다. 그 전에는 Sheet 완료를 주장하지 않는다.

## 현재 남은 Gate

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9  # post-implementation acceptance, not Task2 prerequisite
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```
