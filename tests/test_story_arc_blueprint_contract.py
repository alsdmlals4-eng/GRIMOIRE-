from __future__ import annotations

import hashlib
import json
import subprocess
import sys
import tempfile
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
PDF_BUILDER_PATH = ROOT / "tools/build_story_arc_blueprint_pdf.py"
PDF_PUBLICATION_RECEIPT_PATH = ROOT / "docs/contracts/receipts/2026-09-02-story-arc-blueprint-pdf-publication-work-contract-receipt.json"


class StoryArcBlueprintContractTests(unittest.TestCase):
    def test_pdf_publication_builder_accepts_the_current_story_arc_inputs(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            output_path = Path(temp_dir) / "story-arc-blueprint.pdf"
            result = subprocess.run(
                [
                    sys.executable,
                    str(PDF_BUILDER_PATH),
                    "--check-inputs",
                    "--output",
                    str(output_path),
                ],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )

        self.assertEqual(
            0,
            result.returncode,
            msg=f"story-arc PDF source validation failed:\n{result.stdout}\n{result.stderr}",
        )
        self.assertIn("SOURCE_INPUTS_VALID", result.stdout)

    def test_pdf_publication_builder_keeps_source_hash_stable_across_clean_crlf_checkout(self) -> None:
        expected_hash = hashlib.sha256(
            BLUEPRINT_PATH.read_text(encoding="utf-8")
            .replace("\r\n", "\n")
            .replace("\r", "\n")
            .encode("utf-8")
        ).hexdigest().upper()

        with tempfile.TemporaryDirectory() as temp_dir:
            crlf_source = Path(temp_dir) / "story-arc-blueprint-crlf.md"
            crlf_source.write_text(
                BLUEPRINT_PATH.read_text(encoding="utf-8")
                .replace("\r\n", "\n")
                .replace("\r", "\n")
                .replace("\n", "\r\n"),
                encoding="utf-8",
                newline="",
            )
            result = subprocess.run(
                [sys.executable, str(PDF_BUILDER_PATH), "--check-inputs", "--source", str(crlf_source)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )

        self.assertEqual(0, result.returncode, result.stdout + result.stderr)
        self.assertIn(f"SOURCE_INPUTS_VALID source_sha256={expected_hash}", result.stdout)

    def test_human_pdf_derivative_stays_hash_bound_to_the_story_arc_source(self) -> None:
        registry = json.loads(REGISTRY_PATH.read_text(encoding="utf-8"))
        story_arc = registry["story_arc_blueprint"]
        self.assertIn("human_pdf_publication", story_arc)
        publication = story_arc["human_pdf_publication"]
        pdf_path = ROOT / publication["pdf"]
        manifest_path = ROOT / publication["manifest"]
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))

        self.assertTrue(pdf_path.is_file())
        self.assertEqual("HUMAN_GDD_PDF_DERIVED_VIEW", publication["kind"])
        self.assertEqual("DERIVED__SOURCE_SHA_RECORDED__RENDER_VALIDATED", publication["state"])
        self.assertEqual(
            hashlib.sha256(
                BLUEPRINT_PATH.read_text(encoding="utf-8")
                .replace("\r\n", "\n")
                .replace("\r", "\n")
                .encode("utf-8")
            ).hexdigest().upper(),
            manifest["source"]["sha256"],
        )
        self.assertEqual("SHA256_UTF8_LF_NORMALIZED", manifest["source"]["sha256_algorithm"])
        self.assertEqual(
            hashlib.sha256(pdf_path.read_bytes()).hexdigest().upper(),
            manifest["pdf"]["sha256"],
        )
        # The public review PDF must remain a genuinely detailed counterpart to
        # the long-form planning blueprint, not collapse again into a short
        # status summary.  The single canonical Markdown source still owns the
        # rules; this asserts the derived reader view has enough room to expose
        # the concrete screens, gates, inputs, and evidence boundaries.
        self.assertGreaterEqual(manifest["pdf"]["page_count"], 32)
        self.assertEqual("DETAILED_REVIEW_EDITION", manifest["publication_profile"]["edition"])
        self.assertEqual(32, manifest["publication_profile"]["page_count_target"])
        self.assertEqual("ALL_PAGES_RENDERED_AND_VISUALLY_INSPECTED", manifest["render_validation"]["status"])
        self.assertEqual(
            PDF_PUBLICATION_RECEIPT_PATH.relative_to(ROOT).as_posix(),
            publication["work_contract_receipt"],
        )

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
            "MACHINE_VERIFIED",
            "EDITOR_RUNTIME_OBSERVED",
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
