import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/validation/WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL.json"
WORKFLOW = ROOT / ".github/workflows/validate-visual-platform-gates.yml"
PROJECT = ROOT / "project.godot"
MOBILE_ROOT = ROOT / "src/ui/mobile_safe_root.gd"
MOBILE_TEST = ROOT / "tests/integration/test_mobile_safe_root.gd"
UNRESOLVED = ROOT / "docs/planning/CURRENT_UNRESOLVED_GATES.md"
CONFIRMED = ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md"
CURRENT = [
    ROOT / "START_HERE.md",
    ROOT / "docs/ACTIVE_CONTEXT.md",
    ROOT / "docs/DEVELOPMENT_GATES.md",
    UNRESOLVED,
    CONFIRMED,
]
STRUCTURAL_PASS = "WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS"
THREE_SCREEN_ROLE = "SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE"
THREE_SCREEN_PENDING = "THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9"
LAYOUT_PASS = "VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS"


class VisualPlatformGateSequencingTests(unittest.TestCase):
    def test_shared_core_evidence_and_workflow_exist(self):
        self.assertTrue(EVIDENCE.is_file(), str(EVIDENCE))
        self.assertTrue(WORKFLOW.is_file(), str(WORKFLOW))

    def test_shared_core_evidence_is_structural_not_export_or_device_claim(self):
        data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        self.assertEqual(STRUCTURAL_PASS, data["status"])
        self.assertEqual("9.4.3", data["base_release_pin"])
        self.assertEqual("PASS", data["checks"]["shared_core_platform_api_isolation"])
        self.assertEqual("PASS", data["checks"]["shared_project_configuration"])
        self.assertEqual("PASS", data["checks"]["mobile_layout_adapter_baseline"])
        self.assertEqual("NOT_RUN", data["limitations"]["windows_export"])
        self.assertEqual("NOT_RUN", data["limitations"]["android_export"])
        self.assertEqual("NOT_RUN", data["limitations"]["android_device"])
        self.assertFalse(data["claims"]["windows_export_pass"])
        self.assertFalse(data["claims"]["android_export_pass"])
        self.assertFalse(data["claims"]["android_device_pass"])

    def test_core_has_no_direct_platform_or_store_ownership(self):
        forbidden = (
            "OS.get_name(",
            "JavaClassWrapper",
            "JNISingleton",
            "Steam",
            "GooglePlay",
            "Google Play",
            "STOVE",
            "DisplayServer.window_get_native_handle",
        )
        core_files = sorted((ROOT / "src/core").rglob("*.gd"))
        self.assertTrue(core_files, "src/core must contain shared domain code")
        for path in core_files:
            text = path.read_text(encoding="utf-8")
            for token in forbidden:
                self.assertNotIn(token, text, f"{path}: core owns platform token {token}")

    def test_project_and_mobile_layout_baseline_match_shared_profile(self):
        project = PROJECT.read_text(encoding="utf-8")
        for token in (
            'config/features=PackedStringArray("4.7")',
            "window/size/viewport_width=1280",
            "window/size/viewport_height=720",
            'window/stretch/mode="canvas_items"',
            "window/handheld/orientation=6",
            'renderer/rendering_method="gl_compatibility"',
            'renderer/rendering_method.mobile="gl_compatibility"',
        ):
            self.assertIn(token, project)
        self.assertFalse((ROOT / "export_presets.cfg").exists(), "exports remain NOT_RUN until presets are deliberately authored")

        layout = MOBILE_ROOT.read_text(encoding="utf-8")
        layout_test = MOBILE_TEST.read_text(encoding="utf-8")
        self.assertIn("maxf(48.0", layout)
        self.assertIn("1.3", layout_test)
        self.assertIn("AUTOMATED_LAYOUT_ONLY", layout)
        self.assertIn("physical_touch", layout)
        self.assertIn('"NOT_RUN"', layout)

    def test_current_canon_removes_circular_precondition_without_false_completion(self):
        combined = "\n".join(path.read_text(encoding="utf-8") for path in CURRENT)
        self.assertIn(STRUCTURAL_PASS, combined)
        self.assertIn(THREE_SCREEN_ROLE, combined)
        self.assertIn(THREE_SCREEN_PENDING, combined)
        self.assertIn(LAYOUT_PASS, combined)
        self.assertNotIn("WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED", combined)
        self.assertIn("AUDIO_VAULT_PATH_UNVERIFIED", combined)
        self.assertIn("AUDIO_RIGHTS_UNVERIFIED", combined)
        self.assertIn("VISUAL_AUDIO_COMPLETE_NOT_PROVEN", combined)
        self.assertNotIn("SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN", combined)
        self.assertIn("READY_FOR_HIGODOT_AUTHORING", combined)

    def test_workflow_runs_same_contract_on_windows_and_ubuntu_with_full_sha_actions(self):
        workflow = WORKFLOW.read_text(encoding="utf-8")
        self.assertIn("windows-2025", workflow)
        self.assertIn("ubuntu-24.04", workflow)
        self.assertIn("python -m unittest tests.test_visual_platform_gate_sequencing -v", workflow)
        self.assertIn("actions/checkout@11d5960a326750d5838078e36cf38b85af677262", workflow)
        self.assertIn("actions/setup-python@a26af69be951a213d495a4c3e4e4022e16d87065", workflow)


if __name__ == "__main__":
    unittest.main()
