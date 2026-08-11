# Task 8 Spell Use Screen — Resume Research Receipt (HiGodot v3.1.4)

```yaml
work_unit: TASK8_SPELL_USE_SCREEN_RESUME
work_question: How should Task 8 resume on current main without duplicating Stage 3 authority, while reconciling user-reported HiGodot v3.1.4 against tracked v3.1.3 canon?
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
sync_id: GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT
observed_at: 2026-08-11
base_main: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main: 8b3a82576bce2961fe104dc430c2d9c9e0831e06
project_open_pr: 116_DRAFT_STALE_HANDOFF
tracked_higodot: v3.1.3
user_reported_live_higodot: v3.1.4
official_v3_1_4_release_verified: true
official_v3_1_4_tag_commit: 96cc8b8c3d25ce487e24801d01d5214fea150349
official_v3_1_4_plugin_zip_sha256: 77d5bc7f8e0062f88aef08f3471cc6e4546a0d71d18813752781689ab6ce4848
persistent_godot_mutation_in_this_preflight: NONE
```

## Fresh authority read

- Base current main remains `315c66eea9614c284b9c11c4d522141065dfa4b0`; current external-source policy requires source-role/freshness/applicability, Existing Solution First, disposition, adversarial review, and exact-head/readback.
- GRIMOIRE current main is `8b3a82576bce2961fe104dc430c2d9c9e0831e06` after Frostbloom Internal Graybox Pack completion. The next product work unit is Task 8.
- Open PR #116 is a historical docs-only Task 8 handoff based on an older main and HiGodot v3.1.3. It MUST NOT be merged as-is.
- Current Sheet still preserves Task 8 `ON_HOLD_USER_REQUEST_COST_DEPENDENCY` and HiGodot v3.1.3 as tracked canon. Later current rows already queue Task 8 resume after Graybox. The user's current instruction resumes work and reports live Godot AI v3.1.4.

## Existing Solution First

Task 8 is a thin UI consumer. Current product code already owns Stage 3 semantics:

```text
SpellWorkflowCoordinator.select_prepared_spell(spell_id)
→ SpellWorkflowCoordinator.prepare_target_preview(target_keyword, target, payload)
→ SpellWorkflowCoordinator.request_use_confirmation()
→ SpellWorkflowCoordinator.confirm_use(use_transaction_id)
→ AtomicSpellUseService.use(...)
```

`prepare_target_preview()` calculates preview and prepares an internal use plan without spending Mana or consuming the prepared spell. `confirm_use()` delegates the commit to the existing atomic service. `AtomicSpellUseService` owns spend / mark-used-once / result-commit-once / rollback and idempotency.

Task 6 and Task 7 establish the local UI pattern: `Control` roots, explicit intent signals, Button semantics, reusable panels/components, state rendered from supplied data, and domain mutation delegated to existing coordinators/services. Task 7 explicitly contains no target-selection UI, so Task 8 is the correct first owner of target selection.

## Fresh benchmark / professional research

| Source | role | freshness / applicability | Task 8 use | disposition |
|---|---|---|---|---|
| Godot 4.7 `Control` / GUI navigation / focus docs | AUTHORITY_TARGET | exact engine major/minor family; directly applicable | use Control/Button focus semantics and visible keyboard/gamepad focus | ADOPT |
| Godot 4.7 InputMap | AUTHORITY_TARGET | current engine docs; directly applicable | one semantic confirm/cancel action can map multiple physical inputs | ADOPT |
| Android Developers accessibility touch-target guidance | AUTHORITY_TARGET | current Android guidance; platform-specific | protect physical touch usability; map 48dp principle through verified project scaling | ADAPT |
| Microsoft Xbox Accessibility Guidelines 107/112/113/114 | AUTHORITY_TARGET | current game accessibility guidance; cross-platform design reference | predictable navigation, visible focus, input equivalence, context before activation | ADAPT |
| Base current UX/UI system design | PROJECT_BASE_AUTHORITY | current Base main | UI receives display state and returns intent; no domain recomputation; Containers/layout/focus/accessibility gates | ADOPT |
| Existing GRIMOIRE Task 5/6/7 implementation/tests | PROJECT_AUTHORITY | current main | reuse exact Stage 3 authority and local screen conventions | ADOPT |
| Competitor interaction expression | REFERENCE_ONLY | not needed for implementation correctness | no visual/mechanical expression copying | REFERENCE_ONLY |

