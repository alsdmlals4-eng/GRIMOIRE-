import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
CANON = ROOT / "docs/planning/FROSTBLOOM_FIRST_SESSION_PERSISTENT_HANDOFF_ELASTIC_BUFFER_01_APPROVAL_2026-08-20.md"
FIXTURE = ROOT / "data/testing/frostbloom_first_session_handoff_buffer_v1.json"
W6_FIXTURE = ROOT / "data/testing/frostbloom_w6_bounded_forecast_v1.json"
W7_FIXTURE = ROOT / "data/testing/frostbloom_w7_context_delta_v1.json"
OVERLAY = ROOT / "docs/testing/frostbloom_graybox/08_FIRST_SESSION_HANDOFF_BUFFER_OVERLAY.md"
README = ROOT / "docs/testing/frostbloom_graybox/README.md"


class FrostbloomFirstSessionHandoffBufferContractTests(unittest.TestCase):
    def test_required_artifacts_exist(self):
        for path in (CANON, FIXTURE, W6_FIXTURE, W7_FIXTURE, OVERLAY, README):
            self.assertTrue(path.is_file(), path)

    def test_persistent_handoff_elastic_buffer_contract(self):
        text = CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01",
            "PERSISTENT_HANDOFF_ELASTIC_BUFFER",
            "INVESTIGATION_SUMMARY_PERSISTS_INTO_W6",
            "NO_DUPLICATE_W6_DECISION_BRIEF",
            "W6_RECEIPT_PINS_AS_W7_ANCHOR",
            "NO_DUPLICATE_W7_RESULT_ANCHOR_SCREEN",
            "ELASTIC_BUFFER_NOT_CONTENT",
            "NO_NEW_CONTENT_FROM_RECOVERED_TIME",
            "TARGET_46_UNCHANGED",
            "human_validation: NOT_RUN",
            "device_validation: NOT_RUN",
            "full_slice_validation: NOT_RUN",
        ):
            self.assertIn(token, text)

        data = json.loads(FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual("PERSISTENT_HANDOFF_ELASTIC_BUFFER", data["contract"])
        self.assertTrue(data["investigation_to_w6"]["summary_persists_into_w6"])
        self.assertFalse(data["investigation_to_w6"]["duplicate_decision_brief_screen"])
        self.assertEqual(60, data["investigation_to_w6"]["elastic_buffer_max_seconds_test_value"])
        self.assertTrue(data["w6_to_w7"]["w6_receipt_pins_as_anchor"])
        self.assertFalse(data["w6_to_w7"]["duplicate_result_anchor_screen"])
        self.assertEqual(60, data["w6_to_w7"]["elastic_buffer_max_seconds_test_value"])
        self.assertFalse(data["elastic_buffer"]["must_be_filled"])
        self.assertFalse(data["elastic_buffer"]["new_content_allowed"])
        self.assertEqual(46, data["session_target_minutes"])
        self.assertEqual("NOT_RUN", data["human_validation"])

    def test_existing_w6_w7_fixtures_consume_handoff_without_recap(self):
        w6 = json.loads(W6_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"known": 2, "unknown": 2, "lens": 1}, w6["entry_summary"])
        self.assertTrue(w6["entry_handoff"]["persists_from_investigation"])
        self.assertFalse(w6["entry_handoff"]["duplicate_decision_brief_required"])
        self.assertEqual("ELASTIC_HANDOFF_WINDOW", w6["timing_test_values"][0]["phase"])

        w7 = json.loads(W7_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual("W6_RESULT_ANCHOR", w7["reveal"]["first_phase"])
        self.assertEqual("PERSISTENT_W6_RECEIPT_PIN_NO_RECAP_SCREEN", w7["reveal"]["anchor_presentation"])
        self.assertEqual("ELASTIC_W6_TO_W7_HANDOFF", w7["timing_test_values"][0]["phase"])

    def test_graybox_overlay_is_current_consumer(self):
        overlay = OVERLAY.read_text(encoding="utf-8")
        readme = README.read_text(encoding="utf-8")
        for token in (
            "PERSISTENT_HANDOFF_ELASTIC_BUFFER",
            "NO_DUPLICATE_W6_DECISION_BRIEF",
            "NO_DUPLICATE_W7_RESULT_ANCHOR_SCREEN",
            "ELASTIC_BUFFER_NOT_CONTENT",
        ):
            self.assertIn(token, overlay)
        self.assertIn("ACTIVE_REFINEMENT_7: GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01", readme)
        self.assertIn("08_FIRST_SESSION_HANDOFF_BUFFER_OVERLAY.md", readme)


if __name__ == "__main__":
    unittest.main()
