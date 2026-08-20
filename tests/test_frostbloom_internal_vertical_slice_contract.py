import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
CANON = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md"
FIRST10 = ROOT / "docs/planning/FROSTBLOOM_FIRST_10_MIN_CLASS_PRACTICUM_01_APPROVAL_2026-08-20.md"
W6_CANON = ROOT / "docs/planning/FROSTBLOOM_W6_BOUNDED_CONSEQUENCE_FORECAST_01_APPROVAL_2026-08-20.md"
W6_FIXTURE = ROOT / "data/testing/frostbloom_w6_bounded_forecast_v1.json"
W7_CANON = ROOT / "docs/planning/FROSTBLOOM_W7_PRESERVED_FACT_CONTEXT_DELTA_01_APPROVAL_2026-08-20.md"
W7_FIXTURE = ROOT / "data/testing/frostbloom_w7_context_delta_v1.json"
RESULT_CANON = ROOT / "docs/planning/FROSTBLOOM_RESULT_GRIMOIRE_CAUSAL_DEBRIEF_01_APPROVAL_2026-08-20.md"
RESULT_FIXTURE = ROOT / "data/testing/frostbloom_result_grimoire_debrief_v1.json"
PORTFOLIO_CANON = ROOT / "docs/planning/FROSTBLOOM_PORTFOLIO_PREVIEW_EVIDENCE_ECHO_01_APPROVAL_2026-08-20.md"
PORTFOLIO_FIXTURE = ROOT / "data/testing/frostbloom_portfolio_preview_v1.json"
WALK = ROOT / "docs/testing/frostbloom_graybox/01_46_MINUTE_WALKTHROUGH.md"
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
BENCH = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md"
README = ROOT / "README.md"


