from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]


class SpellWorkflowUiV2ContractTests(unittest.TestCase):
    def test_required_core_and_screen_files_exist(self):
        required = [
            "src/core/glyphs/glyph_catalog.gd",
            "src/core/spells/prepared_spell.gd",
            "src/core/spells/prepared_spell_inventory.gd",
            "src/core/workflow/spell_workflow_coordinator.gd",
            "src/ui/spell_workflow/spell_workflow_root.tscn",
        ]
        for path in required:
            self.assertTrue((ROOT / path).is_file(), path)

    def test_authority_tokens_and_stage_boundaries_are_present(self):
        combined = "\n".join(
            path.read_text(encoding="utf-8")
            for path in [
                ROOT / "docs/ACTIVE_CONTEXT.md",
                ROOT / "docs/DEVELOPMENT_GATES.md",
                ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            ]
        )
        for token in (
            "GM-SPELL-WORKFLOW-UI-V2-01",
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01",
            "FIVE_POINT_STAR",
            "MANA_ONLY_AT_SPELL_USE",
        ):
            self.assertIn(token, combined)


if __name__ == "__main__":
    unittest.main()
