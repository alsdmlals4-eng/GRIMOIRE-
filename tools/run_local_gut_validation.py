from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import platform
import shutil
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any, Mapping, Sequence

from tools.hash_gut_protected_products import build_manifest


DECISION_ID = "GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01"
REPOSITORY = "alsdmlals4-eng/GRIMOIRE-"
PINNED_GUT_COMMIT = "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
PINNED_GUT_TREE = "5d6893836af4917ee62b1a395125a7530b1f239d"
EXPECTED_GODOT_VERSION = "4.7.1"


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).isoformat()


def python_runtime_info() -> dict[str, str]:
    return {
        "implementation": platform.python_implementation(),
        "major_minor": f"{sys.version_info.major}.{sys.version_info.minor}",
        "version": platform.python_version(),
        "executable": str(Path(sys.executable).resolve()),
    }


def python_version_matches(info: Mapping[str, str], expected: str) -> bool:
    return info.get("implementation") == "CPython" and info.get("major_minor") == expected


def host_runtime_info() -> dict[str, Any]:
    release = platform.release()
    return {
        "system": platform.system(),
        "release": release,
        "machine": platform.machine(),
        "wsl": bool(os.environ.get("WSL_DISTRO_NAME")) or "microsoft" in release.lower(),
        "wsl_distribution": os.environ.get("WSL_DISTRO_NAME"),
    }


def full_unittest_command(executable: str | Path = sys.executable) -> list[str]:
    return [
        str(executable),
        "-m",
        "unittest",
        "discover",
        "-s",
        "tests",
        "-p",
        "test_*.py",
        "-v",
    ]


def isolated_godot_environment(
    evidence_dir: Path,
    *,
    base_env: Mapping[str, str] | None = None,
    system: str | None = None,
) -> tuple[dict[str, str], Path]:
    env = dict(os.environ if base_env is None else base_env)
    user_data_root = evidence_dir.resolve() / "user-data"
    user_data_root.mkdir(parents=True, exist_ok=True)
    detected_system = platform.system() if system is None else system

    if detected_system == "Windows":
        local = user_data_root / "local"
        local.mkdir(parents=True, exist_ok=True)
        env["APPDATA"] = str(user_data_root)
        env["LOCALAPPDATA"] = str(local)
    else:
        home = user_data_root / "home"
        data = user_data_root / "data"
        config = user_data_root / "config"
        cache = user_data_root / "cache"
        for path in (home, data, config, cache):
            path.mkdir(parents=True, exist_ok=True)
        env["HOME"] = str(home)
        env["XDG_DATA_HOME"] = str(data)
        env["XDG_CONFIG_HOME"] = str(config)
        env["XDG_CACHE_HOME"] = str(cache)

    return env, user_data_root


def _parse_int(value: str | None) -> int:
    try:
        return int(value or "0")
    except ValueError as exc:
        raise RuntimeError(f"JUNIT_INVALID_COUNT:{value!r}") from exc


def parse_junit(path: Path) -> dict[str, int]:
    try:
        root = ET.parse(path).getroot()
    except (ET.ParseError, OSError) as exc:
        raise RuntimeError(f"JUNIT_INVALID_XML:{exc}") from exc

    if root.tag not in {"testsuite", "testsuites"}:
        raise RuntimeError(f"JUNIT_INVALID_ROOT:{root.tag}")

    if root.get("tests") is not None:
        return {
            "tests": _parse_int(root.get("tests")),
            "failures": _parse_int(root.get("failures")),
            "errors": _parse_int(root.get("errors")),
        }

    suites = root.findall(".//testsuite")
    return {
        "tests": sum(_parse_int(suite.get("tests")) for suite in suites),
        "failures": sum(_parse_int(suite.get("failures")) for suite in suites),
        "errors": sum(_parse_int(suite.get("errors")) for suite in suites),
    }


def parse_junit_result(path: Path) -> tuple[Path, dict[str, int]]:
    if not path.is_file():
        raise RuntimeError("JUNIT_MISSING")
    counts = parse_junit(path)
    if counts["tests"] < 1:
        raise RuntimeError("JUNIT_DISCOVERY_ZERO")
    return path, counts


