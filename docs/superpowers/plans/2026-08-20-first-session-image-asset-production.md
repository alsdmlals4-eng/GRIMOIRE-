# GRIMOIRE First-Session Image Asset Production Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce, review, decompose, register, and import the approved first-session image asset batch while keeping all functional UI live, preserving GRIMOIRE’s locked visual authority, and preventing generated candidates from becoming runtime assets without provenance, rights evidence, and user approval.

**Architecture:** Treat image generation as candidate-source production, never as direct runtime export. Recover approved references and briefs, generate bounded alternatives, persist each candidate with exact IDs/hashes, obtain explicit visual selection, classify reusable layers/variants using Base RM-VIS modules, then create deterministic runtime exports/manifests and a Godot asset-gallery evidence scene only for selected candidates whose rights evidence is sufficient.

**Tech Stack:** ChatGPT image generation surface, ChatGPT Files/Library, Python 3.12 for SHA/conversion/manifest validation, Pillow only for deterministic format/crop/export operations, text-free SVG for glyph/Lens/Result symbols, Godot 4.7.1 import/render verification, Python `unittest`, existing `ASSET_MANIFEST_SCHEMA.json`, Notion `ASSET LIBRARY · Master`.

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
- Base icon hard cap remains 24. Lens 4 + Result Axis 5 reuse existing common icons where semantically valid and the execution must count active base icons before adding any new symbol.
- Text/labels/numbers are live UI. No Korean/English functional text, success %, Mana, count, grade, or button label may be baked into images.
- Generated asset existence does not imply approval. Candidate → visual review → selected source → rights/provenance review → export → manifest → import → runtime verification → runtime-rendered user approval are distinct states.
- Every runtime asset must conform to `docs/planning/ASSET_MANIFEST_SCHEMA.json`; source File ID/path + SHA, tool, owner, export SHA/format/dimensions, license status/evidence, screen consumers, approval, and runtime validation are mandatory.
- Rights status is evidence-driven. Do not assume `PROJECT_ORIGINAL`, `USER_OWNED`, commercial rights, modification rights, or redistribution rights merely because an image was generated. Read the current applicable tool/service terms when the asset is selected and record evidence before runtime promotion.
- A selected asset with unresolved rights remains `license.status = REVIEW_REQUIRED` and cannot become `APPROVED_RUNTIME_CANDIDATE`, `RUNTIME_VERIFIED`, or `PROJECT_ASSET_APPROVED`.
- Source layers live in ChatGPT Library/external source storage or `.gdignore` source root; GitHub product paths receive only approved runtime exports/manifests, not uncontrolled layered masters.
- Human visual selection is required before any generated raster candidate can enter runtime export work. A second user approval of the real Godot-rendered gallery is required before `PROJECT_ASSET_APPROVED`.
- Physical-device validation, performance validation, accessibility/device validation, and Full Vertical Slice validation remain `NOT_RUN` unless actually executed.
- No Festival full-content batch, all-NPC portrait batch, Year-One full asset set, companion growth stages, guardian battlefield body, or second-incident art is authorized.

---

## File Structure

### Planning, candidate, rights, and reuse records

- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md`
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json`
- `docs/planning/visual/first_session_image_batch_01_background_candidates.json`
- `docs/planning/visual/first_session_image_batch_01_character_candidates.json`
- `docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md`
- `docs/planning/visual/first_session_image_batch_01_rights_review.json`
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md`
- `tests/test_first_session_image_batch_contract.py`

### Runtime export targets after source selection and rights clearance

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

### Runtime manifests

One JSON file under `assets/manifests/` for every runtime export above, using the export basename as the manifest basename.

### Runtime gallery and verification

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
```

---

### Task 1: Asset-batch contract RED and exact generation briefs

