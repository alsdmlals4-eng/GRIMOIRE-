from __future__ import annotations

import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
CHECKOUT_SHA = "11d5960a326750d5838078e36cf38b85af677262"
SETUP_PYTHON_SHA = "a26af69be951a213d495a4c3e4e4022e16d87065"


class V44CiSupplyChainTests(unittest.TestCase):
    def test_gut_workflow_pins_actions_to_verified_full_commit_shas(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        self.assertIn(f"actions/checkout@{CHECKOUT_SHA}", text)
        self.assertIn(f"actions/setup-python@{SETUP_PYTHON_SHA}", text)
        self.assertNotRegex(text, r"uses:\s+actions/checkout@v\d+")
        self.assertNotRegex(text, r"uses:\s+actions/setup-python@v\d+")

    def test_gut_workflow_keeps_minimum_permissions(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        self.assertIn("permissions:\n  contents: read", text)
        self.assertNotIn("pull_request_target:", text)


if __name__ == "__main__":
    unittest.main()
