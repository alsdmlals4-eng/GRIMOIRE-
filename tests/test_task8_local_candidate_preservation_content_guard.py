from __future__ import annotations

import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

from tests.test_task8_local_candidate_preservation_contract import (
    PRIMARY_BRANCH,
    PRIMARY_RELATIVE,
    SECONDARY_BRANCH,
    SECONDARY_RELATIVE,
    ROOT,
    TOOL,
    fixture_env,
    run_git,
)


class Task8LocalCandidatePreservationContentGuardTests(unittest.TestCase):
    def test_tool_requires_dirty_content_digest_before_success(self) -> None:
        self.assertTrue(TOOL.is_file())
        text = TOOL.read_text(encoding="utf-8")
        for token in (
            "Get-DirtyContentDigest",
            "content_digest",
            "source_content_unchanged",
        ):
            self.assertIn(token, text)

    def test_success_receipt_and_manifests_include_content_guard(self) -> None:
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
            run_git(repo, "config", "user.name", "Task8 Content Guard Fixture")
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
            (secondary / "tracked.txt").write_text("secondary dirty\n", encoding="utf-8")
            (primary / "primary-untracked.bin").write_bytes(b"primary\x00content\n")
            (secondary / "secondary-untracked.bin").write_bytes(b"secondary\x00content\n")

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
                    "-FixtureIdentityOverride",
                    "-ExpectedPrimaryHead",
                    primary_head,
                    "-ExpectedSecondaryHead",
                    secondary_head,
                ],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
                env=fixture_env(),
            )
            self.assertEqual(0, completed.returncode, completed.stderr)
            receipt = json.loads(completed.stdout)
            self.assertTrue(receipt["source_content_unchanged"])

            snapshot_root = Path(receipt["snapshot_root"])
            for role in ("primary_v2", "secondary_original"):
                manifest = json.loads((snapshot_root / role / "manifest.json").read_text(encoding="utf-8"))
                self.assertRegex(manifest["content_digest_before"], r"^[0-9a-f]{64}$")


if __name__ == "__main__":
    unittest.main()
