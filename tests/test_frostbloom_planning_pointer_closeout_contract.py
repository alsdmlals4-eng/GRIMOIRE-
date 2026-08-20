from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260820-30-FIRST-SESSION-PLANNING-POINTER-CLOSEOUT.md"


class FrostbloomPlanningPointerCloseoutContractTests(unittest.TestCase):
    def test_current_pointer_promotes_latest_approved_refinement(self):
        text = CURRENT.read_text(encoding="utf-8")
        self.assertIn(
            "current_planning_refinement: GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01",
            text,
        )
        self.assertIn(
            "current_planning_refinement_sync: GR-SYNC-20260820-29-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER",
            text,
        )
        self.assertIn(
            "planning_pointer_closeout_sync: GR-SYNC-20260820-30-FIRST-SESSION-PLANNING-POINTER-CLOSEOUT",
            text,
        )
        self.assertIn("planning_completion_state: READY_PENDING_USER_EXPLICIT_DECLARATION", text)
        self.assertIn(
            "next_planning_axis: NONE_PENDING_USER_EXPLICIT_PLANNING_COMPLETION_DECLARATION",
            text,
        )
        self.assertNotIn(
            "next_planning_axis: FROSTBLOOM_FIRST_SESSION_END_TO_END_REVIEW",
            text,
        )
        self.assertIn(
            "base_current_main_observed: 369e7173c6a21ec2c7e70cef5e11f799a5d7dbc0",
            text,
        )

    def test_closeout_receipt_preserves_completion_authority_and_evidence_ceiling(self):
        self.assertTrue(SYNC.is_file(), SYNC)
        text = SYNC.read_text(encoding="utf-8")
        for token in (
            "GR-SYNC-20260820-30-FIRST-SESSION-PLANNING-POINTER-CLOSEOUT",
            "CURRENT_POINTER_CLOSEOUT_ONLY",
            "NO_NEW_PRODUCT_DECISION",
            "USER_EXPLICIT_PLANNING_COMPLETION: NOT_DECLARED",
            "TASK2_CLOSE_ALLOWED: false",
            "Human: NOT_RUN",
            "Device: NOT_RUN",
            "Performance: NOT_RUN",
            "Full Slice: NOT_RUN",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
