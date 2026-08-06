import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SPEC = ROOT / "docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
ACTIVE_FILES = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CANON_SYNC_STATE.json",
    ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json",
]


class GodotAuthoringGutAuthorityContractTests(unittest.TestCase):
    def test_design_authorities_and_state_exist(self):
        self.assertTrue(SPEC.is_file(), str(SPEC))
        self.assertTrue(STATE.is_file(), str(STATE))
        self.assertTrue(UNRESOLVED.is_file(), str(UNRESOLVED))

    def test_state_blocks_product_entry_until_review(self):
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01", data["decision_id"])
        self.assertEqual("DESIGN_DRAFT_REVIEW_REQUIRED", data["status"])
        self.assertEqual("SOLE_AUTHORING_AUTHORITY", data["higodot"]["authority"])
        self.assertEqual("3.1.2", data["higodot"]["bundled_version"])
        self.assertEqual("FORMAL_TEST_AUTHORITY", data["gut"]["target_authority"])
        self.assertEqual("9.7.1", data["gut"]["pinned_version"])
        self.assertEqual("VENDORED_NOT_CONSUMED", data["gut"]["current_consumption"])
        self.assertEqual("MIT", data["gut"]["license"])
        self.assertEqual("4.7.x", data["gut"]["godot_compatibility"])
        self.assertEqual("BLOCKED", data["entry_gate"]["implementation"])
        self.assertEqual("PAUSED_AFTER_TASK1_GREEN", data["implementation_pr"]["status"])
        self.assertEqual("APPROVED_DIRECTION_RUNTIME_NOT_RUN", data["image_review"]["status"])

    def test_active_authority_rolls_back_stale_ready_status(self):
        for path in ACTIVE_FILES:
            text = path.read_text(encoding="utf-8")
            self.assertNotIn("SPELL_WORKFLOW_UI_V2_READY_FOR_TDD", text, str(path))
            self.assertIn("BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW", text, str(path))

    def test_spec_separates_write_authority_and_test_authority(self):
        text = SPEC.read_text(encoding="utf-8")
        required = [
            "HIGODOT_SOLE_AUTHORING_AUTHORITY",
            "GUT_FORMAL_TEST_AUTHORITY",
            "GUT_MUST_NOT_MUTATE_PRODUCT_FILES",
            "HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS",
            "SOURCE: https://github.com/bitwes/Gut",
            "PINNED_VERSION: 9.7.1",
            "LICENSE: MIT",
            "GODOT_COMPATIBILITY: 4.7.x",
            "ACTUAL_CONSUMPTION_PATH",
            "CI_GATE",
            "REMOVAL_AND_ROLLBACK",
            "ENTRY_GATE_BLOCKS_WORK",
        ]
        for token in required:
            self.assertIn(token, text)

    def test_bundled_gut_metadata_matches_pinned_design(self):
        plugin = (ROOT / "addons/gut/plugin.cfg").read_text(encoding="utf-8")
        versions = json.loads((ROOT / "addons/gut/versions.json").read_text(encoding="utf-8"))
        license_text = (ROOT / "addons/gut/LICENSE.md").read_text(encoding="utf-8")
        project = (ROOT / "project.godot").read_text(encoding="utf-8")
        self.assertIn('version="9.7.1"', plugin)
        self.assertEqual("4.7", versions["releases"]["9.7.1"]["godot_min"])
        self.assertEqual("4.7.999", versions["releases"]["9.7.1"]["godot_max"])
        self.assertIn("The MIT License", license_text)
        self.assertIn('res://addons/godot_ai/plugin.cfg', project)
        self.assertNotIn('res://addons/gut/plugin.cfg', project)

    def test_unresolved_gate_list_prevents_false_awaiting_or_ready(self):
        text = UNRESOLVED.read_text(encoding="utf-8")
        for token in (
            "GUT_ACTUAL_CONSUMPTION_NOT_ENABLED",
            "GUT_CI_NOT_ENABLED",
            "TOOL_AUTHORITY_REVIEW_NOT_APPROVED",
            "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN",
            "NO_USER_APPROVAL_AWAITING_FOR_DIRECTION",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
