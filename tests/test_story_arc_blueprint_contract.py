from __future__ import annotations

import hashlib
import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BENCHMARK_PATH = ROOT / "docs/planning/benchmarks/2026-09-01-story-led-academy-reverse-engineering.md"
BLUEPRINT_PATH = ROOT / "docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md"
PLAN_PATH = ROOT / "docs/superpowers/plans/2026-09-01-story-arc-blueprint-implementation.md"
CANONICAL_ENVIRONMENT_PATH = ROOT / "assets/art/backgrounds/academy/bg_duel_practice_cloister.png"
LEGACY_CANDIDATE_PATH = ROOT / "assets/art/source_candidates/story_arc_01/backgrounds/duel/bg_duel_practice_cloister_candidate_02_unmarked_environment_only.png"
MANIFEST_PATH = ROOT / "assets/manifests/story_arc_01_duel_practice_environment_candidate_02.json"
RECEIPT_PATH = ROOT / "docs/contracts/receipts/2026-09-01-story-arc-blueprint-work-contract-receipt.json"
REGISTRY_PATH = ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json"


class StoryArcBlueprintContractTests(unittest.TestCase):
    def test_benchmark_covers_twelve_official_sources_without_copying_their_expression(self) -> None:
        text = BENCHMARK_PATH.read_text(encoding="utf-8")

        self.assertIn("12", text)
        self.assertIn("ADOPT / ADAPT / REJECT", text)
        self.assertIn("functional_patterns_only__no_character_ui_story_or_world_copy", text)
        for title in (
            "Volcano Princess",
            "I Was a Teenage Exocolonist",
            "Potion Permit",
            "Fire Emblem: Three Houses",
            "Persona 5 Royal",
            "GWENT",
            "Shadowverse",
            "Magical Diary: Horse Hall",
            "Little Witch in the Woods",
            "Whimel Academy",
            "Academagia",
            "Hogwarts Legacy",
        ):
            self.assertIn(title, text)

    def test_blueprint_makes_story_progression_and_current_implementation_boundaries_explicit(self) -> None:
        text = BLUEPRINT_PATH.read_text(encoding="utf-8")

        for token in (
            "StoryFrontDoor",
            "AdmissionPrologue",
            "StoryEventRoot",
            "WRITE_OR_SELECT_GLYPHS_TO_LAYERED_CIRCLES_TO_TARGET_TO_EXPLICIT_CAST_TO_CLOCK_RESULT",
            "RULESET_PENDING",
            "IMPLEMENTED",
            "PLANNED",
            "EventClock",
            "DuelPracticumRoot",
            "FestivalCanopyRoot",
        ):
            self.assertIn(token, text)

        self.assertIn("SCREEN-01", text)
        self.assertIn("SCREEN-02", text)
        self.assertIn("SCREEN-03", text)
        self.assertIn("SCREEN-04", text)
        self.assertIn("```mermaid", text)

    def test_user_locked_environment_is_canonical_runtime_art_and_remains_environment_only(self) -> None:
        manifest = json.loads(MANIFEST_PATH.read_text(encoding="utf-8"))

        self.assertTrue(CANONICAL_ENVIRONMENT_PATH.is_file())
        self.assertFalse(LEGACY_CANDIDATE_PATH.exists())
        self.assertEqual("USER_APPROVED__CANON_REGISTERED__IMPLEMENTED__RUNTIME_BOUND", manifest["status"])
        self.assertEqual("ENVIRONMENT_BACKGROUND", manifest["visual_layer"])
        self.assertEqual("USER_FINAL_LOCK_OBSERVED_2026-09-01", manifest["promotion_gate"])
        self.assertEqual("res://src/ui/story/duel_practicum_root.tscn", manifest["planned_consumer"])
        self.assertEqual("res://src/ui/story/duel_practicum_root.tscn::DuelPracticumRoot/EnvironmentBackground", manifest["runtime_consumer"])
        self.assertTrue(manifest["runtime_bound"])
        self.assertIn("no baked text", manifest["constraints"])
        self.assertIn("no glyph", manifest["constraints"])
        self.assertIn("no character", manifest["constraints"])
        self.assertEqual(
            hashlib.sha256(CANONICAL_ENVIRONMENT_PATH.read_bytes()).hexdigest().upper(),
            manifest["file"]["sha256"],
        )
        self.assertEqual("assets/art/backgrounds/academy/bg_duel_practice_cloister.png", manifest["file"]["path"])

    def test_plan_and_receipt_keep_card_detail_rules_and_human_evidence_out_of_scope(self) -> None:
        plan = PLAN_PATH.read_text(encoding="utf-8")
        receipt = json.loads(RECEIPT_PATH.read_text(encoding="utf-8"))
        registry = json.loads(REGISTRY_PATH.read_text(encoding="utf-8"))

        self.assertIn("RULESET_PENDING", plan)
        self.assertIn("card detail rules", plan)
        self.assertIn("user provides", plan)
        self.assertIn("user final lock", plan)
        self.assertIn("new story beat", plan)
        self.assertEqual("L1", receipt["work_level"])
        self.assertEqual("PASS", receipt["benchmark_preflight_receipt"]["state"])
        self.assertGreaterEqual(len(receipt["benchmark_preflight_receipt"]["entries"]), 12)
        self.assertGreaterEqual(len(receipt["adversarial_review_loops"]), 5)
        self.assertEqual("PLANNING_AND_CANDIDATE_READY__RUNTIME_NOT_BOUND", receipt["evidence_ceiling"])
        self.assertEqual(
            "docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md",
            registry["story_arc_blueprint"]["design"],
        )
        self.assertEqual(
            "USER_APPROVED__CANON_REGISTERED__IMPLEMENTED__RUNTIME_BOUND",
            registry["story_arc_blueprint"]["duel_environment_candidate_state"],
        )


if __name__ == "__main__":
    unittest.main()
