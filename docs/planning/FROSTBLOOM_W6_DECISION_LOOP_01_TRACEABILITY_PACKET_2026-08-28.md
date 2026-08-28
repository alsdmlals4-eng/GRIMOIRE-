# Frostbloom W6 Decision Loop — L3 Traceability Packet

> 이 Packet은 승인된 L2 설계를 다시 쓰지 않는다. 하나의 W6 구현 계약에서 요구·수락 기준·예정 파일·검증을 연결하는 파생 추적층이며, 현재 코드 구현이나 Human 검증을 주장하지 않는다.

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
contract_status: USER_APPROVED_L3_PLAN__GODOT_IMPLEMENTATION_NOT_AUTHORIZED
coverage_status: GAP
```

`GAP`는 추적 연결이 빠졌다는 뜻이 아니라 아직 계획된 Resource·Scene·코드·테스트와 changed-head 실행 증거가 없다는 뜻이다. 파일 존재, 문서 체크 표시, 과거 Task9 통과를 `CONVERGED`로 승격하지 않는다.

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
| W6 content owner | One typed Godot `Resource` assigned to Product Root: `res://data/frostbloom/w6/w6_decision_context_01.tres`. | Godot `FileAccess` warns that non-resource source files need export inclusion configuration; a `Resource` avoids a hidden build dependency and keeps one editor-owned structured source. | `APPROVED_FOR_L3_PLAN` |
| Schema | `FrostbloomW6DecisionContext` owns exactly 2 known observations, 2 unknown categories, one Lens, and exactly 2 `FrostbloomW6TargetDefinition` entries. | Replaces the current Root-level duplicate `WARD`/`FLOWER` dictionaries and prevents a generic fallback. | `APPROVED_FOR_L3_PLAN` |
| Initial numeric parity | Both targets use `difficulty: 3`, `mana_cost: 3`; final success and final Mana still come only from the current calculator. | Equal visible input removes the current un-explained 4/3 versus 2/2 prototype asymmetry. These are `PLAYTEST_TUNING_REQUIRED`, not balance proof. | `APPROVED_RECOMMENDED_DEFAULT` |
| UI scope | Existing `ContextTargetSelector`, `CommitBar`, `SpellUseScreen`, Product Root result panel, and Academy theme are adapted; no new transaction UI owner is created. | Current seams already forward payloads to the atomic ledger but do not display W6 meaning. | `ADAPT` |
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
| GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01 | W6-R01 | Exactly two complete, valid W6 targets; no generic fallback. | W6-AC01, W6-AC02 | W6-T01, W6-T02 | `src/core/content/frostbloom_w6_decision_context.gd`; `src/core/content/frostbloom_w6_target_definition.gd`; `data/frostbloom/w6/w6_decision_context_01.tres`; `src/ui/spell_workflow/spell_workflow_product_root.gd` | W6-VFY01, W6-VFY02 | PLANNED |
| GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01 | W6-R02 | Both targets begin with matched visible Mana/difficulty and equivalent card hierarchy. | W6-AC02, W6-AC03 | W6-T01, W6-T03 | W6 Resource; `src/ui/components/context_target_selector.gd/.tscn`; `src/ui/spell_workflow/spell_use_screen.gd/.tscn` | W6-VFY01, W6-VFY03, W6-VFY07 | PLANNED |
| GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01 | W6-R03 | Unknown is category-level text, not a hidden Mana/success modifier. | W6-AC03 | W6-T01, W6-T03 | W6 Resource; `src/ui/spell_workflow/spell_use_screen.gd`; `src/ui/components/commit_bar.gd` | W6-VFY01, W6-VFY03 | PLANNED |
| GM-STAR-CIRCUIT-MASTERY-BALANCE-01 | W6-R04 | Target switching changes preview only. | W6-AC03, W6-AC04 | W6-T02, W6-T03 | `src/ui/spell_workflow/spell_workflow_product_root.gd`; `src/ui/spell_workflow/spell_use_screen.gd`; `src/core/workflow/spell_workflow_coordinator.gd` | W6-VFY02, W6-VFY04 | PLANNED |
| GM-STAR-CIRCUIT-MASTERY-BALANCE-01 | W6-R05 | Confirmation has one accepted Mana/spell/result transaction. | W6-AC04, W6-AC06 | W6-T04 | `src/core/workflow/spell_workflow_coordinator.gd`; `src/core/spells/atomic_spell_use_service.gd`; `src/core/atomic_result_ledger.gd`; `src/ui/spell_workflow/spell_workflow_product_root.gd`; `tests/unit/test_atomic_spell_use_service.gd` | W6-VFY04, W6-VFY05 | PLANNED |
| GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01 | W6-R06 | Receipt separates actual, forgone/remaining, and unknown without grade. | W6-AC05 | W6-T04 | W6 Resource; `src/ui/spell_workflow/spell_workflow_product_root.gd/.tscn`; `tests/integration/test_spell_workflow_product_root.gd` | W6-VFY02, W6-VFY04 | PLANNED |
| GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01 | W6-R07 | First accepted W6 actual remains true; no W7 rewrite. | W6-AC05 | W6-T04 | W6 Resource receipt fields; `src/core/atomic_result_ledger.gd` | W6-VFY04, W6-VFY08 | PLANNED |
| GM-SPELL-WORKFLOW-UI-V2-01 | W6-R08 | Live player-facing copy is Korean `글자 → 주문 → 대상 → 시전`. | W6-AC07 | W6-T03, W6-T04 | `src/ui/spell_workflow/spell_use_screen.tscn`; `src/ui/components/context_target_selector.tscn`; `src/ui/components/commit_bar.gd/.tscn`; `src/ui/spell_workflow/spell_workflow_product_root.tscn` | W6-VFY03, W6-VFY06 | PLANNED |
| GM-VISUAL-TONE-20260828-01 | W6-R09 | Text remains the state authority; visual grammar only assists. | W6-AC08 | W6-T02, W6-T03, W6-T05 | `src/ui/spell_workflow/spell_workflow_product_root.tscn`; existing greenhouse background; no new binary binding | W6-VFY06, W6-VFY07 | PLANNED |

