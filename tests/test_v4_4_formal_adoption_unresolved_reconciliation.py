from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"


class V44FormalAdoptionUnresolvedReconciliationTests(unittest.TestCase):
    def test_current_unresolved_is_v4_4_merged_main_and_closes_resolved_gut_blockers(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        self.assertIn('contract_version: "4.4"', text)
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text)
        self.assertIn(MERGED_MAIN, text)
        self.assertIn("formal_adoption_scope: MERGED_MAIN_VERIFIED", text)
        self.assertIn("GUT_FORMALLY_ADOPTED", text)
        self.assertIn("GUT_PUBLIC_STANDARD_GITHUB_ACTIONS_PASS", text)
        self.assertIn("ROLE_SEPARATED_REVIEW_P0_P1_ZERO", text)
        self.assertIn("PR85_MERGED_MAIN_VERIFIED", text)
        for stale in (
            "GUT_ADOPTION_SPEC_NOT_MERGED", "GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_NOT_RUN",
            "GUT_ACTUAL_CONSUMPTION_NOT_ENABLED", "GUT_CI_NOT_ENABLED",
            "HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED",
            "GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED",
            "LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN", "GPT_ROLE_SEPARATED_REVIEW_NOT_COMPLETE",
            "BLOCKED_BY_GUT_ADOPTION_SPEC",
        ):
            self.assertNotIn(stale, text)

    def test_remaining_broader_project_blockers_and_post_implementation_acceptance_are_explicit(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "AUDIO_VAULT_PATH_UNVERIFIED", "AUDIO_RIGHTS_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN", "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(blocker, text)
        self.assertIn(SHARED_CORE_PASS, text)
        self.assertIn(THREE_SCREEN_PENDING, text)
        self.assertIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE", text)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", text)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", text)
        self.assertNotIn("HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", text)
        self.assertIn("HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY", text)
        self.assertNotIn("CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE", text)
        self.assertIn("REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS", text)
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", text)
        self.assertIn(HERA_PASS, text)
        self.assertIn("spell_workflow_task2_authorized: false", text)
        self.assertIn("spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING", text)


if __name__ == "__main__":
    unittest.main()
