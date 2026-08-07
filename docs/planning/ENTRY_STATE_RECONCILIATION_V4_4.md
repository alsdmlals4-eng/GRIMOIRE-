# GRIMOIRE v4.4 Entry State Reconciliation — 2026-08-08

```yaml
binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
contract_version: "4.4"
base_current_main: fa69a77a14f923a756064f6ae151d34cadb374f7
project_main_observed: 563c2b08cb96354fdd7209a32d7fd8ec26bb334c
working_pr: 85
paused_followup_pr: 82
work_mode: PLAN_AND_IMPLEMENT
```

## Readback

```yaml
entry_gate:
  decision_ledger_readback: PASS
  unresolved_list_readback: PASS_WITH_STALE_GITHUB_CURRENT_DOCS
  image_review_sheet_readback: PASS
  asset_vault_and_manifest_readback: PARTIAL
  github_pr_and_commit_readback: PASS
  base_repository_inventory_and_routing: PASS
  local_checkout_readback: BLOCKED_UNVERIFIED
  local_reference_library_readback: BLOCKED_UNVERIFIED
  shared_audio_vault_readback: BLOCKED_UNVERIFIED
  decision: BLOCK
```

### Decision ledger

Live Sheet `02_현재_확정결정` and GitHub evidence agree that these Decisions are active or historically consumed as recorded:

- `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01`
- `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`
- `GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`
- historical `GM-CONTRACT-V4-3-BINDING-01`

This reconciliation adds `GM-CONTRACT-V4-4-BINDING-01` as the current project-contract binding Decision. The same ID must be written to the Sheet before this checkpoint is considered synchronized.

### GitHub current state

- Project repository is public and default branch is `main`.
- `main` observed at entry: `563c2b08cb96354fdd7209a32d7fd8ec26bb334c`.
- PR #84 is merged; GUT adoption spec is on main.
- PR #85 is the open Draft formal-adoption implementation PR.
- PR #85 exact head before this v4.4 reconciliation work was `a264bb7b7172faf250faad2be7b3300785e8e367`, where hosted GUT run `31177968404` passed all four lanes and the final gate.
- This v4.4 binding changes PR #85 head, so the prior technical validation is historical evidence only; current exact-head validation must run again.
- PR #82 Task 2 remains unauthorized.

### Corrected stale status

The `main` cold-start documents still describe the older v4.3 / PR #84 Draft transition. They are therefore not accepted as current operational status for this entry. Historical content is preserved, but current status is recalculated from GitHub PR state, exact-head evidence, Sheet readback, and this v4.4 binding.

```yaml
corrected_statuses:
  - from: BLOCKED_BY_GUT_ADOPTION_SPEC
    to: BLOCKED_PENDING_GUT_FORMAL_ADOPTION_REMAINING_GATES
    reason: PR #84 adoption spec is already merged; PR #85 implementation exists and hosted GUT CI previously passed.
  - from: GUT_CI_NOT_ENABLED
    to: GUT_HOSTED_CI_PASS_PREVIOUS_HEAD_REVALIDATION_REQUIRED
    reason: exact-head run 31177968404 passed a264bb7b, but the head changed for v4.4 binding.
  - from: GUT_ACTUAL_CONSUMPTION_NOT_ENABLED
    to: GUT_ACTUAL_PRODUCT_SMOKE_PRESENT_REMAINING_PARITY_GATE
    reason: tests/gut/integration/test_gut_product_smoke.gd exists and ran on the prior exact head.
  - from: AWAITING_USER_VISUAL_DIRECTION
    to: STALE_STATUS_DIRECTION_ALREADY_APPROVED
    reason: GR-IMG-011 direction is approved in Sheet; runtime/final-art completion remains unproven.
```

## Current blockers

### Blocks PR #85 formal-adoption merge

```text
LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED
ROLE_SEPARATED_REVIEW_PENDING_CURRENT_HEAD
CURRENT_EXACT_HEAD_CI_REVALIDATION_REQUIRED
FINAL_SHEET_WRITE_AND_READBACK_PENDING
UNRESOLVED_FORMAL_ADOPTION_BLOCKERS_NONZERO
```

### Does not block this non-Godot GUT finalization, but blocks broader completion when applicable

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
HERA_CLI_ADDON_PAIR_UNVERIFIED
LOCAL_GODOT_REFERENCE_UNAVAILABLE_FROM_CURRENT_AGENT
LOCAL_WINDOWS_CHECKOUT_UNVERIFIED_FROM_CURRENT_AGENT
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
LOCAL_PROJECT_PLAY_NOT_RUN
```

The current repository tree has no `ASSET_MANIFEST.yml` readback. This is recorded as `ASSET_MANIFEST_CURRENT_MAIN_MISSING_NO_PROMOTED_ASSET_CLAIM`, not as proof that a promoted product asset was lost: this binding does not claim any new `PROJECT_ASSET_APPROVED` promotion.

## Allowed next actions

```yaml
allowed_next_actions:
  - COMPLETE_V4_4_BINDING_TEST_GREEN
  - WRITE_AND_VERIFY_GM_CONTRACT_V4_4_BINDING_01_TO_SHEET
  - PROVE_LEGACY_TO_GUT_REQUIRED_CONTRACT_PARITY
  - PROVE_HIGODOT_ZERO_PROTECTED_DIFF_OR_REQUIRE_AUTHORING_RECEIPT
  - RUN_ROLE_SEPARATED_REVIEW_ON_CURRENT_EXACT_HEAD
  - REVALIDATE_ALL_REQUIRED_GITHUB_CHECKS
  - MERGE_PR85_ONLY_IF_ALL_FORMAL_GATES_PASS
  - PERFORM_MERGED_MAIN_READBACK

forbidden_next_actions:
  - START_PR82_TASK2
  - ENABLE_GUT_EDITOR_PLUGIN
  - CLAIM_FULL_GUT_VENDOR_TREE_IDENTITY
  - CLAIM_VISUAL_AUDIO_COMPLETE
  - CLAIM_LOCAL_GODOT_RUN_COMPLETE
```

`decision: BLOCK` means product work behind the GUT formal-adoption gate remains blocked. It does not prohibit the explicitly allowed contract/test/review work needed to close that gate.
