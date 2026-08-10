from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md"
HISTORICAL_V44 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING.md"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"

DECISION = "GM-CONTRACT-V4-5-BINDING-01"
SYNC_ID = "GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING"
BASE_CURRENT_OBSERVED = "315c66eea9614c284b9c11c4d522141065dfa4b0"
BASE_SOURCE_SNAPSHOT = "7ce3fb64fa6303c5da6c7fc27c979f7233b761ac"
TASK7 = "TASK7_MERGED_MAIN_VERIFIED"
TASK8 = "TASK8_SPELL_USE_SCREEN"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"


class V45ContractBindingTests(unittest.TestCase):
    def test_binding_adapts_v45_r2_to_grimoire_without_freezing_base(self) -> None:
        self.assertTrue(BINDING.exists(), BINDING)
        text = BINDING.read_text(encoding="utf-8")
        for token in (
            "contract_version: '4.5'",
            "revision: '2026-08-11-r2'",
            DECISION,
            SYNC_ID,
            "alsdmlals4-eng/GRIMOIRE-",
            "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-",
            "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM",
            "ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK",
            "RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ",
            "THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON",
            "EXTERNAL_PROCESS_OVERLAY",
            "APPROVED_ITEM_INHERITS_MERGE_AUTHORITY",
            "SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY",
            "DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY",
            "LIVE_QA_AND_OBSERVABILITY_ONLY",
            BASE_CURRENT_OBSERVED,
            BASE_SOURCE_SNAPSHOT,
            "HISTORICAL_OBSERVATION_ONLY",
        ):
            self.assertIn(token, text)
        self.assertIn("USER_EXPLICIT_EXECUTION_REQUEST_PRESENT", text)
        self.assertIn(TASK7, text)
        self.assertIn(TASK8, text)
        self.assertIn(HERA_PASS, text)
        self.assertIn(SHARED_CORE_PASS, text)

    def test_current_human_surfaces_promote_v45_and_preserve_v44_history(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5", text, str(path))
            self.assertIn(DECISION, text, str(path))
            self.assertIn(SYNC_ID, text, str(path))
            self.assertIn(TASK7, text, str(path))
            self.assertIn(TASK8, text, str(path))
            self.assertIn("GM-CONTRACT-V4-4-BINDING-01", text, str(path))
            self.assertNotIn("v4_5_binding: USER_DECISION_REQUIRED", text, str(path))

    def test_machine_current_state_promotes_v45_without_erasing_existing_authorities(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))

        self.assertEqual("4.5", canon["active_contract"]["version"])
        self.assertEqual(DECISION, canon["active_contract"]["binding_decision_id"])
        self.assertEqual("4.5", authority["contract"]["version"])
        self.assertEqual(DECISION, authority["contract"]["binding_decision_id"])
        self.assertEqual("4.5", grill["active_contract"]["version"])
        self.assertEqual(DECISION, grill["active_contract"]["binding_decision_id"])

        self.assertEqual("LIVE_GITHUB_DEFAULT_BRANCH_READBACK", canon["project_main_authority"])
        self.assertEqual(HERA_PASS, canon["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, canon["platform_validation"]["status"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", authority["higodot"]["vendor_integrity"])
        self.assertEqual(HERA_PASS, authority["hera"]["status"])
        self.assertTrue(authority["claims"]["gut_formally_adopted"])
        self.assertEqual(TASK7, grill["current_work"]["status"])

    def test_v44_binding_remains_historical_evidence(self) -> None:
        self.assertTrue(HISTORICAL_V44.exists(), HISTORICAL_V44)
        historical = HISTORICAL_V44.read_text(encoding="utf-8")
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", historical)
        self.assertIn('contract_version: "4.4"', historical)
        self.assertTrue(SYNC.exists(), SYNC)
        sync_text = SYNC.read_text(encoding="utf-8")
        self.assertIn("GM-CONTRACT-V4-4-BINDING-01", sync_text)
        self.assertIn("HISTORICAL_SUPERSEDED_CURRENT_BINDING", sync_text)
        self.assertIn("USER_APPROVED", sync_text)


if __name__ == "__main__":
    unittest.main()
