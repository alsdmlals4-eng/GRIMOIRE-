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

    def test_state_records_pr83_as_merged_historical_exception(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        gate = state["pr83_merge_gate"]
        self.assertEqual("USER_APPROVED_PR83_ONLY", gate["independent_review_exception"])
        self.assertEqual("MERGED_MAIN_READBACK_PASS", gate["status"])
        self.assertEqual("50b0645f13c9267de34b53478b26e8567dd2ecb3", gate["merged_head"])
        self.assertEqual("252063ccad18b885fc75cbeba3b807fefd76496e", gate["merged_main"])
        self.assertFalse(gate["waives_future_pr_review"])
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_active_docs_use_v4_3_review_model_and_preserve_blocks(self) -> None:
        combined = "\n".join(
            path.read_text(encoding="utf-8") for path in (UNRESOLVED, DECISIONS)
        )
        self.assertIn("PR83_ONLY", combined)
        self.assertIn("BLOCKED_BY_GUT_ADOPTION_SPEC", combined)
        self.assertIn("GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY", combined)
        self.assertIn("PR #82 Task 2", combined)
        self.assertIn("FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE", combined)
        self.assertNotIn("GUT_ADOPTION_PR_INDEPENDENT_REVIEW_REQUIRED", combined)


if __name__ == "__main__":
    unittest.main()
