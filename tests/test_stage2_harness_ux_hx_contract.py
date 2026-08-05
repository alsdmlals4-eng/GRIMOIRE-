import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DECISION_ID = "GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01"
HX_SYNC_ID = "GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX"
CURRENT_SYNC_ID = "GR-SYNC-20260805-07-STAGE2-HARNESS-AUTOMATED"
UX_HX = ROOT / "docs/planning/STAGE2_CIRCUIT_BRIDGE_HARNESS_UX_HX_2026-08-05.md"
STATE_MATRIX = ROOT / "docs/planning/STAGE2_CIRCUIT_BRIDGE_HARNESS_STATE_MATRIX_2026-08-05.md"
CODEX_PLAN = ROOT / "docs/superpowers/plans/2026-08-05-stage2-circuit-bridge-harness-implementation-plan.md"
SYNC_RECEIPT = ROOT / "docs/planning/sync/GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX.md"
CANON_SYNC_STATE = ROOT / "docs/planning/CANON_SYNC_STATE.json"
GRILL_STATE = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
ENTRYPOINTS = (
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/DOCUMENTATION_MAP.md",
    ROOT / "docs/planning/README.md",
)


class Stage2HarnessUxHxContractTests(unittest.TestCase):
    def test_required_hx_and_codex_artifacts_exist(self) -> None:
        for path in (UX_HX, STATE_MATRIX, CODEX_PLAN, SYNC_RECEIPT):
            self.assertTrue(path.is_file(), path)
        self.assertIn(HX_SYNC_ID, SYNC_RECEIPT.read_text(encoding="utf-8"))

    def test_harness_preserves_core_information_and_existing_mobile_layout(self) -> None:
        text = UX_HX.read_text(encoding="utf-8") + STATE_MATRIX.read_text(encoding="utf-8")
        required = (
            DECISION_ID,
            "TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT",
            "LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL",
            "CENTER_TARGET_AND_3X3_CIRCUIT",
            "RIGHT_WRITING_FOCUS_PANEL",
            "BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT",
            "EXPLICIT_VAULT_OR_STOCK_SOURCE_PER_GLYPH",
            "SCENARIO_CONTEXT_SURVIVES_RECOGNITION_RETRY",
            "NO_AUTOMATIC_SOLUTION_OR_BEST_GLYPH_RECOMMENDATION",
        )
        for token in required:
            self.assertIn(token, text)

    def test_state_machine_prevents_accidental_commit_and_input_theft(self) -> None:
        text = UX_HX.read_text(encoding="utf-8") + STATE_MATRIX.read_text(encoding="utf-8")
        required = (
            "SCENARIO_BRIEF",
            "INTENT_AND_SOURCE_SELECT",
            "WRITING_FOCUS",
            "CIRCUIT_EDIT",
            "PREVIEW_READY",
            "COMMIT_CONFIRM",
            "SYSTEM_RESOLVE",
            "RESULT_EXPLAIN",
            "ERROR_SAFE_RECOVERY",
            "ACTIVE_STROKE_OWNER_WRITING_CANVAS",
            "COMMIT_REQUIRES_SEPARATE_CONFIRMATION",
            "CANCEL_RETURNS_WITHOUT_MUTATION",
            "ACCIDENTAL_COMMIT_ZERO_HARD_STOP",
        )
        for token in required:
            self.assertIn(token, text)

    def test_hx_is_low_fidelity_accessible_and_reduced_motion_safe(self) -> None:
        text = UX_HX.read_text(encoding="utf-8") + STATE_MATRIX.read_text(encoding="utf-8")
        required = (
            "LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART",
            "ANDROID_TOUCH_TARGET_48DP",
            "IOS_TOUCH_TARGET_44PT",
            "NON_DRAG_ALTERNATIVE_REQUIRED",
            "REDUCED_MOTION_ZERO_DURATION_STATE_SWAP",
            "COLOR_IS_NOT_THE_ONLY_STATE_SIGNAL",
            "TRANSITION_DURATION_120_TO_180_MS_TEST_VALUE",
            "NO_MOTION_DURING_ACTIVE_STROKE",
        )
        for token in required:
            self.assertIn(token, text)

    def test_logging_contract_separates_input_and_core_loop_without_pii(self) -> None:
        text = UX_HX.read_text(encoding="utf-8") + CODEX_PLAN.read_text(encoding="utf-8")
        required = (
            "ANONYMOUS_PARTICIPANT_ID_ONLY",
            "NO_RAW_PERSONAL_IDENTIFIER",
            "FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED",
            "RECOGNITION_EVENT_STREAM",
            "CORE_LOOP_EVENT_STREAM",
            "MODERATOR_INTERVENTION_EVENT",
            "ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED",
        )
        for token in required:
            self.assertIn(token, text)

    def test_codex_plan_is_tdd_scoped_and_does_not_expand_product_scope(self) -> None:
        text = CODEX_PLAN.read_text(encoding="utf-8")
        required = (
            "RED_TEST_WRITTEN_FIRST",
            "STRICT_RED_GREEN_REFACTOR",
            "RUNTIME_GLYPHS_EXACTLY_6",
            "NO_FINAL_ART_ASSET_REQUIRED",
            "NO_SEVENTH_GLYPH",
            "NO_FULL_VERTICAL_SLICE_CONTENT_EXPANSION",
            "HUMAN_EXECUTION_NOT_RUN",
            "READY_FOR_CODEX_TDD_HARNESS",
        )
        for token in required:
            self.assertIn(token, text)

    def test_current_authority_advances_to_implementation_without_incrementing_grill(self) -> None:
        text = "\n".join(path.read_text(encoding="utf-8") for path in ENTRYPOINTS)
        for token in (
            f"current_sync: {CURRENT_SYNC_ID}",
            "working_pull_request: 65",
            "current_gate: STAGE2_HARNESS_AUTOMATED_PASS_HUMAN_NOT_RUN",
            "grill_counter: 4_of_10",
            "human_device_validation: NOT_RUN",
            "runtime_expansion_7_plus: BLOCKED",
            "merge_authorized: false",
        ):
            self.assertIn(token, text)

        sync = json.loads(CANON_SYNC_STATE.read_text(encoding="utf-8"))
        grill = json.loads(GRILL_STATE.read_text(encoding="utf-8"))
        bundle = sync["current_bundle"]
        self.assertEqual(bundle["sync_id"], CURRENT_SYNC_ID)
        self.assertEqual(bundle["previous_sync_id"], HX_SYNC_ID)
        self.assertEqual(bundle["decision_ids"][-1], DECISION_ID)
        self.assertEqual(bundle["visual_hx"], "COMPLETE")
        self.assertEqual(bundle["codex"], "HARNESS_IMPLEMENTED_AUTOMATED_PASS")
        self.assertEqual(bundle["stage2_harness_automated"], "PASS")
        self.assertEqual(bundle["human_device_validation"], "NOT_RUN")
        self.assertEqual(grill["current_count"], 4)
        self.assertEqual(grill["current_work"]["visual_hx"], "COMPLETE")
        self.assertEqual(grill["current_work"]["codex"], "HARNESS_IMPLEMENTED_AUTOMATED_PASS")
        self.assertEqual(grill["current_work"]["stage2_harness_automated"], "PASS")
        self.assertFalse(grill["counter"]["merge_authorized"])


if __name__ == "__main__":
    unittest.main()
