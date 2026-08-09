# GUT 9.7.1 Formal Adoption Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Adopt the already-vendored GUT 9.7.1 as GRIMOIRE's formal test authority through an actual product-test consumption path, Godot 4.7.1 headless CI, JUnit evidence, product-file immutability, legacy-runner parity, and fail-closed HiGodot authoring receipts.

**Architecture:** Keep HiGodot/Godot AI as the sole mutation authority for `project.godot`, Scene, Node, Resource, and Project Settings. Adopt GUT through its command-line runner without enabling the GUT editor plugin, so the first adoption PR does not modify protected Godot serialization. Keep the existing custom runner as a compatibility lane until required-contract parity is proven.

**Tech Stack:** Godot 4.7.1, GDScript, GUT 9.7.1, Python 3.12 `unittest`, GitHub Actions, JUnit XML, SHA-256 manifests.

## Global Constraints

- Decision ID: `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01`.
- Project Base pin remains `9.4.3`; Base `main` commit `4f98f968a377f7b6a11aafa4fc94d11bddbebedc` is observed policy input, not an adopted pin update.
- GUT source is `https://github.com/bitwes/Gut`, version `9.7.1`, license `MIT`, Godot compatibility `4.7.x`.
- Initial adoption mode is `CLI_ONLY_WITHOUT_EDITOR_PLUGIN`.
- Do not modify `project.godot`, `*.tscn`, `*.tres`, or `*.res` in the initial adoption PR.
- `EDITOR_PLUGIN_ENABLEMENT: DEFERRED_UNTIL_HIGODOT_RECEIPT`.
- GUT may read and execute product artifacts but must not mutate them.
- HiGodot must not modify `tests/**`, `.gutconfig.json`, assertion expectations, fixtures, or CI success criteria.
- Existing `res://tests/test_runner.gd` remains the compatibility lane until parity is proven.
- PR #82 stays `PAUSED_AFTER_TASK1_GREEN`; Task 2 does not resume from this plan alone.
- Windows and Android share one game-logic/data core. This adoption changes test infrastructure only and must not create platform-specific game logic.
- Device, performance, screen-reader, human, Windows export, and Android export validation remain `NOT_RUN` unless separately executed.

---

### Task 1: Freeze the adoption contract and RED gate

**Files:**
- Create: `tests/test_gut_formal_adoption_contract.py`
- Modify: `.github/workflows/validate-godot-authoring-gut-authority.yml`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`

**Interfaces:**
- Consumes: vendored metadata in `addons/gut/plugin.cfg`, `addons/gut/versions.json`, and `addons/gut/LICENSE.md`.
- Produces: a fail-closed static contract that later tasks must satisfy.

- [ ] **Step 1: Write the failing Python contract test**

```python
from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / ".gutconfig.json"
GUT_TEST = ROOT / "tests/gut/integration/test_gut_product_smoke.gd"
WORKFLOW = ROOT / ".github/workflows/validate-gut-formal-adoption.yml"
STATE = ROOT / "docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json"


class GutFormalAdoptionContractTests(unittest.TestCase):
    def test_cli_only_consumption_files_exist(self) -> None:
        self.assertTrue(CONFIG.is_file())
        self.assertTrue(GUT_TEST.is_file())
        self.assertTrue(WORKFLOW.is_file())

    def test_state_remains_blocked_until_runtime_evidence(self) -> None:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        self.assertEqual("CLI_ONLY_WITHOUT_EDITOR_PLUGIN", state["gut"]["adoption_mode"])
        self.assertFalse(state["gut"]["project_plugin_enabled"])
        self.assertEqual("ADOPTION_IMPLEMENTATION_IN_PROGRESS", state["gut"]["current_consumption"])
        self.assertEqual("BLOCKED_PENDING_GUT_FORMAL_ADOPTION", state["entry_gate"]["status"])


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Add the RED test to the existing authority workflow**

Append this command after the current authority contract command:

