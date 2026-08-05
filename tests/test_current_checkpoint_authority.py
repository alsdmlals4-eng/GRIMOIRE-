import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CURRENT_CHECKPOINT = ROOT / "docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md"
CURRENT_STATUS = ROOT / "docs/planning/CANON_STATUS_INDEX_2026-08-05.md"
DEVELOPMENT_GATES = ROOT / "docs/DEVELOPMENT_GATES.md"
CANON_SYNC_STATE = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL_STATE = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
ENTRYPOINTS = (
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    DEVELOPMENT_GATES,
    ROOT / "docs/DOCUMENTATION_MAP.md",
    ROOT / "docs/planning/README.md",
)


class CurrentCheckpointAuthorityContractTests(unittest.TestCase):
    def test_current_authority_files_exist(self) -> None:
        self.assertTrue(CURRENT_CHECKPOINT.is_file())
        self.assertTrue(CURRENT_STATUS.is_file())

    def test_active_entrypoints_route_to_current_checkpoint(self) -> None:
        text = "\n".join(path.read_text(encoding="utf-8") for path in ENTRYPOINTS)
        required = (
            "working_pull_request: 63",
            "working_branch: agent/glyph-vocabulary-recognition-poc",
            "current_sync: GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE",
            "current_gate: HUMAN_CIRCUIT_BRIDGE_PROTOCOL_APPROVED_NOT_RUN",
            "human_device_validation: NOT_RUN",
            "runtime_expansion_7_plus: BLOCKED",
            "grill_counter: 4_of_10",
            "merge_authorized: false",
        )
        for token in required:
            self.assertIn(token, text)

    def test_machine_state_tracks_same_sync_and_preserves_gates(self) -> None:
        sync_state = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        grill_state = json.loads(GRILL_STATE.read_text(encoding="utf-8"))

        current_bundle = sync_state["current_bundle"]
        self.assertEqual(
            current_bundle["sync_id"],
            "GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE",
        )
        self.assertEqual(current_bundle["pull_request"], 63)
        self.assertEqual(
            current_bundle["working_branch"],
            "agent/glyph-vocabulary-recognition-poc",
        )
        self.assertEqual(
            current_bundle["source_product_commit"],
            "ec947f232b533d5a2acac20683287080c34a811f",
        )
        self.assertEqual(current_bundle["sheet_readback"], "PASS")
        self.assertEqual(current_bundle["human_validation_protocol"], "APPROVED_NOT_RUN")
        self.assertEqual(current_bundle["human_device_validation"], "NOT_RUN")
        self.assertEqual(current_bundle["runtime_expansion_7_plus"], "BLOCKED")
        self.assertFalse(current_bundle["merge_authorized"])

        self.assertEqual(grill_state["current_count"], 4)
        self.assertEqual(grill_state["current_work"]["pull_request"], 63)
        self.assertEqual(
            grill_state["current_work"]["gate"],
            "HUMAN_CIRCUIT_BRIDGE_PROTOCOL_APPROVED_NOT_RUN",
        )
        self.assertEqual(
            grill_state["current_work"]["human_device_validation"],
            "NOT_RUN",
        )
        self.assertFalse(grill_state["current_work"]["merge_authorized"])

    def test_checkpoint_keeps_core_fun_above_recognition_accuracy(self) -> None:
        text = "\n".join(
            path.read_text(encoding="utf-8")
            for path in (CURRENT_CHECKPOINT, CURRENT_STATUS)
        )
        required = (
            "SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE",
            "RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN",
            "EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS",
            "HUMAN_END_TO_END_CORE_LOOP_VALIDATION_PENDING",
            "C_STAGED_RECOGNITION_THEN_CORE_LOOP",
        )
        for token in required:
            self.assertIn(token, text)

    def test_previous_green_evidence_is_preserved(self) -> None:
        sync_state = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        tdd = sync_state["current_bundle"]["tdd"]
        self.assertEqual(
            tdd["previous_green_evidence_head"],
            "c93c091be6827dbb6ff888ebb889e379c86407bb",
        )
        self.assertEqual(tdd["previous_foundation_green_workflow_run"], 31005032419)
        self.assertEqual(tdd["previous_planning_base_green_workflow_run"], 31005032390)
        self.assertEqual(tdd["previous_godot_toolchain_green_workflow_run"], 31005032414)
        self.assertEqual(tdd["previous_closure_green_workflow_run"], 31005726796)


if __name__ == "__main__":
    unittest.main()
