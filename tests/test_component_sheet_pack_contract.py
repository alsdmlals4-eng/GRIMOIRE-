from pathlib import Path
import json
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
THEME = ROOT / "src/ui/theme/grimoire_theme_factory.gd"
SPEC = ROOT / "docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md"
FIXTURE = ROOT / "data/testing/component_sheet_samples_v1.json"
CAPTURE_SCRIPT = ROOT / "tools/capture_component_sheets.gd"
WORKFLOW = ROOT / ".github/workflows/validate-component-sheet-pack.yml"
REVIEW_EVIDENCE = ROOT / "docs/planning/COMPONENT_SHEET_PACK_01_ADVERSARIAL_REVIEW_2026-08-20.md"
SYNC_EVIDENCE = ROOT / "docs/planning/sync/GR-SYNC-20260820-33-COMPONENT-SHEET-PACK-IMPLEMENTATION.md"

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
CAPTURES = [
    f"component-sheet-{sheet}-{size}.png"
    for sheet in "abcd"
    for size in ("1920x1080", "1280x720")
]
SPELL_SCRIPTS = [
    "five_point_star_composer.gd",
    "context_header.gd",
    "context_target_selector.gd",
    "commit_bar.gd",
]
FORBIDDEN_OWNERSHIP = [
    "consume_mana",
    "reserve_for_spell",
    "confirm_commit",
    "AtomicSpellUseService",
    "TypedGlyphStockPool",
    "StarCircuitValidator",
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

    def test_spell_semantic_components_do_not_own_gameplay_mutation(self):
        for name in SPELL_SCRIPTS:
            path = ROOT / "src/ui/components" / name
            self.assertTrue(path.is_file(), name)
            if not path.is_file():
                continue
            text = path.read_text(encoding="utf-8")
            for token in FORBIDDEN_OWNERSHIP:
                self.assertNotIn(token, text, f"{name} must not own {token}")
        composer = ROOT / "src/ui/components/five_point_star_composer.tscn"
        self.assertTrue(composer.is_file())
        if composer.is_file():
            text = composer.read_text(encoding="utf-8")
            self.assertIn("star_circuit_board.tscn", text)
            self.assertNotIn("StarCircuitValidator", text)

    def test_capture_pipeline_is_deterministic_and_complete(self):
        self.assertTrue(CAPTURE_SCRIPT.is_file(), "capture_component_sheets.gd")
        script = CAPTURE_SCRIPT.read_text(encoding="utf-8") if CAPTURE_SCRIPT.is_file() else ""
        workflow = WORKFLOW.read_text(encoding="utf-8")
        for name in CAPTURES:
            self.assertIn(name, script, name)
        for token in (
            "SubViewport",
            "RenderingServer.force_draw",
            "save_png",
            "10000",
            "1920",
            "1080",
            "1280",
            "720",
        ):
            self.assertIn(token, script, token)
        for token in (
            "python -m unittest tests.test_component_sheet_pack_contract -v",
            "tools/setup_godot_toolchain.py",
            "--headless --import",
            "tests/test_runner.gd",
            "capture_component_sheets.gd",
            "component-sheet-*.png",
            "actions/upload-artifact@",
        ):
            self.assertIn(token, workflow, token)

    def test_task7_closure_records_exist_and_preserve_evidence_ceiling(self):
        self.assertTrue(REVIEW_EVIDENCE.is_file(), REVIEW_EVIDENCE.name)
        self.assertTrue(SYNC_EVIDENCE.is_file(), SYNC_EVIDENCE.name)
        if REVIEW_EVIDENCE.is_file():
            text = REVIEW_EVIDENCE.read_text(encoding="utf-8")
            for token in ("5/5 CLEAN", "Human", "Device", "Performance", "Full Slice", "NOT_RUN"):
                self.assertIn(token, text, token)
        if SYNC_EVIDENCE.is_file():
            text = SYNC_EVIDENCE.read_text(encoding="utf-8")
            for token in ("EXACT_HEAD", "NOT_RUN", "Notion", "POSTMERGE_PENDING"):
                self.assertIn(token, text, token)


if __name__ == "__main__":
    unittest.main()
