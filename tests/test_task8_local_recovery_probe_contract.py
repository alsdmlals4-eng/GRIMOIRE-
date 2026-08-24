from __future__ import annotations

import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROBE = ROOT / "tools/task8_local_recovery_probe.ps1"
PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-24.md"
OBSERVATION = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md"
PREVIOUS_PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-22.md"
HISTORICAL_PACKET = ROOT / "docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md"

BASELINE = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
HISTORICAL_BRANCH = "feat/task8-spell-use-screen-v2"
HISTORICAL_WORKTREE = ".worktrees/task8-spell-use-screen-v2"
BOOTSTRAP_COMMIT = "15139d80ab7112ea93e5090eece9cc145ae80f6b"
RAW_PROBE_URL = (
    "https://raw.githubusercontent.com/alsdmlals4-eng/GRIMOIRE-/"
    f"{BOOTSTRAP_COMMIT}/tools/task8_local_recovery_probe.ps1"
)


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
    path = Path(run_git(cwd, "rev-parse", "--git-path", name))
    return path if path.is_absolute() else cwd / path


class Task8LocalRecoveryProbeContractTests(unittest.TestCase):
    def test_probe_exists_and_is_read_only_by_contract(self) -> None:
        self.assertTrue(PROBE.is_file())
        text = PROBE.read_text(encoding="utf-8")

        for required in (
            BASELINE,
            HISTORICAL_BRANCH,
            HISTORICAL_WORKTREE,
            "GIT_OPTIONAL_LOCKS",
            "git worktree list --porcelain",
            "git rev-parse --show-toplevel",
            "git branch --show-current",
            "git rev-parse HEAD",
            "git status --short --branch",
            "diff --name-status",
            "diff --cached --name-status",
            "git ls-files --others --exclude-standard",
            "git log --oneline",
            '$BaselineRange = "${Baseline}..HEAD"',
            "diff --name-status $BaselineRange",
            "Normalize-CandidatePathKey",
            "core.autocrlf=false",
            "core.safecrlf=false",
            "task8_signal_paths",
            "spell_use_screen.gd",
            "spell_use_screen.tscn",
            "ConvertTo-Json",
        ):
            self.assertIn(required, text)

        for forbidden in (
            "git diff --name-status $Baseline..HEAD",
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
        self.assertTrue(PREVIOUS_PACKET.is_file())
        self.assertTrue(HISTORICAL_PACKET.is_file())
        text = PACKET.read_text(encoding="utf-8")
        for token in (
            "TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED",
            "tools/task8_local_recovery_probe.ps1",
            "TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-22.md",
            "HIGODOT_ONLY",
            "PR #151",
            "MERGED_MAIN_VERIFIED",
            "LOOP_A2_MANAGED_WORKTREE_NOT_LOCAL_DIRTY_RECOVERY",
            "DIRECT_USER_MACHINE_PROBE_REQUIRED",
            "Do not reconstruct product files through GitHub",
        ):
            self.assertIn(token, text)

        for stale in (
            "parallel_pr_151: DO_NOT_TOUCH",
            "PR #151 remains a separate Draft visual/component workstream",
        ):
            self.assertNotIn(stale, text)

    def test_current_packet_records_observed_local_task8_evidence(self) -> None:
        self.assertTrue(OBSERVATION.is_file())
        packet = PACKET.read_text(encoding="utf-8")
        observation = OBSERVATION.read_text(encoding="utf-8")

        for token in (
            "local_probe_execution: OBSERVED_EVIDENCE_FOUND_REVIEW_REQUIRED",
            "local_dirty_delta_existence: OBSERVED_PRESENT",
            "next_gate: TASK8_LOCAL_CANDIDATE_PRESERVATION_REQUIRED",
            "TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md",
        ):
            self.assertIn(token, packet)

        for token in (
            "LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED",
            "primary_candidate_branch: feat/task8-spell-use-screen-v2",
            f"primary_candidate_head: {BASELINE}",
            "secondary_candidate_branch: task8/spell-use-screen",
            "candidate_path_alias_duplication_observed: true",
            "git_diff_usage_noise_observed: true",
            "PRESERVE_BOTH_TASK8_CANDIDATES_BEFORE_SYNC",
            "HIGODOT_ONLY",
        ):
            self.assertIn(token, observation)

    def test_current_packet_supports_temp_bootstrap_without_repo_git_mutation(self) -> None:
        text = PACKET.read_text(encoding="utf-8")
        for token in (
            "TEMP_BOOTSTRAP_PREFERRED_WHEN_LOCAL_MAIN_NOT_SYNCED",
            BOOTSTRAP_COMMIT,
            RAW_PROBE_URL,
            "$env:TEMP",
            "Invoke-WebRequest",
            "Do not fetch, pull, checkout, switch, reset, restore, clean, or stash before this probe",
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
            root_index = git_path(repo, "index")
            worktree_index = git_path(worktree, "index")
            root_index_before = root_index.read_bytes()
            worktree_index_before = worktree_index.read_bytes()

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
            self.assertEqual("DISABLED_FOR_PROBE_PROCESS", result["git_optional_locks"])
            self.assertGreaterEqual(result["historical_candidate_count"], 1)
            candidate_matches = [
                item for item in result["historical_candidates"] if item.get("branch") == HISTORICAL_BRANCH
            ]
            self.assertTrue(candidate_matches, json.dumps(result, ensure_ascii=False, indent=2))
            candidate = candidate_matches[0]
            self.assertIsNone(candidate["inspection_error"])
            self.assertTrue(candidate["preferred_spell_use_script_exists"])
            self.assertTrue(candidate["delta_evidence_present"])
            self.assertIn("src/ui/spell_workflow/spell_use_screen.gd", candidate["untracked_paths"])
            self.assertTrue(candidate["task8_signal_paths"])

            normalized_candidates = [
                str(item.get("top_level") or item.get("path") or "")
                .replace("\\", "/")
                .rstrip("/")
                .casefold()
                for item in result["inspected_worktrees"]
            ]
            self.assertEqual(len(normalized_candidates), len(set(normalized_candidates)))

            self.assertEqual(refs_before, run_git(repo, "show-ref"))
            self.assertEqual(
                root_status_before,
                run_git(repo, "status", "--porcelain=v1", "--untracked-files=all"),
            )
            self.assertEqual(
                worktree_status_before,
                run_git(worktree, "status", "--porcelain=v1", "--untracked-files=all"),
            )
            self.assertEqual(root_index_before, root_index.read_bytes())
            self.assertEqual(worktree_index_before, worktree_index.read_bytes())
            self.assertTrue(spell_file.is_file())


if __name__ == "__main__":
    unittest.main()
