# GRIMOIRE First-Session Image Asset Production Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce, review, decompose, register, and import the approved first-session image asset batch while keeping all functional UI live, preserving GRIMOIRE’s locked visual authority, and preventing generated candidates from becoming runtime assets without provenance and user approval.

**Architecture:** Treat image generation as candidate-source production, not direct runtime export. Recover approved references and briefs, generate bounded alternatives, keep candidates in the persistent Library, obtain explicit visual selection, classify reusable layers/variants using Base RM-VIS modules, then create deterministic runtime exports/manifests and a Godot asset-gallery evidence scene only for approved candidates.

**Tech Stack:** ChatGPT image generation surface, ChatGPT Files/Library, Python 3.12 for SHA/conversion/manifest validation, Pillow only for deterministic format/crop/export operations if needed, text-free SVG for glyph/Lens/Result symbols, Godot 4.7.1 import/render verification, Python `unittest`, existing `ASSET_MANIFEST_SCHEMA.json`, Notion `ASSET LIBRARY · Master`.

**Spec:** `docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md`

## Global Constraints

- Current project authority at plan creation: GRIMOIRE `main` `4c2f23c4bb8b7487559b113a5d41deab815fb62d`.
- Current Base observation: `e222e93e79e95364dca668eaaf0f156676123342`; use `RM-VIS-002 GAMEPLAY_SYMBOL_ATLAS`, `RM-VIS-003 MODULAR_BACKGROUND_LAYER_KIT`, `RM-VIS-004 COMBAT_TELEGRAPH_VFX_KIT`, and `RM-VIS-005 PORTRAIT_STATE_VARIANT_KIT` as structural/reuse contracts only.
- Locked visual authority remains `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`, SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`; do not edit, regenerate, crop-replace, recolor, or overwrite it.
- Approved Board A/B remain composition/checkpoint references; their embedded UI text/numbers are noncanonical placeholders and must never be extracted as runtime UI sprites.
- Visual style remains `SOFT_STORYBOOK_ENVIRONMENT + CLEAN_ANIME_CEL_CHARACTER_OVER_STORYBOOK_BACKGROUND + NAVY_GOLD_MAGIC_ACADEMY_FRAME`.
- AI-generated-look reduction, style consistency/readability, and world/core-system fit remain mandatory review axes.
- Background source master target: `2560×1440`; runtime opaque background export: WebP Lossless; no alpha.
- Half-body portrait runtime canvas: `1024×1536 RGBA`; Maren uses the professor family and does not create a new costume family.
- Main companion runtime frame target: `256×256 RGBA`; generate higher-resolution source, then crop/export deterministically.
- Base glyph count for this first session remains exactly `FLOW / FOCUS / DISPERSE`; glyph source target is `512×512`, SVG preferred for final runtime symbol.
- Base icon hard cap remains 24. The new Lens 4 + Result Axis 5 must reuse existing common icons where semantically valid and keep total active base icons under the cap.
- Text/labels/numbers are live UI. No Korean/English functional text, success %, Mana, count, grade, or button label may be baked into images.
- Generated asset existence does not imply approval. Candidate → visual review → selected candidate → export → manifest → import → runtime verification are distinct states.
- Every runtime asset must conform to `docs/planning/ASSET_MANIFEST_SCHEMA.json`; source File ID/path + SHA, tool, owner, export SHA/format/dimensions, license status/evidence, screen consumers, approval, and runtime validation are mandatory.
- Source layers live in ChatGPT Library/external source storage or `.gdignore` source root; GitHub product paths receive only approved runtime exports/manifests, not uncontrolled layered masters.
- Human visual approval is required before any generated raster candidate can become `APPROVED_RUNTIME_CANDIDATE`.
- Physical-device validation, performance validation, accessibility/device validation, and Full Vertical Slice validation remain `NOT_RUN` unless actually executed later.
- No Festival full-content batch, all-NPC portrait batch, Year-One full asset set, companion growth stages, guardian battlefield body, or second incident art is authorized.

---

## File Structure

### Planning/brief/contract files

- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md` — exact asset groups, alternatives, generation constraints, rejection criteria.
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json` — machine-readable planned groups and state ceilings.
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md` — selected candidates classified as `REUSE_AS_IS / VARIANT_SEED / STRUCTURE_PATTERN / STYLE_DNA / REBUILD_FOR_REUSE / ONE_OFF_KEEP / REJECT_REUSE`.
- `tests/test_first_session_image_batch_contract.py` — planning/runtime manifest guard.

### Runtime export targets after explicit visual approval

