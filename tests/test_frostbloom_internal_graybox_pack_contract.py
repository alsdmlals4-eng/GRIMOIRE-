import json
from itertools import combinations
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = ROOT / "data/testing/frostbloom_internal_graybox_pack_v1.json"
PACK_DIR = ROOT / "docs/testing/frostbloom_graybox"


class FrostbloomInternalGrayboxPackContractTests(unittest.TestCase):
    def load_fixture(self):
        return json.loads(FIXTURE.read_text(encoding="utf-8"))

    def test_fixture_exists_and_core_identity_is_locked(self):
        self.assertTrue(FIXTURE.is_file(), FIXTURE)
        data = self.load_fixture()
        self.assertEqual(1, data["schema_version"])
        self.assertEqual("FROSTBLOOM_INTERNAL_GRAYBOX_PACK_V1", data["pack_id"])
        self.assertEqual("GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01", data["decision_id"])
        self.assertEqual({"target": 46, "rework": 53, "hard_stop": 60}, data["timing"])

    def test_writing_events_are_exactly_w1_to_w7(self):
        data = self.load_fixture()
        self.assertEqual([f"W{i}" for i in range(1, 8)], [x["id"] for x in data["writing_events"]])
        self.assertEqual(10, data["recovery_inclusive_writing_cap"])

    def test_investigation_has_exactly_all_six_pairs(self):
        data = self.load_fixture()
        nodes = data["investigation"]["nodes"]
        self.assertEqual(4, len(nodes))
        expected = {tuple(sorted(pair)) for pair in combinations(nodes, 2)}
        actual = {tuple(sorted(pair["nodes"])) for pair in data["investigation"]["pairs"]}
        self.assertEqual(expected, actual)
        self.assertEqual(6, len(actual))

    def test_free_schedule_and_results_are_exact(self):
        data = self.load_fixture()
        self.assertEqual(["REST", "PREPARE", "SOCIAL", "PRACTICUM"], [x["id"] for x in data["free_schedule"]])
        self.assertEqual(["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"], data["result_dimensions"])

    def test_verdict_vocabulary_is_closed(self):
        self.assertEqual(
            ["PASS", "RISK", "FAIL", "NOT_TESTABLE_YET"],
            self.load_fixture()["allowed_verdicts"],
        )

    def test_walkthrough_has_eight_beats_and_information_guard(self):
        text = (PACK_DIR / "01_46_MINUTE_WALKTHROUGH.md").read_text(encoding="utf-8")
        for i in range(1, 9):
            self.assertIn(f"BEAT_{i:02d}", text)
        for token in ("PLAYER_KNOWS", "PLAYER_CHOOSES", "SYSTEM_CHANGES", "MUST_REMAIN_UNKNOWN"):
            self.assertGreaterEqual(text.count(token), 8)
        self.assertIn("46 = TARGET_HYPOTHESIS_NOT_HUMAN_VALIDATION", text)

    def test_writing_audit_covers_w1_to_w7_and_cap_10(self):
        text = (PACK_DIR / "02_W1_W7_WRITING_LOAD_AUDIT.md").read_text(encoding="utf-8")
        for i in range(1, 8):
            self.assertIn(f"W{i}", text)
        self.assertIn("RECOVERY_INCLUSIVE_CAP: 10", text)
        self.assertIn("DISTINCT", text)

    def test_each_investigation_pair_has_context_uncertainty_and_no_answer_lookup(self):
        data = self.load_fixture()
        forbidden = {"correct_route_id", "required_spell", "best_intent", "mandatory_hidden_third_clue"}
        for pair in data["investigation"]["pairs"]:
            self.assertGreaterEqual(len(pair["useful_context"]), 2, pair["id"])
            self.assertGreaterEqual(len(pair["remaining_uncertainty"]), 1, pair["id"])
            self.assertTrue(pair["forward_progress_to_w6"], pair["id"])
            self.assertTrue(forbidden.isdisjoint(pair.keys()), pair["id"])
            self.assertIn(pair["verdict"], data["allowed_verdicts"])


if __name__ == "__main__":
    unittest.main()
