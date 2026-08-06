from __future__ import annotations

import unittest

from tools.audit_gut_vendor import CRITICAL_RUNTIME_PATHS, compare_manifests


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


if __name__ == "__main__":
    unittest.main()
