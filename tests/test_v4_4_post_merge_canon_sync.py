from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]


class V44PostMergeCanonSyncTests(unittest.TestCase):
    def test_authority_state_records_pr85_merged_main_formal_adoption(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", data["contract"]["version"])
        self.assertEqual("ACTIVE_MERGED_MAIN", data["contract"]["status"])
        self.assertEqual(MERGED_MAIN, data["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", data["status"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", data["gut"]["current_consumption"])
        self.assertEqual("MERGED_MAIN_VERIFIED", data["gut"]["implementation_branch_status"])
        self.assertEqual("PASS", data["gut"]["legacy_coverage_parity"])
        self.assertEqual("PASS", data["gut"]["product_mutation_hash_gate"])
        self.assertEqual("PASS", data["gut"]["junit"])
        self.assertEqual("IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE", data["higodot"]["authoring_receipt_gate"])
        self.assertTrue(data["claims"]["gut_formally_adopted"])
        self.assertTrue(data["claims"]["gut_runtime_ci_pass"])
        self.assertTrue(data["claims"]["higodot_receipt_gate_implemented"])
        self.assertTrue(data["claims"]["gut_github_actions_pass"])
        self.assertFalse(data["claims"]["spell_workflow_task2_authorized"])

    def test_current_cold_start_docs_point_to_v4_4_merged_state(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("v4.4", text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn(MERGED_MAIN, text, str(path))
            self.assertIn("GUT_FORMALLY_ADOPTED", text, str(path))
            self.assertIn("spell_workflow_task2_authorized: false", text, str(path))
            self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", text, str(path))

    def test_broader_blockers_are_preserved_after_formal_adoption(self) -> None:
        text = (ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md").read_text(encoding="utf-8")
        for blocker in (
            "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2",
            "HERA_CLI_ADDON_PAIR_UNVERIFIED",
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED",
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
            "CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE",
        ):
            self.assertIn(blocker, text)


if __name__ == "__main__":
    unittest.main()
