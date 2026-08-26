# GRIMOIRE 프로젝트 계약 v4.8 r5.4 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: '4.8'
revision: '2026-08-26-r5.4-superset-final'
contract_status: ACTIVE_BASE_CURRENT_MAIN_THIN_ADAPTER_PROJECT_EXECUTION_CONTRACT
binding_decision_id: GM-CONTRACT-V4-8-BINDING-01
binding_sync_id: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
approved_at: 2026-08-26
approval_source: 사용자 명시 continuation "진행해" after r5.4 fresh-read audit
execution_request_state: USER_EXPLICIT_CONTINUATION_PRESENT
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: main
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
base_loading_policy: BASE_OWNER_PROGRESSIVE_LOAD
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
project_fact_policy: PROJECT_CANON_AND_ACTUAL_IMPLEMENTATION_FIRST
fresh_read_bootstrap_policy: PROJECT_GITHUB_NOTION_ONLY_RECONSTRUCTION_REQUIRED
entry_state_reconciliation_policy: REQUIRED_BEFORE_MATERIAL_MUTATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: COMPATIBILITY_ONLY_MIGRATION_SOURCE_UNTIL_REMOVAL
visual_asset_inventory_and_style_lock_policy: REQUIRED_BEFORE_SERIAL_VISUAL_PRODUCTION
visual_generation_policy: TEXT_BRIEF_THEN_EXPLICIT_USER_APPROVAL_THEN_EXACTLY_ONE_RESULT
open_pr_policy: OPEN_PR_READ_ONLY_BY_DEFAULT
current_task_pr_policy: CURRENT_TASK_CONTINUATION_AUTHORIZES_READY_MERGE
force_and_ruleset_bypass_policy: FORBIDDEN
local_codex_policy: RETIRED_NOT_USED
gpt_local_codex_orchestration_policy: RETIRED
codex_execution_policy: INDEPENDENT_GODOT_PRODUCT_IMPLEMENTATION_HANDOFF_ONLY
shared_godot_runtime_policy: SHARED_APPROVED_EXACT_PIN_DEFAULT_NO_PER_PROJECT_DUPLICATE_BINARY
shared_godot_ai_port_policy: FIXED_DEFAULT_PORTS_WITH_EXACT_SESSION_ROUTING
incremental_cost_policy: ZERO_INCREMENTAL_COST_REQUIRED
adversarial_full_loop_minimum: 5
implementation_reality_gate: REQUIRED_FOR_MATERIAL_CLAIMS_AND_CAPABILITY_DEPENDENT_WORK
```

## 1. 바인딩 의미

이 문서는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8-r5.4_SUPERSET_FINAL_20260826.md`를 GRIMOIRE에 적용하는 **프로젝트 전용 thin adapter**다.

Base의 Work Mode, Skill routing, CI, PR, 검증, 완료 절차를 복제하지 않는다. 새 실질 작업 단위마다 최신 완료 Base `main`과 필요한 owner를 progressive-load한다.

```yaml
v4_8_source_role: USER_SUPPLIED_ACTIVE_PROJECT_EXECUTION_CONTRACT
base_snapshot_observed_when_r5_4_written: edb3b3376603c9f6b00d64af3126304f8c9946bf
base_snapshot_role: HISTORICAL_OBSERVATION_ONLY_REFETCH_BEFORE_NEW_WORK
project_main_observed_at_binding_start: 829094fd87433e14fe42b23f9b7bec6321f5048d
project_main_observation_role: EXACT_BASELINE_FOR_THIS_RECONCILIATION_ONLY
same_decision_revision_rule: GM-CONTRACT-V4-8-BINDING-01_PRESERVED
```

v4.5, v4.4, v4.3 binding 문서는 삭제하지 않는다. 모두 역사 provenance로 보존하고 current contract authority만 v4.8 r5.4로 전진한다. 기존 v4.8 r2 내용은 이 파일의 Git history가 보존한다.

## 2. 프로젝트 현재 불변식

```yaml
product_stage: DEMO_FIRST_VERTICAL_SLICE
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
current_main_scene: res://src/ui/star_circuit_harness.tscn
main_scene_role: DEVELOPMENT_RUNTIME_POC_ENTRY
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
circuit_topology: FIVE_POINT_STAR
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
component_sheet_pr151: MERGED_MAIN_VERIFIED
parallel_open_pr_at_binding_start: PR_166_DRAFT_READ_ONLY_README_ONLY
current_user_work_scope: VISUAL_ASSET_COVERAGE_AND_NEXT_SINGLE_VISUAL_BRIEF
product_implementation_authorized_by_current_user_work_scope: false
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
```

현재 POC/Component PASS를 완성형 첫 세션 또는 전체 제품 PASS로 승격하지 않는다. 이번 `작업재개 → 진행해` continuation은 Visual/Image/Asset planning을 재개하며 Task8/Godot 제품 구현 권한으로 확대하지 않는다.

## 3. Task8 복구 경계

Task8은 기존 Task5 Stage3 atomic target/use authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

현재 GitHub/보존 사실:

```yaml
task8_primary_recovery_branch: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_head_role: HISTORICAL_GIT_BASELINE_NOT_PRODUCT_COMMIT
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
preservation_status: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
historical_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
historical_acceptance_only:
  focused_gut: 15_tests_90_assertions_0_failures
  predecessor_regression: 42_suites_1588_assertions_0_failures
  hera_source_delta: NONE_OBSERVED
current_fresh_compatibility_and_test_state: NOT_RUN
```

이번 ChatGPT 세션은 사용자 Windows checkout의 현재 Godot/Task8 product state를 직접 실행한 세션이 아니다.

