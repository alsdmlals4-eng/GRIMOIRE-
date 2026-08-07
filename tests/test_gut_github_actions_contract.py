from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
WRAPPER = ROOT / "tools/run_gut_actions_validation.py"
ACTIVE_DECISION = ROOT / "docs/decisions/DEC-GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01.md"
OLD_DECISION = ROOT / "docs/decisions/DEC-GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01.md"


class GutGithubActionsContractTests(unittest.TestCase):
    def test_standard_runner_matrix_and_exact_head_checkout(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        for marker in (
            "windows-py311",
            "windows-py312",
            "windows-py313",
            "ubuntu-py312",
            "windows-latest",
            "ubuntu-latest",
            "github.event.pull_request.head.sha",
            "python -m tools.run_gut_actions_validation",
            "GUT Validation Gate",
        ):
            self.assertIn(marker, text)

    def test_workflow_excludes_paid_or_persistent_execution_features(self) -> None:
        text = WORKFLOW.read_text(encoding="utf-8")
        for forbidden in (
            "self-hosted",
            "upload-artifact",
            "actions/cache",
            "larger-runner",
            "wsl.exe",
        ):
            self.assertNotIn(forbidden, text)

    def test_actions_wrapper_uses_active_decision(self) -> None:
        text = WRAPPER.read_text(encoding="utf-8")
        self.assertIn("GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01", text)
        self.assertIn("run_local_gut_validation", text)

    def test_decision_supersession_is_explicit(self) -> None:
        active = ACTIVE_DECISION.read_text(encoding="utf-8")
        old = OLD_DECISION.read_text(encoding="utf-8")
        self.assertIn("status: USER_APPROVED_ACTIVE", active)
        self.assertIn("GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01", active)
        self.assertIn("status: SUPERSEDED", old)
        self.assertIn("GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01", old)


if __name__ == "__main__":
    unittest.main()
