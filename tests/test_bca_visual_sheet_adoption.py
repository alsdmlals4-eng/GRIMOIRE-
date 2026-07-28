
from __future__ import annotations
import json
import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BASE_SHA="7072b9e2742a60d7548fd39df3328ad76a8dbad1"
class TestBCA(unittest.TestCase):
    def test_active_stage_and_base(self):
        registry=json.loads((ROOT/"skills/SKILL_REGISTRY.json").read_text(encoding="utf-8"))
        self.assertEqual(registry["project"]["product_stage"],"DEMO_FIRST_VERTICAL_SLICE")
        self.assertEqual(registry["base_registry_route"]["commit"],BASE_SHA)
        self.assertIn("integrated_v8",registry["execution_contracts"])
        self.assertNotIn("short_v6",registry["execution_contracts"])
    def test_sheet_and_visual_contracts(self):
        sheet=(ROOT/"docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(encoding="utf-8")
        visual=(ROOT/"docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md").read_text(encoding="utf-8")
        for token in ("11_세계관","12_핵심루프","13_주요인물","14_조연_세력_관계","40_핵심시스템_메인콘텐츠","71_이미지기획_생성목록","72_이미지검수_승인로그","NOT_CONFIGURED"):
            self.assertIn(token,sheet)
        for token in ("planning-visualization","final-visual-candidate","visual-qa-and-approval","PROJECT_ASSET_APPROVED","자동 최종 자산"):
            self.assertIn(token,visual)
    def test_legacy_contracts_are_non_authoritative(self):
        for path in ("docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md","docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md"):
            text=(ROOT/path).read_text(encoding="utf-8")
            self.assertIn("status: LEGACY_COMPATIBILITY",text,path)
            self.assertIn("active_authority: false",text,path)
if __name__=="__main__": unittest.main()
