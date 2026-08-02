from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PATH = ROOT / "skills/PROJECT_BASE_ADAPTER.json"
PAYLOAD = "7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8"
EVIDENCE = "da33a350d61b8adc52df97fccc7001708a933370"
FINALIZATION = "0b7c94f38d959efc0fc9442274c60b2e268a3c97"

data = json.loads(PATH.read_text(encoding="utf-8"))
data["base_release"].update({"version": "9.4.3", "release_commit": PAYLOAD, "release_evidence_commit": EVIDENCE, "finalization_commit": FINALIZATION})
contract = data.setdefault("base_v94_contract", {})
planning = contract.get("planning_first_grill_me")
if isinstance(planning, dict):
    planning["base_release_lock"] = "base-v9.4.3.lock.json"
    planning["base_release_finalization_commit"] = FINALIZATION
contract["first_prompt_governance"] = {
    "actual_project_instruction_execution": "NOT_RUN",
    "approval_reuse": "REUSE_EXACT_APPROVAL_REFERENCE",
    "base_contract_source": "skills/managing-project-intake-and-work-contract/SKILL.md",
    "base_release_finalization_commit": FINALIZATION,
    "base_release_lock": "base-v9.4.3.lock.json",
    "direction_anchor_reference": "skills/managing-project-intake-and-work-contract/references/first-prompt-direction-anchoring.md",
    "instruction_flow": ["route", "first-prompt", "contract", "clarify"],
    "l0_exceptions": ["TYPO", "OBVIOUS_FORMAT", "IDENTICAL_VALIDATION_RERUN"],
    "unconfirmed_state": "AWAITING_USER_CONFIRMATION"
}
data.setdefault("validation", {})["base_v943_first_prompt_adoption"] = "REQUIRED_ON_PULL_REQUEST"
PATH.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

# workflow trigger: canonical Adapter sync
