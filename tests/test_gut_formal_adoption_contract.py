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
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"


class GutFormalAdoptionContractTests(unittest.TestCase):
    def test_cli_only_consumption_and_actions_evidence_files_exist(self) -> None:
        for path in (CONFIG, GUT_TEST, ACTIONS_RUNNER, WORKFLOW, EVIDENCE_SCHEMA):
            self.assertTrue(path.is_file(), str(path))

    def test_state_records_formally_adopted_v4_4_runtime_evidence(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", state["contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", state["contract"]["binding_decision_id"])
        self.assertEqual(MERGED_MAIN, state["source_main"])
        self.assertEqual("GUT_SPEC_MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", state["gut"]["implementation_branch_status"])
        self.assertTrue(state["gut"]["formal_installation_authorized"])
        self.assertEqual("FORMALLY_ADOPTED_ACTIVE", state["gut"]["current_consumption"])
        self.assertEqual("GUT_FORMAL_ADOPTION_COMPLETE_BROADER_PROJECT_BLOCKERS_REMAIN", state["entry_gate"]["status"])
        self.assertEqual("GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01", state["github_actions_validation_decision_id"])
        self.assertEqual("PUBLIC_REPO_STANDARD_GITHUB_HOSTED", state["validation"]["actions_mode"])
        self.assertEqual("PASS_PR85_EXACT_HEAD", state["validation"]["github_actions"])
        self.assertEqual("fc178bdc7a3e12faf4ae7ae78fd1f92dd2735849", state["validation"]["exact_head"])
        self.assertEqual("PASS", state["gut"]["junit"])
        self.assertEqual("PASS", state["gut"]["product_mutation_hash_gate"])
        self.assertEqual("PASS", state["gut"]["legacy_coverage_parity"])
        self.assertTrue(state["claims"]["gut_formally_adopted"])
        self.assertTrue(state["claims"]["gut_runtime_ci_pass"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_gut_editor_plugin_remains_disabled(self) -> None:
        project = PROJECT.read_text(encoding="utf-8")
        self.assertNotIn('res://addons/gut/plugin.cfg', project)


if __name__ == "__main__":
    unittest.main()
