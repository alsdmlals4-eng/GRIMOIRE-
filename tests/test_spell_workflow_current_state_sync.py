from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SYNC_ID = "GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE"
LATEST_PRODUCT_MAIN = "fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f"
CURRENT_STATUS = "TASK7_MERGED_MAIN_VERIFIED"
NEXT_TASK = "TASK8_SPELL_USE_SCREEN"


class SpellWorkflowCurrentStateSyncContract(unittest.TestCase):
    def _read(self, relative_path: str) -> str:
        return (ROOT / relative_path).read_text(encoding="utf-8")

    def test_current_state_surfaces_share_task7_and_task8_markers(self) -> None:
        for relative_path in (
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/CURRENT_UNRESOLVED_GATES.md",
        ):
            with self.subTest(path=relative_path):
                text = self._read(relative_path)
                self.assertIn(SYNC_ID, text)
                self.assertIn(LATEST_PRODUCT_MAIN, text)
                self.assertIn(CURRENT_STATUS, text)
                self.assertIn(NEXT_TASK, text)

    def test_audit_evidence_remains_linked(self) -> None:
        audit = self._read(
            "docs/planning/audits/2026-08-11-current-state-freshness-audit.md"
        )
        self.assertIn("GR-AUDIT-20260811-CURRENT-STATE-FRESHNESS", audit)
        self.assertIn("READY_FOR_CORRECTIVE_SYNC", audit)


if __name__ == "__main__":
    unittest.main()
