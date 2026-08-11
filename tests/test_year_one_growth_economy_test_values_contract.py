import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
APPROVAL = ROOT / "docs/planning/YEAR_ONE_GROWTH_ECONOMY_TEST_VALUES_01_APPROVAL_2026-08-11.md"
THIN_SPEC = ROOT / "docs/superpowers/specs/2026-08-11-year-one-growth-economy-test-values-design.md"
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"


class YearOneGrowthEconomyTestValuesContract(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.body = APPROVAL.read_text(encoding="utf-8")
        cls.thin = THIN_SPEC.read_text(encoding="utf-8")
        cls.current = CURRENT.read_text(encoding="utf-8")

    def test_decision_is_user_approved_test_value_not_final_balance(self):
        self.assertIn("decision_id: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01", self.body)
        self.assertIn("status: USER_APPROVED_TEST_VALUES_ACTIVE", self.body)
        self.assertIn("sync_id: GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES", self.body)
        self.assertIn("test_value_not_final_balance: true", self.body)
        self.assertIn("FINAL_BALANCE = NOT_PROVEN", self.body)

    def test_current_snapshot_preserves_b_as_approved_predecessor_and_points_to_d(self):
        self.assertIn("## GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01 — approved planning decision", self.current)
        self.assertIn("successor: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01", self.current)
        self.assertIn("current_planning_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01", self.current)
        self.assertIn("current_planning_sync: GR-SYNC-20260811-12-FROSTBLOOM-POSTMERGE-CURRENT-CONSUMER-CLEANUP", self.current)
        self.assertIn("supplemental_sync: GR-SYNC-20260811-08-WORLD-NAME-CONSUMER-CLEANUP", self.current)

    def test_year_one_has_six_large_free_schedule_windows(self):
        self.assertIn("year_one_free_schedule_windows: 6", self.body)
        self.assertIn("free_schedule_distribution: CH1_TO_CH6_ONE_EACH_CH7_NONE", self.body)
        for axis in ["휴식", "준비", "교류", "선택형_현장실습"]:
            self.assertIn(f"  - {axis}", self.body)
        self.assertIn("중심행동 정확히 `1`개", self.body)
        self.assertIn("어떤 자유일정 축도 메인 진행·필수 정보·필수 제작 재료를 독점할 수 없다", self.body)

    def test_course_focus_is_two_of_three_without_early_permanent_lock(self):
        self.assertIn("term_1: COMMON_FOUNDATION_NO_FOCUS_CHOICE", self.body)
        self.assertIn("term_2: PICK_2_DISTINCT_OF_3", self.body)
        self.assertIn("term_3: PICK_2_DISTINCT_OF_3_FREE_RESELECT_NO_PENALTY", self.body)
        for school in ["FLOW", "HEAT", "PROTECT"]:
            self.assertIn(f"  - {school}", self.body)
        self.assertIn("Focus하지 않은 계열도 기본 사용과 메인 진행이 가능하다", self.body)

    def test_specialization_readiness_uses_three_two_one_evidence_and_bridge(self):
        self.assertIn("valid_school_evidence_min: 3", self.body)
        self.assertIn("distinct_context_categories_min: 2", self.body)
        self.assertIn("responsibility_or_reflection_evidence_min: 1", self.body)
        self.assertIn("repeated_casting_alone: INVALID", self.body)
        self.assertIn("year_two_bridge_assignment_if_short: 1", self.body)
        self.assertIn("전문화 영구 잠금", self.body)

    def test_portfolio_is_four_equal_axes_and_numbers_hidden_mid_term(self):
        for token in [
            "principle_understanding: 25",
            "context_application: 25",
            "responsibility_recovery: 25",
            "reflection_explanation: 25",
        ]:
            self.assertIn(token, self.body)
        self.assertIn("mid_term_numeric_visibility: HIDDEN", self.body)
        self.assertIn("별도 시험을 만들지 않는다", self.body)

    def test_hidden_deduction_is_responsibility_only_and_capped(self):
        self.assertIn("per_incident_max: -2", self.body)
        self.assertIn("per_semester_max: -6", self.body)
        self.assertIn("ordinary_failure_or_partial_success_alone: NO_SEPARATE_NUMERIC_DEDUCTION", self.body)
        self.assertIn("HIDDEN_DEDUCTION_ONLY_FOR_AVOIDABLE_IRRESPONSIBILITY", self.body)
        self.assertIn("conflict: NONE", self.body)

    def test_internal_grade_bands_are_test_values_not_game_over(self):
        for token in ["A: 85_TO_100", "B: 70_TO_84", "C: 55_TO_69", "D: BELOW_55"]:
            self.assertIn(token, self.body)
        self.assertIn("`D`는 게임오버가 아니다", self.body)
        self.assertIn("장학 즉시 박탈", self.body)

    def test_crafting_scope_is_six_eight_three_twelve_and_no_new_currency(self):
        for token in [
            "general_material_groups: 6",
            "reusable_core_recipes: 8",
            "max_material_inputs_per_craft: 3",
            "inventory_cap_per_material_group: 12",
        ]:
            self.assertIn(token, self.body)
        self.assertIn("새 범용 화폐를 추가하지 않는다", self.body)
        self.assertIn("Gold, Mana, Typed Glyph Stock", self.body)
        self.assertIn("재료군을 FLOW/HEAT/PROTECT에 1:1 귀속시키지 않는다", self.body)

    def test_required_story_materials_have_one_point_five_x_guarantee(self):
        self.assertIn("required_story_material_guarantee: CEIL_1_5_X_REQUIRED", self.body)
        self.assertIn("ceil(1.5 × M)", self.body)
        self.assertIn("선택형 현장실습 반복이 없으면 메인 제작 불가능", self.body)

    def test_practicum_repeat_rewards_are_one_hundred_fifty_twenty_five_zero(self):
        for token in [
            "first_unique_completion: 100",
            "new_condition_or_meaningfully_different_solution: 50",
            "first_same_condition_same_solution_repeat: 25",
            "further_identical_repeat: 0",
        ]:
            self.assertIn(token, self.body)
        self.assertIn("핵심 성장자원, 평가, 접근권한은 동일 반복으로 무한 축적되지 않는다", self.body)

    def test_stock_summon_star_spell_and_slice_ownership_are_preserved(self):
        for token in [
            "GM-STOCK-SYSTEM-01 수치",
            "GM-SUMMON-SYSTEM-01 수치",
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01 계수·숙련 계산",
            "GM-SPELL-WORKFLOW-UI-V2-01 Stage/소비/Exactly-once 의미",
            "D Vertical Slice 장면별 시간·밀도·작성 횟수·Mock 수",
        ]:
            self.assertIn(token, self.body)
        self.assertIn("persistent_godot_source_mutation: NONE", self.body)

    def test_superpowers_spec_is_thin_and_points_to_project_canon(self):
        self.assertIn("process_overlay: SUPERPOWERS_BRAINSTORMING", self.thin)
        self.assertIn("canon_owner: GRIMOIRE_PROJECT_PLANNING", self.thin)
        self.assertIn("canonical_decision: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01", self.thin)
        self.assertIn("thin spec", self.thin)
        self.assertIn("D requires a separate brainstorming/design approval", self.thin)


if __name__ == "__main__":
    unittest.main()
