from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
DEVELOPMENT_GATES = ROOT / "docs/DEVELOPMENT_GATES.md"
CURRENT_DOCS = [ROOT / "START_HERE.md", ROOT / "docs/ACTIVE_CONTEXT.md", ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
STALE_BLOCKER = "CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE"
PASS_TOKEN = "REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
DECISION = "GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01"

class V44CiSupplyChainCanonReconciliationTests(unittest.TestCase):
    def test_unresolved_and_development_gate_close_repo_wide_mutable_refs(self) -> None:
        unresolved = UNRESOLVED.read_text(encoding="utf-8")
        gates = DEVELOPMENT_GATES.read_text(encoding="utf-8")
        self.assertNotIn(STALE_BLOCKER, unresolved)
        self.assertIn(PASS_TOKEN, unresolved)
        self.assertIn(DECISION, unresolved)
        self.assertIn("Gate 18", gates)
        self.assertIn(PASS_TOKEN, gates)
        self.assertIn(DECISION, gates)

    def test_current_cold_start_surfaces_record_supply_chain_pass(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("repo_wide_actions_full_sha: PASS", text, str(path))
            self.assertIn(DECISION, text, str(path))
            self.assertNotIn(STALE_BLOCKER, text, str(path))

    def test_machine_state_preserves_supply_chain_pass_after_platform_structural_closure(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, canon["ci_supply_chain"]["decision_id"])
        self.assertEqual(PASS_TOKEN, canon["ci_supply_chain"]["status"])
        self.assertEqual("PASS", canon["sheet_finalization_readback"])
        self.assertNotIn(STALE_BLOCKER, canon["broader_blockers"])
        self.assertEqual(PASS_TOKEN, authority["validation"]["repo_wide_actions_full_sha"])
        self.assertNotIn(STALE_BLOCKER, authority["broader_blockers"])
        self.assertFalse(authority["claims"]["spell_workflow_task2_authorized"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", canon["tool_authority"]["higodot"]["vendor_integrity"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", authority["higodot"]["vendor_integrity"])
        self.assertEqual(HERA_PASS, canon["hera"]["status"])
        self.assertEqual(HERA_PASS, authority["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, canon["platform_validation"]["status"])
        self.assertEqual(SHARED_CORE_PASS, authority["platform_validation"]["status"])
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", canon["broader_blockers"])
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", authority["broader_blockers"])
        for blocker in ("VISUAL_AUDIO_COMPLETE_NOT_PROVEN", "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS"):
            self.assertIn(blocker, canon["broader_blockers"])
            self.assertIn(blocker, authority["broader_blockers"])
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", canon["broader_blockers"])
        self.assertNotIn("HERA_CLI_ADDON_PAIR_UNVERIFIED", authority["broader_blockers"])

if __name__ == "__main__":
    unittest.main()
