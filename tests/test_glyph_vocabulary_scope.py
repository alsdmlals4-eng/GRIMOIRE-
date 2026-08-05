from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools" / "check_glyph_vocabulary_scope.py"
VOCABULARY = ROOT / "data" / "glyphs" / "v1" / "glyph_vocabulary_v1.json"
CONFUSION_REPORT = ROOT / "artifacts" / "foundation-poc" / "glyph-confusion-report.json"
FIXTURE_ROWS = ROOT / "artifacts" / "foundation-poc" / "glyph-fixture-rows.json"
VALIDATION_REPORT = ROOT / "docs" / "validation" / "GLYPH_RECOGNITION_POC_REPORT.md"
STOP_GATE = ROOT / "docs" / "planning" / "GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md"
SYNC_RECEIPT = ROOT / "docs" / "planning" / "sync" / "GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC.md"
EXPECTED_SLICE = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]


class GlyphVocabularyScopeTests(unittest.TestCase):
    def test_scope_checker_enforces_six_runtime_glyphs(self) -> None:
        self.assertTrue(SCRIPT.is_file(), SCRIPT)
        completed = subprocess.run(
            [sys.executable, str(SCRIPT)],
            cwd=ROOT,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)
        report = json.loads(completed.stdout)
        self.assertEqual("PASS", report["verdict"])
        self.assertEqual(20, report["semantic_entry_count"])
        self.assertEqual(10, report["main_count"])
        self.assertEqual(10, report["support_count"])
        self.assertEqual(EXPECTED_SLICE, report["runtime_glyph_ids"])
        self.assertEqual(6, report["runtime_template_count"])
        self.assertEqual(0, report["errors"])

    def test_registry_exposes_exact_runtime_set(self) -> None:
        data = json.loads(VOCABULARY.read_text(encoding="utf-8"))
        self.assertEqual(EXPECTED_SLICE, data["slice"])
        runtime = [entry["id"] for entry in data["entries"] if entry["slice_enabled"]]
        self.assertEqual(EXPECTED_SLICE, runtime)
        self.assertTrue(all(entry["ornament_is_recognition_input"] is False for entry in data["entries"]))

    def test_evidence_and_stop_gate_preserve_honest_boundaries(self) -> None:
        for path in [CONFUSION_REPORT, FIXTURE_ROWS, VALIDATION_REPORT, STOP_GATE, SYNC_RECEIPT]:
            self.assertTrue(path.is_file(), path)
        report = json.loads(CONFUSION_REPORT.read_text(encoding="utf-8"))
        rows = json.loads(FIXTURE_ROWS.read_text(encoding="utf-8"))
        self.assertEqual("GM-GLYPH-VOCABULARY-V1-01", report["decision_id"])
        self.assertEqual(EXPECTED_SLICE, report["glyph_ids"])
        self.assertEqual("ACCEPTED_RESULTS_ONLY", report["confusion_matrix_scope"])
        self.assertEqual("SYNTHETIC_FIXTURES_ONLY", report["evidence_scope"])
        self.assertEqual(0, report["false_accept_count"])
        self.assertEqual(4, report["retry_required_count"])
        self.assertEqual("NOT_RUN", report["human_comprehension"])
        self.assertEqual("NOT_RUN", report["physical_touch"])
        self.assertEqual(11, len(rows))

        stop_text = STOP_GATE.read_text(encoding="utf-8")
        receipt_text = SYNC_RECEIPT.read_text(encoding="utf-8")
        self.assertIn("EXPANSION BEYOND SIX = BLOCKED", stop_text)
        self.assertIn("HUMAN/DEVICE VALIDATION RESULT = NOT_RUN", stop_text)
        self.assertIn("GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC", receipt_text)
        self.assertIn("approval_counter: 3_of_10", receipt_text)
        self.assertIn("merge_authorized: false", receipt_text)


if __name__ == "__main__":
    unittest.main()
