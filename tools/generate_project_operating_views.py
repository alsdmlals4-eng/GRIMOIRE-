#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
ADAPTER_PATH = ROOT / "skills" / "PROJECT_BASE_ADAPTER.json"
REGISTRY_PATH = ROOT / "skills" / "SKILL_REGISTRY.json"
OUTPUTS = {
    "snapshot": ROOT / "skills" / "PROJECT_SKILL_SNAPSHOT.json",
    "base_view": ROOT / "skills" / "BASE_V9_ADAPTER.json",
    "skill_view": ROOT / "skills" / "PROJECT_BASE_SKILL_ADAPTER.json",
}


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def canonical_text(value: dict) -> str:
    return json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n"


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def validate_source(adapter: dict, registry_text: str) -> None:
    expected = adapter["project_registry"]["sha256"]
    actual = sha256_text(registry_text)
    if actual != expected:
        raise ValueError(f"project registry hash mismatch: expected={expected} actual={actual}")
    base = adapter["base_release"]
    expected_base = {
        "version": "9.4.0",
        "release_commit": "a728712cb776ec98f4875914a580fcf7d0156593",
        "release_evidence_commit": "ef1fba11167e4da0b298123b0c85ebd268191a42",
        "registry_sha256": "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59",
    }
    for key, value in expected_base.items():
        if base[key] != value:
            raise ValueError(f"Base {key} mismatch: expected={value} actual={base[key]}")


