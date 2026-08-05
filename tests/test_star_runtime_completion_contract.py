from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

PLANNING_FILES = {
    "docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md": (
        "CENTER_MAIN_GLYPH",
        "FIVE_EQUIVALENT_OPTIONAL_VERTICES",
        "CIRCUIT_PREVIEW_BEFORE_TARGET",
        "TEXT_SCALE_130_PERCENT",
        "COLOR_NOT_SOLE_SIGNAL",
    ),
    "docs/planning/SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md": (
        "FULL_SUCCESS",
        "PARTIAL_SUCCESS",
        "IMPERFECT_EXECUTION",
        "FAILURE",
        "BACKLASH",
        "FAILURE_ALWAYS_LEAVES_INFORMATION_OR_OPPORTUNITY",
    ),
    "docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md": (
        "TIME_SCALE_0_25_TEST_VALUE",
        "MANA_ONE_PER_REAL_SECOND_TEST_VALUE",
        "SAME_GLYPH_STOCK_PLUS_1",
        "CANCEL_NO_REFUND",
    ),
    "docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md": (
        "FACILITY_REPAIR",
        "LIFE_RESCUE",
        "SPIRIT_STABILIZATION",
        "CONTAIN_AND_EVACUATE",
        "SUPPRESS_AND_BUY_TIME",
        "NO_BEST_ROUTE_RECOMMENDATION",
    ),
    "docs/superpowers/plans/2026-08-06-star-circuit-runtime-completion-plan.md": (
        "TEST_FIRST",
        "LOCAL_GODOT",
        "MOBILE_DEVICE_NOT_RUN",
        "HUMAN_NOT_RUN",
    ),
}

RUNTIME_FILES = (
    "src/core/star/spell_resolution_policy.gd",
    "src/ui/focus_scribing_overlay.gd",
    "src/ui/focus_scribing_overlay.tscn",
    "data/testing/frostbloom_star_ux_map.json",
    "tests/unit/test_spell_resolution_policy.gd",
    "tests/unit/test_focus_scribing_overlay.gd",
    "tests/integration/test_frostbloom_star_ux_map.gd",
)


class StarRuntimeCompletionContractTests(unittest.TestCase):
    def read(self, path: str) -> str:
        return (ROOT / path).read_text(encoding="utf-8")

    def test_all_approved_completion_artifacts_exist(self) -> None:
        for path, tokens in PLANNING_FILES.items():
            self.assertTrue((ROOT / path).is_file(), path)
            if not (ROOT / path).is_file():
                continue
            text = self.read(path)
            for token in tokens:
                self.assertIn(token, text, f"{path}: {token}")

    def test_runtime_completion_files_exist(self) -> None:
        for path in RUNTIME_FILES:
            self.assertTrue((ROOT / path).is_file(), path)

    def test_mobile_wireframe_states_are_exposed_by_scene(self) -> None:
        scene = self.read("src/ui/star_circuit_harness.tscn")
        script = self.read("src/ui/star_circuit_harness.gd")
        for token in (
            "MasteryPanel",
            "BreakdownPanel",
            "WarningPanel",
            "InsufficientManaState",
            "UnstableCircuitState",
            "AccessibilityInputPanel",
        ):
            self.assertIn(token, scene)
        for token in (
            "show_insufficient_mana",
            "show_unstable_circuit",
            "show_accessibility_input",
            "show_mastery_breakdown",
        ):
            self.assertIn(token, script)

    def test_resolution_policy_is_explanatory_and_not_binary_only(self) -> None:
        text = self.read("src/core/star/spell_resolution_policy.gd")
        for token in (
            "FULL_SUCCESS",
            "PARTIAL_SUCCESS",
            "IMPERFECT_EXECUTION",
            "FAILURE",
            "BACKLASH",
            "cause_glyph_id",
            "new_information",
            "next_opportunity",
        ):
            self.assertIn(token, text)

    def test_focus_overlay_preserves_risk_and_no_refund_contract(self) -> None:
        text = self.read("src/ui/focus_scribing_overlay.gd")
        for token in (
            "0.25",
            "mana_per_real_second",
            "cancel_no_refund",
            "stock_gain",
            "interruption_risk",
        ):
            self.assertIn(token, text)

    def test_frostbloom_map_is_multi_solution_and_never_recommends_best_route(self) -> None:
        payload = json.loads(self.read("data/testing/frostbloom_star_ux_map.json"))
        self.assertGreaterEqual(len(payload.get("solution_intents", [])), 6)
        self.assertFalse(payload.get("recommend_best_route", True))
        self.assertFalse(payload.get("professor_example_is_answer", True))
        self.assertEqual("AFTER_CIRCUIT_PREVIEW", payload.get("target_keyword_step"))

    def test_godot_runner_registers_completion_suites(self) -> None:
        runner = self.read("tests/test_runner.gd")
        for path in (
            "res://tests/unit/test_spell_resolution_policy.gd",
            "res://tests/unit/test_focus_scribing_overlay.gd",
            "res://tests/integration/test_frostbloom_star_ux_map.gd",
        ):
            self.assertIn(path, runner)


if __name__ == "__main__":
    unittest.main()
