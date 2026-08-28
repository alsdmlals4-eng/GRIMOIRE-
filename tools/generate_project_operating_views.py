#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
from html import escape
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
    "dashboard": ROOT / "docs" / "PROJECT_OPERATING_DASHBOARD.html",
}


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def canonical_text(value: dict) -> str:
    return json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n"


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def dashboard_text(adapter: dict, adapter_hash: str) -> str:
    project = adapter["project"]
    current = adapter["current_state"]
    authority = adapter["workspace_authority"]
    release = adapter["base_release"]
    validation = adapter["validation"]
    rows = [
        ("Base", f"v{release['version']} / {release['repository']}"),
        ("Current work", current["planning"]),
        ("Implementation", current["implementation"]),
        ("Next product gate", current["next_product_gate"]),
        ("Material-work review gate", validation["adversarial_research_feasibility_gate"]),
        ("External research", validation["external_research"]),
        ("Implementation feasibility", validation["implementation_feasibility"]),
        ("Human / device / performance", f"{current['human_validation']} / {current['device_validation']} / {current['performance_validation']}"),
        ("Human-facing canon", authority["human_facing_canon"]),
        ("Project Home", authority["project_home"]),
        ("Notion", authority["notion_policy"]),
        ("Repository canon", authority["repository_canon"]),
        ("Google Sheets", authority["google_sheets"]),
    ]
    row_html = "\n".join(
        f"      <tr><th scope=\"row\">{escape(label)}</th><td>{escape(value)}</td></tr>"
        for label, value in rows
    )
    return f"""<!doctype html>
<html lang=\"ko\" data-generated=\"true\">
<head>
  <meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
  <title>{escape(project['repository'])} 운영 현황</title>
  <style>
    :root {{ color-scheme: light dark; font-family: system-ui, sans-serif; }}
    body {{ margin: 0 auto; max-width: 72rem; padding: 1.5rem; line-height: 1.55; }}
    table {{ border-collapse: collapse; width: 100%; }}
    th, td {{ border: 1px solid currentColor; padding: .6rem; text-align: left; overflow-wrap: anywhere; }}
    th {{ width: 15rem; }}
  </style>
</head>
<body>
  <header>
    <h1>{escape(project['name'])}</h1>
    <p>Repository-generated current operating view. Runtime and Human evidence are not implied by this document.</p>
  </header>
  <main>
    <table>
      <caption>Current authority and evidence ceiling</caption>
      <tbody>
{row_html}
      </tbody>
    </table>
  </main>
  <footer><small>Source: skills/PROJECT_BASE_ADAPTER.json @ {escape(adapter_hash)}</small></footer>
</body>
</html>
"""


def validate_source(adapter: dict, registry_text: str) -> None:
    expected = adapter["project_registry"]["sha256"]
    actual = sha256_text(registry_text)
    if actual != expected:
        raise ValueError(f"project registry hash mismatch: expected={expected} actual={actual}")
    base = adapter["base_release"]
    expected_base = {
        "version": "9.4.3",
        "release_commit": "7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8",
        "release_evidence_commit": "da33a350d61b8adc52df97fccc7001708a933370",
        "finalization_commit": "0b7c94f38d959efc0fc9442274c60b2e268a3c97",
        "registry_sha256": "693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59",
    }
    for key, value in expected_base.items():
        if base[key] != value:
            raise ValueError(f"Base {key} mismatch: expected={value} actual={base[key]}")


