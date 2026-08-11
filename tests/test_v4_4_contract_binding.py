from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
RECONCILIATION = ROOT / "docs/planning/ENTRY_STATE_RECONCILIATION_V4_4.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
MERGED_MAIN = "ea46923fa78c4fe7844ab6bf422e6716a3c785ed"
CURRENT_BASE_MAIN = "7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f"
CURRENT_DECISION = "GM-CONTRACT-V4-5-BINDING-01"
HISTORICAL_DECISION = "GM-CONTRACT-V4-4-BINDING-01"


class V44ContractBindingTests(unittest.TestCase):
    def test_v4_4_project_binding_remains_historical_with_original_project_inputs(self) -> None:
        self.assertTrue(BINDING.is_file(), str(BINDING))
        text = BINDING.read_text(encoding="utf-8")
        for token in (
            'contract_version: "4.4"', HISTORICAL_DECISION,
            "alsdmlals4-eng/GRIMOIRE-", "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-",
            "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM",
            "fa69a77a14f923a756064f6ae151d34cadb374f7",
            "PUBLIC_REPO_STANDARD_GITHUB_HOSTED", "APPROVED_ITEM_INHERITS_MERGE_AUTHORITY",
            "ON_DEMAND_CODEX_HANDOFF", "ASSET_MANIFEST.yml",
            "C:/Users/user/Documents/GitHub/shered audio vault",
        ):
            self.assertIn(token, text)

    def test_authority_state_uses_v45_current_binding_and_preserves_v44_formal_adoption_history(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("4.5", state["contract"]["version"])
        self.assertEqual(CURRENT_DECISION, state["contract"]["binding_decision_id"])
        self.assertEqual(HISTORICAL_DECISION, state["contract"]["historical_binding_decision_id"])
        self.assertEqual("fa69a77a14f923a756064f6ae151d34cadb374f7", state["base_policy_observation"]["historical_v4_4_current_main"])
        self.assertEqual(CURRENT_BASE_MAIN, state["base_policy_observation"]["current_main"])
        self.assertEqual(CURRENT_BASE_MAIN, state["base_policy_observation"]["latest_main_observed"])
        self.assertEqual(MERGED_MAIN, state["source_main"])
        self.assertTrue(state["claims"]["gut_formally_adopted"])
        self.assertTrue(state["claims"]["gut_runtime_ci_pass"])
        self.assertFalse(state["claims"]["visual_audio_complete"])
        self.assertTrue(state["claims"]["spell_workflow_task2_authorized"])

    def test_entry_reconciliation_remains_historical_pre_finalization_evidence(self) -> None:
        self.assertTrue(RECONCILIATION.is_file(), str(RECONCILIATION))
        text = RECONCILIATION.read_text(encoding="utf-8")
        for token in (
            HISTORICAL_DECISION, "PR #85", "PR #82 Task 2",
            "LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN",
            "HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED",
            "ROLE_SEPARATED_REVIEW_PENDING_CURRENT_HEAD",
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "ASSET_MANIFEST_CURRENT_MAIN_MISSING_NO_PROMOTED_ASSET_CLAIM",
            "decision: BLOCK",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
