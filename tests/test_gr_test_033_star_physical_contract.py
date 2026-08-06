from __future__ import annotations

import copy
import importlib.util
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_FILES = {
    "docs/superpowers/specs/2026-08-06-star-circuit-physical-validation-design.md": (
        "GR-TEST-033",
        "FIVE_POINT_STAR",
        "TYPED_GLYPH_ONLY",
        "PHYSICAL_EXECUTION_NOT_RUN",
    ),
    "docs/superpowers/plans/2026-08-06-star-circuit-physical-validation-implementation-plan.md": (
        "TEST_FIRST",
        "FIRST_ATTEMPT_POST_FEEDBACK_SEPARATED",
        "HUMAN_PASS_NOT_CLAIMED",
    ),
    "docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md": (
        "SIMPLE_ZERO_AUX",
        "MULTI_AUX",
        "TYPED_STOCK_MISMATCH",
        "FOCUS_COMPLETE",
        "FOCUS_CANCEL",
        "FROSTBLOOM_MULTI_SOLUTION",
    ),
    "docs/validation/GR_TEST_033_MODERATOR_SCRIPT.md": (
        "NO_SOLUTION_PROMPT",
        "NO_BEST_ROUTE_RECOMMENDATION",
        "NO_PARTICIPANT_RANKING",
    ),
    "docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md": (
        "ANDROID_48DP",
        "IOS_44PT",
        "TEXT_SCALE_130_PERCENT",
        "SCREEN_READER_READING_ORDER",
        "TOUCH_AND_STYLUS",
        "FINGER_OCCLUSION",
    ),
    "docs/planning/GR_TEST_033_STAR_PHYSICAL_EXECUTION_READY_GATE_2026-08-06.md": (
        "READY_FOR_PHYSICAL_EXECUTION",
        "HUMAN_NOT_RUN",
        "DEVICE_NOT_RUN",
        "PERFORMANCE_NOT_RUN",
    ),
    "docs/planning/sync/GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY.md": (
        "GR-TEST-033",
        "GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY",
        "NOT_RUN",
    ),
    "artifacts/human-validation/gr-test-033-session-template.json": (),
    "artifacts/human-validation/gr-test-033-attempt-schema.json": (),
    "artifacts/human-validation/gr-test-033-observation-schema.json": (),
    "artifacts/human-validation/gr-test-033-result-template.json": (),
    "tools/analyze_gr_test_033.py": (),
}


def load_analyzer():
    path = ROOT / "tools/analyze_gr_test_033.py"
    spec = importlib.util.spec_from_file_location("analyze_gr_test_033", path)
    if spec is None or spec.loader is None:
        raise RuntimeError("analyzer import spec unavailable")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class GrTest033StarPhysicalContractTests(unittest.TestCase):
    def read(self, path: str) -> str:
        return (ROOT / path).read_text(encoding="utf-8")

    def load_json(self, path: str):
        return json.loads(self.read(path))

    def test_required_execution_pack_exists_and_routes_to_star_runtime(self) -> None:
        for path, tokens in REQUIRED_FILES.items():
            self.assertTrue((ROOT / path).is_file(), path)
            if not (ROOT / path).is_file():
                continue
            text = self.read(path)
            for token in tokens:
                self.assertIn(token, text, f"{path}: {token}")
            if path.endswith(".md") and "GR_TEST_033" in path:
                self.assertNotIn("3×3", text)
                self.assertNotIn("UNIVERSAL_GLYPH_STOCK", text)

    def test_templates_cannot_claim_unrun_human_or_release_pass(self) -> None:
        session = self.load_json("artifacts/human-validation/gr-test-033-session-template.json")
        result = self.load_json("artifacts/human-validation/gr-test-033-result-template.json")
        self.assertEqual("GR-TEST-033", session["gate_id"])
        self.assertEqual("FIVE_POINT_STAR", session["runtime_contract"]["layout"])
        self.assertEqual("TYPED_GLYPH_ONLY", session["runtime_contract"]["stock_scope"])
        self.assertEqual("NOT_RUN", session["execution_status"])
        for payload in (session, result):
            self.assertFalse(payload["human_pass_claimed"])
            self.assertFalse(payload["release_ready_claimed"])
            self.assertFalse(payload["full_vertical_slice_claimed"])

    def test_analyzer_rejects_hash_count_mismatch_and_pii(self) -> None:
        analyzer = load_analyzer()
        attempts = {"records": [{"participant_id": "P01", "task_id": "SIMPLE_ZERO_AUX"}]}
        observations = {"records": [{"participant_id": "P01", "notes": "safe"}]}
        session = analyzer.build_session_for_records(attempts, observations)
        self.assertEqual([], analyzer.validate_payloads(session, attempts, observations))

        broken = copy.deepcopy(session)
        broken["source_attempt_sha256"] = "0" * 64
        errors = analyzer.validate_payloads(broken, attempts, observations)
        self.assertIn("SOURCE_ATTEMPT_SHA256_MISMATCH", errors)

        pii_observations = copy.deepcopy(observations)
        pii_observations["records"][0]["notes"] = "contact tester@example.com"
        errors = analyzer.validate_payloads(session, attempts, pii_observations)
        self.assertIn("PII_VALUE_DETECTED", errors)

    def test_hard_stop_and_not_run_classifications_are_fail_closed(self) -> None:
        analyzer = load_analyzer()
        attempts = {"records": []}
        observations = {"records": []}
        session = analyzer.build_session_for_records(attempts, observations)
        self.assertEqual("PENDING_NOT_RUN", analyzer.analyze(session, attempts, observations)["classification"])

        completed = copy.deepcopy(session)
        completed["execution_status"] = "COMPLETE"
        completed["hard_stops"]["MUTATION_BEFORE_COMMIT"] = 1
        result = analyzer.analyze(completed, attempts, observations)
        self.assertEqual("STOP", result["classification"])
        self.assertFalse(result["human_pass_claimed"])
        self.assertFalse(result["release_ready_claimed"])

    def test_clean_completed_evidence_remains_exploratory_not_human_pass(self) -> None:
        analyzer = load_analyzer()
        attempts = {
            "records": [
                {
                    "participant_id": "P01",
                    "task_id": "SIMPLE_ZERO_AUX",
                    "attempt_phase": "FIRST_ATTEMPT",
                    "task_completed": True,
                    "preview_understood": True,
                    "result_cause_explained": True,
                }
            ]
        }
        observations = {"records": [{"participant_id": "P01", "critical_accessibility_failure": False}]}
        session = analyzer.build_session_for_records(attempts, observations)
        session["execution_status"] = "COMPLETE"
        result = analyzer.analyze(session, attempts, observations)
        self.assertIn(result["classification"], {"PROMISING", "TUNE", "REWORK"})
        self.assertFalse(result["human_pass_claimed"])
        self.assertFalse(result["release_ready_claimed"])
        self.assertFalse(result["full_vertical_slice_claimed"])

    def test_active_authority_preserves_not_run_boundaries(self) -> None:
        combined = "\n".join(
            self.read(path)
            for path in (
                "AGENTS.md",
                "docs/ACTIVE_CONTEXT.md",
                "docs/DEVELOPMENT_GATES.md",
                "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
                "docs/planning/CANON_SYNC_STATE.json",
            )
        )
        for token in (
            "GR-TEST-033",
            "GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY",
            "HUMAN_NOT_RUN",
            "DEVICE_NOT_RUN",
            "PERFORMANCE_NOT_RUN",
            "FULL_VERTICAL_SLICE_NOT_RUN",
        ):
            self.assertIn(token, combined)


if __name__ == "__main__":
    unittest.main()