## 5. Verification evidence

| verification_id | requirement_ids | method | exact command / environment | artifact / result | status |
| --- | --- | --- | --- | --- | --- |
| W6-VFY01 | R01–R03 | Resource unit test | Godot 4.7.1 exact project, `--headless --path . --script res://tests/test_runner.gd` | `tests/unit/test_frostbloom_w6_decision_context.gd` must prove shape, parity, and malformed-data failure. | NOT_RUN |
| W6-VFY02 | R01, R04, R06 | Product Root integration | Same custom headless runner on exact PR head. | `tests/integration/test_spell_workflow_product_root.gd` must prove W6 flow, repeated switching, receipt layers, and no generic target. | NOT_RUN |
| W6-VFY03 | R02, R03, R08 | Spell Use UI integration | Same custom headless runner on exact PR head. | `tests/integration/test_spell_use_screen.gd` must prove equal semantic cards, forecast sections, Korean live copy, and error retention. | NOT_RUN |
| W6-VFY04 | R04–R07 | Transaction regression | Same runner with current Coordinator, atomic use, and ledger suites. | Existing transaction suites plus W6 product integration must remain green. | NOT_RUN |
| W6-VFY05 | R05 | GUT exact-head regression | `tools/run_local_gut_validation.ps1 -ExpectedHead <exact-head> -BaseSha <fresh-origin-main> -PullRequest <pr> -Mode full -GodotExecutable <fresh-4.7.1-path>` | Manifest, JUnit, and protected-product hashes. | NOT_RUN |
| W6-VFY06 | R08, R09 | Scene static/readback inspection | Godot editor / HiGodot only, 1280×720 GL Compatibility scene. | Korean text nodes, no W6 board binary binding, headings and controls present. | NOT_RUN |
| W6-VFY07 | R02, R08, R09 | Runtime visual inspection | Exact changed project, 1280×720 and target device landscape capture. | No overlap/clip, equal target cards, touch-sized actions, text plus non-colour state. | NOT_RUN |
| W6-VFY08 | R07 | Human usability observation | Approved W6 human script, not automation. | Player restates chosen value, remaining risk, unknown, and result causality. | NOT_RUN |