- `assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp`
- `assets/art/backgrounds/school/bg_school_common.webp`
- `assets/art/characters/professor/chr_maren_portrait_instructive.png`
- `assets/art/characters/companion/chr_nea_field_neutral.png`
- `assets/art/ui/glyphs/glyph_flow.svg`
- `assets/art/ui/glyphs/glyph_focus.svg`
- `assets/art/ui/glyphs/glyph_disperse.svg`
- `assets/art/ui/lens/icon_lens_rest.svg`
- `assets/art/ui/lens/icon_lens_prepare.svg`
- `assets/art/ui/lens/icon_lens_social.svg`
- `assets/art/ui/lens/icon_lens_practicum.svg`
- `assets/art/ui/result/icon_result_facility.svg`
- `assets/art/ui/result/icon_result_life.svg`
- `assets/art/ui/result/icon_result_spirit.svg`
- `assets/art/ui/result/icon_result_relationship.svg`
- `assets/art/ui/result/icon_result_discovery.svg`

### Runtime manifests after explicit visual approval

- `assets/manifests/bg_greenhouse_field_base.json`
- `assets/manifests/bg_school_common.json`
- `assets/manifests/chr_maren_portrait_instructive.json`
- `assets/manifests/chr_nea_field_neutral.json`
- `assets/manifests/glyph_flow.json`
- `assets/manifests/glyph_focus.json`
- `assets/manifests/glyph_disperse.json`
- `assets/manifests/icon_lens_rest.json`
- `assets/manifests/icon_lens_prepare.json`
- `assets/manifests/icon_lens_social.json`
- `assets/manifests/icon_lens_practicum.json`
- `assets/manifests/icon_result_facility.json`
- `assets/manifests/icon_result_life.json`
- `assets/manifests/icon_result_spirit.json`
- `assets/manifests/icon_result_relationship.json`
- `assets/manifests/icon_result_discovery.json`

### Runtime gallery/verification files

- `src/ui/asset_gallery/first_session_asset_gallery.gd`
- `src/ui/asset_gallery/first_session_asset_gallery.tscn`
- `tools/capture_first_session_asset_gallery.gd`
- `.github/workflows/validate-first-session-image-assets.yml`
- `docs/planning/FIRST_SESSION_IMAGE_BATCH_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- `docs/planning/sync/GR-SYNC-20260820-34-FIRST-SESSION-IMAGE-ASSETS.md`

### Persistent Library candidate roots

```text
/GRIMOIRE/Production Candidates/first_session_01/backgrounds/greenhouse/
/GRIMOIRE/Production Candidates/first_session_01/backgrounds/classroom/
/GRIMOIRE/Production Candidates/first_session_01/characters/maren/
/GRIMOIRE/Production Candidates/first_session_01/characters/nea/
/GRIMOIRE/Production Candidates/first_session_01/symbol_concepts/glyphs/
/GRIMOIRE/Production Candidates/first_session_01/symbol_concepts/lens/
/GRIMOIRE/Production Candidates/first_session_01/symbol_concepts/result/
/GRIMOIRE/Production Candidates/first_session_01/ornament_vfx/
```

---

### Task 1: Asset-batch contract RED and exact generation briefs

**Files:**
- Create: `tests/test_first_session_image_batch_contract.py`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json`

**Interfaces:**
- Consumes: Art Bible, Asset Spec, approved Board A/B manifests, Component production spec, Base RM-VIS contracts.
- Produces: exactly seven mandatory production groups plus one conditional ornament/VFX sufficiency group; no generated asset yet.

- [ ] **Step 1: Write the RED contract first**

Create `tests/test_first_session_image_batch_contract.py`:

