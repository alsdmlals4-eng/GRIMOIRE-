from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
DECISIONS = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
ACTIVE = ROOT / "docs/ACTIVE_CONTEXT.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
SYNC = "GR-SYNC-20260809-02-HIGODOT-V313-LIVE-PLUGIN-APPROVAL"
PR96_MAIN = "8422b1f506476117c876f909f986f08b94c5a543"
BASE_MAIN = "2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b"
TRACKED_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
LIVE_V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"


class HiGodotV313PostMergeCanonSyncTests(unittest.TestCase):
    def test_authority_promotes_pr96_sheet_readback(self) -> None:
        data = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(PR96_MAIN, data["current_tool_state_merged_main"])
        self.assertEqual(SYNC, data["sheet_sync"]["current_tool_sync_id"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", data["sheet_sync"]["higodot_v3_1_3_live_sync"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", data["sheet_sync"]["gut_hera_live_plugin_sync"])
        self.assertEqual(BASE_MAIN, data["base_policy_observation"]["latest_main_observed"])

    def test_canon_records_live_vs_tracked_state_without_rewriting_history(self) -> None:
        data = json.loads(CANON.read_text(encoding="utf-8"))
        self.assertEqual(BASE_MAIN, data["base"]["latest_main_observed"])
        tool = data["tool_authority"]
        self.assertEqual(DECISION, tool["decision_id"])
        self.assertEqual(SYNC, tool["live_tool_state_sync_id"])
        self.assertEqual(PR96_MAIN, tool["live_tool_state_merged_main"])
        self.assertEqual("SHEET_WRITE_READBACK_PASS", tool["live_tool_state_sheet_sync"])
        self.assertEqual("v3.1.2", tool["higodot"]["release"])
        self.assertEqual(TRACKED_TREE, tool["higodot"]["project_plugin_subtree"])
        self.assertEqual("v3.1.3", tool["higodot"]["live_release"])
        self.assertEqual(LIVE_V313_TREE, tool["higodot"]["live_v3_1_3"]["official_plugin_subtree"])
        self.assertFalse(tool["higodot"]["live_v3_1_3"]["tracked_vendor_synced"])
        self.assertEqual("USER_CONFIRMED_ENABLED", tool["gut"]["live_editor_plugin_state"])
        self.assertEqual("USER_CONFIRMED_ENABLED", tool["hera"]["live_editor_plugin_state"])
        self.assertEqual("GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK", tool["tracked_project_godot_editor_plugins"])

    def test_current_decision_surfaces_record_merged_main_and_sheet_pass(self) -> None:
        decisions = DECISIONS.read_text(encoding="utf-8")
        active = ACTIVE.read_text(encoding="utf-8")
        for text in (decisions, active):
            self.assertIn(SYNC, text)
            self.assertIn(PR96_MAIN, text)
            self.assertIn("SHEET_WRITE_READBACK_PASS", text)
            self.assertIn("v3.1.2", text)
            self.assertIn("v3.1.3", text)
            self.assertIn("NOT_SYNCED_NOT_CLAIMED", text)
            self.assertIn("USER_CONFIRMED_ENABLED", text)
        self.assertIn(BASE_MAIN, decisions)
        self.assertIn(BASE_MAIN, active)


if __name__ == "__main__":
    unittest.main()
