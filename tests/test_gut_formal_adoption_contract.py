from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / ".gutconfig.json"
GUT_TEST = ROOT / "tests/gut/integration/test_gut_product_smoke.gd"
ACTIONS_RUNNER = ROOT / "tools/run_gut_actions_validation.py"
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
EVIDENCE_SCHEMA = ROOT / "docs/validation/GUT_ACTIONS_VALIDATION_MANIFEST.schema.json"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
PROJECT = ROOT / "project.godot"


class GutFormalAdoptionContractTests(unittest.TestCase):
    def test_cli_only_consumption_and_actions_evidence_files_exist(self) -> None:
        for path in (CONFIG, GUT_TEST, ACTIONS_RUNNER, WORKFLOW, EVIDENCE_SCHEMA):
            self.assertTrue(path.is_file(), str(path))

    def test_state_enters_v4_4_revalidation_without_claiming_runtime_success(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", state["contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", state["contract"]["binding_decision_id"])
        self.assertEqual("GUT_SPEC_MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_pr_state"])
        self.assertTrue(state["gut"]["formal_installation_authorized"])
        self.assertEqual("ADOPTION_IMPLEMENTATION_IN_PROGRESS", state["gut"]["current_consumption"])
        self.assertEqual("BLOCKED_PENDING_GUT_FORMAL_ADOPTION", state["entry_gate"]["status"])
        self.assertEqual(
            "GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01",
            state["github_actions_validation_decision_id"],
        )
        self.assertEqual(
            "PUBLIC_REPO_STANDARD_GITHUB_HOSTED",
            state["validation"]["actions_mode"],
        )
        self.assertEqual("CURRENT_HEAD_REVALIDATION_REQUIRED", state["validation"]["github_actions"])
        self.assertEqual("a264bb7b7172faf250faad2be7b3300785e8e367", state["validation"]["previous_exact_head"])
        self.assertEqual("PASS", state["validation"]["previous_exact_head_result"])
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["gut_runtime_ci_pass"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_gut_editor_plugin_remains_disabled(self) -> None:
        project = PROJECT.read_text(encoding="utf-8")
        self.assertNotIn('res://addons/gut/plugin.cfg', project)


if __name__ == "__main__":
    unittest.main()
