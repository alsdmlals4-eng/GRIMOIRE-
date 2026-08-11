from __future__ import annotations

import json
import subprocess
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
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
V313_TREE = "94be4fb34d49243375c592e17a1021c8c6fcbcf2"
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

    def test_sync19_evidence_remains_historical_and_does_not_rewrite_later_live_receipt(self) -> None:
        self.assertTrue(EVIDENCE.is_file(), str(EVIDENCE))
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
        self.assertFalse(data["claims"]["live_handshake_verified"])
        self.assertFalse(data["claims"]["direct_tool_state_authoring_receipt_verified"])

    def test_current_authority_records_tracked_v314_plus_exact_project_live_ready(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(CURRENT_SYNC_ID, data["local_execution_policy"]["sync_id"])
        self.assertEqual("v3.1.4", data["higodot"]["release_tag"])
        self.assertEqual("3.1.4", data["higodot"]["bundled_version"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["higodot"]["pinned_source_commit"])
        self.assertEqual(V314_TREE, data["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(V314_TREE, data["higodot"]["project_vendor_tree_sha"])
        self.assertEqual("PASS_EXACT_TREE_IDENTITY", data["higodot"]["vendor_integrity"])
        self.assertEqual(CURRENT_LIVE, data["higodot"]["live_version_readback"])
        self.assertTrue(data["higodot"]["tracked_version_matches_live"])
        self.assertEqual(SESSION_ID, data["higodot"]["live_mcp_session"])
        self.assertEqual("READY", data["higodot"]["live_mcp_readiness"])
        self.assertEqual(EXPECTED_FIELD_LIMIT, data["higodot"]["expected_version_field"])
        self.assertEqual(DIRECT_TOOL_STATE_COMMIT, data["higodot"]["direct_local_upgrade_commit"])
        self.assertEqual(RECEIPT_LIMIT, data["higodot"]["direct_local_upgrade_receipt_status"])
        historical = data["higodot"]["historical_v3_1_3"]
        self.assertEqual("v3.1.3", historical["release_tag"])
        self.assertEqual(V313_TREE, historical["project_vendor_tree_sha"])
        base = data["base_policy_observation"]
        self.assertEqual(CURRENT_BASE_MAIN, base["latest_main_observed"])

    def test_current_human_canon_records_live_ready_without_inventing_expected_field(self) -> None:
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