def copy_and_parse_junit(user_data_root: Path, evidence_dir: Path) -> tuple[Path, dict[str, int]]:
    candidates = sorted(user_data_root.rglob("gut-results.xml")) if user_data_root.exists() else []
    if not candidates:
        raise RuntimeError("JUNIT_MISSING")
    if len(candidates) != 1:
        raise RuntimeError(f"JUNIT_AMBIGUOUS:{len(candidates)}")

    evidence_dir.mkdir(parents=True, exist_ok=True)
    destination = evidence_dir / "gut-results.xml"
    shutil.copy2(candidates[0], destination)
    return parse_junit_result(destination)


def run_process(
    name: str,
    command: Sequence[str],
    cwd: Path,
    logs_dir: Path,
    *,
    env: Mapping[str, str] | None = None,
) -> dict[str, Any]:
    logs_dir.mkdir(parents=True, exist_ok=True)
    log_path = logs_dir / f"{name}.log"
    completed = subprocess.run(
        list(command),
        cwd=cwd,
        env=None if env is None else dict(env),
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    log_path.write_text(completed.stdout or "", encoding="utf-8")
    return {
        "name": name,
        "command": subprocess.list2cmdline(list(command)),
        "exit_code": completed.returncode,
        "log_path": log_path.as_posix(),
        "status": "PASS" if completed.returncode == 0 else "FAIL",
    }


def git_text(root: Path, *args: str) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=root,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if completed.returncode != 0:
        raise RuntimeError(completed.stderr.strip() or completed.stdout.strip())
    return completed.stdout.strip()


def operation_in_progress(root: Path) -> bool:
    git_dir = Path(git_text(root, "rev-parse", "--git-dir"))
    if not git_dir.is_absolute():
        git_dir = root / git_dir
    markers = (
        "MERGE_HEAD",
        "CHERRY_PICK_HEAD",
        "REVERT_HEAD",
        "rebase-merge",
        "rebase-apply",
    )
    return any((git_dir / marker).exists() for marker in markers)


def write_manifest(path: Path, manifest: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(manifest, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )


def initial_manifest(args: argparse.Namespace) -> dict[str, Any]:
    return {
        "schema_version": 2,
        "decision_id": DECISION_ID,
        "repository": REPOSITORY,
        "pull_request": args.pull_request,
        "lane_id": args.lane_id,
        "expected_head": args.expected_head,
        "actual_head": "0" * 40,
        "tree_sha": "0" * 40,
        "base_sha": args.base_sha,
        "origin_main": None,
        "branch": "UNKNOWN",
        "started_at": utc_now(),
        "completed_at": utc_now(),
        "host": host_runtime_info(),
        "python": python_runtime_info(),
        "preflight": {
            "head_match": False,
            "clean_before": False,
            "operation_in_progress": True,
            "remote_match": False,
            "python_match": False,
        },
        "commands": [],
        "vendor": {
            "expected_commit": PINNED_GUT_COMMIT,
            "expected_tree": PINNED_GUT_TREE,
            "actual_tree": None,
            "status": "NOT_RUN",
        },
        "godot": {
            "executable": None,
            "version": None,
            "expected_version": EXPECTED_GODOT_VERSION,
            "status": "NOT_RUN",
        },
        "gut": {
            "version": "9.7.1",
            "discovered": 0,
            "passed": 0,
            "failed": 0,
            "errors": 0,
            "junit_path": None,
            "status": "NOT_RUN",
        },
        "production_hash": {
            "before_path": None,
            "after_path": None,
            "equal": None,
            "status": "NOT_RUN",
        },
        "result": "NOT_RUN",
        "limitations": [],
    }


def parse_gut_counts(log_text: str) -> tuple[int, int, int]:
    discovered = passed = failed = 0
    for line in log_text.splitlines():
        normalized = line.strip().lower()
        if normalized.startswith("tests") and ":" in normalized:
            try:
                discovered = max(discovered, int(normalized.split(":", 1)[1].strip()))
            except ValueError:
                pass
        elif normalized.startswith("passing") and ":" in normalized:
            try:
                passed = max(passed, int(normalized.split(":", 1)[1].strip()))
            except ValueError:
                pass
        elif normalized.startswith("failing") and ":" in normalized:
            try:
                failed = max(failed, int(normalized.split(":", 1)[1].strip()))
            except ValueError:
                pass
    return discovered, passed, failed


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run fail-closed local validation for GRIMOIRE GUT adoption."
    )
    parser.add_argument("--expected-head", required=True)
    parser.add_argument("--base-sha", required=True)
    parser.add_argument("--pull-request", type=int, required=True)
    parser.add_argument("--lane-id", required=True)
    parser.add_argument("--expected-python", required=True)
    parser.add_argument(
        "--mode", choices=("contract", "vendor", "full"), default="contract"
    )
    parser.add_argument("--godot-executable", type=Path)
    parser.add_argument(
        "--evidence-dir",
        type=Path,
        default=Path("artifacts/local-validation"),
    )
    args = parser.parse_args(sys.argv[1:] if argv is None else argv)

    root = Path(git_text(Path.cwd(), "rev-parse", "--show-toplevel")).resolve()
    evidence_dir = (root / args.evidence_dir).resolve()
    manifest_path = evidence_dir / "manifest.json"
    logs_dir = evidence_dir / "logs"
    manifest = initial_manifest(args)

    try:
        actual_head = git_text(root, "rev-parse", "HEAD")
        tree_sha = git_text(root, "rev-parse", "HEAD^{tree}")
        branch = git_text(root, "branch", "--show-current") or "DETACHED"
        try:
            origin_main = git_text(root, "rev-parse", "origin/main")
        except RuntimeError:
            origin_main = None
        remote = git_text(root, "remote", "get-url", "origin")
        clean_before = git_text(root, "status", "--porcelain") == ""
        in_progress = operation_in_progress(root)
        remote_match = "alsdmlals4-eng/GRIMOIRE-" in remote
        python_match = python_version_matches(manifest["python"], args.expected_python)

        manifest.update(
            {
                "actual_head": actual_head,
                "tree_sha": tree_sha,
                "origin_main": origin_main,
                "branch": branch,
                "preflight": {
                    "head_match": actual_head == args.expected_head,
                    "clean_before": clean_before,
                    "operation_in_progress": in_progress,
                    "remote_match": remote_match,
                    "python_match": python_match,
                },
            }
        )

        if actual_head != args.expected_head:
            raise RuntimeError("HEAD_MISMATCH")
        if not clean_before:
            raise RuntimeError("DIRTY_WORKTREE_BEFORE_VALIDATION")
        if in_progress:
            raise RuntimeError("OPERATION_IN_PROGRESS")
        if not remote_match:
            raise RuntimeError("REMOTE_MISMATCH")
        if not python_match:
            raise RuntimeError("PYTHON_VERSION_MISMATCH")

        contract = run_process(
            "python-contract",
            full_unittest_command(sys.executable),
            root,
            logs_dir,
        )
        manifest["commands"].append(contract)
        if contract["exit_code"] != 0:
            raise RuntimeError("PYTHON_CONTRACT_FAILURE")

        if args.mode in ("vendor", "full"):
            try:
                actual_tree = git_text(root, "rev-parse", "HEAD:addons/gut")
            except RuntimeError:
                actual_tree = None
            manifest["vendor"]["actual_tree"] = actual_tree
            manifest["vendor"]["status"] = (
                "PASS" if actual_tree == PINNED_GUT_TREE else "FAIL"
            )
            if actual_tree != PINNED_GUT_TREE:
                raise RuntimeError("OFFICIAL_GUT_TREE_MISMATCH")

        if args.mode == "full":
            if args.godot_executable is None:
                raise RuntimeError("GODOT_EXECUTABLE_REQUIRED")
            executable = args.godot_executable.resolve()
            manifest["godot"]["executable"] = str(executable)
            version_result = run_process(
                "godot-version", [str(executable), "--version"], root, logs_dir
            )
            manifest["commands"].append(version_result)
            version_text = Path(version_result["log_path"]).read_text(encoding="utf-8").strip()
            manifest["godot"]["version"] = version_text
            version_ok = version_result["exit_code"] == 0 and EXPECTED_GODOT_VERSION in version_text
            manifest["godot"]["status"] = "PASS" if version_ok else "FAIL"
            if not version_ok:
                raise RuntimeError("GODOT_VERSION_MISMATCH")

            required = (
                root / ".gutconfig.json",
                root / "tests/gut/integration/test_gut_product_smoke.gd",
            )
            if not all(path.is_file() for path in required):
                raise RuntimeError("GUT_CONSUMPTION_FILES_MISSING")

            before_path = evidence_dir / "gut-products-before.json"
            after_path = evidence_dir / "gut-products-after.json"
            before = build_manifest(root)
            before_path.parent.mkdir(parents=True, exist_ok=True)
            before_path.write_text(
                json.dumps(before, sort_keys=True, indent=2) + "\n", encoding="utf-8"
            )
            manifest["production_hash"]["before_path"] = before_path.as_posix()

            junit_output_path = (evidence_dir / "gut-results.xml").resolve()
            if junit_output_path.exists():
                junit_output_path.unlink()
            godot_env, _user_data_root = isolated_godot_environment(evidence_dir)
            gut_result = run_process(
                "gut-headless",
                [
                    str(executable),
                    "--headless",
                    "--path",
                    str(root),
                    "-s",
                    "addons/gut/gut_cmdln.gd",
                    "-gconfig=res://.gutconfig.json",
                    f"-gjunit_xml_file={junit_output_path}",
                    "-gexit",
                ],
                root,
                logs_dir,
                env=godot_env,
            )
            manifest["commands"].append(gut_result)
            gut_log = Path(gut_result["log_path"]).read_text(encoding="utf-8")
            log_discovered, log_passed, log_failed = parse_gut_counts(gut_log)

            after = build_manifest(root)
            after_path.write_text(
                json.dumps(after, sort_keys=True, indent=2) + "\n", encoding="utf-8"
            )
            hashes_equal = before == after
            manifest["production_hash"].update(
                {
                    "after_path": after_path.as_posix(),
                    "equal": hashes_equal,
                    "status": "PASS" if hashes_equal else "FAIL",
                }
            )
            if not hashes_equal:
                raise RuntimeError("PRODUCTION_HASH_CHANGED")

            junit_path, junit = parse_junit_result(junit_output_path)
            discovered = max(log_discovered, junit["tests"])
            failed = max(log_failed, junit["failures"])
            errors = junit["errors"]
            passed = max(log_passed, discovered - failed - errors)
            manifest["gut"].update(
                {
                    "discovered": discovered,
                    "passed": passed,
                    "failed": failed,
                    "errors": errors,
                    "junit_path": junit_path.as_posix(),
                    "status": (
                        "PASS"
                        if gut_result["exit_code"] == 0
                        and discovered > 0
                        and failed == 0
                        and errors == 0
                        else "FAIL"
                    ),
                }
            )
            if manifest["gut"]["status"] != "PASS":
                raise RuntimeError("GUT_EXECUTION_FAILURE_OR_DISCOVERY_ZERO")

        manifest["result"] = "PASS"
        return_code = 0
    except Exception as exc:
        manifest["limitations"].append(str(exc))
        manifest["result"] = "BLOCKED" if any(
            marker in str(exc)
            for marker in ("REQUIRED", "MISMATCH", "MISSING", "AMBIGUOUS")
        ) else "FAIL"
        return_code = 1
    finally:
        manifest["completed_at"] = utc_now()
        write_manifest(manifest_path, manifest)
        print(manifest_path)

    return return_code


if __name__ == "__main__":
    raise SystemExit(main())
