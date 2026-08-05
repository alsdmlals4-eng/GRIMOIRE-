from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_FILES = (
    "project.godot",
    "src/core/atomic_result_ledger.gd",
    "src/core/resources/glyph_resource_types.gd",
    "src/core/resources/universal_stock_pool.gd",
    "src/core/resources/vault_inventory.gd",
    "src/core/resources/resource_reservation_ledger.gd",
    "src/core/resources/universal_stock_charge.gd",
    "src/core/resources/mana_pool.gd",
    "src/core/spells/spell_commit_request.gd",
    "src/core/spells/atomic_spell_commit_service.gd",
    "src/persistence/glyph_resource_snapshot.gd",
    "src/persistence/save_repository.gd",
    "src/ui/glyph_resource_view_model.gd",
    "tests/test_case.gd",
    "tests/test_runner.gd",
    "tests/unit/test_universal_stock_pool.gd",
    "tests/unit/test_vault_inventory.gd",
    "tests/unit/test_resource_reservation_ledger.gd",
    "tests/unit/test_universal_stock_charge.gd",
    "tests/unit/test_atomic_result_ledger.gd",
    "tests/unit/test_atomic_spell_commit_service.gd",
    "tests/unit/test_glyph_resource_snapshot.gd",
    "tests/unit/test_glyph_resource_view_model.gd",
    "tests/integration/test_glyph_resource_lifecycle.gd",
    ".github/workflows/validate-foundation-poc.yml",
)

FORBIDDEN_ROOTS = (
    "assets/final",
    "audio/final",
    "content/chapters",
    "ml",
    "training-data",
)

FORBIDDEN_GDSCRIPT_TOKENS = (
    "COMPLETED_SPELL_STOCK",
    "AUTO_SOURCE_PRIORITY",
    "TYPED_GLYPH_ONLY_STOCK",
    "stock_target_glyph_id",
    "DRAWING_POWER_BONUS",
)


def main() -> int:
    errors: list[dict[str, str]] = []

    for relative in REQUIRED_FILES:
        if not (ROOT / relative).is_file():
            errors.append({"code": "MISSING_REQUIRED_FILE", "path": relative})

    for relative in FORBIDDEN_ROOTS:
        path = ROOT / relative
        if path.exists():
            errors.append({"code": "FORBIDDEN_ROOT_PRESENT", "path": relative})

    scanned_gdscript_files = 0
    source_root = ROOT / "src"
    if source_root.is_dir():
        for path in sorted(source_root.rglob("*.gd")):
            scanned_gdscript_files += 1
            text = path.read_text(encoding="utf-8")
            for token in FORBIDDEN_GDSCRIPT_TOKENS:
                if token in text:
                    errors.append(
                        {
                            "code": "FORBIDDEN_GDSCRIPT_TOKEN",
                            "path": path.relative_to(ROOT).as_posix(),
                            "token": token,
                        }
                    )

    report = {
        "schema_version": 1,
        "verdict": "PASS" if not errors else "FAIL",
        "required_file_count": len(REQUIRED_FILES),
        "scanned_gdscript_files": scanned_gdscript_files,
        "forbidden_root_count": len(FORBIDDEN_ROOTS),
        "forbidden_token_count": len(FORBIDDEN_GDSCRIPT_TOKENS),
        "errors": errors,
    }
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0 if not errors else 1


if __name__ == "__main__":
    sys.exit(main())
