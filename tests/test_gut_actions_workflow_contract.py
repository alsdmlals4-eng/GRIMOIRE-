from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
DECISION = ROOT / "docs/decisions/DEC-GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01.md"


class GutActionsWorkflowContractTests(unittest.TestCase):
    def test_workflow_and_decision_exist(self) -> None:
        self.assertTrue(WORKFLOW.is_file(), str(WORKFLOW))
        self.assertTrue(DECISION.is_file(), str(DECISION))

    def test_standard_runner_matrix_is_exact(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        for lane in (
            "windows-py311",
            "windows-py312",
            "windows-py313",
            "ubuntu-py312",
        ):
            self.assertEqual(1, text.count(f"- lane: {lane}"), lane)
        self.assertEqual(3, text.count("os: windows-latest"))
        self.assertEqual(1, text.count("os: ubuntu-latest"))
        self.assertIn("name: GUT Validation Gate", text)

    def test_paid_or_persistent_runner_features_are_absent(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8").lower()
        for forbidden in (
            "self-hosted",
            "upload-artifact",
            "actions/cache",
            "larger runner",
        ):
            self.assertNotIn(forbidden, text)

    def test_bootstrap_scope_is_pr85_only(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        self.assertIn("github.event.pull_request.number == 85", text)
        self.assertIn("types: [opened, synchronize, reopened, ready_for_review]", text)
        self.assertNotIn("\n  push:", text)
        self.assertNotIn("\n  workflow_dispatch:", text)


if __name__ == "__main__":
    unittest.main()