**Files:**
- Create: `tests/test_first_session_image_batch_contract.py`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json`

**Interfaces:**
- Consumes: Art Bible, Asset Spec, approved Board A/B manifests, Component production spec, Base RM-VIS contracts.
- Produces: seven mandatory production groups plus one conditional ornament/VFX sufficiency group; no generated asset.

- [ ] **Step 1: Write the RED contract first**

Create `tests/test_first_session_image_batch_contract.py`:

```python
from pathlib import Path
import json
import re
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

    def test_no_unresolved_template_markers_enter_runtime_manifests(self):
        manifest_root = ROOT / "assets/manifests"
        if not manifest_root.is_dir():
            return
        bad = re.compile(r"(actual_|replace_me|example_sha|example_file_id)", re.I)
        for path in manifest_root.glob("*.json"):
            self.assertNotRegex(path.read_text(encoding="utf-8"), bad, path.name)

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

Create `FIRST_SESSION_IMAGE_BATCH_01_PLAN.json` exactly as:

```json
{
  "schema_version": 1,
  "decision_id": "GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01",
  "status": "CANDIDATE_PRODUCTION_NOT_STARTED",
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

The Markdown brief must contain:

```text
NO_FUNCTIONAL_TEXT_BAKED_INTO_IMAGE
USER_VISUAL_APPROVAL_REQUIRED
NO_COMPETITOR_TRADE_DRESS_COPY
LOCKED_REFERENCE_EDIT_FORBIDDEN
```

Per-group requirements:

- **Greenhouse:** 2560×1440 source target; fixed 3/4 storybook environment; damaged frostbloom greenhouse; readable irrigation/root/spirit-channel landmarks; no characters/UI; three alternatives vary camera elevation, foreground framing, and landmark distribution while preserving one location identity.
- **Classroom:** 2560×1440 source target; same academy world; practical glyph-learning room; visible practice surface and supervised field-maintenance preparation cues; no tutorial text; three alternatives vary room orientation, practice-surface location, and staging space.
- **Maren:** half-body source; same professor identity family; neutral-to-instructive expression; Navy/Gold academy clothing family; no costume variant; alternatives vary expression, small gesture, and framing only.
- **Nea:** small wolf-like spirit; white/pale-blue; rounded face; large ears/tail; small elemental glow; no growth form; alternatives vary pose/energy emphasis only.
- **Glyph directions:** FLOW = directional curved stream; FOCUS = compressed core/convergence; DISPERSE = expanding/diverging wave. Concept sheets are reference-only; runtime glyphs are rebuilt as SVG.
- **Lens directions:** REST = recovery/quiet; PREPARE = tool/readiness; SOCIAL = people/context; PRACTICUM = field handling/comparison. Runtime icons are rebuilt as SVG.
- **Result directions:** FACILITY = structure; LIFE = living growth; SPIRIT = resonance; RELATIONSHIP = linked people/records; DISCOVERY = revealed knowledge. Runtime icons are rebuilt as SVG.
- **Ornament/VFX sufficiency:** inspect existing common ornament/phase/warning/Mana assets first. If sufficient, generate nothing. A new ornament/VFX concept requires a separate bounded revision tied to a concrete consumer.

Reject pseudo-text, watermark/logo, malformed anatomy, repeated nonsensical architectural motifs, inconsistent costume/face, crowded gameplay/read zones, or style drift.

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
- Write candidates only to the background candidate Library roots.
- Create: `docs/planning/visual/first_session_image_batch_01_background_candidates.json`

**Interfaces:**
- Consumes: exact references + background briefs.
- Produces: six candidate records containing observed IDs/dimensions/SHA; no runtime export.

- [ ] **Step 1: Recover exact references through Files/Library**

Search for the locked reference and Board A/B by exact names. Read native images. Verify the locked reference record names the expected SHA. If the exact locked reference cannot be recovered, stop generation and record the blocker instead of substituting another image.

- [ ] **Step 2: Generate exactly three Greenhouse alternatives**

Use the image-generation surface with the approved references in context. The request must state: same GRIMOIRE visual language, soft storybook fixed 3/4 greenhouse, frostbloom damage/pressure context, readable irrigation/root/spirit-channel landmarks, quiet gameplay center, no characters, no UI, no text/signage/pseudo-text, 16:9 composition. Candidate axes are camera elevation, foreground framing, and landmark distribution—not world style.

- [ ] **Step 3: Recover generated file IDs and persist candidates**

After generation, use Files search scoped to the current conversation with `model_generated=true` and identify exactly the three new Greenhouse images. Materialize each once for SHA calculation, then upload/copy each to the Greenhouse Library folder as `greenhouse_candidate_01.png`, `greenhouse_candidate_02.png`, `greenhouse_candidate_03.png`. Record actual returned Library path/file ID, dimensions, byte size, generation identifier if surfaced, and SHA-256.

- [ ] **Step 4: Generate and persist exactly three Classroom alternatives**

Repeat with the Classroom brief and save as `classroom_candidate_01.png` through `03.png`.

- [ ] **Step 5: Write the background candidate receipt from observed metadata**

The receipt uses this schema and receives values directly from tool/read/hash results:

```json
{
  "schema_version": 1,
  "status": "IN_VISUAL_REVIEW",
  "groups": {
    "GREENHOUSE_BACKGROUND": {"selected_file_id": null, "candidates": []},
    "CLASSROOM_BACKGROUND": {"selected_file_id": null, "candidates": []}
  },
  "runtime_export_created": false,
  "runtime_validation": "NOT_RUN"
}
```

Each candidate object contains `file_id`, `library_path`, `sha256`, `width`, `height`, and `generation_id` only when that ID is actually surfaced.

- [ ] **Step 6: Present all six candidates to the user for visual selection**

Show A/B/C for each group with one-line differences. Do not auto-select. Record the exact selected file IDs after the user chooses or requests a bounded revision.

- [ ] **Step 7: Commit provenance/selection receipt only**

```bash
git add docs/planning/visual/first_session_image_batch_01_background_candidates.json
git commit -m "docs(art): record first-session background candidates"
```

---

### Task 3: Generate Maren and Nea identity-safe candidates and select source families

**Files/Library:**
- Candidate roots: Maren and Nea Library folders.
- Create: `docs/planning/visual/first_session_image_batch_01_character_candidates.json`

**Interfaces:**
- Consumes: Art Bible/Board continuity + Base `RM-VIS-005`.
- Produces: one user-selected Maren source and one user-selected Nea source; no runtime export.

- [ ] **Step 1: Record only supported identity locks**

Before generation, write the candidate receipt with immutable axes:

```json
{
  "maren": {
    "role": "mentor_professor",
    "costume_family": "navy_gold_academy",
    "allowed_variation_axes": ["expression", "gaze", "small_gesture", "framing"],
    "new_costume_allowed": false
  },
  "nea": {
    "body_family": "small_wolf_spirit",
    "palette_family": "white_pale_blue",
    "rounded_face": true,
    "large_ears_tail_silhouette": true,
    "small_elemental_glow": true,
    "growth_form_allowed": false
  }
}
```

If a facial/costume detail is not supported by the approved reference, do not add it to the lock.

- [ ] **Step 2: Generate exactly three Maren candidates**

Use transparent background when supported. Hold costume/palette/light family constant and vary only instructive expression, small gesture, and framing. Reject face drift, costume redesign, extra accessories, pseudo-text, or style drift.

- [ ] **Step 3: Generate exactly three Nea candidates**

Use transparent background when supported. Hold body/palette/silhouette family fixed; vary neutral, alert, and field-attention poses only. Reject armor/evolution, mount scale, extra tails/wings, or mascot redesign.

- [ ] **Step 4: Persist, materialize once, hash, and record candidates**

Use the same Files/Library procedure as Task 2. Every candidate record gets observed file ID/path/SHA/dimensions. Status remains `IN_VISUAL_REVIEW`.

- [ ] **Step 5: User selects one Maren and one Nea source family**

Record selected file IDs. Selection promotes the source family only to `SOURCE_READY`; it does not imply runtime import or rights clearance.

- [ ] **Step 6: Commit character receipt**

```bash
git add docs/planning/visual/first_session_image_batch_01_character_candidates.json
git commit -m "docs(art): record first-session character candidates"
```

---

### Task 4: Explore symbol directions, select directions, then author final SVG symbols

**Files:**
- Candidate concept sheets: Library only.
- Create final 12 SVGs at the runtime paths listed in File Structure.
- Create: `docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md`
- Modify: `tests/test_first_session_image_batch_contract.py`

**Interfaces:**
- Consumes: Base `RM-VIS-002`, selected GRIMOIRE visual language, existing simple SVG conventions.
- Produces: 3 glyph + 4 Lens + 5 Result SVGs; text-free, raster-free, filter-free.

- [ ] **Step 1: Generate three concept-direction sheets for each symbol family**

Use image generation for visual exploration only. Each sheet contains all members of its family without readable text. Persist concept sheets as `REFERENCE_ONLY`; never import them directly into runtime.

- [ ] **Step 2: Obtain one user-selected direction per family**

Review at semantic criteria: 16/24/32/48 px legibility, GRIMOIRE identity, shape distinctness, AI-look reduction, and no collision with existing Mana/Warning/Phase symbols.

- [ ] **Step 3: Write SVG RED assertions**

Extend the Python contract:

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
    path = ROOT / relative
    self.assertTrue(path.is_file(), relative)
    text = path.read_text(encoding="utf-8").lower()
    self.assertIn("<svg", text)
    self.assertRegex(text, r"<(path|circle|polygon|line|rect)\b")
    for forbidden in ("<text", "<image", "<filter", "data:image", "font-family"):
        self.assertNotIn(forbidden, text)
```

