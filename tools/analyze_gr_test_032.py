#!/usr/bin/env python3
"""Analyze GR-TEST-032 exploratory human/device results.

The analyzer requires source evidence hashes and matching record counts. It produces
PENDING_NOT_RUN/PROMISING/TUNE/REWORK/STOP only; it never authorizes merge,
runtime expansion, or a release-level human PASS.
"""
from __future__ import annotations
import argparse
import json
import re
import statistics
from copy import deepcopy
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

TEST_ID = "GR-TEST-032"
APPROVED_GLYPHS = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]
PARTICIPANT_ID = re.compile(r"^P0[1-6]$")
SHA256 = re.compile(r"^[0-9a-fA-F]{64}$")
FORBIDDEN_PII_KEYS = {"name", "full_name", "email", "phone", "account", "username", "address"}


def _reject_forbidden_keys(value: Any, path: str = "$") -> None:
    if isinstance(value, dict):
        for key, nested in value.items():
            if str(key).strip().lower() in FORBIDDEN_PII_KEYS:
                raise ValueError(f"forbidden personal identifier key at {path}.{key}")
            _reject_forbidden_keys(nested, f"{path}.{key}")
    elif isinstance(value, list):
        for index, nested in enumerate(value):
            _reject_forbidden_keys(nested, f"{path}[{index}]")


def _require_approved_scope(session: dict[str, Any]) -> None:
    if session.get("test_id") != TEST_ID:
        raise ValueError(f"test_id must be {TEST_ID}")
    if session.get("runtime_glyph_ids") != APPROVED_GLYPHS:
        raise ValueError("runtime_glyph_ids must match the exact approved runtime glyph set")


def _rate(numerator: int, denominator: int) -> float | None:
    return numerator / denominator if denominator > 0 else None


def _median(values: Any) -> float | None:
    if not isinstance(values, list) or not values:
        return None
    return float(statistics.median(float(value) for value in values))


def _pending_result(session: dict[str, Any]) -> dict[str, Any]:
    return {
        "schema_version": 2,
        "test_id": TEST_ID,
        "decision_id": "GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01",
        "status": "HUMAN_EXECUTION_NOT_RUN",
        "classification": "PENDING_NOT_RUN",
        "participant_count": len(session.get("participants", [])),
        "completed_participant_count": 0,
        "source_attempt_record_count": session.get("source_attempt_record_count"),
        "source_attempt_sha256": session.get("source_attempt_sha256"),
        "source_stage2_observation_count": session.get("source_stage2_observation_count"),
        "source_stage2_sha256": session.get("source_stage2_sha256"),
        "stage1": {"scored_attempt_count": 0, "first_attempt_correct_accept_rate": None,
                   "one_retry_inclusive_correct_rate": None, "semantic_identification_rate": None,
                   "accepted_false_count": 0, "stale_application_count": 0,
                   "mismatch_save_count": 0, "duplicate_save_count": 0,
                   "median_fatigue_12": None, "median_fatigue_24": None},
        "stage2": {"scenario_completion_count": 0,
                   "participants_explaining_intent_before_commit": 0,
                   "participants_selecting_explicit_source": 0,
                   "participants_explaining_consequence": 0,
                   "accidental_commit_count": 0, "duplicate_cost_or_result_count": 0,
                   "moderator_solution_prompt_count": 0,
                   "critical_accessibility_failure_count": 0},
        "hard_stop_count": 0, "hard_stop_events": [], "tune_findings": [],
        "rework_findings": [], "human_pass_claimed": False,
        "human_device_validation": "NOT_RUN", "human_end_to_end_core_loop": "NOT_RUN",
        "full_vertical_slice_representativeness": "NOT_RUN",
        "runtime_expansion_7_plus": "BLOCKED", "merge_authorized": False,
        "generated_from_artifact_sha": session.get("artifact_sha"),
        "generated_at": datetime.now(timezone.utc).isoformat(),
    }


def _validate_completed_session(session: dict[str, Any]) -> list[str]:
    participants = session.get("participants")
    if not isinstance(participants, list) or len(participants) != 6:
        raise ValueError("completed session requires exactly 6 participant IDs")
    if len(set(participants)) != len(participants):
        raise ValueError("participant IDs must be unique")
    invalid = [p for p in participants if not PARTICIPANT_ID.fullmatch(str(p))]
    if invalid:
        raise ValueError(f"invalid anonymous participant IDs: {invalid}")
    artifact_sha = session.get("artifact_sha")
    if not isinstance(artifact_sha, str) or not re.fullmatch(r"[0-9a-fA-F]{40}", artifact_sha):
        raise ValueError("completed session requires a 40-character artifact_sha")
    if not isinstance(session.get("stage1"), dict) or not isinstance(session.get("stage2"), dict):
        raise ValueError("completed session requires stage1 and stage2 objects")
    return [str(p) for p in participants]


