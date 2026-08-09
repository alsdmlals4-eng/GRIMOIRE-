from __future__ import annotations

import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
WORKFLOW_DIR = ROOT / ".github/workflows"
CHECKOUT_SHAS = {
    "11d5960a326750d5838078e36cf38b85af677262",
    "11bd71901bbe5b1630ceea73d27597364c9af683",
}
SETUP_PYTHON_SHAS = {
    "a26af69be951a213d495a4c3e4e4022e16d87065",
}
UPLOAD_ARTIFACT_SHAS = {
    "ea165f8d65b6e75b540449e92b4886f43607fa02",
}
APPROVED_ACTION_SHAS = {
    "actions/checkout": CHECKOUT_SHAS,
    "actions/setup-python": SETUP_PYTHON_SHAS,
    "actions/upload-artifact": UPLOAD_ARTIFACT_SHAS,
}
USES_ACTION = re.compile(r"^\s*-?\s*uses:\s+(actions/[A-Za-z0-9_.-]+)@([^\s#]+)", re.MULTILINE)
FULL_SHA = re.compile(r"^[0-9a-f]{40}$")


def workflows() -> list[Path]:
    return sorted({*WORKFLOW_DIR.glob("*.yml"), *WORKFLOW_DIR.glob("*.yaml")})


class V44CiSupplyChainTests(unittest.TestCase):
    def test_all_active_official_actions_are_full_sha_pinned(self) -> None:
        files = workflows()
        self.assertTrue(files, "no GitHub Actions workflows found")
        seen = 0
        for workflow in files:
            text = workflow.read_text(encoding="utf-8")
            self.assertNotIn("pull_request_target:", text, str(workflow))
            for action, ref in USES_ACTION.findall(text):
                seen += 1
                self.assertRegex(ref, FULL_SHA, f"{workflow}: mutable or non-SHA ref {action}@{ref}")
                if action in APPROVED_ACTION_SHAS:
                    self.assertIn(ref, APPROVED_ACTION_SHAS[action], f"{workflow}: unverified pin {action}@{ref}")
        self.assertGreater(seen, 0, "no actions/* references found")

    def test_verified_current_action_pins_remain_registered(self) -> None:
        self.assertIn("11d5960a326750d5838078e36cf38b85af677262", CHECKOUT_SHAS)
        self.assertEqual({"a26af69be951a213d495a4c3e4e4022e16d87065"}, SETUP_PYTHON_SHAS)
        self.assertEqual({"ea165f8d65b6e75b540449e92b4886f43607fa02"}, UPLOAD_ARTIFACT_SHAS)

    def test_gut_authority_workflows_keep_minimum_permissions(self) -> None:
        for name in (
            "validate-gut-formal-adoption.yml",
            "validate-godot-authoring-gut-authority.yml",
        ):
            text = (WORKFLOW_DIR / name).read_text(encoding="utf-8")
            self.assertIn("permissions:\n  contents: read", text, name)
            self.assertNotIn("pull_request_target:", text, name)


if __name__ == "__main__":
    unittest.main()