```python
from pathlib import Path
import json
import unittest

ROOT = Path(__file__).resolve().parents[1]
PLAN = ROOT / "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json"
BRIEF = ROOT / "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md"
SCHEMA = ROOT / "docs/planning/ASSET_MANIFEST_SCHEMA.json"

EXPECTED_GROUPS = [
    "GREENHOUSE_BACKGROUND",
    "CLASSROOM_BACKGROUND",
    "MAREN_PORTRAIT",
    "NEA_SOURCE",
    "GLYPH_SYMBOLS",
    "LENS_SYMBOLS",
    "RESULT_AXIS_SYMBOLS",
    "ORNAMENT_VFX_SUFFICIENCY",
]

class FirstSessionImageBatchContractTests(unittest.TestCase):
    def test_plan_and_brief_exist(self):
        self.assertTrue(PLAN.is_file())
        self.assertTrue(BRIEF.is_file())

    def test_plan_is_candidate_only_before_human_review(self):
        data = json.loads(PLAN.read_text(encoding="utf-8"))
        self.assertEqual(EXPECTED_GROUPS, [g["group_id"] for g in data["groups"]])
        self.assertTrue(all(g["status"] == "PLANNED" for g in data["groups"]))
        self.assertTrue(all(g["runtime_validation"] == "NOT_RUN" for g in data["groups"]))
        self.assertFalse(data["mass_generation_authorized"])

    def test_locked_authority_and_text_boundary_are_explicit(self):
        text = BRIEF.read_text(encoding="utf-8")
        self.assertIn("b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a", text)
        self.assertIn("NO_FUNCTIONAL_TEXT_BAKED_INTO_IMAGE", text)
        self.assertIn("USER_VISUAL_APPROVAL_REQUIRED", text)

    def test_runtime_schema_still_requires_traceability(self):
        schema = json.loads(SCHEMA.read_text(encoding="utf-8"))
        for key in ("asset_id", "source", "export", "license", "status", "used_in_screens", "runtime_validation"):
            self.assertIn(key, schema["required"])

if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run RED**

Run:

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
```

Expected: fail because BRIEF/PLAN do not yet exist.

- [ ] **Step 3: Create the machine plan**

`FIRST_SESSION_IMAGE_BATCH_01_PLAN.json` uses this exact outer shape:

```json
{
  "schema_version": 1,
  "decision_id": "GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01",
  "status": "IMPLEMENTATION_PLAN_APPROVED_CANDIDATE_PRODUCTION_NOT_STARTED",
  "mass_generation_authorized": false,
  "locked_visual_sha256": "b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a",
  "groups": [
    {"group_id": "GREENHOUSE_BACKGROUND", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "CLASSROOM_BACKGROUND", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "MAREN_PORTRAIT", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "NEA_SOURCE", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "GLYPH_SYMBOLS", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "LENS_SYMBOLS", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "RESULT_AXIS_SYMBOLS", "candidate_count": 3, "status": "PLANNED", "runtime_validation": "NOT_RUN"},
    {"group_id": "ORNAMENT_VFX_SUFFICIENCY", "candidate_count": 0, "status": "PLANNED", "runtime_validation": "NOT_RUN"}
  ]
}
```

- [ ] **Step 4: Write exact visual briefs and rejection criteria**

The Markdown brief must define these immutable requirements:

```text
GLOBAL:
- no UI frame, button, number, logo, watermark, or functional text in generated raster art
- no copy of a competitor's character/layout/trade dress
- preserve Soft Storybook environment + clean cel characters + restrained Navy/Gold academy language
- playable/reading region has lower detail density than focal framing
- AI artifacts in hands, architecture, repeated motifs, edge tangencies, pseudo-text, or inconsistent costume = reject
- USER_VISUAL_APPROVAL_REQUIRED before export/import
```

Then define per-group briefs:

**Greenhouse:** 2560×1440 source target, fixed 3/4 environment, damaged frostbloom greenhouse, readable irrigation/root/spirit-channel landmarks, no character/UI, three materially different camera/composition candidates while preserving the same location identity.

**Classroom:** 2560×1440 source target, same academy world, practical glyph-learning space, visible practice surface and supervised field-maintenance preparation cues, no baked tutorial text, three composition alternatives.

**Maren:** half-body source with transparent-friendly/simple background, same professor identity family, neutral-to-instructive expression, Navy/Gold academic authority without villain coding, no costume variants; three candidates differ in expression/gesture/framing only.

**Nea:** small wolf-like companion, white/pale-blue, rounded face, large ears/tail, small elemental glow, no growth form; three candidates differ only in pose/energy emphasis.

**Glyph concept directions:** FLOW = directional curved stream, FOCUS = compressed core/convergence, DISPERSE = expanding/diverging wave. Three style-direction sheets; final runtime glyphs will be manually rebuilt as text-free SVG.

**Lens concept directions:** REST = recovery/quiet state, PREPARE = tool/readiness, SOCIAL = people/context, PRACTICUM = field handling/comparison. Three style-direction sheets; final runtime icons rebuilt as SVG.

**Result concept directions:** FACILITY = structure, LIFE = living growth, SPIRIT = spirit resonance, RELATIONSHIP = linked people/records, DISCOVERY = revealed knowledge. Three style-direction sheets; final runtime icons rebuilt as SVG.

**Ornament/VFX:** inspect existing `academy_corner_ornament.svg`, phase/warning icons, and existing glyph/VFX assets first. Generate nothing if they satisfy Sheet A–D needs; if insufficient, authorize at most one ornament motif concept sheet and one transparent VFX-mask concept sheet in a later bounded revision.

