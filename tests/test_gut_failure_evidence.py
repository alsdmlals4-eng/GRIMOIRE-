from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from tools.gut_failure_evidence import render_failure_evidence


class GutFailureEvidenceTests(unittest.TestCase):
    def test_junit_missing_includes_successful_gut_log(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            evidence = Path(tmp)
            logs = evidence / "logs"
            logs.mkdir()
            gut_log = logs / "gut-headless.log"
            gut_log.write_text("Tests: 0\nNo test scripts found.\n", encoding="utf-8")
            (evidence / "manifest.json").write_text(
                json.dumps(
                    {
                        "result": "BLOCKED",
                        "limitations": ["JUNIT_MISSING"],
                        "commands": [
                            {
                                "name": "gut-headless",
                                "exit_code": 0,
                                "log_path": str(gut_log),
                            }
                        ],
                    }
                ),
                encoding="utf-8",
            )

            rendered = render_failure_evidence(evidence)

            self.assertIn("diagnostic command log: gut-headless", rendered)
            self.assertIn("No test scripts found.", rendered)

    def test_successful_non_gut_log_is_not_dumped(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            evidence = Path(tmp)
            logs = evidence / "logs"
            logs.mkdir()
            contract_log = logs / "python-contract.log"
            contract_log.write_text("OK\n", encoding="utf-8")
            (evidence / "manifest.json").write_text(
                json.dumps(
                    {
                        "result": "BLOCKED",
                        "limitations": ["JUNIT_MISSING"],
                        "commands": [
                            {
                                "name": "python-contract",
                                "exit_code": 0,
                                "log_path": str(contract_log),
                            }
                        ],
                    }
                ),
                encoding="utf-8",
            )

            rendered = render_failure_evidence(evidence)

            self.assertNotIn("OK", rendered)


if __name__ == "__main__":
    unittest.main()
