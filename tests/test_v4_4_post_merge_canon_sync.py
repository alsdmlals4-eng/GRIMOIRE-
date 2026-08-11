from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
GUT_FORMAL_ADOPTION_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
POST_MERGE_CANON_SYNC_MAIN = "ce01bb8caa5f1b224279d3fbf418eae29a88af7d"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
TASK2_MERGED = "TASK2_MERGED_MAIN_VERIFIED"
TASK3_READY = "TASK3_READY_AFTER_POST_MERGE_CANON"
TASK2_MAIN = "975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0"
TASK2_RECEIPT_PASS = "TASK2_HIGODOT_RECEIPT_READBACK_PASS"
TASK7_MERGED = "TASK7_MERGED_MAIN_VERIFIED"
HISTORICAL_TASK8_PRODUCT = "TASK8_SPELL_USE_SCREEN"
CURRENT_TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
CURRENT_TASK8_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"
CURRENT_SYNC = "GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT"
LIVE_READY = "LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
CURRENT_CANON = ROOT / "docs/planning/CANON_SYNC_STATE_SYNC20.json"
CURRENT_AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE_SYNC20.json"


class V44PostMergeCanonSyncTests(unittest.TestCase):
    def test_authority_state_preserves_pr85_merged_main_formal_adoption_under_v45(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.5", data["contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-5-BINDING-01", data["contract"]["binding_decision_id"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", data["contract"]["historical_binding_decision_id"])
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
        self.assertTrue(data["claims"]["spell_workflow_task2_merged_main_verified"])

    def test_current_cold_start_docs_use_v45_keep_history_and_show_task8_merge_subgate(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("GM-CONTRACT-V4-5-BINDING-01", text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn("project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK", text, str(path))
            self.assertIn(f"gut_formal_adoption_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertIn(f"post_merge_canon_sync_merge: {POST_MERGE_CANON_SYNC_MAIN}", text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertIn("higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY", text, str(path))
            self.assertIn("hera_exact_pair: PASS", text, str(path))
            self.assertIn(HERA_PASS, text, str(path))
            self.assertIn("spell_workflow_task2_authorized: true", text, str(path))
            self.assertIn(TASK2_MERGED, text, str(path))
            self.assertIn(TASK7_MERGED, text, str(path))
            self.assertIn(CURRENT_TASK8_STATUS, text, str(path))
            self.assertIn(CURRENT_TASK8_GATE, text, str(path))
            self.assertNotIn("spell_workflow_task2_authorized: false", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))

    def test_historical_machine_snapshots_preserve_task8_product_checkpoint(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        self.assertEqual("4.5", canon["active_contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-5-BINDING-01", canon["active_contract"]["binding_decision_id"])
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", canon["project_main_authority"])
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, canon["gut_formal_adoption_main"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, canon["post_merge_canon_sync"]["merge_commit"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", canon["tool_authority"]["status"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", canon["tool_authority"]["higodot"]["vendor_integrity"])
        self.assertEqual(HERA_PASS, canon["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, canon["platform_validation"]["status"])

        workflow = canon["spell_workflow_main"]
        self.assertTrue(workflow["spell_workflow_task2_authorized"])
        self.assertEqual(TASK7_MERGED, workflow["status"])
        self.assertEqual(HISTORICAL_TASK8_PRODUCT, workflow["next_task"])
        self.assertEqual(TASK3_READY, workflow["task2_readiness"])
        self.assertEqual("MERGED_MAIN_VERIFIED", workflow["task2_execution_status"])
        self.assertEqual(TASK2_MAIN, workflow["main_merge_commit"])
        self.assertEqual(TASK2_RECEIPT_PASS, workflow["authoring_receipt_status"])

        self.assertEqual("4.5", grill["active_contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-5-BINDING-01", grill["active_contract"]["binding_decision_id"])
        self.assertEqual(0, grill["current_count"])
        self.assertEqual(TASK7_MERGED, grill["current_work"]["status"])
        self.assertEqual(HISTORICAL_TASK8_PRODUCT, grill["current_work"]["spell_workflow_next_task"])

    def test_sync20_machine_overlays_hold_current_task8_and_live_tool_state(self) -> None:
        current_canon = json.loads(CURRENT_CANON.read_text(encoding="utf-8"))
        current_authority = json.loads(CURRENT_AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(CURRENT_SYNC, current_canon["sync_id"])
        self.assertEqual(CURRENT_SYNC, current_authority["sync_id"])
        self.assertEqual(CURRENT_TASK8_STATUS, current_canon["spell_workflow"]["status"])
        self.assertEqual(CURRENT_TASK8_GATE, current_canon["spell_workflow"]["next_gate"])
        self.assertEqual(LIVE_READY, current_authority["higodot"]["live_status"])
        self.assertEqual("LIVE_QA_AND_OBSERVABILITY_ONLY", current_authority["hera"]["authority"])
        self.assertEqual("NONE", current_authority["hera"]["required_source_delta"])

    def test_remaining_blockers_reflect_local_access_and_task8_merge_gates(self) -> None:
        text = (ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md").read_text(encoding="utf-8")
        for blocker in (
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING",
            "TASK8_HERA_ACCEPTANCE_PENDING",
            "TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING",
        ):
            self.assertIn(blocker, text)
        self.assertIn(SHARED_CORE_PASS, text)
        self.assertIn("THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9", text)
        self.assertIn(TASK2_MERGED, text)
        self.assertIn(TASK7_MERGED, text)
        self.assertIn(CURRENT_TASK8_STATUS, text)
        self.assertIn(CURRENT_TASK8_GATE, text)
        self.assertIn(LIVE_READY, text)
        self.assertNotIn("LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", text)
        self.assertNotIn("GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS", text)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", text)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", text)
        self.assertNotIn("HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", text)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", text)
        self.assertIn("HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY", text)
        self.assertIn(HERA_PASS, text)
        self.assertIn("REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS", text)


if __name__ == "__main__":
    unittest.main()