### Primary external references

- https://docs.godotengine.org/en/4.7/classes/class_control.html
- https://docs.godotengine.org/en/4.7/classes/class_inputmap.html
- https://developer.android.com/guide/topics/ui/accessibility/apps
- https://learn.microsoft.com/en-us/gaming/accessibility/xbox-accessibility-guidelines/107
- https://learn.microsoft.com/en-us/gaming/accessibility/xbox-accessibility-guidelines/112
- https://learn.microsoft.com/en-us/gaming/accessibility/xbox-accessibility-guidelines/113
- https://learn.microsoft.com/en-us/gaming/accessibility/xbox-accessibility-guidelines/114
- https://github.com/hi-godot/godot-ai/releases/tag/v3.1.4

## HiGodot v3.1.4 source-state distinction

Official upstream v3.1.4 exists and was published on 2026-08-10. The official tag resolves to commit `96cc8b8c3d25ce487e24801d01d5214fea150349`. The release API reports `godot-ai-plugin.zip` digest `sha256:77d5bc7f8e0062f88aef08f3471cc6e4546a0d71d18813752781689ab6ce4848`.

This does **not** prove the GRIMOIRE tracked `addons/godot_ai` subtree is already v3.1.4. Current tracked evidence remains v3.1.3. Therefore:

```yaml
live_version_claim: USER_REPORTED_V3_1_4
upstream_release_claim: VERIFIED_OFFICIAL_V3_1_4
tracked_project_vendor_claim: V3_1_3_UNTIL_NEW_EXACT_RECONCILIATION
required_before_persistent_task8_authoring: FRESH_V3_1_4_LIVE_AND_TRACKED_ALIGNMENT_READBACK_OR_EXPLICIT_SEPARATION_OF_VENDOR_DELTA
```

Vendor alignment and Task 8 product authoring must not be conflated. If a vendor update is still untracked, reconcile that tool-state delta first or isolate it from the Task 8 product delta with exact evidence.

## Adversarial preflight

Fail closed on any of these:

1. Task 8 creates a second target/use transaction authority.
2. preview, hover, focus, target browsing, or screen open mutates Mana/inventory/result/world.
3. first/nearest target is silently selected or confirmed.
4. repeated confirm can double-spend or double-apply results.
5. target becomes invalid between preview and commit and local UI partially commits anyway.
6. cancel/back invents a restore policy competing with current workflow state.
7. touch uses a separate semantic code path from keyboard/gamepad activation.
8. a fixed absolute layout blocks Task 9 responsive work.
9. local v3.1.4 is promoted to tracked-vendor PASS without exact evidence.
10. GitHub text writes are used to bypass HiGodot for protected persistent Godot source.
11. automated checks are promoted to human/device/performance/full-slice evidence.

## Research conclusion

```yaml
product_direction_change: NONE
implementation_direction: THIN_UI_ADAPTER_OVER_EXISTING_STAGE3_AUTHORITY
preflight_status: PASS_WITH_HIGODOT_V3_1_4_ALIGNMENT_GATE
next_authorized_action: V314_ALIGNMENT_READBACK_THEN_TASK8_HIGODOT_TDD_RED
research_receipt_reuse: SAME_WORK_UNIT_ONLY_IF_SCOPE_PRODUCT_DECISION_KEY_ASSUMPTIONS_UNCHANGED
```