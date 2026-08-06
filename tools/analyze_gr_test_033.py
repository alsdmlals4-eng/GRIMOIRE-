from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path
from typing import Any

GATE_ID = "GR-TEST-033"
LAYOUT = "FIVE_POINT_STAR"
STOCK_SCOPE = "TYPED_GLYPH_ONLY"
CLASSIFICATIONS = {"PENDING_NOT_RUN", "PROMISING", "TUNE", "REWORK", "STOP"}

FORBIDDEN_KEYS = {
    "name",
    "real_name",
    "email",
    "phone",
    "phone_number",
    "address",
    "birthdate",
    "birthday",
    "resident_registration_number",
}
EMAIL_PATTERN = re.compile(r"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b", re.IGNORECASE)
KOREAN_MOBILE_PATTERN = re.compile(r"(?<!\d)01[016789][\s-]?\d{3,4}[\s-]?\d{4}(?!\d)")

HARD_STOP_KEYS = (
    "ACCIDENTAL_COMMIT",
    "MUTATION_BEFORE_COMMIT",
    "DUPLICATE_COST_OR_RESULT",
    "CROSS_GLYPH_STOCK_SUBSTITUTION",
    "HIDDEN_EXTRA_MANA",
    "RANDOM_UNPREVIEWED_TARGET",
    "CRITICAL_SCREEN_READER_BLOCKER",
    "MODERATOR_SOLUTION_PROMPT",
    "PII_PRESENT",
)


