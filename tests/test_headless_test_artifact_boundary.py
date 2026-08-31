from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class HeadlessTestArtifactBoundaryTests(unittest.TestCase):
    def test_glyph_recognition_runner_never_overwrites_repository_fixture(self) -> None:
        source = (ROOT / "tests/integration/test_slice_glyph_recognition.gd").read_text(encoding="utf-8")
        self.assertNotIn("OUTPUT_PATH", source)
        self.assertNotIn("FileAccess.WRITE", source)
        self.assertIn('case.assert_equal(11, rows.size(), "integration emits eleven synthetic fixture rows")', source)


if __name__ == "__main__":
    unittest.main()
