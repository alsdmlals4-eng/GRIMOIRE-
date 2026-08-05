import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CURRENT_CHECKPOINT = ROOT / "docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md"
CURRENT_STATUS = ROOT / "docs/planning/CANON_STATUS_INDEX_2026-08-05.md"
CANON_SYNC_STATE = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL_STATE = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
READY_GATE = ROOT / "docs/planning/GR_TEST_032_EXECUTION_READY_GATE_2026-08-06.md"
SYNC_RECEIPT = ROOT / "docs/planning/sync/GR-SYNC-20260806-01-GR-TEST-032-EXECUTION-READY.md"
ENTRYPOINTS = (
    ROOT / "AGENTS.md",
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/DOCUMENTATION_MAP.md",
    ROOT / "docs/planning/README.md",
)

SYNC_ID = "GR-SYNC-20260806-01-GR-TEST-032-EXECUTION-READY"
GATE = "GR_TEST_032_READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN"


class CurrentCheckpointAuthorityContractTests(unittest.TestCase):
    def test_current_authority_files_exist(self) -> None:
        for path in (CURRENT_CHECKPOINT, CURRENT_STATUS, READY_GATE, SYNC_RECEIPT):
            self.assertTrue(path.is_file(), path)

    def test_active_entrypoints_route_to_current_checkpoint(self) -> None:
        texts = {path: path.read_text(encoding="utf-8") for path in ENTRYPOINTS}
        required = (
            "working_pull_request: 67",
            "working_branch: agent/gr-test-032-human-execution-pack",
            "parent_pull_request: 65",
            f"current_sync: {SYNC_ID}",
            f"current_gate: {GATE}",
            "human_execution_pack: READY",
            "human_device_validation: NOT_RUN",
            "human_end_to_end_core_loop: NOT_RUN",
            "runtime_expansion_7_plus: BLOCKED",
            "grill_counter: 4_of_10",
            "merge_authorized: false",
        )
        for path, text in texts.items():
            for token in required:
                self.assertIn(token, text, f"{path} missing {token}")

    def test_machine_state_tracks_same_sync_and_preserves_gates(self) -> None:
        sync = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        grill = json.loads(GRILL_STATE.read_text(encoding="utf-8"))
        bundle = sync["current_bundle"]

        self.assertEqual(bundle["sync_id"], SYNC_ID)
        self.assertEqual(bundle["pull_request"], 67)
        self.assertEqual(bundle["working_branch"], "agent/gr-test-032-human-execution-pack")
        self.assertEqual(bundle["parent_pull_request"], 65)
        self.assertEqual(bundle["base_pull_request"], 65)
        self.assertEqual(bundle["sheet_write"], "PASS")
        self.assertEqual(bundle["sheet_readback"], "PASS")
        self.assertEqual(bundle["human_validation_protocol"], "APPROVED_NOT_RUN")
        self.assertEqual(bundle["human_execution_pack"], "READY")
        self.assertEqual(bundle["human_result_analyzer"], "AUTOMATED_PASS")
        self.assertEqual(bundle["stage2_harness_automated"], "PASS")
        self.assertEqual(bundle["headless_suite_count"], 28)
        self.assertEqual(bundle["headless_assertion_count"], 1343)
        self.assertEqual(bundle["headless_failure_count"], 0)
        self.assertEqual(bundle["runtime_glyph_count"], 6)
        self.assertEqual(bundle["planned_participant_count"], 6)
        self.assertEqual(bundle["planned_total_scored_attempts"], 144)
        self.assertEqual(bundle["human_execution"], "NOT_RUN")
        self.assertEqual(bundle["human_device_validation"], "NOT_RUN")
        self.assertEqual(bundle["human_end_to_end_core_loop"], "NOT_RUN")
        self.assertEqual(bundle["full_vertical_slice_representativeness"], "NOT_RUN")
        self.assertEqual(bundle["runtime_expansion_7_plus"], "BLOCKED")
        self.assertFalse(bundle["human_pass_claimed"])
        self.assertFalse(bundle["merge_authorized"])

        current_work = grill["current_work"]
        self.assertEqual(grill["current_count"], 4)
        self.assertEqual(current_work["pull_request"], 67)
        self.assertEqual(current_work["working_branch"], "agent/gr-test-032-human-execution-pack")
        self.assertEqual(current_work["parent_pull_request"], 65)
        self.assertEqual(current_work["gate"], GATE)
        self.assertEqual(current_work["human_execution_pack"], "READY")
        self.assertEqual(current_work["human_result_analyzer"], "AUTOMATED_PASS")
        self.assertEqual(current_work["sheet_readback"], "PASS")
        self.assertEqual(current_work["human_execution"], "NOT_RUN")
        self.assertEqual(current_work["human_device_validation"], "NOT_RUN")
        self.assertFalse(current_work["human_pass_claimed"])
        self.assertFalse(current_work["merge_authorized"])

    def test_checkpoint_keeps_core_fun_and_human_boundaries(self) -> None:
        text = "\n".join(
            path.read_text(encoding="utf-8")
            for path in (CURRENT_CHECKPOINT, CURRENT_STATUS, READY_GATE, SYNC_RECEIPT)
            if path.is_file()
        )
        required = (
            "SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE",
            "RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN",
            "EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS",
            "C_STAGED_RECOGNITION_THEN_CORE_LOOP",
            "READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN",
            "HUMAN_EXECUTION_NOT_RUN",
            "HUMAN_DEVICE_VALIDATION_NOT_RUN",
            "HUMAN_END_TO_END_CORE_LOOP_NOT_RUN",
            "FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN",
            "NO_HUMAN_PASS_CLAIM",
            "RUNTIME_EXPANSION_7_PLUS_BLOCKED",
            "MERGE_NOT_AUTHORIZED",
        )
        for token in required:
            self.assertIn(token, text)

    def test_previous_harness_and_execution_pack_tdd_evidence_is_preserved(self) -> None:
        sync = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        bundle = sync["current_bundle"]
        tdd = bundle["tdd"]
        self.assertEqual(bundle["protocol_green_evidence_head"], "d9fe985ec18419f47c50bc7c7b3896e611a30e6a")
        self.assertEqual(bundle["hx_green_evidence_head"], "a892ddf83abfe3e41809579e9b09f4f0078776db")
        self.assertEqual(bundle["harness_green_evidence_head"], "ffbd769ecdf1ca1a4f7c06101d0d8215ac8a387e")
        self.assertEqual(tdd["crossing_edges_red_workflow_run"], 31018302521)
        self.assertEqual(tdd["crossing_edges_green_foundation_run"], 31018467326)
        self.assertEqual(tdd["execution_pack_red_head"], "3f8734fb408bc6176201866f7d70543a28d8640e")
        self.assertEqual(tdd["execution_pack_red_run"], 31024736308)
        self.assertEqual(tdd["analyzer_red_head"], "002bf89f64b2fdc5f6607e2791b29c298ffe6965")
        self.assertEqual(tdd["analyzer_red_run"], 31025164960)
        self.assertEqual(tdd["execution_pack_analyzer_green_head"], "f5d235b686c06867dd31ff72083d4803cf08c7b2")
        self.assertEqual(tdd["execution_pack_analyzer_green_run"], 31025279869)


if __name__ == "__main__":
    unittest.main()
