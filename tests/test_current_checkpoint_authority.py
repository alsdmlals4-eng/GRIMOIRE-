import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CURRENT_CHECKPOINT = ROOT / "docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md"
CURRENT_STATUS = ROOT / "docs/planning/CANON_STATUS_INDEX_2026-08-05.md"
CANON_SYNC_STATE = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL_STATE = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
ENTRYPOINTS = (
    ROOT / "AGENTS.md",
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/DOCUMENTATION_MAP.md",
    ROOT / "docs/planning/README.md",
)

SYNC_ID = "GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX"
GATE = "STAGE2_HARNESS_UX_HX_READY_FOR_CODEX_TDD"


class CurrentCheckpointAuthorityContractTests(unittest.TestCase):
    def test_current_authority_files_exist(self) -> None:
        self.assertTrue(CURRENT_CHECKPOINT.is_file())
        self.assertTrue(CURRENT_STATUS.is_file())

    def test_active_entrypoints_route_to_current_checkpoint(self) -> None:
        texts = {
            path: path.read_text(encoding="utf-8")
            for path in ENTRYPOINTS
        }
        required = (
            "working_pull_request: 63",
            "working_branch: agent/glyph-vocabulary-recognition-poc",
            f"current_sync: {SYNC_ID}",
            f"current_gate: {GATE}",
            "human_device_validation: NOT_RUN",
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
        self.assertEqual(bundle["pull_request"], 63)
        self.assertEqual(bundle["working_branch"], "agent/glyph-vocabulary-recognition-poc")
        self.assertEqual(bundle["sheet_readback"], "PASS")
        self.assertEqual(bundle["human_validation_protocol"], "APPROVED_NOT_RUN")
        self.assertEqual(bundle["visual_hx"], "COMPLETE")
        self.assertEqual(bundle["codex"], "READY_FOR_TDD_HARNESS")
        self.assertEqual(bundle["human_device_validation"], "NOT_RUN")
        self.assertEqual(bundle["runtime_expansion_7_plus"], "BLOCKED")
        self.assertFalse(bundle["merge_authorized"])

        self.assertEqual(grill["current_count"], 4)
        self.assertEqual(grill["current_work"]["pull_request"], 63)
        self.assertEqual(grill["current_work"]["gate"], GATE)
        self.assertEqual(grill["current_work"]["visual_hx"], "COMPLETE")
        self.assertEqual(grill["current_work"]["codex"], "READY_FOR_TDD_HARNESS")
        self.assertEqual(grill["current_work"]["human_device_validation"], "NOT_RUN")
        self.assertFalse(grill["current_work"]["merge_authorized"])

    def test_checkpoint_keeps_core_fun_and_human_boundaries(self) -> None:
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
            "LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART",
        )
        for token in required:
            self.assertIn(token, text)

    def test_previous_protocol_green_evidence_is_preserved(self) -> None:
        sync = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        bundle = sync["current_bundle"]
        tdd = bundle["tdd"]
        self.assertEqual(bundle["protocol_green_evidence_head"], "d9fe985ec18419f47c50bc7c7b3896e611a30e6a")
        self.assertEqual(tdd["protocol_foundation_green_workflow_run"], 31007581881)
        self.assertEqual(tdd["protocol_planning_base_green_workflow_run"], 31007581877)
        self.assertEqual(tdd["protocol_godot_toolchain_green_workflow_run"], 31007581876)
        self.assertEqual(tdd["hx_red_workflow_run"], 31009239386)


if __name__ == "__main__":
    unittest.main()
