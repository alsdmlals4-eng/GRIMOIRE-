from __future__ import annotations

import json
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]


class BaseV94AdoptionTests(unittest.TestCase):
    def test_canonical_adapter_pins_base_v94(self) -> None:
        data = json.loads((ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8"))
        self.assertEqual(data["base_release"]["version"], "9.4.0")
        self.assertEqual(
            data["base_release"]["release_commit"],
            "a728712cb776ec98f4875914a580fcf7d0156593",
        )
        self.assertEqual(
            data["base_release"]["release_evidence_commit"],
            "ef1fba11167e4da0b298123b0c85ebd268191a42",
        )
        self.assertEqual(
            data["base_release"]["registry_sha256"],
            "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59",
        )
        self.assertEqual(data["gdd_sheet"]["sync_status"], "SYNCED_TO_MAIN")
        self.assertEqual(data["gdd_sheet"]["main_sync"], "SYNCED_TO_MAIN")
        self.assertEqual(
            data["gdd_sheet"]["main_commit"],
            "fe88236946a87362a43aafe598348b84c42a2243",
        )
        self.assertEqual(data["gdd_sheet"]["sheet_readback"], "PASS")
        self.assertEqual(data["project"]["primary_platform"], "Mobile")
        self.assertEqual(data["project"]["follow_up_platform"], "PC")
        self.assertEqual(data["project"]["platform_decision"], "GM-PLATFORM-02")
        self.assertEqual(data["current_state"]["next_product_gate"], "MOBILE-FOUNDATION-01")
        self.assertEqual(data["current_state"]["art_bible_01"], "APPROVED_DUAL_STANDARD_ART_BIBLE")
        self.assertEqual(data["current_state"]["battle_rules_01"], "APPROVED_SITUATION_RESOLUTION_RULES")
        self.assertEqual(data["current_state"]["asset_spec_01"], "APPROVED_SPEC")
        self.assertEqual(data["current_state"]["implementation"], "NOT_STARTED")

    def test_generated_operating_views_are_current(self) -> None:
        completed = subprocess.run(
            [sys.executable, "tools/generate_project_operating_views.py", "--check"],
            cwd=ROOT,
            text=True,
            capture_output=True,
            check=False,
        )
        self.assertEqual(completed.returncode, 0, completed.stdout + completed.stderr)

    def test_generated_views_follow_canonical_platform_and_gate(self) -> None:
        adapter = json.loads((ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8"))
        base_view = json.loads((ROOT / "skills/BASE_V9_ADAPTER.json").read_text(encoding="utf-8"))
        skill_view = json.loads((ROOT / "skills/PROJECT_BASE_SKILL_ADAPTER.json").read_text(encoding="utf-8"))

        self.assertEqual(
            base_view["maturity"]["next_gate"],
            adapter["current_state"]["next_product_gate"],
        )
        self.assertEqual(
            skill_view["platforms"]["primary"],
            adapter["project"]["primary_platform"],
        )
        self.assertEqual(
            skill_view["platforms"]["follow_up"],
            adapter["project"]["follow_up_platform"],
        )
        self.assertEqual(skill_view["platforms"]["touch_input"], "PRIMARY_VALIDATION_REQUIRED")
        self.assertEqual(
            skill_view["asset_and_license"]["mass_asset_generation"],
            "BLOCKED_BY_EXECUTION_PROFILE",
        )

    def test_generated_views_do_not_claim_runtime_validation(self) -> None:
        base_view = json.loads((ROOT / "skills/BASE_V9_ADAPTER.json").read_text(encoding="utf-8"))
        snapshot = json.loads((ROOT / "skills/PROJECT_SKILL_SNAPSHOT.json").read_text(encoding="utf-8"))
        self.assertEqual(base_view["base"]["release_line"], "v9.4.0")
        self.assertEqual(base_view["validation"]["runtime"], "NOT_RUN")
        self.assertEqual(base_view["validation"]["human"], "NOT_RUN")
        self.assertEqual(snapshot["generation_status"], "CURRENT")

    def test_current_authorities_and_audit_exist(self) -> None:
        required = [
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md",
            "docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md",
            "docs/planning/sync/GR-SYNC-20260802-07-MAIN.md",
            "docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md",
            "docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md",
            "docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md",
            "docs/planning/PROJECT_WIDE_OPERATING_AND_DESIGN_AUDIT_2026-08-01.md",
            "docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md",
        ]
        for relative in required:
            self.assertTrue((ROOT / relative).is_file(), relative)


if __name__ == "__main__":
    unittest.main()
