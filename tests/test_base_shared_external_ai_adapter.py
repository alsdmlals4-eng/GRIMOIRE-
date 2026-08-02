from __future__ import annotations

import json
import subprocess
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ADAPTER_PATH = ROOT / "skills/PROJECT_BASE_ADAPTER.json"
SKILL_ID = "orchestrating-deepseek-worktrees"
BASE_RELEASE_COMMIT = "3f2c4a624d302b704c1b5322eb5c9f34ad55abb9"
BASE_REGISTRY_SHA256 = "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59"


def load_adapter() -> dict:
    return json.loads(ADAPTER_PATH.read_text(encoding="utf-8"))


def active_base_routes(adapter: dict) -> set[str]:
    return {
        route["skill_id"]
        for route in adapter["routing"]["base_routes"]
        if route.get("status") == "ACTIVE"
    }


class BaseSharedExternalAIAdapterTests(unittest.TestCase):
    def test_preserves_released_base_identity(self) -> None:
        adapter = load_adapter()
        self.assertEqual("9.4.1", adapter["base_release"]["version"])
        self.assertEqual(BASE_RELEASE_COMMIT, adapter["base_release"]["release_commit"])
        self.assertEqual(BASE_REGISTRY_SHA256, adapter["base_release"]["registry_sha256"])

    def test_routes_external_ai_worktree_skill_without_copying_body(self) -> None:
        adapter = load_adapter()
        self.assertIn(SKILL_ID, active_base_routes(adapter))
        self.assertFalse((ROOT / "skills/orchestrating-deepseek-worktrees/SKILL.md").exists())

    def test_binds_planning_only_isolation_policy(self) -> None:
        adapter = load_adapter()
        override = adapter["base_v94_contract"]["external_ai_worktree"]
        self.assertEqual(".worktrees/", override["worktree_parent"])
        self.assertEqual("ai/deepseek-", override["task_branch_prefix"])
        self.assertEqual("drafts/external-ai/", override["draft_root"])
        self.assertEqual(["drafts/external-ai/**"], override["allowed_write_roots"])
        self.assertEqual("skills/PROJECT_BASE_ADAPTER.json#/protected_paths", override["protected_paths_source"])
        self.assertEqual("REVIEW_PENDING", override["result_state"])
        self.assertEqual("LOCAL_REVIEW_REQUIRED_BEFORE_CANON", override["integration_policy"])
        self.assertEqual("ADOPTED_FROM_BASE_V9_4_1", override["base_validator_adoption"])
        self.assertEqual("tools/check_external_ai_worktree_contract.py", policy.get("base_validator_path", override.get("base_validator_path") if "override" in locals() else None))
        self.assertEqual("base-v9.4.1.lock.json", policy.get("base_release_lock", override.get("base_release_lock") if "override" in locals() else None))
        self.assertEqual("NOT_RUN", policy.get("actual_external_ai_worktree_execution", override.get("actual_external_ai_worktree_execution") if "override" in locals() else None))
        self.assertEqual("PLANNING_ONLY_PROFILE", adapter["project"]["execution_profile"])
        self.assertEqual("NOT_STARTED", adapter["current_state"]["implementation"])

    def test_worktree_parent_is_ignored_by_git(self) -> None:
        result = subprocess.run(["git", "check-ignore", "-q", ".worktrees/"], cwd=ROOT, check=False)
        self.assertEqual(0, result.returncode)

    def test_project_validation_discovers_adapter_test(self) -> None:
        adapter = load_adapter()
        self.assertEqual(
            "REQUIRED_ON_PULL_REQUEST",
            adapter["validation"]["base_shared_external_ai_adapter"],
        )


if __name__ == "__main__":
    unittest.main()
