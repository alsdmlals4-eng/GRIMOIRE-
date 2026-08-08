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
PLUGIN_TREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
BASE_MAIN = "2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b"


class HiGodotV313ToolAuthoritySyncTests(unittest.TestCase):
    def test_tracked_plugin_versions_match_live_approved_toolset(self) -> None:
        self.assertIn('version="3.1.3"', HIGODOT_PLUGIN.read_text(encoding="utf-8"))
        self.assertIn('version="9.7.1"', GUT_PLUGIN.read_text(encoding="utf-8"))
        self.assertIn('version="1.0.0"', HERA_PLUGIN.read_text(encoding="utf-8"))

    def test_v313_vendor_integrity_evidence_is_exact_subtree_identity(self) -> None:
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual("v3.1.3", data["release"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["official_tag_commit"])
        self.assertEqual(UPSTREAM_ROOT_TREE, data["official_repository_tree"])
        self.assertEqual(PLUGIN_TREE, data["official_plugin_subtree"])
        self.assertEqual(PLUGIN_TREE, data["project_plugin_subtree"])
        self.assertEqual("COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE", data["comparison_scope_rule"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["result"])

    def test_current_authority_records_v313_and_user_approved_live_plugin_states(self) -> None:
        data = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual("v3.1.3", data["higodot"]["release_tag"])
        self.assertEqual("3.1.3", data["higodot"]["bundled_version"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["higodot"]["pinned_source_commit"])
        self.assertEqual(UPSTREAM_ROOT_TREE, data["higodot"]["official_repository_tree_sha"])
        self.assertEqual(PLUGIN_TREE, data["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(PLUGIN_TREE, data["higodot"]["project_vendor_tree_sha"])
        self.assertEqual(BASE_MAIN, data["base_policy_observation"]["latest_main_observed"])
        self.assertTrue(data["gut"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["gut"]["live_editor_plugin_state"])
        self.assertTrue(data["hera"]["user_plugin_approval"])
        self.assertEqual("USER_CONFIRMED_ENABLED", data["hera"]["live_editor_plugin_state"])
        self.assertEqual(
            "GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK",
            data["tracked_project_godot_editor_plugins"],
        )

    def test_tracked_project_config_divergence_is_not_hidden(self) -> None:
        text = PROJECT.read_text(encoding="utf-8")
        self.assertIn('enabled=PackedStringArray("res://addons/godot_ai/plugin.cfg")', text)
        self.assertNotIn("res://addons/gut/plugin.cfg", text)
        self.assertNotIn("res://addons/hera_agent_godot/plugin.cfg", text)
        context = ACTIVE_CONTEXT.read_text(encoding="utf-8")
        self.assertIn("live_gut_plugin: USER_CONFIRMED_ENABLED", context)
        self.assertIn("live_hera_plugin: USER_CONFIRMED_ENABLED", context)
        self.assertIn("tracked_project_godot_editor_plugins: GODOT_AI_ONLY_AT_GITHUB_MAIN_READBACK", context)
        self.assertIn("higodot_release: v3.1.3", context)


if __name__ == "__main__":
    unittest.main()
