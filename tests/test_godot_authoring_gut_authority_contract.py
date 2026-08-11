import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
LEGACY_SPEC = ROOT / "docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md"
ADOPTION_SPEC = ROOT / "docs/testing/GUT_9_7_1_ADOPTION_SPEC.md"
BINDING_V43 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md"
BINDING_V44 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
BINDING_V45 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
HIGODOT_V312_EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json"
HIGODOT_V313_EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_3_VENDOR_INTEGRITY.json"
HIGODOT_V314_EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_4_VENDOR_INTEGRITY.json"
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
GUT_MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
CURRENT_CONTRACT = "GM-CONTRACT-V4-5-BINDING-01"
HISTORICAL_V44_CONTRACT = "GM-CONTRACT-V4-4-BINDING-01"
CURRENT_BASE_MAIN = "7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f"
HIGODOT_V312_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
HIGODOT_V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
HIGODOT_V313_COMMIT = "22678e5f9b038d7203d6b43b0aae20a5417c500e"
HIGODOT_V314_TREE = "69010571e11123dfc4e09483f80cb9e6ca93511a"
HIGODOT_V314_COMMIT = "96cc8b8c3d25ce487e24801d01d5214fea150349"
HIGODOT_V314_SYNC = "GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION"
LIVE_V314_PENDING = "LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"
RECEIPT_LIMIT = "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT"
TASK2_MERGED = "TASK2_MERGED_MAIN_VERIFIED"
TASK3_READY = "TASK3_READY_AFTER_POST_MERGE_CANON"
TASK2_RECEIPT_PASS = "TASK2_HIGODOT_RECEIPT_READBACK_PASS"
TASK7_MERGED = "TASK7_MERGED_MAIN_VERIFIED"
TASK8_NEXT = "TASK8_SPELL_USE_SCREEN"


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_authority_design_plan_bindings_and_adoption_spec_exist(self):
        for path in (
            LEGACY_SPEC, ADOPTION_SPEC, BINDING_V43, BINDING_V44, BINDING_V45, PLAN, STATE,
            UNRESOLVED, HIGODOT_V312_EVIDENCE, HIGODOT_V313_EVIDENCE, HIGODOT_V314_EVIDENCE,
            HERA_EVIDENCE,
        ):
            self.assertTrue(path.is_file(), str(path))

    def test_v4_5_state_records_current_tools_and_preserves_v4_4_boundaries(self):
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.5", data["contract"]["version"])
        self.assertEqual("ACTIVE_USER_APPROVED_BINDING", data["contract"]["status"])
        self.assertEqual(CURRENT_CONTRACT, data["contract"]["binding_decision_id"])
        self.assertEqual(HISTORICAL_V44_CONTRACT, data["contract"]["historical_binding_decision_id"])
        self.assertEqual(CURRENT_BASE_MAIN, data["base_policy_observation"]["current_main"])
        self.assertEqual(CURRENT_BASE_MAIN, data["base_policy_observation"]["latest_main_observed"])
        self.assertEqual("7ce3fb64fa6303c5da6c7fc27c979f7233b761ac", data["base_policy_observation"]["source_snapshot_v4_5_r2"])
        self.assertEqual("HISTORICAL_OBSERVATION_ONLY", data["base_policy_observation"]["source_snapshot_role"])
        self.assertEqual(GUT_MERGED_MAIN, data["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", data["status"])
        self.assertEqual(
            "TRACKED_HIGODOT_V3_1_4_EXACT_TREE_RECONCILED_LIVE_HANDSHAKE_PENDING",
            data["current_tool_sync_status"],
        )
        self.assertEqual("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", data["review"]["model"])

        higodot = data["higodot"]
        self.assertEqual("SOLE_AUTHORING_AUTHORITY", higodot["authority"])
        self.assertEqual("v3.1.4", higodot["release_tag"])
        self.assertEqual("3.1.4", higodot["bundled_version"])
        self.assertEqual(HIGODOT_V314_COMMIT, higodot["pinned_source_commit"])
        self.assertEqual(HIGODOT_V314_TREE, higodot["official_plugin_subtree_sha"])
        self.assertEqual(HIGODOT_V314_TREE, higodot["project_vendor_tree_sha"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", higodot["vendor_integrity"])
        self.assertFalse(higodot["tracked_version_matches_live"])
        self.assertEqual(LIVE_V314_PENDING, higodot["live_version_readback"])
        self.assertEqual(RECEIPT_LIMIT, higodot["direct_local_upgrade_receipt_status"])
        self.assertEqual(HIGODOT_V312_TREE, higodot["historical_v3_1_2"]["project_vendor_tree_sha"])
        historical_v313 = higodot["historical_v3_1_3"]
        self.assertEqual("v3.1.3", historical_v313["release_tag"])
        self.assertEqual(HIGODOT_V313_COMMIT, historical_v313["pinned_source_commit"])
        self.assertEqual(HIGODOT_V313_TREE, historical_v313["project_vendor_tree_sha"])
        self.assertEqual("IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE", higodot["authoring_receipt_gate"])

        gut = data["gut"]
        self.assertEqual("FORMAL_TEST_AUTHORITY", gut["target_authority"])
        self.assertEqual("9.7.1", gut["pinned_version"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", gut["current_consumption"])
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", gut["vendor_integrity"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", gut["tracked_editor_plugin_enablement"])
        self.assertTrue(gut["project_plugin_enabled"])
        self.assertTrue(gut["must_not_mutate_product_files"])

        hera = data["hera"]
        self.assertEqual(HERA_PASS, hera["status"])
        self.assertTrue(hera["acceptance_qa_authorized"])
        self.assertFalse(hera["persistent_source_mutation_authorized"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", hera["tracked_editor_plugin_enablement"])
        self.assertEqual("HeraGameInspector", hera["autoload"])
        self.assertEqual("GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK", data["tracked_project_godot_editor_plugins"])

        self.assertEqual(HIGODOT_V314_SYNC, data["sheet_sync"]["current_tool_sync_id"])
        self.assertEqual("TRACKED_V3_1_4", data["sheet_sync"]["higodot_integrity_sync_scope"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["validation"]["higodot_vendor_integrity"])
        self.assertEqual("TRACKED_V3_1_4", data["validation"]["higodot_vendor_integrity_scope"])
        self.assertEqual(LIVE_V314_PENDING, data["validation"]["higodot_live_v3_1_4"])
        self.assertEqual(SHARED_CORE_PASS, data["platform_validation"]["status"])
        self.assertEqual(THREE_SCREEN_PENDING, data["image_review"]["three_screen_runtime"])

        implementation = data["implementation_pr"]
        self.assertEqual(TASK2_MERGED, implementation["status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", implementation["task2"])
        self.assertEqual(TASK3_READY, implementation["task2_readiness"])
        self.assertEqual(TASK2_RECEIPT_PASS, implementation["task2_authoring_receipt_status"])
        self.assertTrue(implementation["task2_authorized"])
        self.assertFalse(implementation["merge_authorized"])

        self.assertEqual(TASK7_MERGED, data["entry_gate"]["status"].split("_TASK8_NEXT")[0])
        self.assertTrue(data["claims"]["higodot_tracked_v3_1_4_vendor_sync"])
        self.assertTrue(data["claims"]["higodot_tracked_v3_1_3_vendor_sync"])
        self.assertTrue(data["claims"]["higodot_tracked_v3_1_3_vendor_sync_is_historical"])
        self.assertFalse(data["claims"]["higodot_live_v3_1_4_handshake_verified"])
        self.assertFalse(data["claims"]["higodot_tracked_v3_1_4_matches_live_verified"])
        self.assertFalse(data["claims"]["tracked_project_godot_live_plugin_state_synced"])
        self.assertTrue(data["claims"]["spell_workflow_task2_merged_main_verified"])
        self.assertTrue(data["claims"]["task2_higodot_receipt_readback_pass"])
        self.assertFalse(data["claims"]["higodot_direct_local_upgrade_receipt_verified"])
        self.assertFalse(data["claims"]["windows_export_pass"])
        self.assertFalse(data["claims"]["android_export_pass"])
        self.assertFalse(data["claims"]["three_screen_runtime_pass"])
        self.assertFalse(data["claims"]["visual_audio_complete"])

    def test_current_authority_surfaces_are_live_v4_5_with_v4_4_history(self):
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_SURFACES)
        for path in CURRENT_SURFACES:
            text = path.read_text(encoding="utf-8")
            self.assertIn(CURRENT_CONTRACT, text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))
        self.assertIn(HISTORICAL_V44_CONTRACT, combined)
        self.assertIn("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", combined)
        self.assertIn(HERA_PASS, combined)
        self.assertIn(SHARED_CORE_PASS, combined)
        self.assertIn(THREE_SCREEN_PENDING, combined)
        self.assertIn("spell_workflow_task2_authorized", combined)
        self.assertIn(TASK2_MERGED, combined)
        self.assertIn(TASK7_MERGED, combined)
        self.assertIn(TASK8_NEXT, combined)

    def test_legacy_spec_preserves_authority_boundary(self):
        text = LEGACY_SPEC.read_text(encoding="utf-8")
        for token in (
            "HIGODOT_SOLE_AUTHORING_AUTHORITY", "GUT_FORMAL_TEST_AUTHORITY",
            "GUT_MUST_NOT_MUTATE_PRODUCT_FILES", "HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS",
            "SOURCE: https://github.com/bitwes/Gut", "PINNED_VERSION: 9.7.1",
            "LICENSE: MIT", "GODOT_COMPATIBILITY: 4.7.x", "ACTUAL_CONSUMPTION_PATH",
            "CI_GATE", "REMOVAL_AND_ROLLBACK", "ENTRY_GATE_BLOCKS_WORK",
            "BASE_RELEASE_PIN_REMAINS: 9.4.3",
        ):
            self.assertIn(token, text)

    def test_v4_3_spec_remains_historical_design_evidence(self):
        text = ADOPTION_SPEC.read_text(encoding="utf-8")
        for token in (
            "# GUT 9.7.1 정식 채택 설계 명세", "SPEC_ONLY_NO_INSTALLATION",
            "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605", "5d6893836af4917ee62b1a395125a7530b1f239d",
            "09d040309bbed0e07420ad72c4aa69cbd0e58190", "MISMATCH_OFFICIAL_V9_7_1",
            ".gutconfig.json", "addons/gut/gut_cmdln.gd", "-gjunit_xml_file",
            "production_mutation_guard", "HIGODOT_AUTHORING_MANIFEST", "removal_process",
        ):
            self.assertIn(token, text)

    def test_bundled_plugin_metadata_matches_current_tracked_state(self):
        higodot_plugin = (ROOT / "addons/godot_ai/plugin.cfg").read_text(encoding="utf-8")
        gut_plugin = (ROOT / "addons/gut/plugin.cfg").read_text(encoding="utf-8")
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        self.assertIn('version="3.1.4"', higodot_plugin)
        self.assertIn('version="9.7.1"', gut_plugin)
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertIn('res://addons/gut/plugin.cfg', project)
        self.assertIn('res://addons/hera_agent_godot/plugin.cfg', project)
        self.assertIn('HeraGameInspector=', project)

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
        self.assertIn(TASK2_MERGED, text)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", text)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", text)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", text)
        self.assertIn(HERA_PASS, text)


if __name__ == "__main__":
    unittest.main()
