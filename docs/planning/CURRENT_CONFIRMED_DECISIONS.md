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
spell_workflow_status: TASK2_AUTHORIZED_AWAITING_HIGODOT_CHANNEL
spell_workflow_task2_authorized: true
spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING
spell_workflow_task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL
spell_workflow_task2_approval_sync: GR-SYNC-20260809-01-TASK2-USER-APPROVAL
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
visual_platform_merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
visual_platform_sheet_sync: SHEET_WRITE_READBACK_PASS
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

현재 `main` 자체는 저장된 SHA가 아니라 `project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK`로 판정한다. `gut_formal_adoption_main`은 PR #85의 역사 merge, `post_merge_canon_sync_merge`는 PR #87의 역사 merge, `hera_merged_main`은 PR #91 Hera Gate가 처음 merged-main에 들어간 증거, `visual_platform_merged_main`은 PR #93 visual/platform Gate가 처음 merged-main에 들어간 역사 증거다.

## GM-CONTRACT-V4-4-BINDING-01

사용자가 제공한 v4.4 통합 작업지시문을 GRIMOIRE의 활성 계약으로 바인딩한다.

```yaml
project_repository: alsdmlals4-eng/GRIMOIRE-
project_default_branch: main
project_local_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
godot_project_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
project_google_sheet: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
base_binding_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
base_latest_main_observed_pr91: eee98a930219065e30b4d7d14d99d5ac7db44c60
base_main_observed_visual_platform_entry: a912cc001ff4d4e3415fb4b4931723c49eb08d9a
base_latest_main_observed_premerge: cf4c7a60c5b31b042043f91b268f381372fec69a
base_release_pin: 9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
codex_handoff: NOT_REQUESTED
```

v4.3 바인딩은 역사 증거로 보존하지만 현재 권위가 아니다. Base `main`의 최신 관찰이 전진했어도 release pin 9.4.3 갱신은 승인되지 않았다.

## 보존 제품 결정

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, Typed Glyph Stock, Exactly-once 처리와 `GM-SPELL-WORKFLOW-UI-V2-01`의 `글자 그리기 → 회로 배치 → 주문 사용`을 유지한다.

PR #82 Task 1 GREEN은 보존한다. Task 2는 `GR-SYNC-20260809-01-TASK2-USER-APPROVAL`로 사용자가 승인하여 `spell_workflow_task2_authorized: true`다. 구현 자체는 아직 `NOT_STARTED_ON_BRANCH`; readiness는 `READY_FOR_HIGODOT_AUTHORING`, 실행 상태는 `AUTHORIZED_AWAITING_HIGODOT_CHANNEL`이다. v4.4 승인 상속 규칙에 따라 같은 Task2 범위의 구현·검증·Green 후 병합 권한도 유효하지만, Persistent Godot authoring은 HiGodot 단일 권위와 authoring receipt Gate를 반드시 사용한다.

승인된 구현 계획의 Task 9–10에서 생성되는 three-screen runtime evidence를 Task 2 선행조건으로 두지 않으며, 현재 three-screen runtime PASS를 주장하지 않는다.

## GM-SPELL-WORKFLOW-UI-V2-01 — Task 2 approval

```yaml
sync_id: GR-SYNC-20260809-01-TASK2-USER-APPROVAL
approval: USER_APPROVED_2026-08-09T06:19+09:00
task2: NOT_STARTED_ON_BRANCH
spell_workflow_task2_authorized: true
spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING
task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
same_scope_merge_authority: INHERITED_SUBJECT_TO_GREEN_AND_EXACT_HEAD_GATES
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
```

현재 ChatGPT 세션에는 HiGodot persistent-authoring MCP/channel이 없으므로 Task 2 product source mutation을 일반 GitHub text write로 우회하지 않는다. 승인과 구현 완료를 구분한다.

## GM-SPELL-WORKFLOW-UI-V2-01 — visual/platform gate sequencing

```yaml
sync_id: GR-SYNC-20260808-07-VISUAL-PLATFORM-GATE-SEQUENCING
shared_core_status: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
shared_core_evidence: docs/validation/WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL.json
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
sheet_sync: SHEET_WRITE_READBACK_PASS
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
performance: NOT_RUN
visual_audio_complete: false
audio_vault: AUDIO_VAULT_PATH_UNVERIFIED
audio_rights: AUDIO_RIGHTS_UNVERIFIED
```

Base의 PC·Android one-core/platform-adapter 계약에 따라 `src/core`는 gameplay/content/data/save/deterministic authority를 유지하고 `src/ui/mobile_safe_root.gd`는 layout adapter로 한정된다. Focused contract는 hosted Windows 2025와 Ubuntu 24.04에서 같은 구조 계약을 통과했다. `export_presets.cfg`가 없으므로 Windows/Android export 또는 Android device PASS를 주장하지 않는다.

승인된 UI v2 구현 계획에서 root/end-to-end 통합은 Task 9, rendered/CI evidence는 Task 10이다. 따라서 `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`은 구현 이후 acceptance 대기이며 Task 2의 선행 blocker가 아니다. 현재 three-screen runtime PASS 또는 visual/audio completion PASS는 주장하지 않는다.

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

