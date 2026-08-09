from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_3_VENDOR_INTEGRITY.json"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION.md"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
SYNC_ID = "GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION"
CURRENT_MAIN = "71ba449b13f8759d8f211ef88bb249bfda683e37"
UPSTREAM_COMMIT = "22678e5f9b038d7203d6b43b0aae20a5417c500e"
V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
LOCAL_TOOL_COMMIT = "1337e267d29b00c039039e7197863e2f4f78957d"
RECEIPT_LIMIT = "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT"
TASK2_CURRENT = "TASK2_MERGED_MAIN_VERIFIED"
TASK2_EXECUTION = "MERGED_MAIN_VERIFIED"


class HiGodotV313TrackedReconciliationTests(unittest.TestCase):
    def test_tracked_godot_files_reflect_current_user_local_tool_state(self) -> None:
        plugin = (ROOT / "addons/godot_ai/plugin.cfg").read_text(encoding="utf-8")
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        self.assertIn('version="3.1.3"', plugin)
        for token in (
            'res://addons/godot_ai/plugin.cfg',
            'res://addons/gut/plugin.cfg',
            'res://addons/hera_agent_godot/plugin.cfg',
            'HeraGameInspector=',
        ):
            self.assertIn(token, project)

    def test_current_authority_state_promotes_tracked_v313_without_erasing_history(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual("TRACKED_HIGODOT_V3_1_3_EXACT_TREE_CONFIG_RECONCILED", data["current_tool_sync_status"])
        self.assertEqual("v3.1.3", data["higodot"]["release_tag"])
        self.assertEqual("3.1.3", data["higodot"]["bundled_version"])
        self.assertEqual(UPSTREAM_COMMIT, data["higodot"]["pinned_source_commit"])
        self.assertEqual(V313_TREE, data["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(V313_TREE, data["higodot"]["project_vendor_tree_sha"])
        self.assertTrue(data["higodot"]["tracked_version_matches_live"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["higodot"]["vendor_integrity"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", data["gut"]["tracked_editor_plugin_enablement"])
        self.assertEqual("ENABLED_AT_GITHUB_MAIN_READBACK", data["hera"]["tracked_editor_plugin_enablement"])
        self.assertEqual("GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK", data["tracked_project_godot_editor_plugins"])
        self.assertEqual(RECEIPT_LIMIT, data["higodot"]["direct_local_upgrade_receipt_status"])
        self.assertEqual(LOCAL_TOOL_COMMIT, data["higodot"]["direct_local_upgrade_commit"])
        history = data["higodot"]["historical_v3_1_2"]
        self.assertEqual("v3.1.2", history["release_tag"])
        self.assertEqual("a7d1e2fe8564cc385d683ec50d15fc66e1a17a35", history["project_vendor_tree_sha"])

    def test_v313_evidence_and_sync_record_current_tree_and_receipt_limit(self) -> None:
        evidence = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(V313_TREE, evidence["official_plugin_subtree"])
        self.assertEqual(V313_TREE, evidence["project_tracked_plugin_subtree"])
        self.assertTrue(evidence["tracked_vendor_synced"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", evidence["tracked_tree_identity"])
        self.assertEqual(CURRENT_MAIN, evidence["observed_current_main"])
        self.assertEqual(RECEIPT_LIMIT, evidence["authoring_receipt_status"])
        self.assertTrue(SYNC.is_file(), str(SYNC))
        text = SYNC.read_text(encoding="utf-8")
        for token in (DECISION, SYNC_ID, CURRENT_MAIN, V313_TREE, LOCAL_TOOL_COMMIT, RECEIPT_LIMIT):
            self.assertIn(token, text)

    def test_current_human_readable_surfaces_match_tracked_v313_state(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            for token in (
                SYNC_ID,
                "v3.1.3",
                V313_TREE,
                "GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK",
                TASK2_CURRENT,
                TASK2_EXECUTION,
                RECEIPT_LIMIT,
            ):
                self.assertIn(token, text, str(path))
            self.assertNotIn("higodot_live_v3_1_3_tracked_vendor_sync: NOT_SYNCED_NOT_CLAIMED", text, str(path))
            self.assertNotIn("spell_workflow_task2_execution_status: AUTHORIZED_HIGODOT_CHANNEL_CONFIRMED", text, str(path))


if __name__ == "__main__":
    unittest.main()
