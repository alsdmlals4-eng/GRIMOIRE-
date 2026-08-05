import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REPORT = ROOT / "docs/validation/STAGE2_CIRCUIT_BRIDGE_HARNESS_REPORT.md"
STOP_GATE = ROOT / "docs/planning/STAGE2_CIRCUIT_BRIDGE_HARNESS_STOP_GATE_01_2026-08-05.md"
FIXTURE_REPORT = ROOT / "artifacts/foundation-poc/stage2-bridge-fixture-report.json"
EVENT_SCHEMA = ROOT / "artifacts/foundation-poc/stage2-bridge-event-schema.json"
FIXTURES = ROOT / "data/testing/stage2_bridge_scenarios.json"
RUNNER = ROOT / "tests/test_runner.gd"


class Stage2HarnessImplementationContractTests(unittest.TestCase):
    def test_required_implementation_evidence_exists(self) -> None:
        for path in (REPORT, STOP_GATE, FIXTURE_REPORT, EVENT_SCHEMA):
            self.assertTrue(path.is_file(), path)

    def test_report_and_stop_gate_preserve_honest_boundary(self) -> None:
        text = REPORT.read_text(encoding="utf-8") + STOP_GATE.read_text(encoding="utf-8")
        required = (
            "STAGE2_HARNESS_AUTOMATED_PASS_HUMAN_NOT_RUN",
            "LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART",
            "HUMAN_DEVICE_VALIDATION_NOT_RUN",
            "HUMAN_END_TO_END_CORE_LOOP_NOT_RUN",
            "FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN",
            "RUNTIME_EXPANSION_7_PLUS_BLOCKED",
            "MERGE_NOT_AUTHORIZED",
            "EXACTLY_6_RUNTIME_GLYPHS",
            "28_GODOT_SUITES",
            "STRICT_RED_GREEN_REFACTOR",
        )
        for token in required:
            self.assertIn(token, text)

    def test_fixture_evidence_matches_approved_two_fixture_six_glyph_scope(self) -> None:
        fixtures = json.loads(FIXTURES.read_text(encoding="utf-8"))
        evidence = json.loads(FIXTURE_REPORT.read_text(encoding="utf-8"))
        expected = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]
        self.assertEqual(fixtures["runtime_glyph_ids"], expected)
        self.assertEqual(evidence["runtime_glyph_ids"], expected)
        self.assertEqual(evidence["runtime_glyph_count"], 6)
        self.assertEqual(evidence["fixture_count"], 2)
        self.assertEqual(
            evidence["fixture_ids"],
            [
                "SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
                "SCENARIO_B_PRESSURED_FIELD_RESPONSE",
            ],
        )
        self.assertEqual(evidence["human_execution"], "NOT_RUN")
        self.assertEqual(evidence["verdict"], "PASS")

    def test_event_schema_separates_streams_and_prohibits_raw_pii(self) -> None:
        schema = json.loads(EVENT_SCHEMA.read_text(encoding="utf-8"))
        self.assertEqual(
            schema["streams"],
            [
                "RECOGNITION_EVENT_STREAM",
                "CORE_LOOP_EVENT_STREAM",
                "MODERATOR_INTERVENTION_EVENT",
            ],
        )
        self.assertEqual(schema["participant_identity"], "ANONYMOUS_PARTICIPANT_ID_ONLY")
        self.assertTrue(schema["raw_personal_identifier_prohibited"])
        self.assertTrue(schema["event_id_deduplication_required"])
        self.assertEqual(schema["human_execution"], "NOT_RUN")

    def test_headless_runner_contains_exact_stage2_suite_inventory(self) -> None:
        text = RUNNER.read_text(encoding="utf-8")
        self.assertIn("suite_count", text)
        self.assertEqual(text.count("test_stage2_"), 9)
        self.assertIn("test_stage2_bridge_end_to_end.gd", text)


if __name__ == "__main__":
    unittest.main()
