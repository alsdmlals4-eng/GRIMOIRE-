from __future__ import annotations

import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROBE = ROOT / "tools/task8_local_recovery_probe.ps1"
PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md"

BASELINE = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
HISTORICAL_BRANCH = "feat/task8-spell-use-screen-v2"
HISTORICAL_WORKTREE = ".worktrees/task8-spell-use-screen-v2"


class Task8LocalRecoveryProbeContractTests(unittest.TestCase):
    def test_probe_exists_and_is_read_only_by_contract(self) -> None:
        self.assertTrue(PROBE.is_file())
        text = PROBE.read_text(encoding="utf-8")

        for required in (
            BASELINE,
            HISTORICAL_BRANCH,
            HISTORICAL_WORKTREE,
            "git worktree list --porcelain",
            "git rev-parse --show-toplevel",
            "git branch --show-current",
            "git rev-parse HEAD",
            "git status --short --branch",
            "git diff --name-status",
            "git diff --cached --name-status",
            "git ls-files --others --exclude-standard",
            "git log --oneline",
            "git diff --name-status $Baseline..HEAD",
            "spell_use_screen.gd",
            "spell_use_screen.tscn",
            "ConvertTo-Json",
        ):
            self.assertIn(required, text)

        for forbidden in (
            "git reset",
            "git restore",
            "git clean",
            "git stash",
            "git add",
            "git commit",
            "git merge",
            "git rebase",
            "git cherry-pick",
            "git checkout",
            "git switch",
            "git fetch",
            "Remove-Item",
            "Set-Content",
            "Out-File",
        ):
            self.assertNotIn(forbidden, text)

    def test_packet_routes_to_probe_without_changing_product_authority(self) -> None:
        text = PACKET.read_text(encoding="utf-8")
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", text)
        self.assertIn("tools/task8_local_recovery_probe.ps1", text)
        self.assertIn("HIGODOT_ONLY", text)
        self.assertIn("PR #151", text)
        self.assertIn("DO_NOT_TOUCH", text)
        self.assertIn("Do not reconstruct product files through GitHub", text)


if __name__ == "__main__":
    unittest.main()
