from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE_SHA = "c987647d01ad2baa028a16e03d85ddfc1572a727"
SHEET_ID = "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
REQUIRED_TABS = {
    "00_프로젝트_허브",
    "05_GDD_요약",
    "15_조작_게임규칙",
    "51_미니게임",
    "52_글쓰기_서사",
    "99_변경이력",
}


class ProjectGddSheetContractTests(unittest.TestCase):
    def setUp(self) -> None:
        self.registry = json.loads(
            (ROOT / "skills/SKILL_REGISTRY.json").read_text(encoding="utf-8")
        )
        self.workbook = (ROOT / "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(
            encoding="utf-8"
        )

    def test_registry_contract(self) -> None:
        route = self.registry["base_registry_route"]
        sheet = self.registry["bca_visual_sheet"]
        self.assertEqual(route["commit"], BASE_SHA)
        self.assertEqual(route["project_sheet_status"], "PROJECT_SHEET_CONFIGURED")
        self.assertEqual(route["project_sheet_id"], SHEET_ID)
        self.assertEqual(route["project_sheet_role"], "USER_FACING_GDD_WORKSPACE")
        self.assertEqual(route["project_sheet_edit_policy"], "PROPOSED_SHEET_CHANGE")
        self.assertEqual(sheet["spreadsheet_id"], SHEET_ID)
        self.assertTrue(REQUIRED_TABS <= set(sheet["required_tabs"]))

    def test_workbook_contract(self) -> None:
        for token in (
            "PROJECT_SHEET_CONFIGURED",
            SHEET_ID,
            "USER_FACING_GDD_WORKSPACE",
            "PROPOSED_SHEET_CHANGE",
            BASE_SHA,
            *sorted(REQUIRED_TABS),
        ):
            self.assertIn(token, self.workbook)

    def test_project_state_is_not_overclaimed(self) -> None:
        project = self.registry["project"]
        self.assertEqual(project["product_stage"], "DEMO_FIRST_VERTICAL_SLICE")
        self.assertEqual(project["implementation_status"], "NOT_STARTED")
        self.assertEqual(project["work_mode"], "PLAN")


if __name__ == "__main__":
    unittest.main()
