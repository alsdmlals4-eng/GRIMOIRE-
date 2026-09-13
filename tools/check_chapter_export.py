"""Audit the first-chapter static resource closure, not all historical assets.

Does not edit the preset. Dynamic resource paths need an explicit design review.
"""
import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ENTRY = "res://src/ui/story/story_menu.tscn"
TEXT_TYPES = {".gd", ".tscn", ".tres", ".gdshader"}


def resources():
    pending, seen = [ENTRY], set()
    while pending:
        resource = pending.pop()
        if resource in seen:
            continue
        path = ROOT / resource.removeprefix("res://")
        if not path.is_file():
            raise ValueError(f"Missing chapter dependency: {resource}")
        seen.add(resource)
        if path.suffix not in TEXT_TYPES:
            continue
        for value in re.findall(r'[\"\'](res://[^\"\'\r\n]+)[\"\']', path.read_text(encoding="utf-8-sig")):
            target = ROOT / value.removeprefix("res://")
            if target.is_file():
                pending.append(value)
            elif target.suffix in TEXT_TYPES | {".png", ".ttf", ".otf"}:
                raise ValueError(f"Missing literal dependency: {value}")
    return sorted(seen)


def audit(preset):
    required = set(resources())
    reports = []
    blocks = re.findall(r'\[preset\.(\d+)\]\s*(.*?)(?=\[preset\.|\Z)', preset, re.S)
    for number, block in blocks:
        expected = set(required)
        if number == "1":
            expected.update({"res://tests/export_storage_probe.tscn", "res://tests/run_export_storage_probe.gd"})
        match = re.search(r'export_files=PackedStringArray\((.*?)\)', block)
        entries = re.findall(r'"([^"]+)"', match[1]) if match else []
        included = set(entries)
        feature = 'custom_features="storage_qa"' if number == "1" else 'custom_features=""'
        reports.append({"preset":int(number), "missing":sorted(expected-included),
                        "unused":sorted(included-expected), "duplicate":len(entries)!=len(included),
                        "feature_valid":feature in block})
    valid = sorted(item["preset"] for item in reports) == [0,1]
    valid = valid and all(not item["missing"] and not item["unused"] and not item["duplicate"] and item["feature_valid"] for item in reports)
    return {"resources":len(required), "presets":reports, "valid":valid}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--print-resources", action="store_true")
    args = parser.parse_args()
    required = resources()
    if args.print_resources:
        print(json.dumps(required))
        return 0
    preset = (ROOT / "export_presets.cfg").read_text(encoding="utf-8-sig")
    result = audit(preset)
    print(json.dumps(result))
    return 0 if result["valid"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
