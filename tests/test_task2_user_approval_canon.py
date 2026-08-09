from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DECISION_ID = "GM-SPELL-WORKFLOW-UI-V2-01"
APPROVAL_SYNC_ID = "GR-SYNC-20260809-01-TASK2-USER-APPROVAL"
TASK2_MAIN_SYNC_ID = "GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN"
POST_MERGE_SYNC_ID = "GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON"
TASK2_MERGED_MAIN = "975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0"
TASK2_EXACT_HEAD = "71f0cfb86217953be004e2a5d6a3480b9d909267"
APPROVAL_RECEIPT = ROOT / "docs/planning/sync/GR-SYNC-20260809-01-TASK2-USER-APPROVAL.md"
TASK2_AUTHORING_RECEIPT = ROOT / "artifacts/higodot/HIGODOT_AUTHORING_RECEIPT_TASK2_2026-08-09.json"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]


class Task2UserApprovalCanonTests(unittest.TestCase):
    def test_historical_user_approval_receipt_is_preserved(self) -> None:
        self.assertTrue(APPROVAL_RECEIPT.exists())
        receipt = APPROVAL_RECEIPT.read_text(encoding="utf-8")
        self.assertIn(DECISION_ID, receipt)
        self.assertIn(APPROVAL_SYNC_ID, receipt)
        self.assertIn("USER_APPROVED_2026-08-09T06:19+09:00", receipt)
        self.assertIn("HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE", receipt)
        self.assertIn("AUTHORIZED_AWAITING_HIGODOT_CHANNEL", receipt)

    def test_task2_authoring_receipt_is_tracked_and_complete(self) -> None:
        self.assertTrue(TASK2_AUTHORING_RECEIPT.exists())
        receipt = json.loads(TASK2_AUTHORING_RECEIPT.read_text(encoding="utf-8"))
        self.assertEqual(DECISION_ID, receipt["decision_id"])
        self.assertEqual("GR-PR82-TASK2-HIGODOT-20260809-01", receipt["receipt_id"])
        self.assertEqual("PROTECTED_TASK2_DELTA_COMPLETE", receipt["receipt_reconciliation"]["status"])
        self.assertEqual(
            {
                "res://src/core/resources/resource_reservation_ledger.gd",
                "res://src/core/workflow/glyph_source_loadout.gd",
                "res://src/core/workflow/glyph_source_loadout.gd.uid",
            },
            set(receipt["changed_godot_artifacts"]),
        )

    def test_current_human_canon_promotes_task2_merged_main_and_sheet_pass(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("TASK2_MERGED_MAIN_VERIFIED", text, str(path))
            self.assertIn(TASK2_MERGED_MAIN, text, str(path))
            self.assertIn(TASK2_MAIN_SYNC_ID, text, str(path))
            self.assertIn(POST_MERGE_SYNC_ID, text, str(path))
            self.assertIn("SHEET_WRITE_READBACK_PASS", text, str(path))
            self.assertNotIn("spell_workflow_task2: NOT_STARTED_ON_BRANCH", text, str(path))

    def test_machine_canon_promotes_task2_merged_main(self) -> None:
        canon = json.loads((ROOT / "docs/planning/CANON_SYNC_STATE.json").read_text(encoding="utf-8"))
        authority = json.loads((ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json").read_text(encoding="utf-8"))
        grill = json.loads((ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json").read_text(encoding="utf-8"))

        workflow = canon["spell_workflow_main"]
        self.assertEqual(TASK2_MAIN_SYNC_ID, workflow["sync_id"])
        self.assertEqual(POST_MERGE_SYNC_ID, workflow["post_merge_canon_sync_id"])
        self.assertEqual(TASK2_MERGED_MAIN, workflow["main_merge_commit"])
        self.assertEqual(TASK2_EXACT_HEAD, workflow["implementation_head"])
        self.assertEqual("TASK1_2_MERGED_MAIN", workflow["implementation"])
        self.assertEqual("TASK2_MERGED_MAIN_VERIFIED", workflow["status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", workflow["task2_execution_status"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", workflow["sheet_sync"])
        self.assertEqual("TASK2_HIGODOT_RECEIPT_READBACK_PASS", workflow["authoring_receipt_status"])

        implementation = authority["implementation_pr"]
        self.assertEqual(TASK2_EXACT_HEAD, implementation["head"])
        self.assertEqual(TASK2_MERGED_MAIN, implementation["merged_main"])
        self.assertEqual("TASK2_MERGED_MAIN_VERIFIED", implementation["status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", implementation["task2"])
        self.assertEqual("TASK2_HIGODOT_RECEIPT_READBACK_PASS", implementation["task2_authoring_receipt_status"])

        current = grill["current_work"]
        self.assertEqual("TASK2_MERGED_MAIN_VERIFIED", current["status"])
        self.assertEqual(TASK2_EXACT_HEAD, current["spell_workflow_implementation_head"])
        self.assertEqual(TASK2_MERGED_MAIN, current["spell_workflow_merged_main"])
        self.assertEqual("MERGED_MAIN_VERIFIED", current["spell_workflow_task2"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", current["spell_workflow_task2_sheet_sync"])


if __name__ == "__main__":
    unittest.main()
