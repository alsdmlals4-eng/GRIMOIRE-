from __future__ import annotations

import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TOOL = ROOT / "tools/task8_local_candidate_preserve.ps1"
PRIMARY_BRANCH = "feat/task8-spell-use-screen-v2"
SECONDARY_BRANCH = "task8/spell-use-screen"
PRIMARY_HEAD = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
SECONDARY_HEAD = "fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f"
PRIMARY_RELATIVE = ".worktrees/task8-spell-use-screen-v2"
SECONDARY_RELATIVE = ".worktrees/task8-spell-use-screen"


def run_git(cwd: Path, *args: str) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=cwd,
        text=True,
        capture_output=True,
        check=True,
    )
    return completed.stdout.strip()


def git_path(cwd: Path, name: str) -> Path:
    raw = Path(run_git(cwd, "rev-parse", "--git-path", name))
    return raw if raw.is_absolute() else cwd / raw


def source_fingerprint(repo: Path, candidates: list[Path]) -> dict[str, object]:
    result: dict[str, object] = {
        "refs": run_git(repo, "show-ref"),
        "candidates": [],
    }
    entries: list[dict[str, object]] = []
    for candidate in candidates:
        index = git_path(candidate, "index")
        entries.append(
            {
                "branch": run_git(candidate, "branch", "--show-current"),
                "head": run_git(candidate, "rev-parse", "HEAD"),
                "status": run_git(candidate, "status", "--porcelain=v1", "--untracked-files=all"),
                "index": index.read_bytes(),
            }
        )
    result["candidates"] = entries
    return result