- [ ] **Step 5: Run GREEN and commit**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
git add tests/test_first_session_image_batch_contract.py docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json
git commit -m "test(art): define first-session image batch contract"
```

---

### Task 2: Recover references and generate three Greenhouse/Classroom candidates each

**Files/Library:**
- Read only: locked Art Style reference and approved Board A/B Library files.
- Write candidates to the two background Library roots; do not write runtime `assets/` yet.
- Create: `docs/planning/visual/first_session_image_batch_01_background_candidates.json`

**Interfaces:**
- Consumes: visual authority + exact background briefs.
- Produces: six candidate source records with File IDs/generation IDs/SHA where available, all status `IN_VISUAL_REVIEW` or `SOURCE_READY`, never runtime-approved.

- [ ] **Step 1: Recover and inspect the exact approved references**

Use Files/Library search for the locked visual authority and Board A/B. Verify locked SHA/name against the brief. If the locked source cannot be recovered exactly, stop background generation rather than substituting an unknown reference.

- [ ] **Step 2: Generate three Greenhouse alternatives with image generation**

Generate exactly 3 images in one bounded request when the tool supports it. Require:

```text
same GRIMOIRE visual language
soft storybook fixed 3/4 greenhouse environment
frostbloom damage/pressure context
clear irrigation path + root layer + spirit-channel landmarks
central playable area quieter than framing
no characters
no UI
no lettering/signage/pseudo-text
16:9 composition suitable for a 2560×1440 master/export workflow
```

Alternative axes are camera elevation, foreground framing, and landmark distribution—not different world styles.

- [ ] **Step 3: Persist candidates in Library and record provenance**

Store each as `greenhouse_candidate_01/02/03.png` under the Greenhouse candidate folder. Record actual File ID/library path, generation/tool identifier if surfaced, dimensions, and SHA-256 after materialization. Status remains `IN_VISUAL_REVIEW`.

- [ ] **Step 4: Generate three Classroom alternatives**

Use the same process with exact brief constraints. Candidate axes are room orientation, practice-surface location, and professor/student staging space; no actual characters are baked into the background source.

- [ ] **Step 5: Create the background candidate receipt**

The JSON receipt records six candidates and explicitly says:

```yaml
selected_candidate: NONE_PENDING_USER_VISUAL_REVIEW
runtime_export: NOT_CREATED
runtime_validation: NOT_RUN
```

- [ ] **Step 6: Present candidates to the user for visual selection**

Show all three per group with concise A/B/C differences. Do not pick on the user's behalf. Ask for one selected candidate per group or a specific bounded revision request.

- [ ] **Step 7: Commit provenance receipt only**

Do not commit candidate PNGs to runtime paths before selection.

```bash
git add docs/planning/visual/first_session_image_batch_01_background_candidates.json
git commit -m "docs(art): record first-session background candidates"
```

---

### Task 3: Generate Maren and Nea identity-safe candidates and select base families

**Files/Library:**
- Candidate roots: Maren and Nea Library folders.
- Create: `docs/planning/visual/first_session_image_batch_01_character_candidates.json`

**Interfaces:**
- Consumes: Board A/B character continuity, Art Bible character keys, Base `RM-VIS-005 PORTRAIT_STATE_VARIANT_KIT`.
- Produces: one selected Maren base family and one selected Nea base family after explicit user review; no runtime export before selection.

- [ ] **Step 1: Define identity locks from approved references before generation**

Record the observed/approved identity constraints, not invented detail:

```yaml
maren:
  role: mentor_professor
  costume_family: navy_gold_academy
  variation_axes: expression_gaze_small_gesture_framing_only
  new_costume: forbidden
nea:
  body_family: small_wolf_spirit
  palette: white_pale_blue
  face: rounded
  ears_tail: large_readable_silhouette
  glow: small_elemental
  growth_form: forbidden
