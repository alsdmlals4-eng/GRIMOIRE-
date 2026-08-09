from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class TestBaseV94Grimoire(unittest.TestCase):
    def test_identity_routes_and_state(self) -> None:
        adapter = json.loads(
            (ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8")
        )
        release = adapter["base_release"]
        self.assertEqual("9.4.3", release["version"])
        self.assertEqual("7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8", release["release_commit"])
        self.assertEqual(
            "da33a350d61b8adc52df97fccc7001708a933370",
            release["release_evidence_commit"],
        )
        self.assertEqual(
            "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59",
            release["registry_sha256"],
        )
        self.assertIn(
            "optimizing-ai-model-and-prompt-costs",
            {route["route_id"] for route in adapter["routing"]["base_routes"]},
        )
        self.assertEqual(
            {"magic-writing-recovery", "art-style-decision-gate"},
            {route["route_id"] for route in adapter["routing"]["project_routes"]},
        )
        self.assertEqual("PLANNING_ONLY_PROFILE", adapter["project"]["execution_profile"])
        self.assertEqual("NOT_STARTED", adapter["current_state"]["implementation"])

    def test_contracts(self) -> None:
        ai = (ROOT / "docs/AI_WORKFLOW.md").read_text(encoding="utf-8")
        ux = (ROOT / "docs/UX_UI_SYSTEM.md").read_text(encoding="utf-8")
        audit = (ROOT / "docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md").read_text(
            encoding="utf-8"
        )
        for token in (
            "[모델 추천]",
            "HARD_CONSTRAINT",
            "Interface-first",
            "Example-as-Fixture",
            "refresh_trigger",
            "NOT_RUN",
        ):
            self.assertIn(token, ai)
        for token in (
            "입력 접수",
            "처리 중",
            "중단",
            "즉시 완료",
            "빠른 반복",
            "재진입",
            "Reduced Motion",
            "mute",
            "haptic-off",
            "권위 시점",
        ):
            self.assertIn(token, ux)
        self.assertIn("product_paths_changed: false", audit)
        self.assertIn("HUMAN_NOT_RUN", audit)


if __name__ == "__main__":
    unittest.main()
