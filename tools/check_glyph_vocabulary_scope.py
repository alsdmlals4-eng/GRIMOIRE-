from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
VOCABULARY = ROOT / "data" / "glyphs" / "v1" / "glyph_vocabulary_v1.json"
TEMPLATE_DIR = ROOT / "data" / "glyphs" / "v1" / "slice_templates"
EXPECTED_RUNTIME = ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]
EXPECTED_RUNTIME_SET = set(EXPECTED_RUNTIME)
EXPECTED_MAIN_COUNT = 10
EXPECTED_SUPPORT_COUNT = 10
EXPECTED_ENTRY_COUNT = 20

REQUIRED_FILES = [
    "src/input/glyph_definition.gd",
    "src/input/glyph_template_repository.gd",
    "src/input/point_cloud_math.gd",
    "src/input/dollar_one_recognizer.gd",
    "src/input/dollar_n_recognizer.gd",
    "src/input/recognition_candidate.gd",
    "src/input/glyph_recognition_service.gd",
    "src/input/focus_scribe_recognition_coordinator.gd",
    "src/ui/glyph_writing_view_model.gd",
    "src/ui/mobile_safe_root.gd",
    "src/ui/mobile_safe_root.tscn",
    "tests/unit/test_glyph_definition.gd",
    "tests/unit/test_glyph_template_repository.gd",
    "tests/unit/test_dollar_one_recognizer.gd",
    "tests/unit/test_dollar_n_recognizer.gd",
    "tests/unit/test_glyph_recognition_service.gd",
    "tests/unit/test_focus_scribe_recognition.gd",
    "tests/unit/test_glyph_writing_view_model.gd",
    "tests/integration/test_slice_glyph_recognition.gd",
    "tests/integration/test_mobile_safe_root.gd",
    "tests/test_glyph_confusion_report.py",
    "tests/test_glyph_vocabulary_scope.py",
    "tools/build_glyph_confusion_report.py",
    "tools/check_glyph_vocabulary_scope.py",
    "artifacts/foundation-poc/glyph-recognition-thresholds.json",
]

PROHIBITED_ROOTS = [
    ROOT / "assets" / "final",
    ROOT / "ml",
    ROOT / "training-data",
]
PROHIBITED_DEPENDENCY_TOKENS = [
    "httprequest",
    "httpclient",
    "websocketpeer",
    "tensorflow",
    "pytorch",
    "torch.",
    "onnx",
    "cloud_recognition",
    "remote_recognition",
    "training_data",
]
PROHIBITED_PRODUCTION_CLAIMS = [
    "production_ready",
    "product_quality_pass",
    "human_validated",
    "physical_touch_pass",
]
SCAN_ROOTS = [
    ROOT / "src" / "input",
    ROOT / "src" / "ui",
    ROOT / "data" / "glyphs" / "v1",
]


def _read_json(path: Path, errors: list[str]) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        errors.append(f"{path.relative_to(ROOT)}: invalid JSON: {exc}")
        return None


def _scan_text_contracts(errors: list[str]) -> int:
    scanned = 0
    for root in SCAN_ROOTS:
        if not root.exists():
            continue
        for path in sorted(root.rglob("*")):
            if not path.is_file() or path.suffix.lower() not in {".gd", ".tscn", ".json"}:
                continue
            scanned += 1
            try:
                lowered = path.read_text(encoding="utf-8").lower()
            except (OSError, UnicodeDecodeError) as exc:
                errors.append(f"{path.relative_to(ROOT)}: unreadable text: {exc}")
                continue
            for token in PROHIBITED_DEPENDENCY_TOKENS:
                if token in lowered:
                    errors.append(f"{path.relative_to(ROOT)}: prohibited recognition dependency token {token}")
            for token in PROHIBITED_PRODUCTION_CLAIMS:
                if token in lowered:
                    errors.append(f"{path.relative_to(ROOT)}: prohibited production claim {token}")
    return scanned


