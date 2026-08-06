from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / ".gutconfig.json"
GUT_TEST = ROOT / "tests/gut/integration/test_gut_product_smoke.gd"
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
PROJECT = ROOT / "project.godot"


class GutFormalAdoptionContractTests(unittest.TestCase):
    def test_cli_only_consumption_files_exist(self) -> None:
        self.assertTrue(CONFIG.is_file(), str(CONFIG))
        self.assertTrue(GUT_TEST.is_file(), str(GUT_TEST))
        self.assertTrue(WORKFLOW.is_file(), str(WORKFLOW))

    def test_state_remains_blocked_until_runtime_evidence(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", state["gut"]["adoption_mode"])
        self.assertFalse(state["gut"]["project_plugin_enabled"])
        self.assertEqual("ADOPTION_IMPLEMENTATION_IN_PROGRESS", state["gut"]["current_consumption"])
        self.assertEqual("BLOCKED_PENDING_GUT_FORMAL_ADOPTION", state["entry_gate"]["status"])
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_gut_editor_plugin_remains_disabled(self) -> None:
        project = PROJECT.read_text(encoding="utf-8")
        self.assertNotIn('res://addons/gut/plugin.cfg', project)
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)


if __name__ == "__main__":
    unittest.main()
