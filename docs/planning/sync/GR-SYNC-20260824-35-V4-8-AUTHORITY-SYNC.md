# GR-SYNC-20260824-35 — v4.8 Authority Sync

```yaml
sync_id: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
status: PRE_MERGE_VERIFICATION_RECEIPT
project: GRIMOIRE
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-24-r2
binding_decision: GM-CONTRACT-V4-8-BINDING-01
authority_sync_pr: 158
pr_lifecycle_state_authority: LIVE_GITHUB_READBACK
base_main_observed: 2828a74f60c1ed09546171040f4178c8848ea686
project_main_baseline: 91459b6ce42d44c557c6bcd9cf539b023bfdf55c
semantic_candidate_before_receipt: dca853a83fbc4fc9693d7a00eddfa32f368c500d
product_behavior_change: NONE
product_paths_changed: NONE
local_sync_observed_during_authority_sync: BLOCKED_NO_LOCAL_ACCESS
godot_run_observed_during_authority_sync: BLOCKED_NO_LOCAL_ACCESS
task8_local_delta_existence_observed: BLOCKED_UNVERIFIED
human_device_performance_full_slice: NOT_RUN
```

## Goal

사용자가 제공하고 승인한 v4.8 r2를 GRIMOIRE의 current project execution contract로 바인딩하고, 이미 병합된 PR #151을 open `DO_NOT_TOUCH` work로 오인하게 만드는 cold-start authority drift를 제거한다.

Task8 제품 구현을 이 sync에서 재작성하지 않는다. Task8은 원격 product commit/branch/PR이 없고 역사 acceptance가 uncommitted local worktree에만 적용됐으므로 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`를 그대로 보존한다.

이 파일은 **pre-merge verification receipt**다. PR의 draft/ready/merged lifecycle, 현재 open PR 집합, 이후 local executor 접근 가능 여부를 영구 current fact로 저장하지 않는다. 최종 merge 여부와 merged-main SHA는 live GitHub/readback에서 확인하고, Task8 재개 시 local capability를 fresh executor에서 다시 확인한다.

## TDD receipts

### RED 1 — v4.8 binding 부재

```yaml
red_head: ca0841a045cc580b44ff9b671a93850e1bb41070
workflow: Validate GRIMOIRE planning and Base v9.4.3
run: 32688311731
result: EXPECTED_RED
existing_tests: 6_PASS
new_test: 1_FAIL
failure_reason: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md missing
infrastructure_or_syntax_failure: false
```

RED 후에만 v4.8 binding과 active routing 교정을 작성했다.

### RED 2 — Task8 역사 PR151 marker current 재사용 위험

```yaml
red_head: 0170c82cee4eecd2411a7079da4ab72b22246da0
workflow: Validate GRIMOIRE planning and Base v9.4.3
run: 32689859171
result: EXPECTED_RED
failure_reason: Task8 2026-08-21 reverify lacked historical/live-PR interpretation overlay
fix: preserve original snapshot and prepend HISTORICAL_REMOTE_LOCAL_REVERIFY_PROVENANCE overlay
```

역사 `parallel_pr_151: DO_NOT_TOUCH` 값은 삭제하지 않고 2026-08-21 관찰값으로 격리했다. 현재 PR 상태는 live GitHub가 우선한다.

### RED 3 — transient PR lifecycle / post-merge 반복 실행 위험

```yaml
transient_state_red_head: 67546359e441c81b094e245bbefb1f1d02e45957
transient_state_run: 32689970001
binding_delivery_red_head: d7e9257dc0a8e41e09ae64a4605cc9926af7b490
binding_delivery_run: 32690366592
result: EXPECTED_RED
failure:
  - active canon encoded current_task_pr draft lifecycle state
  - v4.8 binding described ready/merge delivery sequence as current work after merge
fix:
  - retain only authority_sync_pr 158 provenance number
  - PR lifecycle state is LIVE_GITHUB_READBACK
  - binding delivery section is provenance, current product gate is Task8 local recovery
