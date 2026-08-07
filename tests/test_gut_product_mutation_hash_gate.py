from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from tools.hash_gut_protected_products import build_manifest


class GutProductMutationHashGateTests(unittest.TestCase):
    def test_manifest_changes_when_a_protected_file_changes(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            target = root / "src/example.gd"
            target.parent.mkdir(parents=True)
            target.write_text("one", encoding="utf-8")
            before = build_manifest(root)
            target.write_text("two", encoding="utf-8")
            after = build_manifest(root)
            self.assertNotEqual(before, after)

    def test_manifest_includes_serialized_godot_files_anywhere(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            target = root / "feature/example.tscn"
            target.parent.mkdir(parents=True)
            target.write_text("[gd_scene]", encoding="utf-8")
            manifest = build_manifest(root)
            self.assertIn("feature/example.tscn", manifest)

    def test_manifest_excludes_tests_and_evidence_artifacts(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            test_file = root / "tests/example.tscn"
            artifact_file = root / "artifacts/example.tres"
            test_file.parent.mkdir(parents=True)
            artifact_file.parent.mkdir(parents=True)
            test_file.write_text("test", encoding="utf-8")
            artifact_file.write_text("artifact", encoding="utf-8")
            manifest = build_manifest(root)
            self.assertEqual({}, manifest)


if __name__ == "__main__":
    unittest.main()
