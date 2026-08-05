from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DECISION = "GM-STAR-CIRCUIT-MASTERY-BALANCE-01"
SYNC = "GR-SYNC-20260806-01"
MAIN_AUTHORITY = "6ee87a452ebb5793fb6739249287dfd537f4ee89"
SPEC = "docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md"
ACTIVE_AUTHORITY = (
    "AGENTS.md",
    "START_HERE.md",
    "docs/ACTIVE_CONTEXT.md",
    "docs/DEVELOPMENT_GATES.md",
    "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    "docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md",
)
MAIN_STATUS_AUTHORITY = (
    "AGENTS.md",
    "START_HERE.md",
    "docs/ACTIVE_CONTEXT.md",
    "docs/DEVELOPMENT_GATES.md",
    "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md",
    "docs/planning/CANON_STATUS_INDEX_2026-08-04.md",
    "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    "docs/planning/sync/GR-SYNC-20260806-01-MAIN.md",
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

    def test_main_status_authority_is_finalized(self) -> None:
        stale_status_tokens = (
            "WORKING_BRANCH_GITHUB_AND_SHEET_SYNC_IN_PROGRESS",
            "current_working_sync:",
            "main_sync: NOT_MERGED",
        )
        for path in MAIN_STATUS_AUTHORITY:
            text = self.read(path)
            self.assertIn(DECISION, text, path)
            self.assertIn(SYNC, text, path)
            self.assertIn(MAIN_AUTHORITY, text, path)
            self.assertIn("SYNCED_TO_MAIN", text, path)
            for token in stale_status_tokens:
                self.assertNotIn(token, text, f"{path}: stale status token {token}")

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

    def test_registry_points_to_new_spec_and_main_sync(self) -> None:
        registry = json.loads(
            (ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8")
        )
        encoded = json.dumps(registry, ensure_ascii=False)
        self.assertIn(DECISION, encoded)
        self.assertIn(SPEC, encoded)
        self.assertIn(MAIN_AUTHORITY, encoded)
        self.assertIn("SYNCED_TO_MAIN", encoded)

    def test_sheet_workbook_routes_to_main_sync(self) -> None:
        workbook = self.read("docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md")
        for token in (
            DECISION,
            SYNC,
            MAIN_AUTHORITY,
            "SYNCED_TO_MAIN",
            "sheet_readback: PASS",
            "product_implementation: NOT_STARTED",
            "runtime_validation: NOT_RUN",
        ):
            self.assertIn(token, workbook)

    def test_runtime_state_is_not_overclaimed(self) -> None:
        decisions = self.read("docs/planning/CURRENT_CONFIRMED_DECISIONS.md")
        self.assertIn("product_implementation: NOT_STARTED", decisions)
        self.assertIn("runtime_validation: NOT_RUN", decisions)


if __name__ == "__main__":
    unittest.main()
