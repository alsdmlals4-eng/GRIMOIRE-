from __future__ import annotations

import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class StarUiKitContractTest(unittest.TestCase):
    def read_required(self, relative: str) -> str:
        path = ROOT / relative
        self.assertTrue(path.is_file(), f"missing required file: {relative}")
        return path.read_text(encoding="utf-8")

    def test_theme_factory_contains_approved_tokens_and_variations(self) -> None:
        theme = self.read_required("src/ui/theme/grimoire_theme_factory.gd")
        for token in [
            'SURFACE_CANVAS := Color("071524")',
            'SURFACE_PANEL := Color("0d2033")',
            'LINE_BRASS := Color("b58a43")',
            'LINE_GOLD_ACTIVE := Color("e2bd68")',
            'PLAYER_CYAN := Color("72d9e8")',
            'WARNING_AMBER := Color("e6a84b")',
            'DANGER_RED := Color("c95d58")',
            'TEXT_PRIMARY := Color("f3ead4")',
            'static func create_theme() -> Theme:',
        ]:
            self.assertIn(token, theme)
        for variation in [
            "AcademyPanel",
            "AcademyPanelEmphasis",
            "AcademyButton",
            "AcademyButtonPrimary",
            "AcademyBadge",
            "GlyphSlot",
            "GlyphSlotMain",
            "StatusBanner",
            "StatusBannerWarning",
            "StatusBannerSuccess",
        ]:
            self.assertIn(variation, theme)
        self.assertIn("focus", theme.lower())
        self.assertNotIn("load(\"res://fonts/", theme)

    def test_star_board_is_draw_only_and_has_visual_states(self) -> None:
        board = self.read_required("src/ui/components/star_circuit_board.gd")
        for token in [
            "class_name StarCircuitBoard",
            "extends Control",
            "func set_visual_state(",
            "func visual_snapshot() -> Dictionary:",
            "queue_redraw()",
            "draw_polyline",
            "EDIT",
            "VALID",
            "TARGET",
            "FINAL",
            "CONFIRM",
            "COMMITTED",
            "INVALID",
        ]:
            self.assertIn(token, board)
        for forbidden in [
            "consume_mana",
            "reserve_for_spell",
            "confirm_commit",
            "TypedGlyphStockPool",
            "StarCircuitValidator",
        ]:
            self.assertNotIn(forbidden, board)
        self.read_required("src/ui/components/star_circuit_board.tscn")

    def test_vector_assets_are_text_free_simple_svg(self) -> None:
        assets = [
            "assets/art/ui/common/icon_phase_diamond.svg",
            "assets/art/ui/common/icon_warning_diamond.svg",
            "assets/art/ui/common/icon_typed_stock.svg",
            "assets/art/ui/common/icon_mana.svg",
            "assets/art/ui/common/academy_corner_ornament.svg",
        ]
        for relative in assets:
            svg = self.read_required(relative)
            self.assertIn("<svg", svg)
            self.assertRegex(svg, r"<(path|circle|polygon|line|rect)\b")
            for forbidden in ["<text", "<image", "<filter", "data:image", "font-family"]:
                self.assertNotIn(forbidden, svg.lower())

    def test_harness_applies_shared_theme_and_component_variations(self) -> None:
        scene = self.read_required("src/ui/star_circuit_harness.tscn")
        script = self.read_required("src/ui/star_circuit_harness.gd")
        for token in [
            "grimoire_theme_factory.gd",
            "star_circuit_board.tscn",
            'name="VisualBackground"',
            'name="StarBoard"',
            'name="PhaseBadge"',
            'theme_type_variation = &"AcademyPanel"',
            'theme_type_variation = &"AcademyButtonPrimary"',
            'theme_type_variation = &"GlyphSlotMain"',
            'theme_type_variation = &"GlyphSlot"',
        ]:
            self.assertIn(token, scene)
        for token in [
            "GrimoireThemeFactory.create_theme()",
            "_update_visual_state",
            "set_visual_state",
        ]:
            self.assertIn(token, script)
        self.assertNotRegex(scene, re.compile(r'theme_override_colors/(font_color|font_hover_color)'))

    def test_design_keeps_validation_boundaries_honest(self) -> None:
        spec = self.read_required("docs/superpowers/specs/2026-08-06-star-ui-kit-v1-design.md")
        for token in [
            "final_art: NOT_CLAIMED",
            "physical_device_validation: NOT_RUN",
            "human_visual_validation: NOT_RUN",
            "no final background illustration",
            "no physical-device or human visual PASS claim",
        ]:
            self.assertIn(token, spec)


if __name__ == "__main__":
    unittest.main()
