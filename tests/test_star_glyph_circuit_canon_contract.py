from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DECISION = "GM-STAR-CIRCUIT-MASTERY-BALANCE-01"
SYNC = "GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN"
MAIN_AUTHORITY = "6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b"
SPEC = "docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md"
ACTIVE_AUTHORITY = (
    "AGENTS.md",
    "START_HERE.md",
    "docs/ACTIVE_CONTEXT.md",
    "docs/DEVELOPMENT_GATES.md",
    "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    "docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md",
)


class StarGlyphCircuitCanonContractTests(unittest.TestCase):
    def read(self, path: str) -> str:
        return (ROOT / path).read_text(encoding="utf-8")

    def test_active_authority_uses_star_circuit(self) -> None:
        for path in ACTIVE_AUTHORITY:
            text = self.read(path)
            self.assertIn(DECISION, text, path)
            self.assertIn("FIVE_POINT_STAR", text, path)

    def test_active_authority_rejects_stale_three_by_three_contracts(self) -> None:
        stale_tokens = (
            "grid: 3x3",
            "support_glyphs: 0_to_2",
            "support_glyphs_slice: 0_to_2",
            "target_nodes: TERMINAL_LEAF",
            "slice_target_nodes: TERMINAL_LEAF",
            "numeric_success_probability: prohibited",
        )
        for path in ACTIVE_AUTHORITY:
            text = self.read(path)
            for token in stale_tokens:
                self.assertNotIn(token, text, f"{path}: stale token {token}")

    def test_numeric_complexity_contract_is_present(self) -> None:
        circuit = self.read("docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md")
        mana = self.read("docs/planning/MANA_SYSTEM.md")
        mastery = self.read("docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md")
        for token in ("-10", "-20", "-30", "-40", "-50"):
            self.assertIn(token, circuit)
        for token in ("+10%", "+20%", "+30%", "+40%", "+50%"):
            self.assertIn(token, mana)
        for token in ("PRECISION", "REDUCTION", "0_to_100"):
            self.assertIn(token, mastery + mana)

    def test_old_three_by_three_decision_is_explicitly_superseded(self) -> None:
        status = self.read("docs/planning/CANON_STATUS_INDEX_2026-08-04.md")
        self.assertIn("GM-3X3-CIRCUIT-STOCK-FOCUS-01", status)
        self.assertIn("SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01", status)

    def test_registry_points_to_main_runtime_completion(self) -> None:
        registry = json.loads((ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8"))
        encoded = json.dumps(registry, ensure_ascii=False)
        for token in (
            DECISION,
            SPEC,
            SYNC,
            MAIN_AUTHORITY,
            "src/core/resources/typed_glyph_stock_pool.gd",
            "STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "SYNCED_TO_MAIN",
        ):
            self.assertIn(token, encoded)

    def test_main_authority_is_closed_and_not_working_branch(self) -> None:
        combined = "\n".join(self.read(path) for path in ACTIVE_AUTHORITY[:5])
        for token in (
            SYNC,
            MAIN_AUTHORITY,
            "canon_status: SYNCED_TO_MAIN",
            "product_project: CREATED",
            "product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "runtime_validation: AUTOMATED_HEADLESS_PASS",
            "mobile_device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            "PLAYTEST_TUNING_REQUIRED",
        ):
            self.assertIn(token, combined)
        for stale in (
            "working_branch: agent/star-circuit-runtime-godot-poc",
            "canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED",
            "main_merge: PENDING",
        ):
            self.assertNotIn(stale, combined)

    def test_sheet_workbook_routes_to_main_sync(self) -> None:
        workbook = self.read("docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md")
        for token in (
            DECISION,
            SYNC,
            MAIN_AUTHORITY,
            "sync_status: SYNCED_TO_MAIN",
            "sheet_readback: PASS",
            "product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "runtime_validation: AUTOMATED_HEADLESS_PASS",
            "31 Suites",
            "1,137 assertions",
        ):
            self.assertIn(token, workbook)

    def test_main_sync_receipt_exists_and_preserves_boundaries(self) -> None:
        receipt = self.read("docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN.md")
        for token in (
            SYNC,
            MAIN_AUTHORITY,
            "status: SYNCED_TO_MAIN",
            "main_star_runtime_run: 31055213468",
            "main_platform_rights_run: 31055213609",
            "mobile_device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "accessibility_device_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            "full_vertical_slice_representativeness: NOT_RUN",
        ):
            self.assertIn(token, receipt)


if __name__ == "__main__":
    unittest.main()
