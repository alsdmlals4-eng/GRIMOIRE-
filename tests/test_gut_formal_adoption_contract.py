from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / ".gutconfig.json"
GUT_TEST = ROOT / "tests/gut/integration/test_gut_product_smoke.gd"
LOCAL_RUNNER = ROOT / "tools/run_local_gut_validation.ps1"
EVIDENCE_SCHEMA = ROOT / "docs/validation/GUT_LOCAL_VALIDATION_MANIFEST.schema.json"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
PROJECT = ROOT / "project.godot"


class GutFormalAdoptionContractTests(unittest.TestCase):
    def test_cli_only_consumption_and_local_evidence_files_exist(self) -> None:
        for path in (CONFIG, GUT_TEST, LOCAL_RUNNER, EVIDENCE_SCHEMA):
            self.assertTrue(path.is_file(), str(path))

    def test_state_enters_installation_without_claiming_runtime_success(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.3", state["contract"]["version"])
        self.assertEqual("GUT_SPEC_MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_status"])
        self.assertEqual("MERGED_MAIN_VERIFIED", state["gut"]["adoption_spec_pr_state"])
        self.assertTrue(state["gut"]["formal_installation_authorized"])
        self.assertEqual("ADOPTION_IMPLEMENTATION_IN_PROGRESS", state["gut"]["current_consumption"])
        self.assertEqual("BLOCKED_PENDING_GUT_FORMAL_ADOPTION", state["entry_gate"]["status"])
        self.assertEqual(
            "LOCAL_EXACT_HEAD_EVIDENCE_REQUIRED",
            state["validation"]["actions_budget_mode"],
        )
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["gut_runtime_ci_pass"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_gut_editor_plugin_remains_disabled(self) -> None:
        project = PROJECT.read_text(encoding="utf-8")
        self.assertNotIn('res://addons/gut/plugin.cfg', project)


if __name__ == "__main__":
    unittest.main()
