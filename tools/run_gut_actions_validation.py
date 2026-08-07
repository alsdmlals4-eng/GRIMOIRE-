from __future__ import annotations

import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any, Mapping, Sequence

from tools import run_local_gut_validation as validator
from tools.audit_gut_vendor import build_audit_report
from tools.gut_failure_evidence import render_failure_evidence, resolve_evidence_dir


validator.DECISION_ID = "GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01"

OFFICIAL_GUT_REPOSITORY = "https://github.com/bitwes/Gut.git"
APPROVAL_REQUIRED_MARKER = "GUT_VENDOR_TEXT_NORMALIZATION_EQUIVALENCE_APPROVAL_REQUIRED"


def _argument_value(
    argv: Sequence[str], name: str, default: str | None = None
) -> str | None:
    for index, argument in enumerate(argv):
        if argument == name and index + 1 < len(argv):
            return argv[index + 1]
        if argument.startswith(f"{name}="):
            return argument.split("=", 1)[1]
    return default


def _run_checked(command: Sequence[str], cwd: Path) -> None:
    completed = subprocess.run(
        list(command),
        cwd=cwd,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if completed.stdout:
        print(completed.stdout, end="" if completed.stdout.endswith("\n") else "\n")
    if completed.returncode != 0:
        raise RuntimeError(
            f"COMMAND_FAILED:{subprocess.list2cmdline(list(command))}:"
            f"{completed.returncode}"
        )


def prepare_official_gut_checkout(root: Path) -> Path:
    checkout = root / ".tooling/gut-official-v9.7.1"
    if checkout.exists():
        shutil.rmtree(checkout)
    checkout.mkdir(parents=True)
    _run_checked(["git", "init"], checkout)
    _run_checked(["git", "config", "core.autocrlf", "false"], checkout)
    _run_checked(["git", "remote", "add", "origin", OFFICIAL_GUT_REPOSITORY], checkout)
    _run_checked(
        ["git", "fetch", "--depth", "1", "origin", validator.PINNED_GUT_COMMIT],
        checkout,
    )
    _run_checked(["git", "checkout", "--detach", "FETCH_HEAD"], checkout)
    return checkout


def normalized_audit_allows_runtime(report: Mapping[str, Any]) -> bool:
    return report.get("result") == "FULL_TREE_TEXT_NORMALIZED_IDENTICAL"


def apply_pending_vendor_approval(
    manifest_path: Path,
    audit_path: Path,
    *,
    official_tree: str,
    actual_tree: str,
    runtime_return_code: int,
) -> int:
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    vendor = manifest.setdefault("vendor", {})
    vendor.update(
        {
            "expected_tree": official_tree,
            "actual_tree": actual_tree,
            "status": "AUDIT_EQUIVALENT_PENDING_USER_APPROVAL",
            "audit_result": audit.get("result"),
            "audit_path": audit_path.as_posix(),
        }
    )
    limitations = manifest.setdefault("limitations", [])
    if APPROVAL_REQUIRED_MARKER not in limitations:
        limitations.append(APPROVAL_REQUIRED_MARKER)
    if runtime_return_code == 0:
        manifest["result"] = "BLOCKED"
    manifest_path.write_text(
        json.dumps(manifest, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    return 1


def _attach_failed_audit(
    manifest_path: Path,
    audit_path: Path,
    report: Mapping[str, Any],
) -> None:
    if not manifest_path.is_file():
        return
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    vendor = manifest.setdefault("vendor", {})
    vendor.update(
        {
            "audit_result": report.get("result"),
            "audit_path": audit_path.as_posix(),
        }
    )
    manifest_path.write_text(
        json.dumps(manifest, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )


def main() -> int:
    argv = sys.argv[1:]
    root = Path(validator.git_text(Path.cwd(), "rev-parse", "--show-toplevel")).resolve()
    evidence_dir = resolve_evidence_dir(argv)
    if not evidence_dir.is_absolute():
        evidence_dir = root / evidence_dir
    manifest_path = evidence_dir / "manifest.json"
    audit_path = evidence_dir / "gut-vendor-audit.json"
    mode = _argument_value(argv, "--mode", "contract")

    pending_approval: dict[str, str] | None = None
    audit_report: Mapping[str, Any] | None = None
    if mode in {"vendor", "full"}:
        actual_tree = validator.git_text(root, "rev-parse", "HEAD:addons/gut")
        if actual_tree != validator.PINNED_GUT_TREE:
            official_tree = validator.PINNED_GUT_TREE
            official_checkout = prepare_official_gut_checkout(root)
            audit_report = build_audit_report(
                official_checkout,
                root,
                expected_project_head=_argument_value(argv, "--expected-head"),
            )
            audit_path.parent.mkdir(parents=True, exist_ok=True)
            audit_path.write_text(
                json.dumps(
                    audit_report,
                    ensure_ascii=False,
                    sort_keys=True,
                    indent=2,
                )
                + "\n",
                encoding="utf-8",
            )
            print(audit_path)
            print("--- GUT vendor audit ---")
            print(
                json.dumps(
                    audit_report,
                    ensure_ascii=False,
                    sort_keys=True,
                    indent=2,
                )
            )
            if normalized_audit_allows_runtime(audit_report):
                pending_approval = {
                    "official_tree": official_tree,
                    "actual_tree": actual_tree,
                }
                validator.PINNED_GUT_TREE = actual_tree

    return_code = validator.main(argv)

    if pending_approval is not None:
        return_code = apply_pending_vendor_approval(
            manifest_path,
            audit_path,
            official_tree=pending_approval["official_tree"],
            actual_tree=pending_approval["actual_tree"],
            runtime_return_code=return_code,
        )
    elif audit_report is not None:
        _attach_failed_audit(manifest_path, audit_path, audit_report)

    if return_code != 0:
        print(render_failure_evidence(evidence_dir))
    return return_code


if __name__ == "__main__":
    raise SystemExit(main())