```text
LOCAL_SYNC: NOT_RUN / BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: NOT_RUN / BLOCKED_NO_LOCAL_ACCESS
FRESH_TASK8_COMPATIBILITY: NOT_RUN
```

보존 성공은 current-main 호환성·fresh HiGodot/GUT/Hera·product PR readiness를 증명하지 않는다. 제품 구현이 다시 명시적으로 승인되면 별도 clean reconciliation worktree와 fresh exact-project evidence부터 시작한다.

## 4. Workspace authority

```text
Notion
→ 사람이 읽고 비교·수정하는 Project Home / Flow / Visual / Core System / 핵심 데이터

GitHub repository
→ Markdown / JSON / code / data / Scene / Resource / Test / tracked asset / CI / runtime truth

Google Sheets
→ 고유 미이관 자료가 남은 경우에만 migration compatibility source
→ 신규 canon write 금지
```

Notion readback은 runtime PASS가 아니고 GitHub 구현 PASS는 Human Home 동기화를 자동 보장하지 않는다.

Google Sheet의 기존 visual inventory/cap은 이번 r5.4 preflight에서 **UNIQUE migration input**으로만 읽고, 현재 coverage owner는 GitHub `GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json` + Notion Visual Bible이다.

## 5. Visual production 경계

현재 승인된 스타일을 다시 결정하지 않는다.

```yaml
art_style_base_lock: ART-STYLE-01
art_style_base_name: Soft Storybook Cel 2D Hybrid
current_visual_overlay: GM-VISUAL-DIRECTION-20260825-01
logo_direction: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
representative_screen_boundary: GM-REPRESENTATIVE-SCREENS-20260825-01
```

r5.4 시각 작업 순서:

```text
Visual Requirement Delete Test
→ existing approved/runtime/component reuse
→ VISUAL_ASSET_COVERAGE + ART_STYLE_LOCK readback
→ exactly one text brief
→ STOP
→ explicit user generation approval
→ exactly one result
→ STOP
→ result approval/revision
→ approved destination sync/readback
```

현재 다음 1장 후보는 `Typed Glyph Vault/Stock → FIVE_POINT_STAR → Prepared Spell` Stage2 대표 화면이다. 이유는 승인된 전투/주문 시안의 가장 큰 rework finding이 Stock/circuit semantics였고, Task6보다 visual gap이 크며 Task8 Stage3를 미리 발명하지 않기 때문이다.

`Prepared Spell → Target → Final Preview → Use`는 P0이지만 Task8 제품 화면이 current main에 없으므로 현재 serial visual production에서는 후순위로 둔다.

## 6. Open PR / workstream 경계

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 이미 병합된 current-main 역사다.

현재 fresh-read open PR:

```yaml
pr_166:
  title: docs: route README to current GRIMOIRE canon
  state: DRAFT
  changed_path: README.md
  policy: ACTIVE_OTHER_WORKSTREAM_READ_ONLY
```

이번 r5.4/Visual 작업은 latest completed `main`에서 별도 current-task branch/PR로 진행하며 PR #166을 수정·rebase·close·merge·absorb하지 않는다.

## 7. Evidence ceiling

```text
CONTRACT_REVISION: 2026-08-26-r5.4-superset-final
VISUAL_COVERAGE_PREFLIGHT: DOCUMENTED
NEXT_SINGLE_VISUAL_TEXT_BRIEF: READY_AWAITING_EXPLICIT_GENERATION_APPROVAL
RUNTIME_VISUAL_COMPLETE: NOT_PROVEN
HUMAN_USABILITY_EVIDENCE: NOT_RUN
PLAYER_EXPERIENCE_EVIDENCE: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_VERTICAL_SLICE: NOT_RUN
WINDOWS_EXPORT: NOT_RUN
ANDROID_EXPORT: NOT_RUN
ANDROID_DEVICE: NOT_RUN
KOREAN_RUNTIME_FONT_VALIDATION: NOT_RUN
AUDIO_VAULT_PATH: BLOCKED_UNVERIFIED
AUDIO_RIGHTS: BLOCKED_UNVERIFIED
VISUAL_AUDIO_COMPLETE: CLAIM_UNVERIFIED
```

자동 테스트·렌더·component capture를 위 evidence로 승격하지 않는다.

## 8. r5.4 reconciliation delivery provenance

```yaml
authority_sync_id: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
baseline_project_main: 829094fd87433e14fe42b23f9b7bec6321f5048d
baseline_base_main: edb3b3376603c9f6b00d64af3126304f8c9946bf
delivery_sequence:
  - FRESH_READ_PROJECT_BOOTSTRAP_AND_ENTRY_STATE_RECONCILIATION
  - R5_4_BINDING_CORRECTION
  - NOTION_SYSTEM_METADATA_BOUNDED_CORRECTION
  - VISUAL_REQUIREMENT_DELETE_TEST_AND_COVERAGE_PREFLIGHT
  - NEXT_SINGLE_VISUAL_TEXT_BRIEF_ONLY
  - GITHUB_NOTION_READBACK
  - FIVE_PLUS_ADVERSARIAL_REVIEW
  - CURRENT_TASK_PR_EXACT_HEAD_CHECKS
  - SAFE_MERGE_IF_GATES_PASS
  - POSTMERGE_MAIN_AND_NOTION_READBACK
product_code_or_scene_mutation: NONE
image_generation_in_this_unit: NONE
```

## 9. 역사 바인딩

```yaml
superseded_bindings:
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
deletion: FORBIDDEN
```

이 바인딩은 제품 방향 변경이 아니라 current execution/governance contract, current Visual production gate, 그리고 이미 확인된 repository/Notion reality를 정렬하는 교정이다.
