from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def load(path: str) -> dict:
    return json.loads((ROOT / path).read_text(encoding="utf-8"))


class BaseV943AdoptionTests(unittest.TestCase):
    def test_canonical_adapter_pins_v943_and_preserves_project_boundaries(self) -> None:
        adapter = load("skills/PROJECT_BASE_ADAPTER.json")
        release = adapter["base_release"]
        expected = {
            "version": "9.4.3",
            "release_commit": "7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8",
            "release_evidence_commit": "da33a350d61b8adc52df97fccc7001708a933370",
            "finalization_commit": "0b7c94f38d959efc0fc9442274c60b2e268a3c97",
            "registry_sha256": "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59",
        }
        for key, value in expected.items():
            self.assertEqual(value, release[key], key)
        self.assertEqual("SYNCED_TO_MAIN", adapter["gdd_sheet"]["sync_status"])
        self.assertEqual("PASS", adapter["gdd_sheet"]["sheet_readback"])
        self.assertEqual("Mobile", adapter["project"]["primary_platform"])
        self.assertEqual("MOBILE-FOUNDATION-01", adapter["current_state"]["next_product_gate"])
        self.assertEqual("NOT_STARTED", adapter["current_state"]["implementation"])

    def test_generated_operating_views_are_current(self) -> None:
        result = subprocess.run([sys.executable, "tools/generate_project_operating_views.py", "--check"], cwd=ROOT, text=True, capture_output=True, check=False)
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)

    def test_generated_views_preserve_platform_and_evidence_ceiling(self) -> None:
        adapter = load("skills/PROJECT_BASE_ADAPTER.json")
        base_view = load("skills/BASE_V9_ADAPTER.json")
        skill_view = load("skills/PROJECT_BASE_SKILL_ADAPTER.json")
        snapshot = load("skills/PROJECT_SKILL_SNAPSHOT.json")
        self.assertEqual("v9.4.3", base_view["base"]["release_line"])
        self.assertEqual(adapter["current_state"]["next_product_gate"], base_view["maturity"]["next_gate"])
        self.assertEqual(adapter["project"]["primary_platform"], skill_view["platforms"]["primary"])
        self.assertEqual("PRIMARY_VALIDATION_REQUIRED", skill_view["platforms"]["touch_input"])
        self.assertEqual("BLOCKED_BY_EXECUTION_PROFILE", skill_view["asset_and_license"]["mass_asset_generation"])
        self.assertEqual("NOT_RUN", base_view["validation"]["runtime"])
        self.assertEqual("NOT_RUN", base_view["validation"]["human"])
        self.assertEqual("CURRENT", snapshot["generation_status"])

    def test_current_authorities_exist(self) -> None:
        for path in (
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md",
            "docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md",
            "docs/planning/sync/GR-SYNC-20260802-07-MAIN.md",
            "docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md",
            "docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md",
            "docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md",
        ):
            self.assertTrue((ROOT / path).is_file(), path)


if __name__ == "__main__": unittest.main()
