from __future__ import annotations

import json
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
        self.assertIn('run/main_scene="res://src/ui/star_circuit_harness.tscn"', project_text)

        project = self.adapter["project"]
        current = self.adapter["current_state"]
        self.assertEqual("CREATED", project["godot_project_status"])
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", project["execution_profile"])
        self.assertEqual("IMPLEMENT_AND_VALIDATE", project["work_mode"])
        self.assertEqual("res://src/ui/star_circuit_harness.tscn", project["main_scene"])
        self.assertEqual("DEVELOPMENT_RUNTIME_POC_ENTRY", project["main_scene_role"])
        self.assertEqual("PARTIAL_FOUNDATION", current["implementation"])
        self.assertEqual("TASK8_PR_PREP_REVERIFY_PENDING", current["next_product_gate"])
        self.assertEqual("NOT_RUN", current["human_validation"])
        self.assertEqual("NOT_RUN", current["mobile_device_validation"])
        self.assertIn("FULL_SLICE_NOT_RUN", current["runtime_validation"])

    def test_domain_split_authority_and_sheet_retirement_are_explicit(self) -> None:
        authority = self.adapter["workspace_authority"]
        self.assertEqual("NOTION_HUMAN_FACING_CANON", authority["human_facing_canon"])
        self.assertEqual("REPOSITORY_STRUCTURED_AND_RUNTIME_CANON", authority["repository_canon"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", authority["google_sheets"])

        sheet = self.adapter["gdd_sheet"]
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", sheet["role"])
        self.assertEqual("NO_NEW_CANON_WRITES", sheet["write_policy"])
        self.assertEqual("UNIQUE_MATERIAL_AUDIT_REQUIRED", sheet["retirement_gate"])
        self.assertNotIn("google_sheet_contract", self.adapter["entrypoints"])
        self.assertNotIn("project_sheet", self.registry["execution_contracts"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", self.registry["google_sheet"]["role"])
        self.assertFalse(self.registry["routing_policy"].get("major_approved_change_requires_immediate_github_and_sheet_sync", False))
        self.assertTrue(self.registry["routing_policy"]["major_approved_change_requires_github_and_notion_sync"])

    def test_registry_matches_current_platform_and_implementation(self) -> None:
        project = self.registry["project"]
        coverage = self.registry["current_gate_coverage"]
        self.assertEqual("Mobile", project["primary_platform"])
        self.assertEqual("PC", project["follow_up_platform"])
        self.assertEqual("PARTIAL_FOUNDATION", project["implementation_status"])
        self.assertEqual("TASK8_PR_PREP_REVERIFY_PENDING", project["next_product_gate"])
        self.assertEqual("DEMO_FIRST_VERTICAL_SLICE_PARTIAL_FOUNDATION", project["execution_profile"])
        self.assertEqual("CREATED_STAR_RUNTIME_POC", coverage["godot"])
        self.assertEqual("COMPLETE_FROSTBLOOM_FIRST_SESSION", coverage["planning"])
        self.assertEqual("APPROVED_SPEC", coverage["asset_spec_01"])

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

    def test_active_sync_policy_is_notion_repository_not_sheet(self) -> None:
        policy = (ROOT / "docs/planning/PROJECT_CANON_SYNC_POLICY.md").read_text(encoding="utf-8")
        workbook = (ROOT / "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(encoding="utf-8")
        self.assertIn("NOTION_HUMAN_FACING_CANON", policy)
        self.assertIn("REPOSITORY_STRUCTURED_AND_RUNTIME_CANON", policy)
        self.assertIn("GOOGLE_SHEETS_MIGRATION_ONLY_UNTIL_REMOVAL", policy)
        self.assertNotIn("USER_FACING_GDD_WORKSPACE", policy)
        self.assertIn("MIGRATION_ONLY_UNTIL_REMOVAL", workbook)
        self.assertIn("BLOCKED_UNVERIFIED_UNIQUE_MATERIAL", workbook)

    def test_active_context_does_not_treat_merged_pr151_or_transient_pr_state_as_canon(self) -> None:
        active = (ROOT / "docs/ACTIVE_CONTEXT.md").read_text(encoding="utf-8")
        self.assertIn("open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED", active)
        self.assertIn("component_sheet_pr151: MERGED_MAIN_VERIFIED", active)
        self.assertNotIn("parallel_open_pr: NONE", active)
        self.assertNotIn("PR151_DO_NOT_TOUCH", active)
        self.assertNotIn("PR #151 `visual/component-sheets-semantic-ui-execution`은 진행 중 Draft", active)
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", active)
        self.assertIn("FULL_VERTICAL_SLICE_NOT_RUN", active)

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
        binding_path = ROOT / "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md"
        self.assertTrue(binding_path.is_file())
        binding = binding_path.read_text(encoding="utf-8")
        self.assertIn("contract_version: '4.8'", binding)
        self.assertIn("revision: '2026-08-24-r2'", binding)
        self.assertIn("THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON", binding)
        self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", binding)
        self.assertIn("LOCAL_SYNC: BLOCKED_NO_LOCAL_ACCESS", binding)

        required_active_docs = [
            "AGENTS.md",
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
        ]
        for relative_path in required_active_docs:
            text = (ROOT / relative_path).read_text(encoding="utf-8")
            self.assertIn(expected_contract, text, relative_path)
            self.assertIn("TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED", text, relative_path)
            self.assertIn("open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED", text, relative_path)
            self.assertIn("local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED", text, relative_path)
            self.assertIn("authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
            self.assertIn("authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS", text, relative_path)
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
            self.assertIn("authority_sync_pr: 158", text)
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
        self.assertIn("NOTION_HUMAN_FACING_CANON", plan)
        self.assertIn("MIGRATION_ONLY_UNTIL_REMOVAL", plan)
        self.assertNotIn("synchronize GitHub canon + Google Sheet", plan)
        self.assertNotIn("HiGodot v3.1.4 live/tracked alignment readback\n→ Task 8 focused GUT RED", plan)


if __name__ == "__main__":
    unittest.main()
