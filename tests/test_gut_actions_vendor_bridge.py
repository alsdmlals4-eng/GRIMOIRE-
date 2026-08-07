from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from tools.run_gut_actions_validation import (
    APPROVAL_REQUIRED_MARKER,
    apply_pending_vendor_approval,
    normalized_audit_allows_runtime,
)


FULL_NORMALIZED_RESULT = "FULL_TREE_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL"
CRITICAL_NORMALIZED_RESULT = (
    "CRITICAL_RUNTIME_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL_FULL_TREE_MISMATCH"
)


class GutActionsVendorBridgeTests(unittest.TestCase):
    def test_only_full_or_critical_runtime_normalized_identity_allows_diagnostics(self) -> None:
        for result in (FULL_NORMALIZED_RESULT, CRITICAL_NORMALIZED_RESULT):
            self.assertTrue(normalized_audit_allows_runtime({"result": result}), result)
        for result in (
            "FULL_TREE_IDENTICAL",
            "FULL_TREE_TEXT_NORMALIZED_IDENTICAL",
            "CRITICAL_RUNTIME_SUBSET_IDENTICAL_FULL_TREE_MISMATCH",
            "FAIL",
        ):
            self.assertFalse(normalized_audit_allows_runtime({"result": result}), result)

    def test_runtime_success_remains_blocked_until_user_approval(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            manifest_path = root / "manifest.json"
            audit_path = root / "gut-vendor-audit.json"
            manifest_path.write_text(
                json.dumps({"vendor": {}, "result": "PASS", "limitations": []}),
                encoding="utf-8",
            )
            audit_path.write_text(
                json.dumps({"result": CRITICAL_NORMALIZED_RESULT}),
                encoding="utf-8",
            )

            return_code = apply_pending_vendor_approval(
                manifest_path,
                audit_path,
                official_tree="official-tree",
                actual_tree="project-tree",
                runtime_return_code=0,
            )

            data = json.loads(manifest_path.read_text(encoding="utf-8"))
            self.assertEqual(1, return_code)
            self.assertEqual("BLOCKED", data["result"])
            self.assertEqual(
                "AUDIT_EQUIVALENT_PENDING_USER_APPROVAL",
                data["vendor"]["status"],
            )
            self.assertEqual("official-tree", data["vendor"]["expected_tree"])
            self.assertEqual("project-tree", data["vendor"]["actual_tree"])
            self.assertEqual(CRITICAL_NORMALIZED_RESULT, data["vendor"]["audit_result"])
            self.assertIn(APPROVAL_REQUIRED_MARKER, data["limitations"])

    def test_runtime_failure_is_preserved_and_approval_marker_is_added(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            manifest_path = root / "manifest.json"
            audit_path = root / "gut-vendor-audit.json"
            manifest_path.write_text(
                json.dumps(
                    {
                        "vendor": {},
                        "result": "FAIL",
                        "limitations": ["GUT_EXECUTION_FAILURE_OR_DISCOVERY_ZERO"],
                    }
                ),
                encoding="utf-8",
            )
            audit_path.write_text(
                json.dumps({"result": CRITICAL_NORMALIZED_RESULT}),
                encoding="utf-8",
            )

            return_code = apply_pending_vendor_approval(
                manifest_path,
                audit_path,
                official_tree="official-tree",
                actual_tree="project-tree",
                runtime_return_code=1,
            )

            data = json.loads(manifest_path.read_text(encoding="utf-8"))
            self.assertEqual(1, return_code)
            self.assertEqual("FAIL", data["result"])
            self.assertIn("GUT_EXECUTION_FAILURE_OR_DISCOVERY_ZERO", data["limitations"])
            self.assertIn(APPROVAL_REQUIRED_MARKER, data["limitations"])


if __name__ == "__main__":
    unittest.main()
