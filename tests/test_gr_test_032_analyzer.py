import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ANALYZER = ROOT / "tools/analyze_gr_test_032.py"
GLYPHS = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]


class GrTest032AnalyzerTests(unittest.TestCase):
    def _module(self):
        self.assertTrue(ANALYZER.is_file(), ANALYZER)
        spec = importlib.util.spec_from_file_location("analyze_gr_test_032", ANALYZER)
        self.assertIsNotNone(spec)
        self.assertIsNotNone(spec.loader)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module

    def _base_session(self) -> dict:
        return {
            "test_id": "GR-TEST-032",
            "status": "HUMAN_EXECUTION_COMPLETED",
            "artifact_sha": "a" * 40,
            "runtime_glyph_ids": GLYPHS,
            "participants": [f"P0{i}" for i in range(1, 7)],
            "stage1": {
                "scored_attempt_count": 144,
                "first_attempt_correct_accept_count": 122,
                "one_retry_inclusive_correct_count": 140,
                "semantic_identification_correct_count": 136,
                "accepted_false_count": 0,
                "stale_application_count": 0,
                "mismatch_save_count": 0,
                "duplicate_save_count": 0,
                "fatigue_12": [2, 2, 3, 2, 3, 2],
                "fatigue_24": [3, 3, 3, 2, 3, 3],
            },
            "stage2": {
                "scenario_completion_count": 12,
                "participants_explaining_intent_before_commit": 6,
                "participants_selecting_explicit_source": 5,
                "participants_explaining_consequence": 5,
                "accidental_commit_count": 0,
                "duplicate_cost_or_result_count": 0,
                "moderator_solution_prompt_count": 0,
                "critical_accessibility_failure_count": 0,
            },
            "hard_stop_events": [],
        }

    def test_not_run_stays_pending_and_never_claims_human_pass(self) -> None:
        module = self._module()
        result = module.analyze({
            "test_id": "GR-TEST-032",
            "status": "READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN",
            "artifact_sha": None,
            "runtime_glyph_ids": GLYPHS,
            "participants": [],
        })
        self.assertEqual(result["classification"], "PENDING_NOT_RUN")
        self.assertEqual(result["status"], "HUMAN_EXECUTION_NOT_RUN")
        self.assertFalse(result["human_pass_claimed"])
        self.assertFalse(result["merge_authorized"])

    def test_any_hard_stop_forces_stop(self) -> None:
        module = self._module()
        session = self._base_session()
        session["stage1"]["accepted_false_count"] = 1
        session["hard_stop_events"] = [{"code": "ACCEPTED_FALSE", "participant_id": "P01"}]
        result = module.analyze(session)
        self.assertEqual(result["classification"], "STOP")
        self.assertEqual(result["hard_stop_count"], 1)
        self.assertFalse(result["human_pass_claimed"])
        self.assertEqual(result["runtime_expansion_7_plus"], "BLOCKED")

    def test_candidate_thresholds_produce_promising_without_release_claim(self) -> None:
        module = self._module()
        result = module.analyze(self._base_session())
        self.assertEqual(result["classification"], "PROMISING")
        self.assertAlmostEqual(result["stage1"]["first_attempt_correct_accept_rate"], 122 / 144)
        self.assertAlmostEqual(result["stage1"]["one_retry_inclusive_correct_rate"], 140 / 144)
        self.assertAlmostEqual(result["stage1"]["semantic_identification_rate"], 136 / 144)
        self.assertEqual(result["stage1"]["median_fatigue_24"], 3.0)
        self.assertFalse(result["human_pass_claimed"])
        self.assertEqual(result["full_vertical_slice_representativeness"], "NOT_RUN")
        self.assertFalse(result["merge_authorized"])

    def test_below_candidate_thresholds_without_hard_stop_is_tune(self) -> None:
        module = self._module()
        session = self._base_session()
        session["stage1"]["first_attempt_correct_accept_count"] = 104
        session["stage1"]["one_retry_inclusive_correct_count"] = 132
        session["stage2"]["participants_explaining_intent_before_commit"] = 4
        session["stage2"]["participants_selecting_explicit_source"] = 4
        session["stage2"]["participants_explaining_consequence"] = 4
        result = module.analyze(session)
        self.assertEqual(result["classification"], "TUNE")
        self.assertGreater(len(result["tune_findings"]), 0)
        self.assertFalse(result["human_pass_claimed"])

    def test_structural_comprehension_failure_is_rework(self) -> None:
        module = self._module()
        session = self._base_session()
        session["stage2"]["participants_explaining_intent_before_commit"] = 2
        session["stage2"]["participants_selecting_explicit_source"] = 2
        session["stage2"]["participants_explaining_consequence"] = 1
        result = module.analyze(session)
        self.assertEqual(result["classification"], "REWORK")
        self.assertGreater(len(result["rework_findings"]), 0)

    def test_pii_and_unapproved_runtime_glyphs_are_rejected(self) -> None:
        module = self._module()
        session = self._base_session()
        session["email"] = "participant@example.com"
        with self.assertRaisesRegex(ValueError, "forbidden personal identifier key"):
            module.analyze(session)

        session = self._base_session()
        session["runtime_glyph_ids"] = GLYPHS + ["SEVENTH"]
        with self.assertRaisesRegex(ValueError, "exact approved runtime glyph set"):
            module.analyze(session)


if __name__ == "__main__":
    unittest.main()
