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
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", adapter["gdd_sheet"]["role"])
        self.assertEqual("NO_NEW_CANON_WRITES", adapter["gdd_sheet"]["write_policy"])
        self.assertEqual("Mobile", adapter["project"]["primary_platform"])
        self.assertEqual("TASK8_PR_PREP_REVERIFY_PENDING", adapter["current_state"]["next_product_gate"])
        self.assertEqual("PARTIAL_FOUNDATION", adapter["current_state"]["implementation"])
        self.assertEqual("NOT_RUN", adapter["current_state"]["human_validation"])

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
        self.assertEqual("PARTIAL_FOUNDATION", base_view["maturity"]["status"])
        self.assertEqual(adapter["project"]["primary_platform"], skill_view["platforms"]["primary"])
        self.assertEqual("PRIMARY_VALIDATION_REQUIRED", skill_view["platforms"]["touch_input"])
        self.assertEqual("BOUNDED_APPROVED_WORKSTREAM_ONLY", skill_view["asset_and_license"]["mass_asset_generation"])
        self.assertEqual("STAR_CIRCUIT_AUTOMATED_POC_PASS_FULL_SLICE_NOT_RUN", base_view["validation"]["runtime"])
        self.assertEqual("NOT_RUN", base_view["validation"]["human"])
        self.assertEqual("NOT_RUN", base_view["validation"]["device"])
        self.assertEqual("NOT_RUN", base_view["validation"]["performance"])
        self.assertEqual("NOT_RUN", base_view["validation"]["full_vertical_slice"])
        self.assertEqual("CURRENT", snapshot["generation_status"])

    def test_current_authorities_exist(self) -> None:
        for path in (
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md",
            "docs/planning/CANON_AUTHORITY_REALITY_SYNC_2026-08-21.md",
            "docs/planning/sync/GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC.md",
            "docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md",
            "docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md",
            "docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md",
        ):
            self.assertTrue((ROOT / path).is_file(), path)

    def test_base_reuse_adoption_manifest_is_project_bounded(self) -> None:
        manifest = load("docs/base-reuse-adoption.json")
        self.assertEqual(1, manifest["schema_version"])
        self.assertEqual(
            "8553678f70e22f193a2336b591f677dcfa5a8965",
            manifest["base_source_commit"],
        )
        states = {
            module_id: config["state"]
            for module_id, config in manifest["modules"].items()
        }
        self.assertEqual(
            {
                "RM-TOOL-001": "planned",
                "RM-SYS-001": "not_applicable",
                "RM-SYS-003": "planned",
                "RM-VIS-001": "planned",
                "RM-VIS-002": "planned",
            },
            states,
        )
        self.assertEqual("not_applicable", states["RM-SYS-001"])
        self.assertNotIn("enabled", states.values())


if __name__ == "__main__": unittest.main()
