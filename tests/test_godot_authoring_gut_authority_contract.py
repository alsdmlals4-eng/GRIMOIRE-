import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
LEGACY_SPEC = ROOT / "docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md"
ADOPTION_SPEC = ROOT / "docs/testing/GUT_9_7_1_ADOPTION_SPEC.md"
BINDING_V43 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md"
BINDING_V44 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
CURRENT_SURFACES = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
    ROOT / "docs/planning/CANON_SYNC_STATE.json",
    ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json",
]
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_authority_design_plan_bindings_and_adoption_spec_exist(self):
        for path in (LEGACY_SPEC, ADOPTION_SPEC, BINDING_V43, BINDING_V44, PLAN, STATE, UNRESOLVED):
            self.assertTrue(path.is_file(), str(path))

    def test_v4_4_state_records_formal_adoption_and_preserves_boundaries(self):
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", data["contract"]["version"])
        self.assertEqual("ACTIVE_MERGED_MAIN", data["contract"]["status"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", data["contract"]["binding_decision_id"])
        self.assertEqual(MERGED_MAIN, data["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", data["status"])
        self.assertEqual("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", data["review"]["model"])
        self.assertEqual("MERGED_MAIN_READBACK_PASS", data["pr84_merge_gate"]["status"])
        self.assertFalse(data["pr84_merge_gate"]["waives_future_pr_checks"])

        self.assertEqual("SOLE_AUTHORING_AUTHORITY", data["higodot"]["authority"])
        self.assertEqual("3.1.2", data["higodot"]["bundled_version"])
        self.assertEqual("PASS", data["higodot"]["source_or_version_verification"])
        self.assertEqual("MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT", data["higodot"]["vendor_integrity"])
        self.assertEqual("IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE", data["higodot"]["authoring_receipt_gate"])

        self.assertEqual("FORMAL_TEST_AUTHORITY", data["gut"]["target_authority"])
        self.assertEqual("9.7.1", data["gut"]["pinned_version"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", data["gut"]["current_consumption"])
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", data["gut"]["vendor_integrity"])
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", data["gut"]["adoption_mode"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["gut"]["implementation_branch_status"])
        self.assertEqual("PASS", data["gut"]["junit"])
        self.assertEqual("PASS", data["gut"]["product_mutation_hash_gate"])
        self.assertEqual("PASS", data["gut"]["legacy_coverage_parity"])

        self.assertEqual("GUT_FORMAL_ADOPTION_COMPLETE_BROADER_PROJECT_BLOCKERS_REMAIN", data["entry_gate"]["status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["entry_gate"]["implementation"])
        self.assertEqual("PAUSED_AFTER_TASK1_GREEN", data["implementation_pr"]["status"])
        self.assertTrue(data["claims"]["gut_formally_adopted"])
        self.assertTrue(data["claims"]["gut_runtime_ci_pass"])
        self.assertTrue(data["claims"]["gut_github_actions_pass"])
        self.assertFalse(data["claims"]["tool_vendor_integrity_pass"])
        self.assertFalse(data["claims"]["visual_audio_complete"])
        self.assertFalse(data["claims"]["spell_workflow_task2_authorized"])

    def test_current_authority_surfaces_are_post_merge_v4_4(self):
        for path in CURRENT_SURFACES:
            text = path.read_text(encoding="utf-8")
            self.assertIn("4.4", text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn(MERGED_MAIN, text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))

    def test_legacy_spec_preserves_authority_boundary(self):
        text = LEGACY_SPEC.read_text(encoding="utf-8")
        for token in (
            "HIGODOT_SOLE_AUTHORING_AUTHORITY", "GUT_FORMAL_TEST_AUTHORITY",
            "GUT_MUST_NOT_MUTATE_PRODUCT_FILES", "HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS",
            "SOURCE: https://github.com/bitwes/Gut", "PINNED_VERSION: 9.7.1",
            "LICENSE: MIT", "GODOT_COMPATIBILITY: 4.7.x", "ACTUAL_CONSUMPTION_PATH",
            "CI_GATE", "REMOVAL_AND_ROLLBACK", "ENTRY_GATE_BLOCKS_WORK",
            "BASE_CURRENT_MAIN_OBSERVED: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc",
            "BASE_RELEASE_PIN_REMAINS: 9.4.3", "CLI_ONLY_FORMAL_ADOPTION",
            "EDITOR_PLUGIN_ENABLEMENT: DEFERRED_UNTIL_HIGODOT_RECEIPT",
        ):
            self.assertIn(token, text)

    def test_v4_3_spec_remains_historical_design_evidence(self):
        text = ADOPTION_SPEC.read_text(encoding="utf-8")
        for token in (
            "# GUT 9.7.1 정식 채택 설계 명세", "SPEC_ONLY_NO_INSTALLATION",
            "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605", "5d6893836af4917ee62b1a395125a7530b1f239d",
            "09d040309bbed0e07420ad72c4aa69cbd0e58190", "MISMATCH_OFFICIAL_V9_7_1",
            ".gutconfig.json", "addons/gut/gut_cmdln.gd", "-gjunit_xml_file",
            "production_mutation_guard", "legacy runner", "HIGODOT_AUTHORING_MANIFEST",
            "removal_process", "Windows", "Android",
        ):
            self.assertIn(token, text)

    def test_bundled_gut_metadata_stays_cli_only_and_full_tree_mismatch_is_not_hidden(self):
        plugin = (ROOT / "addons/gut/plugin.cfg").read_text(encoding="utf-8")
        versions = json.loads((ROOT / "addons/gut/versions.json").read_text(encoding="utf-8"))
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        self.assertIn('version="9.7.1"', plugin)
        self.assertEqual("4.7", versions["releases"]["9.7.1"]["godot_min"])
        self.assertEqual("4.7.999", versions["releases"]["9.7.1"]["godot_max"])
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertNotIn('res://addons/gut/plugin.cfg', project)
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", state["gut"]["vendor_integrity"])

    def test_unresolved_preserves_broader_project_blockers(self):
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", "HERA_CLI_ADDON_PAIR_UNVERIFIED",
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", "AUDIO_VAULT_PATH_UNVERIFIED",
            "AUDIO_RIGHTS_UNVERIFIED", "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", "CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(blocker, text)


if __name__ == "__main__":
    unittest.main()
