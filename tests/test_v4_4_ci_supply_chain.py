from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
WORKFLOWS = [
    ROOT / ".github/workflows/validate-gut-formal-adoption.yml",
    ROOT / ".github/workflows/validate-godot-authoring-gut-authority.yml",
]
GUT_WORKFLOW = WORKFLOWS[0]
CHECKOUT_SHA = "11d5960a326750d5838078e36cf38b85af677262"
SETUP_PYTHON_SHA = "a26af69be951a213d495a4c3e4e4022e16d87065"


class V44CiSupplyChainTests(unittest.TestCase):
    def test_changed_authority_workflows_pin_actions_to_verified_full_commit_shas(self) -> None:
        for workflow in WORKFLOWS:
            text = workflow.read_text(encoding="utf-8")
            self.assertIn(f"actions/checkout@{CHECKOUT_SHA}", text, str(workflow))
            self.assertIn(f"actions/setup-python@{SETUP_PYTHON_SHA}", text, str(workflow))
            self.assertNotRegex(text, r"uses:\s+actions/checkout@v\d+")
            self.assertNotRegex(text, r"uses:\s+actions/setup-python@v\d+")
            self.assertIn("permissions:\n  contents: read", text, str(workflow))
            self.assertNotIn("pull_request_target:", text, str(workflow))

    def test_gut_workflow_keeps_minimum_permissions(self) -> None:
        text = GUT_WORKFLOW.read_text(encoding="utf-8")
        self.assertIn("permissions:\n  contents: read", text)
        self.assertNotIn("pull_request_target:", text)


if __name__ == "__main__":
    unittest.main()