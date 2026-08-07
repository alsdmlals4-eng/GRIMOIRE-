from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
ACTIVE_FILES = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]


class V44ContractBindingTests(unittest.TestCase):
    def test_v4_4_project_binding_exists_with_current_project_inputs(self) -> None:
        self.assertTrue(BINDING.is_file(), str(BINDING))
        text = BINDING.read_text(encoding="utf-8")
        for token in (
            'contract_version: "4.4"',
            "GM-CONTRACT-V4-4-BINDING-01",
            "alsdmlals4-eng/GRIMOIRE-",
            "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-",
            "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM",
            "fa69a77a14f923a756064f6ae151d34cadb374f7",
            "PUBLIC_REPO_STANDARD_GITHUB_HOSTED",
            "APPROVED_ITEM_INHERITS_MERGE_AUTHORITY",
            "ON_DEMAND_CODEX_HANDOFF",
            "ASSET_MANIFEST.yml",
            "C:/Users/user/Documents/GitHub/shered audio vault",
        ):
            self.assertIn(token, text)

    def test_authority_state_is_bound_to_v4_4_without_false_completion_claims(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.4", state["contract"]["version"])
        self.assertEqual("GM-CONTRACT-V4-4-BINDING-01", state["contract"]["binding_decision_id"])
        self.assertEqual(
            "fa69a77a14f923a756064f6ae151d34cadb374f7",
            state["base_policy_observation"]["current_main"],
        )
        self.assertFalse(state["claims"]["gut_formally_adopted"])
        self.assertFalse(state["claims"]["visual_audio_complete"])
        self.assertFalse(state["claims"]["spell_workflow_task2_authorized"])

    def test_cold_start_authority_files_identify_v4_4_as_active_contract(self) -> None:
        for path in ACTIVE_FILES:
            text = path.read_text(encoding="utf-8")
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertIn("v4.4", text, str(path))


if __name__ == "__main__":
    unittest.main()
