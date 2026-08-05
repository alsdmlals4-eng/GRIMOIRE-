from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools" / "check_glyph_vocabulary_scope.py"
VOCABULARY = ROOT / "data" / "glyphs" / "v1" / "glyph_vocabulary_v1.json"
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


if __name__ == "__main__":
    unittest.main()
