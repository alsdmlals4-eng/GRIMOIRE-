from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools" / "build_glyph_confusion_report.py"
GLYPH_IDS = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]


class GlyphConfusionReportTests(unittest.TestCase):
    def test_report_contains_six_by_six_confusion_matrix(self) -> None:
        self.assertTrue(SCRIPT.is_file(), SCRIPT)
        rows = [
            {
                "fixture_id": "heat-positive",
                "expected": "HEAT",
                "predicted": "HEAT",
                "status": "CANDIDATE_READY",
                "top_score": 0.93,
                "second_score": 0.41,
                "elapsed_us": 320,
                "input_variant": "developer_reference",
                "confidence_threshold": 0.80,
                "margin_threshold": 0.10,
            },
            {
                "fixture_id": "heat-incomplete",
                "expected": "HEAT",
                "predicted": None,
                "status": "LOW_CONFIDENCE_REQUIRES_RETRY",
                "top_score": 0.54,
                "second_score": 0.49,
                "elapsed_us": 280,
                "input_variant": "incomplete",
                "confidence_threshold": 0.80,
                "margin_threshold": 0.10,
            },
        ]
        thresholds = {
            "schema_version": 1,
            "decision_id": "GM-GLYPH-VOCABULARY-V1-01",
            "confidence_threshold": 0.80,
            "margin_threshold": 0.10,
            "evidence_scope": "SYNTHETIC_FIXTURES_ONLY",
        }
        with tempfile.TemporaryDirectory() as temp:
            source = Path(temp) / "rows.json"
            prereg = Path(temp) / "thresholds.json"
            source.write_text(json.dumps(rows), encoding="utf-8")
            prereg.write_text(json.dumps(thresholds), encoding="utf-8")
            completed = subprocess.run(
                [sys.executable, str(SCRIPT), str(source), "--thresholds", str(prereg)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)
        report = json.loads(completed.stdout)
        self.assertEqual(GLYPH_IDS, report["glyph_ids"])
        self.assertEqual(6, len(report["confusion_matrix"]))
        for expected in GLYPH_IDS:
            self.assertEqual(GLYPH_IDS, list(report["confusion_matrix"][expected]))
        self.assertEqual("SYNTHETIC_FIXTURES_ONLY", report["evidence_scope"])
        self.assertEqual("NOT_RUN", report["human_comprehension"])
        self.assertEqual("NOT_RUN", report["physical_touch"])
        self.assertEqual(1, report["retry_required_count"])
        self.assertEqual(0, report["false_accept_count"])

    def test_unregistered_thresholds_fail(self) -> None:
        self.assertTrue(SCRIPT.is_file(), SCRIPT)
        rows = [
            {
                "fixture_id": "heat-positive",
                "expected": "HEAT",
                "predicted": "HEAT",
                "status": "CANDIDATE_READY",
                "top_score": 0.93,
                "second_score": 0.41,
                "elapsed_us": 320,
                "input_variant": "developer_reference",
                "confidence_threshold": 0.75,
                "margin_threshold": 0.10,
            }
        ]
        thresholds = {
            "schema_version": 1,
            "decision_id": "GM-GLYPH-VOCABULARY-V1-01",
            "confidence_threshold": 0.80,
            "margin_threshold": 0.10,
            "evidence_scope": "SYNTHETIC_FIXTURES_ONLY",
        }
        with tempfile.TemporaryDirectory() as temp:
            source = Path(temp) / "rows.json"
            prereg = Path(temp) / "thresholds.json"
            source.write_text(json.dumps(rows), encoding="utf-8")
            prereg.write_text(json.dumps(thresholds), encoding="utf-8")
            completed = subprocess.run(
                [sys.executable, str(SCRIPT), str(source), "--thresholds", str(prereg)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
        self.assertNotEqual(0, completed.returncode)
        self.assertIn("threshold", (completed.stdout + completed.stderr).lower())


if __name__ == "__main__":
    unittest.main()
