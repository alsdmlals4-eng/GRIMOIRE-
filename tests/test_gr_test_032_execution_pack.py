import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RUNBOOK = ROOT / "docs/validation/GR_TEST_032_EXECUTION_RUNBOOK.md"
MODERATOR = ROOT / "docs/validation/GR_TEST_032_MODERATOR_SCRIPT.md"
PREFLIGHT = ROOT / "docs/validation/GR_TEST_032_DEVICE_PREFLIGHT.md"
SESSION_TEMPLATE = ROOT / "artifacts/human-validation/gr-test-032-session-template.json"
ATTEMPT_SCHEMA = ROOT / "artifacts/human-validation/gr-test-032-attempt-schema.json"
RESULT_TEMPLATE = ROOT / "artifacts/human-validation/gr-test-032-result-template.json"


class GrTest032ExecutionPackContractTests(unittest.TestCase):
    def test_required_execution_pack_files_exist(self) -> None:
        for path in (
            RUNBOOK,
            MODERATOR,
            PREFLIGHT,
            SESSION_TEMPLATE,
            ATTEMPT_SCHEMA,
            RESULT_TEMPLATE,
        ):
            self.assertTrue(path.is_file(), path)

    def test_runbook_preserves_approved_scope_and_honest_boundary(self) -> None:
        text = RUNBOOK.read_text(encoding="utf-8")
        required = (
            "GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01",
            "GR-TEST-032",
            "READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN",
            "C_STAGED_RECOGNITION_THEN_CORE_LOOP",
            "STAGE_1_RECOGNITION_DIAGNOSTIC",
            "SAME_PARTICIPANT_WITH_BREAK",
            "STAGE_2_CORE_LOOP_BRIDGE",
            "FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED",
            "participants: 6",
            "break_between_stages_minutes: 10",
            "scored_attempts_per_participant: 24",
            "planned_total_scored_attempts: 144",
            "EXACTLY_6_RUNTIME_GLYPHS",
            "HUMAN_DEVICE_VALIDATION_NOT_RUN",
            "HUMAN_END_TO_END_CORE_LOOP_NOT_RUN",
            "FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN",
            "RUNTIME_EXPANSION_7_PLUS_BLOCKED",
            "MERGE_NOT_AUTHORIZED",
        )
        for token in required:
            self.assertIn(token, text)

    def test_moderator_script_does_not_leak_solution_or_score(self) -> None:
        text = MODERATOR.read_text(encoding="utf-8")
        required = (
            "NO_SOLUTION_PROMPT",
            "NO_BEST_GLYPH_RECOMMENDATION",
            "NO_PARTICIPANT_RANKING_OR_SCORE_FEEDBACK",
            "MODERATOR_INTERVENTION_EVENT",
            "STOP_ON_HARD_STOP",
            "ANONYMOUS_PARTICIPANT_ID_ONLY",
        )
        for token in required:
            self.assertIn(token, text)

    def test_device_preflight_covers_required_mobile_conditions(self) -> None:
        text = PREFLIGHT.read_text(encoding="utf-8")
        required = (
            "NARROW_LANDSCAPE_16_9_TO_18_9",
            "TALL_LANDSCAPE_19_5_9_TO_20_9",
            "ANDROID_TOUCH_TARGET_48DP",
            "IOS_TOUCH_TARGET_44PT",
            "NON_DRAG_ALTERNATIVE_REQUIRED",
            "REDUCED_MOTION",
            "SAFE_AREA",
            "ARTIFACT_SHA_REQUIRED",
        )
        for token in required:
            self.assertIn(token, text)

    def test_templates_are_empty_not_run_and_pii_safe(self) -> None:
        session = json.loads(SESSION_TEMPLATE.read_text(encoding="utf-8"))
        attempt = json.loads(ATTEMPT_SCHEMA.read_text(encoding="utf-8"))
        result = json.loads(RESULT_TEMPLATE.read_text(encoding="utf-8"))

        self.assertEqual(session["test_id"], "GR-TEST-032")
        self.assertEqual(session["status"], "READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN")
        self.assertEqual(session["participants"], [])
        self.assertEqual(session["runtime_glyph_ids"], [
            "HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"
        ])
        self.assertEqual(session["planned_participant_count"], 6)
        self.assertEqual(session["planned_total_scored_attempts"], 144)
        self.assertTrue(session["raw_personal_identifier_prohibited"])

        self.assertEqual(attempt["participant_identity"], "ANONYMOUS_PARTICIPANT_ID_ONLY")
        self.assertTrue(attempt["raw_personal_identifier_prohibited"])
        self.assertIn("first_attempt", attempt["required_fields"])
        self.assertIn("post_feedback", attempt["required_fields"])
        self.assertIn("moderator_intervention", attempt["required_fields"])
        self.assertIn("artifact_sha", attempt["required_fields"])

        self.assertEqual(result["test_id"], "GR-TEST-032")
        self.assertEqual(result["status"], "HUMAN_EXECUTION_NOT_RUN")
        self.assertEqual(result["classification"], "PENDING_NOT_RUN")
        self.assertEqual(result["hard_stop_count"], 0)
        self.assertFalse(result["human_pass_claimed"])
        self.assertFalse(result["merge_authorized"])


if __name__ == "__main__":
    unittest.main()