```

If an exact face/costume feature is not supported by the approved reference, leave it unspecified in the brief rather than hallucinating it.

- [ ] **Step 2: Generate exactly three Maren half-body candidates**

Request transparent background when supported. Keep clothing/palette/light family constant; vary only instructive expression, small hand gesture, and framing. Reject pseudo-text, extra accessories, costume redesign, or face drift.

- [ ] **Step 3: Generate exactly three Nea candidates**

Request transparent background. Keep body/palette/silhouette family fixed; vary only neutral pose vs alert pose vs gentle field-attention pose. Reject growth/evolution armor, mount scale, extra tails/wings, or mascot redesign.

- [ ] **Step 4: Persist and hash candidates; record them as `IN_VISUAL_REVIEW`**

Create the character candidate receipt with actual source IDs and no runtime export fields.

- [ ] **Step 5: User selects one Maren and one Nea family**

Selection promotes only the source family to `SOURCE_READY`. It does not yet mean Runtime Verified/Project Asset Approved.

- [ ] **Step 6: Commit the character candidate/selection receipt**

```bash
git add docs/planning/visual/first_session_image_batch_01_character_candidates.json
git commit -m "docs(art): record first-session character candidates"
```

---

### Task 4: Generate symbol directions, choose one, then rebuild final glyph/Lens/Result icons as SVG

**Files:**
- Candidate concept sheets live in Library only.
- Create final SVGs at the 12 runtime paths listed above.
- Create: `docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md`
- Modify: `tests/test_first_session_image_batch_contract.py`

**Interfaces:**
- Consumes: Base `RM-VIS-002`, selected GRIMOIRE visual language, existing text-free SVG conventions.
- Produces: 3 glyph SVGs + 4 Lens SVGs + 5 Result SVGs; simple path geometry, no text/raster/filter/font.

- [ ] **Step 1: Generate three concept-direction sheets for each symbol family**

Use image generation for visual exploration only. Each sheet must show all semantic members of its family and no readable text. Concept sheets are `REFERENCE_ONLY` and never runtime imports.

- [ ] **Step 2: Present the three directions and obtain one user-selected direction per family**

Decision axes: 16/24/32/48px legibility, GRIMOIRE identity, shape distinctness, AI-look reduction, and no semantic collision with existing Mana/Warning/Phase icons.

- [ ] **Step 3: Write SVG RED assertions before rebuilding**

Extend Python contract:

```python
SVG_PATHS = [
    "assets/art/ui/glyphs/glyph_flow.svg",
    "assets/art/ui/glyphs/glyph_focus.svg",
    "assets/art/ui/glyphs/glyph_disperse.svg",
    "assets/art/ui/lens/icon_lens_rest.svg",
    "assets/art/ui/lens/icon_lens_prepare.svg",
    "assets/art/ui/lens/icon_lens_social.svg",
    "assets/art/ui/lens/icon_lens_practicum.svg",
    "assets/art/ui/result/icon_result_facility.svg",
    "assets/art/ui/result/icon_result_life.svg",
    "assets/art/ui/result/icon_result_spirit.svg",
    "assets/art/ui/result/icon_result_relationship.svg",
    "assets/art/ui/result/icon_result_discovery.svg",
]
for relative in SVG_PATHS:
    text = (ROOT / relative).read_text(encoding="utf-8").lower()
    self.assertIn("<svg", text)
    self.assertRegex(text, r"<(path|circle|polygon|line|rect)\b")
    for forbidden in ("<text", "<image", "<filter", "data:image", "font-family"):
        self.assertNotIn(forbidden, text)
```

Run RED; expected: missing SVGs.

- [ ] **Step 4: Rebuild glyphs as simple project-authored SVG**

Semantic geometry, independent of concept-sheet pixels:

```text
FLOW      = one continuous curved stream path + one secondary parallel accent; directional continuity, no arrow label
FOCUS     = outer ring/diamond converging to a small central core
DISPERSE  = central origin with three expanding/diverging arcs
```

Use existing Navy/Gold/Cyan token-compatible flat fills/strokes and no filters.

- [ ] **Step 5: Rebuild Lens SVGs**

```text
REST      = quiet crescent/settled pulse motif
PREPARE   = compact tool/readiness diamond + handle motif
SOCIAL    = two linked nodes with dialogue/context bridge shape, no text bubble lettering
PRACTICUM = field marker + handling/compare split motif
```

- [ ] **Step 6: Rebuild Result SVGs**

```text
FACILITY      = structural arch/beam
LIFE          = sprout/leaf growth
SPIRIT        = resonance spiral/core
RELATIONSHIP  = two linked rings/nodes
DISCOVERY     = opened-page/eye-reveal hybrid silhouette without letters
```

- [ ] **Step 7: Run SVG contract and commit**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
git add assets/art/ui/glyphs assets/art/ui/lens assets/art/ui/result tests/test_first_session_image_batch_contract.py docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md
git commit -m "feat(art): add first-session semantic symbols"
```

---

### Task 5: Layer/reuse classification and ornament/VFX sufficiency decision

