from __future__ import annotations

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / "tools/generate_project_operating_views.py"

text = GENERATOR.read_text(encoding="utf-8")
replacements = {
    '"version": "9.4.2"': '"version": "9.4.3"',
    '"release_commit": "dd705d7f48a7919187bc0507610ba5fc5b43a658"': '"release_commit": "7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8"',
    '"release_evidence_commit": "0c6cdd128bf1f5782e96b3a6240c9585f8d1ef6d"': '"release_evidence_commit": "da33a350d61b8adc52df97fccc7001708a933370"',
    '"finalization_commit": "ac9466edc2d93b59f274c9ac55ca719eba2809e3"': '"finalization_commit": "0b7c94f38d959efc0fc9442274c60b2e268a3c97"',
    '"release_line": "v9.4.2"': '"release_line": "v9.4.3"',
}
for old, new in replacements.items():
    if old not in text:
        raise SystemExit(f"missing generator token: {old}")
    text = text.replace(old, new)
GENERATOR.write_text(text, encoding="utf-8")
subprocess.run([sys.executable, str(GENERATOR)], cwd=ROOT, check=True)
