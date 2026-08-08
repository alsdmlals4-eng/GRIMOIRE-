from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_3_VENDOR_INTEGRITY.json"
HIGODOT_PLUGIN = ROOT / "addons/godot_ai/plugin.cfg"
GUT_PLUGIN = ROOT / "addons/gut/plugin.cfg"
HERA_PLUGIN = ROOT / "addons/hera_agent_godot/plugin.cfg"
PROJECT = ROOT / "project.godot"
ACTIVE_CONTEXT = ROOT / "docs/ACTIVE_CONTEXT.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
UPSTREAM_TAG_COMMIT = "22678e5f9b038d7203d6b43b0aae20a5417c500e"
UPSTREAM_ROOT_TREE = "053131dbd726ebd492824cea9488ffeae3f2645b"
UPSTREAM_PLUGIN_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
TRACKED_PLUGIN_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
BASE_MAIN = "2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b"


class HiGodotV313ToolAuthoritySyncTests(unittest.TestCase):
    def test_tracked_versions_and_live_approval_are_not_conflated(self) -> None:
        self.assertIn('version="3.1.2"', HIGODOT_PLUGIN.read_text(encoding="utf-8"))
        self.assertIn('version="9.7.1"', GUT_PLUGIN.read_text(encoding="utf-8"))
        self.assertIn('version="1.0.0"', HERA_PLUGIN.read_text(encoding="utf-8"))

    def test_v313_evidence_records_live_version_and_tracked_vendor_divergence(self) -> None:
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual("v3.1.3", data["release"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["official_tag_commit"])
        self.assertEqual(UPSTREAM_ROOT_TREE, data["official_repository_tree"])
        self.assertEqual(UPSTREAM_PLUGIN_TREE, data["official_plugin_subtree"])
        self.assertEqual(TRACKED_PLUGIN_TREE, data["project_plugin_subtree"])
        self.assertEqual("3.1.3", data["official_plugin_cfg_version"])
        self.assertEqual("3.1.2", data["project_plugin_cfg_version"])
        self.assertEqual("COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE", data["comparison_scope_rule"])
        self.assertEqual("LIVE_VERSION_CONFIRMED_TRACKED_VENDOR_DIVERGENCE", data["result"])
        self.assertFalse(data["claims"]["official_and_project_plugin_subtree_identical"])
        self.assertTrue(data["claims"]["live_mcp_reports_v3_1_3"])
        self.assertFalse(data["claims"]["tracked_github_vendor_is_v3_1_3"])

    def test_current_authority_records_live_v313_without_rewriting_tracked_v312(self) -> None:
        data = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(
            "LIVE_HIGODOT_V3_1_3_TRACKED_V3_1_2_DIVERGENCE_RECORDED",
            data["current_tool_sync_status"],
        )
        self.assertEqual("v3.1.2", data["higodot"]["release_tag"])
        self.assertEqual("3.1.2", data["higodot"]["bundled_version"])
        self.assertEqual(TRACKED_PLUGIN_TREE, data["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(TRACKED_PLUGIN_TREE, data["higodot"]["project_vendor_tree_sha"])
        self.assertEqual("v3.1.3", data["higodot"]["live_release_tag"])
        self.assertEqual("PASS_V3_1_3", data["higodot"]["live_version_readback"])
        self.assertFalse(data["higodot"]["tracked_version_matches_live"])
        live = data["higodot"]["live_v3_1_3"]
        self.assertEqual(UPSTREAM_TAG_COMMIT, live["official_tag_commit"])
        self.assertEqual(UPSTREAM_ROOT_TREE, live["official_repository_tree"])
        self.assertEqual(UPSTREAM_PLUGIN_TREE, live["official_plugin_subtree"])
        self.assertEqual(TRACKED_PLUGIN_TREE, live["project_tracked_plugin_subtree"])
        self.assertEqual("LIVE_VERSION_CONFIRMED_TRACKED_VENDOR_DIVERGENCE", live["status"])
        self.assertEqual(BASE_MAIN, data["base_policy_observation"]["latest_main_observed"])
        self.assertTrue(data["gut"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["gut"]["live_editor_plugin_state"])
        self.assertTrue(data["hera"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["hera"]["live_editor_plugin_state"])
        self.assertEqual(
            "GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK",
            data["tracked_project_godot_editor_plugins"],
        )
        self.assertTrue(data["claims"]["higodot_live_v3_1_3_version_readback_pass"])
        self.assertFalse(data["claims"]["higodot_tracked_v3_1_3_vendor_sync"])

    def test_tracked_project_config_divergence_is_not_hidden(self) -> None:
        text = PROJECT.read_text(encoding="utf-8")
        self.assertIn('enabled=PackedStringArray("res://addons/godot_ai/plugin.cfg")', text)
        self.assertNotIn("res://addons/gut/plugin.cfg", text)
        self.assertNotIn("res://addons/hera_agent_godot/plugin.cfg", text)
        context = ACTIVE_CONTEXT.read_text(encoding="utf-8")
        self.assertIn("higodot_tracked_release: v3.1.2", context)
        self.assertIn("higodot_live_release: v3.1.3", context)
        self.assertIn("higodot_live_v3_1_3_tracked_vendor_sync: NOT_SYNCED_NOT_CLAIMED", context)
        self.assertIn("live_gut_plugin: USER_CONFIRMED_ENABLED", context)
        self.assertIn("live_hera_plugin: USER_CONFIRMED_ENABLED", context)
        self.assertIn("tracked_project_godot_editor_plugins: GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK", context)


if __name__ == "__main__":
    unittest.main()
