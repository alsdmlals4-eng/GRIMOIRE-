from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from tools.local_validation_matrix import (
    EXPECTED_LANE_IDS,
    aggregate_lane_manifests,
    default_lane_specs,
)


class LocalValidationMatrixTests(unittest.TestCase):
    def test_default_matrix_has_exact_windows_and_wsl_lanes(self) -> None:
        specs = default_lane_specs()
        self.assertEqual(EXPECTED_LANE_IDS, tuple(spec.lane_id for spec in specs))
        self.assertEqual(
            ("3.11", "3.12", "3.13", "3.12"),
            tuple(spec.python_version for spec in specs),
        )
        self.assertEqual(
            ("Windows", "Windows", "Windows", "Linux"),
            tuple(spec.expected_system for spec in specs),
        )
        self.assertEqual((False, True, False, True), tuple(spec.runtime for spec in specs))

    def test_aggregate_passes_only_when_all_exact_lanes_pass(self) -> None:
        expected_head = "a" * 40
        base_sha = "b" * 40
        manifests = {
            spec.lane_id: {
                "lane_id": spec.lane_id,
                "expected_head": expected_head,
                "actual_head": expected_head,
                "base_sha": base_sha,
                "host": {"system": spec.expected_system},
                "python": {
                    "major_minor": spec.python_version,
                    "implementation": "CPython",
                },
                "result": "PASS",
            }
            for spec in default_lane_specs()
        }
        result = aggregate_lane_manifests(
            expected_head=expected_head,
            base_sha=base_sha,
            pull_request=85,
            manifests=manifests,
        )
        self.assertEqual("PASS", result["result"])
        self.assertEqual([], result["failures"])
        self.assertEqual(4, len(result["lanes"]))

    def test_aggregate_fails_for_missing_lane(self) -> None:
        specs = default_lane_specs()
        manifests = {
            spec.lane_id: {
                "lane_id": spec.lane_id,
                "expected_head": "a" * 40,
                "actual_head": "a" * 40,
                "base_sha": "b" * 40,
                "host": {"system": spec.expected_system},
                "python": {"major_minor": spec.python_version, "implementation": "CPython"},
                "result": "PASS",
            }
            for spec in specs[:-1]
        }
        result = aggregate_lane_manifests(
            expected_head="a" * 40,
            base_sha="b" * 40,
            pull_request=85,
            manifests=manifests,
        )
        self.assertEqual("FAIL", result["result"])
        self.assertIn("MISSING_LANE:wsl-ubuntu-py312", result["failures"])

    def test_aggregate_fails_for_head_or_python_mismatch(self) -> None:
        manifests = {}
        for spec in default_lane_specs():
            manifests[spec.lane_id] = {
                "lane_id": spec.lane_id,
                "expected_head": "a" * 40,
                "actual_head": "a" * 40,
                "base_sha": "b" * 40,
                "host": {"system": spec.expected_system},
                "python": {"major_minor": spec.python_version, "implementation": "CPython"},
                "result": "PASS",
            }
        manifests["windows-py313"]["actual_head"] = "c" * 40
        manifests["wsl-ubuntu-py312"]["python"]["major_minor"] = "3.11"
        result = aggregate_lane_manifests(
            expected_head="a" * 40,
            base_sha="b" * 40,
            pull_request=85,
            manifests=manifests,
        )
        self.assertEqual("FAIL", result["result"])
        self.assertIn("HEAD_MISMATCH:windows-py313", result["failures"])
        self.assertIn("PYTHON_VERSION_MISMATCH:wsl-ubuntu-py312", result["failures"])

    def test_cli_input_manifest_can_be_json_round_tripped(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "manifest.json"
            payload = {"lane_id": "windows-py311", "result": "FAIL"}
            path.write_text(json.dumps(payload), encoding="utf-8")
            self.assertEqual(payload, json.loads(path.read_text(encoding="utf-8")))


if __name__ == "__main__":
    unittest.main()