```yaml
- name: Validate formal-adoption implementation contract
  run: python -m unittest tests.test_gut_formal_adoption_contract -v
```

- [ ] **Step 3: Run the focused contract and confirm RED**

Run:

```bash
python -m unittest tests.test_gut_formal_adoption_contract -v
```

Expected: failure because `.gutconfig.json`, the product smoke test, and the adoption workflow do not exist.

- [ ] **Step 4: Commit the RED contract**

```bash
git add tests/test_gut_formal_adoption_contract.py .github/workflows/validate-godot-authoring-gut-authority.yml
git commit -m "test: require actual GUT formal-adoption consumption"
```

---

### Task 2: Add CLI-only GUT configuration and real product smoke test

**Files:**
- Create: `.gutconfig.json`
- Create: `tests/gut/integration/test_gut_product_smoke.gd`
- Test: `tests/test_gut_formal_adoption_contract.py`

**Interfaces:**
- Consumes: `addons/gut/gut_cmdln.gd`, `res://src/core/star/glyph_definition.gd`, and `res://src/ui/star_circuit_harness.tscn`.
- Produces: the first real GUT lane that loads project code and an actual project Scene without editing either.

- [ ] **Step 1: Add the minimal GUT configuration**

Create `.gutconfig.json`:

```json
{
  "dirs": ["res://tests/gut"],
  "include_subdirs": true,
  "prefix": "test_",
  "suffix": ".gd",
  "should_exit": true,
  "should_exit_on_success": true,
  "log_level": 1,
  "junit_xml_file": "user://gut-results.xml"
}
```

- [ ] **Step 2: Add a product-code and Scene smoke test**

Create `tests/gut/integration/test_gut_product_smoke.gd`:

```gdscript
extends GutTest

const GlyphDefinition = preload("res://src/core/star/glyph_definition.gd")
const HARNESS_SCENE := preload("res://src/ui/star_circuit_harness.tscn")


func test_glyph_definition_is_real_product_code() -> void:
    var definition = GlyphDefinition.new()
    assert_not_null(definition)


func test_star_harness_scene_instantiates_without_mutation() -> void:
    var instance = HARNESS_SCENE.instantiate()
    add_child_autofree(instance)
    assert_not_null(instance)
    assert_true(instance.is_inside_tree())
```

Before committing, inspect the actual constructor contract of `glyph_definition.gd`. If it requires constructor arguments, update only the test inputs to use the real public API; do not change product code to make the smoke test easier.

- [ ] **Step 3: Run the static adoption contract**

```bash
python -m unittest tests.test_gut_formal_adoption_contract -v
```

Expected: PASS for file existence and CLI-only configuration assertions.

- [ ] **Step 4: Run GUT directly with Godot 4.7.1**

```bash
.tooling/godot/4.7.1-stable/linux/Godot_v4.7.1-stable_linux.x86_64 \
  --headless --path . \
  -s addons/gut/gut_cmdln.gd \
  -gconfig=res://.gutconfig.json \
  -gjunit_xml_file=user://gut-results.xml \
  -gexit
```

Expected: exit code `0`, at least two passing tests, zero failures, and a non-empty JUnit XML file under the isolated CI user-data directory.

- [ ] **Step 5: Commit the minimal consumption path**

```bash
git add .gutconfig.json tests/gut/integration/test_gut_product_smoke.gd
git commit -m "test: consume product code through GUT 9.7.1"
```

---

### Task 3: Implement `GUT_PRODUCT_MUTATION_HASH_GATE`

**Files:**
- Create: `tools/hash_gut_protected_products.py`
- Create: `tests/test_gut_product_mutation_hash_gate.py`
- Modify: `.github/workflows/validate-gut-formal-adoption.yml`

**Interfaces:**
- Consumes: repository paths `project.godot`, `src/**`, `assets/**`, `addons/godot_ai/**`, `**/*.tscn`, `**/*.tres`, and `**/*.res`.
- Produces: deterministic JSON manifests whose pre/post equality proves that GUT did not mutate product artifacts.