def generate(adapter: dict, adapter_hash: str) -> dict[str, dict]:
    base_routes = adapter["routing"]["base_routes"]
    project_routes = adapter["routing"]["project_routes"]
    effective: dict[str, dict] = {}
    for route in base_routes:
        effective[route["route_id"]] = {
            **route,
            "source": "BASE_SHARED",
            "target_route_id": route["route_id"],
        }
    for route in project_routes:
        effective[route["route_id"]] = {
            **route,
            "source": "PROJECT_LOCAL",
            "target_route_id": route["route_id"],
        }

    snapshot = {
        "schema_version": 2,
        "artifact_role": "PROJECT_SKILL_SNAPSHOT",
        "generated": True,
        "canonical_source": "skills/PROJECT_BASE_ADAPTER.json",
        "canonical_source_sha256": adapter_hash,
        "base_registry": {
            "repository": adapter["base_release"]["repository"],
            "release_commit": adapter["base_release"]["release_commit"],
            "release_evidence_commit": adapter["base_release"]["release_evidence_commit"],
            "path": adapter["base_release"]["registry_path"],
            "sha256": adapter["base_release"]["registry_sha256"],
            "hash_definition": "RAW_FILE_BYTES_SHA256",
        },
        "project_registry": adapter["project_registry"],
        "routing_precedence": adapter["routing"]["precedence"],
        "base_routes": base_routes,
        "project_routes": project_routes,
        "effective_routes": effective,
        "aliases": adapter["routing"]["aliases"],
        "generation_status": "CURRENT",
    }

    base_view = {
        "schema_version": 2,
        "artifact_role": "GENERATED_COMPATIBILITY_VIEW",
        "view_name": "BASE_V9_ADAPTER.json",
        "generated": True,
        "canonical_source": "skills/PROJECT_BASE_ADAPTER.json",
        "canonical_source_sha256": adapter_hash,
        "base": {
            "repository": adapter["base_release"]["repository"],
            "release_line": "v9.4.0",
            "release_state": "BASE_RELEASED",
            "release_commit": adapter["base_release"]["release_commit"],
            "release_evidence_commit": adapter["base_release"]["release_evidence_commit"],
            "registry_sha256": adapter["base_release"]["registry_sha256"],
            "copy_common_skill_bodies": False,
        },
        "project": adapter["project"],
        "maturity": {
            "level": 2,
            "status": "PLANNING_AND_ART_BIBLE_APPROVED_IMPLEMENTATION_NOT_STARTED",
            "next_gate": "ASSET_SPEC_01",
        },
        "sheet": {
            "id": adapter["gdd_sheet"]["id"],
            "role": adapter["gdd_sheet"]["role"],
            "sync_status": adapter["gdd_sheet"]["sync_status"],
            "main_sync": adapter["gdd_sheet"]["main_sync"],
            "write_policy": adapter["gdd_sheet"]["write_policy"],
        },
        "validation": {
            "art_style_01": "APPROVED_A_MODIFIED_LOCKED",
            "art_bible_01": "APPROVED_DUAL_STANDARD_ART_BIBLE",
            "battle_rules_01": "APPROVED_SITUATION_RESOLUTION_RULES",
            "runtime": "NOT_RUN",
            "human": "NOT_RUN",
            "ci_gate": "REQUIRED_ON_PULL_REQUEST",
            "adversarial_gate": "REQUIRED_ON_PULL_REQUEST",
        },
    }

    skill_view = {
        "schema_version": 2,
        "artifact_role": "GENERATED_COMPATIBILITY_VIEW",
        "view_name": "PROJECT_BASE_SKILL_ADAPTER.json",
        "generated": True,
        "canonical_source": "skills/PROJECT_BASE_ADAPTER.json",
        "canonical_source_sha256": adapter_hash,
        "base_release": adapter["base_release"],
        "project": adapter["project"],
        "platforms": {
            "primary": "PC",
            "follow_up": "Mobile",
            "touch_input": "FOLLOW_UP_SEPARATE_VALIDATION",
            "gamepad": "DEFERRED_NOT_PROMISED",
        },
        "engine": {
            "name": "Godot",
            "version_candidate": "4.7.1 stable",
            "project_file": "NOT_CREATED",
            "renderer": "UNVERIFIED",
            "autoloads": "NOT_CREATED",
            "input_map": "NOT_CREATED",
            "main_scene": "NOT_CREATED",
        },
        "execution_contracts": {
            "current_execution_profile": "PLANNING_ONLY_PROFILE",
            "current_product_stage": "DEMO_FIRST_VERTICAL_SLICE",
            "current_work_mode": "PLAN",
            "integrated_v9": "Base:templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md",
        },
        "current_truth_sources": list(adapter["entrypoints"].values())
        + list(adapter["planning_authority"].values()),
        "routing": {
            "precedence": adapter["routing"]["precedence"],
            "base_routes": base_routes,
            "project_routes": project_routes,
        },
        "implementation_permissions": {
            "planning_documents": "ALLOWED_ON_APPROVED_PLANNING_BRANCH",
            "operating_tooling": "ALLOWED",
            "codex_build": "FORBIDDEN_IN_CURRENT_PROFILE",
            "godot_code_scene_resource_data": "FORBIDDEN_IN_CURRENT_PROFILE",
            "main_branch_direct_write": "FORBIDDEN",
            "pr_merge": "USER_BATCH_APPROVAL_GRANTED_SUBJECT_TO_VERIFICATION",
        },
        "asset_and_license": {
            "approved_visual_manifest": "docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json",
            "locked_reference_edit": "PROHIBITED",
            "mass_asset_generation": "BLOCKED_BY_ASSET_SPEC",
            "third_party_inventory": "docs/ASSET_LICENSE_LEDGER.md",
        },
        "validation": adapter["validation"],
    }
    return {"snapshot": snapshot, "base_view": base_view, "skill_view": skill_view}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    adapter_text = ADAPTER_PATH.read_text(encoding="utf-8")
    registry_text = REGISTRY_PATH.read_text(encoding="utf-8")
    adapter = json.loads(adapter_text)
    validate_source(adapter, registry_text)
    generated = generate(adapter, sha256_text(adapter_text))

    failed = False
    for key, target in OUTPUTS.items():
        expected = generated[key]
        if args.check:
            try:
                actual = read_json(target)
            except (FileNotFoundError, json.JSONDecodeError) as exc:
                print(f"invalid generated view {target.relative_to(ROOT)}: {exc}", file=sys.stderr)
                failed = True
                continue
            if actual != expected:
                print(f"generated view drift: {target.relative_to(ROOT)}", file=sys.stderr)
                failed = True
        else:
            target.write_text(canonical_text(expected), encoding="utf-8")
            print(f"wrote {target.relative_to(ROOT)}")

    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
