# Frostbloom W6 Decision Loop — Implementation Receipt

```yaml
receipt_id: GR-W6-IMPLEMENTATION-RECEIPT-20260829-01
feature_id: FTR-FROSTBLOOM-W6-DECISION-LOOP-01
github_issue: 242
authority: USER_APPROVED_2026-08-29
worktree_branch: codex/w6-decision-loop-implementation-20260829
base_origin_main_at_start: 77beaf9351b19c1c2fe42ce6720fd7c284f262bc
implementation_state: MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
implementation_pr: 245
implementation_pr_exact_head: b0f34b538680b5046705f36196eae71ed1b9b0a8
implementation_merge_commit: 713bfbfc4c16b9ea469f2aa2c313a72bc50e1b67
postmerge_main_readback: PASS
runtime_scope: DEVELOPMENT_PRODUCT_ROOT_ENTRY
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
export_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## Implemented scope

- One scene-pinned W6 Resource owns exactly `Known 2 / Unknown 2 / Lens 1` and the two equal-cost targets `FROST_SEEDLINGS` / `GREENHOUSE_STRUCTURE`.
- The target cards now state the protected value and remaining risk. The forecast presents **확인된 개선 / 남는 위험 / 아직 미확인 / 시전 정보** without a recommendation, hidden modifier, auto-target, or auto-cast.
- The existing coordinator, atomic use service, and result ledger remain the only target-preview, confirmation, and exactly-once transaction owners.
- The receipt remains split into actual result, remaining/forgone value, and unknown. No score, star, moral grade, new runtime image, or production asset batch was added.
- Player-facing W6 labels are Korean in the Spell Use, target-selector, and commit-bar surfaces.

## Exact implementation owners

| Concern | Current owner |
| --- | --- |
| W6 content schema | `src/core/content/frostbloom_w6_target_definition.gd`, `src/core/content/frostbloom_w6_decision_context.gd` |
| W6 live data | `data/frostbloom/w6/w6_decision_context_01.tres`, `frost_seedlings_target_01.tres`, `greenhouse_structure_target_01.tres` |
| Product binding and observation summary | `src/ui/spell_workflow/spell_workflow_product_root.gd/.tscn` |
| Target choice / forecast / explicit cast surface | `src/ui/components/context_target_selector.gd/.tscn`, `src/ui/spell_workflow/spell_use_screen.gd/.tscn`, `src/ui/components/commit_bar.gd/.tscn` |
| Deterministic regression | `tests/unit/test_frostbloom_w6_decision_context.gd`, Product Root and Spell Use integration suites, `tests/test_runner.gd` |

`known_improvement` is derived from the same target Resource field as the accepted `actual` receipt statement. This intentionally prevents two independently editable claims from drifting; `forgone_or_remaining` and `unknown` remain separate, live Resource fields.

## Fresh evidence

| Check | Result | Limit |
| --- | --- | --- |
| Custom Godot runner | `48` suites, `2,051` assertions, `0` failures on Godot `4.7.1` | automated behavior only |
| GUT 9.7.1 | local direct run: `8/8` tests, `29` assertions passed | PR #245 formal GUT lane was skipped by workflow condition; this is not an exact-head GUT-manifest claim |
| PR #245 required checks | exact head `b0f34b5`: all applicable checks passed; safely squash-merged as `713bfbf` | three formal GUT workflow jobs were skipped; Human/device/performance evidence remains separate |
| Godot runtime smoke | Main Product Root launched at `1280×720`; Godot AI helper live; `current_run_errors: []` | no human readability, touch, or device claim |
| Project operating contract | `OPERATING_CONTRACT_VALID` against fresh Base `origin/main` `2e6fa14a93ffba177b22fd7ff21e2f654ea15bb0` | does not validate W6 player experience |
| Python authority contracts | `24` tests passed | repository governance only |

## Adversarial corrections made during implementation

| Finding | Class | Correction | Verification |
| --- | --- | --- | --- |
| Target selector initially discarded W6 semantic fields and still exposed stale English copy. | `MUST_FIX` | Preserve W6 choice payload through the selector; add Korean forecast headings and static-copy regression checks. | Custom runner green. |
| Requiring W6-only fields in the reusable selector broke its existing generic component contract. | `MUST_FIX` | Keep basic `id/label/hint` support and render W6 semantic lines only when provided. | Component suite and all custom suites green. |
| The project router referenced a missing operating-contract validator. | `MUST_FIX` | Restore a project-local validator that checks adapter/snapshot, pinned Base release, current Base main ancestry, route files, and generated views. | `OPERATING_CONTRACT_VALID`. |
| The first manual GUT invocation used the wrong Godot script form. | `INCIDENT` | Use the repository's documented `-s … -gconfig=res://.gutconfig.json -gexit` invocation. | GUT 8/8 green. |
| A direct headless run could not load the tracked greenhouse backdrop after local generated import sidecars were absent. | `RECOVERED_LOCAL_RUNTIME_PREREQUISITE` | Read Git ownership: the `.webp` source was present on `HEAD` and `origin/main`; regenerate only the local Godot import cache, without adding an asset or changing the source binary. | Reimport exit 0; custom runner green. |
| The original W6 context checked two targets but not the exact required target ID pair. | `MUST_FIX` | Require `FROST_SEEDLINGS` and `GREENHOUSE_STRUCTURE`; add a malformed-ID regression. | Custom runner green with 2,051 assertions. |
| The component-sheet CI still treated every reusable component as English-only, which conflicted with the approved Korean live W6 surface. | `MUST_FIX` | Restrict the English-safe guard to CI capture sheets; preserve the separate Korean font rights/readability gate as `NOT_RUN`. | PR #245 exact-head component contract passed. |
| W6 card height was applied to generic Component Sheet B fixture cards, causing its 1280×720 capture bounds to clip. | `MUST_FIX` | Keep the original compact height for generic `id/label/hint` cards; reserve the taller card only for W6 semantic payloads. | PR #245 exact-head component contract passed. |

```yaml
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: >-
  The router repair is project-local recovery evidence and the Godot/GUT findings
  have one GRIMOIRE consumer. Base was read and validated but not changed.
human_observation_script: docs/validation/W6_FROSTBLOOM_DECISION_LOOP_HUMAN_OBSERVATION_SCRIPT_2026-08-29.md
next_required_gate: HUMAN_PLAYER_DEVICE_PERFORMANCE_ACCESSIBILITY_EXPORT_FULL_SLICE
```
