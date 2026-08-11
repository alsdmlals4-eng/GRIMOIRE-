from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"
TASK2_MERGED = "TASK2_MERGED_MAIN_VERIFIED"
TASK2_MAIN = "975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0"
TASK7_MERGED = "TASK7_MERGED_MAIN_VERIFIED"
TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
TASK8_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"
LIVE_READY = "LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED"


class V44FormalAdoptionUnresolvedReconciliationTests(unittest.TestCase):
    def test_current_unresolved_is_v4_5_and_preserves_v4_4_formal_adoption_history(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        for token in (
            'contract_version: "4.5"',
            "GM-CONTRACT-V4-5-BINDING-01",
            "GM-CONTRACT-V4-4-BINDING-01",
            "HISTORICAL_SUPERSEDED_CURRENT_BINDING",
            MERGED_MAIN,
            "formal_adoption_scope: MERGED_MAIN_VERIFIED",
            "GUT_FORMALLY_ADOPTED",
            "GUT_PUBLIC_STANDARD_GITHUB_ACTIONS_PASS",
            "ROLE_SEPARATED_REVIEW_P0_P1_ZERO",
            "PR85_MERGED_MAIN_VERIFIED",
            TASK7_MERGED,
            TASK8_STATUS,
            TASK8_GATE,
            LIVE_READY,
        ):
            self.assertIn(token, text)

        for stale in (
            "GUT_ADOPTION_SPEC_NOT_MERGED",
            "GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_NOT_RUN",
            "GUT_ACTUAL_CONSUMPTION_NOT_ENABLED",
            "GUT_CI_NOT_ENABLED",
            "HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED",
            "GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED",
            "LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN",
            "GPT_ROLE_SEPARATED_REVIEW_NOT_COMPLETE",
            "BLOCKED_BY_GUT_ADOPTION_SPEC",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertNotIn(stale, text)

    def test_current_blockers_match_task8_receipt_hera_and_merge_gate(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "AUDIO_RIGHTS_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING",
            "TASK8_HERA_ACCEPTANCE_PENDING",
            "TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING",
        ):
            self.assertIn(blocker, text)

        for token in (
            SHARED_CORE_PASS,
            THREE_SCREEN_PENDING,
            "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE",
            "HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY",
            "REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS",
            HERA_PASS,
            "spell_workflow_task2_authorized: true",
            TASK2_MERGED,
            TASK2_MAIN,
            "TASK2_HIGODOT_RECEIPT_READBACK_PASS",
            TASK7_MERGED,
            TASK8_STATUS,
            TASK8_GATE,
            "HERA_LIVE_QA_AND_OBSERVABILITY_ONLY",
            "hera_source_delta_required: NONE",
        ):
            self.assertIn(token, text)

        for stale in (
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED",
            "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN",
            "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2",
            "CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE",
            "HERA_CLI_ADDON_PAIR_UNVERIFIED",
            "spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING",
            "spell_workflow_task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL",
            "spell_workflow_task2_execution_status: AUTHORIZED_HIGODOT_CHANNEL_CONFIRMED",
        ):
            self.assertNotIn(stale, text)


if __name__ == "__main__":
    unittest.main()
