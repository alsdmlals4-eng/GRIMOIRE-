from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LOOP = ROOT / "docs/operations/loop"
SOURCE = "6dc4c390d6516b95a70130e1f668b056a5a25b25"
PROJECT = "GRIMOIRE"
PACKAGE = "GR_LOOP_VISUAL_PILOT_001"
REQUIREMENT = "GR_LOOP_VISUAL_LOCK_001"
WIRE = "docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md"
UX_MAP = "docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md"


def load(name: str):
    path = LOOP / name
    if not path.is_file():
        raise AssertionError(f"missing Universal Loop contract: {path.relative_to(ROOT)}")
    return json.loads(path.read_text(encoding="utf-8"))


class UniversalLoopVisualPilotTests(unittest.TestCase):
    def test_existing_approved_visual_authority_is_present(self) -> None:
        registry = json.loads((ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8"))
        indexed = {item["path"]: item for item in registry["canonical_documents"]}
        self.assertEqual(indexed[WIRE]["status"], "ACTIVE_LOW_FI_RUNTIME_CONTRACT")
        self.assertEqual(indexed[UX_MAP]["status"], "ACTIVE_MULTI_SOLUTION_RUNTIME_CONTRACT")
        wire = (ROOT / WIRE).read_text(encoding="utf-8")
        ux = (ROOT / UX_MAP).read_text(encoding="utf-8")
        self.assertIn("USER_AUTHORIZED_IMPLEMENTATION_DEFAULT", wire)
        self.assertIn("FIVE_EQUIVALENT_OPTIONAL_VERTICES", wire)
        self.assertIn("minimum_touch_target: 48dp", wire)
        self.assertIn("TEXT_SCALE_130_PERCENT", wire)
        self.assertIn("NO_BEST_ROUTE_RECOMMENDATION", ux)
        self.assertIn("EXPLICIT_COMMIT", ux)

    def test_visual_lock_uses_github_art_bible_and_existing_locked_status(self) -> None:
        visual = load("VISUAL_LOCK.json")
        self.assertEqual(visual["contract_role"], "LOOP_VISUAL_LOCK")
        self.assertEqual(visual["project_id"], PROJECT)
        self.assertEqual(visual["source_commit"], SOURCE)
        self.assertEqual(visual["status"], "VISUAL_LOCKED")
        self.assertEqual(visual["provider"], "GITHUB_ART_BIBLE")
        self.assertEqual(set(visual["reference_ids"]), {WIRE, UX_MAP})
        self.assertIn("FIVE_POINT_STAR", "\n".join(visual["keep"]))
        self.assertIn("48dp", "\n".join(visual["keep"]))
        self.assertIn("AUTO_TARGET", "\n".join(visual["avoid"]).upper())
        self.assertIn("3X3", "\n".join(visual["do_not_drift"]).upper())
        self.assertIn("MOBILE_LANDSCAPE_FIXED", visual["target_platforms"])
        self.assertIn("16:9", visual["aspect_ratios"])

    def test_capsule_locks_planning_and_visual_authority_without_selecting_task8_scope(self) -> None:
        capsule = load("PROJECT_EXECUTION_CAPSULE.json")
        planning = load("PLANNING_LOCK.json")
        self.assertEqual(capsule["project_id"], PROJECT)
        self.assertEqual(capsule["source_main_sha"], SOURCE)
        self.assertEqual(capsule["autonomy"], "A2_EXECUTE_ISOLATED")
        self.assertEqual(capsule["a3_auto_merge_allowlist"], [])
        self.assertEqual(capsule["scheduler_runtime_provider"], "NOT_CONFIGURED")
        self.assertTrue(all(value == "FORBIDDEN" for value in capsule["context_isolation"].values()))
        source_paths = {item["path"] for item in planning["authority_sources"]}
        self.assertTrue({"AGENTS.md", "START_HERE.md", "docs/DESIGN_DOCUMENT_REGISTRY.json", WIRE, UX_MAP}.issubset(source_paths))
        protected = "\n".join(planning["protected_meanings"] + planning["excluded_scope"]).upper()
        for token in ("FIVE_POINT_STAR", "TASK8", "AUTO_TARGET", "AUTO_COMMIT", "HUMAN_NOT_RUN", "DEVICE_NOT_RUN"):
            self.assertIn(token, protected)

    def test_visual_pilot_package_is_operations_only_and_existing_locked(self) -> None:
        package = load("IMPLEMENTATION_PACKAGE.json")
        coverage = load("REQUIREMENT_COVERAGE_LEDGER.json")
        self.assertEqual(package["package_id"], PACKAGE)
        self.assertEqual(package["requirement_ids"], [REQUIREMENT])
        self.assertEqual(package["visual_impact"], "EXISTING_LOCKED")
        self.assertEqual(package["visual_lock_requirement"], "VISUAL_LOCKED")
        allowed = set(package["allowed_paths"])
        mapped = {path for item in coverage["requirements"] for path in item["outputs"]}
        self.assertEqual(allowed, mapped)
        for path in allowed:
            self.assertTrue(
                path.startswith("docs/operations/loop/")
                or path == "tests/test_universal_loop_visual_pilot.py"
                or path == ".github/workflows/validate-universal-loop-visual-pilot.yml"
            )
        forbidden = set(package["forbidden_paths"])
        self.assertTrue({"src/", "assets/", "data/", "addons/", "project.godot"}.issubset(forbidden))
        self.assertIn("docs/planning/", forbidden)

    def test_runtime_adapter_protects_visual_product_roots_and_reuses_existing_visual_contract_test(self) -> None:
        adapter = load("RUNTIME_ADAPTER.json")
        self.assertEqual(adapter["status"], "PROJECT_ADAPTER_VALIDATED")
        self.assertEqual(adapter["engine"], {"name": "Godot", "version": "4.7.1"})
        self.assertTrue({"src/", "assets/", "data/", "addons/", "project.godot"}.issubset(set(adapter["protected_paths"])))
        commands = {item["command_id"]: item for item in adapter["test_commands"]}
        self.assertEqual(commands["UNIVERSAL_LOOP_VISUAL_PILOT"]["network"], "DENIED")
        self.assertEqual(commands["EXISTING_VISUAL_PLATFORM_CONTRACT"]["argv"], ["python", "-m", "unittest", "tests.test_visual_platform_gate_sequencing", "-v"])

    def test_active_run_is_null_and_shadow_pilot_is_not_product_completion_evidence(self) -> None:
        active = load("ACTIVE_LOOP_RUN.json")
        immutable = load("runs/GR_VISUAL_SHADOW_001.json")
        self.assertEqual(active["contract_role"], "LOOP_ACTIVE_RUN_POINTER")
        self.assertIsNone(active["active_run"])
        self.assertEqual(immutable["state"], "CREATED")
        self.assertEqual(immutable["design_drift_status"], "NOT_CHECKED")
        self.assertEqual(immutable["project_id"], PROJECT)
        self.assertEqual(immutable["package_id"], PACKAGE)


if __name__ == "__main__":
    unittest.main()
