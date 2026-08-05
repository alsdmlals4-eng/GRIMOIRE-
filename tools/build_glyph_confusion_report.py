from __future__ import annotations

import argparse
import json
import statistics
import sys
from pathlib import Path
from typing import Any

GLYPH_IDS = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]
DECISION_ID = "GM-GLYPH-VOCABULARY-V1-01"
RETRY_STATUSES = {
    "LOW_CONFIDENCE_REQUIRES_RETRY",
    "AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION",
    "NO_VALID_INPUT",
}
ACCEPT_STATUSES = {"CANDIDATE_READY", "ACCEPTED", "VAULT_GLYPH_CREATED"}


def _load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError(f"could not read JSON from {path}: {exc}") from exc


def _number(value: Any, field: str) -> float:
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        raise ValueError(f"{field} must be numeric")
    return float(value)


def _validate_thresholds(rows: list[dict[str, Any]], prereg: dict[str, Any]) -> tuple[float, float]:
    if prereg.get("decision_id") != DECISION_ID:
        raise ValueError("threshold preregistration decision_id mismatch")
    if prereg.get("evidence_scope") != "SYNTHETIC_FIXTURES_ONLY":
        raise ValueError("threshold preregistration evidence scope mismatch")
    confidence = _number(prereg.get("confidence_threshold"), "confidence_threshold")
    margin = _number(prereg.get("margin_threshold"), "margin_threshold")
    if not 0.0 <= confidence <= 1.0 or not 0.0 <= margin <= 1.0:
        raise ValueError("threshold values must be within 0..1")
    for index, row in enumerate(rows):
        row_confidence = _number(row.get("confidence_threshold"), f"rows[{index}].confidence_threshold")
        row_margin = _number(row.get("margin_threshold"), f"rows[{index}].margin_threshold")
        if abs(row_confidence - confidence) > 1e-9 or abs(row_margin - margin) > 1e-9:
            raise ValueError(f"threshold mismatch in fixture row {index}")
    return confidence, margin


def build_report(rows: list[dict[str, Any]], prereg: dict[str, Any]) -> dict[str, Any]:
    if not isinstance(rows, list) or not all(isinstance(row, dict) for row in rows):
        raise ValueError("fixture rows must be a list of objects")
    confidence, margin = _validate_thresholds(rows, prereg)

    matrix = {
        expected: {predicted: 0 for predicted in GLYPH_IDS}
        for expected in GLYPH_IDS
    }
    known_rows = 0
    correct_first_attempt = 0
    false_accept_count = 0
    false_reject_count = 0
    retry_required_count = 0
    elapsed_values: list[int] = []

    for index, row in enumerate(rows):
        expected = row.get("expected")
        predicted = row.get("predicted")
        status = str(row.get("status", ""))
        elapsed = row.get("elapsed_us")
        if elapsed is not None:
            elapsed_number = _number(elapsed, f"rows[{index}].elapsed_us")
            if elapsed_number < 0:
                raise ValueError("elapsed_us must be non-negative")
            elapsed_values.append(int(round(elapsed_number)))

        expected_known = expected in GLYPH_IDS
        predicted_known = predicted in GLYPH_IDS
        if expected_known:
            known_rows += 1
        if expected_known and predicted_known:
            matrix[str(expected)][str(predicted)] += 1
        if expected_known and predicted == expected and status in ACCEPT_STATUSES:
            correct_first_attempt += 1
        if status in RETRY_STATUSES:
            retry_required_count += 1
            if expected_known:
                false_reject_count += 1
        if predicted_known and status in ACCEPT_STATUSES and predicted != expected:
            false_accept_count += 1

    first_attempt_rate = 0.0 if known_rows == 0 else correct_first_attempt / known_rows
    median_us = 0 if not elapsed_values else int(round(statistics.median(elapsed_values)))
    return {
        "schema_version": 1,
        "decision_id": DECISION_ID,
        "glyph_ids": GLYPH_IDS,
        "confidence_threshold": confidence,
        "margin_threshold": margin,
        "confusion_matrix": matrix,
        "fixture_first_attempt_match_rate": round(first_attempt_rate, 6),
        "false_accept_count": false_accept_count,
        "false_reject_count": false_reject_count,
        "retry_required_count": retry_required_count,
        "median_recognition_us": median_us,
        "evidence_scope": "SYNTHETIC_FIXTURES_ONLY",
        "human_comprehension": "NOT_RUN",
        "physical_touch": "NOT_RUN",
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Build the synthetic six-glyph confusion report.")
    parser.add_argument("rows", type=Path)
    parser.add_argument("--thresholds", type=Path, required=True)
    args = parser.parse_args(argv)
    try:
        rows = _load_json(args.rows)
        prereg = _load_json(args.thresholds)
        report = build_report(rows, prereg)
    except ValueError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1
    print(json.dumps(report, ensure_ascii=False, indent=2, sort_keys=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
