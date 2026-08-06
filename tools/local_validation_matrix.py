from __future__ import annotations

import argparse
import datetime as dt
import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any, Mapping, Sequence


DECISION_ID = "GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01"
EXPECTED_LANE_IDS = (
    "windows-py311",
    "windows-py312",
    "windows-py313",
    "wsl-ubuntu-py312",
)


@dataclass(frozen=True)
class LaneSpec:
    lane_id: str
    expected_system: str
    python_version: str
    runtime: bool


def default_lane_specs() -> tuple[LaneSpec, ...]:
    return (
        LaneSpec("windows-py311", "Windows", "3.11", False),
        LaneSpec("windows-py312", "Windows", "3.12", True),
        LaneSpec("windows-py313", "Windows", "3.13", False),
        LaneSpec("wsl-ubuntu-py312", "Linux", "3.12", True),
    )


def _failure_list_for_lane(
    spec: LaneSpec,
    manifest: Mapping[str, Any],
    *,
    expected_head: str,
    base_sha: str,
) -> list[str]:
    failures: list[str] = []
    prefix = spec.lane_id

    if manifest.get("lane_id") != spec.lane_id:
        failures.append(f"LANE_ID_MISMATCH:{prefix}")
    if manifest.get("expected_head") != expected_head or manifest.get("actual_head") != expected_head:
        failures.append(f"HEAD_MISMATCH:{prefix}")
    if manifest.get("base_sha") != base_sha:
        failures.append(f"BASE_SHA_MISMATCH:{prefix}")

    host = manifest.get("host")
    actual_system = host.get("system") if isinstance(host, Mapping) else None
    if actual_system != spec.expected_system:
        failures.append(f"HOST_MISMATCH:{prefix}")

    python = manifest.get("python")
    actual_python = python.get("major_minor") if isinstance(python, Mapping) else None
    implementation = python.get("implementation") if isinstance(python, Mapping) else None
    if actual_python != spec.python_version:
        failures.append(f"PYTHON_VERSION_MISMATCH:{prefix}")
    if implementation != "CPython":
        failures.append(f"PYTHON_IMPLEMENTATION_MISMATCH:{prefix}")

    if manifest.get("result") != "PASS":
        failures.append(f"LANE_NOT_PASS:{prefix}")

    return failures


def aggregate_lane_manifests(
    *,
    expected_head: str,
    base_sha: str,
    pull_request: int,
    manifests: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    specs = default_lane_specs()
    failures: list[str] = []
    lanes: list[dict[str, Any]] = []

    unexpected = sorted(set(manifests) - set(EXPECTED_LANE_IDS))
    failures.extend(f"UNEXPECTED_LANE:{lane_id}" for lane_id in unexpected)

    for spec in specs:
        manifest = manifests.get(spec.lane_id)
        if manifest is None:
            failures.append(f"MISSING_LANE:{spec.lane_id}")
            lanes.append(
                {
                    "spec": asdict(spec),
                    "manifest": None,
                    "failures": [f"MISSING_LANE:{spec.lane_id}"],
                }
            )
            continue

        lane_failures = _failure_list_for_lane(
            spec,
            manifest,
            expected_head=expected_head,
            base_sha=base_sha,
        )
        failures.extend(lane_failures)
        lanes.append(
            {
                "spec": asdict(spec),
                "manifest": dict(manifest),
                "failures": lane_failures,
            }
        )

    return {
        "schema_version": 1,
        "decision_id": DECISION_ID,
        "repository": "alsdmlals4-eng/GRIMOIRE-",
        "pull_request": pull_request,
        "expected_head": expected_head,
        "base_sha": base_sha,
        "generated_at": dt.datetime.now(dt.timezone.utc).isoformat(),
        "expected_lane_ids": list(EXPECTED_LANE_IDS),
        "lanes": lanes,
        "failures": failures,
        "result": "PASS" if not failures else "FAIL",
        "github_actions": "NOT_RUN_BUDGET_BLOCKED",
    }


def load_lane_assignments(assignments: Sequence[str]) -> dict[str, Mapping[str, Any]]:
    manifests: dict[str, Mapping[str, Any]] = {}
    for assignment in assignments:
        if "=" not in assignment:
            raise ValueError(f"lane assignment must be LANE_ID=PATH: {assignment!r}")
        lane_id, raw_path = assignment.split("=", 1)
        lane_id = lane_id.strip()
        if not lane_id or lane_id in manifests:
            raise ValueError(f"duplicate or empty lane id: {lane_id!r}")
        path = Path(raw_path).resolve()
        payload = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(payload, Mapping):
            raise ValueError(f"lane manifest must be a JSON object: {path}")
        manifests[lane_id] = payload
    return manifests


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Aggregate GRIMOIRE local validation matrix evidence.")
    parser.add_argument("--expected-head", required=True)
    parser.add_argument("--base-sha", required=True)
    parser.add_argument("--pull-request", required=True, type=int)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--lane", action="append", default=[])
    args = parser.parse_args(argv)

    try:
        manifests = load_lane_assignments(args.lane)
        result = aggregate_lane_manifests(
            expected_head=args.expected_head,
            base_sha=args.base_sha,
            pull_request=args.pull_request,
            manifests=manifests,
        )
    except Exception as exc:
        result = {
            "schema_version": 1,
            "decision_id": DECISION_ID,
            "repository": "alsdmlals4-eng/GRIMOIRE-",
            "pull_request": args.pull_request,
            "expected_head": args.expected_head,
            "base_sha": args.base_sha,
            "generated_at": dt.datetime.now(dt.timezone.utc).isoformat(),
            "expected_lane_ids": list(EXPECTED_LANE_IDS),
            "lanes": [],
            "failures": [f"AGGREGATION_ERROR:{exc}"],
            "result": "FAIL",
            "github_actions": "NOT_RUN_BUDGET_BLOCKED",
        }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(args.output)
    return 0 if result["result"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
