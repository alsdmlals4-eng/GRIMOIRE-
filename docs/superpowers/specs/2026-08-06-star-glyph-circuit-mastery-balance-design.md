# Star Glyph Circuit and Mastery Balance Design

## Status

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
status: USER_APPROVED_DESIGN_CANON_MAIN
approved_at: 2026-08-06T01:44+09:00
sync_id: GR-SYNC-20260806-01
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
merged_pull_request: 68
sheet_sync: SYNCED_TO_MAIN
sheet_readback: PASS
supersedes:
  - GM-3X3-CIRCUIT-STOCK-FOCUS-01:circuit_topology
  - GM-3X3-CIRCUIT-STOCK-FOCUS-01:target_node_in_circuit
  - GM-3X3-CIRCUIT-STOCK-FOCUS-01:numeric_success_preview_prohibition
preserves:
  - typed_glyph_stock_direction
  - explicit_commit
  - no_auto_target
  - no_auto_commit
  - every_spell_commit_uses_mana
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_validation: NOT_RUN
human_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

## Goal

Replace the old 3×3 node-and-edge grammar with a readable fixed star circuit that makes spell complexity, glyph learning, mana pressure, and casting reliability visible before the player commits.

The player should naturally experience the following progression:

- a first-year student can use the main glyph alone or one auxiliary glyph reliably;
- a diligent first-year student can bring two well-practised auxiliary glyphs into the 60%+ safe range;
- three or more auxiliary glyphs require higher glyph mastery, advanced classes, or a deliberate stability investment;
- five auxiliary glyphs represent a capstone circuit rather than the default best answer.

## Player Flow

```text
observe situation
→ choose intent
→ place one main glyph in the centre
→ place zero to five auxiliary glyphs at the star vertices
→ inspect circuit preview
→ choose target by an available target keyword
→ inspect final cast preview
→ explicit Commit
→ resolve result, cost, and consequences
→ record and reflect
```

Target keywords are not circuit nodes. The target is selected only after the circuit itself is complete enough to preview.

## Circuit Topology

```yaml
layout: FIXED_FIVE_POINT_STAR
main_slot:
  position: CENTER
  count: exactly_1
auxiliary_slots:
  position: FIVE_VERTICES
  count: 0_to_5
  duplicate_same_glyph: prohibited_initially
target_nodes_inside_circuit: prohibited
hidden_slot_bonus: prohibited
slot_order_effect: deferred_until_separately_approved
edge_drawing: visual_connection_only_initially
```

The five outer slots are functionally equivalent in the first implementation. Their star placement communicates one coherent circuit and available complexity capacity; it does not secretly grant power, mana, or success bonuses by vertex.

## Two-Stage Preview

### Circuit Preview

Shown after a main glyph is present and whenever auxiliary glyphs change.

Required fields:

- generated spell name;
- main and auxiliary glyph list;
- each used glyph's mastery;
- predicted effect and unresolved conditions;
- target-independent mana estimate;
- target-independent success estimate;
- compatibility and instability warnings.

### Final Cast Preview

Shown after target keyword selection.

Required fields:

- resolved target and target scope;
- final mana cost;
- final success percentage;
- success-state label;
- expected effect range;
- partial-success consequence;
- failure or instability warning;
- remaining mana after Commit.

The preview may show numeric success probability. It must not reveal the ending, secretly select the best target, or auto-commit.

## Glyph Mastery

Every main glyph and auxiliary glyph owns an independent mastery value from 0 to 100.

Examples:

```text
main: HEAT mastery 72
main: HEAL mastery 34
auxiliary: PRECISION mastery 81
auxiliary: REDUCTION mastery 46
auxiliary: SPREAD mastery 58
```

Mastery is earned through both:

1. direct drawing and meaningful use of that glyph;
2. classes, guided practice, assignments, and research for that glyph.

Repeated trivial use receives diminishing mastery gain. A class does not replace meaningful application, and repeated field use does not bypass theory access indefinitely.

### Education and Mastery Ceilings

Year level does not directly add success chance. It opens courses, exercises, and mastery ceilings.

Initial curriculum baseline:

| Learning access | Maximum mastery available for covered glyphs |
|---|---:|
| Foundation course | 70 |
| Intermediate course | 80 |
| Advanced course | 90 |
| Complete understanding / capstone | 100 |

A first-year student may reach 70 in selected foundational glyphs through substantial study and use. They cannot raise every glyph to that level without corresponding learning access and evidence.

## Circuit Mastery

With no auxiliary glyph:

```text
circuit_mastery = main_mastery
```

With one or more auxiliary glyphs:

```text
circuit_mastery
= main_mastery × 0.45
+ auxiliary_mastery_average × 0.35
+ lowest_auxiliary_mastery × 0.20
```

The lowest auxiliary component prevents one poorly understood glyph from being hidden inside an otherwise familiar circuit.

