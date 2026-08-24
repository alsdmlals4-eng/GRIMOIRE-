# GR-SYNC-20260824-35 — v4.8 Authority Sync

```yaml
sync_id: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
status: CANDIDATE_PR_NOT_MERGED
project: GRIMOIRE
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-24-r2
binding_decision: GM-CONTRACT-V4-8-BINDING-01
current_task_pr: 158
base_main_observed: 2828a74f60c1ed09546171040f4178c8848ea686
project_main_baseline: 91459b6ce42d44c557c6bcd9cf539b023bfdf55c
product_behavior_change: NONE
product_paths_changed: FORBIDDEN
local_sync: BLOCKED_NO_LOCAL_ACCESS
godot_run: BLOCKED_NO_LOCAL_ACCESS
task8_local_delta_existence: BLOCKED_UNVERIFIED
human_device_performance_full_slice: NOT_RUN
```

## Goal

사용자가 제공하고 승인한 v4.8 r2를 GRIMOIRE의 current project execution contract로 바인딩하고, 이미 병합된 PR #151을 open `DO_NOT_TOUCH` work로 오인하게 만드는 cold-start authority drift를 제거한다.

Task8 제품 구현을 이 sync에서 재작성하지 않는다. Task8은 원격 product commit/branch/PR이 없고 역사 acceptance가 uncommitted local worktree에만 적용됐으므로 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`를 그대로 보존한다.

## TDD receipt

첫 commit은 `tests/test_current_authority_reality_contract.py`의 authority requirement만 추가했다.

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
new_routing:
  - PR151 is merged history/current-main component
  - live open PR inventory is re-read per work unit
  - PR158 is the only current-task continuation PR in this sync
```

PR #151의 Component Sheets A–D evidence를 Task8나 Human/Device/Performance/Full Slice PASS로 승격하지 않는다.

## Task8 evidence ceiling

현재 ChatGPT 세션에서는 사용자 Windows repository/worktree/Godot에 직접 접근할 수 없고 usable local Godot/PowerShell connector도 확인되지 않았다.

```text
LOCAL_SYNC: BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: BLOCKED_NO_LOCAL_ACCESS
TASK8_LOCAL_DELTA_EXISTENCE: BLOCKED_UNVERIFIED
```

따라서 local delta의 존재/소실을 어느 쪽으로도 추정하지 않는다. local access가 생기면 `tools/task8_local_recovery_probe.ps1`를 read-only로 실행하고 reset/restore/clean을 금지한다.

## GREEN / review / merge gate

아래는 아직 이 candidate에서 증명해야 하는 항목이다.

```text
focused authority test GREEN
applicable exact-head workflows terminal success
changed-path product overlap 0
open PR inventory: only current-task PR158 or explicitly read-only unrelated work
unresolved review thread 0
adversarial full loops >= 5 and final new blocking finding 0
expected-head merge
new main readback
bounded Notion Registry + Task13 update/readback
```

이 파일의 `status`는 merge 전에는 `CANDIDATE_PR_NOT_MERGED`에서 승격하지 않는다.