Run RED; expected: missing SVGs.

- [ ] **Step 4: Author the three glyph SVGs from semantic geometry**

Use simple project-authored paths, not trace copies of concept-sheet pixels:

```text
FLOW      = continuous curved stream + secondary parallel accent
FOCUS     = converging outer geometry + small central core
DISPERSE  = central origin + three expanding/diverging arcs
```

- [ ] **Step 5: Author Lens SVGs**

```text
REST      = quiet crescent/settled pulse
PREPARE   = compact tool/readiness diamond + handle
SOCIAL    = two linked nodes + context bridge
PRACTICUM = field marker + handling/compare split
```

- [ ] **Step 6: Author Result SVGs**

```text
FACILITY      = structural arch/beam
LIFE          = sprout/leaf
SPIRIT        = resonance spiral/core
RELATIONSHIP  = two linked rings/nodes
DISCOVERY     = open-page/reveal silhouette without letters
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

**Interfaces:**
- Consumes: selected source candidates + Base `RM-VIS-003/004/005`.
- Produces: truthful layer provenance/reuse classification and one ornament/VFX sufficiency verdict.

- [ ] **Step 1: Classify selected backgrounds**

For each selected background, record `base_environment`, `midground`, `foreground_props`, `lighting`, `story_state_overlay`, `atmosphere_fx`. Each part gets one provenance: `SOURCE_LAYER`, `MASK_CUTOUT`, `MANUAL_OR_SEMANTIC_REBUILD`, or `DERIVED_GENERATIVE_RECOVERY`. Generated recovery of an occluded region is never labeled `SOURCE_LAYER`.

- [ ] **Step 2: Classify selected Maren/Nea families**

Maren is `VARIANT_SEED` for expression-only variants. Nea is `VARIANT_SEED` for bounded pose/reaction variants. Record growth form and costume-family expansion as outside this batch.

- [ ] **Step 3: Inspect existing ornament/icon assets**

Check `assets/art/ui/common/academy_corner_ornament.svg`, phase/warning/Mana icons, and existing StarCircuitBoard visuals against Component Sheets A–D. If sufficient, record `NO_NEW_ORNAMENT_VFX_REQUIRED`. If one concrete semantic gap remains, stop and create a separate bounded design before generation; do not add speculative art here.

- [ ] **Step 4: Run five adversarial reuse passes**

1. Primary-quality attack — decomposition must not degrade the selected primary image.
2. Fake-layer attack — generated reconstruction provenance is truthful.
3. Identity-drift attack — variant seed boundaries protect face/costume/world identity.
4. Over-reuse attack — one-off focal parts are not forced into generic modules.
5. Scope-creep attack — optional ornament/VFX has not become an unowned batch.

- [ ] **Step 5: Commit reuse review**

```bash
git add docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md
git commit -m "docs(art): classify first-session asset reuse"
```

---

### Task 6: Rights review, deterministic exports, and schema-valid manifests

**Files:**
- Create: `docs/planning/visual/first_session_image_batch_01_rights_review.json`
- Create: selected raster runtime exports.
- Create: one manifest per runtime export/symbol under `assets/manifests/`.
- Modify: `tests/test_first_session_image_batch_contract.py`
- Modify: `docs/ASSET_LICENSE_LEDGER.md` with observed records only.

**Interfaces:**
- Consumes: exact selected Library file IDs, computed SHA-256 values, current tool/service rights evidence, selected SVGs.
- Produces: runtime candidates only when rights status is resolved; otherwise a documented block.

- [ ] **Step 1: Perform current rights review before export promotion**

Read the current applicable generation/service terms and any project policy relevant to ownership, commercial use, modification, redistribution, and required credit. Record one entry per selected raster source:

```json
{
  "source_file_id": "file_00000000000000000000000000000000",
  "status": "REVIEW_REQUIRED",
  "evidence": [],
  "commercial_use": "UNRESOLVED",
  "modification": "UNRESOLVED",
  "redistribution": "UNRESOLVED",
  "credit_required": "UNRESOLVED"
}
```

The literal example file ID above is schema illustration in the planning document only; execution writes the rights-review file from the exact selected file ID returned by Files. It must not be copied into a project record. After checking current evidence, change `status` only to a schema-supported resolved status whose claims are directly supported. If unresolved, stop runtime promotion for that asset.

- [ ] **Step 2: Materialize selected sources by exact file ID and verify source SHA**

For each selected source, materialize it once, compute SHA-256, and compare it to the selected-candidate receipt. Mismatch is a hard block.

- [ ] **Step 3: Export raster assets without creative alteration**

Use deterministic conversion only:

```text
bg_greenhouse_field_base.webp  2560×1440 WebP lossless alpha=false
bg_school_common.webp           2560×1440 WebP lossless alpha=false
chr_maren_portrait_instructive.png 1024×1536 PNG RGBA
chr_nea_field_neutral.png       256×256 PNG RGBA
```

If a source requires creative anatomy/background repair rather than deterministic crop/mask cleanup, return to image editing/generation and user review; do not hide creative repair inside export code.

- [ ] **Step 4: Add manifest-validation helpers to the Python contract before writing manifests**

Add:

```python
import hashlib