## 6. Coverage gaps and evidence ceiling

```yaml
unmapped_items: []
implementation_gaps:
  - W6 Resource classes and Resource file do not exist on source main.
  - Product Root still owns duplicate WARD/FLOWER dictionaries.
  - Current selector, forecast, commit bar, and receipt do not carry W6 semantic fields.
  - Current custom runner does not yet include the W6 Resource suite.
  - Changed-head Godot, GUT, runtime visual, Human, device, performance, export, and full-slice evidence are absent.
unknowns:
  - Player comprehension at actual mobile reading distance.
  - Seven-minute target duration.
  - Numeric tuning after player observation.
  - Accessibility and performance on real device.
next_action: User explicitly authorizes the single W6 implementation contract; only then run the plan in docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md.
```

## 7. Incident / solution / lesson

```yaml
incident: Generic target dictionaries are duplicated in Product Root and encode an unexplained numeric asymmetry; a direct JSON/FileAccess owner would add an export-inclusion risk.
solution: Use one typed Godot Resource assigned to Product Root, derive target choices and receipts from it, and preserve the existing transaction authorities.
lesson: A shipped Godot scenario needs an export-safe structured owner plus validation at the consumer boundary; a scene-local dictionary is not a durable content contract.
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: Godot's export guidance already documents this general Resource/FileAccess distinction, and this work has only one project-specific consumer with no cross-project validation.
```

## 8. L3 five-pass adversarial review

| loop | full-scope attack | finding | disposition / correction | result |
| --- | --- | --- | --- | --- |
| 1 | A new data owner could silently bypass the established cast transaction. | A standalone W6 service would duplicate coordinator and atomic-ledger authority. | `MUST_FIX`: Resource is content-only; target preview, confirmation, rollback, and ledger remain in their current owners. | corrected in W6-T01–T04 contract |
| 2 | A Resource plan could turn a content slice into speculative framework work. | General scenario frameworks, save migration, and W7 persistence are not required for one W6 loop. | `MUST_FIX`: exactly two typed Resource classes and one assigned `.tres`; no generalized loader or persistence layer. | scope constrained |
| 3 | The plan could preserve prototype names or hidden numeric asymmetry through an adapter. | Product Root duplicates `WARD`/`FLOWER`; source-main tests still encode that prototype. | `MUST_FIX`: direct Resource derivation, explicit no-fallback assertion, and target parity tests are required before UI work can pass. | trace added |
| 4 | A visually plausible board could be mistaken for a usable runtime screen. | The approved W6 board is planning-only and no changed scene has been inspected at target resolution. | `MUST_FIX`: no board binary binding; static scene, runtime visual, device, and Human checks remain separate `NOT_RUN` evidence. | ceiling preserved |
| 5 | Research could be used to claim exported/mobile readiness prematurely. | Official Resource and Control documentation validates the chosen mechanism, not this project's changed head or touch readability. | `MUST_FIX`: exact-head Godot/GUT, 1280×720, device, and Human validations stay mapped as distinct gates. | evidence boundaries preserved |

## 9. Convergence rule

This Packet becomes `CONVERGED` only after every mapped path is present, each `W6-VFY01`–`W6-VFY08` has the required exact evidence, no active reference points to generic W6 behavior, and the post-merge main readback succeeds. It remains `GAP` until then.
