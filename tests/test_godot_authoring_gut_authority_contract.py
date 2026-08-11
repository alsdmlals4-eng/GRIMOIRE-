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
SYNC19_STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CURRENT_STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE_SYNC20.json"
CURRENT_CANON = ROOT / "docs/planning/CANON_SYNC_STATE_SYNC20.json"
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
    CURRENT_STATE,
    CURRENT_CANON,
]

CURRENT_CONTRACT = "GM-CONTRACT-V4-5-BINDING-01"
HISTORICAL_V44_CONTRACT = "GM-CONTRACT-V4-4-BINDING-01"
SYNC20_SOURCE_BASE = "6d2feba2bc49fda2d8d273248b55087853615d5d"
LATEST_BASE_OBSERVED = "1d6cc79ad9dfa694558524ccc5ebf11ec7df7d8c"
CURRENT_SYNC = "GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT"
HIGODOT_V314_TREE = "69010571e11123dfc4e09483f80cb9e6ca93511a"
HIGODOT_LIVE = "LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED"
EXPECTED_FIELD_LIMIT = "NOT_SURFACED_DO_NOT_CLAIM"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"
RECEIPT_LIMIT = "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT"
TASK2_MERGED = "TASK2_MERGED_MAIN_VERIFIED"
TASK7_MERGED = "TASK7_MERGED_MAIN_VERIFIED"
TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
TASK8_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_authority_design_plan_bindings_and_evidence_exist(self):
        for path in (
            LEGACY_SPEC,
            ADOPTION_SPEC,
            BINDING_V43,
            BINDING_V44,
            BINDING_V45,
            PLAN,
            SYNC19_STATE,
            CURRENT_STATE,
            CURRENT_CANON,
            UNRESOLVED,
            HIGODOT_V312_EVIDENCE,
            HIGODOT_V313_EVIDENCE,
            HIGODOT_V314_EVIDENCE,
            HERA_EVIDENCE,
        ):
            self.assertTrue(path.is_file(), str(path))

    def test_sync20_machine_state_records_current_tool_authority(self):
        state = json.loads(CURRENT_STATE.read_text(encoding="utf-8"))
        self.assertEqual(CURRENT_SYNC, state["sync_id"])
        self.assertEqual("GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01", state["decision_id"])
        self.assertEqual(SYNC20_SOURCE_BASE, state["base"]["sync20_source_main"])
        self.assertEqual(LATEST_BASE_OBSERVED, state["base"]["latest_main_observed_post_merge"])
        self.assertEqual("NO_MATERIAL_FOLLOWUP_UNRELATED_TO_DEDICATED_LOCAL_EXECUTION", state["base"]["latest_change_disposition"])
        self.assertEqual("9.4.3", state["base"]["project_pin"])
        self.assertEqual("PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST", state["local_execution"]["policy"])
        self.assertEqual("ASSUME_PREVIOUS_POWERSHELL_CLOSED", state["local_execution"]["fresh_shell"])
        self.assertEqual("CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST", state["local_execution"]["missing_environment"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", state["local_execution"]["sheet_status"])
        self.assertEqual("PASS", state["project_sync"]["sheet_write_readback"])

        higodot = state["higodot"]
        self.assertEqual("v3.1.4", higodot["release"])
        self.assertEqual("SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY", higodot["authority"])
        self.assertEqual(HIGODOT_V314_TREE, higodot["tracked_plugin_subtree"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", higodot["tracked_vendor_integrity"])
        self.assertEqual(HIGODOT_LIVE, higodot["live_status"])
        self.assertEqual("3.1.4", higodot["server_version"])
        self.assertEqual("3.1.4", higodot["plugin_version"])
        self.assertEqual("READY", higodot["readiness"])
        self.assertEqual(EXPECTED_FIELD_LIMIT, higodot["expected_version_field"])
        self.assertEqual(RECEIPT_LIMIT, higodot["direct_local_upgrade_receipt"])

        self.assertEqual("v9.7.1", state["gut"]["release"])
        self.assertEqual("DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY", state["gut"]["authority"])
        self.assertEqual("v1.0.0", state["hera"]["release"])
        self.assertEqual("LIVE_QA_AND_OBSERVABILITY_ONLY", state["hera"]["authority"])
        self.assertEqual("FORBIDDEN", state["hera"]["persistent_source_mutation"])
        self.assertEqual("NONE", state["hera"]["required_source_delta"])
        self.assertEqual(TASK8_STATUS, state["task8"]["status"])
        self.assertEqual(TASK8_GATE, state["task8"]["next_gate"])
        self.assertFalse(state["claims"]["expected_version_field_verified"])
        self.assertFalse(state["claims"]["direct_local_upgrade_receipt_verified"])
        self.assertFalse(state["claims"]["task8_merged_main_verified"])
        self.assertFalse(state["claims"]["task8_hera_acceptance_pass"])

    def test_sync20_canon_records_sheet_readback(self):
        canon = json.loads(CURRENT_CANON.read_text(encoding="utf-8"))
        self.assertEqual(CURRENT_SYNC, canon["sync_id"])
        self.assertEqual(SYNC20_SOURCE_BASE, canon["base"]["sync20_source_main"])
        self.assertEqual(LATEST_BASE_OBSERVED, canon["base"]["latest_main_observed_post_merge"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", canon["sheet_sync"]["sync20_status"])
        self.assertEqual("PASS", canon["project_sync"]["sheet_write_readback"])

    def test_sync19_machine_snapshot_and_vendor_evidence_remain_historical(self):
        old = json.loads(SYNC19_STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.5", old["contract"]["version"])
        self.assertEqual(CURRENT_CONTRACT, old["contract"]["binding_decision_id"])
        self.assertEqual(HISTORICAL_V44_CONTRACT, old["contract"]["historical_binding_decision_id"])
        self.assertIn("LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED", json.dumps(old))
        evidence = json.loads(HIGODOT_V314_EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", evidence["tracked_tree_identity"])
        self.assertEqual(HIGODOT_V314_TREE, evidence["project_tracked_plugin_subtree"])

    def test_current_authority_surfaces_are_v4_5_and_sync20(self):
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_SURFACES)
        for path in CURRENT_SURFACES[:-2]:
            text = path.read_text(encoding="utf-8")
            self.assertIn(CURRENT_CONTRACT, text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))
        for token in (
            HISTORICAL_V44_CONTRACT,
            CURRENT_SYNC,
            HIGODOT_LIVE,
            EXPECTED_FIELD_LIMIT,
            HERA_PASS,
            SHARED_CORE_PASS,
            THREE_SCREEN_PENDING,
            TASK2_MERGED,
            TASK7_MERGED,
            TASK8_STATUS,
            TASK8_GATE,
        ):
            self.assertIn(token, combined)

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

    def test_unresolved_lists_real_task8_merge_gates_and_preserves_delivery_limits(self):
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "AUDIO_RIGHTS_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING",
            "TASK8_HERA_ACCEPTANCE_PENDING",
            "TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING",
        ):
            self.assertIn(blocker, text)
        self.assertIn(SHARED_CORE_PASS, text)
        self.assertIn(THREE_SCREEN_PENDING, text)
        self.assertIn(TASK2_MERGED, text)
        self.assertIn(HERA_PASS, text)
        self.assertNotIn("LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED\n", text)


if __name__ == "__main__":
    unittest.main()
