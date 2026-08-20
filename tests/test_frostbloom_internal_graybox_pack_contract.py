import json
from itertools import combinations
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = ROOT / "data/testing/frostbloom_internal_graybox_pack_v1.json"
LENS_FIXTURE = ROOT / "data/testing/frostbloom_10_23_lens_v1.json"
PACK_DIR = ROOT / "docs/testing/frostbloom_graybox"
LENS_CANON = ROOT / "docs/planning/FROSTBLOOM_10_23_LENS_INVESTIGATION_01_APPROVAL_2026-08-20.md"
CURRENT = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"


class FrostbloomInternalGrayboxPackContractTests(unittest.TestCase):
    def load_fixture(self):
        return json.loads(FIXTURE.read_text(encoding="utf-8"))

    def load_lens_fixture(self):
        return json.loads(LENS_FIXTURE.read_text(encoding="utf-8"))

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

    def test_10_23_lens_refinement_preserves_open_investigation(self):
        self.assertTrue(LENS_CANON.is_file(), LENS_CANON)
        self.assertTrue(LENS_FIXTURE.is_file(), LENS_FIXTURE)
        text = LENS_CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01",
            "FREE_SCHEDULE_LENS_ONLY",
            "ALL_FOUR_INVESTIGATION_NODES_REMAIN_ACCESSIBLE",
            "SEQUENTIAL_PICK_2_OF_4",
            "KNOWN_2_UNKNOWN_2",
            "W5_FIRST_INVESTIGATION_NONCOMBAT_APPLICATION",
            "NO_CLUE_UNLOCK_OWNERSHIP",
            "NO_REQUIRED_RESOURCE_OWNERSHIP",
            "NO_SPELL_CIRCUIT_TARGET_BEST_INTENT_RECOMMENDATION",
        ):
            self.assertIn(token, text)
        current = CURRENT.read_text(encoding="utf-8")
        self.assertIn("GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01", current)

        data = self.load_lens_fixture()
        self.assertEqual("SEQUENTIAL_PICK_2_OF_4", data["investigation"]["selection_mode"])
        self.assertEqual("KNOWN_2_UNKNOWN_2", data["investigation"]["w6_entry_summary"])
        self.assertTrue(data["investigation"]["all_nodes_remain_accessible"])
        self.assertEqual(4, len(data["investigation"]["question_previews"]))
        for question in data["investigation"]["question_previews"].values():
            self.assertTrue(question)
        for choice in data["free_schedule"]["choices"]:
            self.assertTrue(choice["lens_only"], choice["id"])
            self.assertFalse(choice["owns_clue_unlock"], choice["id"])
            self.assertFalse(choice["owns_required_resource"], choice["id"])

    def test_verdict_vocabulary_is_closed(self):
        self.assertEqual(["PASS", "RISK", "FAIL", "NOT_TESTABLE_YET"], self.load_fixture()["allowed_verdicts"])

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

    def test_free_schedule_choices_are_nonmandatory_and_non_dominant(self):
        data = self.load_fixture()
        for choice in data["free_schedule"]:
            self.assertFalse(choice["blocks_main_progress"], choice["id"])
            self.assertFalse(choice["owns_required_material"], choice["id"])
            self.assertFalse(choice["owns_required_answer"], choice["id"])
            self.assertFalse(choice["permanent_dominant_reward"], choice["id"])
            self.assertFalse(choice["later_choice_invalidated"], choice["id"])
            self.assertIn(choice["verdict"], data["allowed_verdicts"])

    def test_w6_cases_preserve_real_improvement_and_w7_changes_judgment(self):
        data = self.load_fixture()
        allowed_change = {"meaning_and_circuit", "target", "intent_emphasis", "tradeoff", "contextual_use"}
        for case in data["consequence_cases"]:
            self.assertTrue(any(int(v) > 0 for v in case["w6_dimension_delta"].values()), case["id"])
            self.assertTrue(case["first_solution_preserved"], case["id"])
            self.assertTrue(set(case["w7_changed_judgment"]).intersection(allowed_change), case["id"])
            self.assertNotIn("route_id", case)
            self.assertNotIn("required_spell", case)

    def test_result_cases_keep_five_axes_and_complete_grimoire_causality(self):
        data = self.load_fixture()
        expected_axes = data["result_dimensions"]
        required_fields = set(data["grimoire_required_fields"])
        self.assertGreaterEqual(len(data["result_cases"]), 3)
        mixed_found = False
        for case in data["result_cases"]:
            self.assertEqual(expected_axes, list(case["dimensions"].keys()), case["id"])
            values = list(case["dimensions"].values())
            mixed_found = mixed_found or (max(values) > 0 and min(values) <= 0)
            self.assertEqual(required_fields, set(case["grimoire"].keys()), case["id"])
            self.assertNotIn("SUCCESS_GRADE", case)
        self.assertTrue(mixed_found)

    def test_adversarial_cases_cover_exactly_fourteen_attacks(self):
        data = self.load_fixture()
        self.assertEqual(data["adversarial_case_ids"], [x["id"] for x in data["adversarial_cases"]])
        self.assertEqual(14, len(data["adversarial_cases"]))
        for case in data["adversarial_cases"]:
            self.assertIn(case["verdict"], data["allowed_verdicts"])

    def test_pack_never_promotes_internal_review_to_human_evidence(self):
        readme = (PACK_DIR / "README.md").read_text(encoding="utf-8")
        for token in (
            "HUMAN_VALIDATION: NOT_RUN",
            "DEVICE_VALIDATION: NOT_RUN",
            "PERFORMANCE_VALIDATION: NOT_RUN",
            "FULL_SLICE_VALIDATION: NOT_RUN",
            "46_MINUTE_TARGET_NOT_VALIDATED_BY_INTERNAL_WALKTHROUGH",
        ):
            self.assertIn(token, readme)


if __name__ == "__main__":
    unittest.main()
