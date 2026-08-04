from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

GLYPH_SPEC = ROOT / "docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md"
WORKFLOW_SPEC = ROOT / "docs/superpowers/specs/2026-08-05-benchmark-tdd-checkpoint-governance-design.md"
GLYPH_APPROVAL = ROOT / "docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md"
WORKFLOW_APPROVAL = ROOT / "docs/planning/WORKFLOW_BENCHMARK_TDD_CHECKPOINT_01_APPROVAL_2026-08-05.md"
BENCHMARK = ROOT / "docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md"
AGENTS = ROOT / "AGENTS.md"
STOCK = ROOT / "docs/planning/STOCK_SYSTEM.md"
CAPACITY = ROOT / "docs/planning/STOCK_CAPACITY_SYSTEM.md"
BATCH = ROOT / "docs/planning/GRILL_ME_BATCH_MERGE_STATE.json"
STATUS = ROOT / "docs/planning/CANON_STATUS_INDEX_2026-08-04.md"
DOC_MAP = ROOT / "docs/DOCUMENTATION_MAP.md"
PLANNING_INDEX = ROOT / "docs/planning/README.md"


class GlyphVaultStockGovernanceContractTests(unittest.TestCase):
    def test_required_design_and_approval_documents_exist(self) -> None:
        for path in (GLYPH_SPEC, WORKFLOW_SPEC, GLYPH_APPROVAL, WORKFLOW_APPROVAL, BENCHMARK):
            self.assertTrue(path.is_file(), path)

    def test_glyph_resource_contract_separates_vault_and_universal_stock(self) -> None:
        text = GLYPH_SPEC.read_text(encoding="utf-8") + STOCK.read_text(encoding="utf-8")
        required = (
            "GM-GLYPH-VAULT-UNIVERSAL-STOCK-01",
            "EXACT_GLYPH_VAULT",
            "UNIVERSAL_GLYPH_STOCK",
            "LEARNED_MAIN_OR_SUPPORT",
            "TARGET_AND_EDGE_COST_ZERO",
            "SPELL_COMMIT_USES_MANA",
            "COMPLETED_SPELL_STOCK_PROHIBITED",
            "FOCUS_SCRIBE_WRITES_TO_VAULT",
            "EXPLICIT_SOURCE_SELECTION",
        )
        for token in required:
            self.assertIn(token, text)

    def test_vault_slots_and_universal_stock_have_separate_capacity(self) -> None:
        text = GLYPH_SPEC.read_text(encoding="utf-8") + CAPACITY.read_text(encoding="utf-8")
        required = (
            "SEPARATE_VAULT_AND_STOCK_CAPACITY",
            "UNIVERSAL_STOCK_CAPACITY",
            "EXACT_GLYPH_VAULT_SLOT_CAPACITY",
            "FOCUS_SCRIBE_RESERVES_VAULT_SLOT",
            "NATURAL_CHARGE_RESPECTS_STOCK_CAPACITY",
            "RESOURCE_RESERVATION_DOES_NOT_CREATE_EXTRA_CAPACITY_USAGE",
        )
        for token in required:
            self.assertIn(token, text)

    def test_workflow_contract_requires_benchmark_tdd_and_bounded_checkpoints(self) -> None:
        text = WORKFLOW_SPEC.read_text(encoding="utf-8") + AGENTS.read_text(encoding="utf-8")
        required = (
            "GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01",
            "BENCHMARK_AND_PRO_COMPARISON_REQUIRED",
            "SOURCE_VERSION_LIMIT_REQUIRED",
            "STRICT_RED_GREEN_REFACTOR",
            "TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK",
            "MAX_APPROVED_DECISIONS_PER_BATCH_10",
            "EARLY_CHECKPOINT_HIGH_RISK_CONFLICT",
            "EARLY_CHECKPOINT_SESSION_END",
            "EARLY_CHECKPOINT_MAJOR_CANON_IMPACT",
        )
        for token in required:
            self.assertIn(token, text)

    def test_active_entrypoints_route_to_pr61_and_new_decisions(self) -> None:
        text = DOC_MAP.read_text(encoding="utf-8") + PLANNING_INDEX.read_text(encoding="utf-8")
        for token in (
            "working_pull_request: 61",
            "grill_counter: 2_of_10",
            "GM-GLYPH-VAULT-UNIVERSAL-STOCK-01",
            "GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01",
            "USER_SPEC_REVIEW_PENDING",
        ):
            self.assertIn(token, text)
        self.assertNotIn("현재 제품 차단 결정은 계속 `ART-STYLE-01`", text)

    def test_batch_registers_two_approved_decisions_without_forcing_merge(self) -> None:
        data = json.loads(BATCH.read_text(encoding="utf-8"))
        counter = data["counter"]
        self.assertEqual(10, data["threshold"])
        self.assertEqual(2, counter["approved_grill_me_since_last_flush"])
        self.assertFalse(counter["merge_required"])
        self.assertEqual(
            [
                "GM-GLYPH-VAULT-UNIVERSAL-STOCK-01",
                "GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01",
            ],
            counter["pending_decision_ids"],
        )
        self.assertEqual("HIGH_CANON_IMPACT_DRAFT_CHECKPOINT", counter["checkpoint_state"])

    def test_old_typed_stock_contract_is_marked_partially_superseded(self) -> None:
        text = STATUS.read_text(encoding="utf-8")
        self.assertIn("GM-3X3-CIRCUIT-STOCK-FOCUS-01", text)
        self.assertIn("[부분 대체됨]", text)
        self.assertIn("GM-GLYPH-VAULT-UNIVERSAL-STOCK-01", text)

    def test_benchmark_record_contains_transfer_and_limit_fields(self) -> None:
        text = BENCHMARK.read_text(encoding="utf-8")
        for token in (
            "Apple Human Interface Guidelines",
            "Android Developers",
            "$1 Unistroke Recognizer",
            "$N Multistroke Recognizer",
            "LOSTMAGIC",
            "GDC",
            "transferable_principle",
            "project_mismatch_or_limit",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