- [ ] **Step 1: Write the failing hash-manifest test**

```python
from pathlib import Path
import tempfile
import unittest

from tools.hash_gut_protected_products import build_manifest


class GutProductMutationHashGateTests(unittest.TestCase):
    def test_manifest_changes_when_a_protected_file_changes(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "src").mkdir()
            target = root / "src/example.gd"
            target.write_text("one", encoding="utf-8")
            before = build_manifest(root)
            target.write_text("two", encoding="utf-8")
            after = build_manifest(root)
            self.assertNotEqual(before, after)
```

- [ ] **Step 2: Confirm RED**

```bash
python -m unittest tests.test_gut_product_mutation_hash_gate -v
```

Expected: import failure because `tools/hash_gut_protected_products.py` does not exist.

- [ ] **Step 3: Implement the deterministic manifest**

```python
from __future__ import annotations

import hashlib
import json
from pathlib import Path

PROTECTED_ROOTS = ("project.godot", "src", "assets", "addons/godot_ai")
PROTECTED_SUFFIXES = (".tscn", ".tres", ".res")


def build_manifest(root: Path) -> dict[str, str]:
    files: set[Path] = set()
    for item in PROTECTED_ROOTS:
        path = root / item
        if path.is_file():
            files.add(path)
        elif path.is_dir():
            files.update(p for p in path.rglob("*") if p.is_file())
    files.update(
        p for p in root.rglob("*")
        if p.is_file() and p.suffix.lower() in PROTECTED_SUFFIXES
    )
    return {
        path.relative_to(root).as_posix(): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sorted(files)
    }


def main() -> int:
    root = Path.cwd()
    print(json.dumps(build_manifest(root), ensure_ascii=False, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
```

- [ ] **Step 4: Add pre/post comparison around the GUT command**

```yaml
- name: Hash protected products before GUT
  run: python tools/hash_gut_protected_products.py > gut-products-before.json

- name: Run GUT 9.7.1 product tests
  run: |
    set -o pipefail
    export HOME="$RUNNER_TEMP/gut-home"
    mkdir -p "$HOME"
    .tooling/godot/4.7.1-stable/linux/Godot_v4.7.1-stable_linux.x86_64 \
      --headless --path . -s addons/gut/gut_cmdln.gd \
      -gconfig=res://.gutconfig.json \
      -gjunit_xml_file=user://gut-results.xml -gexit | tee gut-headless.log

- name: Verify GUT did not mutate product files
  run: |
    python tools/hash_gut_protected_products.py > gut-products-after.json
    cmp gut-products-before.json gut-products-after.json
```

- [ ] **Step 5: Verify GREEN and commit**

```bash
python -m unittest tests.test_gut_product_mutation_hash_gate -v
git add tools/hash_gut_protected_products.py tests/test_gut_product_mutation_hash_gate.py .github/workflows/validate-gut-formal-adoption.yml
git commit -m "test: prove GUT leaves product artifacts unchanged"
```

---

### Task 4: Add JUnit CI and evidence upload

**Files:**
- Create: `.github/workflows/validate-gut-formal-adoption.yml`
- Create: `tests/test_gut_formal_adoption_workflow.py`

**Interfaces:**
- Consumes: Godot installer `tools/setup_godot_toolchain.py`, `.gutconfig.json`, GUT CLI, and hash manifest tool.
- Produces: exact-HEAD GUT logs, JUnit XML, toolchain report, and pre/post hash manifests.

- [ ] **Step 1: Write a failing workflow contract**

The test must assert the workflow contains all of these markers:

```python
required = (
    "Godot 4.7.1",
    "addons/gut/gut_cmdln.gd",
    "-gconfig=res://.gutconfig.json",
    "-gjunit_xml_file",
    "gut-results.xml",
    "gut-products-before.json",
    "gut-products-after.json",
    "actions/upload-artifact@v4",
)
```

