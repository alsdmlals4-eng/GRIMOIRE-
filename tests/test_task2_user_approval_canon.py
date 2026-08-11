from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DECISION_ID = "GM-SPELL-WORKFLOW-UI-V2-01"
APPROVAL_SYNC_ID = "GR-SYNC-20260809-01-TASK2-USER-APPROVAL"
TASK2_MAIN_SYNC_ID = "GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN"
POST_MERGE_SYNC_ID = "GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON"
CURRENT_SYNC_ID = "GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE"
TASK2_MERGED_MAIN = "975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0"
APPROVAL_RECEIPT = ROOT / "docs/planning/sync/GR-SYNC-20260809-01-TASK2-USER-APPROVAL.md"
TASK2_AUTHORING_RECEIPT = ROOT / "artifacts/higodot/HIGODOT_AUTHORING_RECEIPT_TASK2_2026-08-09.json"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CURRENT_TASK_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
NEXT_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"


class Task2UserApprovalCanonTests(unittest.TestCase):
    def test_historical_user_approval_receipt_is_preserved(self) -> None:
        text = APPROVAL_RECEIPT.read_text(encoding="utf-8")
        self.assertIn(DECISION_ID, text)
        self.assertIn(APPROVAL_SYNC_ID, text)
        self.assertIn("USER_APPROVED_2026-08-09T06:19+09:00", text)

    def test_task2_authoring_receipt_is_preserved(self) -> None:
        receipt = json.loads(TASK2_AUTHORING_RECEIPT.read_text(encoding="utf-8"))
        self.assertEqual(DECISION_ID, receipt["decision_id"])
        self.assertEqual("PROTECTED_TASK2_DELTA_COMPLETE", receipt["receipt_reconciliation"]["status"])

    def test_current_human_canon_preserves_task7_predecessor_and_advances_task8_gate(self) -> None:
        for path in CURRENT_DOCS:
            with self.subTest(path=str(path)):
                text = path.read_text(encoding="utf-8")
                self.assertIn(DECISION_ID, text)
                self.assertIn(CURRENT_SYNC_ID, text)
                self.assertIn("TASK7_MERGED_MAIN_VERIFIED", text)
                self.assertIn(CURRENT_TASK_STATUS, text)
                self.assertIn(NEXT_GATE, text)

    def test_task2_history_remains_traceable_from_current_sync_receipt(self) -> None:
        text = (ROOT / "docs/planning/sync/GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE.md").read_text(encoding="utf-8")
        for token in (APPROVAL_SYNC_ID, TASK2_MAIN_SYNC_ID, POST_MERGE_SYNC_ID, TASK2_MERGED_MAIN):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
