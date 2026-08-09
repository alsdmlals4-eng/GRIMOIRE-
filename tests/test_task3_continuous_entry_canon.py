from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SYNC = "GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY"
DECISION = "GM-SPELL-WORKFLOW-UI-V2-01"
RECEIPT_GATE = "HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE"
PUBLIC_TASK3_GATE = "HIGODOT_PERSISTENT_TASK3_AUTHORING_WITH_FRESH_RECEIPT_GATE"
HANDOFF = "docs/planning/handoffs/2026-08-09-task3-higodot-execution-packet.md"
SYNC_DOC = "docs/planning/sync/GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY.md"


class Task3ContinuousEntryCanonTests(unittest.TestCase):
    def test_existing_machine_canon_already_makes_task3_next_ready_unit(self) -> None:
        data = json.loads((ROOT / "docs/planning/CANON_SYNC_STATE.json").read_text(encoding="utf-8"))
        spell = data["spell_workflow_main"]
        self.assertEqual(DECISION, spell["decision_id"])
        self.assertEqual("TASK3_READY_AFTER_POST_MERGE_CANON", spell["task2_readiness"])
        self.assertEqual(
            "TASK3_TDD_HIGODOT_AUTHORING_THEN_POST_IMPLEMENTATION_VISUAL_ACCEPTANCE",
            spell["current_gate"],
        )
        self.assertEqual(RECEIPT_GATE, spell["required_persistent_authority"])

    def test_existing_human_canon_allows_task3_without_claiming_completion(self) -> None:
        unresolved = (ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md").read_text(encoding="utf-8")
        confirmed = (ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md").read_text(encoding="utf-8")
        start = (ROOT / "START_HERE.md").read_text(encoding="utf-8")
        for token in ("TASK3_TDD_RED", PUBLIC_TASK3_GATE):
            self.assertIn(token, unresolved)
        self.assertIn("Task 3+ 구현과 three-screen runtime acceptance는 아직 완료로 주장하지 않는다", confirmed)
        self.assertIn("다음 제품 단계는 승인된 UI v2 계획의 Task 3", start)

    def test_executor_packet_and_sync_checkpoint_exist(self) -> None:
        handoff = ROOT / HANDOFF
        sync_doc = ROOT / SYNC_DOC
        self.assertTrue(handoff.is_file(), HANDOFF)
        self.assertTrue(sync_doc.is_file(), SYNC_DOC)
        handoff_text = handoff.read_text(encoding="utf-8")
        sync_text = sync_doc.read_text(encoding="utf-8")
        for token in (
            "Task 3: Immutable Prepared Spell and Exactly-once Inventory",
            "src/core/spells/prepared_spell.gd",
            "src/core/spells/prepared_spell_inventory.gd",
            "tests/unit/test_prepared_spell_inventory.gd",
            RECEIPT_GATE,
            "TASK3_TDD_RED",
            "DEFERRED_EXTERNAL_EXECUTOR",
            "FIVE_POINT_STAR",
            "Stage 2",
            "Stage 3",
        ):
            self.assertIn(token, handoff_text)
        for token in (SYNC, DECISION, "CONTINUOUS_WORK_ACTIVE", "DEFERRED_EXTERNAL_EXECUTOR"):
            self.assertIn(token, sync_text)

    def test_entry_sync_records_that_pr101_itself_had_no_product_mutation(self) -> None:
        sync_text = (ROOT / SYNC_DOC).read_text(encoding="utf-8")
        self.assertIn("product_mutation_in_this_sync: NONE", sync_text)
        self.assertIn("Task 3 product files are not created by this sync", sync_text)

    def test_executor_packet_pins_immutable_payload_and_atomic_restore_contract(self) -> None:
        handoff_text = (ROOT / HANDOFF).read_text(encoding="utf-8")
        for token in (
            "IMMUTABLE_PAYLOAD_INVENTORY_LIFECYCLE",
            "PreparedSpell payload remains immutable after creation",
            "inventory-owned lifecycle state",
            "empty `preparation_transaction_id`",
            "empty `use_transaction_id`",
            "validate-then-swap",
            "pre-call inventory state unchanged",
            "same preparation transaction",
            "different candidate spell",
            "public `spell(spell_id)` read derives `USED`",
            "USE_TRANSACTION_SINGLE_OWNER",
            "same `use_transaction_id` cannot be rebound to a different spell",
            "serialized immutable spell payload must retain `status: READY`",
        ):
            self.assertIn(token, handoff_text)


if __name__ == "__main__":
    unittest.main()
