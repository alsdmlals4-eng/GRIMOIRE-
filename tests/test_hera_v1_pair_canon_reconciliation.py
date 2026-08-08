from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/validation/HERA_V1_0_0_EXACT_PAIR.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
DEVELOPMENT_GATES = ROOT / "docs/DEVELOPMENT_GATES.md"
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
GRILL = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
]
PASS_TOKEN = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
STALE_BLOCKER = "HERA_CLI_ADDON_PAIR_UNVERIFIED"
RUN_ID = 31254032278
PRE_FINAL_HEAD = "335d3f0b7eaf16e88d73be65c56806d8b58e0b78"
ARTIFACT_ID = 9020855476
ARTIFACT_SHA256 = "6c96beba235c57964a48b1877d931215ebda3a844708d05464de5be0e2bf93d8"


class HeraV1PairCanonReconciliationTests(unittest.TestCase):
    def test_live_evidence_is_promoted_from_ci_required_to_pass(self) -> None:
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(PASS_TOKEN, data["live_canary"]["status"])
        self.assertEqual(RUN_ID, data["live_canary"]["workflow_run"])
        self.assertEqual(PRE_FINAL_HEAD, data["live_canary"]["pre_final_head"])
        self.assertEqual(ARTIFACT_ID, data["live_canary"]["artifact_id"])
        self.assertEqual(ARTIFACT_SHA256, data["live_canary"]["artifact_sha256"])
        for key in (
            "official_linux_cli_sha256",
            "cli_version_v1_0_0",
            "project_addon_exact_tree",
            "loopback_127_0_0_1_only",
            "wrong_token_rejected_exit_1",
            "correct_token_status",
            "status_godot_4_7_1",
            "repository_source_delta_zero",
        ):
            self.assertEqual("PASS", data["live_canary"]["results"][key], key)
        self.assertTrue(data["claims"]["live_cli_addon_pair_pass"])
        self.assertTrue(data["claims"]["acceptance_qa_authorized"])
        self.assertFalse(data["claims"]["persistent_project_source_mutation_allowed_to_hera"])
        self.assertFalse(data["claims"]["spell_workflow_task2_authorized"])

    def test_current_docs_close_only_hera_pair_blocker(self) -> None:
        unresolved = UNRESOLVED.read_text(encoding="utf-8")
        gates = DEVELOPMENT_GATES.read_text(encoding="utf-8")
        self.assertNotIn(STALE_BLOCKER, unresolved)
        self.assertIn(PASS_TOKEN, unresolved)
        self.assertIn(PASS_TOKEN, gates)
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertIn("hera_exact_pair: PASS", text, str(path))
            self.assertNotIn(STALE_BLOCKER, text, str(path))
            self.assertIn("spell_workflow_task2_authorized: false", text, str(path))

    def test_machine_state_closes_hera_but_keeps_visual_platform_and_delivery_gates(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        grill = json.loads(GRILL.read_text(encoding="utf-8"))

        self.assertEqual(PASS_TOKEN, canon["hera"]["status"])
        self.assertEqual(PASS_TOKEN, authority["hera"]["status"])
        self.assertEqual(PASS_TOKEN, grill["current_work"]["hera_status"])
        self.assertNotIn(STALE_BLOCKER, canon["broader_blockers"])
        self.assertNotIn(STALE_BLOCKER, authority["broader_blockers"])
        self.assertFalse(authority["claims"]["spell_workflow_task2_authorized"])
        self.assertFalse(canon["spell_workflow_main"]["spell_workflow_task2_authorized"])
        self.assertFalse(grill["current_work"]["spell_workflow_task2_authorized"])

        for blocker in (
            "WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED",
            "VISUAL_AUDIO_COMPLETE_NOT_PROVEN",
            "AUDIO_VAULT_PATH_UNVERIFIED",
            "AUDIO_RIGHTS_UNVERIFIED",
            "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS",
            "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS",
        ):
            self.assertIn(blocker, canon["broader_blockers"])
            self.assertIn(blocker, authority["broader_blockers"])


if __name__ == "__main__":
    unittest.main()