```yaml
higodot_release: v3.1.2
higodot_pinned_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
higodot_official_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
higodot_project_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_integrity_correction_sync: GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY
gut_release: v9.7.1
gut_pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
gut_spec_pr: 84
gut_implementation_pr: 85
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
gut_editor_plugin: DISABLED
full_vendor_tree_identity: false
critical_runtime_equivalence: APPROVED
legacy_required_contract_parity: PASS
hosted_godot_4_7_1_gut: PASS
junit_discovery_exit: PASS
product_mutation_hash_gate: PASS
higodot_zero_protected_diff_gate: PASS
hera_release: v1.0.0
hera_upstream_tag_commit: 10f245ddae9e7a5d569150302acbde0d78f2aa03
hera_upstream_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
hera_project_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
hera_linux_cli_sha256: 384d93652ade67f0a2c975e152521760d3bf32f8770edd4b9ee382ea98bcab8a
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_live_canary_run: 31254032278
hera_merged_main: a35baed94fe064e57529ffee7b8c48e14ac5e1bb
hera_localhost_only: PASS
hera_shared_token: PASS
hera_repository_source_delta_zero: PASS
hera_acceptance_qa_authorized: true
hera_persistent_source_mutation_authorized: false
hera_sheet_sync: SHEET_WRITE_READBACK_PASS
```

HiGodot의 과거 mismatch는 official `plugin/` wrapper와 project plugin subtree를 비교한 scope 오류로 교정됐다. GUT의 full vendor-tree mismatch/critical-runtime equivalence는 별도 판정으로 그대로다. Hera canary는 임시 Godot 프로젝트에서 official CLI와 exact addon pair를 검증했고 persistent GRIMOIRE source authoring 권위를 획득하지 않는다.

최신 Base `main@cf4c7a60...`에서 재확인한 current toolchain/PC·Android 계약은 Hera exact pair·localhost-only·shared token·persistent write 금지·source-delta `NONE`, 그리고 shared core/platform adapter 분리를 유지한다. GRIMOIRE Base release pin 9.4.3은 갱신되지 않았다.

### Live Editor/MCP tool state — 2026-08-09

```yaml
sync_id: GR-SYNC-20260809-02-HIGODOT-V313-LIVE-PLUGIN-APPROVAL
pr96_merged_main: 8422b1f506476117c876f909f986f08b94c5a543
base_latest_main_observed: 2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b
sheet_sync: SHEET_WRITE_READBACK_PASS
tracked_higodot_release: v3.1.2
tracked_higodot_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
live_higodot_release: v3.1.3
live_higodot_official_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
live_higodot_tracked_vendor_state: NOT_SYNCED_NOT_CLAIMED
gut_live_editor_plugin_state: USER_CONFIRMED_ENABLED
hera_live_editor_plugin_state: USER_CONFIRMED_ENABLED
tracked_project_godot_editor_plugins: GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK
```

사용자가 Godot AI v3.1.3 업데이트와 GUT/Hera live plugin 활성화를 명시적으로 승인·확인했다. 이 live 상태는 기존 권위 경계를 바꾸지 않는다: HiGodot은 persistent Godot authoring의 단일 권위, GUT은 deterministic GDScript test 권위, Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`이며 persistent source mutation은 금지된다. 또한 live Editor의 활성화와 GitHub tracked `project.godot`/vendor tree의 동기화를 같은 것으로 간주하지 않는다.

## GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01

```yaml
repo_wide_actions_full_sha: PASS
status: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
enforcement_test: tests/test_v4_4_ci_supply_chain.py
normal_pr_gate: Validate Godot Authoring and GUT Authority Gate
```

모든 active workflow의 official `actions/*` ref는 full 40-hex commit SHA로 강제되며 known action pin은 검증 목록과 일치해야 한다.

## Google Sheet

`GM-CONTRACT-V4-4-BINDING-01`과 `GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`은 Sheet write/readback PASS다. HiGodot 교정과 Hera exact-pair 결과는 동일 `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01` 아래에서 동기화돼 있다.

Visual/platform sequencing 결과는 동일 `GM-SPELL-WORKFLOW-UI-V2-01`로 Hub row2·Decision row68·Audit row79·ImageReview row6·History row115에 동기화됐고 두 번의 readback으로 `SHEET_WRITE_READBACK_PASS`를 확인했다. PR #93 merged-main 증거는 `5016bd090ad09892d36a8b751c7a9649868b76d5`다.

Task 2 사용자 승인도 동일 Decision ID `GM-SPELL-WORKFLOW-UI-V2-01`로 GitHub canon에 기록하며, 이 canon-sync PR merge 후 Sheet에 동일 sync id `GR-SYNC-20260809-01-TASK2-USER-APPROVAL`로 write/readback한다.

Godot AI v3.1.3 live Editor/MCP 상태와 사용자 승인된 GUT/Hera live plugin 활성화는 `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01` / `GR-SYNC-20260809-02-HIGODOT-V313-LIVE-PLUGIN-APPROVAL`로 Sheet readback `SHEET_WRITE_READBACK_PASS`까지 확인했다. tracked HiGodot v3.1.2 exact-tree 증거와 live v3.1.3 상태는 의도적으로 구분한다.

## 현재 남은 Gate

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9  # post-implementation acceptance, not Task2 prerequisite
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```