- [ ] **Step 2: Confirm RED**

```bash
python -m unittest tests.test_gut_formal_adoption_workflow -v
```

Expected: missing workflow failure.

- [ ] **Step 3: Create the workflow**

Use `pull_request`, `push` to `main`, and `workflow_dispatch`. The job must:

1. Check out the exact workflow SHA.
2. Install Python 3.12.
3. Run static contract tests.
4. Install verified Godot 4.7.1 through `tools/setup_godot_toolchain.py`.
5. Run clean headless import.
6. Hash protected products.
7. Run GUT CLI with JUnit.
8. Re-hash and compare.
9. Run the existing custom runner.
10. Upload all evidence with `if: always()`.

- [ ] **Step 4: Run the workflow contract and commit**

```bash
python -m unittest tests.test_gut_formal_adoption_workflow -v
git add .github/workflows/validate-gut-formal-adoption.yml tests/test_gut_formal_adoption_workflow.py
git commit -m "ci: validate GUT formal adoption with JUnit evidence"
```

---

### Task 5: Prove `LEGACY_TO_GUT_COVERAGE_PARITY`

**Files:**
- Create: `docs/validation/GUT_LEGACY_REQUIRED_CONTRACT_PARITY.json`
- Create: `tests/test_gut_legacy_contract_parity.py`
- Create or modify: `tests/gut/unit/test_glyph_definition.gd`
- Modify: `.github/workflows/validate-gut-formal-adoption.yml`

**Interfaces:**
- Consumes: suite list in `tests/test_runner.gd` and GUT test paths under `tests/gut/**`.
- Produces: machine-readable mapping from required product contracts to both test lanes.

- [ ] **Step 1: Write the failing parity test**

The test must load the JSON mapping and require each entry to contain:

```json
{
  "contract_id": "GLYPH_DEFINITION_CORE",
  "legacy_suite": "res://tests/unit/test_glyph_definition.gd",
  "gut_suite": "res://tests/gut/unit/test_glyph_definition.gd",
  "required": true
}
```

It must also assert that every referenced path exists.

- [ ] **Step 2: Confirm RED**

```bash
python -m unittest tests.test_gut_legacy_contract_parity -v
```

Expected: missing parity manifest.

- [ ] **Step 3: Add one real parity pair**

Create the GUT test using the same public behavior asserted by the legacy suite. Do not copy the custom assertion framework into GUT. Record both paths in the parity JSON.

- [ ] **Step 4: Run both lanes**

```bash
Godot --headless --path . --script res://tests/test_runner.gd
Godot --headless --path . -s addons/gut/gut_cmdln.gd \
  -gconfig=res://.gutconfig.json -gjunit_xml_file=user://gut-results.xml -gexit
python -m unittest tests.test_gut_legacy_contract_parity -v
```

Expected: both lanes pass and the parity manifest validator passes.

- [ ] **Step 5: Commit**

```bash
git add docs/validation/GUT_LEGACY_REQUIRED_CONTRACT_PARITY.json tests/gut/unit/test_glyph_definition.gd tests/test_gut_legacy_contract_parity.py .github/workflows/validate-gut-formal-adoption.yml
git commit -m "test: prove required legacy and GUT contract parity"
```

---

### Task 6: Implement `HIGODOT_AUTHORING_RECEIPT_GATE`

**Files:**
- Create: `tools/check_higodot_authoring_receipt.py`
- Create: `tests/test_higodot_authoring_receipt_gate.py`
- Create: `docs/validation/HIGODOT_AUTHORING_RECEIPT_SCHEMA.json`
- Modify: `.github/workflows/validate-gut-formal-adoption.yml`

**Interfaces:**
- Consumes: Git diff against the PR base and optional `artifacts/higodot/HIGODOT_AUTHORING_RECEIPT.json`.
- Produces: PASS when no protected Godot artifact changed, or when every protected change is covered by a valid HiGodot receipt.

