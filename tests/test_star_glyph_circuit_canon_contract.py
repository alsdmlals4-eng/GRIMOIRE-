from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DECISION = "GM-STAR-CIRCUIT-MASTERY-BALANCE-01"
SYNC = "GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION"
MAIN_AUTHORITY = "2012a9f4c2da09a1defec07f8d8f7a0d3c867d93"
PREVIOUS_MAIN_SYNC = "GR-SYNC-20260806-01-MAIN"
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

    def test_registry_points_to_current_runtime_completion(self) -> None:
        registry = json.loads((ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8"))
        encoded = json.dumps(registry, ensure_ascii=False)
        for token in (
            DECISION,
            SPEC,
            SYNC,
            "src/core/resources/typed_glyph_stock_pool.gd",
            "docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md",
            "STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
        ):
            self.assertIn(token, encoded)

    def test_rebase_preserves_latest_main_authority(self) -> None:
        combined = "\n".join(self.read(path) for path in (
            "AGENTS.md",
            "docs/planning/CANON_STATUS_INDEX_2026-08-04.md",
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md",
        ))
        self.assertIn(MAIN_AUTHORITY, combined)
        self.assertIn(PREVIOUS_MAIN_SYNC, combined)
        self.assertNotIn("main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89", combined)

    def test_sheet_workbook_routes_to_runtime_completion_sync(self) -> None:
        workbook = self.read("docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md")
        for token in (
            DECISION,
            SYNC,
            "SYNCED_TO_WORKING_BRANCH",
            "sheet_readback: PASS",
            "product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "runtime_validation: AUTOMATED_HEADLESS_PASS",
            "mobile_device_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            "31 Suites",
            "1,137 assertions",
        ):
            self.assertIn(token, workbook)

    def test_runtime_state_is_honest_and_current(self) -> None:
        combined = "\n".join(self.read(path) for path in ACTIVE_AUTHORITY[:5])
        for token in (
            SYNC,
            "product_project: CREATED",
            "product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "runtime_validation: AUTOMATED_HEADLESS_PASS",
            "mobile_device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            "PLAYTEST_TUNING_REQUIRED",
        ):
            self.assertIn(token, combined)
        self.assertNotIn("product_implementation: NOT_STARTED", combined)


if __name__ == "__main__":
    unittest.main()
