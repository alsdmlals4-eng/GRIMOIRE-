import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DECISION_ID = "GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01"
APPROVAL = ROOT / "docs/planning/GLYPH_HUMAN_CIRCUIT_BRIDGE_01_APPROVAL_2026-08-05.md"
PROTOCOL = ROOT / "docs/validation/GLYPH_HUMAN_CIRCUIT_BRIDGE_PROTOCOL.md"
ADVERSARIAL = ROOT / "docs/planning/GLYPH_HUMAN_CIRCUIT_BRIDGE_01_ADVERSARIAL_REVIEW_2026-08-05.md"
CURRENT_DECISIONS = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
GRILL_STATE = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
CANON_SYNC_STATE = ROOT / "docs/planning/CANON_SYNC_STATE.json"
DEVELOPMENT_GATES = ROOT / "docs/DEVELOPMENT_GATES.md"


class HumanCircuitBridgeDecisionContractTests(unittest.TestCase):
    def test_required_decision_artifacts_exist(self) -> None:
        for path in (APPROVAL, PROTOCOL, ADVERSARIAL):
            self.assertTrue(path.is_file(), path)

    def test_approved_option_is_staged_hybrid(self) -> None:
        text = "\n".join(
            path.read_text(encoding="utf-8")
            for path in (APPROVAL, PROTOCOL, ADVERSARIAL, CURRENT_DECISIONS)
        )
        for token in (
            DECISION_ID,
            "C_STAGED_RECOGNITION_THEN_CORE_LOOP",
            "STAGE_1_RECOGNITION_DIAGNOSTIC",
            "STAGE_2_CORE_LOOP_BRIDGE",
            "SAME_PARTICIPANT_WITH_BREAK",
            "FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED",
            "NOT_A_FULL_VERTICAL_SLICE_REPRESENTATIVENESS_PASS",
            "HUMAN_EXECUTION_NOT_RUN",
        ):
            self.assertIn(token, text)

    def test_platform_and_accessibility_benchmarks_are_explicit(self) -> None:
        text = PROTOCOL.read_text(encoding="utf-8") + ADVERSARIAL.read_text(encoding="utf-8")
        for token in (
            "ANDROID_TOUCH_TARGET_48DP",
            "IOS_TOUCH_TARGET_44PT",
            "WCAG_2_2_TARGET_SIZE_MINIMUM_24_CSS_PX",
            "NON_DRAG_ALTERNATIVE_REQUIRED",
            "PROJECT_USES_STRICTER_PLATFORM_TARGETS",
        ):
            self.assertIn(token, text)

    def test_stage_gates_preserve_product_boundaries(self) -> None:
        text = "\n".join(
            path.read_text(encoding="utf-8")
            for path in (APPROVAL, PROTOCOL, ADVERSARIAL, DEVELOPMENT_GATES)
        )
        for token in (
            "ACCEPTED_FALSE_ZERO_HARD_STOP",
            "ACCIDENTAL_COMMIT_ZERO_HARD_STOP",
            "RUNTIME_EXPANSION_7_PLUS_BLOCKED",
            "ALL_NUMERIC_THRESHOLDS_ARE_TEST_VALUE",
        ):
            self.assertIn(token, text)

    def test_grill_counter_and_current_sync_preserve_decision_without_merge(self) -> None:
        grill = json.loads(GRILL_STATE.read_text(encoding="utf-8"))
        sync = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))

        self.assertEqual(grill["current_count"], 4)
        self.assertEqual(grill["counter"]["approved_grill_me_since_last_flush"], 4)
        self.assertIn(DECISION_ID, grill["counter"]["pending_decision_ids"])
        self.assertEqual(grill["current_work"]["latest_approved_decision_id"], DECISION_ID)
        self.assertEqual(grill["current_work"]["human_validation_protocol"], "STAGED_HYBRID_APPROVED_NOT_RUN")
        self.assertFalse(grill["counter"]["merge_required"])
        self.assertFalse(grill["counter"]["merge_authorized"])

        bundle = sync["current_bundle"]
        self.assertEqual(bundle["sync_id"], "GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX")
        self.assertEqual(bundle["previous_sync_id"], "GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE")
        self.assertIn(DECISION_ID, bundle["decision_ids"])
        self.assertEqual(bundle["human_validation_protocol"], "APPROVED_NOT_RUN")
        self.assertEqual(bundle["human_device_validation"], "NOT_RUN")
        self.assertEqual(bundle["runtime_expansion_7_plus"], "BLOCKED")
        self.assertFalse(bundle["merge_authorized"])


if __name__ == "__main__":
    unittest.main()
