from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING.md"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"

DECISION = "GM-CONTRACT-V4-5-BINDING-01"
SYNC_ID = "GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING"
BINDING_PR = "114"
BINDING_MERGE = "52c6c50ee227564473e2ed3d17cf1ca8e35292fc"
TASK7 = "TASK7_MERGED_MAIN_VERIFIED"
TASK8 = "TASK8_SPELL_USE_SCREEN"


class V45PostMergeBindingFinalizationTests(unittest.TestCase):
    def test_sync_record_promotes_pr114_merged_main_readback(self) -> None:
        text = SYNC.read_text(encoding="utf-8")
        for token in (
            DECISION,
            SYNC_ID,
            "status: USER_APPROVED_MERGED_MAIN_READBACK_PASS",
            f"binding_pr: {BINDING_PR}",
            f"binding_merge_commit: {BINDING_MERGE}",
            "merge_state: MERGED_MAIN_READBACK_PASS",
            "sheet_sync: SHEET_WRITE_READBACK_PASS",
        ):
            self.assertIn(token, text)
        self.assertNotIn("MERGE_PENDING", text)
        self.assertNotIn("PENDING_FINAL_EXACT_HEAD_REVALIDATION", text)

    def test_unresolved_no_longer_lists_v45_binding_merge_as_remaining(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        self.assertIn("active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5", text)
        self.assertIn(DECISION, text)
        self.assertIn("binding_finalization: MERGED_MAIN_READBACK_PASS", text)
        self.assertIn(TASK7, text)
        self.assertIn(TASK8, text)
        self.assertNotIn("remaining_binding_work:", text)
        self.assertNotIn("FINALIZE_V4_5_R2_FINAL_EXACT_HEAD_AND_MERGE", text)

    def test_machine_ledgers_record_v45_merge_without_changing_product_or_tool_authority(self) -> None:
        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))

        self.assertEqual("4.5", grill["active_contract"]["version"])
        self.assertEqual(DECISION, grill["active_contract"]["binding_decision_id"])
        self.assertEqual("MERGED_MAIN_READBACK_PASS", grill["current_work"]["contract_v4_5_merge_status"])
        self.assertEqual(BINDING_MERGE, grill["current_work"]["contract_v4_5_binding_merge"])
        self.assertEqual("USER_APPROVED_MERGED_MAIN_READBACK_PASS", grill["validation"]["contract_v4_5_binding"])
        self.assertEqual(TASK7, grill["current_work"]["status"])
        self.assertEqual(TASK8, grill["current_work"]["spell_workflow_next_task"])

        self.assertEqual("4.5", canon["active_contract"]["version"])
        self.assertEqual(DECISION, canon["active_contract"]["binding_decision_id"])
        self.assertEqual("4.5", authority["contract"]["version"])
        self.assertEqual(DECISION, authority["contract"]["binding_decision_id"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", authority["sheet_sync"]["contract_binding_sheet_status"])


if __name__ == "__main__":
    unittest.main()
