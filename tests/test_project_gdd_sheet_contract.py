from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SHEET_ID = "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
CORE_READBACK_TABS = {
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

    def test_adapter_routes_the_current_sheet_authority(self) -> None:
        sheet = self.adapter["gdd_sheet"]
        self.assertEqual(SHEET_ID, sheet["id"])
        self.assertEqual("USER_FACING_GDD_WORKSPACE", sheet["role"])
        self.assertEqual("IMMEDIATE_APPROVED_CANON_SYNC", sheet["write_policy"])
        self.assertEqual("PROPOSED_SHEET_CHANGE", sheet["sheet_only_change_policy"])
        self.assertEqual("SYNCED_TO_MAIN", sheet["sync_status"])
        self.assertEqual("PASS", sheet["sheet_readback"])
        self.assertTrue(CORE_READBACK_TABS <= set(sheet["readback_tabs"]))

    def test_workbook_records_main_runtime_and_fail_closed_human_boundaries(self) -> None:
        for token in (
            SHEET_ID,
            "USER_FACING_GDD_WORKSPACE",
            "SYNCED_TO_MAIN",
            "sheet_write: PASS",
            "sheet_readback: PASS",
            "product_project: CREATED",
            "STAR_RUNTIME_COMPLETION_AUTOMATED_PASS",
            "runtime_validation: AUTOMATED_HEADLESS_PASS",
            "mobile_device_validation: NOT_RUN",
            "performance_validation: NOT_RUN",
            "human_validation: NOT_RUN",
            *sorted(CORE_READBACK_TABS),
        ):
            self.assertIn(token, self.workbook)

    def test_sheet_does_not_replace_code_or_runtime_evidence(self) -> None:
        self.assertIn(
            "Sheet는 사용자 기획 작업면이며 Code·Scene·Test·Runtime 증거를 대체하지 않는다.",
            self.workbook,
        )
        self.assertIn("PLAYTEST_TUNING_REQUIRED", self.workbook)


if __name__ == "__main__":
    unittest.main()
