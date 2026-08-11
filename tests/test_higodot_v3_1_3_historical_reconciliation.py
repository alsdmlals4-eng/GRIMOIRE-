from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_3_VENDOR_INTEGRITY.json"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
V313_SYNC = "GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION"
V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
V314_TREE = "69010571e11123dfc4e09483f80cb9e6ca93511a"
RECEIPT_LIMIT = "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT"


class HiGodotV313HistoricalReconciliationTests(unittest.TestCase):
    def test_v313_evidence_remains_immutable_history(self) -> None:
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(V313_SYNC, data["sync_id"])
        self.assertEqual("v3.1.3", data["release"])
        self.assertEqual(V313_TREE, data["official_plugin_subtree"])
        self.assertEqual(V313_TREE, data["project_tracked_plugin_subtree"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["result"])
        self.assertEqual(RECEIPT_LIMIT, data["authoring_receipt_status"])
        self.assertTrue(data["claims"]["live_mcp_reports_v3_1_3"])

    def test_v313_sync_document_remains_traceable(self) -> None:
        text = SYNC.read_text(encoding="utf-8")
        for token in (V313_SYNC, V313_TREE, "PASS_EXACT_TREE_IDENTITY", RECEIPT_LIMIT):
            self.assertIn(token, text)

    def test_current_authority_preserves_v313_as_historical_predecessor(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("v3.1.4", data["higodot"]["release_tag"])
        self.assertEqual(V314_TREE, data["higodot"]["project_vendor_tree_sha"])
        history = data["higodot"]["historical_v3_1_3"]
        self.assertEqual("v3.1.3", history["release_tag"])
        self.assertEqual(V313_TREE, history["project_vendor_tree_sha"])
        self.assertEqual(V313_SYNC, history["tracked_sync"])
        self.assertEqual("PASS_V3_1_3", history["live_version_readback"])


if __name__ == "__main__":
    unittest.main()
