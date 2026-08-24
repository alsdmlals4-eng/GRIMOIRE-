from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BINDING = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md"
BINDING_V48 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md"
HISTORICAL_V44 = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING.md"
ACTIVE_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
]
LEGACY_COMPAT_DOCS = [
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
CURRENT_CANON = ROOT / "docs/planning/CANON_SYNC_STATE_SYNC20.json"
CURRENT_AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE_SYNC20.json"

DECISION = "GM-CONTRACT-V4-5-BINDING-01"
SYNC_ID = "GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING"
V48_DECISION = "GM-CONTRACT-V4-8-BINDING-01"
V48_SYNC_ID = "GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC"
BASE_CURRENT_OBSERVED = "315c66eea9614c284b9c11c4d522141065dfa4b0"
BASE_SOURCE_SNAPSHOT = "7ce3fb64fa6303c5da6c7fc27c979f7233b761ac"
TASK7 = "TASK7_MERGED_MAIN_VERIFIED"
TASK8_PRODUCT = "TASK8_SPELL_USE_SCREEN"
TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
TASK8_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"


class V45ContractBindingTests(unittest.TestCase):
    def test_v45_binding_remains_valid_historical_project_provenance(self) -> None:
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
        self.assertIn(TASK8_PRODUCT, text)
        self.assertIn(HERA_PASS, text)
        self.assertIn(SHARED_CORE_PASS, text)

    def test_active_human_surfaces_promote_v48_and_quarantine_v45_snapshots(self) -> None:
        self.assertTrue(BINDING_V48.exists(), BINDING_V48)
        v48 = BINDING_V48.read_text(encoding="utf-8")
        self.assertIn("contract_version: '4.8'", v48)
        self.assertIn(V48_DECISION, v48)
        self.assertIn(V48_SYNC_ID, v48)
        self.assertNotIn("## 7. 현재 승인 실행 패키지", v48)
        self.assertIn("## 7. v4.8 전환 delivery provenance", v48)
        self.assertIn("current_product_next_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", v48)

        for path in ACTIVE_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8", text, str(path))
            self.assertIn(V48_DECISION, text, str(path))
            self.assertIn(V48_SYNC_ID, text, str(path))
            self.assertIn(TASK7, text, str(path))
            self.assertIn(TASK8_STATUS, text, str(path))
            self.assertIn(TASK8_GATE, text, str(path))
            self.assertNotIn("active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5", text, str(path))

        combined_legacy = "\n".join(path.read_text(encoding="utf-8") for path in LEGACY_COMPAT_DOCS)
        self.assertIn(DECISION, combined_legacy)
        self.assertIn(SYNC_ID, combined_legacy)
        self.assertTrue(SYNC.exists(), SYNC)

    def test_machine_binding_history_and_sync20_current_overlay_remain_historical_evidence(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))
        current_canon = json.loads(CURRENT_CANON.read_text(encoding="utf-8"))
        current_authority = json.loads(CURRENT_AUTHORITY.read_text(encoding="utf-8"))

        self.assertEqual("4.5", canon["active_contract"]["version"])
        self.assertEqual(DECISION, canon["active_contract"]["binding_decision_id"])
        self.assertEqual("4.5", authority["contract"]["version"])
        self.assertEqual(DECISION, authority["contract"]["binding_decision_id"])
        self.assertEqual("4.5", grill["active_contract"]["version"])
        self.assertEqual(DECISION, grill["active_contract"]["binding_decision_id"])

        self.assertEqual("4.5", current_canon["active_contract"]["version"])
        self.assertEqual(DECISION, current_canon["active_contract"]["binding_decision_id"])
        self.assertEqual("GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT", current_authority["sync_id"])
        self.assertEqual("GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01", current_authority["decision_id"])
        self.assertEqual(TASK8_STATUS, current_canon["spell_workflow"]["status"])
        self.assertEqual(TASK8_GATE, current_canon["spell_workflow"]["next_gate"])
        self.assertEqual("LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED", current_authority["higodot"]["live_status"])
        self.assertEqual("LIVE_QA_AND_OBSERVABILITY_ONLY", current_authority["hera"]["authority"])
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
