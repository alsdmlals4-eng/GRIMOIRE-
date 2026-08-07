from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "docs/validation/GUT_LEGACY_REQUIRED_CONTRACT_PARITY.json"


class GutLegacyContractParityTests(unittest.TestCase):
    def test_required_contract_parity_manifest_exists_and_maps_real_suites(self) -> None:
        self.assertTrue(MANIFEST.is_file(), str(MANIFEST))
        data = json.loads(MANIFEST.read_text(encoding="utf-8"))
        self.assertEqual(1, data["schema_version"])
        entries = data["contracts"]
        self.assertGreaterEqual(len(entries), 1)

        required = [entry for entry in entries if entry.get("required") is True]
        self.assertGreaterEqual(len(required), 1)
        for entry in required:
            self.assertTrue(entry.get("contract_id"), entry)
            legacy = ROOT / entry["legacy_suite"].removeprefix("res://")
            gut = ROOT / entry["gut_suite"].removeprefix("res://")
            self.assertTrue(legacy.is_file(), str(legacy))
            self.assertTrue(gut.is_file(), str(gut))

    def test_glyph_definition_core_has_legacy_and_gut_parity_pair(self) -> None:
        data = json.loads(MANIFEST.read_text(encoding="utf-8"))
        by_id = {entry["contract_id"]: entry for entry in data["contracts"]}
        entry = by_id["GLYPH_DEFINITION_CORE"]
        self.assertTrue(entry["required"])
        self.assertEqual(
            "res://tests/unit/test_glyph_definition.gd", entry["legacy_suite"]
        )
        self.assertEqual(
            "res://tests/gut/unit/test_glyph_definition.gd", entry["gut_suite"]
        )
        self.assertEqual("SAME_PUBLIC_BEHAVIOR", entry["parity_basis"])
        self.assertIn("VALID_HEAT_DEFINITION", entry["behaviors"])
        self.assertIn("INVALID_ROLE_REJECTED", entry["behaviors"])
        self.assertIn("INVALID_ID_REJECTED", entry["behaviors"])
        self.assertIn("INVALID_STROKE_COUNT_REJECTED", entry["behaviors"])


if __name__ == "__main__":
    unittest.main()