def main() -> int:
    errors: list[str] = []

    for relative in REQUIRED_FILES:
        if not (ROOT / relative).is_file():
            errors.append(f"missing required file: {relative}")
    for prohibited in PROHIBITED_ROOTS:
        if prohibited.exists():
            errors.append(f"prohibited root exists: {prohibited.relative_to(ROOT)}")

    vocabulary = _read_json(VOCABULARY, errors)
    entries: list[dict[str, Any]] = []
    runtime_ids: list[str] = []
    main_count = 0
    support_count = 0
    if isinstance(vocabulary, dict):
        if vocabulary.get("schema_version") != 1:
            errors.append("vocabulary schema_version must be 1")
        if vocabulary.get("decision_id") != "GM-GLYPH-VOCABULARY-V1-01":
            errors.append("vocabulary decision_id mismatch")
        raw_entries = vocabulary.get("entries")
        if not isinstance(raw_entries, list) or not all(isinstance(entry, dict) for entry in raw_entries):
            errors.append("vocabulary entries must be a list of objects")
        else:
            entries = raw_entries
            ids = [str(entry.get("id", "")) for entry in entries]
            if len(entries) != EXPECTED_ENTRY_COUNT:
                errors.append(f"semantic entry count must be {EXPECTED_ENTRY_COUNT}")
            if len(set(ids)) != len(ids):
                errors.append("semantic glyph ids must be unique")
            main_count = sum(entry.get("role") == "MAIN" for entry in entries)
            support_count = sum(entry.get("role") == "SUPPORT" for entry in entries)
            if main_count != EXPECTED_MAIN_COUNT:
                errors.append(f"Main glyph count must be {EXPECTED_MAIN_COUNT}")
            if support_count != EXPECTED_SUPPORT_COUNT:
                errors.append(f"Support glyph count must be {EXPECTED_SUPPORT_COUNT}")
            runtime_ids = [str(entry.get("id")) for entry in entries if entry.get("slice_enabled") is True]
            if runtime_ids != EXPECTED_RUNTIME:
                errors.append(f"runtime glyph ids must be exactly {EXPECTED_RUNTIME}")
            for entry in entries:
                if entry.get("ornament_is_recognition_input") is not False:
                    errors.append(f"{entry.get('id', '<missing>')}: ornament must remain display-only")
        if vocabulary.get("slice") != EXPECTED_RUNTIME:
            errors.append("vocabulary slice list does not match the approved runtime order")
        main_list = vocabulary.get("main")
        support_list = vocabulary.get("support")
        if not isinstance(main_list, list) or len(main_list) != EXPECTED_MAIN_COUNT:
            errors.append("vocabulary main list must contain ten ids")
        if not isinstance(support_list, list) or len(support_list) != EXPECTED_SUPPORT_COUNT:
            errors.append("vocabulary support list must contain ten ids")

    template_files = sorted(TEMPLATE_DIR.glob("*.json")) if TEMPLATE_DIR.is_dir() else []
    template_glyph_ids: list[str] = []
    template_ids: list[str] = []
    for path in template_files:
        template = _read_json(path, errors)
        if not isinstance(template, dict):
            continue
        glyph_id = str(template.get("glyph_id", ""))
        template_id = str(template.get("template_id", ""))
        template_glyph_ids.append(glyph_id)
        template_ids.append(template_id)
        if glyph_id not in EXPECTED_RUNTIME_SET:
            errors.append(f"{path.relative_to(ROOT)}: runtime template for non-Slice glyph {glyph_id}")
        if any("ornament" in str(key).lower() for key in template):
            errors.append(f"{path.relative_to(ROOT)}: ornament fields are prohibited in recognition templates")
        strokes = template.get("strokes")
        if not isinstance(strokes, list) or not 1 <= len(strokes) <= 3:
            errors.append(f"{path.relative_to(ROOT)}: template must contain one to three strokes")
    if len(template_files) != len(EXPECTED_RUNTIME):
        errors.append(f"runtime template file count must be {len(EXPECTED_RUNTIME)}")
    if set(template_glyph_ids) != EXPECTED_RUNTIME_SET or len(template_glyph_ids) != len(EXPECTED_RUNTIME):
        errors.append("runtime templates must cover each approved Slice glyph exactly once")
    if len(set(template_ids)) != len(template_ids):
        errors.append("template ids must be unique")

    service_path = ROOT / "src" / "input" / "glyph_recognition_service.gd"
    coordinator_path = ROOT / "src" / "input" / "focus_scribe_recognition_coordinator.gd"
    service_text = service_path.read_text(encoding="utf-8") if service_path.is_file() else ""
    coordinator_text = coordinator_path.read_text(encoding="utf-8") if coordinator_path.is_file() else ""
    for required_status in [
        "LOW_CONFIDENCE_REQUIRES_RETRY",
        "AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION",
        "STALE_RECOGNITION_RESULT",
    ]:
        if required_status not in service_text:
            errors.append(f"recognition service missing guarded status {required_status}")
    for required_contract in [
        "RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED",
        "complete_scribe",
        "INVALID_SCRIBE_RESERVATION",
    ]:
        if required_contract not in coordinator_text:
            errors.append(f"Focus Scribe coordinator missing contract {required_contract}")

    thresholds_path = ROOT / "artifacts" / "foundation-poc" / "glyph-recognition-thresholds.json"
    thresholds = _read_json(thresholds_path, errors) if thresholds_path.is_file() else None
    if isinstance(thresholds, dict):
        if thresholds.get("decision_id") != "GM-GLYPH-VOCABULARY-V1-01":
            errors.append("threshold preregistration decision_id mismatch")
        if thresholds.get("evidence_scope") != "SYNTHETIC_FIXTURES_ONLY":
            errors.append("threshold evidence scope must remain synthetic-only")
        if thresholds.get("physical_device") != "NOT_RUN":
            errors.append("physical device status cannot be promoted by automated scope checks")
        if thresholds.get("human_comprehension") != "NOT_RUN":
            errors.append("human comprehension status cannot be promoted by automated scope checks")

    scanned_files = _scan_text_contracts(errors)
    report = {
        "schema_version": 1,
        "verdict": "PASS" if not errors else "FAIL",
        "decision_id": "GM-GLYPH-VOCABULARY-V1-01",
        "semantic_entry_count": len(entries),
        "main_count": main_count,
        "support_count": support_count,
        "runtime_glyph_ids": runtime_ids,
        "runtime_template_count": len(template_files),
        "scanned_recognition_files": scanned_files,
        "prohibited_root_count": len(PROHIBITED_ROOTS),
        "prohibited_dependency_token_count": len(PROHIBITED_DEPENDENCY_TOKENS),
        "errors": len(errors),
        "error_messages": errors,
    }
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
