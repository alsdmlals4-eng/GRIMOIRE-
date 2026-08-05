# Star Glyph Circuit Canon Synchronization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the active 3×3 circuit canon with the approved five-point star circuit, mastery, success, mana, Precision, and Reduction contracts across GitHub and the connected Google Sheet without claiming runtime implementation.

**Architecture:** One decision document and one design spec define the new authority. Existing active entry points and domain responsibility sources reference that decision, while historical 3×3 documents remain preserved and are marked superseded by the status index. A focused unittest prevents active authority from reverting to the old topology or hiding the approved numeric preview.

**Tech Stack:** Markdown authority documents, JSON registry, Python 3 `unittest`, Google Sheets workbook `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`, GitHub Actions.

## Global Constraints

- Decision ID is exactly `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`.
- Sync ID is exactly `GR-SYNC-20260806-01`.
- Layout is exactly one centre main glyph plus zero to five auxiliary glyphs at five star vertices.
- Target keyword selection occurs after circuit preview and outside the circuit.
- Success complexity is `0,-10,-20,-30,-40,-50` percentage points for zero through five auxiliary glyphs.
- Mana complexity is `0,+10,+20,+30,+40,+50` percent for zero through five auxiliary glyphs.
- Precision adds `+25%` mana and `precision_mastery / 10` percentage points of success.
- Reduction subtracts `10% + reduction_mastery / 10` mana and adds no direct success.
- Product implementation and runtime validation remain `NOT_STARTED / NOT_RUN`.
- `skills/PROJECT_BASE_ADAPTER.json` is outside this change.

---

### Task 1: Add the canon regression test

**Files:**
- Create: `tests/test_star_glyph_circuit_canon_contract.py`

**Interfaces:**
- Consumes: active Markdown authority files and `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- Produces: a required unittest contract for the new decision and supersession boundary.

- [ ] **Step 1: Write the failing test**

```python
from __future__ import annotations

import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DECISION = "GM-STAR-CIRCUIT-MASTERY-BALANCE-01"
SPEC = "docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md"


class StarGlyphCircuitCanonContractTests(unittest.TestCase):
    def read(self, path: str) -> str:
        return (ROOT / path).read_text(encoding="utf-8")

    def test_active_authority_uses_star_circuit(self) -> None:
        for path in (
            "AGENTS.md",
            "START_HERE.md",
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            "docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md",
        ):
            text = self.read(path)
            self.assertIn(DECISION, text, path)
            self.assertIn("FIVE_POINT_STAR", text, path)

    def test_numeric_complexity_contract_is_present(self) -> None:
        circuit = self.read("docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md")
        mana = self.read("docs/planning/MANA_SYSTEM.md")
        mastery = self.read("docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md")
        for token in ("-10", "-20", "-30", "-40", "-50"):
            self.assertIn(token, circuit)
        for token in ("+10%", "+20%", "+30%", "+40%", "+50%"):
            self.assertIn(token, mana)
        for token in ("PRECISION", "REDUCTION", "0_to_100"):
            self.assertIn(token, mastery + mana)

    def test_old_three_by_three_decision_is_explicitly_superseded(self) -> None:
        status = self.read("docs/planning/CANON_STATUS_INDEX_2026-08-04.md")
        self.assertIn("GM-3X3-CIRCUIT-STOCK-FOCUS-01", status)
        self.assertIn("SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01", status)

    def test_registry_points_to_new_spec(self) -> None:
        registry = json.loads(
            (ROOT / "docs/DESIGN_DOCUMENT_REGISTRY.json").read_text(encoding="utf-8")
        )
        encoded = json.dumps(registry, ensure_ascii=False)
        self.assertIn(DECISION, encoded)
        self.assertIn(SPEC, encoded)

    def test_runtime_state_is_not_overclaimed(self) -> None:
        decisions = self.read("docs/planning/CURRENT_CONFIRMED_DECISIONS.md")
        self.assertIn("product_implementation: NOT_STARTED", decisions)
        self.assertIn("runtime_validation: NOT_RUN", decisions)


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run the focused test and verify RED**

Run:

```bash
python -m unittest tests.test_star_glyph_circuit_canon_contract -v
```

Expected: failures because active authority still names the 3×3 decision and the registry does not point to the new spec.

- [ ] **Step 3: Commit the RED contract**

```bash
git add tests/test_star_glyph_circuit_canon_contract.py
git commit -m "test: require star glyph circuit canon"
```

