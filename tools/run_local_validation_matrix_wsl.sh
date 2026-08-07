#!/usr/bin/env bash
set -uo pipefail

if [[ $# -lt 4 ]]; then
  echo "usage: $0 EXPECTED_HEAD BASE_SHA PULL_REQUEST EVIDENCE_DIR [GODOT_EXECUTABLE]" >&2
  exit 64
fi

EXPECTED_HEAD="$1"
BASE_SHA="$2"
PULL_REQUEST="$3"
EVIDENCE_DIR="$4"
GODOT_EXECUTABLE="${5:-}"
LANE_ID="wsl-ubuntu-py312"

if ! command -v python3.12 >/dev/null 2>&1; then
  echo "python3.12 is required" >&2
  exit 65
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"
mkdir -p "$EVIDENCE_DIR"

if [[ -z "$GODOT_EXECUTABLE" ]]; then
  python3.12 tools/setup_godot_toolchain.py \
    --install-dir .tooling/godot \
    --json-report "$EVIDENCE_DIR/godot-toolchain-report.json"
  GODOT_EXECUTABLE="$REPO_ROOT/.tooling/godot/4.7.1-stable/linux/Godot_v4.7.1-stable_linux.x86_64"
fi

python3.12 tools/run_local_gut_validation.py \
  --expected-head "$EXPECTED_HEAD" \
  --base-sha "$BASE_SHA" \
  --pull-request "$PULL_REQUEST" \
  --lane-id "$LANE_ID" \
  --expected-python 3.12 \
  --mode full \
  --godot-executable "$GODOT_EXECUTABLE" \
  --evidence-dir "$EVIDENCE_DIR"
