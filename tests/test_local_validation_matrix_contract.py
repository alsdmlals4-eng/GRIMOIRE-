from __future__ import annotations

import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
POWERSHELL = ROOT / "tools/run_local_validation_matrix.ps1"
WSL = ROOT / "tools/run_local_validation_matrix_wsl.sh"
SCHEMA = ROOT / "docs/validation/LOCAL_VALIDATION_MATRIX_MANIFEST.schema.json"
GITIGNORE = ROOT / ".gitignore"


class LocalValidationMatrixContractTests(unittest.TestCase):
    def test_matrix_files_exist(self) -> None:
        for path in (POWERSHELL, WSL, SCHEMA):
            self.assertTrue(path.is_file(), str(path))

    def test_powershell_declares_all_windows_and_wsl_lanes(self) -> None:
        text = POWERSHELL.read_text(encoding="utf-8")
        for marker in (
            "windows-py311",
            "windows-py312",
            "windows-py313",
            "wsl-ubuntu-py312",
            "py -3.11",
            "py -3.12",
            "py -3.13",
            "wsl.exe",
            "local_validation_matrix.py",
        ):
            self.assertIn(marker, text)

    def test_wsl_entrypoint_requires_python_3_12_and_full_runtime(self) -> None:
        text = WSL.read_text(encoding="utf-8")
        for marker in (
            "python3.12",
            "wsl-ubuntu-py312",
            "setup_godot_toolchain.py",
            "--mode full",
        ):
            self.assertIn(marker, text)

    def test_local_evidence_is_ignored(self) -> None:
        text = GITIGNORE.read_text(encoding="utf-8")
        self.assertIn("artifacts/local-validation/", text.splitlines())


if __name__ == "__main__":
    unittest.main()