SHA_RE = re.compile(r"^[a-f0-9]{64}$")
ALLOWED_RESOLVED_LICENSE = {"PROJECT_ORIGINAL", "USER_OWNED", "COMMERCIAL_USE_APPROVED"}

def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def assert_runtime_manifest(testcase: unittest.TestCase, manifest: dict, manifest_path: Path):
    testcase.assertRegex(manifest["source"]["sha256"], SHA_RE, manifest_path.name)
    testcase.assertRegex(manifest["export"]["sha256"], SHA_RE, manifest_path.name)
    testcase.assertIn(manifest["license"]["status"], ALLOWED_RESOLVED_LICENSE, manifest_path.name)
    testcase.assertNotEqual("REVIEW_REQUIRED", manifest["license"]["status"])
    testcase.assertEqual(sha256_file(ROOT / manifest["export"]["file_path"]), manifest["export"]["sha256"])
    testcase.assertEqual("NOT_RUN", manifest["runtime_validation"])
```

Run RED; expected: manifests do not yet exist.

- [ ] **Step 5: Generate manifests from observed records, never from template strings**

Create a local script during execution (or a one-shot Python command) that loads the selected candidate receipt and rights-review record, reads the exported file, computes both hashes, and builds the manifest dictionary. The builder contract is:

```python
def build_manifest(*, asset_id, role, decision_ids, source_record, rights_record,
                   export_path, export_format, width, height, alpha,
                   import_profile, used_in_screens):
    source_file_id = source_record["file_id"]
    source_sha = source_record["sha256"]
    license_status = rights_record["status"]
    evidence = rights_record["evidence"]
    assert source_file_id
    assert SHA_RE.fullmatch(source_sha)
    assert license_status in ALLOWED_RESOLVED_LICENSE
    assert evidence
    export_sha = sha256_file(ROOT / export_path)
    return {
        "schema_version": 1,
        "asset_id": asset_id,
        "role": role,
        "decision_ids": decision_ids,
        "source": {
            "storage": "EXTERNAL_LIBRARY",
            "file_id_or_path": source_file_id,
            "sha256": source_sha,
            "tool": source_record["tool"],
            "owner": source_record["owner"],
            "prompt_or_brief_path": "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md",
            "parent_asset_ids": source_record.get("parent_asset_ids", []),
        },
        "export": {
            "file_path": str(export_path),
            "sha256": export_sha,
            "format": export_format,
            "width": width,
            "height": height,
            "alpha": alpha,
            "import_profile": import_profile,
        },
        "license": {
            "status": license_status,
            "evidence": " | ".join(evidence),
            "credit_required": rights_record["credit_required"],
            "modification_allowed": rights_record["modification_allowed"],
            "redistribution_allowed": rights_record["redistribution_allowed"],
        },
        "status": "APPROVED_RUNTIME_CANDIDATE",
        "approved_by": "USER_VISUAL_SELECTION",
        "approved_at": "2026-08-20",
        "used_in_screens": used_in_screens,
        "runtime_validation": "NOT_RUN",
    }
