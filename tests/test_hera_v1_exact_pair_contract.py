from __future__ import annotations

import json
import re
import subprocess
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/validation/HERA_V1_0_0_EXACT_PAIR.json"
WORKFLOW = ROOT / ".github/workflows/validate-hera-v1-pair.yml"
ADDON_TREE = "6cb87ac8ba768de1d924447f385fba6d80bcde68"
UPSTREAM_TAG_COMMIT = "10f245ddae9e7a5d569150302acbde0d78f2aa03"
LINUX_CLI_SHA256 = "384d93652ade67f0a2c975e152521760d3bf32f8770edd4b9ee382ea98bcab8a"
ADDON_ZIP_SHA256 = "0a71000f0c4192043e72e9b18f4de3bac720035d9d7c95c9634648a7b5c54d9f"
WINDOWS_CLI_SHA256 = "9ae181741c2e8a3f57bbb2a2e4c61ac2c9c7c844fad21c88ae3890c55a5cc66b"
PASS_TOKEN = "HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS"


class HeraV1ExactPairContractTests(unittest.TestCase):
    def test_project_addon_is_exact_upstream_v1_tree(self) -> None:
        tree = subprocess.check_output(
            ["git", "rev-parse", "HEAD:addons/hera_agent_godot"],
            cwd=ROOT,
            text=True,
        ).strip()
        self.assertEqual(ADDON_TREE, tree)
        plugin = (ROOT / "addons/hera_agent_godot/plugin.cfg").read_text(encoding="utf-8")
        self.assertIn('version="1.0.0"', plugin)

    def test_durable_pair_evidence_is_pinned_to_one_release(self) -> None:
        self.assertTrue(EVIDENCE.is_file(), str(EVIDENCE))
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual("v1.0.0", data["release"])
        self.assertEqual(UPSTREAM_TAG_COMMIT, data["upstream_tag_commit"])
        self.assertEqual(ADDON_TREE, data["upstream_addon_tree"])
        self.assertEqual(ADDON_TREE, data["project_addon_tree"])
        self.assertEqual(LINUX_CLI_SHA256, data["release_assets"]["linux_amd64_sha256"])
        self.assertEqual(WINDOWS_CLI_SHA256, data["release_assets"]["windows_amd64_sha256"])
        self.assertEqual(ADDON_ZIP_SHA256, data["release_assets"]["addon_zip_sha256"])
        self.assertEqual("CLI_AND_ADDON_SHIP_AND_VERSION_TOGETHER", data["pairing_contract"])
        self.assertEqual(PASS_TOKEN, data["live_canary"]["status"])
        self.assertTrue(data["claims"]["live_cli_addon_pair_pass"])
        self.assertTrue(data["claims"]["acceptance_qa_authorized"])
        self.assertFalse(data["claims"]["persistent_project_source_mutation_allowed_to_hera"])
        self.assertFalse(data["claims"]["spell_workflow_task2_authorized"])

    def test_live_canary_workflow_is_fail_closed_and_read_only_to_repo(self) -> None:
        self.assertTrue(WORKFLOW.is_file(), str(WORKFLOW))
        text = WORKFLOW.read_text(encoding="utf-8")
        for token in (
            "HERA_AGENT_GODOT_TOKEN",
            "hera-linux-amd64.tar.gz",
            LINUX_CLI_SHA256,
            '"$HERA_BIN" version',
            "127.0.0.1",
            "unauthorized",
            '"$HERA_BIN" status',
            "git diff --exit-code",
            "git status --porcelain",
            "addons/hera_agent_godot",
            "--editor",
            "--headless",
        ):
            self.assertIn(token, text)
        self.assertNotIn("pull_request_target:", text)
        uses_refs = re.findall(r"uses:\s+actions/[^@\s]+@([^\s#]+)", text)
        self.assertTrue(uses_refs)
        for ref in uses_refs:
            self.assertRegex(ref, r"^[0-9a-f]{40}$")


if __name__ == "__main__":
    unittest.main()
