from __future__ import annotations

import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROBE = ROOT / "tools/task8_local_recovery_probe.ps1"
PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-22.md"
HISTORICAL_PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md"

BASELINE = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
HISTORICAL_BRANCH = "feat/task8-spell-use-screen-v2"
HISTORICAL_WORKTREE = ".worktrees/task8-spell-use-screen-v2"


def run_git(cwd: Path, *args: str) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=cwd,
        text=True,
        capture_output=True,
        check=True,
    )
    return completed.stdout.strip()


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

    def test_current_packet_routes_to_probe_without_rewriting_history(self) -> None:
        self.assertTrue(PACKET.is_file())
        self.assertTrue(HISTORICAL_PACKET.is_file())
        text = PACKET.read_text(encoding="utf-8")
        for token in (
            "TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED",
            "tools/task8_local_recovery_probe.ps1",
            "TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md",
            "HIGODOT_ONLY",
            "PR #151",
            "DO_NOT_TOUCH",
            "Do not reconstruct product files through GitHub",
        ):
            self.assertIn(token, text)

    def test_probe_finds_uncommitted_historical_worktree_without_mutating_it(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh is unavailable on this executor")

        with tempfile.TemporaryDirectory() as temporary:
            repo = Path(temporary) / "GRIMOIRE-"
            repo.mkdir()
            run_git(repo, "init", "-b", "main")
            run_git(repo, "config", "user.email", "probe@example.invalid")
            run_git(repo, "config", "user.name", "Task8 Probe Test")
            (repo / "README.md").write_text("probe fixture\n", encoding="utf-8")
            run_git(repo, "add", "README.md")
            run_git(repo, "commit", "-m", "fixture baseline")
            run_git(repo, "branch", HISTORICAL_BRANCH)

            worktree = repo / ".worktrees" / "task8-spell-use-screen-v2"
            worktree.parent.mkdir(parents=True, exist_ok=True)
            run_git(repo, "worktree", "add", str(worktree), HISTORICAL_BRANCH)

            spell_dir = worktree / "src" / "ui" / "spell_workflow"
            spell_dir.mkdir(parents=True, exist_ok=True)
            spell_file = spell_dir / "spell_use_screen.gd"
            spell_file.write_text("extends Control\n", encoding="utf-8")

            refs_before = run_git(repo, "show-ref")
            root_status_before = run_git(repo, "status", "--porcelain=v1", "--untracked-files=all")
            worktree_status_before = run_git(worktree, "status", "--porcelain=v1", "--untracked-files=all")

            completed = subprocess.run(
                [pwsh, "-NoProfile", "-NonInteractive", "-File", str(PROBE), "-Repo", str(repo)],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertEqual(0, completed.returncode, completed.stderr)
            result = json.loads(completed.stdout)

            self.assertEqual("LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED", result["interpretation"])
            self.assertGreaterEqual(result["historical_candidate_count"], 1)
            candidate = next(
                item for item in result["historical_candidates"] if item.get("branch") == HISTORICAL_BRANCH
            )
            self.assertTrue(candidate["preferred_spell_use_script_exists"])
            self.assertTrue(candidate["delta_evidence_present"])
            self.assertIn("src/ui/spell_workflow/spell_use_screen.gd", candidate["untracked_paths"])

            self.assertEqual(refs_before, run_git(repo, "show-ref"))
            self.assertEqual(
                root_status_before,
                run_git(repo, "status", "--porcelain=v1", "--untracked-files=all"),
            )
            self.assertEqual(
                worktree_status_before,
                run_git(worktree, "status", "--porcelain=v1", "--untracked-files=all"),
            )
            self.assertTrue(spell_file.is_file())


if __name__ == "__main__":
    unittest.main()
