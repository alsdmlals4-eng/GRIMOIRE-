from __future__ import annotations

import json
import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADAPTER = ROOT / "skills/PROJECT_BASE_ADAPTER.json"
SKILL = "orchestrating-deepseek-worktrees"


def load() -> dict:
    return json.loads(ADAPTER.read_text(encoding="utf-8"))


class BaseSharedExternalAIAdapterTests(unittest.TestCase):
    def test_current_base_identity_is_v943(self) -> None:
        data = load(); release = data["base_release"]
        self.assertEqual("9.4.3", release["version"])
        self.assertEqual("7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8", release["release_commit"])
        self.assertEqual("da33a350d61b8adc52df97fccc7001708a933370", release["release_evidence_commit"])
        self.assertEqual("0b7c94f38d959efc0fc9442274c60b2e268a3c97", release["finalization_commit"])
        self.assertEqual("693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59", release["registry_sha256"])

    def test_external_ai_remains_v941_boundary_without_freezing_project_maturity(self) -> None:
        data = load(); active = {r["skill_id"] for r in data["routing"]["base_routes"] if r.get("status") == "ACTIVE"}
        self.assertIn(SKILL, active); self.assertFalse((ROOT / f"skills/{SKILL}/SKILL.md").exists())
        policy = data["base_v94_contract"]["external_ai_worktree"]
        self.assertEqual(".worktrees/", policy["worktree_parent"])
        self.assertEqual("REVIEW_PENDING", policy["result_state"])
        self.assertEqual("LOCAL_REVIEW_REQUIRED_BEFORE_CANON", policy["integration_policy"])
        self.assertEqual("ADOPTED_FROM_BASE_V9_4_1", policy["base_validator_adoption"])
        self.assertEqual("base-v9.4.1.lock.json", policy["base_release_lock"])
        self.assertEqual("NOT_RUN", policy["actual_external_ai_worktree_execution"])

        # The external-AI worktree contract is a capability boundary, not a
        # permanent assertion that the project itself is still planning-only.
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", data["project"]["execution_profile"])
        self.assertEqual("PARTIAL_FOUNDATION", data["current_state"]["implementation"])
        self.assertEqual("NOT_RUN", data["current_state"]["human_validation"])

    def test_worktree_and_validation_contract(self) -> None:
        self.assertEqual(0, subprocess.run(["git", "check-ignore", "-q", ".worktrees/"], cwd=ROOT, check=False).returncode)
        self.assertEqual("REQUIRED_ON_PULL_REQUEST", load()["validation"]["base_shared_external_ai_adapter"])


if __name__ == "__main__": unittest.main()
