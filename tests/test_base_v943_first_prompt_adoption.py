from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADAPTER = ROOT / "skills/PROJECT_BASE_ADAPTER.json"
PAYLOAD = "7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8"
EVIDENCE = "da33a350d61b8adc52df97fccc7001708a933370"
FINALIZATION = "0b7c94f38d959efc0fc9442274c60b2e268a3c97"
REGISTRY = "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59"
SKILL = "managing-project-intake-and-work-contract"


def load() -> dict:
    return json.loads(ADAPTER.read_text(encoding="utf-8"))


def routes(data: dict) -> set[str]:
    found: set[str] = set()
    for route in data["routing"]["base_routes"]:
        if isinstance(route, str):
            found.add(route)
        elif route.get("status") == "ACTIVE":
            found.add(route["skill_id"])
    return found


class AdoptionTests(unittest.TestCase):
    def test_release_identity(self) -> None:
        data = load(); release = data["base_release"]
        self.assertEqual("9.4.3", release["version"])
        self.assertEqual(PAYLOAD, release["release_commit"])
        self.assertEqual(EVIDENCE, release["release_evidence_commit"])
        self.assertEqual(FINALIZATION, release["finalization_commit"])
        self.assertEqual(REGISTRY, release["registry_sha256"])

    def test_intake_route_and_adapter_only_policy(self) -> None:
        self.assertIn(SKILL, routes(load()))
        self.assertFalse((ROOT / "skills" / SKILL / "SKILL.md").exists())

    def test_first_prompt_gate(self) -> None:
        value = load()["base_v94_contract"]["first_prompt_governance"]
        self.assertEqual(["route", "first-prompt", "contract", "clarify"], value["instruction_flow"])
        self.assertEqual("AWAITING_USER_CONFIRMATION", value["unconfirmed_state"])
        self.assertEqual("REUSE_EXACT_APPROVAL_REFERENCE", value["approval_reuse"])
        self.assertEqual("base-v9.4.3.lock.json", value["base_release_lock"])
        self.assertEqual(FINALIZATION, value["base_release_finalization_commit"])
        self.assertEqual("NOT_RUN", value["actual_project_instruction_execution"])
        self.assertEqual("skills/managing-project-intake-and-work-contract/references/first-prompt-direction-anchoring.md", value["direction_anchor_reference"])

    def test_planning_and_project_boundaries_remain(self) -> None:
        data = load()
        self.assertIn("planning_first_grill_me", data["base_v94_contract"])
        self.assertTrue(data["protected_paths"])


if __name__ == "__main__": unittest.main()
