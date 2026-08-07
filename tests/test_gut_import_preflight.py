from __future__ import annotations

import unittest
from pathlib import Path

from tools.run_local_gut_validation import godot_import_command


class GutImportPreflightTests(unittest.TestCase):
    def test_headless_import_precedes_gut_class_name_consumption(self) -> None:
        root = Path("project-root")
        self.assertEqual(
            ["godot-x", "--headless", "--path", str(root), "--import"],
            godot_import_command("godot-x", root),
        )


if __name__ == "__main__":
    unittest.main()
