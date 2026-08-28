# Frostbloom W6 Decision Loop — L3 Traceability Packet

> 이 Packet은 승인된 L2 설계를 다시 쓰지 않는다. 하나의 W6 구현 계약에서 요구·수락 기준·실제 파일·검증을 연결하는 파생 추적층이다. 2026-08-29 changed worktree의 자동화·런타임 스모크 evidence를 기록하지만 Human 검증을 주장하지 않는다.

## 1. Packet identity

```yaml
packet_id: GR-W6-L3-TRACE-20260828-01
work_level: L3
design_spec_id: FTR-FROSTBLOOM-W6-DECISION-LOOP-01
canonical_design_spec_path: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
approval_reference: 2026-08-28 user message "진행해" after the W6 L2 review gate
source_commit: 7019174adeece3d1f8bcd7e8e249856389b1aa5d
github_successor_issue: 242
created_at_kst: 2026-08-28
updated_at_kst: 2026-08-29
contract_status: USER_APPROVED_L3__IMPLEMENTED_AUTOMATED_RUNTIME_SMOKE_PASS__PR_PENDING
coverage_status: PARTIAL_EVIDENCED
implementation_receipt: docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md
```

`PARTIAL_EVIDENCED`는 계획된 Resource·Scene·코드·테스트와 changed-worktree 자동화·런타임 스모크 evidence가 존재한다는 뜻이다. PR exact-head, Human, device, performance, accessibility, export, and full-slice evidence가 없으므로 `CONVERGED`는 아니다.

## 2. Canonical authority and protected scope

```yaml
canonical_sources:
  - source_id: W6_L2_FEATURE_SPEC
    path: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
    section_or_record: W6-R01_to_W6-R09__W6-AC01_to_W6-AC08
    authority: PLAYER_EXPERIENCE_RULES_AND_ACCEPTANCE
  - source_id: W6_PRESERVATION_DECISION
    path: docs/planning/FROSTBLOOM_W6_PRESERVATION_PRIORITY_01_APPROVAL_2026-08-28.md
    section_or_record: target_value_forecast_and_receipt_contract
    authority: TARGET_MEANING_AND_PARITY
  - source_id: SPELL_FLOW_DECISION
    path: docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
    section_or_record: glyph_to_spell_to_target_to_cast
    authority: PLAYER_FACING_TERMS_AND_FLOW
  - source_id: RUNTIME_FOUNDATION
    path: src/core/workflow/spell_workflow_coordinator.gd
    section_or_record: prepare_target_preview__request_use_confirmation__confirm_use
    authority: EXISTING_TARGET_AND_TRANSACTION_SEAM
  - source_id: TRANSACTION_FOUNDATION
    path: src/core/spells/atomic_spell_use_service.gd
    section_or_record: use__rollback
    authority: EXACTLY_ONCE_MANA_SPELL_RESULT_TRANSACTION
  - source_id: VISUAL_TONE
    path: docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md
    section_or_record: final_planning_reference_lock
    authority: PLANNING_VISUAL_GRAMMAR_ONLY
protected_scope:
  - FIVE_POINT_STAR
  - TYPED_GLYPH_ONLY_STOCK
  - EXPLICIT_EXACTLY_ONCE_CAST
  - existing AtomicSpellUseService and AtomicResultLedger authority
  - warm-academy planning reference remains non-runtime
excluded_scope:
  - Task8 recovery
  - 46-minute first session
  - W7 and full Result/Grimoire persistence
  - runtime image, audio, VFX, animation, or production-asset batch
  - new target/use/Mana/result transaction engine
  - Notion read, write, or destination readback
```

## 3. Implementation contract decisions

| Item | Contracted decision | Evidence / reason | Status |
| --- | --- | --- | --- |
| W6 content owner | One typed Godot `Resource` assigned to Product Root: `res://data/frostbloom/w6/w6_decision_context_01.tres`. | Godot `FileAccess` warns that non-resource source files need export inclusion configuration; a `Resource` avoids a hidden build dependency and keeps one editor-owned structured source. | `IMPLEMENTED` |
| Schema | `FrostbloomW6DecisionContext` owns exactly 2 known observations, 2 unknown categories, one Lens, and exactly 2 `FrostbloomW6TargetDefinition` entries. | Replaces the Root-level generic target dictionaries and prevents a generic fallback. | `IMPLEMENTED_AUTOMATED_PASS` |
| Initial numeric parity | Both targets use `difficulty: 3`, `mana_cost: 3`; final success and final Mana still come only from the current calculator. | Equal visible input removes the current un-explained 4/3 versus 2/2 prototype asymmetry. These are `PLAYTEST_TUNING_REQUIRED`, not balance proof. | `IMPLEMENTED_AUTOMATED_PASS` |
| UI scope | Existing `ContextTargetSelector`, `CommitBar`, `SpellUseScreen`, Product Root result panel, and Academy theme are adapted; no new transaction UI owner is created. | W6 values, remaining risk, unknown, Korean copy, and the receipt are shown through existing seams. | `IMPLEMENTED_AUTOMATED_PASS` |
| Planning visual | Existing greenhouse background and approved W6 grammar may inform layout only; the W6 board binary is not copied or bound. | Planning reference status is `USER_APPROVED_PLANNING_REFERENCE_ONLY`. | `PROTECTED` |

