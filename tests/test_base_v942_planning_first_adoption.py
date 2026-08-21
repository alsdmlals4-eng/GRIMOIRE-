from __future__ import annotations

import json
import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADAPTER = ROOT / "skills/PROJECT_BASE_ADAPTER.json"


def load() -> dict:
    return json.loads(ADAPTER.read_text(encoding="utf-8"))


class PlanningFirstCompatibilityTests(unittest.TestCase):
    def test_v943_preserves_planning_first_contract(self) -> None:
        data = load(); release = data["base_release"]
        self.assertEqual("9.4.3", release["version"])
        self.assertEqual("7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8", release["release_commit"])
        self.assertEqual("da33a350d61b8adc52df97fccc7001708a933370", release["release_evidence_commit"])
        self.assertEqual("0b7c94f38d959efc0fc9442274c60b2e268a3c97", release["finalization_commit"])
        self.assertEqual("693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59", release["registry_sha256"])

    def test_planning_first_contract(self) -> None:
        policy = load()["base_v94_contract"]["planning_first_grill_me"]
        self.assertEqual("docs/PLANNING_FIRST_GRILL_ME_BATCH_POLICY.md", policy["base_contract_source"])
        self.assertEqual("templates/project-operations/GRILL_ME_BATCH_CHECKPOINT.md", policy["checkpoint_template"])
        self.assertEqual("base-v9.4.3.lock.json", policy["base_release_lock"])
        self.assertEqual(10, policy["max_approved_decisions_per_batch"])
        self.assertEqual("RECOMMENDED_DEFAULT", policy["numeric_default_state"])
        self.assertEqual("GRILL_ME_REQUIRED", policy["planning_conflict_state"])
        self.assertEqual("APPROVED_PENDING_MERGE", policy["pre_merge_human_canon_state"])
        self.assertEqual("SYNCED_TO_MAIN_AND_NOTION_READBACK", policy["post_merge_human_canon_state"])
        self.assertNotIn("pre_merge_sheet_state", policy)
        self.assertNotIn("post_merge_sheet_state", policy)
        self.assertEqual("NOT_RUN", policy["actual_project_batch_execution"])

    def test_generated_views_are_current(self) -> None:
        result = subprocess.run(["python", "tools/generate_project_operating_views.py", "--check"], cwd=ROOT, capture_output=True, text=True, check=False)
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)

    def test_current_evidence_ceiling_is_preserved(self) -> None:
        data = load()
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", data["project"]["execution_profile"])
        self.assertEqual("PARTIAL_FOUNDATION", data["current_state"]["implementation"])
        self.assertEqual("OPTIONAL_EXECUTOR", data["current_state"]["codex"])
        self.assertEqual("NOT_RUN", data["current_state"]["human_validation"])
        self.assertEqual("NOT_RUN", data["current_state"]["device_validation"])
        self.assertEqual("NOT_RUN", data["current_state"]["performance_validation"])
        self.assertEqual("NOT_RUN", data["current_state"]["full_vertical_slice"])


if __name__ == "__main__": unittest.main()
