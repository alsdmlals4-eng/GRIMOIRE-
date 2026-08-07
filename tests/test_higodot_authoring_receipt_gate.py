from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from tools.check_higodot_authoring_receipt import protected_paths


class HiGodotAuthoringReceiptGateTests(unittest.TestCase):
    def test_v4_4_protected_product_paths_are_detected(self) -> None:
        changed = [
            "docs/readme.md",
            "tests/gut/unit/test_glyph_definition.gd",
            "src/input/glyph_definition.gd",
            "scenes/main.tscn",
            "resources/theme.tres",
            "assets/icon.png",
            "ui/menu.gd",
            "project.godot",
        ]
        self.assertEqual(
            [
                "assets/icon.png",
                "project.godot",
                "resources/theme.tres",
                "scenes/main.tscn",
                "src/input/glyph_definition.gd",
                "ui/menu.gd",
            ],
            protected_paths(changed),
        )

    def test_test_and_contract_files_do_not_require_higodot_receipt(self) -> None:
        changed = [
            ".github/workflows/validate-gut-formal-adoption.yml",
            "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md",
            "tests/test_higodot_authoring_receipt_gate.py",
            "tests/gut/unit/test_glyph_definition.gd",
            "tools/check_higodot_authoring_receipt.py",
        ]
        self.assertEqual([], protected_paths(changed))

    def test_nested_scene_resource_extensions_are_always_protected(self) -> None:
        self.assertEqual(
            ["misc/a.res", "misc/b.tres", "misc/c.tscn"],
            protected_paths(["misc/c.tscn", "misc/a.res", "misc/b.tres"]),
        )


if __name__ == "__main__":
    unittest.main()