### External research record

| Source | Checked | Observed fact | Disposition | Limit |
| --- | --- | --- | --- | --- |
| [Godot JSON](https://docs.godotengine.org/en/stable/classes/class_json.html) | 2026-08-28 | JSON parsing returns untyped `Variant` values and needs explicit validation. | `REJECT` as this W6 runtime owner. | Does not forbid JSON for separately configured uses. |
| [Godot FileAccess](https://docs.godotengine.org/en/stable/classes/class_fileaccess.html) | 2026-08-29 | Exported project files may not retain original source form; direct file loading requires explicit inclusion handling. | `REJECT` as the default W6 content delivery path. | Does not prove the Resource UI is readable. |
| [Godot Resources](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html) | 2026-08-29 | Resources are serializable project data and can be referenced by scenes. | `ADOPT` for one W6 context owner. | Does not replace changed-head engine tests. |
| [Godot UI](https://docs.godotengine.org/en/stable/tutorials/ui/index.html) | 2026-08-29 | `Control` and Container nodes support responsive UI composition. | `ADAPT` the current controls, not a new UI framework. | Does not prove target-resolution readability or touch ergonomics. |

## 4. Traceability matrix

| decision_id | requirement_id | requirement summary | acceptance_criteria_ids | task_ids | implementation_paths | verification_ids | status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01 | W6-R01 | Exactly two complete, valid W6 targets; no generic fallback. | W6-AC01, W6-AC02 | W6-T01, W6-T02 | `src/core/content/frostbloom_w6_decision_context.gd`; `src/core/content/frostbloom_w6_target_definition.gd`; `data/frostbloom/w6/w6_decision_context_01.tres`; `src/ui/spell_workflow/spell_workflow_product_root.gd` | W6-VFY01, W6-VFY02 | IMPLEMENTED_AUTOMATED_PASS |
| GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01 | W6-R02 | Both targets begin with matched visible Mana/difficulty and equivalent card hierarchy. | W6-AC02, W6-AC03 | W6-T01, W6-T03 | W6 Resource; `src/ui/components/context_target_selector.gd/.tscn`; `src/ui/spell_workflow/spell_use_screen.gd/.tscn` | W6-VFY01, W6-VFY03, W6-VFY07 | IMPLEMENTED_AUTOMATED_PASS__HUMAN_DEVICE_NOT_RUN |
| GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01 | W6-R03 | Unknown is category-level text, not a hidden Mana/success modifier. | W6-AC03 | W6-T01, W6-T03 | W6 Resource; `src/ui/spell_workflow/spell_use_screen.gd`; `src/ui/components/commit_bar.gd` | W6-VFY01, W6-VFY03 | IMPLEMENTED_AUTOMATED_PASS |
| GM-STAR-CIRCUIT-MASTERY-BALANCE-01 | W6-R04 | Target switching changes preview only. | W6-AC03, W6-AC04 | W6-T02, W6-T03 | `src/ui/spell_workflow/spell_workflow_product_root.gd`; `src/ui/spell_workflow/spell_use_screen.gd`; `src/core/workflow/spell_workflow_coordinator.gd` | W6-VFY02, W6-VFY04 | IMPLEMENTED_AUTOMATED_PASS |
| GM-STAR-CIRCUIT-MASTERY-BALANCE-01 | W6-R05 | Confirmation has one accepted Mana/spell/result transaction. | W6-AC04, W6-AC06 | W6-T04 | `src/core/workflow/spell_workflow_coordinator.gd`; `src/core/spells/atomic_spell_use_service.gd`; `src/core/atomic_result_ledger.gd`; `src/ui/spell_workflow/spell_workflow_product_root.gd`; `tests/unit/test_atomic_spell_use_service.gd` | W6-VFY04, W6-VFY05 | IMPLEMENTED_AUTOMATED_PASS__PR_GUARD_PENDING |
| GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01 | W6-R06 | Receipt separates actual, forgone/remaining, and unknown without grade. | W6-AC05 | W6-T04 | W6 Resource; `src/ui/spell_workflow/spell_workflow_product_root.gd/.tscn`; `tests/integration/test_spell_workflow_product_root.gd` | W6-VFY02, W6-VFY04 | IMPLEMENTED_AUTOMATED_PASS |
| GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01 | W6-R07 | First accepted W6 actual remains true; no W7 rewrite. | W6-AC05 | W6-T04 | W6 Resource receipt fields; `src/core/atomic_result_ledger.gd` | W6-VFY04, W6-VFY08 | IMPLEMENTED_AUTOMATED_PASS__HUMAN_NOT_RUN |
| GM-SPELL-WORKFLOW-UI-V2-01 | W6-R08 | Live player-facing copy is Korean `글자 → 주문 → 대상 → 시전`. | W6-AC07 | W6-T03, W6-T04 | `src/ui/spell_workflow/spell_use_screen.tscn`; `src/ui/components/context_target_selector.tscn`; `src/ui/components/commit_bar.gd/.tscn`; `src/ui/spell_workflow/spell_workflow_product_root.tscn` | W6-VFY03, W6-VFY06 | IMPLEMENTED_AUTOMATED_PASS |
| GM-VISUAL-TONE-20260828-01 | W6-R09 | Text remains the state authority; visual grammar only assists. | W6-AC08 | W6-T02, W6-T03, W6-T05 | `src/ui/spell_workflow/spell_workflow_product_root.tscn`; existing greenhouse background; no new binary binding | W6-VFY06, W6-VFY07 | IMPLEMENTED_RUNTIME_SMOKE_PASS__READABILITY_NOT_RUN |

## 5. Verification evidence

| verification_id | requirement_ids | method | exact command / environment | artifact / result | status |
| --- | --- | --- | --- | --- | --- |
| W6-VFY01 | R01–R03 | Resource unit test | Godot 4.7.1 exact changed worktree, `--headless --path . --script res://tests/test_runner.gd` | Custom runner: 48 suites, 2,051 assertions, 0 failures; W6 shape, parity, exact target IDs, and malformed-data failure included. | CHANGED_WORKTREE_AUTOMATED_PASS__48_SUITES_2051_ASSERTIONS |
| W6-VFY02 | R01, R04, R06 | Product Root integration | Same custom headless runner on exact changed worktree. | Product Root suite proves W6 flow, repeated switching, receipt layers, and no generic target within the 48-suite pass. | CHANGED_WORKTREE_AUTOMATED_PASS__48_SUITES_2051_ASSERTIONS |
| W6-VFY03 | R02, R03, R08 | Spell Use UI integration | Same custom headless runner on exact changed worktree. | Spell Use suite proves equal semantic cards, forecast sections, Korean live copy, and error retention within the 48-suite pass. | CHANGED_WORKTREE_AUTOMATED_PASS__48_SUITES_2051_ASSERTIONS |
| W6-VFY04 | R04–R07 | Transaction regression | Same runner with current Coordinator, atomic use, and ledger suites. | Existing transaction suites plus W6 product integration remain green within the 48-suite pass. | CHANGED_WORKTREE_AUTOMATED_PASS__48_SUITES_2051_ASSERTIONS |
| W6-VFY05 | R05 | GUT exact-head regression | Godot 4.7.1, `-s addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json -gexit`. | GUT 9.7.1: 4 scripts, 8 tests, 29 assertions, 0 failures. PR exact-head manifest/hash guard remains pending. | PARTIAL__GUT_9_7_1_8_TESTS_29_ASSERTIONS_PASS__PR_EXACT_HEAD_GUARD_PENDING |
| W6-VFY06 | R08, R09 | Scene static/readback inspection | Godot editor / official Godot AI readback, 1280×720 GL Compatibility scene. | Korean text nodes, no W6 board binary binding, headings and controls are present. Target-resolution readability remains unobserved. | EDITOR_STATIC_READBACK_PASS__TARGET_RESOLUTION_READABILITY_NOT_RUN |
| W6-VFY07 | R02, R08, R09 | Runtime visual inspection | Exact changed project, 1280×720 GL Compatibility runtime smoke. | Main scene launched with no task-related runtime errors. No device capture or human visual/readability observation exists. | RUNTIME_SMOKE_PASS_1280X720__VISUAL_READABILITY_DEVICE_NOT_RUN |
| W6-VFY08 | R07 | Human usability observation | Approved W6 human script, not automation. | Player restates chosen value, remaining risk, unknown, and result causality. | NOT_RUN |

## 6. Coverage gaps and evidence ceiling

```yaml
unmapped_items: []
implementation_gaps: []
evidence_gaps:
  - PR exact-head required-check and protected-product-hash evidence.
  - Target-resolution manual readability and touch observation.
  - Human usability/Player Experience evidence.
  - Device, performance, accessibility, export, and full-slice evidence.
unknowns:
  - Player comprehension at actual mobile reading distance.
  - Seven-minute target duration.
  - Numeric tuning after player observation.
  - Accessibility and performance on real device.
next_action: Commit the validated changed worktree, push a W6-only PR, then collect exact-head checks before the separate Human/device/performance/export/full-slice gates.
```

## 7. Incident / solution / lesson

```yaml
incident: Generic target dictionaries duplicated the W6 choices, encoded an unexplained numeric asymmetry, and could not carry the required consequence semantics; a direct JSON/FileAccess owner would add an export-inclusion risk.
solution: Use one typed Godot Resource assigned to Product Root, derive target choices and receipts from it, and preserve the existing transaction authorities. Correct the reusable selector so generic callers stay compatible while the W6 Product Root validates the mandatory semantic fields.
lesson: A shipped Godot scenario needs an export-safe structured owner plus validation at the consumer boundary; reusable UI should accept its established generic contract while the product boundary enforces scenario-specific meaning.
implementation_incidents:
  - The project-local operating-contract validator was missing. It was restored and then passed against fresh Base origin/main.
  - The first selector adaptation stripped W6 semantic fields and left English fallback copy. The W6 semantic payload and Korean player-facing copy now remain through the selected-target path.
  - An initial strict selector validation broke its existing generic component test. Generic input compatibility was restored; W6 strictness stays at the W6 consumer boundary.
  - The historical GUT command used an unsupported `--script`/plain config form. The documented `-s` plus `res://.gutconfig.json` form passed.
  - Local generated Godot import sidecars were absent while the tracked greenhouse `.webp` source remained intact. Reimport restored the local runtime prerequisite without changing or adding a source asset.
  - Initial context validation accepted any two unique IDs. The exact W6 target pair is now required and covered by a malformed-ID regression.
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: Godot's export guidance already documents this general Resource/FileAccess distinction, and this work has only one project-specific consumer with no cross-project validation.
```

## 8. L3 five-pass adversarial review

| loop | full-scope attack | finding | disposition / correction | result |
| --- | --- | --- | --- | --- |
| 1 | A new data owner could silently bypass the established cast transaction. | A standalone W6 service would duplicate coordinator and atomic-ledger authority. | `MUST_FIX`: Resource is content-only; target preview, confirmation, rollback, and ledger remain in their current owners. | corrected in implementation |
| 2 | A Resource plan could turn a content slice into speculative framework work. | General scenario frameworks, save migration, and W7 persistence are not required for one W6 loop. | `MUST_FIX`: exactly two typed Resource classes and one assigned `.tres`; no generalized loader or persistence layer. | scope constrained in implementation |
| 3 | A direct adaptation could strip the value/remaining-risk/unknown semantics or regress existing generic selector callers. | The first W6 selector pass did both: it omitted semantic payload fields and rejected legacy generic card input. | `MUST_FIX`: semantic fields pass through W6; generic selector compatibility is retained; W6 Consumer validates the stricter scenario contract. | corrected; automated regression pass |
| 4 | A visually plausible board could be mistaken for a usable runtime screen. | The approved W6 board remains planning-only; the changed scene has only editor readback and runtime smoke, not target-resolution Human/device inspection. | `MUST_FIX`: no board binary binding; static scene, runtime smoke, device, and Human checks remain distinct evidence. | ceiling preserved |
| 5 | Research or an automated run could be used to claim exported/mobile readiness prematurely. | Official Resource and Control documentation validates the mechanism; 1280×720 smoke validates launch only. Neither proves touch readability, export, or player comprehension. | `MUST_FIX`: PR exact-head, device, Human, performance, accessibility, export, and full-slice gates remain separate. | evidence boundaries preserved |

## 9. Convergence rule

This Packet becomes `CONVERGED` only after every mapped path is present, each `W6-VFY01`–`W6-VFY08` has the required exact evidence, no active reference points to generic W6 behavior, and the post-merge main readback succeeds. It remains `PARTIAL_EVIDENCED` until then.
