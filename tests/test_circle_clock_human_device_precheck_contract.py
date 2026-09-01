from __future__ import annotations

import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RUNBOOK_PATH = ROOT / "docs/validation/CIRCLE_CLOCK_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK_2026-09-01.md"
RECEIPT_PATH = ROOT / "docs/contracts/receipts/2026-09-01-circle-clock-human-device-accessibility-precheck-work-contract-receipt.json"
REGISTRY_PATH = ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json"


class CircleClockHumanDevicePrecheckContractTests(unittest.TestCase):
    def test_precheck_binds_the_actual_story_flow_without_claiming_human_or_device_pass(self) -> None:
        text = RUNBOOK_PATH.read_text(encoding="utf-8")

        for token in (
            "PREPARED_NOT_RUN",
            "Story Front Door",
            "AdmissionPrologue",
            "StoryEventRoot",
            "새 기록 시작",
            "입학의 아침",
            "글자 새기기",
            "Preview",
            "대상 지정",
            "시전",
            "서리 안정화",
            "온실 균열 확산",
            "NOT_RUN",
            "실제 사람 또는 실제 기기 세션",
        ):
            self.assertIn(token, text)

        self.assertIn("automation_or_editor_observation_is_not_human_or_device_pass: true", text)
        self.assertIn("do_not_modify_runtime_during_observation: true", text)

    def test_precheck_requires_reproducible_accessibility_and_device_evidence(self) -> None:
        text = RUNBOOK_PATH.read_text(encoding="utf-8")

        for token in (
            "exact_git_revision",
            "device_model",
            "os_version",
            "physical_resolution",
            "input_modality",
            "text_scale_or_display_scale",
            "screen_reader_or_accessibility_service_state",
            "focus_or_controller_navigation",
            "target_size_and_spacing",
            "raw_participant_words",
            "W3C WCAG 2.2",
            "Godot Control",
        ):
            self.assertIn(token, text)

    def test_precheck_is_registered_as_the_current_gate_evidence_owner(self) -> None:
        receipt = json.loads(RECEIPT_PATH.read_text(encoding="utf-8"))
        registry = json.loads(REGISTRY_PATH.read_text(encoding="utf-8"))

        self.assertEqual("L1", receipt["work_level"])
        self.assertEqual("PASS", receipt["benchmark_preflight_receipt"]["state"])
        self.assertGreaterEqual(len(receipt["adversarial_review_loops"]), 5)
        self.assertEqual("PREPARED_NOT_RUN", receipt["evidence_ceiling"])
        self.assertEqual(
            "docs/validation/CIRCLE_CLOCK_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK_2026-09-01.md",
            registry["validation_sources"]["human_device_accessibility_precheck"],
        )
        self.assertEqual("PREPARED_NOT_RUN", registry["validation_sources"]["human_device_accessibility_state"])


if __name__ == "__main__":
    unittest.main()
