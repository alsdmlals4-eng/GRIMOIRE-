from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SHEET_ID = "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
HISTORICAL_READBACK_TABS = {
    "00_프로젝트_허브",
    "01_작업순서",
    "02_현재_확정결정",
    "04_누락_충돌_감사",
    "60_UX_UI_접근성",
    "80_데모_버티컬슬라이스_플레이테스트",
    "99_변경이력",
}


class ProjectGddSheetContractTests(unittest.TestCase):
    def setUp(self) -> None:
        self.adapter = json.loads(
            (ROOT / "skills/PROJECT_BASE_ADAPTER.json").read_text(encoding="utf-8")
        )
        self.workbook = (ROOT / "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(
            encoding="utf-8"
        )

    def test_adapter_routes_sheet_as_migration_only_provenance(self) -> None:
        sheet = self.adapter["gdd_sheet"]
        self.assertEqual(SHEET_ID, sheet["id"])
        self.assertEqual("MIGRATION_ONLY_UNTIL_REMOVAL", sheet["role"])
        self.assertEqual("NO_NEW_CANON_WRITES", sheet["write_policy"])
        self.assertEqual("UNIQUE_MATERIAL_AUDIT_REQUIRED", sheet["retirement_gate"])
        self.assertEqual("BLOCKED_UNVERIFIED_UNIQUE_MATERIAL", sheet["retirement_state"])
        self.assertEqual("HISTORICAL_PROVENANCE_ONLY", sheet["main_sync"])
        self.assertEqual("HISTORICAL_PASS_CURRENT_NOT_AUTHORITY", sheet["sheet_readback"])
        self.assertTrue(HISTORICAL_READBACK_TABS <= set(sheet["readback_tabs"]))

    def test_workbook_preserves_history_without_active_authority(self) -> None:
        for token in (
            SHEET_ID,
            "MIGRATION_ONLY_UNTIL_REMOVAL",
            "BLOCKED_UNVERIFIED_UNIQUE_MATERIAL",
            "new_canon_writes: FORBIDDEN",
            "historical_sheet_write: PASS",
            "historical_sheet_readback: PASS",
            "mobile_device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            "full_vertical_slice_validation: NOT_RUN",
            *sorted(HISTORICAL_READBACK_TABS),
        ):
            self.assertIn(token, self.workbook)

    def test_sheet_does_not_replace_current_notion_or_repository_authority(self) -> None:
        self.assertIn("Notion", self.workbook)
        self.assertIn("GitHub repository", self.workbook)
        self.assertIn("historical migration source only", self.workbook)
        self.assertNotIn("USER_FACING_GDD_WORKSPACE", self.workbook)


if __name__ == "__main__":
    unittest.main()
