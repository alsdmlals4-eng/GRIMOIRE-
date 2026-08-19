from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
CANON = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md"
BENCH = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md"
README = ROOT / "README.md"


class FrostbloomInternalVerticalSliceContractTests(unittest.TestCase):
    def test_required_planning_artifacts_exist(self):
        for path in (CANON, BENCH, PLAN, README):
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

    def test_first_solution_and_route_button_guards(self):
        text = CANON.read_text(encoding="utf-8")
        self.assertIn("첫 `W6` 주요 해결은 반드시 실제 상태를 개선", text)
        self.assertIn("정답 루트 버튼으로 노출하지 않는다", text)
        self.assertIn("Historical 3×3", text)

    def test_readme_uses_current_single_incident_slice(self):
        text = README.read_text(encoding="utf-8")
        for token in (
            "서리꽃 온실의 심장",
            "SINGLE_INCIDENT_SPIRAL",
            "FIVE_POINT_STAR",
            "Task 3~7",
            "Task 8",
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
        text = CANON.read_text(encoding="utf-8") + "\n" + PLAN.read_text(encoding="utf-8")
        for token in (
            "human_validation: NOT_RUN",
            "device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "full_slice_validation: NOT_RUN",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