```

For project-authored SVGs, source storage/path/tool/owner come from the authored SVG and the symbol-direction review, with the same evidence-driven rights requirement; do not fabricate Library IDs for SVGs.

- [ ] **Step 6: Validate every manifest and perform a marker scan**

Run the Python contract and additionally:

```bash
python - <<'PY'
from pathlib import Path
import re
bad = re.compile(r'(actual_|replace_me|example_sha|example_file_id)', re.I)
for path in Path('assets/manifests').glob('*.json'):
    text = path.read_text(encoding='utf-8')
    if bad.search(text):
        raise SystemExit(f'unresolved marker in {path}')
print('manifest marker scan: PASS')
PY
```

- [ ] **Step 7: Update Asset License Ledger with observed values only**

Increase counts only for records actually created. Runtime verified/project-approved counts remain unchanged at this point.

- [ ] **Step 8: Commit runtime candidates**

```bash
git add docs/planning/visual/first_session_image_batch_01_rights_review.json assets/art/backgrounds assets/art/characters assets/art/ui/glyphs assets/art/ui/lens assets/art/ui/result assets/manifests docs/ASSET_LICENSE_LEDGER.md tests/test_first_session_image_batch_contract.py
git commit -m "feat(art): export first-session runtime asset candidates"
```

---

### Task 7: Godot import verification and first-session asset gallery evidence

**Files:**
- Create: `src/ui/asset_gallery/first_session_asset_gallery.gd`
- Create: `src/ui/asset_gallery/first_session_asset_gallery.tscn`
- Create: `tools/capture_first_session_asset_gallery.gd`
- Create: `.github/workflows/validate-first-session-image-assets.yml`
- Modify: manifests only after actual import/render checks succeed.

**Interfaces:**
- Consumes: approved runtime candidates.
- Produces: real Texture2D load evidence + one 1920×1080 GL-compatible gallery PNG; not Human/Device/Full Slice evidence.

- [ ] **Step 1: Add RED checks for gallery files and importability**

Extend Python contract to require gallery/capture/workflow files. Add `tests/integration/test_first_session_asset_gallery.gd` and register it in `tests/test_runner.gd`. The suite loads every runtime export path from its manifest and asserts returned resources are non-null Texture2D objects.

- [ ] **Step 2: Create the inspection gallery scene**

Use `GrimoireThemeFactory.create_theme()` and live Labels. Layout:

```text
left top: greenhouse background fit preview
right top: classroom background fit preview
lower left: Maren portrait on neutral Navy plate
lower center: Nea source on neutral plate
lower right: glyph 3 + Lens 4 + Result 5 icon grid
```

No functional game UI is baked into art or implied by this gallery.

- [ ] **Step 3: Create deterministic 1920×1080 capture**

Reuse the existing SubViewport pattern: fresh scene, `Vector2i(1920, 1080)`, five process frames, `RenderingServer.force_draw`, save to `build/visual/first-session-asset-gallery.png`, fail on dimension mismatch or file size under 20 KB.

- [ ] **Step 4: Create dedicated CI**

Workflow sequence:

```text
Python manifest/asset contract
→ Godot 4.7.1 setup
→ --headless --import
→ full custom test runner
→ xvfb GL-compatibility gallery capture
→ assert gallery PNG non-empty
→ upload gallery PNG + import/test/capture logs
```

- [ ] **Step 5: Promote import-successful manifests only to `RUNTIME_VERIFIED`**

After exact checks succeed, set `runtime_validation = PASS` and `status = RUNTIME_VERIFIED`. Do not set `PROJECT_ASSET_APPROVED` in this task.

- [ ] **Step 6: Commit runtime evidence**

```bash
git add src/ui/asset_gallery tests/integration/test_first_session_asset_gallery.gd tests/test_runner.gd tools/capture_first_session_asset_gallery.gd .github/workflows/validate-first-session-image-assets.yml assets/manifests
git commit -m "test(art): verify first-session runtime assets"
```

---

### Task 8: Runtime-rendered user approval, five-pass closure, merge, and Notion sync

**Files/Systems:**
- Create: `docs/planning/FIRST_SESSION_IMAGE_BATCH_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- Create: `docs/planning/sync/GR-SYNC-20260820-34-FIRST-SESSION-IMAGE-ASSETS.md`
- Modify: manifests to `PROJECT_ASSET_APPROVED` only after explicit approval of the real Godot-rendered gallery.
- Update: Notion Asset Library records and TASK-13.

