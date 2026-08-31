from __future__ import annotations

import json
import re
import subprocess
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def load_json(path: str) -> dict:
    return json.loads((ROOT / path).read_text(encoding="utf-8"))


class CurrentAuthorityRealityContractTests(unittest.TestCase):
    def setUp(self) -> None:
        self.adapter = load_json("skills/PROJECT_BASE_ADAPTER.json")
        self.registry = load_json("skills/SKILL_REGISTRY.json")
        self.base_view = load_json("skills/BASE_V9_ADAPTER.json")
        self.skill_view = load_json("skills/PROJECT_BASE_SKILL_ADAPTER.json")

    def test_repository_reality_is_not_planning_only_or_not_created(self) -> None:
        project_file = ROOT / "project.godot"
        self.assertTrue(project_file.is_file())
        project_text = project_file.read_text(encoding="utf-8")
        project = self.adapter["project"]
        main_scene_path = project["main_scene"]
        root_scene_text = (ROOT / main_scene_path.removeprefix("res://")).read_text(encoding="utf-8")
        root_uid = re.search(r'uid="(uid://[^"]+)"', root_scene_text)
        self.assertIsNotNone(root_uid)
        accepted_main_settings = (f'run/main_scene="{root_uid.group(1)}"', f'run/main_scene="{main_scene_path}"')
        self.assertTrue(any(setting in project_text for setting in accepted_main_settings))

        current = self.adapter["current_state"]
        self.assertEqual("CREATED", project["godot_project_status"])
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", project["execution_profile"])
        self.assertEqual("IMPLEMENT_AND_VALIDATE", project["work_mode"])
        self.assertEqual("res://src/ui/front_door/story_front_door.tscn", project["main_scene"])
        self.assertEqual("STORY_FRONT_DOOR_ENTRY", project["main_scene_role"])
        self.assertEqual("PARTIAL_FOUNDATION", current["implementation"])
        self.assertEqual("CIRCLE_CLOCK_TASK8_STAR_REMOVAL_PRECHECK", current["next_product_gate"])
        self.assertEqual("MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY", current["task9_status"])
        self.assertEqual("CIRCLE_CLOCK_PARTIAL_AUTOMATED_RUNTIME_AND_EDITOR_RENDER_PASS__HUMAN_NOT_RUN", current["runtime_validation"])
        self.assertEqual("NOT_RUN", current["human_validation"])
        self.assertEqual("NOT_RUN", current["mobile_device_validation"])
        self.assertEqual("NOT_RUN", current["full_vertical_slice"])

    def test_repository_only_human_canon_and_sheet_retirement_are_explicit(self) -> None:
        authority = self.adapter["workspace_authority"]
        self.assertEqual("REPOSITORY_HUMAN_FACING_CANON", authority["human_facing_canon"])
        self.assertEqual("REPOSITORY_STRUCTURED_AND_RUNTIME_CANON", authority["repository_canon"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", authority["google_sheets"])
        self.assertEqual("docs/PROJECT_HOME.md", authority["project_home"])
        self.assertEqual("RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE", authority["notion_policy"])
        self.assertEqual("MERGED_MAIN_READ_BACK__GR_NOTION_MIGRATION_20260828_01", authority["notion_migration_state"])

        sheet = self.adapter["gdd_sheet"]
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", sheet["role"])
        self.assertEqual("NO_NEW_CANON_WRITES", sheet["write_policy"])
        self.assertEqual("UNIQUE_MATERIAL_AUDIT_REQUIRED", sheet["retirement_gate"])
        self.assertNotIn("google_sheet_contract", self.adapter["entrypoints"])
        self.assertNotIn("project_sheet", self.registry["execution_contracts"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", self.registry["google_sheet"]["role"])
        self.assertFalse(self.registry["routing_policy"].get("major_approved_change_requires_immediate_github_and_sheet_sync", False))
        self.assertTrue(self.registry["routing_policy"]["major_approved_change_requires_github_repository_sync"])
        self.assertTrue(self.registry["routing_policy"]["notion_routine_read_write_forbidden"])
        self.assertNotIn("major_approved_change_requires_github_and_notion_sync", self.registry["routing_policy"])
        self.assertEqual(authority, self.registry["workspace_authority"])

    def test_registry_matches_current_platform_and_implementation(self) -> None:
        project = self.registry["project"]
        coverage = self.registry["current_gate_coverage"]
        self.assertEqual("Mobile", project["primary_platform"])
        self.assertEqual("PC", project["follow_up_platform"])
        self.assertEqual("PARTIAL_FOUNDATION", project["implementation_status"])
        self.assertEqual("CIRCLE_CLOCK_TASK8_STAR_REMOVAL_PRECHECK", project["next_product_gate"])
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", project["execution_profile"])
        self.assertEqual("CIRCLE_CLOCK_PARTIAL_AUTOMATED_RUNTIME_AND_EDITOR_RENDER_PASS__HUMAN_NOT_RUN", coverage["godot"])
        self.assertEqual("CIRCLE_CLOCK_TASK8_STAR_REMOVAL_PRECHECK", coverage["spell_workflow"])
        self.assertEqual("COMPLETE_FROSTBLOOM_FIRST_SESSION", coverage["planning"])
        self.assertEqual("APPROVED_SPEC", coverage["asset_spec_01"])

    def test_visual_runtime_inventory_distinguishes_merged_glyphs_from_partially_bound_img02_sources(self) -> None:
        coverage = load_json("docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json")
        checklist = load_json("docs/planning/visual/GRIMOIRE_VISUAL_PRODUCTION_CHECKLIST_2026-08-26.json")
        queue = load_json("docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json")

        current = coverage["current_runtime_readback"]
        self.assertEqual("CIRCLE_CLOCK_TASK8_STAR_REMOVAL_PRECHECK", current["next_product_gate"])
        self.assertEqual("res://src/ui/front_door/story_front_door.tscn", current["main_scene"])
        self.assertEqual(6, current["glyph_runtime_asset_count"])
        self.assertEqual("LEGACY_RUNTIME_NOT_CURRENT_MAIN", current["glyph_consumer_state"])
        self.assertEqual(
            "LOCKED_ADMISSION_BACKGROUND_CURRENT_FRONT_DOOR_BOUND; "
            "LEGACY_PRODUCT_ROOT_BACKGROUND_BINDINGS_RETAINED_PENDING_STAR_REMOVAL",
            current["img02_state"],
        )
        self.assertEqual(
            current["img02_state"],
            checklist["current_runtime_readback"]["img02_state"],
        )

        glyph_family = next(item for item in checklist["runtime_asset_families"] if item["asset_group_id"] == "GR-RA-01-GLYPH-BASE")
        self.assertEqual("LEGACY_RUNTIME_NOT_CURRENT_MAIN", glyph_family["consumer_state"])
        self.assertEqual(6, glyph_family["asset_spec"]["count_cap"])
        self.assertEqual(["heat", "protect", "flow", "focus", "disperse", "burst"], glyph_family["asset_spec"]["base_names"])

        img02 = next(item for item in queue["goal_queue"] if item["goal_id"] == "IMG-02")
        self.assertEqual(
            "FIELD_BASE_CURRENT_PRODUCT_ROOT_BOUND; "
            "SCHOOL_AND_BATTLE_CANDIDATES_REMAIN_UNBOUND; "
            "NATIVE_RESOLUTION_WEBP_CANDIDATES_READY",
            img02["status"],
        )

    def test_generated_views_derive_current_reality_from_adapter(self) -> None:
        project = self.adapter["project"]
        current = self.adapter["current_state"]
        self.assertEqual(project, self.base_view["project"])
        self.assertEqual("PARTIAL_FOUNDATION", self.base_view["maturity"]["status"])
        self.assertEqual(current["next_product_gate"], self.base_view["maturity"]["next_gate"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", self.base_view["legacy_sheet"]["role"])

        engine = self.skill_view["engine"]
        execution = self.skill_view["execution_contracts"]
        self.assertEqual("project.godot", engine["project_file"])
        self.assertEqual(project["main_scene"], engine["main_scene"])
        self.assertEqual(project["execution_profile"], execution["current_execution_profile"])
        self.assertEqual(project["work_mode"], execution["current_work_mode"])
        self.assertEqual("PARTIAL_FOUNDATION", self.skill_view["implementation_permissions"]["product_state"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", self.skill_view["legacy_sheet"]["role"])
        self.assertEqual(self.adapter["workspace_authority"], self.base_view["workspace_authority"])
        self.assertEqual(self.adapter["workspace_authority"], self.skill_view["workspace_authority"])

    def test_operating_dashboard_is_generated_from_current_adapter(self) -> None:
        result = subprocess.run(
            ["python", "tools/generate_project_operating_views.py"],
            cwd=ROOT,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)
        dashboard = (ROOT / "docs/PROJECT_OPERATING_DASHBOARD.html").read_text(encoding="utf-8")
        self.assertIn("9.4.3", dashboard)
        self.assertIn("REPOSITORY_HUMAN_FACING_CANON", dashboard)
        self.assertIn("docs/PROJECT_HOME.md", dashboard)
        self.assertIn(self.adapter["current_state"]["next_product_gate"], dashboard)
        self.assertIn("REQUIRED_ON_MATERIAL_WORK", dashboard)

    def test_active_sync_policy_is_repository_only_not_sheet(self) -> None:
        policy = (ROOT / "docs/planning/PROJECT_CANON_SYNC_POLICY.md").read_text(encoding="utf-8")
        workbook = (ROOT / "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(encoding="utf-8")
        self.assertIn("REPOSITORY_HUMAN_FACING_CANON", policy)
        self.assertIn("REPOSITORY_STRUCTURED_AND_RUNTIME_CANON", policy)
        self.assertIn("GOOGLE_SHEETS_MIGRATION_ONLY_UNTIL_REMOVAL", policy)
        self.assertIn("RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE", policy)
        self.assertNotIn("NOTION_HUMAN_FACING_CANON", policy)
        self.assertNotIn("USER_FACING_GDD_WORKSPACE", policy)
        self.assertIn("MIGRATION_ONLY_UNTIL_REMOVAL", workbook)
        self.assertIn("BLOCKED_UNVERIFIED_UNIQUE_MATERIAL", workbook)

    def test_material_work_requires_research_feasibility_and_adversarial_review(self) -> None:
        policy_path = "docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md"
        policy = (ROOT / policy_path).read_text(encoding="utf-8")
        validation = self.adapter["validation"]
        routing_policy = self.registry["routing_policy"]

        self.assertIn("GM-ADVERSARIAL-RESEARCH-FEASIBILITY-GATE-20260828-01", policy)
        self.assertIn("FRESH_EXTERNAL_RESEARCH_CHECK_REQUIRED", policy)
        self.assertIn("IMPLEMENTATION_FEASIBILITY_RECHECK_REQUIRED", policy)
        self.assertIn("MINIMUM_FIVE_FULL_SCOPE_LOOPS_FOR_L1_PR_OR_IMPLEMENTATION", policy)
        self.assertIn("REPOSITORY_HUMAN_FACING_CANON", policy)
        self.assertIn("RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE", policy)

        self.assertEqual("REQUIRED_ON_MATERIAL_WORK", validation["adversarial_research_feasibility_gate"])
        self.assertEqual("FRESH_RELEVANT_CHECK_REQUIRED", validation["external_research"])
        self.assertEqual("ACTUAL_PROJECT_EVIDENCE_REQUIRED", validation["implementation_feasibility"])
        self.assertTrue(routing_policy["material_work_requires_adversarial_research_feasibility_gate"])

        for relative_path in ("AGENTS.md", "START_HERE.md", "docs/ACTIVE_CONTEXT.md", "docs/DEVELOPMENT_GATES.md"):
            text = (ROOT / relative_path).read_text(encoding="utf-8")
            self.assertIn(policy_path, text, relative_path)

    def test_active_context_does_not_treat_merged_pr151_or_transient_pr_state_as_canon(self) -> None:
        active = (ROOT / "docs/ACTIVE_CONTEXT.md").read_text(encoding="utf-8")
        self.assertIn("open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED", active)
        self.assertIn("component_sheet_pr151: MERGED_MAIN_VERIFIED", active)
        self.assertNotIn("parallel_open_pr: NONE", active)
        self.assertNotIn("PR151_DO_NOT_TOUCH", active)
        self.assertNotIn("PR #151 `visual/component-sheets-semantic-ui-execution`은 진행 중 Draft", active)
        self.assertNotIn("authority_sync_pr: CURRENT_TASK_PR_PENDING", active)
        self.assertIn("authority_sync_pr_predecessor: 158", active)
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", active)
        self.assertIn("FULL_VERTICAL_SLICE_NOT_RUN", active)

    def test_active_entrypoints_promote_task9_and_quarantine_pre_task9_markers(self) -> None:
        for relative_path in ("START_HERE.md", "docs/ACTIVE_CONTEXT.md"):
            text = (ROOT / relative_path).read_text(encoding="utf-8")
            self.assertIn("three_screen_runtime: TASK9_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE_READY", text)
            self.assertIn("three_screen_runtime_historical: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9", text)

        gates = (ROOT / "docs/DEVELOPMENT_GATES.md").read_text(encoding="utf-8")
        self.assertIn("PR #151 is merged history/current-main input; live open PRs remain read-only.", gates)
        self.assertNotIn("PR #151 `visual/component-sheets-semantic-ui-execution`은 진행 중 Draft다.", gates)

    def test_task8_reverify_quarantines_historical_pr151_marker(self) -> None:
        reverify = (ROOT / "docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md").read_text(encoding="utf-8")
        self.assertIn("snapshot_role: HISTORICAL_REMOTE_LOCAL_REVERIFY_PROVENANCE", reverify)
        self.assertIn("current_pr_state_authority: LIVE_GITHUB_READBACK", reverify)
        self.assertIn("parallel_pr_151_at_2026_08_21: DO_NOT_TOUCH", reverify)
        self.assertIn("PR #151", reverify)
        self.assertIn("현재 상태로 재사용하지 않는다", reverify)
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", reverify)

    def test_active_entry_docs_bind_v48_without_pinning_transient_state(self) -> None:
        expected_contract = "PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8"
        expected_revision = "2026-08-26-r5.4-superset-final"
        binding_path = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md"
        self.assertTrue(binding_path.is_file())
        binding = binding_path.read_text(encoding="utf-8")
        self.assertIn("contract_version: '4.8'", binding)
        self.assertIn(f"revision: '{expected_revision}'", binding)
        self.assertIn("THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON", binding)
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", binding)
        self.assertIn("LOCAL_SYNC: NOT_RUN / BLOCKED_NO_LOCAL_ACCESS", binding)

        required_active_docs = [
            "AGENTS.md",
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
        ]
        for relative_path in required_active_docs:
            text = (ROOT / relative_path).read_text(encoding="utf-8")
            self.assertIn(expected_contract, text, relative_path)
            self.assertIn(f"contract_revision: {expected_revision}", text, relative_path)
            self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", text, relative_path)
            self.assertIn("open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED", text, relative_path)
            self.assertIn("local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED", text, relative_path)
            self.assertIn("authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
            self.assertIn("authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
            self.assertIn("authority_sync_pr_predecessor: 158", text, relative_path)
            self.assertNotIn("authority_sync_pr: CURRENT_TASK_PR_PENDING", text, relative_path)
            self.assertNotIn("active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5", text, relative_path)
            self.assertNotIn("current_task_pr:", text, relative_path)
            self.assertNotIn("parallel_open_pr: NONE", text, relative_path)
            self.assertNotIn("\nlocal_sync: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
            self.assertNotIn("\ngodot_run: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
            self.assertNotIn("PR #158 v4.8 authority correction RED→GREEN", text, relative_path)

        agents = (ROOT / "AGENTS.md").read_text(encoding="utf-8")
        start = (ROOT / "START_HERE.md").read_text(encoding="utf-8")
        active = (ROOT / "docs/ACTIVE_CONTEXT.md").read_text(encoding="utf-8")
        self.assertNotIn("PR #151은 `DO_NOT_TOUCH`", agents)
        self.assertNotIn("parallel_open_pr: PR151_DO_NOT_TOUCH", start)
        self.assertIn("component_sheet_pr151: MERGED_MAIN_VERIFIED", start)
        for text in (agents, start, active):
            normalized = text.lower().replace("_", " ")
            self.assertIn("historical compatibility", normalized)
            self.assertIn("CURRENT_CONFIRMED_DECISIONS.md", text)
            self.assertIn("CURRENT_UNRESOLVED_GATES.md", text)

    def test_task8_plan_uses_v48_recovery_and_current_semantic_ui_routing(self) -> None:
        plan = (ROOT / "docs/superpowers/plans/2026-08-11-task8-spell-use-screen.md").read_text(encoding="utf-8")
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", plan)
        self.assertIn("FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED", plan)
        self.assertIn("ContextTargetSelector", plan)
        self.assertIn("ForecastCard", plan)
        self.assertIn("CommitBar", plan)
        self.assertIn("FORECAST_SEMANTICS_SOURCE_REQUIRED", plan)
        self.assertIn("SPELL_USE_ID_CALLER_SUPPLIED_ONLY", plan)
        self.assertIn("CURRENT_RUNNER_SUITE_COUNT_PLUS_ONE", plan)
        self.assertIn("Historical Task 8 project/Base SHAs", plan)
        self.assertIn("MIGRATION_ONLY_UNTIL_REMOVAL", plan)
        self.assertNotIn("synchronize GitHub canon + Google Sheet", plan)
        self.assertNotIn("HiGodot v3.1.4 live/tracked alignment readback\n→ Task 8 focused GUT RED", plan)


if __name__ == "__main__":
    unittest.main()
