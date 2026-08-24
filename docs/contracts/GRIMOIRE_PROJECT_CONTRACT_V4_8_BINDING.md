# GRIMOIRE 프로젝트 계약 v4.8 r2 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: '4.8'
revision: '2026-08-24-r2'
contract_status: ACTIVE_BASE_CURRENT_MAIN_THIN_ADAPTER_PROJECT_EXECUTION_CONTRACT
binding_decision_id: GM-CONTRACT-V4-8-BINDING-01
binding_sync_id: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
approved_at: 2026-08-24
approval_source: 사용자 명시 승인 "권장안 승인 작업 계속 진행해"
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: main
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
base_loading_policy: BASE_OWNER_PROGRESSIVE_LOAD
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
project_fact_policy: PROJECT_CANON_AND_ACTUAL_IMPLEMENTATION_FIRST
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: COMPATIBILITY_ONLY_MIGRATION_SOURCE_UNTIL_REMOVAL
open_pr_policy: OPEN_PR_READ_ONLY_BY_DEFAULT
current_task_pr_policy: CURRENT_TASK_CONTINUATION_AUTHORIZES_READY_MERGE
force_and_ruleset_bypass_policy: FORBIDDEN
incremental_cost_policy: ZERO_INCREMENTAL_COST_REQUIRED
adversarial_full_loop_minimum: 5
implementation_reality_gate: REQUIRED_FOR_MATERIAL_CLAIMS_AND_CAPABILITY_DEPENDENT_WORK
```

## 1. 바인딩 의미

이 문서는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8(20260824-033136).md`를 GRIMOIRE에 적용하는 **프로젝트 전용 thin adapter**다.

Base의 Work Mode, Skill routing, CI, PR, 검증, 완료 절차를 복제하지 않는다. 새 실질 작업 단위마다 최신 완료 Base `main`과 필요한 owner를 progressive-load한다.

```yaml
v4_8_source_role: USER_SUPPLIED_ACTIVE_PROJECT_EXECUTION_CONTRACT
base_snapshot_observed_when_v4_8_written: 2828a74f60c1ed09546171040f4178c8848ea686
base_snapshot_role: HISTORICAL_OBSERVATION_ONLY_REFETCH_BEFORE_NEW_WORK
project_main_observed_at_binding_start: 91459b6ce42d44c557c6bcd9cf539b023bfdf55c
project_main_observation_role: EXACT_BASELINE_FOR_THIS_AUTHORITY_SYNC_ONLY
```

v4.5, v4.4, v4.3 binding 문서는 삭제하지 않는다. 모두 역사 provenance로 보존하고 current contract authority만 v4.8로 전진한다.

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
task8_recovery_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
component_sheet_pr151: MERGED_MAIN_VERIFIED
parallel_open_pr_at_binding_start: NONE
```

현재 POC/Component PASS를 완성형 첫 세션 또는 전체 제품 PASS로 승격하지 않는다.

## 3. Task8 복구 경계

Task8은 기존 Task5 Stage3 atomic target/use authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

현재 원격 사실:

```yaml
task8_historical_local_branch: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_head_role: HISTORICAL_GIT_BASELINE_NOT_PRODUCT_COMMIT
remote_recovery_path: NOT_AVAILABLE_FROM_GITHUB_HISTORY
historical_acceptance_only:
  focused_gut: 15_tests_90_assertions_0_failures
  predecessor_regression: 42_suites_1588_assertions_0_failures
  hera_source_delta: NONE_OBSERVED
```

이 ChatGPT 실행 세션에는 사용자 Windows checkout이 마운트되어 있지 않고 사용할 수 있는 Godot/PowerShell local connector도 발견되지 않았다.

```text
LOCAL_SYNC: BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: BLOCKED_NO_LOCAL_ACCESS
TASK8_LOCAL_DELTA_EXISTENCE: BLOCKED_UNVERIFIED
```

따라서 local delta가 현재 존재한다고도, 사라졌다고도 주장하지 않는다. 독립적인 remote authority correction은 계속 진행하되 Task8 product authoring은 local recovery evidence 전까지 보류한다.

local executor가 사용 가능해지면 기존 `tools/task8_local_recovery_probe.ps1`를 read-only로 실행하고 `reset / restore / clean` 없이 worktree identity와 delta를 확인한다. delta가 있으면 보호 후 fresh acceptance, 없으면 승인된 HiGodot TDD plan으로 재작성한다.

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

## 5. PR #151과 현재 workstream 경계

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 이미 병합된 current-main 역사다. 더 이상 `DO_NOT_TOUCH` open-work 경계가 아니다.

```yaml
pr151_state: MERGED_MAIN_VERIFIED
pr151_merge: df494b8e8cfd914f05a02d645131b491d2a09f38
component_sheet_scope: IMPLEMENTED_AND_AUTOMATED_EVIDENCE_AVAILABLE
human_device_performance_full_slice_promotion: FORBIDDEN_WITHOUT_NEW_EVIDENCE
```

다른 실제 open/draft/ready PR은 새 작업 시작 시 live query로 다시 확인하며 기본 READ_ONLY다.

## 6. Evidence ceiling

```text
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

## 7. v4.8 전환 delivery provenance

```yaml
authority_sync_pr: 158
authority_sync_id: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
delivery_sequence:
  - TASK8_LOCAL_ACCESS_CLASSIFICATION
  - V4_8_AUTHORITY_BINDING_AND_STALE_CONSUMER_CORRECTION
  - TDD_RED_GREEN
  - EXACT_HEAD_CI_AND_ADVERSARIAL_REVIEW
  - NORMAL_PR_MERGE_AND_MERGED_MAIN_READBACK
  - BOUNDED_NOTION_REGISTRY_AND_TASK13_SYNC
pr_lifecycle_state: LIVE_GITHUB_READBACK_NOT_PINNED_HERE
current_product_next_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
```

위 sequence는 v4.8 authority 전환을 어떻게 전달했는지 추적하는 provenance다. 병합 이후 새 work unit에서 반복 실행할 현재 작업 목록이 아니다. 현재 제품 작업은 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`부터 시작하며, local access blocker 하나가 독립적인 remote/document 작업을 중단시키지는 않는다.

## 8. 역사 바인딩

```yaml
superseded_bindings:
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
deletion: FORBIDDEN
```

이 바인딩은 제품 방향 변경이 아니라 current execution/governance contract와 이미 확인된 repository reality를 정렬하는 교정이다.
