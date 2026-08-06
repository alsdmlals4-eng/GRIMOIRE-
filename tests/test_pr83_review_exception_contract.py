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
    def test_exception_receipt_exists_and_is_scoped(self) -> None:
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

    def test_state_authorizes_only_pr83_after_exact_head_checks(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        gate = state["pr83_merge_gate"]
        self.assertEqual("USER_APPROVED_PR83_ONLY", gate["independent_review_exception"])
        self.assertEqual("REQUIRE_CURRENT_EXACT_HEAD_CHECKS_PASS", gate["merge_condition"])
        self.assertFalse(gate["waives_future_pr_review"])
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_active_docs_preserve_gut_and_spell_workflow_blocks(self) -> None:
        combined = "\n".join(
            path.read_text(encoding="utf-8") for path in (UNRESOLVED, DECISIONS)
        )
        self.assertIn("PR83_ONLY", combined)
        self.assertIn("BLOCKED_PENDING_GUT_FORMAL_ADOPTION", combined)
        self.assertIn("GUT_ADOPTION_PR_INDEPENDENT_REVIEW_REQUIRED", combined)
        self.assertIn("PR82_TASK2_NOT_AUTHORIZED", combined)


if __name__ == "__main__":
    unittest.main()
