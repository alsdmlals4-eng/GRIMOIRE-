from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
GUT_FORMAL_ADOPTION_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
POST_MERGE_CANON_SYNC_MAIN = "ce01bb8caa5f1b224279d3fbf418eae29a88af7d"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"


class V44LiveMainReadbackSemanticsTests(unittest.TestCase):
    def test_current_docs_use_live_github_main_authority_not_a_frozen_current_sha(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK", text, str(path))
            self.assertIn(f"gut_formal_adoption_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertIn(f"post_merge_canon_sync_merge: {POST_MERGE_CANON_SYNC_MAIN}", text, str(path))
            self.assertNotIn(f"current_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))
            self.assertNotIn(f"project_main: {GUT_FORMAL_ADOPTION_MAIN}", text, str(path))

    def test_machine_state_names_historical_merge_shas_by_role(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))

        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", canon["project_main_authority"])
        self.assertNotIn("project_main", canon)
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, canon["gut_formal_adoption_main"])
        self.assertEqual(87, canon["post_merge_canon_sync"]["pull_request"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, canon["post_merge_canon_sync"]["merge_commit"])

        work = grill["current_work"]
        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", work["project_main_authority"])
        self.assertNotIn("project_main", work)
        self.assertEqual(GUT_FORMAL_ADOPTION_MAIN, work["gut_formal_adoption_main"])
        self.assertEqual(87, work["post_merge_canon_sync_pr"])
        self.assertEqual(POST_MERGE_CANON_SYNC_MAIN, work["post_merge_canon_sync_merge"])

    def test_protected_decisions_and_broader_blockers_remain_unchanged(self) -> None:
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_DOCS)
        for token in (
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01",
            "FIVE_POINT_STAR",
            "GUT_FORMALLY_ADOPTED",
            "spell_workflow_task2_authorized: false",
            "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2",
            "HERA_CLI_ADDON_PAIR_UNVERIFIED",
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(token, combined)


if __name__ == "__main__":
    unittest.main()
