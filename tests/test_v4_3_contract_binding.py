from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md"
SPEC = ROOT / "docs/testing/GUT_9_7_1_ADOPTION_SPEC.md"
DECISION = ROOT / "docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
PROJECT = ROOT / "project.godot"
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"


class V43ContractBindingTests(unittest.TestCase):
    def test_project_binding_remains_historical_evidence(self) -> None:
        self.assertTrue(BINDING.is_file(), str(BINDING))
        text = BINDING.read_text(encoding="utf-8")
        for token in (
            'contract_version: "4.3"', "GM-CONTRACT-V4-3-BINDING-01",
            "alsdmlals4-eng/GRIMOIRE-", "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-",
            "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM",
            "GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY",
            "C:/Users/user/Documents/GitHub/shered audio vault",
            "SWITCHY_EXPRESS_GENERIC_PLACEHOLDER_NOT_AUTHORITATIVE",
        ):
            self.assertIn(token, text)

    def test_gut_adoption_spec_keeps_v4_3_design_contract_fields(self) -> None:
        self.assertTrue(SPEC.is_file(), str(SPEC))
        text = SPEC.read_text(encoding="utf-8")
        for token in (
            'framework: "GUT"', 'version: "9.7.1"', 'canonical_repository: "bitwes/Gut"',
            'source_branch_or_release: "godot_4_7"',
            'pinned_commit_sha: "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"',
            'official_addons_gut_tree_sha: "5d6893836af4917ee62b1a395125a7530b1f239d"',
            'project_addons_gut_tree_sha_at_main_252063cc: "09d040309bbed0e07420ad72c4aa69cbd0e58190"',
            'current_vendor_integrity: MISMATCH_OFFICIAL_V9_7_1',
            'plugin_install_path: "res://addons/gut"', "minimum_discovered_test_count:",
            "production_mutation_guard:", "android_shared_core_coverage:", "removal_process:",
            "rollback_conditions:", "SPEC_ONLY_NO_INSTALLATION",
        ):
            self.assertIn(token, text)

    def test_historical_spec_is_consumed_by_current_v4_4_formal_adoption(self) -> None:
        self.assertTrue(DECISION.is_file(), str(DECISION))
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", state["contract"]["version"])
        self.assertEqual(MERGED_MAIN, state["source_main"])
        self.assertEqual("GUT_FORMALLY_ADOPTED_MERGED_MAIN_VERIFIED", state["status"])
        self.assertEqual("GUT_SPEC_MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", state["gut"]["implementation_branch_status"])
        self.assertEqual("PASS", state["gut"]["source_or_version_verification"])
        self.assertEqual("MISMATCH_OFFICIAL_V9_7_1", state["gut"]["vendor_integrity"])
        self.assertEqual("PASS", state["higodot"]["source_or_version_verification"])
        self.assertEqual("MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT", state["higodot"]["vendor_integrity"])
        self.assertTrue(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["tool_vendor_integrity_pass"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_current_unresolved_is_v4_4_post_merge_not_v4_3_gate(self) -> None:
        current = UNRESOLVED.read_text(encoding="utf-8")
        self.assertIn('contract_version: "4.4"', current)
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", current)
        self.assertIn(MERGED_MAIN, current)
        self.assertIn("GUT_FORMALLY_ADOPTED", current)
        self.assertNotIn("BLOCKED_BY_GUT_ADOPTION_SPEC", current)
        self.assertIn("HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2", current)
        self.assertIn("AUDIO_VAULT_PATH_UNVERIFIED", current)

    def test_gut_editor_plugin_remains_disabled(self) -> None:
        project = PROJECT.read_text(encoding="utf-8")
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertNotIn('res://addons/gut/plugin.cfg', project)


if __name__ == "__main__":
    unittest.main()
