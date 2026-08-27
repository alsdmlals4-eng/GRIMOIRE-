from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REVERIFY = ROOT / "docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md"
SYNC34 = ROOT / "docs/planning/sync/GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC.md"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
]
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"

MAIN = "026230d3a91687cd4c6df0bb629eabaeb17c767c"
BASELINE = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
PARENT_GATE = "TASK8_PR_PREP_REVERIFY_PENDING"
LOCAL_GATE = "TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED"
PRODUCT_COMMIT = "68211069eb3b778fb43e68f3fbd049c8a0ac2733"
PRODUCT_BRANCH = "codex/task8-spell-use-reconcile-v320-20260827"
PRODUCT_PR = "190"


class Task8RemoteLocalReverifyTests(unittest.TestCase):
    def test_reverify_receipt_records_remote_and_commit_facts(self) -> None:
        self.assertTrue(REVERIFY.is_file())
        text = REVERIFY.read_text(encoding="utf-8")
        for token in (
            MAIN,
            BASELINE,
            "LOCAL_GIT_HEAD_BASELINE_NOT_PRODUCT_COMMIT",
            "TASK8_PRODUCT_COMMIT_NONE",
            "TASK8_REMOTE_PRODUCT_BRANCH_NOT_PRESENT",
            "TASK8_REMOTE_PRODUCT_PR_NONE",
            "UNMERGED_LOCAL_WORKTREE_DELTA",
            "NO_STAGE_COMMIT_PUSH_DURING_HANDOFF",
            "REMOTE_TASK8_BRANCH_SCAN_NO_SPELL_USE_SCREEN_PRODUCT_FILE",
            PARENT_GATE,
            LOCAL_GATE,
            "HUMAN_NOT_RUN",
            "DEVICE_NOT_RUN",
            "PERFORMANCE_NOT_RUN",
            "FULL_VERTICAL_SLICE_NOT_RUN",
        ):
            self.assertIn(token, text)

    def test_current_overlay_consumers_distinguish_baseline_head_from_product_delta(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn(PARENT_GATE, text, str(path))
            self.assertIn(LOCAL_GATE, text, str(path))
            self.assertIn(f"task8_local_git_head_baseline: {BASELINE}", text, str(path))
            self.assertIn(f"task8_product_commit: {PRODUCT_COMMIT}", text, str(path))
            self.assertIn(f"task8_remote_product_branch: {PRODUCT_BRANCH}", text, str(path))
            self.assertIn(f"task8_remote_product_pr: {PRODUCT_PR}", text, str(path))
            self.assertNotIn("product_head_local_historical:", text, str(path))

    def test_unresolved_owner_preserves_sync21_parent_gate_and_history(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        for token in (
            PARENT_GATE,
            "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING",
            "TASK8_RECEIPT_HERA_REVIEW_PR",
            "GR-SYNC-20260812-21-TASK8-HANDOFF-BCP",
            "merge_state: UNMERGED_LOCAL_WORK",
        ):
            self.assertIn(token, text)

    def test_sync34_is_closed_on_merged_main_and_notion_readback(self) -> None:
        text = SYNC34.read_text(encoding="utf-8")
        for token in (
            "status: SYNCED_TO_MAIN_AND_NOTION_READBACK",
            "pull_request: 152",
            f"merged_main: {MAIN}",
            "project_home_readback: PASS",
            "visual_work_master_readback: PASS",
            "google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL",
        ):
            self.assertIn(token, text)
        self.assertNotIn("GREEN_CANDIDATE_FINAL_EVIDENCE_REVERIFY_PENDING", text)

    def test_historical_sync21_remains_unmodified_product_provenance(self) -> None:
        sync21 = (ROOT / "docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md").read_text(encoding="utf-8")
        for token in (
            f"local_product_head: {BASELINE}",
            "remote_product_branch_at_handoff: NOT_PRESENT",
            "product_pr_at_handoff: NONE",
            "product_merge_state: UNMERGED_LOCAL_WORK",
            "handoff_mutation_boundary: NO_STAGE_COMMIT_PUSH_DURING_HANDOFF",
        ):
            self.assertIn(token, sync21)


if __name__ == "__main__":
    unittest.main()
