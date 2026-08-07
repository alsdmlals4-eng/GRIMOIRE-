from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from tools.audit_gut_vendor import (
    CRITICAL_RUNTIME_PATHS,
    compare_manifests,
    read_filesystem_manifest,
)


class GutVendorAuditTests(unittest.TestCase):
    def test_full_tree_identity_requires_no_missing_extra_or_changed_blobs(self) -> None:
        manifest = {path: f"sha-{index}" for index, path in enumerate(CRITICAL_RUNTIME_PATHS)}
        manifest["addons/gut/gui/example.tscn"] = "scene-sha"
        result = compare_manifests(manifest, dict(manifest))
        self.assertTrue(result["critical_runtime_all_identical"])
        self.assertTrue(result["full_tree_identical"])
        self.assertEqual([], result["missing_from_project"])
        self.assertEqual([], result["extra_in_project"])
        self.assertEqual([], result["changed_blob"])

    def test_critical_subset_can_match_while_full_tree_differs(self) -> None:
        official = {path: f"sha-{index}" for index, path in enumerate(CRITICAL_RUNTIME_PATHS)}
        project = dict(official)
        official["addons/gut/GutScene.tscn"] = "official-scene"
        project["addons/gut/GutScene.tscn"] = "project-scene"
        result = compare_manifests(official, project)
        self.assertTrue(result["critical_runtime_all_identical"])
        self.assertFalse(result["full_tree_identical"])
        self.assertEqual(["addons/gut/GutScene.tscn"], result["changed_blob"])

    def test_missing_critical_file_fails_critical_subset(self) -> None:
        official = {path: f"sha-{index}" for index, path in enumerate(CRITICAL_RUNTIME_PATHS)}
        project = dict(official)
        missing = CRITICAL_RUNTIME_PATHS[-1]
        project.pop(missing)
        result = compare_manifests(official, project)
        self.assertFalse(result["critical_runtime_all_identical"])
        self.assertEqual("MISSING_PROJECT", result["critical_runtime"][missing])

    def test_text_normalized_manifest_treats_crlf_and_lf_as_equivalent(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            official = root / "official/addons/gut/gui"
            project = root / "project/addons/gut/gui"
            official.mkdir(parents=True)
            project.mkdir(parents=True)
            (official / "GutRunner.tscn").write_bytes(b"[gd_scene]\r\n[node]\r\n")
            (project / "GutRunner.tscn").write_bytes(b"[gd_scene]\n[node]\n")
            official_manifest = read_filesystem_manifest(root / "official", normalize_text=True)
            project_manifest = read_filesystem_manifest(root / "project", normalize_text=True)
            self.assertTrue(
                compare_manifests(official_manifest, project_manifest)["full_tree_identical"]
            )

    def test_text_normalized_manifest_still_detects_semantic_change(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            official = root / "official/addons/gut"
            project = root / "project/addons/gut"
            official.mkdir(parents=True)
            project.mkdir(parents=True)
            (official / "gut_cmdln.gd").write_bytes(b"extends SceneTree\r\n")
            (project / "gut_cmdln.gd").write_bytes(b"extends Node\n")
            official_manifest = read_filesystem_manifest(root / "official", normalize_text=True)
            project_manifest = read_filesystem_manifest(root / "project", normalize_text=True)
            result = compare_manifests(official_manifest, project_manifest)
            self.assertFalse(result["full_tree_identical"])
            self.assertEqual(["addons/gut/gut_cmdln.gd"], result["changed_blob"])


if __name__ == "__main__":
    unittest.main()