- [ ] **Step 1: Write failing tests for both paths**

Required cases:

```text
no protected diff + no receipt => PASS
protected diff + no receipt => FAIL
protected diff + matching receipt => PASS
receipt result_commit != current head => FAIL
receipt changed_godot_artifacts does not cover diff => FAIL
```

- [ ] **Step 2: Confirm RED**

```bash
python -m unittest tests.test_higodot_authoring_receipt_gate -v
```

Expected: missing checker import.

- [ ] **Step 3: Implement the checker**

Protected paths:

```text
project.godot
*.tscn
*.tres
*.res
```

The receipt must contain:

```json
{
  "schema": "HIGODOT_AUTHORING_RECEIPT_V1",
  "tool_version": "3.1.2",
  "base_commit": "<base SHA>",
  "result_commit": "<exact HEAD>",
  "changed_godot_artifacts": ["res://path"],
  "operations": ["operation summary"],
  "scene_open_or_reload_evidence": ["evidence reference"],
  "project_path": "<repository-relative or validated local path>"
}
```

- [ ] **Step 4: Add the fail-closed workflow step**

```yaml
- name: Enforce HiGodot authoring receipt for protected diffs
  run: python tools/check_higodot_authoring_receipt.py --base "$GITHUB_BASE_REF" --head "$GITHUB_SHA"
```

For the CLI-only adoption PR, expected result is PASS through the `no protected diff` path.

- [ ] **Step 5: Commit**

```bash
git add tools/check_higodot_authoring_receipt.py tests/test_higodot_authoring_receipt_gate.py docs/validation/HIGODOT_AUTHORING_RECEIPT_SCHEMA.json .github/workflows/validate-gut-formal-adoption.yml
git commit -m "ci: require HiGodot receipts for protected Godot diffs"
```

---

### Task 7: Validate Windows/Android shared-core neutrality

**Files:**
- Create: `tests/test_gut_platform_neutrality_contract.py`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`

**Interfaces:**
- Consumes: new GUT tests, `.gutconfig.json`, workflow, and project source paths.
- Produces: evidence that test adoption does not add Windows-only or Android-only game logic and does not alter shared data schema.

- [ ] **Step 1: Write the platform-neutrality contract**

The test must assert:

- New GUT suites use `res://` product paths and no absolute OS paths.
- No new game logic branches on `OS.get_name()`.
- `.gutconfig.json` is platform-neutral.
- The adoption workflow runs the same core test lane for both target platforms.
- Windows export and Android export remain `NOT_RUN`, not falsely promoted.

- [ ] **Step 2: Run and confirm GREEN without product changes**

```bash
python -m unittest tests.test_gut_platform_neutrality_contract -v
```

Expected: PASS. A failure indicating platform-specific product logic must be fixed by removing that test-infrastructure coupling, not by duplicating product logic.

- [ ] **Step 3: Record explicit limitations**

State must retain:

```yaml
windows_export_validation: NOT_RUN
android_export_validation: NOT_RUN
shared_core_test_validation: AUTOMATED_PASS
```

- [ ] **Step 4: Commit**

```bash
git add tests/test_gut_platform_neutrality_contract.py docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
git commit -m "test: keep GUT adoption platform-neutral"
```

---

### Task 8: Verify `REMOVAL_AND_ROLLBACK`, sync authority, and close exact HEAD

