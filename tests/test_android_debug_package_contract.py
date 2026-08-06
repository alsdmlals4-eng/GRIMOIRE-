from __future__ import annotations

import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class AndroidDebugPackageContractTest(unittest.TestCase):
    def read_required(self, relative: str) -> str:
        path = ROOT / relative
        self.assertTrue(path.is_file(), f"missing required file: {relative}")
        return path.read_text(encoding="utf-8")

    def test_project_remains_landscape_gl_compatibility(self) -> None:
        project = self.read_required("project.godot")
        self.assertIn('window/handheld/orientation=6', project)
        self.assertIn('renderer/rendering_method.mobile="gl_compatibility"', project)

    def test_android_export_preset_is_debug_only_and_stable(self) -> None:
        preset = self.read_required("export_presets.cfg")
        required = [
            'name="Android Debug"',
            'platform="Android"',
            'export_path="build/android/GRIMOIRE-Star-Circuit-POC.apk"',
            'package/unique_name="com.alsdmlals4eng.grimoire.poc"',
            'package/name="GRIMOIRE Star Circuit POC"',
            'version/code=1',
            'version/name="0.1.0-poc"',
            'architectures/arm64-v8a=true',
            'keystore/release=""',
            'keystore/release_user=""',
            'keystore/release_password=""',
        ]
        for token in required:
            self.assertIn(token, preset)
        forbidden = ["GODOT_ANDROID_KEYSTORE_RELEASE", "upload_key", "play_signing"]
        for token in forbidden:
            self.assertNotIn(token, preset.lower())

    def test_build_tool_exports_and_packages_fail_closed(self) -> None:
        tool = self.read_required("tools/build_android_debug.py")
        required = [
            'EXPECTED_GODOT_VERSION = "4.7.1"',
            'PRESET_NAME = "Android Debug"',
            'PACKAGE_ID = "com.alsdmlals4eng.grimoire.poc"',
            'APK_NAME = "GRIMOIRE-Star-Circuit-POC.apk"',
            'ZIP_MEMBERS = (',
            '"SHA256SUMS.txt"',
            '"설치안내.txt"',
            '"BUILD_INFO.json"',
            '"--export-debug"',
            'apk_path.stat().st_size <= 0',
            'hashlib.sha256',
            'zipfile.ZipFile',
        ]
        for token in required:
            self.assertIn(token, tool)
        self.assertRegex(tool, r"human_validation[^\n]*NOT_RUN")
        self.assertRegex(tool, r"physical_device_validation[^\n]*NOT_RUN")

    def test_install_guide_is_phone_facing_and_honest(self) -> None:
        guide = self.read_required(
            "docs/validation/ANDROID_DEBUG_APK_INSTALL_GUIDE_2026-08-06.md"
        )
        required = [
            "GRIMOIRE-Star-Circuit-POC.apk",
            "com.alsdmlals4eng.grimoire.poc",
            "ZIP",
            "압축",
            "알 수 없는 앱",
            "SHA-256",
            "NOT_RUN",
            "출시용",
        ]
        for token in required:
            self.assertIn(token, guide)

    def test_workflow_builds_one_downloadable_zip(self) -> None:
        workflow = self.read_required(".github/workflows/build-android-debug-apk.yml")
        required = [
            "workflow_dispatch:",
            "actions/setup-java@v4",
            "java-version: '17'",
            'build-tools;35.0.1',
            'platforms;android-35',
            'ndk;28.1.13356709',
            "--with-templates",
            "GODOT_ANDROID_KEYSTORE_DEBUG_PATH",
            "GODOT_ANDROID_KEYSTORE_DEBUG_USER",
            "GODOT_ANDROID_KEYSTORE_DEBUG_PASSWORD",
            "python tools/build_android_debug.py",
            "GRIMOIRE-Android-Debug-POC.zip",
            "actions/upload-artifact@v4",
            "if-no-files-found: error",
        ]
        for token in required:
            self.assertIn(token, workflow)
        self.assertNotRegex(workflow, re.compile(r"KEYSTORE_RELEASE|RELEASE_PASSWORD"))


if __name__ == "__main__":
    unittest.main()
