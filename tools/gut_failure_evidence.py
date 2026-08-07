from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Mapping, Sequence


def resolve_evidence_dir(argv: Sequence[str]) -> Path:
    for index, argument in enumerate(argv):
        if argument == "--evidence-dir" and index + 1 < len(argv):
            return Path(argv[index + 1])
        if argument.startswith("--evidence-dir="):
            return Path(argument.split("=", 1)[1])
    return Path("artifacts/local-validation")


def render_failure_evidence(evidence_dir: Path) -> str:
    manifest_path = evidence_dir / "manifest.json"
    if not manifest_path.is_file():
        return f"validation manifest missing: {manifest_path}"

    data: Mapping[str, Any] = json.loads(manifest_path.read_text(encoding="utf-8"))
    sections = [
        "--- validation manifest ---",
        json.dumps(data, ensure_ascii=False, sort_keys=True, indent=2),
    ]
    limitations = {str(item) for item in data.get("limitations", [])}

    for command in data.get("commands", []):
        exit_code = command.get("exit_code")
        name = str(command.get("name", "unknown-command"))
        diagnostic_success = "JUNIT_MISSING" in limitations and name == "gut-headless"
        if exit_code == 0 and not diagnostic_success:
            continue
        log_path = Path(str(command.get("log_path", "")))
        label = "diagnostic command log" if diagnostic_success else "failed command log"
        sections.append(f"--- {label}: {name} ---")
        if log_path.is_file():
            sections.append(log_path.read_text(encoding="utf-8", errors="replace"))
        else:
            sections.append(f"log missing: {log_path}")

    return "\n".join(sections)
