from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GUT_FORMAL_ADOPTION_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
POST_MERGE_CANON_SYNC_MAIN = "ce01bb8caa5f1b224279d3fbf418eae29a88af7d"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"
TASK2_MERGED = "TASK2_MERGED_MAIN_VERIFIED"
TASK3_READY = "TASK3_READY_AFTER_POST_MERGE_CANON"
TASK2_RECEIPT_PASS = "TASK2_HIGODOT_RECEIPT_READBACK_PASS"
TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
TASK8_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"
LIVE_READY = "LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"


class V44LiveMainReadbackSemanticsTests(unittest.TestCase):
    def test_current_docs_use_live_github_main_authority_not_a_frozen_current_sha(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK", text, str(path))
            self.assertIn(f"gut_formal_adoption_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertIn(f"post_merge_canon_sync_merge: {POST_MERGE_CANON_SYNC_MAIN}", text, str(path))
            self.assertNotIn(f"current_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertNotIn(f"project_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))

    def test_historical_machine_state_names_historical_merge_shas_by_role(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", canon["project_main_authority"])
        self.assertNotIn("project_main", canon)
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, canon["gut_formal_adoption_main"])
        self.assertEqual(87, canon["post_merge_canon_sync"]["pull_request"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, canon["post_merge_canon_sync"]["merge_commit"])
        work = grill["current_work"]
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", work["project_main_authority"])
        self.assertNotIn("project_main", work)
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, work["gut_formal_adoption_main"])
        self.assertEqual(87, work["post_merge_canon_sync_pr"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, work["post_merge_canon_sync_merge"])

    def test_protected_decisions_and_current_remaining_limits_are_preserved(self) -> None:
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_DOCS)
        for token in (
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01",
            "FIVE_POINT_STAR",
            "GUT_FORMALLY_ADOPTED",
            "higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY",
            "hera_exact_pair: PASS",
            HERA_PASS,
            "spell_workflow_task2_authorized: true",
            TASK2_MERGED,
            TASK3_READY,
            TASK2_RECEIPT_PASS,
            SHARED_CORE_PASS,
            THREE_SCREEN_PENDING,
            LIVE_READY,
            TASK8_STATUS,
            TASK8_GATE,
            "TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING",
            "TASK8_HERA_ACCEPTANCE_PENDING",
            "TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
        ):
            self.assertIn(token, combined)

        self.assertNotIn("LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", combined)
        self.assertNotIn("GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS", combined)
        self.assertNotIn("spell_workflow_task2_authorized: false", combined)
        self.assertNotIn("spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING", combined)
        self.assertNotIn("spell_workflow_task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL", combined)
        self.assertNotIn("spell_workflow_task2_execution_status: AUTHORIZED_HIGODOT_CHANNEL_CONFIRMED", combined)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", combined)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", combined)
        self.assertNotIn("HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", combined)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", combined)


if __name__ == "__main__":
    unittest.main()
