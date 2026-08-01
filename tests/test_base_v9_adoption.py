from __future__ import annotations

import json
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]


class BaseV93AdoptionTests(unittest.TestCase):
    def test_canonical_adapter_pins_base_v93(self) -> None:
        data = json.loads((ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8"))
        self.assertEqual(data["base_release"]["version"], "9.3.0")
        self.assertEqual(
            data["base_release"]["release_commit"],
            "30ca6c7b5f93521f0eb0eed42d01437cd43c50ae",
        )
        self.assertEqual(
            data["base_release"]["release_evidence_commit"],
            "462a86db192d23d0f386281a1eb54b0a8cbad62e",
        )
        self.assertEqual(
            data["base_release"]["registry_sha256"],
            "9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1",
        )
        self.assertEqual(data["gdd_sheet"]["sync_status"], "SYNCED_TO_WORKING_BRANCH")
        self.assertEqual(data["project"]["primary_platform"], "PC")
        self.assertEqual(data["current_state"]["art_bible_01"], "APPROVED_DUAL_STANDARD_ART_BIBLE")
        self.assertEqual(data["current_state"]["battle_rules_01"], "APPROVED_SITUATION_RESOLUTION_RULES")
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

    def test_generated_views_do_not_claim_runtime_validation(self) -> None:
        base_view = json.loads((ROOT / "skills/BASE_V9_ADAPTER.json").read_text(encoding="utf-8"))
        snapshot = json.loads((ROOT / "skills/PROJECT_SKILL_SNAPSHOT.json").read_text(encoding="utf-8"))
        self.assertEqual(base_view["base"]["release_line"], "v9.3.0")
        self.assertEqual(base_view["validation"]["runtime"], "NOT_RUN")
        self.assertEqual(base_view["validation"]["human"], "NOT_RUN")
        self.assertEqual(snapshot["generation_status"], "CURRENT")

    def test_current_authorities_and_audit_exist(self) -> None:
        required = [
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md",
            "docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md",
            "docs/planning/PROJECT_WIDE_OPERATING_AND_DESIGN_AUDIT_2026-08-01.md",
            "docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md",
        ]
        for relative in required:
            self.assertTrue((ROOT / relative).is_file(), relative)


if __name__ == "__main__":
    unittest.main()