Mastery success modifier:

```text
mastery_modifier_percentage_points
= clamp((circuit_mastery - 50) × 0.5, -25, +25)
```

## Success Formula

```text
final_success_percentage
= main_base_success
+ mastery_modifier
- auxiliary_complexity_penalty
+ special_auxiliary_success_modifier
- target_difficulty
- incompatibility_penalty
+ temporary_context_modifier
```

Clamp final success to 5–98%.

Initial normal main-glyph baseline:

```yaml
main_base_success: 75_PERCENT_TEST_VALUE
```

### Auxiliary Complexity Penalty

| Auxiliary glyphs used | Success penalty |
|---:|---:|
| 0 | 0 percentage points |
| 1 | -10 percentage points |
| 2 | -20 percentage points |
| 3 | -30 percentage points |
| 4 | -40 percentage points |
| 5 | -50 percentage points |

This penalty is based on occupied auxiliary slots, including Precision and Reduction.

### First-Year Calibration Target

Assume:

- main base success: 75%;
- circuit mastery: 70, producing +10 percentage points;
- ordinary target difficulty: -5 percentage points;
- no incompatibility or temporary modifier.

| Auxiliary glyphs | Final success | Intended reading |
|---:|---:|---|
| 0 | 80% | very stable |
| 1 | 70% | stable |
| 2 | 60% | lower edge of safe use |
| 3 | 50% | risky |
| 4 | 40% | highly risky |
| 5 | 30% | unsuitable for ordinary first-year field use |

## Mana Formula

```text
base_mana
= main_glyph_base_mana
+ sum(auxiliary_glyph_base_mana)
+ target_keyword_cost
+ output_scope_duration_cost

final_mana
= ceil(base_mana × (1
  + auxiliary_complexity_rate
  + precision_mana_rate
  - reduction_mana_rate
  + other_mana_modifiers))
```

Final mana cannot fall below the main glyph's base mana.

### Auxiliary Complexity Mana Rate

| Auxiliary glyphs used | Mana multiplier addition |
|---:|---:|
| 0 | +0% |
| 1 | +10% |
| 2 | +20% |
| 3 | +30% |
| 4 | +40% |
| 5 | +50% |

Auxiliary base costs are added before the complexity rate. Therefore a five-glyph circuit costs substantially more than 150% of a main-only spell.

## Precision Auxiliary Glyph

Precision spends additional mana to improve circuit reliability.

```text
precision_success_bonus_percentage_points
= precision_mastery / 10

precision_mana_rate
= +25%
```

At mastery 60, Precision grants +6 percentage points. At mastery 100, it grants +10 percentage points. Precision provides no direct power bonus and occupies one auxiliary slot, so its own complexity penalty still applies.

## Reduction Auxiliary Glyph

Reduction improves mana efficiency without directly improving success.

```text
reduction_mana_rate
= 10% + reduction_mastery / 10
```

This gives a 10–20% reduction across mastery 0–100. Reduction occupies one auxiliary slot, receives the normal complexity penalty, and provides no direct success modifier.

Precision and Reduction use additive percentage rates with the complexity rate. They do not multiply each other into a free efficiency loop.

## Preview State Labels

| Final success | Preview label |
|---:|---|
| 80–98% | STABLE |
| 60–79% | SAFE_RANGE |
| 40–59% | RISKY |
| 20–39% | UNSTABLE |
| 5–19% | COLLAPSE_RISK |

Detailed partial-success, failure, and backlash distributions remain a separate tuning contract. The preview must still state the currently known consequence class without claiming unimplemented runtime evidence.

## Compatibility and Failure Rules

- incompatible glyph combinations may add an explicit incompatibility penalty or block Commit;
- the player must be shown the reason, not only a lower number;
- cancel before Commit consumes neither mana nor reserved Stock;
- system failure during Commit must not consume resources twice;
- direct drawing, accessibility input, and Stock selection produce the same spell semantics;
- direct drawing is a mastery-learning source, not an inherent power or mana bonus;
- target keyword availability remains observation- and investigation-gated;
- the UI does not invent unavailable targets or recommend a canonical answer.

## Supersession Boundary

`GM-3X3-CIRCUIT-STOCK-FOCUS-01` remains historical evidence and retains its approved typed-glyph Stock, explicit Commit, and spell-mana principles where they do not conflict with this decision.

The following old rules are superseded:

- 3×3 cell topology;
- target nodes placed inside the circuit;
- adjacency, crossing, skip-edge, and terminal-leaf rules;
- Slice support cap of two as the general circuit capacity;
- prohibition on numeric success preview.

## Evidence Boundary

This document is an approved design contract, not runtime proof.

```yaml
product_project: NOT_CREATED
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
balance_values: PLAYTEST_TUNING_REQUIRED
```
