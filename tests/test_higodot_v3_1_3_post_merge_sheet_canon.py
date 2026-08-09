from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
DECISIONS = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
ACTIVE = ROOT / "docs/ACTIVE_CONTEXT.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
SOURCE_SYNC = "GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION"
POST_SYNC = "GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON"
PR98_MAIN = "75eaa8d19b8a38a21599c37dc7545818615a04c1"
SHEET_PASS = "SHEET_WRITE_READBACK_PASS"


class HiGodotV313PostMergeSheetCanonTests(unittest.TestCase):
    def test_authority_promotes_pr98_main_and_sheet_readback(self) -> None:
        data = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(PR98_MAIN, data["current_tool_state_merged_main"])
        self.assertEqual(SHEET_PASS, data["current_tool_sync_sheet_status"])
        self.assertEqual("PR98_EXACT_HEAD_PASS_MERGED_MAIN_SHEET_READBACK_PASS", data["review"]["current_tool_sync_result"])
        self.assertEqual(SOURCE_SYNC, data["sheet_sync"]["current_tool_sync_id"])
        self.assertEqual(PR98_MAIN, data["sheet_sync"]["current_tool_state_merged_main"])
        self.assertEqual(SHEET_PASS, data["sheet_sync"]["tracked_v3_1_3_reconciliation_sync"])

    def test_canon_and_grill_promote_pr98_sheet_pass(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        tool = canon["tool_authority"]
        self.assertEqual(SOURCE_SYNC, tool["tracked_tool_state_sync_id"])
        self.assertEqual(PR98_MAIN, tool["tracked_tool_state_merged_main"])
        self.assertEqual(SHEET_PASS, tool["tracked_tool_state_sheet_sync"])
        self.assertEqual(POST_SYNC, tool["post_merge_sheet_canon_sync_id"])

        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        work = grill["current_work"]
        self.assertEqual(PR98_MAIN, work["tool_state_reconciled_main"])
        self.assertEqual(SHEET_PASS, work["tracked_v3_1_3_sheet_sync"])
        self.assertEqual(POST_SYNC, work["post_merge_sheet_canon_sync_id"])

    def test_current_human_surfaces_record_pr98_sheet_pass_without_pending(self) -> None:
        for path in (DECISIONS, ACTIVE):
            text = path.read_text(encoding="utf-8")
            self.assertIn(DECISION, text, str(path))
            self.assertIn(SOURCE_SYNC, text, str(path))
            self.assertIn(POST_SYNC, text, str(path))
            self.assertIn(PR98_MAIN, text, str(path))
            self.assertIn(SHEET_PASS, text, str(path))
            self.assertNotIn("PENDING_POST_MERGE_READBACK", text, str(path))


if __name__ == "__main__":
    unittest.main()