class FrostbloomInternalVerticalSliceContractTests(unittest.TestCase):
    def test_required_planning_artifacts_exist(self):
        for path in (
            CANON,
            FIRST10,
            W6_CANON,
            W6_FIXTURE,
            W7_CANON,
            W7_FIXTURE,
            RESULT_CANON,
            RESULT_FIXTURE,
            PORTFOLIO_CANON,
            PORTFOLIO_FIXTURE,
            WALK,
            CURRENT,
            BENCH,
            PLAN,
            README,
        ):
            self.assertTrue(path.is_file(), path)

    def test_approved_slice_contract_tokens(self):
        text = CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01",
            "GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE",
            "actual_play_target_minutes: 46",
            "content_rework_threshold_minutes: 53",
            "hard_stop_minutes: 60",
            "required_successful_writing_events: 7",
            "recovery_inclusive_writing_cap: 10",
            "investigation_nodes_available: 4",
            "investigation_nodes_required: 2",
            "free_schedule_windows_in_slice: 1",
            "major_five_point_star_commits_min: 2",
            "FIVE_POINT_STAR",
            "PREVIEW_ONLY",
            "A1",
            "A2",
            "A3",
            "A4",
        ):
            self.assertIn(token, text)

    def test_first_10_minute_class_to_practicum_refinement(self):
        text = FIRST10.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01",
            "first_10_minute_target_minutes: 10",
            "class_target_minutes_test_value: 5",
            "guided_field_practicum_target_minutes_test_value: 5",
            "W1 FLOW",
            "W2 FOCUS",
            "W3 DISPERSE",
            "W4",
            "micro_five_point_star_application: REQUIRED",
            "major_commit_count_effect: DOES_NOT_REPLACE_W6_W7",
            "first_field_consequence_target: BEFORE_OR_AT_MINUTE_10",
            "human_validation: NOT_RUN",
        ):
            self.assertIn(token, text)

    def test_w6_bounded_consequence_forecast_refinement(self):
        self.assertTrue(W6_CANON.is_file(), W6_CANON)
        self.assertTrue(W6_FIXTURE.is_file(), W6_FIXTURE)
        text = W6_CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01",
            "BOUNDED_CONSEQUENCE_FORECAST",
            "OBSERVED_EVIDENCE_ONLY",
            "KNOWN_IMPROVEMENT",
            "UNCERTAIN_CONSEQUENCE",
            "FINAL_TARGET_SUCCESS_BREAKDOWN",
            "MANA_COST",
            "EXPLICIT_COMMIT_REQUIRED",
            "NO_NAMED_INTENT_ROUTE_BUTTONS",
            "UNKNOWN_FACTS_NOT_INVENTED",
            "FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE",
        ):
            self.assertIn(token, text)
        current = CURRENT.read_text(encoding="utf-8")
        self.assertIn("GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01", current)

        data = json.loads(W6_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"start_minute": 23, "end_minute": 30}, data["segment"])
        self.assertEqual({"known": 2, "unknown": 2, "lens": 1}, data["entry_summary"])
        self.assertEqual("CIRCUIT_PREPARATION_BASE_PREVIEW_NO_TARGET", data["stage2"]["contract"])
        self.assertFalse(data["stage2"]["target_selection_allowed"])
        self.assertTrue(data["stage3"]["explicit_target_required"])
        self.assertEqual("OBSERVED_EVIDENCE_ONLY", data["stage3"]["forecast"]["source_scope"])
        self.assertEqual(
            ["KNOWN_IMPROVEMENT", "UNCERTAIN_CONSEQUENCE", "FINAL_TARGET_SUCCESS_BREAKDOWN", "MANA_COST"],
            data["stage3"]["forecast"]["required_fields"],
        )
        self.assertFalse(data["stage3"]["forecast"]["unknown_can_change_commit_success"])
        self.assertTrue(data["stage3"]["explicit_commit_required"])
        self.assertFalse(data["stage3"]["named_intent_route_buttons"])
        self.assertTrue(data["post_commit"]["first_accepted_w6_result_remains_true"])
        self.assertTrue(data["post_commit"]["unknown_can_add_later_context_or_side_effect"])
        self.assertEqual("NOT_RUN", data["human_validation"])

    def test_w7_preserved_fact_context_delta_refinement(self):
        self.assertTrue(W7_CANON.is_file(), W7_CANON)
        self.assertTrue(W7_FIXTURE.is_file(), W7_FIXTURE)
        text = W7_CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01",
            "PRESERVED_FACT_CONTEXT_DELTA",
            "W6_RESULT_ANCHOR",
            "POST_W6_DEEPER_REVISION_COUPLING",
            "STILL_TRUE",
            "NEWLY_LEARNED",
            "NEW_TENSION",
            "MEANINGFUL_JUDGMENT_CHANGE_REQUIRED",
            "NO_NUMBER_ONLY_AMPLIFICATION",
            "NO_OLD_REPAIR_RECORD_REPLAY",
            "NO_W6_ROLLBACK",
            "NO_NAMED_CORRECT_ROUTE",
        ):
            self.assertIn(token, text)
        current = CURRENT.read_text(encoding="utf-8")
        self.assertIn("GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01", current)

        data = json.loads(W7_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"start_minute": 30, "end_minute": 39}, data["segment"])
        self.assertEqual("W6_RESULT_ANCHOR", data["reveal"]["first_phase"])
        self.assertTrue(data["reveal"]["w6_improvement_remains_true"])
        self.assertEqual("POST_W6_DEEPER_REVISION_COUPLING", data["reveal"]["new_context_source"])
        self.assertFalse(data["reveal"]["replays_old_repair_record_node"])
        self.assertEqual(["STILL_TRUE", "NEWLY_LEARNED", "NEW_TENSION"], data["reveal"]["summary_fields"])
        self.assertEqual(1, data["reveal"]["new_coupling_count"])
        self.assertEqual(1, data["reveal"]["strong_pressure_source_count"])
        self.assertEqual(
            {"meaning_and_circuit", "target", "tradeoff", "contextual_use"},
            set(data["redesign"]["allowed_meaningful_change_dimensions"]),
        )
        self.assertTrue(data["redesign"]["must_change_at_least_one_dimension"])
        self.assertFalse(data["redesign"]["number_only_amplification_allowed"])
        self.assertFalse(data["redesign"]["named_correct_route_allowed"])
        self.assertTrue(data["redesign"]["explicit_commit_required"])
        self.assertTrue(data["post_commit"]["w6_preserved_fact_still_true"])
        self.assertEqual("NOT_RUN", data["human_validation"])

    def test_result_grimoire_layered_causal_debrief_refinement(self):
        self.assertTrue(RESULT_CANON.is_file(), RESULT_CANON)
        self.assertTrue(RESULT_FIXTURE.is_file(), RESULT_FIXTURE)
        text = RESULT_CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01",
            "LAYERED_CAUSAL_DEBRIEF_PLAYER_PRINCIPLE",
            "FIVE_AXIS_RESULT_SNAPSHOT",
            "NO_GLOBAL_SUCCESS_GRADE",
            "CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY",
            "UNOBSERVED_CAUSE_FORBIDDEN",
            "COST_FORGONE_DISCOVERY_SEPARATE",
            "INTENT_TAGS_DERIVED_NEUTRAL",
            "SHORT_PLAYER_PRINCIPLE_NAMING",
            "SYSTEM_DOES_NOT_AUTHOR_PRINCIPLE",
            "PRINCIPLE_NOT_GRADED",
            "NO_IMMEDIATE_STAT_BONUS_FROM_PRINCIPLE",
        ):
            self.assertIn(token, text)
        current = CURRENT.read_text(encoding="utf-8")
        self.assertIn("GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01", current)

        data = json.loads(RESULT_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"start_minute": 39, "end_minute": 44}, data["segment"])
        self.assertEqual(
            ["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"],
            data["result_snapshot"]["dimensions"],
        )
        self.assertFalse(data["result_snapshot"]["global_success_grade"])
        self.assertFalse(data["result_snapshot"]["global_total_score"])
        self.assertFalse(data["result_snapshot"]["star_rating"])
        self.assertEqual("CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY", data["causal_thread"]["contract"])
        self.assertTrue(data["causal_thread"]["unobserved_cause_forbidden"])
        self.assertEqual(
            [
                "observations",
                "w6_meaning_and_circuit",
                "w6_selected_target",
                "w6_actual_result",
                "post_w6_context_delta",
                "w7_changed_judgment",
                "w7_actual_result",
            ],
            data["causal_thread"]["ordered_fields"],
        )
        self.assertTrue(data["debrief"]["cost_forgone_separate"])
        self.assertTrue(data["debrief"]["discoveries_separate"])
        self.assertEqual("INTENT_TAGS_DERIVED_NEUTRAL", data["debrief"]["intent_tags_contract"])
        self.assertEqual("SHORT_PLAYER_PRINCIPLE_NAMING", data["player_principle"]["contract"])
        self.assertFalse(data["player_principle"]["system_authors_principle"])
        self.assertFalse(data["player_principle"]["graded"])
        self.assertFalse(data["player_principle"]["immediate_stat_bonus"])
        self.assertEqual("NOT_RUN", data["human_validation"])

    def test_portfolio_preview_evidence_echo_refinement(self):
        self.assertTrue(PORTFOLIO_CANON.is_file(), PORTFOLIO_CANON)
        self.assertTrue(PORTFOLIO_FIXTURE.is_file(), PORTFOLIO_FIXTURE)
        text = PORTFOLIO_CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01",
            "EVIDENCE_ECHO_ONE_OPEN_QUESTION",
            "MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT",
            "PORTFOLIO_RECEIPT",
            "OPEN_QUESTION_NOT_OBJECTIVE",
            "FESTIVAL_PREVIEW_ONLY",
            "NO_MENTOR_GRADE",
            "NO_RESULT_RESCORING",
            "next_quest_choice: false",
            "NO_SECOND_INCIDENT",
            "NO_LORE_DUMP",
            "NO_NEW_GAMEPLAY_DECISION",
        ):
            self.assertIn(token, text)
        current = CURRENT.read_text(encoding="utf-8")
        self.assertIn("GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01", current)

        data = json.loads(PORTFOLIO_FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"start_minute": 44, "end_minute": 46}, data["segment"])
        self.assertEqual("MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT", data["mentor_echo"]["contract"])
        self.assertLessEqual(data["mentor_echo"]["max_echo_elements"], 3)
        self.assertTrue(data["mentor_echo"]["actual_receipts_only"])
        self.assertFalse(data["mentor_echo"]["can_grade"])
        self.assertFalse(data["mentor_echo"]["can_rescore_result"])
        self.assertEqual(
            ["principle_saved", "causal_evidence_linked", "unresolved_tension_carried"],
            data["portfolio_receipt"]["fields"],
        )
        self.assertEqual("OPEN_QUESTION_NOT_OBJECTIVE", data["open_question"]["contract"])
        self.assertFalse(data["open_question"]["quest_marker"])
        self.assertFalse(data["open_question"]["reward"])
        self.assertFalse(data["open_question"]["required_tracking"])
        self.assertFalse(data["open_question"]["choice_branch"])
        self.assertEqual("FESTIVAL_PREVIEW_ONLY", data["festival"]["contract"])
        self.assertFalse(data["festival"]["playable"])
        self.assertFalse(data["festival"]["starts_second_incident"])
        self.assertFalse(data["session_end"]["new_gameplay_decision"])
        self.assertEqual("NOT_RUN", data["human_validation"])

    def test_walkthrough_transfers_class_learning_to_field_by_minute_10(self):
        text = WALK.read_text(encoding="utf-8")
        for token in (
            "BEAT_01 — 00–05 CLASS_SAFE_PRECEDENT",
            "BEAT_02 — 05–10 GUIDED_FIELD_PRACTICUM",
            "W1: apply FLOW",
            "W2: apply FOCUS",
            "W3: apply DISPERSE",
            "W4",
            "FIVE_POINT_STAR",
            "first observable field consequence occurs by minute 10",
        ):
            self.assertIn(token, text)
        self.assertNotIn("BEAT_02 — 06–11 CAMPUS_MICRO_CRAFTING", text)

    def test_current_decisions_points_to_first_10_minute_refinement(self):
        text = CURRENT.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01",
            "FIRST_10_MIN_CLASS_TO_GUIDED_PRACTICUM",
            "first_10_minute_target_minutes: 10",
        ):
            self.assertIn(token, text)

    def test_first_solution_and_route_button_guards(self):
        text = CANON.read_text(encoding="utf-8") + "\n" + FIRST10.read_text(encoding="utf-8")
        self.assertIn("첫 `W6` 주요 해결은 반드시 실제 상태를 개선", text)
        self.assertIn("정답 루트 버튼으로 노출하지 않는다", text)
        self.assertIn("Historical 3×3", text)
        self.assertIn("DOES_NOT_REPLACE_W6_W7", text)

    def test_readme_uses_current_single_incident_slice(self):
        text = README.read_text(encoding="utf-8")
        for token in (
            "서리꽃 온실의 심장 / SINGLE_INCIDENT_SPIRAL",
            "FIVE_POINT_STAR",
            "Task 3~7 MERGED_MAIN_VERIFIED",
            "LOCAL_ACCEPTANCE_PASS_UNMERGED / PR_PREP_REVERIFY_PENDING",
            "Human validation | `NOT_RUN`",
            "Device validation | `NOT_RUN`",
            "Performance validation | `NOT_RUN`",
            "Full Vertical Slice validation | `NOT_RUN`",
            "b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a",
        ):
            self.assertIn(token, text)
        for stale in (
            "첫 수업·교내 연습\n→ 자유일정 A\n→ 첫 실기시험",
            "학교축제\n→ 자유일정 C\n→ 첫 현장실습",
            "저장소에는 아직 실행 가능한 Godot 제품 프로젝트가 없습니다.",
            "| 구현 | `NOT_STARTED` |",
        ):
            self.assertNotIn(stale, text)

    def test_benchmark_was_performed_before_plan(self):
        text = BENCH.read_text(encoding="utf-8")
        self.assertIn("PRE_IMPLEMENTATION_BENCHMARK_AND_INDUSTRY_RESEARCH", text)
        self.assertIn("INCIDENT_ORCHESTRATION_OVER_EXISTING_AUTHORITIES", text)
        self.assertIn("SYSTEMIC_MAGIC_SCHOOL_RPG", text)

    def test_plan_preserves_authoring_and_task8_gates(self):
        text = PLAN.read_text(encoding="utf-8")
        self.assertIn("BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY", text)
        self.assertIn("GitHub text-write bypass is forbidden", text)
        self.assertIn("Task8 Spell Use remains a separate product implementation authority", text)

    def test_plan_reuses_existing_authorities(self):
        text = PLAN.read_text(encoding="utf-8")
        for token in (
            "SpellWorkflowCoordinator",
            "AtomicSpellUseService",
            "AtomicResultLedger",
            "SaveRepository",
        ):
            self.assertIn(token, text)

    def test_no_runtime_validation_is_promoted_by_planning(self):
        text = CANON.read_text(encoding="utf-8") + "\n" + FIRST10.read_text(encoding="utf-8") + "\n" + PLAN.read_text(encoding="utf-8")
        for token in (
            "human_validation: NOT_RUN",
            "device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "full_slice_validation: NOT_RUN",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
