from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools/check_glyph_resource_scope.py"


class GlyphResourceScopeTests(unittest.TestCase):
    def test_scope_checker_accepts_only_approved_roots(self) -> None:
        self.assertTrue(SCRIPT.is_file(), SCRIPT)
        completed = subprocess.run(
            [sys.executable, str(SCRIPT)],
            cwd=ROOT,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)


if __name__ == "__main__":
    unittest.main()