### Task 2: Publish the approved decision and design authority

**Files:**
- Create: `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- Create: `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`

**Interfaces:**
- Consumes: user-approved rules from `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`.
- Produces: one approval record and one complete responsibility spec referenced by every active entry point.

- [ ] **Step 1: Record exact decision metadata**

Use:

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

- [ ] **Step 2: Record the supersession boundary**

The decision must supersede 3×3 topology, target nodes inside the circuit, adjacency/edge grammar, the general two-support cap, and numeric success-preview prohibition while preserving typed glyph Stock, explicit Commit, no auto-target, no auto-commit, and spell mana consumption.

- [ ] **Step 3: Commit the authority documents**

```bash
git add docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md
git commit -m "docs: approve star glyph circuit balance"
```

### Task 3: Replace the active circuit, mana, and mastery responsibility sources

**Files:**
- Modify: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- Modify: `docs/planning/MANA_SYSTEM.md`
- Modify: `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`

**Interfaces:**
- Consumes: exact formulas in the design spec.
- Produces: domain sources used by UI, balance, curriculum, and future runtime tasks.

- [ ] **Step 1: Replace the 3×3 grammar with the fixed star contract**

Required YAML:

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
numeric_success_preview: required
hidden_slot_bonus: prohibited
```

- [ ] **Step 2: Add the exact success formula and penalty table**

Required formula:

```text
final_success = main_base_success + mastery_modifier - complexity_penalty + special_auxiliary_modifier - target_difficulty - incompatibility_penalty + context_modifier
```

Required penalty sequence: `0,-10,-20,-30,-40,-50` percentage points.

- [ ] **Step 3: Add the exact mana formula and rate table**

Required sequence: `0,+10,+20,+30,+40,+50` percent. Add Precision `+25%` and Reduction `10% + mastery/10` as additive rates.

- [ ] **Step 4: Replace three mastery grades with per-glyph 0–100 mastery**

Required circuit formula:

```text
main × 0.45 + auxiliary average × 0.35 + lowest auxiliary × 0.20
```

Required mastery modifier:

```text
clamp((circuit mastery - 50) × 0.5, -25, +25)
```

- [ ] **Step 5: Run focused test**

```bash
python -m unittest tests.test_star_glyph_circuit_canon_contract -v
```

Expected: domain-source assertions pass; active-entry and registry assertions may still fail.

- [ ] **Step 6: Commit**

```bash
git add docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md docs/planning/MANA_SYSTEM.md docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md
git commit -m "docs: replace 3x3 circuit domain contracts"
```

### Task 4: Synchronize active entry points and status ownership

**Files:**
- Modify: `AGENTS.md`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Modify: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`

**Interfaces:**
- Consumes: the new decision and domain responsibility sources.
- Produces: a consistent project restoration path with no active 3×3 authority.

- [ ] **Step 1: Set the latest approved decision**

Use `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` and `GR-SYNC-20260806-01` with working-branch status. Preserve `product_implementation: NOT_STARTED` and `runtime_validation: NOT_RUN`.

- [ ] **Step 2: Replace the core loop text**

Use:

```text
조사 → 의도·우선순위 → 별형 글자 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 세계 변화 → 복기·발견
```

- [ ] **Step 3: Mark historical 3×3 documents**

Status token must be exactly:

```text
SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01
```

Do not delete historical approval or closure records.

- [ ] **Step 4: Run focused test**

```bash
python -m unittest tests.test_star_glyph_circuit_canon_contract -v
```

Expected: only registry assertion may remain failing.

- [ ] **Step 5: Commit**

```bash
git add AGENTS.md START_HERE.md docs/ACTIVE_CONTEXT.md docs/planning/CURRENT_CONFIRMED_DECISIONS.md docs/planning/CANON_STATUS_INDEX_2026-08-04.md
git commit -m "docs: route active canon to star circuit"
```

### Task 5: Update registries and documentation map

**Files:**
- Modify: `docs/DESIGN_DOCUMENT_REGISTRY.json`
- Modify: `docs/DOCUMENTATION_MAP.md`

**Interfaces:**
- Consumes: new spec and approval paths.
- Produces: machine-readable and human-readable discovery routes.

- [ ] **Step 1: Add registry records**

The serialized registry must contain both:

```text
GM-STAR-CIRCUIT-MASTERY-BALANCE-01
docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md
```

- [ ] **Step 2: Route circuit readers to the new source**

`docs/DOCUMENTATION_MAP.md` must list the approval, spec, circuit system, mana system, and mastery system as one responsibility bundle.

- [ ] **Step 3: Run the focused test and full unit discovery**

```bash
python -m unittest tests.test_star_glyph_circuit_canon_contract -v
python -m unittest discover -s tests -v
```

Expected: all tests pass or pre-existing environment-dependent tests remain explicitly skipped; no new failure is allowed.

- [ ] **Step 4: Commit**

```bash
git add docs/DESIGN_DOCUMENT_REGISTRY.json docs/DOCUMENTATION_MAP.md
git commit -m "docs: register star circuit authority"
```

### Task 6: Synchronize Google Sheets and record readback

**Files:**
- Create: `docs/planning/sync/GR-SYNC-20260806-01-WORKING.md`
- Modify: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`