def canonical_sha256(records: list[Any]) -> str:
    payload = json.dumps(records, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def _contains_pii(value: Any) -> bool:
    if isinstance(value, dict):
        for key, nested in value.items():
            if str(key).lower() in FORBIDDEN_KEYS:
                return True
            if _contains_pii(nested):
                return True
        return False
    if isinstance(value, list):
        return any(_contains_pii(item) for item in value)
    if isinstance(value, str):
        return bool(EMAIL_PATTERN.search(value) or KOREAN_MOBILE_PATTERN.search(value))
    return False


def build_session_for_records(attempts: dict[str, Any], observations: dict[str, Any]) -> dict[str, Any]:
    attempt_records = list(attempts.get("records", []))
    observation_records = list(observations.get("records", []))
    return {
        "schema_version": 1,
        "gate_id": GATE_ID,
        "execution_status": "NOT_RUN",
        "runtime_contract": {
            "layout": LAYOUT,
            "main_glyph": "EXACTLY_1_CENTER",
            "auxiliary_glyphs": "0_TO_5_EQUIVALENT_VERTICES",
            "target_selection": "AFTER_CIRCUIT_PREVIEW_BY_KEYWORD",
            "stock_scope": STOCK_SCOPE,
        },
        "source_attempt_sha256": canonical_sha256(attempt_records),
        "source_attempt_record_count": len(attempt_records),
        "source_observation_sha256": canonical_sha256(observation_records),
        "source_observation_record_count": len(observation_records),
        "hard_stops": {key: 0 for key in HARD_STOP_KEYS},
        "candidate_thresholds_test_value": {
            "promising_task_completion_rate": 0.8,
            "promising_preview_comprehension_rate": 0.8,
            "promising_result_cause_explanation_rate": 0.75,
            "tune_minimum_rate": 0.6,
        },
        "human_pass_claimed": False,
        "release_ready_claimed": False,
        "full_vertical_slice_claimed": False,
    }


def validate_payloads(
    session: dict[str, Any], attempts: dict[str, Any], observations: dict[str, Any]
) -> list[str]:
    errors: list[str] = []
    attempt_records = attempts.get("records")
    observation_records = observations.get("records")
    if not isinstance(attempt_records, list):
        errors.append("ATTEMPT_RECORDS_REQUIRED")
        attempt_records = []
    if not isinstance(observation_records, list):
        errors.append("OBSERVATION_RECORDS_REQUIRED")
        observation_records = []

    if session.get("gate_id") != GATE_ID:
        errors.append("GATE_ID_MISMATCH")
    runtime = session.get("runtime_contract", {})
    if runtime.get("layout") != LAYOUT:
        errors.append("RUNTIME_LAYOUT_MISMATCH")
    if runtime.get("stock_scope") != STOCK_SCOPE:
        errors.append("STOCK_SCOPE_MISMATCH")

    if session.get("source_attempt_sha256") != canonical_sha256(attempt_records):
        errors.append("SOURCE_ATTEMPT_SHA256_MISMATCH")
    if session.get("source_attempt_record_count") != len(attempt_records):
        errors.append("SOURCE_ATTEMPT_RECORD_COUNT_MISMATCH")
    if session.get("source_observation_sha256") != canonical_sha256(observation_records):
        errors.append("SOURCE_OBSERVATION_SHA256_MISMATCH")
    if session.get("source_observation_record_count") != len(observation_records):
        errors.append("SOURCE_OBSERVATION_RECORD_COUNT_MISMATCH")

    if _contains_pii(session) or _contains_pii(attempts) or _contains_pii(observations):
        errors.append("PII_VALUE_DETECTED")

    for claim in ("human_pass_claimed", "release_ready_claimed", "full_vertical_slice_claimed"):
        if session.get(claim) is not False:
            errors.append(f"{claim.upper()}_MUST_BE_FALSE")

    return sorted(set(errors))


def _rate(records: list[dict[str, Any]], key: str) -> float:
    if not records:
        return 0.0
    return sum(1 for record in records if record.get(key) is True) / len(records)


def analyze(
    session: dict[str, Any], attempts: dict[str, Any], observations: dict[str, Any]
) -> dict[str, Any]:
    errors = validate_payloads(session, attempts, observations)
    hard_stops = session.get("hard_stops", {})
    triggered = sorted(key for key in HARD_STOP_KEYS if int(hard_stops.get(key, 0) or 0) > 0)
    observation_records = [record for record in observations.get("records", []) if isinstance(record, dict)]
    critical_accessibility = sum(
        1 for record in observation_records if record.get("critical_accessibility_failure") is True
    )
    if critical_accessibility > 0 and "CRITICAL_SCREEN_READER_BLOCKER" not in triggered:
        triggered.append("CRITICAL_SCREEN_READER_BLOCKER")
        triggered.sort()

    attempt_records = [record for record in attempts.get("records", []) if isinstance(record, dict)]
    first_attempts = [record for record in attempt_records if record.get("attempt_phase") == "FIRST_ATTEMPT"]
    if not first_attempts:
        first_attempts = attempt_records

    completion_rate = _rate(first_attempts, "task_completed")
    preview_rate = _rate(first_attempts, "preview_understood")
    cause_rate = _rate(first_attempts, "result_cause_explained")

    if errors or triggered:
        classification = "STOP"
    elif session.get("execution_status") != "COMPLETE":
        classification = "PENDING_NOT_RUN"
    else:
        thresholds = session.get("candidate_thresholds_test_value", {})
        promising = (
            completion_rate >= float(thresholds.get("promising_task_completion_rate", 0.8))
            and preview_rate >= float(thresholds.get("promising_preview_comprehension_rate", 0.8))
            and cause_rate >= float(thresholds.get("promising_result_cause_explanation_rate", 0.75))
        )
        tune_min = float(thresholds.get("tune_minimum_rate", 0.6))
        if promising:
            classification = "PROMISING"
        elif min(completion_rate, preview_rate, cause_rate) >= tune_min:
            classification = "TUNE"
        else:
            classification = "REWORK"

    if classification not in CLASSIFICATIONS:
        raise RuntimeError(f"invalid classification: {classification}")

    return {
        "schema_version": 1,
        "gate_id": GATE_ID,
        "classification": classification,
        "errors": errors,
        "metrics": {
            "first_attempt_count": len(first_attempts),
            "task_completion_rate": round(completion_rate, 4),
            "preview_comprehension_rate": round(preview_rate, 4),
            "result_cause_explanation_rate": round(cause_rate, 4),
            "critical_accessibility_failures": critical_accessibility,
        },
        "hard_stops_triggered": triggered,
        "human_pass_claimed": False,
        "release_ready_claimed": False,
        "full_vertical_slice_claimed": False,
        "runtime_expansion_authorized": False,
    }


def _load(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        payload = json.load(handle)
    if not isinstance(payload, dict):
        raise ValueError(f"JSON object required: {path}")
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate and classify GR-TEST-033 evidence")
    parser.add_argument("--session", type=Path, required=True)
    parser.add_argument("--attempts", type=Path, required=True)
    parser.add_argument("--observations", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    result = analyze(_load(args.session), _load(args.attempts), _load(args.observations))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return 0 if result["classification"] != "STOP" else 2


if __name__ == "__main__":
    raise SystemExit(main())
