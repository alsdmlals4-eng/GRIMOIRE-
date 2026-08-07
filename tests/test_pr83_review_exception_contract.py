from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RECEIPT = ROOT / "docs/planning/PR83_INDEPENDENT_REVIEW_EXCEPTION_2026-08-06.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
DECISIONS = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"


class Pr83ReviewExceptionContractTests(unittest.TestCase):
    def test_exception_receipt_exists_and_remains_pr83_scoped(self) -> None:
        self.assertTrue(RECEIPT.is_file(), str(RECEIPT))
        text = RECEIPT.read_text(encoding="utf-8")
        for token in (
            "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01",
            "PR83_ONLY",
            "USER_APPROVED_2026-08-06T23:28+09:00",
            "DOES_NOT_WAIVE_GUT_ADOPTION_PR_REVIEW",
            "DOES_NOT_AUTHORIZE_PR82_TASK2",
        ):
            self.assertIn(token, text)

    def test_state_records_the_successor_pr84_exception_without_reusing_pr83(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertNotIn("pr83_merge_gate", state)
        gate = state["pr84_merge_gate"]
        self.assertEqual(
            "GM-PR84-ACTIONS-BUDGET-LOCAL-EVIDENCE-EXCEPTION-01",
            gate["actions_exception_decision_id"],
        )
        self.assertEqual("MERGED_MAIN_READBACK_PASS", gate["status"])
        self.assertEqual("312e491c8e9b333cb585b4e0550f80e3aea5f3f7", gate["merged_main"])
        self.assertTrue(gate["exception_consumed"])
        self.assertFalse(gate["waives_future_pr_checks"])
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_pr83_exception_is_history_while_current_docs_follow_v4_4_review_model(self) -> None:
        receipt = RECEIPT.read_text(encoding="utf-8")
        current = UNRESOLVED.read_text(encoding="utf-8")
        decisions = DECISIONS.read_text(encoding="utf-8")
        self.assertIn("PR83_ONLY", receipt)
        self.assertIn('contract_version: "4.4"', current)
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", current)
        self.assertIn("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", current)
        self.assertIn("spell_workflow_task2_authorized: false", current)
        self.assertNotIn("GUT_ADOPTION_PR_INDEPENDENT_REVIEW_REQUIRED", current)
        self.assertIn("FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE", decisions)
        self.assertIn("BLOCKED_BY_GUT_ADOPTION_SPEC", decisions)


if __name__ == "__main__":
    unittest.main()
