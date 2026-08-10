from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
SYNC_DOC = ROOT / "docs/planning/sync/GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
PR96_SYNC = "GR-SYNC-20260809-02-HIGODOT-V313-LIVE-PLUGIN-APPROVAL"
TRACKED_SYNC = "GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION"
PR96_MAIN = "8422b1f506476117c876f909f986f08b94c5a543"
CURRENT_BASELINE_MAIN = "71ba449b13f8759d8f211ef88bb249bfda683e37"
CURRENT_BASE_MAIN = "315c66eea9614c284b9c11c4d522141065dfa4b0"
V45_SOURCE_BASE_SNAPSHOT = "7ce3fb64fa6303c5da6c7fc27c979f7233b761ac"
HISTORICAL_V312_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"


class HiGodotV313PostMergeCanonSyncTests(unittest.TestCase):
    def test_authority_preserves_pr96_sheet_readback_as_history(self) -> None:
        data = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(PR96_SYNC, data["sheet_sync"]["prior_live_tool_sync_id"])
        self.assertEqual(PR96_MAIN, data["sheet_sync"]["prior_tool_state_merged_main"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", data["sheet_sync"]["higodot_v3_1_3_live_sync"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", data["sheet_sync"]["gut_hera_live_plugin_sync"])
        base = data["base_policy_observation"]
        self.assertEqual(CURRENT_BASE_MAIN, base["latest_main_observed"])
        self.assertEqual(V45_SOURCE_BASE_SNAPSHOT, base["source_snapshot_v4_5_r2"])
        self.assertEqual("HISTORICAL_OBSERVATION_ONLY", base["source_snapshot_role"])
        self.assertEqual("ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK", base["snapshot_policy"])

    def test_canon_promotes_tracked_v313_without_rewriting_v312_history(self) -> None:
        data = json.loads(CANON.read_text(encoding="utf-8"))
        self.assertEqual(CURRENT_BASE_MAIN, data["base"]["latest_main_observed"])
        self.assertEqual(V45_SOURCE_BASE_SNAPSHOT, data["base"]["source_snapshot_v4_5_r2"])
        self.assertEqual("HISTORICAL_OBSERVATION_ONLY", data["base"]["source_snapshot_role"])
        tool = data["tool_authority"]
        self.assertEqual(DECISION, tool["decision_id"])
        self.assertEqual(PR96_SYNC, tool["live_tool_state_sync_id"])
        self.assertEqual(TRACKED_SYNC, tool["tracked_tool_state_sync_id"])
        self.assertEqual(PR96_MAIN, tool["live_tool_state_merged_main"])
        self.assertEqual(CURRENT_BASELINE_MAIN, tool["tracked_tool_state_observed_main"])
        self.assertEqual("v3.1.3", tool["higodot"]["release"])
        self.assertEqual(V313_TREE, tool["higodot"]["project_plugin_subtree"])
        self.assertEqual(V313_TREE, tool["higodot"]["live_v3_1_3"]["official_plugin_subtree"])
        self.assertTrue(tool["higodot"]["live_v3_1_3"]["tracked_vendor_synced"])
        self.assertEqual(HISTORICAL_V312_TREE, tool["higodot"]["historical_v3_1_2"]["project_plugin_subtree"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", tool["gut"]["tracked_editor_plugin_enablement"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", tool["hera"]["tracked_editor_plugin_enablement"])
        self.assertEqual("GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK", tool["tracked_project_godot_editor_plugins"])

    def test_current_reconciliation_doc_records_receipt_limit(self) -> None:
        self.assertTrue(SYNC_DOC.is_file(), str(SYNC_DOC))
        text = SYNC_DOC.read_text(encoding="utf-8")
        for token in (
            TRACKED_SYNC,
            CURRENT_BASELINE_MAIN,
            V313_TREE,
            "PASS_EXACT_TREE_IDENTITY",
            "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
