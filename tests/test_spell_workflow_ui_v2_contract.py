from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]


class SpellWorkflowUiV2ContractTests(unittest.TestCase):
    def test_current_core_and_historical_star_files_exist(self):
        required = [
            "src/core/glyphs/glyph_catalog.gd",
            "src/core/circle/circle_composition.gd",
            "src/core/events/event_clock_resolver.gd",
            "src/core/cards/card_ruleset.gd",
            "src/core/story/story_progress.gd",
            "src/ui/front_door/story_front_door.tscn",
            "src/ui/star_circuit_harness.tscn",
        ]
        for path in required:
            self.assertTrue((ROOT / path).is_file(), path)

    def test_current_core_and_historical_star_boundaries_are_present(self):
        combined = "\n".join(
            path.read_text(encoding="utf-8")
            for path in [
                ROOT / "docs/ACTIVE_CONTEXT.md",
                ROOT / "docs/DEVELOPMENT_GATES.md",
                ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            ]
        )
        for token in (
            "GM-CIRCLE-CLOCK-CARD-CORE-01",
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01",
            "ROLE_FREE_LAYERED_CIRCLES_1_TO_3",
            "CIRCLE_CLOCK_TASK8_SAVE_DISPOSITION_PENDING",
        ):
            self.assertIn(token, combined)


if __name__ == "__main__":
    unittest.main()