class Task8LocalCandidatePreservationContractTests(unittest.TestCase):
    def test_tool_contract_is_fail_closed_and_source_read_only(self) -> None:
        self.assertTrue(TOOL.is_file())
        text = TOOL.read_text(encoding="utf-8")

        for token in (
            PRIMARY_BRANCH,
            SECONDARY_BRANCH,
            PRIMARY_HEAD,
            SECONDARY_HEAD,
            PRIMARY_RELATIVE,
            SECONDARY_RELATIVE,
            "TASK8_CANDIDATES_PRESERVED",
            "source_unchanged",
            "Get-FileHash",
            "working.patch",
            "cached.patch",
            "manifest.json",
            "GIT_OPTIONAL_LOCKS",
            "core.autocrlf=false",
            "core.safecrlf=false",
        ):
            self.assertIn(token, text)

        for forbidden in (
            "git fetch",
            "git pull",
            "git checkout",
            "git switch",
            "git reset",
            "git restore",
            "git clean",
            "git stash",
            "git add",
            "git commit",
            "git merge",
            "git rebase",
            "git cherry-pick",
            "Remove-Item",
        ):
            self.assertNotIn(forbidden, text)

    def test_fixture_preservation_copies_dirty_and_untracked_bytes_without_source_mutation(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh is unavailable on this executor")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            repo = root / "GRIMOIRE-"
            backup_root = root / "backup"
            repo.mkdir()
            backup_root.mkdir()

            run_git(repo, "init", "-b", "main")
            run_git(repo, "config", "user.email", "preserve@example.invalid")
            run_git(repo, "config", "user.name", "Task8 Preserve Fixture")
            (repo / "tracked.txt").write_text("base\n", encoding="utf-8")
            run_git(repo, "add", "tracked.txt")
            run_git(repo, "commit", "-m", "fixture baseline")
            run_git(repo, "branch", PRIMARY_BRANCH)
            run_git(repo, "branch", SECONDARY_BRANCH)

            primary = repo / PRIMARY_RELATIVE
            secondary = repo / SECONDARY_RELATIVE
            primary.parent.mkdir(parents=True, exist_ok=True)
            run_git(repo, "worktree", "add", str(primary), PRIMARY_BRANCH)
            run_git(repo, "worktree", "add", str(secondary), SECONDARY_BRANCH)

            primary_head = run_git(primary, "rev-parse", "HEAD")
            secondary_head = run_git(secondary, "rev-parse", "HEAD")

            (primary / "tracked.txt").write_text("primary dirty\n", encoding="utf-8")
            primary_untracked = primary / "src" / "ui" / "spell_workflow" / "spell_use_screen.gd"
            primary_untracked.parent.mkdir(parents=True, exist_ok=True)
            primary_untracked.write_bytes(b"extends Control\n\x00task8-primary\n")

            (secondary / "tracked.txt").write_text("secondary dirty\n", encoding="utf-8")
            secondary_untracked = secondary / "src" / "ui" / "spell_workflow" / "components" / "target_selection_panel.gd"
            secondary_untracked.parent.mkdir(parents=True, exist_ok=True)
            secondary_untracked.write_bytes(b"extends Control\n\x00task8-secondary\n")

            before = source_fingerprint(repo, [primary, secondary])

            completed = subprocess.run(
                [
                    pwsh,
                    "-NoProfile",
                    "-NonInteractive",
                    "-File",
                    str(TOOL),
                    "-Repo",
                    str(repo),
                    "-DestinationRoot",
                    str(backup_root),
                    "-ExpectedPrimaryHead",
                    primary_head,
                    "-ExpectedSecondaryHead",
                    secondary_head,
                ],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertEqual(0, completed.returncode, completed.stderr)
            receipt = json.loads(completed.stdout)
            self.assertEqual("TASK8_CANDIDATES_PRESERVED", receipt["status"])
            self.assertTrue(receipt["source_unchanged"])
            self.assertEqual(2, len(receipt["candidates"]))

            snapshot_root = Path(receipt["snapshot_root"])
            self.assertTrue(snapshot_root.is_dir())
            self.assertNotEqual(repo.resolve(), snapshot_root.resolve())
            self.assertNotIn(repo.resolve(), snapshot_root.resolve().parents)

            primary_copy = snapshot_root / "primary_v2" / "files" / "src" / "ui" / "spell_workflow" / "spell_use_screen.gd"
            secondary_copy = snapshot_root / "secondary_original" / "files" / "src" / "ui" / "spell_workflow" / "components" / "target_selection_panel.gd"
            self.assertEqual(primary_untracked.read_bytes(), primary_copy.read_bytes())
            self.assertEqual(secondary_untracked.read_bytes(), secondary_copy.read_bytes())
            self.assertEqual(b"primary dirty\n", (snapshot_root / "primary_v2" / "files" / "tracked.txt").read_bytes())
            self.assertEqual(b"secondary dirty\n", (snapshot_root / "secondary_original" / "files" / "tracked.txt").read_bytes())

            for role in ("primary_v2", "secondary_original"):
                self.assertTrue((snapshot_root / role / "manifest.json").is_file())
                self.assertTrue((snapshot_root / role / "working.patch").is_file())
                self.assertTrue((snapshot_root / role / "cached.patch").is_file())

            after = source_fingerprint(repo, [primary, secondary])
            self.assertEqual(before, after)

    def test_destination_inside_repo_is_rejected_before_snapshot_creation(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh is unavailable on this executor")

        with tempfile.TemporaryDirectory() as temporary:
            repo = Path(temporary) / "GRIMOIRE-"
            repo.mkdir()
            run_git(repo, "init", "-b", "main")
            completed = subprocess.run(
                [pwsh, "-NoProfile", "-NonInteractive", "-File", str(TOOL), "-Repo", str(repo), "-DestinationRoot", str(repo / "backup")],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertNotEqual(0, completed.returncode)
            self.assertFalse((repo / "backup").exists())
            self.assertIn("DESTINATION_INSIDE_SOURCE", completed.stdout + completed.stderr)

    def test_wrong_candidate_identity_fails_closed(self) -> None:
        pwsh = shutil.which("pwsh")
        if pwsh is None:
            self.skipTest("pwsh is unavailable on this executor")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            repo = root / "GRIMOIRE-"
            backup_root = root / "backup"
            repo.mkdir()
            backup_root.mkdir()
            run_git(repo, "init", "-b", "main")
            run_git(repo, "config", "user.email", "preserve@example.invalid")
            run_git(repo, "config", "user.name", "Task8 Preserve Fixture")
            (repo / "tracked.txt").write_text("base\n", encoding="utf-8")
            run_git(repo, "add", "tracked.txt")
            run_git(repo, "commit", "-m", "fixture baseline")
            run_git(repo, "branch", PRIMARY_BRANCH)
            run_git(repo, "branch", SECONDARY_BRANCH)
            primary = repo / PRIMARY_RELATIVE
            secondary = repo / SECONDARY_RELATIVE
            primary.parent.mkdir(parents=True, exist_ok=True)
            run_git(repo, "worktree", "add", str(primary), PRIMARY_BRANCH)
            run_git(repo, "worktree", "add", str(secondary), SECONDARY_BRANCH)

            before = source_fingerprint(repo, [primary, secondary])
            completed = subprocess.run(
                [
                    pwsh,
                    "-NoProfile",
                    "-NonInteractive",
                    "-File",
                    str(TOOL),
                    "-Repo",
                    str(repo),
                    "-DestinationRoot",
                    str(backup_root),
                    "-ExpectedPrimaryHead",
                    "0" * 40,
                    "-ExpectedSecondaryHead",
                    run_git(secondary, "rev-parse", "HEAD"),
                ],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
            self.assertNotEqual(0, completed.returncode)
            self.assertIn("CANDIDATE_IDENTITY_MISMATCH", completed.stdout + completed.stderr)
            self.assertEqual([], list(backup_root.iterdir()))
            after = source_fingerprint(repo, [primary, secondary])
            self.assertEqual(before, after)


if __name__ == "__main__":
    unittest.main()
