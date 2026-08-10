from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HISTORICAL_SYNC = "GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY"
CURRENT_SYNC = "GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE"
DECISION = "GM-SPELL-WORKFLOW-UI-V2-01"
HANDOFF = ROOT / "docs/planning/handoffs/2026-08-09-task3-higodot-execution-packet.md"
HISTORICAL_SYNC_DOC = ROOT / "docs/planning/sync/GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY.md"
CURRENT_SYNC_DOC = ROOT / "docs/planning/sync/GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE.md"


class Task3ContinuousEntryCanonTests(unittest.TestCase):
    def test_historical_machine_snapshot_keeps_task3_checkpoint(self) -> None:
        data = json.loads((ROOT / "docs/planning/CANON_SYNC_STATE.json").read_text(encoding="utf-8"))
        spell = data["spell_workflow_main"]
        self.assertEqual(DECISION, spell["decision_id"])
        self.assertEqual("TASK3_READY_AFTER_POST_MERGE_CANON", spell["task2_readiness"])

    def test_historical_task3_entry_artifacts_remain_traceable(self) -> None:
        self.assertTrue(HANDOFF.is_file())
        self.assertTrue(HISTORICAL_SYNC_DOC.is_file())
        handoff = HANDOFF.read_text(encoding="utf-8")
        sync = HISTORICAL_SYNC_DOC.read_text(encoding="utf-8")
        self.assertIn("Task 3: Immutable Prepared Spell and Exactly-once Inventory", handoff)
        self.assertIn("TASK3_TDD_RED", handoff)
        self.assertIn(HISTORICAL_SYNC, sync)
        self.assertIn(DECISION, sync)
        self.assertIn("product_mutation_in_this_sync: NONE", sync)

    def test_current_human_state_supersedes_task3_as_next(self) -> None:
        for relative_path in (
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/CURRENT_UNRESOLVED_GATES.md",
        ):
            with self.subTest(path=relative_path):
                text = (ROOT / relative_path).read_text(encoding="utf-8")
                self.assertIn(CURRENT_SYNC, text)
                self.assertIn("TASK7_MERGED_MAIN_VERIFIED", text)
                self.assertIn("TASK8_SPELL_USE_SCREEN", text)

    def test_current_sync_receipt_records_merged_lineage(self) -> None:
        text = CURRENT_SYNC_DOC.read_text(encoding="utf-8")
        for token in (CURRENT_SYNC, DECISION, "#104", "#105", "#106", "#108", "#110"):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
