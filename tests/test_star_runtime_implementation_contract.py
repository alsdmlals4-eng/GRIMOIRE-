from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STAR_FILES = (
    "src/core/star/star_circuit_validator.gd",
    "src/core/star/star_circuit_calculator.gd",
    "src/core/star/star_circuit_state.gd",
    "src/core/star/star_circuit_commit_coordinator.gd",
    "src/ui/star_circuit_layout_model.gd",
    "src/ui/star_circuit_harness.gd",
    "src/ui/star_circuit_harness.tscn",
)


class StarRuntimeImplementationContractTests(unittest.TestCase):
    def read(self, path: str) -> str:
        return (ROOT / path).read_text(encoding="utf-8")

    def test_required_runtime_and_local_test_files_exist(self) -> None:
        for path in (*STAR_FILES, "project.godot", "tools/run_star_runtime.py", "docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md"):
            self.assertTrue((ROOT / path).is_file(), path)

    def test_active_runtime_contains_no_superseded_stage2_or_grid_paths(self) -> None:
        source_paths = [path.relative_to(ROOT).as_posix() for path in (ROOT / "src").rglob("*") if path.is_file()]
        self.assertFalse([path for path in source_paths if "/stage2/" in f"/{path}" or Path(path).name.startswith("stage2_")])
        active_text = "\n".join(self.read(path) for path in (*STAR_FILES, "tests/test_runner.gd"))
        for token in ("GRID_SIZE", "3x3", "TERMINAL_LEAF", "EIGHT_NEIGHBOR", "CROSSING_EDGE", "stage2_circuit_validator"):
            self.assertNotIn(token, active_text)
        self.assertIn("TARGET_NODE_PROHIBITED", active_text)

    def test_calculator_implements_approved_formulas(self) -> None:
        text = self.read("src/core/star/star_circuit_calculator.gd")
        for token in ("* 0.45", "* 0.35", "* 0.20", "* 10.0", "+= 0.25", "/ 1000.0", "clampi(roundi(success_raw), 5, 98)", "ceili"):
            self.assertIn(token, text)

    def test_coordinator_uses_atomic_resource_and_mana_commit(self) -> None:
        for path in ("src/core/resources/resource_reservation_ledger.gd", "src/core/spells/spell_commit_request.gd", "src/core/spells/atomic_spell_commit_service.gd"):
            self.assertTrue((ROOT / path).is_file(), path)
        text = self.read("src/core/star/star_circuit_commit_coordinator.gd")
        for token in ("reserve_node", "release_node", "_request_script.create", "_service.commit", "COMMIT_CONFIRMATION_REQUIRED"):
            self.assertIn(token, text)
        test = self.read("tests/unit/test_star_circuit_commit_coordinator.gd")
        for token in ("Duplicate commit", "Cancel mutates no stock", "Vault main glyph is consumed", "Stock auxiliary is consumed"):
            self.assertIn(token, test)

    def test_scene_and_project_are_ready_for_visual_godot_testing(self) -> None:
        project = self.read("project.godot")
        scene = self.read("src/ui/star_circuit_harness.tscn")
        self.assertIn('run/main_scene="res://src/ui/star_circuit_harness.tscn"', project)
        self.assertIn('config/features=PackedStringArray("4.7"', project)
        for token in ("CenterGlyph", "Vertex0", "Vertex1", "Vertex2", "Vertex3", "Vertex4", "CircuitPreviewPanel", "TargetKeywordPanel", "FinalPreviewPanel", "CommitButton"):
            self.assertIn(token, scene)

    def test_cross_platform_runner_builds_headless_and_editor_commands(self) -> None:
        path = ROOT / "tools/run_star_runtime.py"
        spec = importlib.util.spec_from_file_location("run_star_runtime", path)
        self.assertIsNotNone(spec)
        self.assertIsNotNone(spec.loader)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        root = ROOT.resolve()
        binary = Path("C:/Godot/Godot.exe")
        self.assertEqual(module.build_test_command(binary, root)[1:], ["--headless", "--path", str(root), "--script", "res://tests/test_runner.gd"])
        self.assertEqual(module.build_editor_command(binary, root)[1:], ["--editor", "--path", str(root)])

    def test_current_runtime_sync_receipt_preserves_human_boundaries(self) -> None:
        text = self.read("docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md")
        for token in ("RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS", "AUTOMATED_HEADLESS_PASS", "26", "1010", "31050121154", "MOBILE_DEVICE_VALIDATION_NOT_RUN", "PERFORMANCE_VALIDATION_NOT_RUN", "ACCESSIBILITY_VALIDATION_NOT_RUN", "HUMAN_VALIDATION_NOT_RUN", "FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN"):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
