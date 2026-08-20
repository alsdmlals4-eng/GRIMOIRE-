from pathlib import Path
import json
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
THEME = ROOT / "src/ui/theme/grimoire_theme_factory.gd"
SPEC = ROOT / "docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md"
FIXTURE = ROOT / "data/testing/component_sheet_samples_v1.json"

COMPONENTS = [
    "academy_panel.tscn",
    "five_point_star_composer.tscn",
    "context_header.tscn",
    "context_target_selector.tscn",
    "commit_bar.tscn",
    "evidence_pin.tscn",
    "forecast_card.tscn",
    "context_delta_card.tscn",
    "result_axis_card.tscn",
    "causal_thread.tscn",
]
SHEETS = [
    "component_sheet_a_foundations.tscn",
    "component_sheet_b_spell_workflow.tscn",
    "component_sheet_c_frostbloom_decision.tscn",
    "component_sheet_d_result_grimoire.tscn",
]


class ComponentSheetPackContractTests(unittest.TestCase):
    def test_required_component_and_sheet_files_exist(self):
        for name in COMPONENTS:
            self.assertTrue((ROOT / "src/ui/components" / name).is_file(), name)
        for name in SHEETS:
            self.assertTrue((ROOT / "src/ui/component_sheets" / name).is_file(), name)

    def test_existing_theme_remains_single_token_authority(self):
        theme = THEME.read_text(encoding="utf-8")
        self.assertIn('SURFACE_CANVAS := Color("071524")', theme)
        self.assertIn('LINE_GOLD_ACTIVE := Color("e2bd68")', theme)
        for path in (ROOT / "src/ui/components").glob("*.gd"):
            if path.name == "star_circuit_board.gd":
                continue
            text = path.read_text(encoding="utf-8")
            self.assertNotRegex(text, re.compile(r'Color\("(?:071524|0d2033|e2bd68|72d9e8)"\)', re.I), path.name)

    def test_fixture_preserves_frostbloom_semantics(self):
        data = json.loads(FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"known": 2, "unknown": 2, "lens": "FIELD_HANDLING"}, data["evidence_pin"])
        self.assertEqual(
            ["KNOWN_IMPROVEMENT", "UNCERTAIN_CONSEQUENCE", "FINAL_TARGET_SUCCESS_BREAKDOWN", "MANA_COST"],
            list(data["forecast"].keys()),
        )
        self.assertEqual(["STILL_TRUE", "NEWLY_LEARNED", "NEW_TENSION"], list(data["context_delta"].keys()))
        self.assertEqual(["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"], list(data["result_axes"].keys()))
        self.assertEqual(
            ["OBSERVATION", "W6_CIRCUIT", "W6_TARGET", "W6_RESULT", "CONTEXT_DELTA", "W7_JUDGMENT", "W7_RESULT"],
            [item["kind"] for item in data["causal_thread"]],
        )

    def test_no_named_correct_route_or_global_grade_copy(self):
        text = FIXTURE.read_text(encoding="utf-8").lower()
        for forbidden in ("recommended", "best route", "correct route", "perfect", "s-rank", "a-rank"):
            self.assertNotIn(forbidden, text)

    def test_runtime_sample_copy_stays_english_safe_until_font_gate(self):
        for folder in (ROOT / "src/ui/components", ROOT / "src/ui/component_sheets"):
            for path in folder.glob("*.tscn"):
                self.assertNotRegex(path.read_text(encoding="utf-8"), re.compile(r"[가-힣]"), path.name)


if __name__ == "__main__":
    unittest.main()
