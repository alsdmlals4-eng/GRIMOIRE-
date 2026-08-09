from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from tools.run_gut_actions_validation import (
    APPROVED_VENDOR_DECISION_ID,
    apply_approved_vendor_equivalence,
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

    def test_runtime_success_passes_after_approved_vendor_decision(self) -> None:
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

            return_code = apply_approved_vendor_equivalence(
                manifest_path,
                audit_path,
                official_tree="official-tree",
                actual_tree="project-tree",
                runtime_return_code=0,
            )

            data = json.loads(manifest_path.read_text(encoding="utf-8"))
            self.assertEqual(0, return_code)
            self.assertEqual("PASS", data["result"])
            self.assertEqual(
                "CRITICAL_RUNTIME_EQUIVALENCE_USER_APPROVED",
                data["vendor"]["status"],
            )
            self.assertEqual(APPROVED_VENDOR_DECISION_ID, data["vendor"]["decision_id"])
            self.assertEqual("official-tree", data["vendor"]["expected_tree"])
            self.assertEqual("project-tree", data["vendor"]["actual_tree"])
            self.assertEqual(CRITICAL_NORMALIZED_RESULT, data["vendor"]["audit_result"])
            self.assertEqual([], data["limitations"])

    def test_runtime_failure_is_preserved_after_vendor_decision(self) -> None:
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

            return_code = apply_approved_vendor_equivalence(
                manifest_path,
                audit_path,
                official_tree="official-tree",
                actual_tree="project-tree",
                runtime_return_code=1,
            )

            data = json.loads(manifest_path.read_text(encoding="utf-8"))
            self.assertEqual(1, return_code)
            self.assertEqual("FAIL", data["result"])
            self.assertEqual(
                "CRITICAL_RUNTIME_EQUIVALENCE_USER_APPROVED",
                data["vendor"]["status"],
            )
            self.assertEqual(APPROVED_VENDOR_DECISION_ID, data["vendor"]["decision_id"])
            self.assertIn("GUT_EXECUTION_FAILURE_OR_DISCOVERY_ZERO", data["limitations"])


if __name__ == "__main__":
    unittest.main()
