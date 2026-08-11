from __future__ import annotations

import inspect
import io
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch

from tools.setup_godot_toolchain import (
    GODOT_VERSION,
    build_engine_url,
    build_templates_url,
    download_file,
    install_templates,
    resolve_platform,
    safe_extract_zip,
    version_matches,
)


class GodotToolchainSetupTests(unittest.TestCase):
    def test_windows_x86_64_uses_official_standard_package(self) -> None:
        spec = resolve_platform("Windows", "AMD64")
        self.assertEqual("windows.64", spec.download_platform)
        self.assertEqual("win64.exe.zip", spec.slug)
        self.assertEqual("Godot_v4.7.1-stable_win64.exe", spec.executable_name)
        self.assertEqual(
            "https://downloads.godotengine.org/?flavor=stable&platform=windows.64&slug=win64.exe.zip&version=4.7.1",
            build_engine_url(spec),
        )

    def test_linux_x86_64_uses_official_standard_package(self) -> None:
        spec = resolve_platform("Linux", "x86_64")
        self.assertEqual("linux.64", spec.download_platform)
        self.assertEqual("linux.x86_64.zip", spec.slug)
        self.assertEqual("Godot_v4.7.1-stable_linux.x86_64", spec.executable_name)
        self.assertEqual(
            "https://downloads.godotengine.org/?flavor=stable&platform=linux.64&slug=linux.x86_64.zip&version=4.7.1",
            build_engine_url(spec),
        )

    def test_templates_use_pinned_official_release_asset(self) -> None:
        self.assertEqual("4.7.1", GODOT_VERSION)
        self.assertEqual(
            "https://github.com/godotengine/godot-builds/releases/download/4.7.1-stable/Godot_v4.7.1-stable_export_templates.tpz",
            build_templates_url(),
        )

    def test_download_file_accepts_integrity_and_retry_contract(self) -> None:
        parameters = inspect.signature(download_file).parameters
        self.assertIn("expected_size", parameters)
        self.assertIn("expected_sha256", parameters)
        self.assertIn("max_attempts", parameters)

    def test_download_file_rejects_size_mismatch_and_removes_bad_file(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            destination = Path(temp_dir) / "artifact.tpz"
            with patch(
                "tools.setup_godot_toolchain.urllib.request.urlopen",
                return_value=io.BytesIO(b"bad"),
            ):
                with self.assertRaisesRegex(RuntimeError, "size mismatch"):
                    download_file(
                        "https://example.invalid/artifact.tpz",
                        destination,
                        expected_size=4,
                    )
            self.assertFalse(destination.exists())

    def test_download_file_rejects_sha256_mismatch_and_removes_bad_file(self) -> None:
        payload = b"same-size-corruption"
        with tempfile.TemporaryDirectory() as temp_dir:
            destination = Path(temp_dir) / "artifact.tpz"
            with patch(
                "tools.setup_godot_toolchain.urllib.request.urlopen",
                return_value=io.BytesIO(payload),
            ):
                with self.assertRaisesRegex(RuntimeError, "sha256 mismatch"):
                    download_file(
                        "https://example.invalid/artifact.tpz",
                        destination,
                        expected_size=len(payload),
                        expected_sha256="0" * 64,
                    )
            self.assertFalse(destination.exists())

    def test_download_file_retries_after_integrity_failure(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            destination = Path(temp_dir) / "artifact.tpz"
            with patch(
                "tools.setup_godot_toolchain.urllib.request.urlopen",
                side_effect=[io.BytesIO(b"bad"), io.BytesIO(b"good")],
            ) as opener:
                try:
                    download_file(
                        "https://example.invalid/artifact.tpz",
                        destination,
                        expected_size=4,
                        max_attempts=2,
                    )
                except RuntimeError:
                    pass
            self.assertTrue(destination.exists())
            if destination.exists():
                self.assertEqual(b"good", destination.read_bytes())
            self.assertEqual(2, opener.call_count)

    def test_install_templates_uses_official_size_sha256_and_bounded_retries(self) -> None:
        captured: dict[str, object] = {}

        def fake_download(
            url: str,
            destination: Path,
            timeout_seconds: int = 180,
            **kwargs: object,
        ) -> None:
            captured["url"] = url
            captured["timeout_seconds"] = timeout_seconds
            captured.update(kwargs)
            with zipfile.ZipFile(destination, "w") as bundle:
                bundle.writestr("templates/dummy.txt", "ok")

        with tempfile.TemporaryDirectory() as temp_dir:
            install_root = Path(temp_dir) / "godot"
            with patch("tools.setup_godot_toolchain.download_file", side_effect=fake_download):
                template_root = install_templates(install_root)

            self.assertEqual(
                "https://github.com/godotengine/godot-builds/releases/download/4.7.1-stable/Godot_v4.7.1-stable_export_templates.tpz",
                captured.get("url"),
            )
            self.assertEqual(1280486955, captured.get("expected_size"))
            self.assertEqual(
                "86409db6200b6f8fd3230989c2d2002851f3dd18acf11d7bdbafddf5a0dd0f72",
                captured.get("expected_sha256"),
            )
            self.assertEqual(3, captured.get("max_attempts"))
            self.assertEqual("ok", (template_root / "dummy.txt").read_text(encoding="utf-8"))

    def test_unsupported_architecture_fails_clearly(self) -> None:
        with self.assertRaisesRegex(RuntimeError, "Unsupported Godot host"):
            resolve_platform("Windows", "ARM32")

    def test_version_match_requires_exact_stable_line(self) -> None:
        self.assertTrue(version_matches("4.7.1.stable.official.abcdef"))
        self.assertTrue(version_matches("4.7.1.stable"))
        self.assertFalse(version_matches("4.7.stable.official.abcdef"))
        self.assertFalse(version_matches("4.7.1.rc1.official.abcdef"))
        self.assertFalse(version_matches("4.8.dev2.official.abcdef"))

    def test_safe_extract_rejects_parent_traversal(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            archive = root / "bad.zip"
            destination = root / "out"
            with zipfile.ZipFile(archive, "w") as bundle:
                bundle.writestr("../escape.txt", "bad")
            with self.assertRaisesRegex(RuntimeError, "unsafe archive member"):
                safe_extract_zip(archive, destination)
            self.assertFalse((root / "escape.txt").exists())

    def test_safe_extract_writes_normal_members(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            archive = root / "good.zip"
            destination = root / "out"
            with zipfile.ZipFile(archive, "w") as bundle:
                bundle.writestr("folder/file.txt", "ok")
            safe_extract_zip(archive, destination)
            self.assertEqual("ok", (destination / "folder/file.txt").read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