**Interfaces:**
- Produces: truthfully approved first-session runtime asset set + merged SHA + source/runtime traceability.

- [ ] **Step 1: Present the actual Godot-rendered gallery to the user**

Ask approval of the imported/exported assets. If an asset needs revision, return to its owning generation/source task; do not silently patch other assets to compensate.

- [ ] **Step 2: Promote only explicitly approved assets**

For each approved manifest set:

```text
status = PROJECT_ASSET_APPROVED
runtime_validation = PASS
approved_by = USER_RUNTIME_VISUAL_APPROVAL
```

Rejected assets remain `REVISION_REQUIRED` or `REJECTED` independently.

- [ ] **Step 3: Adversarial pass 1 — AI artifact/consistency**

Review anatomy, pseudo-text, repeated nonsensical architecture, lighting/perspective, Maren identity, Nea silhouette/palette, and cross-scene style cohesion.

- [ ] **Step 4: Pass 2 — gameplay readability**

Verify backgrounds preserve quieter play/read zones; icons distinguish semantics at 16/24/32/48; FLOW/FOCUS/DISPERSE remain distinct without hue.

- [ ] **Step 5: Pass 3 — rights/provenance**

Every approved asset must trace source ID/path + SHA + brief/tool + rights evidence + export SHA. Any missing link blocks final approval.

