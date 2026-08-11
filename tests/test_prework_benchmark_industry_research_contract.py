import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CANON = ROOT / "docs/planning/PREWORK_BENCHMARK_INDUSTRY_RESEARCH_01_APPROVAL_2026-08-11.md"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH.md"
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"


class PreworkBenchmarkIndustryResearchContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.canon = CANON.read_text(encoding="utf-8")
        cls.sync = SYNC.read_text(encoding="utf-8")
        cls.current = CURRENT.read_text(encoding="utf-8")

    def test_user_approved_process_decision_is_canonical(self):
        self.assertIn("decision_id: GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01", self.canon)
        self.assertIn("sync_id: GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH", self.canon)
        self.assertIn("status: USER_APPROVED_ACTIVE", self.canon)
        self.assertIn("scope: PROJECT_PROCESS_ONLY", self.canon)

    def test_prework_order_requires_fresh_context_and_research_before_work(self):
        for token in (
            "Base current main / relevant owners 재조회",
            "GRIMOIRE default branch / latest commit / open PR 재조회",
            "Google Sheet current data 재조회",
            "벤치마킹 + 현업조사 수행",
            "그 뒤에만 설계·계획·구현·정본 편집 시작",
        ):
            self.assertIn(token, self.canon)

    def test_required_dispositions_and_existing_solution_first_are_present(self):
        for token in ("ADOPT", "ADAPT", "TEST", "AVOID", "IGNORE", "REFERENCE_ONLY", "Existing Solution First"):
            self.assertIn(token, self.canon)

    def test_copying_competitor_expression_is_forbidden(self):
        self.assertIn("복제 금지", self.canon)
        self.assertIn("경쟁작의 대사·서사 사건·캐릭터·레벨·UI 표현·아트 스타일·코드·에셋을 복제하지 않는다", self.canon)

    def test_same_work_unit_research_receipt_reuse_is_bounded(self):
        self.assertIn("같은 work unit", self.canon)
        self.assertIn("범위·제품 결정·핵심 가정이 달라지면 새 work unit", self.canon)

    def test_current_snapshot_exposes_active_process_gate(self):
        self.assertIn("prework_research_decision: GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01", self.current)
        self.assertIn("prework_research_sync: GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH", self.current)
        self.assertIn("prework_research_gate: REQUIRED_BEFORE_NEW_SUBSTANTIVE_WORK_UNIT", self.current)

    def test_sync_preserves_product_and_godot_boundaries(self):
        self.assertIn("product_decision_mutation: NONE", self.sync)
        self.assertIn("persistent_godot_source_mutation: NONE", self.sync)


if __name__ == "__main__":
    unittest.main()
