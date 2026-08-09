from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SYNC = "GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY"
DECISION = "GM-SPELL-WORKFLOW-UI-V2-01"
STATUS = "TASK3_AUTHORIZED_READY_FOR_HIGODOT_AUTHORING"
RECEIPT_GATE = "HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE"
HANDOFF = "docs/planning/handoffs/2026-08-09-task3-higodot-execution-packet.md"


class Task3ContinuousEntryCanonTests(unittest.TestCase):
    def test_machine_canon_records_task3_continuous_entry(self) -> None:
        data = json.loads((ROOT / "docs/planning/CANON_SYNC_STATE.json").read_text(encoding="utf-8"))
        spell = data["spell_workflow_main"]
        self.assertEqual(DECISION, spell["decision_id"])
        self.assertEqual(SYNC, spell["task3_entry_sync_id"])
        self.assertTrue(spell["spell_workflow_task3_authorized"])
        self.assertEqual(STATUS, spell["task3_status"])
        self.assertEqual(RECEIPT_GATE, spell["task3_required_persistent_authority"])
        self.assertEqual("NOT_STARTED", spell["task3_implementation"])
        self.assertEqual(HANDOFF, spell["task3_executor_handoff"])

    def test_current_human_surfaces_match_task3_entry(self) -> None:
        for relative in (
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/CURRENT_UNRESOLVED_GATES.md",
        ):
            text = (ROOT / relative).read_text(encoding="utf-8")
            self.assertIn(DECISION, text, relative)
            self.assertIn(SYNC, text, relative)
            self.assertIn(STATUS, text, relative)
            self.assertIn(RECEIPT_GATE, text, relative)
            self.assertNotIn("Task3 only after separate scope authorization", text, relative)

    def test_executor_packet_preserves_task3_scope_and_authority(self) -> None:
        path = ROOT / HANDOFF
        self.assertTrue(path.is_file(), HANDOFF)
        text = path.read_text(encoding="utf-8")
        for token in (
            "Task 3: Immutable Prepared Spell and Exactly-once Inventory",
            "src/core/spells/prepared_spell.gd",
            "src/core/spells/prepared_spell_inventory.gd",
            "tests/unit/test_prepared_spell_inventory.gd",
            "HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE",
            "TASK3_TDD_RED",
            "DEFERRED_EXTERNAL_EXECUTOR",
            "FIVE_POINT_STAR",
            "Stage 2",
            "Stage 3",
        ):
            self.assertIn(token, text)

    def test_task3_product_files_are_not_falsely_claimed_complete(self) -> None:
        self.assertFalse((ROOT / "src/core/spells/prepared_spell.gd").exists())
        self.assertFalse((ROOT / "src/core/spells/prepared_spell_inventory.gd").exists())


if __name__ == "__main__":
    unittest.main()
