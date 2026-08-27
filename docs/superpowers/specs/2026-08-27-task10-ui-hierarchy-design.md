# Task10 UI Hierarchy Repair Design

## Goal

Fix the visible layout collapse in the Task9 product root while preserving the approved player flow:

`글자 → 주문 → 대상 → 시전`

## Confirmed runtime defect

Hera inspection at 1280×720 showed that `spell_workflow_product_root.tscn` re-instantiated descendants already provided by its three screen scenes. Godot therefore rendered duplicate controls; the visible copies were no longer laid out by their intended containers. The glyph screen stacked panels at the origin, left most of the viewport visually empty, and made the writing action difficult to read.

The same duplicate-instancing pattern existed for the circuit and spell-use descendants, so the fix must cover all three player-facing screens rather than tuning only the first screenshot.

## Design decision

- Keep `spell_workflow_product_root.tscn` as the thin scene host for the three existing screen instances.
- Remove its duplicate descendant trees; each screen scene owns its own controls.
- Put common visual sizing back in the owning source scenes:
  - glyph writing area: 300px minimum height;
  - glyph recognise/clear actions: 48px and shared horizontal width;
  - circuit Vault and Typed Stock panels: 180px minimum width.
- Use current Korean player-facing terms on the spell-use screen: `완성 주문`, `대상 지정`, `대상`, `마나`, `주문 수정`, `시전`, `취소`.

## Scope

In scope: scene hierarchy, source-scene sizing, player-visible baseline labels, regression tests, Godot/Hera validation.

Out of scope: spell rules, reservations/transactions, glyph artwork, new imagery, mobile/device/performance/human QA, or a visual-style redesign.

## Acceptance criteria

1. Product root contains one authoritative descendant tree for each of glyph drawing, circuit placement, and spell use.
2. At 1280×720, glyph drawing has no overlap or dominant blank region; its writing action buttons are readable touch-sized controls.
3. Circuit source panels keep usable widths and the star board remains visible.
4. Spell-use labels use the approved Korean player terms.
5. Existing 47-suite Godot test runner remains green, and the live Hera runs have no runtime errors.

## Evidence boundary

The checks here are automated/headless and Hera runtime visual checks. Human, device, performance, accessibility, and export validation remain separate and not run.