**Files:**
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md`
- Read: existing `assets/art/ui/common/*.svg` and approved raster candidates.

**Interfaces:**
- Consumes: selected source candidates and Base `RM-VIS-003/004/005` classification rules.
- Produces: explicit layer provenance and reuse classification; either `NO_NEW_ORNAMENT_VFX_REQUIRED` or a narrowly justified follow-up.

- [ ] **Step 1: Classify both selected backgrounds**

For each, record:

```text
base_environment
midground
foreground_props
lighting
story_state_overlay
atmosphere_fx
```

Each part receives provenance `SOURCE_LAYER`, `MASK_CUTOUT`, `MANUAL_OR_SEMANTIC_REBUILD`, or `DERIVED_GENERATIVE_RECOVERY`. Never label generated reconstruction of an occluded area as observed source.

- [ ] **Step 2: Classify Maren/Nea**

Maren selected source is `VARIANT_SEED` for future expression-only variants. Nea selected source is `VARIANT_SEED` for bounded pose/reaction variants; growth-form generation remains forbidden.

- [ ] **Step 3: Inspect existing common ornament/icon assets against Component Sheets A–D**

If `academy_corner_ornament.svg`, phase diamond, warning diamond, Mana, and current star/glyph visual primitives cover the required decorative states, record:

```yaml
ornament_vfx_decision: NO_NEW_ORNAMENT_VFX_REQUIRED
reason: EXISTING_ASSETS_SUFFICIENT
```

If and only if a concrete missing semantic exists, create a separate bounded follow-up decision instead of generating speculative ornament/VFX in this task.

- [ ] **Step 4: Run 5-pass visual reuse adversarial review**

1. **Primary-quality attack:** did decomposition pressure make the selected image worse as a primary scene?
2. **Fake-layer attack:** are generated reconstructions truthfully labeled?
3. **Identity-drift attack:** would a variant seed allow face/costume/world drift?
4. **Over-reuse attack:** are one-off focal parts being forced into generic modules?
5. **Scope-creep attack:** did optional ornament/VFX become a new art batch without a consumer?

- [ ] **Step 5: Commit the layer/reuse review**

```bash
git add docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md
git commit -m "docs(art): classify first-session asset reuse"
```

---

### Task 6: Export selected raster sources, compute SHA, and create schema-valid runtime manifests

**Files:**
- Create selected runtime backgrounds/portraits at the four raster export paths.
- Create 16 per-asset manifests listed above.
- Modify: `tests/test_first_session_image_batch_contract.py`
- Modify: `docs/ASSET_LICENSE_LEDGER.md` only with actual generated/exported records; preserve NOT_RUN ceilings.

**Interfaces:**
- Consumes: explicit user-selected candidate File IDs and the 12 project-authored SVGs.
- Produces: runtime candidates with deterministic formats/hashes and `APPROVED_RUNTIME_CANDIDATE` status at most; not `PROJECT_ASSET_APPROVED` until runtime verification and final approval.

- [ ] **Step 1: Materialize the selected source files and verify source hashes**

Use the exact selected Library file IDs. Compute:

```bash
python - <<'PY'
from pathlib import Path
import hashlib
for p in Path('/mnt/data').rglob('*'):
    if p.is_file():
        print(p, hashlib.sha256(p.read_bytes()).hexdigest())
PY
```

Match the recorded candidate SHA. Any mismatch blocks export.

- [ ] **Step 2: Export opaque backgrounds losslessly**

Use deterministic image conversion only—no creative retouch at export. Resize/crop only if the approved candidate is not already 2560×1440, preserving 16:9 composition. Export:

```text
bg_greenhouse_field_base.webp  2560×1440  WebP Lossless  alpha=false
bg_school_common.webp           2560×1440  WebP Lossless  alpha=false
```

- [ ] **Step 3: Export Maren portrait**

Create `chr_maren_portrait_instructive.png` at 1024×1536 RGBA. Crop contract is waist/mid-thigh with headroom; do not redraw or costume-change during export. If transparent background generation was imperfect, use deterministic mask cleanup only when the selected source supports it; otherwise send the source back for bounded image edit rather than painting new anatomy with a generic script.

- [ ] **Step 4: Export Nea field source**

Create `chr_nea_field_neutral.png` at 256×256 RGBA from the selected higher-resolution source, preserving silhouette and glow readability.

- [ ] **Step 5: Extend Python manifest tests before creating manifests**

For every `assets/manifests/*.json` created by this plan, load `ASSET_MANIFEST_SCHEMA.json` required fields manually or with available schema validation. Require:

```text
source.storage in {EXTERNAL_LIBRARY, GENERATED_CANDIDATE}
license.status in {PROJECT_ORIGINAL, USER_OWNED}
status in {APPROVED_RUNTIME_CANDIDATE, IMPORTED, RUNTIME_VERIFIED, PROJECT_ASSET_APPROVED}
runtime_validation initially NOT_RUN
source.sha256 and export.sha256 are real 64-char lowercase hashes
```

Run RED; expected: manifests missing.

- [ ] **Step 6: Create each manifest with real values only**

Example shape for the selected Greenhouse export:

```json
{
  "schema_version": 1,
  "asset_id": "bg_greenhouse_field_base",
  "role": "FROSTBLOOM_FIELD_BACKGROUND",
  "decision_ids": ["ART-BIBLE-01", "ASSET-SPEC-01", "GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01"],
  "source": {
    "storage": "EXTERNAL_LIBRARY",
    "file_id_or_path": "ACTUAL_SELECTED_LIBRARY_FILE_ID",
    "sha256": "ACTUAL_SOURCE_SHA256",
    "tool": "ChatGPT image generation",
    "owner": "GRIMOIRE project",
    "prompt_or_brief_path": "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md",
    "parent_asset_ids": ["REF-ART-STYLE-LOCKED-01", "GR-VISUAL-CHECKPOINT-BOARD-A-01"]
  },
  "export": {
    "file_path": "assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp",
    "sha256": "ACTUAL_EXPORT_SHA256",
    "format": "WEBP",
    "width": 2560,
    "height": 1440,
    "alpha": false,
    "import_profile": "BACKGROUND_LOSSLESS_LINEAR_MIPMAP_TRIAL"
  },
  "license": {
    "status": "PROJECT_ORIGINAL",
    "evidence": "Generated for this project with the user-authorized ChatGPT image-generation workflow; no external asset pack imported.",
    "credit_required": false,
    "modification_allowed": true,
    "redistribution_allowed": true
  },
  "status": "APPROVED_RUNTIME_CANDIDATE",
  "approved_by": "USER_VISUAL_SELECTION",
  "approved_at": "2026-08-20",
  "used_in_screens": ["FROSTBLOOM_FIELD", "RESULT_RETURN"],
  "runtime_validation": "NOT_RUN"
}
```

At execution, replace `ACTUAL_*` values with observed values; never commit placeholder strings. The task is not complete until a placeholder scan returns zero hits.

- [ ] **Step 7: Update the Asset License Ledger truthfully**

Record only the assets actually exported. `runtime_asset_records` may increase, but `runtime_verified` and `project_asset_approved` stay at their true values until Task 7.

- [ ] **Step 8: Run manifest tests and commit runtime candidates**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
git add assets/art/backgrounds assets/art/characters assets/art/ui/glyphs assets/art/ui/lens assets/art/ui/result assets/manifests docs/ASSET_LICENSE_LEDGER.md tests/test_first_session_image_batch_contract.py
git commit -m "feat(art): export first-session runtime asset candidates"
```

---

### Task 7: Godot import verification and first-session asset gallery evidence

**Files:**
- Create: `src/ui/asset_gallery/first_session_asset_gallery.gd`
- Create: `src/ui/asset_gallery/first_session_asset_gallery.tscn`
- Create: `tools/capture_first_session_asset_gallery.gd`
- Create: `.github/workflows/validate-first-session-image-assets.yml`
- Modify per-asset manifests from `runtime_validation: NOT_RUN` to `PASS` / status `RUNTIME_VERIFIED` only after actual import/render checks succeed.

**Interfaces:**
- Consumes: approved runtime candidate exports.
- Produces: one deterministic 1920×1080 gallery PNG and import/render evidence; this is asset/runtime evidence, not Human/Device/Full Slice evidence.

- [ ] **Step 1: Add RED tests for Godot importability**

Extend Python contract to require gallery/capture/workflow files. Add a Godot integration suite or script checks that `load()` returns real Texture2D for WebP/PNG/SVG runtime exports after import.

- [ ] **Step 2: Create the asset gallery scene**

Use `GrimoireThemeFactory.create_theme()` and live Labels. Layout:

```text
left top: greenhouse background crop/fit preview
right top: classroom background crop/fit preview
lower left: Maren portrait on neutral checker/navy plate
lower center: Nea source on neutral plate
lower right: glyph 3 + Lens 4 + Result 5 icon grid
```

No functional game UI claim; this is an inspection gallery.

- [ ] **Step 3: Create deterministic capture script**

Reuse the existing SubViewport capture pattern; capture exactly 1920×1080 to `build/visual/first-session-asset-gallery.png`. Fail if texture is missing, dimensions mismatch, or PNG is under 20 KB.

- [ ] **Step 4: Create dedicated CI**

Workflow steps:

```text
Python manifest/asset contract
→ Godot 4.7.1 setup
→ --headless --import
→ asset load verification
→ xvfb GL-compatibility gallery capture
→ upload gallery PNG + import/capture logs
```

- [ ] **Step 5: Run exact import/render checks**

Only after success, set per-asset `runtime_validation` to `PASS` and `status` to `RUNTIME_VERIFIED`. Do not set `PROJECT_ASSET_APPROVED` yet unless the user separately approves the runtime-rendered evidence.

- [ ] **Step 6: Commit gallery/evidence**

```bash
git add src/ui/asset_gallery tools/capture_first_session_asset_gallery.gd .github/workflows/validate-first-session-image-assets.yml assets/manifests
git commit -m "test(art): verify first-session runtime assets"
```

---

### Task 8: Final user runtime-visual approval, five-pass adversarial closure, merge, and Notion/Asset Library sync

**Files/Systems:**
- Create: `docs/planning/FIRST_SESSION_IMAGE_BATCH_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- Create: `docs/planning/sync/GR-SYNC-20260820-34-FIRST-SESSION-IMAGE-ASSETS.md`
- Update: selected manifests to `PROJECT_ASSET_APPROVED` only after explicit runtime-rendered visual approval.
- Update: Notion `ASSET LIBRARY · Master` records and TASK-13.

**Interfaces:**
- Produces: truthfully approved first-session asset set, merged SHA, source/runtime traceability, remaining validation ceilings.

- [ ] **Step 1: Present the real Godot-rendered gallery to the user**

Approval question is about project use of the actual imported exports—not just the original generation candidates. If the user requests revision, return to the owning asset task; do not patch around a bad source by silently editing unrelated assets.

- [ ] **Step 2: Promote only explicitly approved rendered assets**

For each approved manifest:

```text
status: PROJECT_ASSET_APPROVED
runtime_validation: PASS
approved_by: USER_RUNTIME_VISUAL_APPROVAL
```

If one asset is rejected, keep it `REVISION_REQUIRED` or `REJECTED` independently; do not block unrelated approved assets unless shared style identity is compromised.

- [ ] **Step 3: Adversarial pass 1 — AI artifact/consistency attack**

Review anatomy, pseudo-text, repeated architectural patterns, lighting continuity, perspective, Maren face/costume continuity, Nea silhouette/palette, and cross-scene style cohesion.

- [ ] **Step 4: Pass 2 — gameplay readability attack**

Verify backgrounds leave usable low-detail play/read zones; icons distinguish semantics at 16/24/32/48; glyph Flow/Focus/Disperse remain distinct without relying on hue.

- [ ] **Step 5: Pass 3 — rights/provenance attack**

Every approved asset must trace source File ID/path + SHA + generation brief/tool + export SHA + license evidence. Any missing link blocks `PROJECT_ASSET_APPROVED`.

- [ ] **Step 6: Pass 4 — scope/reuse attack**

Ensure no Festival batch, extra NPC portraits, growth forms, background #3, or speculative VFX was added. Verify layer-reuse labels are truthful and do not convert one-off focal art into forced generic modules.

- [ ] **Step 7: Pass 5 — evidence overclaim attack**

Runtime import/render PASS is not Human playtest, device, performance, accessibility, emotional, or Full Slice PASS. Keep those labels `NOT_RUN`.

- [ ] **Step 8: Open PR and run exact-head workflows**

Require the dedicated image asset workflow and all applicable existing Planning/Visual/Toolchain/Star workflows. Inspect changed files and review threads. Do not touch unrelated active PRs.

- [ ] **Step 9: Squash merge after exact-head success**

Use expected head SHA and re-read `main` after merge.

- [ ] **Step 10: Sync Notion Asset Library**

Create/update one record per approved runtime asset with:

```text
Name
Asset ID
Category
Record Type = ASSET
Status = APPROVED
Approved = checked
Reuse = MASTER or YES/COMPONENT as appropriate
Source
Hash
Rights / License
Implementation Path
Prompt/brief reference
Project = GRIMOIRE
Last Synced
```

Generated concept sheets that are not runtime assets remain `REFERENCE`/`WIP` or are omitted from the primary asset library depending on reuse value.

- [ ] **Step 11: Update TASK-13 and Project Home**

Record Component Sheets merged SHA (from Plan 1), image asset merged SHA, selected asset IDs, and remaining NOT_RUN boundaries. TASK-13 may be marked `완료` only when both Component Sheet implementation and this approved image batch are complete; Human/Device/Performance/Full Slice continue as separate later work.
