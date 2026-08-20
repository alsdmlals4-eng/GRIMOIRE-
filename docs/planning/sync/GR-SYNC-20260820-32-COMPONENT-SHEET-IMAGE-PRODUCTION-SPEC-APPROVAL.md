# GR-SYNC-20260820-32 — Component Sheet & Image Production Spec Approval

```yaml
sync_id: GR-SYNC-20260820-32-COMPONENT-SHEET-IMAGE-PRODUCTION-SPEC-APPROVAL
decision_id: GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01
user_written_spec_review: APPROVED
approved_at: 2026-08-20
spec: docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md
spec_header_review_pending_role: HISTORICAL_PRE_APPROVAL_STATE_SUPERSEDED_BY_THIS_RECEIPT
implementation_planning_authority: AUTHORIZED
component_execution_authority: PENDING_IMPLEMENTATION_PLAN
image_generation_execution_authority: PENDING_IMAGE_PRODUCTION_PLAN
product_behavior_change: NONE
task8_ownership_change: NONE
human_visual_validation: NOT_RUN
physical_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_validation: NOT_RUN
```

The user explicitly approved proceeding from the committed written spec. This receipt is the current approval authority for the design and supersedes the spec header's pre-review `USER_APPROVED_DESIGN_WRITTEN_SPEC_REVIEW_PENDING` state without rewriting historical spec content.

## Approved implementation-planning split

The approved spec contains two separable production workstreams with different evidence and failure modes, so implementation planning is split into two plans:

1. **UI Component / Godot Plan** — Component Sheets A–D, semantic components, shared Theme reuse, responsive assembly, automated layout/regression.
2. **Image Asset Production Plan** — first-session image candidate generation, approval, layer/reuse classification, asset registration, and later Godot integration.

Both plans must preserve Existing Solution First and the following hard boundaries:

- reuse `GrimoireThemeFactory` rather than creating a second token system;
- reuse `StarCircuitBoard` rather than creating a second FIVE_POINT_STAR renderer or validator;
- Board A/B remain reference-only and are not modified;
- shipping mobile battle/writing orientation remains landscape;
- narrow/portrait-width cases are component stress tests only;
- functional UI text/numbers/state truth remain live UI, not baked into generated images;
- Korean runtime copy remains blocked until the licensed Korean font gate is satisfied;
- no Human/Device/Performance/Full Slice PASS claim before real evidence.

## Next gate

```text
written spec user approval
→ implementation plans
→ plan self-review
→ execution path selection
→ TDD/component production + image candidate production
```
