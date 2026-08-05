import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PRESERVATION = ROOT / "docs/planning/GR_TEST_032_AUTHORITY_PRESERVATION_2026-08-06.md"
ENTRYPOINTS = (
    ROOT / "AGENTS.md",
    ROOT / "START_HERE.md",
    ROOT / "docs/DOCUMENTATION_MAP.md",
    ROOT / "docs/planning/README.md",
)


class GrTest032AuthorityPreservationTests(unittest.TestCase):
    def test_preservation_document_exists_and_is_routed(self) -> None:
        self.assertTrue(PRESERVATION.is_file(), PRESERVATION)
        route = "authority_preservation: docs/planning/GR_TEST_032_AUTHORITY_PRESERVATION_2026-08-06.md"
        for path in ENTRYPOINTS:
            self.assertIn(route, path.read_text(encoding="utf-8"), path)

    def test_previous_detailed_authority_is_not_lost(self) -> None:
        text = PRESERVATION.read_text(encoding="utf-8")
        required = (
            "GR-SYNC-20260805-07-STAGE2-HARNESS-AUTOMATED",
            "PR_65_OPEN_DRAFT_UNMERGED",
            "STAGE2_HARNESS_AUTOMATED_PASS_HUMAN_NOT_RUN",
            "28_GODOT_SUITES",
            "1343_ASSERTIONS",
            "31020223682",
            "31020223136",
            "31020224001",
            "SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE",
            "TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT",
            "LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL",
            "CENTER_TARGET_AND_3X3_CIRCUIT",
            "RIGHT_WRITING_FOCUS_PANEL",
            "BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT",
            "MAIN_GLYPH_EXACTLY_1",
            "SUPPORT_GLYPHS_0_TO_2",
            "TARGETS_1_TO_4",
            "CROSSING_EDGES_PROHIBITED",
            "EXACT_GLYPH_VAULT",
            "UNIVERSAL_GLYPH_STOCK",
            "MAIN_10_SUPPORT_10",
            "RUNTIME_GLYPHS_EXACTLY_6",
            "STRICT_RED_GREEN_REFACTOR",
            "BENCHMARK_AND_PRO_COMPARISON_REQUIRED",
            "ANONYMOUS_PARTICIPANT_ID_ONLY",
            "NO_RAW_PERSONAL_IDENTIFIER",
            "ACCEPTED_FALSE_ZERO_HARD_STOP",
            "ACCIDENTAL_COMMIT_ZERO_HARD_STOP",
            "BASE_PIN_C987647D",
            "BASE_MAIN_339A48BE",
            "BASE_DRIFT_54_COMMITS_DEFERRED",
            "GR-SYNC-20260806-01-GR-TEST-032-EXECUTION-READY",
            "SOURCE_ATTEMPT_SHA256_REQUIRED",
            "SOURCE_STAGE2_SHA256_REQUIRED",
            "NO_HUMAN_PASS_CLAIM",
        )
        for token in required:
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
