# PR #85 GUT Formal Adoption — Role-Separated Review (2026-08-08)

```yaml
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
review_type: STATIC_DIFF_AND_CONTRACT_REVIEW
reviewed_candidate_head_before_review_receipt: 431f257fb2fda143bbb2a10311bd948012ec5f38
current_contract: v4.4
binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
formal_adoption_decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
vendor_equivalence_decision_id: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
github_actions_decision_id: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
static_p0: 0
static_p1: 0
final_result: PENDING_CURRENT_EXACT_HEAD_CI_AND_GITHUB_REVIEW_READBACK
```

## Review boundary

This review does not treat implementer prose or historical CI as current-head proof. It re-reads the current PR file inventory, current Base/project/Sheet entry state, the GUT adoption spec, v4.4 binding, parity contract, HiGodot receipt gate, and hosted workflow contract.

This is a GPT role-separated review, not an independent human review.

## Pass A — requirement and canon attack

- v4.4 is bound under `GM-CONTRACT-V4-4-BINDING-01` and the same Decision ID is written/read back in the Google Sheet.
- v4.3 remains historical evidence and is not deleted.
- `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01` remains limited to CLI/headless critical-runtime equivalence; full vendor-tree identity is not claimed.
- PR #82 Task 2 remains unauthorized.
- No Codex handoff is claimed.

**Finding:** no P0/P1 static requirement/canon violation found in the reviewed candidate.

## Pass B — structure, test authority, and compatibility attack

- GUT editor plugin remains disabled.
- Required legacy parity now has a machine-readable mapping and a GUT `GlyphDefinition` suite using the same public product behavior as the legacy suite.
- The existing legacy runner is not removed by this PR.
- Product mutation hash guard remains part of full hosted validation.
- New parity status is deliberately `STATIC_MAPPING_COMPLETE_RUNTIME_CURRENT_HEAD_PENDING`, not PASS.

**Finding:** no P0/P1 static structure/compatibility violation found; runtime parity remains exact-head CI evidence, not a prose claim.

## Pass C — HiGodot authority attack

Current PR changed-file inventory contains zero files matching the v4.4 protected production set:

```text
project.godot
src/**
scenes/**
resources/**
data/**
assets/**
ui/**
*.tscn
*.tres
*.res
```

`tools/check_higodot_authoring_receipt.py` fails closed when any such path changes and allows no-manifest passage only for an exact zero protected diff. The hosted GUT workflow executes this gate against base/head SHAs with full checkout history and makes the final GUT gate depend on it.

**Finding:** static candidate satisfies the zero-protected-diff shape. Final `HIGODOT_AUTHORING_RECEIPT_GATE_PASS` is pending hosted exact-head execution.

## Pass D — CI cost and supply-chain attack

- Only standard `windows-latest` / `ubuntu-latest` runners are used.
- No self-hosted/larger/GPU runner, Actions cache, or artifact upload is introduced in the PR85 formal-adoption workflow.
- `permissions` remains `contents: read`.
- `pull_request_target` is not used.
- `actions/checkout` current v4 tag target was verified as `11d5960a326750d5838078e36cf38b85af677262` and is pinned to that full SHA.
- `actions/setup-python` current v5 tag target was verified as `a26af69be951a213d495a4c3e4e4022e16d87065` and is pinned to that full SHA.

**Finding:** mutable major-tag supply-chain risk found during review and corrected before final CI. No remaining P0/P1 supply-chain finding found in this workflow.

## Pass E — current-main divergence attack

Current `main` advanced after PR85's original base with Hera Agent files and the local Asset Vault `.gitignore` rule. PR85 was therefore observed as diverged/stale-base during this review. The branch `.gitignore` was aligned to current main so the Asset Vault ignore rule is not reverted.

The Hera addon is a main-side change and is not part of PR85's proposed file set. Merge/readback must prove it remains present after PR85; it must not be silently dropped.

**Finding:** mergeability/current-base reconciliation remains a GitHub gate. Do not merge on stale mergeability evidence.

## Pass F — evidence attack

Historical run `31177968404` passed old exact head `a264bb7b...`, but later v4.4/parity/receipt/supply-chain commits changed PR85 head. Therefore that run is historical evidence only.

Required final evidence:

```text
current exact head identified
→ ready/reopened PR event starts current workflow
→ Python contract suite PASS
→ Windows/Ubuntu full GUT lanes PASS
→ JUnit discovery > 0 and zero failures/errors
→ product hash equality PASS
→ HiGodot zero-protected-diff gate PASS
→ GUT Validation Gate PASS
→ current unresolved review threads = 0
→ current mergeability/repository policy PASS
```

## Static review disposition

```yaml
P0: 0
P1: 0
P2_resolved_during_review:
  - MUTABLE_ACTION_MAJOR_TAGS_IN_PR85_WORKFLOW
  - MAIN_ASSET_VAULT_GITIGNORE_DRIFT_ON_PR85_BRANCH
P2_open:
  - CURRENT_EXACT_HEAD_CI_NOT_RUN
  - CURRENT_MERGEABILITY_FALSE_OR_STALE
final_static_disposition: REVIEW_STATIC_PASS_TECHNICAL_GATE_PENDING
merge_authorized_now: false
pr82_task2_authorized_now: false
```
