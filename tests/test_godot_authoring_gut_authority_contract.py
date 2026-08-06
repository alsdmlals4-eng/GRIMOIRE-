import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
LEGACY_SPEC = ROOT / "docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md"
ADOPTION_SPEC = ROOT / "docs/testing/GUT_9_7_1_ADOPTION_SPEC.md"
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
ACTIVE_FILES = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CANON_SYNC_STATE.json",
    ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json",
]


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_authority_design_plan_binding_and_adoption_spec_exist(self):
        self.assertTrue(LEGACY_SPEC.is_file(), str(LEGACY_SPEC))
        self.assertTrue(ADOPTION_SPEC.is_file(), str(ADOPTION_SPEC))
        self.assertTrue(BINDING.is_file(), str(BINDING))
        self.assertTrue(PLAN.is_file(), str(PLAN))
        self.assertTrue(STATE.is_file(), str(STATE))
        self.assertTrue(UNRESOLVED.is_file(), str(UNRESOLVED))

    def test_v4_3_transitions_to_adoption_spec_block(self):
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.3", data["contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-3-BINDING-01", data["contract"]["binding_decision_id"])
        self.assertEqual("GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01", data["decision_id"])
        self.assertEqual("CONTRACT_V4_3_BOUND_GUT_ADOPTION_SPEC_IN_REVIEW", data["status"])
        self.assertEqual("USER_APPROVED_2026-08-06", data["design_review"])
        self.assertEqual("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", data["review"]["model"])
        self.assertEqual("NOT_PLANNED_SOLO_DEVELOPMENT", data["review"]["external_independent_reviewer"])
        self.assertEqual("MERGED_MAIN_READBACK_PASS", data["pr83_merge_gate"]["status"])
        self.assertFalse(data["pr83_merge_gate"]["waives_future_pr_review"])
        self.assertEqual("SOLE_AUTHORING_AUTHORITY", data["higodot"]["authority"])
        self.assertEqual("3.1.2", data["higodot"]["bundled_version"])
        self.assertEqual("FORMAL_TEST_AUTHORITY", data["gut"]["target_authority"])
        self.assertEqual("9.7.1", data["gut"]["pinned_version"])
        self.assertEqual("VENDORED_NOT_CONSUMED", data["gut"]["current_consumption"])
        self.assertEqual("MIT", data["gut"]["license"])
        self.assertEqual("4.7.x", data["gut"]["godot_compatibility"])
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", data["gut"]["adoption_mode"])
        self.assertEqual("chore/gut-9.7.1-adoption-spec", data["gut"]["adoption_spec_branch"])
        self.assertEqual("OPEN_DRAFT_IN_REVIEW", data["gut"]["adoption_spec_pr_state"])
        self.assertFalse(data["gut"]["formal_installation_authorized"])
        self.assertEqual("BLOCKED_BY_GUT_ADOPTION_SPEC", data["entry_gate"]["status"])
        self.assertEqual("BLOCKED", data["entry_gate"]["implementation"])
        self.assertEqual("PAUSED_AFTER_TASK1_GREEN", data["implementation_pr"]["status"])
        self.assertEqual("APPROVED_DIRECTION_RUNTIME_NOT_RUN", data["image_review"]["status"])
        self.assertFalse(data["claims"]["gut_adoption_spec_merged"])
        self.assertFalse(data["claims"]["gut_formally_adopted"])
        self.assertFalse(data["claims"]["spell_workflow_task2_authorized"])

    def test_active_authority_uses_v4_3_spec_gate(self):
        for path in ACTIVE_FILES:
            text = path.read_text(encoding="utf-8")
            self.assertNotIn("SPELL_WORKFLOW_UI_V2_READY_FOR_TDD", text, str(path))
            self.assertNotIn("BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW", text, str(path))
            self.assertIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))

    def test_legacy_spec_preserves_authority_boundary(self):
        text = LEGACY_SPEC.read_text(encoding="utf-8")
        required = [
            "HIGODOT_SOLE_AUTHORING_AUTHORITY",
            "GUT_FORMAL_TEST_AUTHORITY",
            "GUT_MUST_NOT_MUTATE_PRODUCT_FILES",
            "HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS",
            "SOURCE: https://github.com/bitwes/Gut",
            "PINNED_VERSION: 9.7.1",
            "LICENSE: MIT",
            "GODOT_COMPATIBILITY: 4.7.x",
            "ACTUAL_CONSUMPTION_PATH",
            "CI_GATE",
            "REMOVAL_AND_ROLLBACK",
            "ENTRY_GATE_BLOCKS_WORK",
            "BASE_CURRENT_MAIN_OBSERVED: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc",
            "BASE_RELEASE_PIN_REMAINS: 9.4.3",
            "CLI_ONLY_FORMAL_ADOPTION",
            "EDITOR_PLUGIN_ENABLEMENT: DEFERRED_UNTIL_HIGODOT_RECEIPT",
        ]
        for token in required:
            self.assertIn(token, text)

    def test_v4_3_spec_covers_consumption_ci_mutation_and_rollback(self):
        text = ADOPTION_SPEC.read_text(encoding="utf-8")
        for token in (
            "# GUT 9.7.1 정식 채택 설계 명세",
            "SPEC_ONLY_NO_INSTALLATION",
            ".gutconfig.json",
            "addons/gut/gut_cmdln.gd",
            "-gjunit_xml_file",
            "production_mutation_guard",
            "legacy runner",
            "HIGODOT_AUTHORING_MANIFEST",
            "removal_process",
            "Windows",
            "Android",
        ):
            self.assertIn(token, text)

    def test_bundled_gut_metadata_matches_spec_but_is_not_adoption_evidence(self):
        plugin = (ROOT / "addons/gut/plugin.cfg").read_text(encoding="utf-8")
        versions = json.loads((ROOT / "addons/gut/versions.json").read_text(encoding="utf-8"))
        license_text = (ROOT / "addons/gut/LICENSE.md").read_text(encoding="utf-8")
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        spec = ADOPTION_SPEC.read_text(encoding="utf-8")
        self.assertIn('version="9.7.1"', plugin)
        self.assertEqual("4.7", versions["releases"]["9.7.1"]["godot_min"])
        self.assertEqual("4.7.999", versions["releases"]["9.7.1"]["godot_max"])
        self.assertIn("The MIT License", license_text)
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertNotIn('res://addons/gut/plugin.cfg', project)
        self.assertIn("VENDORED_PREEXISTING", spec)
        self.assertIn("formal_consumption: NONE", spec)

    def test_unresolved_gate_list_contains_v4_3_and_future_installation_blockers(self):
        text = UNRESOLVED.read_text(encoding="utf-8")
        for resolved in (
            "TOOL_AUTHORITY_REVIEW_NOT_APPROVED",
            "SHEET_STATUS_CORRECTION_NOT_FINALIZED",
            "DESIGN_PR_NOT_MERGED_TO_MAIN",
        ):
            self.assertNotIn(resolved, text)
        for token in (
            "GUT_ADOPTION_SPEC_NOT_MERGED",
            "HIGODOT_SOURCE_OR_VERSION_UNVERIFIED",
            "GUT_SOURCE_OR_VERSION_UNVERIFIED",
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "GUT_ACTUAL_CONSUMPTION_NOT_ENABLED",
            "GUT_CI_NOT_ENABLED",
            "HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED",
            "GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED",
            "LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN",
            "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