def generate(adapter: dict, adapter_hash: str) -> dict[str, dict | str]:
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

    current = adapter["current_state"]
    project = adapter["project"]
    legacy_sheet = {
        "id": adapter["gdd_sheet"]["id"],
        "role": adapter["gdd_sheet"]["role"],
        "sync_status": adapter["gdd_sheet"]["sync_status"],
        "write_policy": adapter["gdd_sheet"]["write_policy"],
        "retirement_gate": adapter["gdd_sheet"]["retirement_gate"],
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
            "release_line": "v9.4.3",
            "release_state": "BASE_RELEASED",
            "release_commit": adapter["base_release"]["release_commit"],
            "release_evidence_commit": adapter["base_release"]["release_evidence_commit"],
            "registry_sha256": adapter["base_release"]["registry_sha256"],
            "copy_common_skill_bodies": False,
        },
        "project": project,
        "maturity": {
            "level": 3,
            "status": current["implementation"],
            "planning": current["planning"],
            "next_gate": current["next_product_gate"],
        },
        "workspace_authority": adapter["workspace_authority"],
        "legacy_sheet": legacy_sheet,
        "validation": {
            "art_style_01": current["art_style_01"],
            "art_bible_01": current["art_bible_01"],
            "battle_rules_01": current["battle_rules_01"],
            "runtime": current["runtime_validation"],
            "human": current["human_validation"],
            "device": current["device_validation"],
            "performance": current["performance_validation"],
            "full_vertical_slice": current["full_vertical_slice"],
            "ci_gate": adapter["validation"]["ci_gate"],
            "adversarial_gate": adapter["validation"]["adversarial_gate"],
        },
    }

    primary_platform = project["primary_platform"]
    asset_spec_approved = current["asset_spec_01"] == "APPROVED_SPEC"
    project_created = project["godot_project_status"] == "CREATED"
    skill_view = {
        "schema_version": 2,
        "artifact_role": "GENERATED_COMPATIBILITY_VIEW",
        "view_name": "PROJECT_BASE_SKILL_ADAPTER.json",
        "generated": True,
        "canonical_source": "skills/PROJECT_BASE_ADAPTER.json",
        "canonical_source_sha256": adapter_hash,
        "base_release": adapter["base_release"],
        "project": project,
        "platforms": {
            "primary": primary_platform,
            "follow_up": project["follow_up_platform"],
            "touch_input": (
                "PRIMARY_VALIDATION_REQUIRED"
                if primary_platform == "Mobile"
                else "FOLLOW_UP_SEPARATE_VALIDATION"
            ),
            "gamepad": "DEFERRED_NOT_PROMISED",
        },
        "engine": {
            "name": "Godot",
            "version_candidate": project["engine"],
            "project_file": "project.godot" if project_created else "NOT_CREATED",
            "renderer": project.get("renderer", "UNVERIFIED"),
            "autoloads": "TRACKED_PROJECT_GODOT" if project_created else "NOT_CREATED",
            "input_map": "TRACKED_PROJECT_GODOT" if project_created else "NOT_CREATED",
            "main_scene": project.get("main_scene", "NOT_CREATED"),
            "main_scene_role": project.get("main_scene_role", "UNSPECIFIED"),
        },
        "execution_contracts": {
            "current_execution_profile": project["execution_profile"],
            "current_product_stage": project["product_stage"],
            "current_work_mode": project["work_mode"],
            "integrated_v9": "Base:templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md",
        },
        "current_truth_sources": list(adapter["entrypoints"].values())
        + list(adapter["planning_authority"].values()),
        "workspace_authority": adapter["workspace_authority"],
        "legacy_sheet": legacy_sheet,
        "routing": {
            "precedence": adapter["routing"]["precedence"],
            "base_routes": base_routes,
            "project_routes": project_routes,
        },
        "implementation_permissions": {
            "planning_documents": "ALLOWED_ON_APPROVED_SCOPE",
            "operating_tooling": "ALLOWED",
            "codex_build": "OPTIONAL_WITH_APPROVED_SCOPE_AND_EXECUTOR",
            "godot_code_scene_resource_data": "PROJECT_TOOL_AUTHORITY_AND_APPROVED_SCOPE_REQUIRED",
            "main_branch_direct_write": "FORBIDDEN",
            "pr_merge": "USER_APPROVED_SCOPE_SUBJECT_TO_VERIFICATION",
            "product_state": current["implementation"],
        },
        "asset_and_license": {
            "approved_visual_manifest": "docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json",
            "locked_reference_edit": "PROHIBITED",
            "mass_asset_generation": (
                "BOUNDED_APPROVED_WORKSTREAM_ONLY"
                if asset_spec_approved
                else "BLOCKED_BY_ASSET_SPEC"
            ),
            "third_party_inventory": "docs/ASSET_LICENSE_LEDGER.md",
        },
        "validation": adapter["validation"],
    }
    return {
        "snapshot": snapshot,
        "base_view": base_view,
        "skill_view": skill_view,
        "dashboard": dashboard_text(adapter, adapter_hash),
    }


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
                actual = read_json(target) if target.suffix == ".json" else target.read_text(encoding="utf-8")
            except (FileNotFoundError, json.JSONDecodeError) as exc:
                print(f"invalid generated view {target.relative_to(ROOT)}: {exc}", file=sys.stderr)
                failed = True
                continue
            if actual != expected:
                print(f"generated view drift: {target.relative_to(ROOT)}", file=sys.stderr)
                failed = True
        else:
            output_text = canonical_text(expected) if isinstance(expected, dict) else expected
            target.write_text(output_text, encoding="utf-8")
            print(f"wrote {target.relative_to(ROOT)}")

    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