def _require_sha256(session: dict[str, Any], key: str) -> str:
    value = session.get(key)
    if not isinstance(value, str) or not SHA256.fullmatch(value):
        raise ValueError(f"completed session requires valid {key}")
    return value.lower()


def _bounded_count(value: Any, label: str, maximum: int) -> int:
    count = int(value or 0)
    if count < 0 or count > maximum:
        raise ValueError(f"{label} must be within 0..{maximum}")
    return count


def _hard_stop_count(stage1: dict[str, Any], stage2: dict[str, Any], events: Any) -> int:
    metric_count = sum(max(0, int(v or 0)) for v in (
        stage1.get("accepted_false_count", 0), stage1.get("stale_application_count", 0),
        stage1.get("mismatch_save_count", 0), stage1.get("duplicate_save_count", 0),
        stage2.get("accidental_commit_count", 0), stage2.get("duplicate_cost_or_result_count", 0),
        stage2.get("moderator_solution_prompt_count", 0),
        stage2.get("critical_accessibility_failure_count", 0)))
    return max(metric_count, len(events) if isinstance(events, list) else 0)


def analyze(session: dict[str, Any]) -> dict[str, Any]:
    if not isinstance(session, dict):
        raise ValueError("session must be a JSON object")
    _reject_forbidden_keys(session)
    _require_approved_scope(session)
    if session.get("status") != "HUMAN_EXECUTION_COMPLETED":
        return _pending_result(session)

    participants = _validate_completed_session(session)
    stage1 = deepcopy(session["stage1"]); stage2 = deepcopy(session["stage2"])
    attempts = int(stage1.get("scored_attempt_count", 0) or 0)
    if attempts <= 0:
        raise ValueError("completed session requires scored_attempt_count > 0")
    source_attempt_count = int(session.get("source_attempt_record_count", -1))
    if source_attempt_count != attempts:
        raise ValueError("source attempt record count must match scored_attempt_count")
    source_attempt_sha = _require_sha256(session, "source_attempt_sha256")

    first_count = _bounded_count(stage1.get("first_attempt_correct_accept_count"), "stage1 counts", attempts)
    retry_count = _bounded_count(stage1.get("one_retry_inclusive_correct_count"), "stage1 counts", attempts)
    semantic_count = _bounded_count(stage1.get("semantic_identification_correct_count"), "stage1 counts", attempts)
    for key in ("accepted_false_count", "stale_application_count", "mismatch_save_count", "duplicate_save_count"):
        _bounded_count(stage1.get(key), "stage1 counts", attempts)

    scenario_count = _bounded_count(stage2.get("scenario_completion_count"), "stage2 scenario count", 12)
    source_stage2_count = int(session.get("source_stage2_observation_count", -1))
    if source_stage2_count != scenario_count:
        raise ValueError("stage2 observation count must match scenario_completion_count")
    source_stage2_sha = _require_sha256(session, "source_stage2_sha256")
    intent_count = _bounded_count(stage2.get("participants_explaining_intent_before_commit"), "stage2 participant count", 6)
    source_count = _bounded_count(stage2.get("participants_selecting_explicit_source"), "stage2 participant count", 6)
    consequence_count = _bounded_count(stage2.get("participants_explaining_consequence"), "stage2 participant count", 6)
    for key in ("accidental_commit_count", "duplicate_cost_or_result_count",
                "moderator_solution_prompt_count", "critical_accessibility_failure_count"):
        _bounded_count(stage2.get(key), "stage2 hard-stop count", 12)

    first_rate = _rate(first_count, attempts); retry_rate = _rate(retry_count, attempts)
    semantic_rate = _rate(semantic_count, attempts)
    fatigue_12 = _median(stage1.get("fatigue_12")); fatigue_24 = _median(stage1.get("fatigue_24"))
    events = deepcopy(session.get("hard_stop_events", [])); hard_stops = _hard_stop_count(stage1, stage2, events)
    tune_findings: list[str] = []; rework_findings: list[str] = []
    if first_rate is None or first_rate < 0.80: tune_findings.append("FIRST_ATTEMPT_CORRECT_ACCEPT_BELOW_TEST_VALUE_0_80")
    if retry_rate is None or retry_rate < 0.95: tune_findings.append("ONE_RETRY_INCLUSIVE_CORRECT_BELOW_TEST_VALUE_0_95")
    if semantic_rate is None or semantic_rate < 0.90: tune_findings.append("SEMANTIC_IDENTIFICATION_BELOW_TEST_VALUE_0_90")
    if fatigue_24 is None or fatigue_24 > 3.0: tune_findings.append("MEDIAN_FATIGUE_24_ABOVE_TEST_VALUE_3")
    if intent_count < 5: tune_findings.append("INTENT_EXPLANATION_BELOW_TEST_VALUE_5_OF_6")
    if source_count < 5: tune_findings.append("EXPLICIT_SOURCE_SELECTION_BELOW_TEST_VALUE_5_OF_6")
    if consequence_count < 5: tune_findings.append("CONSEQUENCE_EXPLANATION_BELOW_TEST_VALUE_5_OF_6")
    if scenario_count < 12: tune_findings.append("SCENARIO_COMPLETION_BELOW_PLANNED_12")
    if min(intent_count, source_count, consequence_count) <= 2: rework_findings.append("CORE_LOOP_COMPREHENSION_STRUCTURAL_FAILURE")
    if scenario_count < 6: rework_findings.append("MOST_STAGE2_SCENARIOS_INCOMPLETE")
    classification = "STOP" if hard_stops else "REWORK" if rework_findings else "TUNE" if tune_findings else "PROMISING"

    return {
        "schema_version": 2, "test_id": TEST_ID,
        "decision_id": "GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01",
        "status": "HUMAN_EXECUTION_ANALYZED_EXPLORATORY", "classification": classification,
        "participant_count": len(participants), "completed_participant_count": len(participants),
        "source_attempt_record_count": source_attempt_count, "source_attempt_sha256": source_attempt_sha,
        "source_stage2_observation_count": source_stage2_count, "source_stage2_sha256": source_stage2_sha,
        "stage1": {"scored_attempt_count": attempts,
                   "first_attempt_correct_accept_rate": first_rate,
                   "one_retry_inclusive_correct_rate": retry_rate,
                   "semantic_identification_rate": semantic_rate,
                   "accepted_false_count": int(stage1.get("accepted_false_count", 0) or 0),
                   "stale_application_count": int(stage1.get("stale_application_count", 0) or 0),
                   "mismatch_save_count": int(stage1.get("mismatch_save_count", 0) or 0),
                   "duplicate_save_count": int(stage1.get("duplicate_save_count", 0) or 0),
                   "median_fatigue_12": fatigue_12, "median_fatigue_24": fatigue_24},
        "stage2": {"scenario_completion_count": scenario_count,
                   "participants_explaining_intent_before_commit": intent_count,
                   "participants_selecting_explicit_source": source_count,
                   "participants_explaining_consequence": consequence_count,
                   "accidental_commit_count": int(stage2.get("accidental_commit_count", 0) or 0),
                   "duplicate_cost_or_result_count": int(stage2.get("duplicate_cost_or_result_count", 0) or 0),
                   "moderator_solution_prompt_count": int(stage2.get("moderator_solution_prompt_count", 0) or 0),
                   "critical_accessibility_failure_count": int(stage2.get("critical_accessibility_failure_count", 0) or 0)},
        "hard_stop_count": hard_stops, "hard_stop_events": events,
        "tune_findings": tune_findings, "rework_findings": rework_findings,
        "human_pass_claimed": False,
        "human_device_validation": "COMPLETED_EXPLORATORY_REVIEW_REQUIRED",
        "human_end_to_end_core_loop": "COMPLETED_EXPLORATORY_REVIEW_REQUIRED",
        "full_vertical_slice_representativeness": "NOT_RUN",
        "runtime_expansion_7_plus": "BLOCKED", "merge_authorized": False,
        "generated_from_artifact_sha": session.get("artifact_sha"),
        "generated_at": datetime.now(timezone.utc).isoformat(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path); parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    try:
        result = analyze(json.loads(args.input.read_text(encoding="utf-8")))
    except (OSError, json.JSONDecodeError, ValueError, TypeError) as error:
        parser.error(str(error))
    payload = json.dumps(result, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True); args.output.write_text(payload, encoding="utf-8")
    else: print(payload, end="")
    return 0

if __name__ == "__main__": raise SystemExit(main())
