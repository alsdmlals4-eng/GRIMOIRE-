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
HIGODOT_TRACKED_EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json"
HIGODOT_LIVE_V313_EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_3_VENDOR_INTEGRITY.json"
HERA_EVIDENCE = ROOT / "docs/validation/HERA_V1_0_0_EXACT_PAIR.json"
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
HIGODOT_TRACKED_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
HIGODOT_V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
HIGODOT_V313_COMMIT = "22678e5f9b038d7203d6b43b0aae20a5417c500e"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_authority_design_plan_bindings_and_adoption_spec_exist(self):
        for path in (
            LEGACY_SPEC,
            ADOPTION_SPEC,
            BINDING_V43,
            BINDING_V44,
            PLAN,
            STATE,
            UNRESOLVED,
            HIGODOT_TRACKED_EVIDENCE,
            HIGODOT_LIVE_V313_EVIDENCE,
            HERA_EVIDENCE,
        ):
            self.assertTrue(path.is_file(), str(path))

    def test_v4_4_state_records_formal_adoption_and_preserves_boundaries(self):
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", data["contract"]["version"])
        self.assertEqual("ACTIVE_MERGED_MAIN", data["contract"]["status"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", data["contract"]["binding_decision_id"])
        self.assertEqual(MERGED_MAIN, data["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", data["status"])
        self.assertEqual(
            "LIVE_HIGODOT_V3_1_3_TRACKED_V3_1_2_DIVERGENCE_RECORDED",
            data["current_tool_sync_status"],
        )
        self.assertEqual("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", data["review"]["model"])
        self.assertEqual("MERGED_MAIN_READBACK_PASS", data["pr84_merge_gate"]["status"])
        self.assertFalse(data["pr84_merge_gate"]["waives_future_pr_checks"])
        self.assertFalse(data["pr84_merge_gate"]["pr82_task2_authorized"])

        self.assertEqual("SOLE_AUTHORING_AUTHORITY", data["higodot"]["authority"])
        self.assertEqual("v3.1.2", data["higodot"]["release_tag"])
        self.assertEqual("3.1.2", data["higodot"]["bundled_version"])
        self.assertEqual("PASS", data["higodot"]["source_or_version_verification"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["higodot"]["vendor_integrity"])
        self.assertEqual(HIGODOT_TRACKED_TREE, data["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(HIGODOT_TRACKED_TREE, data["higodot"]["project_vendor_tree_sha"])
        self.assertTrue(data["higodot"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["higodot"]["live_editor_plugin_state"])
        self.assertEqual("v3.1.3", data["higodot"]["live_release_tag"])
        self.assertEqual("PASS_V3_1_3", data["higodot"]["live_version_readback"])
        self.assertFalse(data["higodot"]["tracked_version_matches_live"])
        live_v313 = data["higodot"]["live_v3_1_3"]
        self.assertEqual(HIGODOT_V313_COMMIT, live_v313["official_tag_commit"])
        self.assertEqual(HIGODOT_V313_TREE, live_v313["official_plugin_subtree"])
        self.assertEqual(HIGODOT_TRACKED_TREE, live_v313["project_tracked_plugin_subtree"])
        self.assertEqual("LIVE_VERSION_CONFIRMED_TRACKED_VENDOR_DIVERGENCE", live_v313["status"])
        self.assertEqual("IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE", data["higodot"]["authoring_receipt_gate"])

        self.assertEqual("FORMAL_TEST_AUTHORITY", data["gut"]["target_authority"])
        self.assertEqual("9.7.1", data["gut"]["pinned_version"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", data["gut"]["current_consumption"])
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", data["gut"]["vendor_integrity"])
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", data["gut"]["adoption_mode"])
        self.assertEqual("DISABLED", data["gut"]["editor_plugin_enablement"])
        self.assertEqual(
            "FORMALLY_ADOPTED_WITH_USER_CONFIRMED_LIVE_EDITOR_PLUGIN",
            data["gut"]["live_adoption_mode"],
        )
        self.assertEqual(
            "DISABLED_AT_GITHUB_MAIN_READBACK",
            data["gut"]["tracked_editor_plugin_enablement"],
        )
        self.assertEqual(
            "ENABLED_USER_CONFIRMED_TRACKED_CONFIG_NOT_YET_READ_BACK",
            data["gut"]["live_editor_plugin_enablement"],
        )
        self.assertTrue(data["gut"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["gut"]["live_editor_plugin_state"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["gut"]["implementation_branch_status"])
        self.assertEqual("PASS", data["gut"]["junit"])
        self.assertEqual("PASS", data["gut"]["product_mutation_hash_gate"])
        self.assertEqual("PASS", data["gut"]["legacy_coverage_parity"])

        self.assertEqual(HERA_PASS, data["hera"]["status"])
        self.assertTrue(data["hera"]["acceptance_qa_authorized"])
        self.assertFalse(data["hera"]["persistent_source_mutation_authorized"])
        self.assertTrue(data["hera"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["hera"]["live_editor_plugin_state"])
        self.assertEqual(
            "DISABLED_AT_GITHUB_MAIN_READBACK",
            data["hera"]["tracked_editor_plugin_enablement"],
        )
        self.assertEqual(
            "GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK",
            data["tracked_project_godot_editor_plugins"],
        )

        self.assertEqual("PASS", data["sheet_sync"]["higodot_integrity_sync"])
        self.assertEqual("TRACKED_V3_1_2", data["sheet_sync"]["higodot_integrity_sync_scope"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["validation"]["higodot_vendor_integrity"])
        self.assertEqual("TRACKED_V3_1_2", data["validation"]["higodot_vendor_integrity_scope"])
        self.assertEqual(SHARED_CORE_PASS, data["platform_validation"]["status"])
        self.assertEqual("NOT_RUN", data["platform_validation"]["windows_export"])
        self.assertEqual("NOT_RUN", data["platform_validation"]["android_export"])
        self.assertEqual(THREE_SCREEN_PENDING, data["image_review"]["three_screen_runtime"])

        self.assertEqual("TASK2_AUTHORIZED_AWAITING_HIGODOT_CHANNEL_POST_IMPLEMENTATION_ACCEPTANCE_REMAINS", data["entry_gate"]["status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["entry_gate"]["implementation"])
        self.assertEqual("TASK2_AUTHORIZED_AWAITING_HIGODOT_CHANNEL", data["implementation_pr"]["status"])
        self.assertEqual("READY_FOR_HIGODOT_AUTHORING", data["implementation_pr"]["task2_readiness"])
        self.assertTrue(data["implementation_pr"]["task2_authorized"])
        self.assertTrue(data["implementation_pr"]["merge_authorized"])
        self.assertTrue(data["claims"]["gut_formally_adopted"])
        self.assertTrue(data["claims"]["gut_runtime_ci_pass"])
        self.assertTrue(data["claims"]["higodot_vendor_integrity_pass"])
        self.assertTrue(data["claims"]["higodot_tracked_v3_1_2_exact_tree_pass"])
        self.assertTrue(data["claims"]["higodot_live_v3_1_3_version_readback_pass"])
        self.assertFalse(data["claims"]["higodot_tracked_v3_1_3_vendor_sync"])
        self.assertTrue(data["claims"]["hera_live_pair_pass"])
        self.assertTrue(data["claims"]["user_confirmed_live_gut_plugin_enabled"])
        self.assertTrue(data["claims"]["user_confirmed_live_hera_plugin_enabled"])
        self.assertFalse(data["claims"]["tracked_project_godot_live_plugin_state_synced"])
        self.assertTrue(data["claims"]["gut_github_actions_pass"])
        self.assertTrue(data["claims"]["repo_wide_actions_full_sha"])
        self.assertTrue(data["claims"]["windows_android_shared_core_structural_pass"])
        self.assertFalse(data["claims"]["windows_export_pass"])
        self.assertFalse(data["claims"]["android_export_pass"])
        self.assertFalse(data["claims"]["three_screen_runtime_pass"])
        self.assertFalse(data["claims"]["tool_vendor_integrity_pass"])
        self.assertFalse(data["claims"]["visual_audio_complete"])
        self.assertTrue(data["claims"]["spell_workflow_task2_authorized"])

    def test_current_authority_surfaces_are_live_v4_4(self):
        for path in CURRENT_SURFACES:
            text = path.read_text(encoding="utf-8")
            self.assertIn("4.4", text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_SURFACES)
        self.assertIn("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", combined)
        self.assertIn(HERA_PASS, combined)
        self.assertIn(SHARED_CORE_PASS, combined)
        self.assertIn(THREE_SCREEN_PENDING, combined)
        self.assertIn("AUTHORIZED_AWAITING_HIGODOT_CHANNEL", combined)

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

    def test_bundled_plugin_metadata_preserves_tracked_vs_live_state_and_vendor_mismatch(self):
        higodot_plugin = (ROOT / "addons/godot_ai/plugin.cfg").read_text(encoding="utf-8")
        gut_plugin = (ROOT / "addons/gut/plugin.cfg").read_text(encoding="utf-8")
        versions = json.loads((ROOT / "addons/gut/versions.json").read_text(encoding="utf-8"))
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        self.assertIn('version="3.1.2"', higodot_plugin)
        self.assertIn('version="9.7.1"', gut_plugin)
        self.assertEqual("4.7", versions["releases"]["9.7.1"]["godot_min"])
        self.assertEqual("4.7.999", versions["releases"]["9.7.1"]["godot_max"])
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertNotIn('res://addons/gut/plugin.cfg', project)
        self.assertNotIn('res://addons/hera_agent_godot/plugin.cfg', project)
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", state["gut"]["vendor_integrity"])
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", state["gut"]["adoption_mode"])
        self.assertEqual("DISABLED", state["gut"]["editor_plugin_enablement"])
        self.assertTrue(state["gut"]["user_plugin_approval"])
        self.assertFalse(state["higodot"]["tracked_version_matches_live"])
        self.assertEqual(
            "GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK",
            state["tracked_project_godot_editor_plugins"],
        )
        self.assertTrue(state["hera"]["user_plugin_approval"])

    def test_unresolved_preserves_real_blockers_and_post_implementation_acceptance(self):
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "AUDIO_VAULT_PATH_UNVERIFIED", "AUDIO_RIGHTS_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN", "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(blocker, text)
        self.assertIn(SHARED_CORE_PASS, text)
        self.assertIn(THREE_SCREEN_PENDING, text)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", text)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", text)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", text)
        self.assertIn(HERA_PASS, text)
        self.assertIn("HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY", text)
        self.assertIn("REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS", text)


if __name__ == "__main__":
    unittest.main()
