from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DECISION_ID = "GM-SPELL-WORKFLOW-UI-V2-01"
SYNC_ID = "GR-SYNC-20260809-01-TASK2-USER-APPROVAL"
RECEIPT = ROOT / "docs/planning/sync/GR-SYNC-20260809-01-TASK2-USER-APPROVAL.md"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]


class Task2UserApprovalCanonTests(unittest.TestCase):
    def test_user_approval_is_active_across_current_canon(self) -> None:
        self.assertTrue(RECEIPT.exists())
        receipt = RECEIPT.read_text(encoding="utf-8")
        self.assertIn(DECISION_ID, receipt)
        self.assertIn(SYNC_ID, receipt)
        self.assertIn("USER_APPROVED_2026-08-09T06:19+09:00", receipt)
        self.assertIn("HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE", receipt)
        self.assertIn("AUTHORIZED_AWAITING_HIGODOT_CHANNEL", receipt)

        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("spell_workflow_task2_authorized: true", text, str(path))
            self.assertNotIn("spell_workflow_task2_authorized: false", text, str(path))

        canon = json.loads((ROOT / "docs/planning/CANON_SYNC_STATE.json").read_text(encoding="utf-8"))
        authority = json.loads((ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json").read_text(encoding="utf-8"))
        grill = json.loads((ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json").read_text(encoding="utf-8"))

        self.assertTrue(canon["spell_workflow_main"]["spell_workflow_task2_authorized"])
        self.assertEqual("AUTHORIZED_AWAITING_HIGODOT_CHANNEL", canon["spell_workflow_main"]["task2_execution_status"])
        self.assertTrue(authority["claims"]["spell_workflow_task2_authorized"])
        self.assertTrue(grill["current_work"]["spell_workflow_task2_authorized"])


if __name__ == "__main__":
    unittest.main()