```

### RED 4 — open PR count / local-access observation stale 재발 위험

```yaml
red_head: 3e50eb7fcedab85d749d40589d1807371e9ed2bf
workflow: Validate GRIMOIRE planning and Base v9.4.3
run: 32690732595
result: EXPECTED_RED
preexisting_operating_view_check: PASS
failure_reason: active cold-start docs still pinned parallel_open_pr NONE and local_sync/godot_run BLOCKED values as current facts
fix:
  - open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
  - local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
  - authority-sync BLOCKED observations retained only as explicitly named provenance
```

open PR 집합과 local executor capability는 시간이 지나면 바뀌는 실행 관찰이다. 따라서 cold-start canon은 값 자체가 아니라 **누가 fresh readback을 소유하는지**를 고정한다.

## Current-authority architecture

v4.8의 thin-adapter 원칙에 따라 current authority를 다음으로 줄인다.

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ task/domain-specific current owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`는 장기간 누적된 v4.5-era machine snapshot으로, 동일 current state를 여러 장문 문서에 복제하면 다시 drift가 발생한다. 삭제하지 않고 `HISTORICAL_COMPATIBILITY_SNAPSHOT`으로 강등해 과거 decision/gate lookup 용도로 보존한다.

이는 current 의미를 새 overlay 문서에 또 복제하는 방식보다 owner 수와 future sync cost를 줄인다.

## PR #151 correction

```yaml
pr151: MERGED_MAIN_VERIFIED
merge_sha: df494b8e8cfd914f05a02d645131b491d2a09f38
old_stale_routing:
  - AGENTS.md: PR151_DO_NOT_TOUCH
  - START_HERE.md: parallel_open_pr PR151_DO_NOT_TOUCH
historical_task8_marker:
  - 2026-08-21 snapshot keeps parallel_pr_151 DO_NOT_TOUCH as provenance
new_routing:
  - PR151 is merged history/current-main component
  - live open PR inventory is re-read per work unit
  - authority_sync_pr 158 is provenance only; lifecycle state is not pinned
```

PR #151의 Component Sheets A–D evidence를 Task8나 Human/Device/Performance/Full Slice PASS로 승격하지 않는다.

## Task8 evidence ceiling

Sync35 authority 작업에서는 사용자 Windows repository/worktree/Godot에 직접 접근할 수 없고 usable local Godot/PowerShell connector도 확인되지 않았다.

```text
LOCAL_SYNC_OBSERVED_DURING_SYNC35: BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_OBSERVED_DURING_SYNC35: BLOCKED_NO_LOCAL_ACCESS
TASK8_LOCAL_DELTA_EXISTENCE_OBSERVED: BLOCKED_UNVERIFIED
```

이 값들은 Sync35의 provenance이며 다음 executor의 영구 상태가 아니다. local access가 생기면 fresh local capability readback 후 `tools/task8_local_recovery_probe.ps1`를 read-only로 실행하고 reset/restore/clean을 금지한다.

## Scope / Implementation Reality Gate

현재 PR의 변경 경로는 authority/provenance 문서와 그 회귀 테스트뿐이다.

```yaml
product_source_overlap: 0
runtime_behavior_change: NONE
scene_resource_project_godot_change: NONE
planning_semantics_change: V4_8_AUTHORITY_ROUTING_ONLY
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

자동 CI, component capture, headless runtime evidence를 Human/Device/Performance/Full Slice evidence로 승격하지 않는다.

## Delivery readback contract

이 receipt 이후의 final candidate는 다음을 live evidence로 다시 확인해야 한다.

```text
applicable exact-head workflows terminal success
GUT Formal Adoption path-non-applicable skip is not called PASS
changed-path product overlap 0
open PR inventory / current main re-read
unresolved review thread 0
adversarial full loops >= 5 and final new blocking finding 0
normal merge without force/ruleset bypass
merged-main readback
bounded Notion Registry + Task13 update/readback
```

이 receipt의 `PRE_MERGE_VERIFICATION_RECEIPT`는 역사 역할을 뜻하며, 병합 후 반복 실행해야 할 current work status가 아니다. 현재 제품 다음 gate는 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`다.