- [ ] **Step 6: Pass 4 — scope/reuse**

Verify no Festival batch, extra NPC portraits, growth forms, speculative extra backgrounds, or unconsumed VFX. Verify layer provenance remains truthful.

- [ ] **Step 7: Pass 5 — evidence overclaim**

Runtime import/render PASS is not Human playtest, physical-device, performance, accessibility, emotion/fun, or Full Slice PASS. Keep those labels `NOT_RUN`.

- [ ] **Step 8: Open PR and require exact-head checks**

Require the dedicated image asset workflow plus all applicable Planning/Visual/Toolchain/Star workflows. Inspect changed files and review threads. Do not touch unrelated active PRs.

- [ ] **Step 9: Squash merge with expected head SHA after clean readback**

Re-read GRIMOIRE `main` after merge and record the merge SHA in Sync34.

- [ ] **Step 10: Sync Notion `ASSET LIBRARY · Master`**

Create/update one record per approved runtime asset with Name, Asset ID, Category, Record Type `ASSET`, Status `APPROVED`, Approved checked, Reuse classification, Source, Hash, Rights/License, Implementation Path, Prompt/brief reference, Project relation, and Last Synced. Concept direction sheets remain reference records or are omitted when they have no reusable value.

- [ ] **Step 11: Close TASK-13 only when both plans are complete**

Record Component Sheet merged SHA, image asset merged SHA, selected asset IDs, and remaining `NOT_RUN` boundaries. Mark TASK-13 `완료` only when Component Sheets A–D and this image batch are both merged/synced; Human/Device/Performance/Full Slice remain separate follow-up validation work.
