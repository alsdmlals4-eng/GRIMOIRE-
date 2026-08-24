from __future__ import annotations

import json
import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OBSERVATION = ROOT / "docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md"
ACTIVE = ROOT / "docs/ACTIVE_CONTEXT.md"
AGENTS = ROOT / "AGENTS.md"
START = ROOT / "START_HERE.md"
TOOL = ROOT / "tools/task8_prepare_clean_reconciliation.ps1"
PRIMARY_BRANCH = "feat/task8-spell-use-screen-v2"
PRIMARY_HEAD = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
SECONDARY_BRANCH = "task8/spell-use-screen"
SECONDARY_HEAD = "fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f"


def run_git(cwd: Path, *args: str) -> str:
    completed = subprocess.run(["git", *args], cwd=cwd, text=True, capture_output=True, check=True)
    return completed.stdout.strip()


class Task8PreservationObservedReconciliationPrepTests(unittest.TestCase):
    def test_current_authority_promotes_preservation_and_next_gate(self) -> None:
        self.assertTrue(OBSERVATION.is_file())
        observation = OBSERVATION.read_text(encoding="utf-8")
        for token in (
            "TASK8_CANDIDATES_PRESERVED",
            "source_unchanged: true",
            "source_content_unchanged: true",
            PRIMARY_BRANCH,
            PRIMARY_HEAD,
            SECONDARY_BRANCH,
            SECONDARY_HEAD,
            "C:\\GRIMOIRE-Task8-Recovery\\task8-preservation-20260824T100804144Z-e9e7eb66",
            "primary_copied_file_count: 11",
            "secondary_copied_file_count: 33",
            "TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED",
        ):
            self.assertIn(token, observation)

        for path in (ACTIVE, AGENTS, START):
            text = path.read_text(encoding="utf-8")
            self.assertIn("TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS", text)
            self.assertIn("TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED", text)
            self.assertNotIn("task8_local_delta_existence: BLOCKED_UNVERIFIED", text)

    def test_prep_tool_contract_is_fail_closed(self) -> None:
        self.assertTrue(TOOL.is_file())
        text = TOOL.read_text(encoding="utf-8")
        for token in (
            "TASK8_CLEAN_RECONCILIATION_WORKTREE_READY",
            "ExpectedMain",
            "SnapshotRoot",
            "ReconciliationPath",
            PRIMARY_BRANCH,
            PRIMARY_HEAD,
            SECONDARY_BRANCH,
            SECONDARY_HEAD,
            "git fetch",
            "worktree",
            "origin/main",
            "project.godot",
            "RECONCILIATION_PATH_INSIDE_SNAPSHOT_FORBIDDEN",
            "RECONCILIATION_LINKED_ANCESTOR_FORBIDDEN",
        ):
            self.assertIn(token, text)
        for forbidden in (
            "git pull",
            "git reset",
            "git restore",
            "git clean",
            "git stash",
            "git rebase",
            "git checkout",
            "Remove-Item",
        ):
            self.assertNotIn(forbidden, text)

    def test_reconciliation_path_inside_snapshot_is_rejected_before_manifest_read(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh unavailable")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            repo = root / "GRIMOIRE-"
            snapshot = root / "snapshot"
            repo.mkdir()
            snapshot.mkdir()
            run_git(repo, "init", "-b", "main")
            (repo / "project.godot").write_text("[application]\n", encoding="utf-8")

            completed = subprocess.run(
                [
                    pwsh, "-NoProfile", "-NonInteractive", "-File", str(TOOL),
                    "-Repo", str(repo),
                    "-SnapshotRoot", str(snapshot),
                    "-ExpectedMain", "0" * 40,
                    "-ReconciliationPath", str(snapshot / "reconcile"),
                ],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertNotEqual(0, completed.returncode)
            self.assertFalse((snapshot / "reconcile").exists())
            self.assertIn("RECONCILIATION_PATH_INSIDE_SNAPSHOT_FORBIDDEN", completed.stdout + completed.stderr)

    def test_reconciliation_path_with_linked_ancestor_is_rejected_before_manifest_read(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh unavailable")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            repo = root / "GRIMOIRE-"
            snapshot = root / "snapshot"
            repo.mkdir()
            snapshot.mkdir()
            run_git(repo, "init", "-b", "main")
            (repo / "project.godot").write_text("[application]\n", encoding="utf-8")
            alias = root / "repo-alias"
            try:
                alias.symlink_to(repo, target_is_directory=True)
            except OSError as exc:
                self.skipTest(f"symlink unavailable: {exc}")

            completed = subprocess.run(
                [
                    pwsh, "-NoProfile", "-NonInteractive", "-File", str(TOOL),
                    "-Repo", str(repo),
                    "-SnapshotRoot", str(snapshot),
                    "-ExpectedMain", "0" * 40,
                    "-ReconciliationPath", str(alias / "reconcile"),
                ],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertNotEqual(0, completed.returncode)
            self.assertFalse((repo / "reconcile").exists())
            self.assertIn("RECONCILIATION_LINKED_ANCESTOR_FORBIDDEN", completed.stdout + completed.stderr)

    def test_fixture_creates_clean_reconciliation_worktree_without_touching_historical_worktrees(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh unavailable")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            remote = root / "remote.git"
            repo = root / "GRIMOIRE-"
            reconcile = root / "reconcile"
            snapshot = root / "snapshot"
            run_git(root, "init", "--bare", str(remote))
            run_git(root, "clone", str(remote), str(repo))
            run_git(repo, "config", "user.email", "task8@example.invalid")
            run_git(repo, "config", "user.name", "Task8 Fixture")
            (repo / "project.godot").write_text("[application]\n", encoding="utf-8")
            run_git(repo, "add", "project.godot")
            run_git(repo, "commit", "-m", "fixture main")
            run_git(repo, "branch", "-M", "main")
            run_git(repo, "push", "-u", "origin", "main")
            expected_main = run_git(repo, "rev-parse", "HEAD")

            primary = repo / ".worktrees" / "task8-spell-use-screen-v2"
            secondary = repo / ".worktrees" / "task8-spell-use-screen"
            primary.parent.mkdir(parents=True, exist_ok=True)
            run_git(repo, "branch", PRIMARY_BRANCH)
            run_git(repo, "branch", SECONDARY_BRANCH)
            run_git(repo, "worktree", "add", str(primary), PRIMARY_BRANCH)
            run_git(repo, "worktree", "add", str(secondary), SECONDARY_BRANCH)
            primary_head = run_git(primary, "rev-parse", "HEAD")
            secondary_head = run_git(secondary, "rev-parse", "HEAD")

            for role, branch, head in (
                ("primary_v2", PRIMARY_BRANCH, primary_head),
                ("secondary_original", SECONDARY_BRANCH, secondary_head),
            ):
                role_root = snapshot / role
                role_root.mkdir(parents=True)
                (role_root / "manifest.json").write_text(
                    json.dumps({"role": role, "branch": branch, "head": head, "copied_files": []}),
                    encoding="utf-8",
                )

            before_primary = run_git(primary, "status", "--porcelain=v1", "--untracked-files=all")
            before_secondary = run_git(secondary, "status", "--porcelain=v1", "--untracked-files=all")

            env = os.environ.copy()
            env["CI"] = "true"
            env["TASK8_RECONCILIATION_FIXTURE"] = "1"
            completed = subprocess.run(
                [
                    pwsh, "-NoProfile", "-NonInteractive", "-File", str(TOOL),
                    "-Repo", str(repo),
                    "-SnapshotRoot", str(snapshot),
                    "-ExpectedMain", expected_main,
                    "-ReconciliationPath", str(reconcile),
                    "-FixtureIdentityOverride",
                    "-ExpectedPrimaryHead", primary_head,
                    "-ExpectedSecondaryHead", secondary_head,
                ],
                cwd=ROOT,
                env=env,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertEqual(0, completed.returncode, completed.stderr)
            receipt = json.loads(completed.stdout)
            self.assertEqual("TASK8_CLEAN_RECONCILIATION_WORKTREE_READY", receipt["status"])
            self.assertEqual(expected_main, receipt["head"])
            self.assertEqual("", run_git(reconcile, "status", "--porcelain=v1", "--untracked-files=all"))
            self.assertEqual(before_primary, run_git(primary, "status", "--porcelain=v1", "--untracked-files=all"))
            self.assertEqual(before_secondary, run_git(secondary, "status", "--porcelain=v1", "--untracked-files=all"))
            self.assertEqual(primary_head, run_git(primary, "rev-parse", "HEAD"))
            self.assertEqual(secondary_head, run_git(secondary, "rev-parse", "HEAD"))


if __name__ == "__main__":
    unittest.main()
