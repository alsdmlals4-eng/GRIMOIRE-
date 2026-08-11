from __future__ import annotations

import json
import subprocess
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CURRENT_STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE_SYNC20.json"
SYNC19_STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_4_VENDOR_INTEGRITY.json"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION.md"
CURRENT_DOCS = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
    ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md",
]

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
TRACKED_SYNC_ID = "GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION"
CURRENT_SYNC_ID = "GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT"
UPSTREAM_TAG_COMMIT = "96cc8b8c3d25ce487e24801d01d5214fea150349"
V314_TREE = "69010571e11123dfc4e09483f80cb9e6ca93511a"
DIRECT_TOOL_STATE_COMMIT = "257a0dba33f8288d24b1cd291bb407f4505224b4"
CURRENT_BASE_MAIN = "6d2feba2bc49fda2d8d273248b55087853615d5d"
RECEIPT_LIMIT = "HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT"
HISTORICAL_LIVE_GATE = "LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED"
CURRENT_LIVE = "LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED"
EXPECTED_FIELD_LIMIT = "NOT_SURFACED_DO_NOT_CLAIM"
SESSION_ID = "task8-spell-use-screen-v2@3cfa"


class HiGodotV314TrackedReconciliationTests(unittest.TestCase):
    def test_tracked_plugin_is_exact_official_v314_tree(self) -> None:
        plugin = (ROOT / "addons/godot_ai/plugin.cfg").read_text(encoding="utf-8")
        self.assertIn('version="3.1.4"', plugin)
        tree = subprocess.run(
            ["git", "rev-parse", "HEAD:addons/godot_ai"],
            cwd=ROOT,
            check=True,
            capture_output=True,
            text=True,
        ).stdout.strip()
        self.assertEqual(V314_TREE, tree)

    def test_sync19_evidence_remains_historical(self) -> None:
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(TRACKED_SYNC_ID, data["sync_id"])
        self.assertEqual("v3.1.4", data["release"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["official_tag_commit"])
        self.assertEqual(V314_TREE, data["official_plugin_subtree"])
        self.assertEqual(V314_TREE, data["project_tracked_plugin_subtree"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["tracked_tree_identity"])
        self.assertTrue(data["tracked_vendor_synced"])
        self.assertEqual(DIRECT_TOOL_STATE_COMMIT, data["observed_direct_tool_state_commit"])
        self.assertEqual(RECEIPT_LIMIT, data["authoring_receipt_status"])
        self.assertEqual(HISTORICAL_LIVE_GATE, data["live_alignment_status"])
        old_state = json.loads(SYNC19_STATE.read_text(encoding="utf-8"))
        self.assertIn(HISTORICAL_LIVE_GATE, json.dumps(old_state))

    def test_sync20_current_machine_state_records_exact_project_live_ready(self) -> None:
        data = json.loads(CURRENT_STATE.read_text(encoding="utf-8"))
        self.assertEqual(CURRENT_SYNC_ID, data["sync_id"])
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(CURRENT_BASE_MAIN, data["base"]["current_main_observed"])
        self.assertEqual("9.4.3", data["base"]["project_pin"])
        higodot = data["higodot"]
        self.assertEqual("v3.1.4", higodot["release"])
        self.assertEqual(V314_TREE, higodot["tracked_plugin_subtree"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", higodot["tracked_vendor_integrity"])
        self.assertEqual(CURRENT_LIVE, higodot["live_status"])
        self.assertEqual(SESSION_ID, higodot["session_id"])
        self.assertEqual("3.1.4", higodot["server_version"])
        self.assertEqual("3.1.4", higodot["plugin_version"])
        self.assertEqual("READY", higodot["readiness"])
        self.assertEqual(EXPECTED_FIELD_LIMIT, higodot["expected_version_field"])
        self.assertEqual(RECEIPT_LIMIT, higodot["direct_local_upgrade_receipt"])
        self.assertFalse(data["claims"]["expected_version_field_verified"])
        self.assertFalse(data["claims"]["direct_local_upgrade_receipt_verified"])

    def test_current_human_canon_matches_sync20_live_evidence_boundary(self) -> None:
        self.assertTrue(SYNC.is_file(), str(SYNC))
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT_DOCS)
        for token in (
            DECISION,
            TRACKED_SYNC_ID,
            CURRENT_SYNC_ID,
            "v3.1.4",
            V314_TREE,
            CURRENT_LIVE,
            EXPECTED_FIELD_LIMIT,
            RECEIPT_LIMIT,
        ):
            self.assertIn(token, combined)
        self.assertIn("TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING", combined)
        self.assertIn("TASK7_MERGED_MAIN_VERIFIED", combined)
        self.assertNotIn("tracked project vendor remains v3.1.3", combined)


if __name__ == "__main__":
    unittest.main()
