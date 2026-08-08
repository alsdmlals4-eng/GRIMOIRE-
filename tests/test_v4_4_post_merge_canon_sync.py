from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
GUT_FORMAL_ADOPTION_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
POST_MERGE_CANON_SYNC_MAIN = "ce01bb8caa5f1b224279d3fbf418eae29a88af7d"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CURRENT_DOCS = [ROOT / "START_HERE.md", ROOT / "docs/ACTIVE_CONTEXT.md", ROOT / "docs/DEVELOPMENT_GATES.md", ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md", ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"


class V44PostMergeCanonSyncTests(unittest.TestCase):
    def test_authority_state_records_pr85_merged_main_formal_adoption(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", data["contract"]["version"])
        self.assertEqual("ACTIVE_MERGED_MAIN", data["contract"]["status"])
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, data["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", data["status"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", data["gut"]["current_consumption"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["gut"]["implementation_branch_status"])
        self.assertEqual("PASS", data["gut"]["legacy_coverage_parity"])
        self.assertEqual("PASS", data["gut"]["product_mutation_hash_gate"])
        self.assertEqual("PASS", data["gut"]["junit"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["higodot"]["vendor_integrity"])
        self.assertEqual("IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE", data["higodot"]["authoring_receipt_gate"])
        self.assertEqual(HERA_PASS, data["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, data["platform_validation"]["status"])
        self.assertTrue(data["claims"]["gut_formally_adopted"])
        self.assertTrue(data["claims"]["gut_runtime_ci_pass"])
        self.assertTrue(data["claims"]["higodot_vendor_integrity_pass"])
        self.assertTrue(data["claims"]["hera_live_pair_pass"])
        self.assertTrue(data["claims"]["higodot_receipt_gate_implemented"])
        self.assertTrue(data["claims"]["gut_github_actions_pass"])
        self.assertTrue(data["claims"]["spell_workflow_task2_authorized"])

    def test_current_cold_start_docs_keep_historical_merge_roles_and_live_main_authority(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("v4.4", text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn("project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK", text, str(path))
            self.assertIn(f"gut_formal_adoption_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertIn(f"post_merge_canon_sync_merge: {POST_MERGE_CANON_SYNC_MAIN}", text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertIn("higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY", text, str(path))
            self.assertIn("hera_exact_pair: PASS", text, str(path))
            self.assertIn(HERA_PASS, text, str(path))
            self.assertIn("spell_workflow_task2_authorized: true", text, str(path))
            self.assertNotIn("spell_workflow_task2_authorized: false", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))

    def test_machine_current_state_surfaces_use_live_main_authority(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        self.assertEqual("4.4", canon["active_contract"]["version"])
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", canon["project_main_authority"])
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, canon["gut_formal_adoption_main"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, canon["post_merge_canon_sync"]["merge_commit"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", canon["tool_authority"]["status"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", canon["tool_authority"]["higodot"]["vendor_integrity"])
        self.assertEqual(HERA_PASS, canon["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, canon["platform_validation"]["status"])
        self.assertTrue(canon["spell_workflow_main"]["spell_workflow_task2_authorized"])
        self.assertEqual("READY_FOR_HIGODOT_AUTHORING", canon["spell_workflow_main"]["task2_readiness"])
        self.assertEqual("AUTHORIZED_AWAITING_HIGODOT_CHANNEL", canon["spell_workflow_main"]["task2_execution_status"])
        self.assertEqual("4.4", grill["active_contract"]["version"])
        self.assertEqual(0, grill["current_count"])
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", grill["current_work"]["project_main_authority"])
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, grill["current_work"]["gut_formal_adoption_main"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, grill["current_work"]["post_merge_canon_sync_merge"])
        self.assertEqual("GUT_FORMALLY_ADOPTED", grill["current_work"]["gut_formal_adoption"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", grill["current_work"]["higodot_vendor_integrity"])
        self.assertEqual(HERA_PASS, grill["current_work"]["hera_status"])
        self.assertEqual(SHARED_CORE_PASS, grill["current_work"]["windows_android_shared_core"])
        self.assertTrue(grill["current_work"]["spell_workflow_task2_authorized"])

    def test_remaining_broader_blockers_and_acceptance_are_preserved(self) -> None:
        text = (ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md").read_text(encoding="utf-8")
        for blocker in ("AUDIO_VAULT_PATH_UNVERIFIED", "VISUAL_AUDIO_COMPLETE_NOT_PROVEN", "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS"):
            self.assertIn(blocker, text)
        self.assertIn(SHARED_CORE_PASS, text)
        self.assertIn("THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9", text)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", text)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", text)
        self.assertNotIn("HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", text)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", text)
        self.assertIn("HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY", text)
        self.assertIn(HERA_PASS, text)
        self.assertIn("REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS", text)


if __name__ == "__main__":
    unittest.main()
