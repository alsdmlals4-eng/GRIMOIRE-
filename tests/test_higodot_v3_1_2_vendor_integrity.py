from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json"
CURRENT_DOCS = [ROOT / "START_HERE.md", ROOT / "docs/ACTIVE_CONTEXT.md", ROOT / "docs/DEVELOPMENT_GATES.md", ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md", ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"]
CANON = ROOT / "docs/planning/CANON_SYNC_STATE.json"
AUTHORITY = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"
OFFICIAL_COMMIT = "678b16a6a0a335cf80cbb7d3f85c183cd3e616de"
OFFICIAL_REPOSITORY_TREE = "646fb8365cc39de7b0a88e056cc03de7e7eb008a"
OFFICIAL_PLUGIN_WRAPPER_TREE = "e559376d95c12f67ae0117a23bcc1dd2519206c2"
PLUGIN_SUBTREE = "a7d1e2fe8564cc385d683ec50d15fc66e1a17a35"
RELEASE_ASSET_SHA256 = "60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33"
LICENSE_BLOB = "7806d2217ecf773ab83bb8a1ec0b2a81c3cc8546"
PASS_TOKEN = "PASS_EXACT_TREE_IDENTITY"
HERA_PASS = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"
SHARED_CORE_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
STALE_BLOCKER = "HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2"
STALE_HERA_BLOCKER = "HERA_CLI_ADDON_PAIR_UNVERIFIED"
DECISION = "GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01"
AUDIT_ID = "GR-AUD-TOOL-VENDOR-INTEGRITY-01"

class HiGodotV312VendorIntegrityTests(unittest.TestCase):
    def test_durable_evidence_records_exact_comparable_scope(self) -> None:
        self.assertTrue(EVIDENCE.is_file(), str(EVIDENCE))
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual("v3.1.2", data["release"])
        self.assertEqual(OFFICIAL_COMMIT, data["official_tag_commit"])
        self.assertEqual(OFFICIAL_REPOSITORY_TREE, data["official_repository_tree"])
        self.assertEqual(OFFICIAL_PLUGIN_WRAPPER_TREE, data["official_plugin_wrapper_tree"])
        self.assertEqual(PLUGIN_SUBTREE, data["official_plugin_subtree"])
        self.assertEqual(PLUGIN_SUBTREE, data["project_plugin_subtree"])
        self.assertEqual(RELEASE_ASSET_SHA256, data["release_asset_sha256_reported_by_github"])
        self.assertEqual(LICENSE_BLOB, data["official_license_blob"])
        self.assertEqual("MIT", data["license"])
        self.assertEqual("COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE", data["comparison_scope_rule"])
        self.assertEqual(PASS_TOKEN, data["result"])
        self.assertFalse(data["claims"]["release_archive_downloaded_and_rehashed_in_this_audit"])
        self.assertTrue(data["claims"]["git_subtree_identity_exact"])
        self.assertEqual(DECISION, data["decision_id"])
        self.assertEqual(AUDIT_ID, data["audit_id"])

    def test_current_canon_keeps_higodot_integrity_pass_and_current_task2_approval(self) -> None:
        for path in CURRENT_DOCS:
            text = path.read_text(encoding="utf-8")
            self.assertNotIn(STALE_BLOCKER, text, str(path))
            self.assertIn("higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY", text, str(path))
            self.assertIn(DECISION, text, str(path))
            self.assertIn("spell_workflow_task2_authorized: true", text, str(path))
            self.assertNotIn("spell_workflow_task2_authorized: false", text, str(path))

    def test_machine_state_records_exact_tree_identity_and_keeps_real_gates(self) -> None:
        canon = json.loads(CANON.read_text(encoding="utf-8"))
        authority = json.loads(AUTHORITY.read_text(encoding="utf-8"))
        self.assertEqual(PASS_TOKEN, canon["tool_authority"]["higodot"]["vendor_integrity"])
        self.assertEqual(PASS_TOKEN, authority["higodot"]["vendor_integrity"])
        self.assertEqual(PLUGIN_SUBTREE, authority["higodot"]["official_plugin_subtree_sha"])
        self.assertEqual(PLUGIN_SUBTREE, authority["higodot"]["project_vendor_tree_sha"])
        self.assertNotIn(STALE_BLOCKER, canon["broader_blockers"])
        self.assertNotIn(STALE_BLOCKER, authority["broader_blockers"])
        self.assertNotIn(STALE_HERA_BLOCKER, canon["broader_blockers"])
        self.assertNotIn(STALE_HERA_BLOCKER, authority["broader_blockers"])
        self.assertEqual(HERA_PASS, canon["hera"]["status"])
        self.assertEqual(HERA_PASS, authority["hera"]["status"])
        self.assertEqual(SHARED_CORE_PASS, canon["platform_validation"]["status"])
        self.assertEqual(SHARED_CORE_PASS, authority["platform_validation"]["status"])
        self.assertTrue(authority["claims"]["spell_workflow_task2_authorized"])
        self.assertTrue(canon["spell_workflow_main"]["spell_workflow_task2_authorized"])
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", canon["broader_blockers"])
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", authority["broader_blockers"])
        for blocker in ("AUDIO_VAULT_PATH_UNVERIFIED", "AUDIO_RIGHTS_UNVERIFIED", "VISUAL_AUDIO_COMPLETE_NOT_PROVEN", "LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS", "GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS"):
            self.assertIn(blocker, canon["broader_blockers"])
            self.assertIn(blocker, authority["broader_blockers"])

if __name__ == "__main__":
    unittest.main()