**Interfaces:**
- Consumes: working-branch authority commit SHA.
- Produces: Sheet rows and a readback receipt bound to the same Decision ID.

- [ ] **Step 1: Append the new decision to `02_현재_확정결정`**

Populate the next empty row with Decision ID, approval date, field, approved star topology, prototype numeric status, authority path, working-branch commit, and `SYNCED_TO_WORKING_BRANCH` only after readback.

- [ ] **Step 2: Update domain rows**

Update or append rows in:

```text
05_GDD_요약
12_핵심루프
15_조작_게임규칙
40_핵심시스템_메인콘텐츠
41_성장_경제
60_UX_UI_접근성
```

The rows must state centre main plus five vertices, preview-before-target, target keyword, glyph mastery, 10-point success complexity, 10% mana complexity, Precision, Reduction, and `PLAYTEST_TUNING_REQUIRED`.

- [ ] **Step 3: Record supersession and history**

Append `GM-3X3-CIRCUIT-STOCK-FOCUS-01 → GM-STAR-CIRCUIT-MASTERY-BALANCE-01` to `04_누락_충돌_감사`, and append `GR-SYNC-20260806-01` to `99_변경이력`.

- [ ] **Step 4: Read back every written range**

Verify the exact Decision ID, authority commit SHA, status, and formula summaries. If any side fails, record `GITHUB_ONLY` or `SHEET_ONLY`; do not claim synchronization.

- [ ] **Step 5: Commit the receipt**

```bash
git add docs/planning/sync/GR-SYNC-20260806-01-WORKING.md docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md
git commit -m "docs: record star circuit sheet sync"
```

### Task 7: Adversarial review and Draft PR

**Files:**
- Create: `docs/planning/STAR_GLYPH_CIRCUIT_ADVERSARIAL_REVIEW_2026-08-06.md`

**Interfaces:**
- Consumes: complete branch diff, unit results, Sheet readback.
- Produces: P0–P3 review, evidence limits, and Draft PR gate.

- [ ] **Step 1: Search the active authority for stale conflicts**

Run:

```bash
git grep -nE "3×3 회로|grid: 3x3|numeric_success_probability: prohibited|성공 확률 숫자 Preview" -- AGENTS.md START_HERE.md docs/ACTIVE_CONTEXT.md docs/planning/CURRENT_CONFIRMED_DECISIONS.md docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md docs/planning/MANA_SYSTEM.md docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md
```

Expected: no active rule claims the old topology or prohibits the approved numeric success preview. Historical references may appear only with explicit supersession language.

- [ ] **Step 2: Run validation**

```bash
python -m unittest tests.test_star_glyph_circuit_canon_contract -v
python -m unittest discover -s tests -v
```

- [ ] **Step 3: Write the adversarial review**

Record topology ambiguity, mandatory-glyph risk, Precision/Reduction dominance risk, first-year calibration, target-keyword sequencing, Sheet readback, and all unexecuted runtime/human gates.

- [ ] **Step 4: Commit and open Draft PR**

```bash
git add docs/planning/STAR_GLYPH_CIRCUIT_ADVERSARIAL_REVIEW_2026-08-06.md
git commit -m "docs: adversarially review star circuit canon"
gh pr create --draft --base main --head agent/star-circuit-mastery-balance --title "docs: replace 3x3 spell circuit with star glyph circuit" --body-file <prepared-pr-body>
```

The PR must remain Draft until exact-head CI, Sheet readback, and written-spec review are complete. Product runtime implementation remains a later plan after a product Godot project exists.
