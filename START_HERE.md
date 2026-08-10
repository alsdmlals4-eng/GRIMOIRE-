# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
tracked_project_godot_editor_plugins: GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

v4.5 r2는 Base current canon을 복제하지 않는 thin adapter다. Base `7ce3fb64...`는 v4.5 원문 작성 시점의 `HISTORICAL_OBSERVATION_ONLY`이고, 현재 작업 관찰값 `315c66ee...`도 영구 권위가 아니다. 실제 Base `main`은 매 작업 다시 읽는다.

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

따라서 **현재 다음 구현 단위는 `TASK8_SPELL_USE_SCREEN`**이다. Task 8은 이미 병합된 Task 5의 Stage 3 transaction authority를 소비하는 UI 단계이며 새 target/use authority를 중복 구현하지 않는다.

승인된 후속 계획:

```text
Task 8 — Spell Use Screen / Target Selection / Expected Result
Task 9 — Root Coordinator / Responsive Rules / End-to-End Flow
Task 10 — Render Evidence / CI / Main Scene / Canon + Sheet Sync
```

## 보존된 Star Circuit runtime authority

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
canon_status: SYNCED_TO_MAIN
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
human_validation: NOT_RUN
tuning_status: PLAYTEST_TUNING_REQUIRED
```

## 도구 권위

- HiGodot/Godot AI `v3.1.3`: persistent `.gd/.tscn/.tres/.res/project.godot` 저작의 단일 권위.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation 금지.
- direct/local tool-state commit `1337e267d29b00c039039e7197863e2f4f78957d`의 formal HiGodot receipt는 `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`이다.

## v4.5 실행·외부 process 경계

```yaml
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
continuous_work: CONTINUOUS_WORK_ACTIVE
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
external_process_overlay: EXTERNAL_PROCESS_OVERLAY
```

Superpowers 같은 외부 process framework는 실행 절차만 강화하며 프로젝트/Base 정본 권한을 획득하지 않는다.

## 역사 증거와 현재 권위 분리

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

Task 2/Task 3 진입 자료와 v4.4 바인딩은 삭제하지 않고 provenance로 보존한다. 현재 계약과 next-task 권위만 v4.5 / Task 8으로 전진한다.

## 현재 완료로 주장하지 않는 항목

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
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
10. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md` — historical only

## 계약 바인딩

현재 GitHub 정본 계약은 v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`이다. v4.4는 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 보존한다.
