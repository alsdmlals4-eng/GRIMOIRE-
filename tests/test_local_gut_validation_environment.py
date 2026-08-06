from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from tools.gut_failure_evidence import render_failure_evidence, resolve_evidence_dir
from tools.run_local_gut_validation import (
    copy_and_parse_junit,
    full_unittest_command,
    isolated_godot_environment,
    python_runtime_info,
    python_version_matches,
)


class LocalGutValidationEnvironmentTests(unittest.TestCase):
    def test_full_unittest_command_discovers_all_python_contracts(self) -> None:
        self.assertEqual(
            ["python-x", "-m", "unittest", "discover", "-s", "tests", "-p", "test_*.py", "-v"],
            full_unittest_command("python-x"),
        )

    def test_python_runtime_info_matches_requested_major_minor(self) -> None:
        info = python_runtime_info()
        self.assertEqual("CPython", info["implementation"])
        self.assertRegex(info["major_minor"], r"^3\.\d+$")
        self.assertTrue(python_version_matches(info, info["major_minor"]))
        self.assertFalse(python_version_matches(info, "2.7"))

    def test_windows_godot_environment_is_isolated(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            evidence = Path(tmp)
            env, root = isolated_godot_environment(
                evidence,
                base_env={"PATH": "x"},
                system="Windows",
            )
            self.assertEqual("x", env["PATH"])
            self.assertEqual(str(root), env["APPDATA"])
            self.assertEqual(str(root / "local"), env["LOCALAPPDATA"])
            self.assertTrue(root.is_dir())

    def test_linux_godot_environment_is_isolated(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            evidence = Path(tmp)
            env, root = isolated_godot_environment(
                evidence,
                base_env={"PATH": "x"},
                system="Linux",
            )
            self.assertEqual(str(root / "home"), env["HOME"])
            self.assertEqual(str(root / "data"), env["XDG_DATA_HOME"])
            self.assertEqual(str(root / "config"), env["XDG_CONFIG_HOME"])
            self.assertEqual(str(root / "cache"), env["XDG_CACHE_HOME"])

    def test_junit_is_copied_and_parsed(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            user_data = root / "user-data/deep"
            user_data.mkdir(parents=True)
            source = user_data / "gut-results.xml"
            source.write_text(
                '<testsuites tests="2" failures="0" errors="0"><testsuite tests="2" failures="0" errors="0" /></testsuites>',
                encoding="utf-8",
            )
            destination, counts = copy_and_parse_junit(root / "user-data", root / "evidence")
            self.assertEqual(root / "evidence/gut-results.xml", destination)
            self.assertEqual({"tests": 2, "failures": 0, "errors": 0}, counts)
            self.assertTrue(destination.is_file())

    def test_junit_missing_or_ambiguous_fails(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            with self.assertRaisesRegex(RuntimeError, "JUNIT_MISSING"):
                copy_and_parse_junit(root / "user-data", root / "evidence")
            (root / "user-data/a").mkdir(parents=True)
            (root / "user-data/b").mkdir(parents=True)
            for folder in ("a", "b"):
                (root / f"user-data/{folder}/gut-results.xml").write_text(
                    '<testsuite tests="1" failures="0" errors="0" />',
                    encoding="utf-8",
                )
            with self.assertRaisesRegex(RuntimeError, "JUNIT_AMBIGUOUS"):
                copy_and_parse_junit(root / "user-data", root / "evidence")

    def test_failed_manifest_and_command_log_are_rendered(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            evidence = Path(tmp)
            logs = evidence / "logs"
            logs.mkdir()
            failed_log = logs / "python-contract.log"
            failed_log.write_text("FAILED (failures=2)\n", encoding="utf-8")
            manifest = {
                "result": "FAIL",
                "limitations": ["PYTHON_CONTRACT_FAILURE"],
                "commands": [
                    {
                        "name": "python-contract",
                        "exit_code": 1,
                        "log_path": str(failed_log),
                    }
                ],
            }
            (evidence / "manifest.json").write_text(
                json.dumps(manifest), encoding="utf-8"
            )

            rendered = render_failure_evidence(evidence)

            self.assertIn('"result": "FAIL"', rendered)
            self.assertIn("PYTHON_CONTRACT_FAILURE", rendered)
            self.assertIn("FAILED (failures=2)", rendered)
            self.assertEqual(evidence, resolve_evidence_dir(["--evidence-dir", str(evidence)]))
            self.assertEqual(
                evidence,
                resolve_evidence_dir([f"--evidence-dir={evidence}"]),
            )


if __name__ == "__main__":
    unittest.main()
