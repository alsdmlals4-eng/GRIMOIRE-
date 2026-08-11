from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_4_LIVE_READBACK_2026-08-11.json"
SYNC = ROOT / "docs/planning/sync/GR-SYNC-20260811-20-HIGODOT-V314-LIVE-TASK8-ENTRY.md"
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"

DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
SYNC_ID = "GR-SYNC-20260811-20-HIGODOT-V314-LIVE-TASK8-ENTRY"
BASE_MAIN = "7ce96181d0a97930300fcc6d383dacc75ad08f6a"


class Task8LiveEntryLocal47VarianceTests(unittest.TestCase):
    def test_live_readback_evidence_records_server_and_recent_editor_bridge(self) -> None:
        self.assertTrue(EVIDENCE.is_file(), str(EVIDENCE))
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(SYNC_ID, data["sync_id"])
        self.assertEqual("3.1.4", data["server_version"])
        self.assertEqual(9500, data["ws_port"])
        self.assertEqual("plugin", data["owner_type"])
        self.assertEqual("PASS_ESTABLISHED", data["recent_editor_websocket_evidence"])
        self.assertEqual("4.7.stable.official.5b4e0cb0f", data["local_editor_version"])
        self.assertEqual("NONBLOCKING_FOR_TASK8_DEVELOPMENT", data["local_patch_variance_disposition"])
        self.assertEqual("4.7.1", data["ci_exact_version_baseline"])
        self.assertFalse(data["claims"]["post_restart_websocket_rechecked"])
        self.assertTrue(data["claims"]["user_accepted_local_4_7_0_nonblocking"])

    def test_current_authority_opens_task8_entry_without_lowering_ci_baseline(self) -> None:
        data = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual(BASE_MAIN, data["base_policy_observation"]["latest_main_observed"])
        self.assertEqual(SYNC_ID, data["sheet_sync"]["current_tool_sync_id"])
        self.assertEqual("TASK8_ENTRY_OPEN_WITH_LOCAL_4_7_PATCH_VARIANCE", data["current_tool_sync_status"])
        self.assertEqual("PASS_V3_1_4_RECENT_EDITOR_BRIDGE", data["higodot"]["live_version_readback"])
        self.assertTrue(data["higodot"]["tracked_version_matches_live"])
        self.assertEqual("4.7.0", data["local_editor"]["observed_patch"])
        self.assertEqual("4.7.1", data["local_editor"]["ci_exact_baseline"])
        self.assertEqual("NONBLOCKING_FOR_TASK8_DEVELOPMENT", data["local_editor"]["disposition"])
        self.assertEqual("TASK8_GUT_RED_THEN_HIGODOT_MINIMUM_GREEN", data["entry_gate"]["next_action"])

    def test_human_canon_records_user_accepted_nonblocking_patch_variance(self) -> None:
        self.assertTrue(SYNC.is_file(), str(SYNC))
        text = "\n".join(path.read_text(encoding="utf-8") for path in (SYNC, CURRENT, UNRESOLVED))
        for token in (
            DECISION,
            SYNC_ID,
            "PASS_V3_1_4_RECENT_EDITOR_BRIDGE",
            "LOCAL_EDITOR_4_7_0_NONBLOCKING_FOR_TASK8",
            "CI_EXACT_4_7_1_REMAINS",
            "TASK8_GUT_RED",
        ):
            self.assertIn(token, text)


if __name__ == "__main__":
    unittest.main()
