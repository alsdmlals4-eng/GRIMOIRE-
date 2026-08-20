# GR-SYNC-20260820-32-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT

```yaml
sync_id: GR-SYNC-20260820-32-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT
project: GRIMOIRE
source_main: 5718d9b92bb783be687ab18eed9338f2f5862ade
branch: visual/component-sheet-image-production-contract
decision_id: GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01
spec: docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md
user_design_approval:
  component_pack_1a: APPROVED
  component_pack_1b: APPROVED
written_spec_review: PENDING_USER_REVIEW
implementation_plan: NOT_STARTED
component_implementation: NOT_STARTED
image_generation: NOT_STARTED
existing_solution_first:
  star_ui_kit_v1: REUSE
  grimoire_theme_factory: REUSE
  star_circuit_board: REUSE
  approved_board_a_b: REFERENCE_ONLY_NO_MUTATION
mobile_contract:
  shipping_orientation: LANDSCAPE_UNCHANGED
  narrow_component_reflow: REQUIRED_STRESS_TEST
font_gate: ENGLISH_SAFE_COPY_UNTIL_LICENSED_KOREAN_FONT
human_visual_validation: NOT_RUN
physical_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_validation: NOT_RUN
```

## Scope

This sync records the written production contract derived from the user-approved Component Pack 1A/1B. It adds no gameplay behavior and does not start Godot component implementation or image generation.

## Existing Solution First result

The repository already contains a reusable Star UI Kit v1, shared `GrimoireThemeFactory`, `StarCircuitBoard`, and text-free common SVGs. The new contract therefore treats the 12 Component Pack entries as production deliverables/composites rather than a replacement 12-family Theme system.

## Conflict reconciliation

The previously approved generic mobile-responsive discussion included narrow/mobile layouts. Existing GRIMOIRE mobile battle/writing authority remains landscape fixed. The written contract preserves landscape as shipping authority and uses narrow/portrait-width conditions only as component reflow stress tests unless a later explicit user product decision supersedes that orientation contract.

## Spec self-review

- Placeholder scan: PASS — no TODO/TBD placeholders.
- Internal consistency: PASS — existing Theme/Star component ownership preserved.
- Scope check: PASS — four Component Sheets plus one small first-session image batch; no full Year-One asset expansion.
- Ambiguity check: PASS — mobile orientation, font gate, image/UI ownership, and 12-deliverable-vs-Theme-family distinction are explicit.

## Gate

Per the architectural brainstorming workflow, implementation planning and actual asset/component production remain blocked until the user reviews the committed written spec and explicitly approves it.
