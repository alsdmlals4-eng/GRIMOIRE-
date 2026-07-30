import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class BaseV91OperatingContractTests(unittest.TestCase):
    def test_canonical_contract_routes_actual_repository_and_local_skills(self) -> None:
        adapter = json.loads((ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8"))
        snapshot = json.loads((ROOT / "skills/PROJECT_SKILL_SNAPSHOT.json").read_text(encoding="utf-8"))
        self.assertEqual(adapter["project"]["repository"], "alsdmlals4-eng/GRIMOIRE-")
        self.assertEqual(adapter["project"]["legacy_repository_aliases"], ["alsdmlals4-eng/Spell"])
        self.assertEqual(adapter["gdd_sheet"]["sync_status"], "BLOCKED")
        self.assertEqual(adapter["gdd_sheet"]["sheet_only_change_policy"], "PROPOSED_SHEET_CHANGE")
        self.assertEqual(adapter["project"]["engine"], "NOT_APPLICABLE_NO_PROJECT")
        self.assertEqual(
            [route["skill_id"] for route in adapter["routing"]["project_routes"]],
            ["art-style-decision-gate", "magic-writing-recovery"],
        )
        self.assertEqual(
            set(snapshot["effective_routes"]),
            {"art-style-decision-gate", "auditing-and-refining-ui-art", "magic-writing-recovery"},
        )

    def test_router_and_project_skills_are_thin_and_actionable(self) -> None:
        router = (ROOT / ".agents/skills/grimoire-workflow-router/SKILL.md").read_text(encoding="utf-8")
        self.assertIn("PROJECT_BASE_ADAPTER.json", router)
        self.assertIn("PROJECT_SKILL_SNAPSHOT.json", router)
        self.assertIn("no copied Base shared Skill body", router)
        self.assertNotIn("current_use", router)
        for name in ("magic-writing-recovery", "art-style-decision-gate"):
            skill = (ROOT / f"skills/{name}/SKILL.md").read_text(encoding="utf-8")
            self.assertIn(f"name: {name}", skill)
            self.assertNotIn("TODO", skill)

    def test_legacy_inputs_are_preserved_and_health_does_not_overclaim(self) -> None:
        for name in ("BASE_V9_ADAPTER.json", "PROJECT_BASE_SKILL_ADAPTER.json"):
            view = json.loads((ROOT / "skills" / name).read_text(encoding="utf-8"))
            archived = ROOT / "docs/archive/base-v9-legacy-inputs" / name
            self.assertEqual(view["artifact_role"], "GENERATED_COMPATIBILITY_VIEW")
            self.assertTrue(archived.is_file())
        health = json.loads((ROOT / "docs/PROJECT_OPERATING_HEALTH.json").read_text(encoding="utf-8"))
        self.assertEqual(health["operating_maturity"], "OM-L0")
        self.assertEqual(health["product_evidence_maturity"], "PE-0")
        self.assertEqual(set(health["critical_gates"].values()), {"NOT_RUN"})


if __name__ == "__main__":
    unittest.main()
