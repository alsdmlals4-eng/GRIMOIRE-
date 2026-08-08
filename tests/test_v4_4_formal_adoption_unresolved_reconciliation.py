from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"


class V44FormalAdoptionUnresolvedReconciliationTests(unittest.TestCase):
    def test_current_unresolved_is_v4_4_merged_main_and_closes_resolved_gut_blockers(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        self.assertIn('contract_version: "4.4"', text)
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text)
        self.assertIn(MERGED_MAIN, text)
        self.assertIn("formal_adoption_scope: MERGED_MAIN_VERIFIED", text)
        self.assertIn("GUT_FORMALLY_ADOPTED", text)
        for stale in (
            "GUT_ADOPTION_SPEC_NOT_MERGED", "GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_NOT_RUN",
            "GUT_ACTUAL_CONSUMPTION_NOT_ENABLED", "GUT_CI_NOT_ENABLED",
            "HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED",
            "GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED",
            "LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN", "GPT_ROLE_SEPARATED_REVIEW_NOT_COMPLETE",
            "BLOCKED_BY_GUT_ADOPTION_SPEC",
        ):
            self.assertNotIn(stale, text)

    def test_remaining_broader_project_blockers_are_explicit_and_task2_stays_blocked(self) -> None:
        text = UNRESOLVED.read_text(encoding="utf-8")
        for blocker in (
            "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", "HERA_CLI_ADDON_PAIR_UNVERIFIED",
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", "AUDIO_VAULT_PATH_UNVERIFIED",
            "AUDIO_RIGHTS_UNVERIFIED", "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(blocker, text)
        self.assertNotIn("CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE", text)
        self.assertIn("REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS", text)
        self.assertIn("spell_workflow_task2_authorized: false", text)


if __name__ == "__main__":
    unittest.main()