**Files:**
- Create: `tools/check_gut_removal_readiness.py`
- Create: `tests/test_gut_removal_readiness.py`
- Create: `docs/validation/GUT_9_7_1_REMOVAL_AND_ROLLBACK.md`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- Modify: `docs/planning/CURRENT_UNRESOLVED_GATES.md`
- Modify: `docs/planning/CANON_SYNC_STATE.json`
- Modify: `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- Modify: Google Sheet `00`, `01`, `02`, `04`, `72`, `99`

**Interfaces:**
- Consumes: all adoption files, both test lanes, exact-head CI, and live Sheet state.
- Produces: a reviewable adoption PR that remains blocked from resuming PR #82 until every implementation blocker is evidenced and independently reviewed.

- [ ] **Step 1: Write the rollback-readiness test**

Require the rollback document to specify this exact order:

```text
remove required GUT workflow only after approval
remove .gutconfig.json and GUT hooks
preserve or convert GUT tests before deleting them
search all addons/gut references
prove legacy runner still passes
remove addons/gut only at zero references and preserved coverage
retain MIT/provenance/removal receipt
sync GitHub and Sheet with the same Decision ID
```

- [ ] **Step 2: Confirm RED then add the rollback validator and document**

```bash
python -m unittest tests.test_gut_removal_readiness -v
```

Expected first run: FAIL because the rollback artifact does not exist. After implementation: PASS.

- [ ] **Step 3: Run the full exact-head evidence set**

```bash
python -m unittest tests.test_godot_authoring_gut_authority_contract -v
python -m unittest tests.test_gut_formal_adoption_contract -v
python -m unittest tests.test_gut_product_mutation_hash_gate -v
python -m unittest tests.test_gut_formal_adoption_workflow -v
python -m unittest tests.test_gut_legacy_contract_parity -v
python -m unittest tests.test_higodot_authoring_receipt_gate -v
python -m unittest tests.test_gut_platform_neutrality_contract -v
python -m unittest tests.test_gut_removal_readiness -v
Godot --headless --path . --import
Godot --headless --path . --script res://tests/test_runner.gd
Godot --headless --path . -s addons/gut/gut_cmdln.gd \
  -gconfig=res://.gutconfig.json -gjunit_xml_file=user://gut-results.xml -gexit
```

Expected: all commands exit `0`; GUT JUnit exists; pre/post product manifests are equal; both test lanes pass.

- [ ] **Step 4: Update authority state only from evidence**

Allowed transition after all automation passes:

```yaml
gut:
  current_consumption: ACTUAL_PRODUCT_TEST_CONSUMPTION_PASS
  ci_enabled: true
  junit: PASS
  product_mutation_hash_gate: PASS
legacy_to_gut_coverage_parity: PASS
higodot_authoring_receipt_gate: PASS
entry_gate:
  status: BLOCKED_PENDING_INDEPENDENT_REVIEW_AND_MAIN_MERGE
```

Do not set `GUT_FORMALLY_ADOPTED` until independent review, exact-head PR approval, merge, and merged-main readback complete.

- [ ] **Step 5: Synchronize Google Sheet and read it back**

Use the same Decision ID in:

```text
00_프로젝트_허브
01_작업순서
02_현재_확정결정
04_누락_충돌_감사
72_이미지검수_승인로그
99_변경이력
```

Read every written range back. A write response without readback is not completion evidence.

- [ ] **Step 6: Request independent review and perform adversarial recheck**

Provide the reviewer:

```yaml
description: GUT 9.7.1 CLI-only formal adoption with HiGodot authoring separation
requirements_or_plan: docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md
base_sha: <merged PR83 main SHA>
head_sha: <exact adoption PR HEAD>
protected_contracts:
  - GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
  - GM-SPELL-WORKFLOW-UI-V2-01
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
known_deferred_items:
  - Windows export NOT_RUN
  - Android export NOT_RUN
  - device/performance/screen-reader/human NOT_RUN
```

Any Critical or Important finding blocks merge.

- [ ] **Step 7: Merge only after exact-head conditions and main readback**

Merge is eligible only when the PR is not Draft, exact reviewed HEAD equals current HEAD, all required checks pass, unresolved review threads are zero, independent review has no blocking finding, and repository policy permits the chosen merge method.

After merge, re-read `main` and update Sheet with the merged `main` SHA. Only then may the project evaluate whether PR #82 Task 2 can resume.
