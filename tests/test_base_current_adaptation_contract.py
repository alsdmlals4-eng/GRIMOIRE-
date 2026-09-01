from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ADAPTATION_PATH = ROOT / "docs/contracts/GRIMOIRE_BASE_CURRENT_ADAPTATION_2026-09-01.md"
RECEIPT_PATH = ROOT / "docs/contracts/receipts/2026-09-01-base-current-adaptation-work-contract-receipt.json"
BASE_CURRENT_MAIN = "19355b7ef065a21d0f2b685c7d9be64a4a3970f8"


class BaseCurrentAdaptationContractTests(unittest.TestCase):
    def test_current_base_read_is_recorded_without_replacing_the_adopted_v943_pin(self) -> None:
        adapter = json.loads((ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8"))
        refresh = adapter["base_current_refresh"]

        self.assertEqual(BASE_CURRENT_MAIN, refresh["latest_completed_main"])
        self.assertEqual("READ_AND_PROJECT_ADAPTED", refresh["status"])
        self.assertEqual("v9.4.3", refresh["adopted_release_lock"])
        self.assertEqual("docs/contracts/GRIMOIRE_BASE_CURRENT_ADAPTATION_2026-09-01.md", refresh["adaptation_owner"])
        self.assertEqual("9.4.3", adapter["base_release"]["version"])

    def test_l3_receipt_is_present_and_contains_benchmark_and_hygiene_evidence(self) -> None:
        receipt = json.loads(RECEIPT_PATH.read_text(encoding="utf-8"))
        self.assertEqual("L3", receipt["work_level"])
        self.assertEqual("PASS", receipt["benchmark_preflight_receipt"]["state"])
        self.assertGreaterEqual(len(receipt["benchmark_preflight_receipt"]["entries"]), 3)
        classifications = {item["classification"] for item in receipt["context_configuration_hygiene"]["inventory"]}
        self.assertIn("ACTIVE_OWNER", classifications)
        self.assertIn("COMPATIBILITY", classifications)

    def test_active_entries_use_one_project_adaptation_and_quarantine_star_history(self) -> None:
        adaptation = ADAPTATION_PATH.read_text(encoding="utf-8")
        self.assertIn("GM-BASE-CURRENT-ADAPTATION-20260901-01", adaptation)
        self.assertIn(BASE_CURRENT_MAIN, adaptation)
        self.assertIn("ADOPT / ADAPT / REJECT", adaptation)
        self.assertIn("CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK", adaptation)
        self.assertIn("NO_NEW_REUSE_LEARNING", adaptation)

        for relative_path in (
            "AGENTS.md",
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
            "docs/DEVELOPMENT_GATES.md",
            "docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md",
        ):
            text = (ROOT / relative_path).read_text(encoding="utf-8")
            self.assertIn("GRIMOIRE_BASE_CURRENT_ADAPTATION_2026-09-01.md", text, relative_path)
            self.assertIn("2026-09-01-base-current-adaptation-work-contract-receipt.json", text, relative_path)

        agents = (ROOT / "AGENTS.md").read_text(encoding="utf-8")
        self.assertIn("HISTORICAL_COMPATIBILITY_ONLY", agents)
        self.assertNotIn("이 내부 코어는 유지한다.", agents)
        self.assertNotIn("FIVE_POINT_STAR 회로 조합 + 완성 주문 이름 확인", agents)

    def test_registry_and_gate_expose_the_receipt_as_an_active_start_requirement(self) -> None:
        registry = json.loads((ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8"))
        self.assertIn("docs/contracts/GRIMOIRE_BASE_CURRENT_ADAPTATION_2026-09-01.md", registry["current_authority_chain"])
        self.assertIn("docs/contracts/receipts/2026-09-01-base-current-adaptation-work-contract-receipt.json", registry["current_authority_chain"])

        gates = (ROOT / "docs/DEVELOPMENT_GATES.md").read_text(encoding="utf-8")
        self.assertIn("PINNED_BASE_RECEIPT_VALIDATION_REQUIRED", gates)
        self.assertIn("REUSE_FIRST_PREFLIGHT_REQUIRED", gates)
        self.assertIn("READ_AND_PROJECT_ADAPTED", gates)


if __name__ == "__main__":
    unittest.main()
