# GRIMOIRE First-Session Image Asset Production Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce, review, decompose, register, and import the approved first-session image asset batch while keeping functional UI live, preserving GRIMOIRE’s locked visual authority, and preventing generated candidates from becoming runtime assets without provenance, rights evidence, and user approval.

**Architecture:** Image generation produces candidate sources, never direct runtime exports. The workflow recovers exact approved references, generates bounded alternatives, persists every candidate with observed IDs/hashes, obtains explicit user selection, performs rights/provenance review, classifies reuse/layers, exports selected sources deterministically, creates schema-valid manifests from observed records, then verifies the real imports in Godot before final project-asset approval.

**Tech Stack:** ChatGPT image generation, ChatGPT Files/Library, Python 3.12, Pillow for deterministic format/crop/export operations only, project-authored text-free SVG, Godot 4.7.1, Python `unittest`, `ASSET_MANIFEST_SCHEMA.json`, Notion `ASSET LIBRARY · Master`.

**Spec:** `docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md`

## Global Constraints

- Project authority at plan creation: GRIMOIRE `main` `4c2f23c4bb8b7487559b113a5d41deab815fb62d`.
- Base observation: `e222e93e79e95364dca668eaaf0f156676123342`; reuse `RM-VIS-002`, `RM-VIS-003`, `RM-VIS-004`, `RM-VIS-005` as structural contracts only.
- Locked visual authority: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`, SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`. Never edit, regenerate, recolor, crop-replace, or overwrite it.
- Approved Board A/B are composition/checkpoint references. Their embedded text/numbers are noncanonical and cannot become runtime UI sprites.
- Visual language: `SOFT_STORYBOOK_ENVIRONMENT + CLEAN_ANIME_CEL_CHARACTER_OVER_STORYBOOK_BACKGROUND + NAVY_GOLD_MAGIC_ACADEMY_FRAME`.
- Review axes: AI-generated-look reduction, style consistency/readability, world/core-system fit.
- Background source target: `2560×1440`; opaque runtime export: WebP Lossless, no alpha.
- Maren portrait runtime canvas: `1024×1536 RGBA`; professor costume family remains unchanged.
- Nea runtime source target: `256×256 RGBA` after deterministic downscale/crop from a higher-resolution selected source.
- First-session glyphs remain exactly `FLOW / FOCUS / DISPERSE`; final runtime glyphs are project-authored SVG.
- Base icon hard cap remains 24. Count existing active icons before adding Lens 4 + Result 5; reuse existing semantics when valid.
- Functional text, success %, Mana, counts, grades, focus/selection truth, and button labels are live UI, never raster content.
- Candidate existence is not approval. State progression is `generated candidate → visual review → selected source → rights/provenance cleared → runtime candidate → imported/runtime verified → runtime-rendered user approval → PROJECT_ASSET_APPROVED`.
- Every runtime asset follows `docs/planning/ASSET_MANIFEST_SCHEMA.json` with real source/export hashes, rights evidence, consumer screens, and truthful runtime status.
- Rights are evidence-driven. Generation alone does not prove ownership, commercial use, modification, redistribution, or credit conditions. Review current applicable terms at execution time.
- `license.status = REVIEW_REQUIRED` blocks runtime-candidate promotion.
- Source candidates/layers stay in Library or a non-runtime source root. GitHub product paths receive selected runtime exports, authored SVGs, manifests, and evidence only.
- User visual selection is required before raster export work. A second user approval of the actual Godot-rendered gallery is required before `PROJECT_ASSET_APPROVED`.
- Physical-device, accessibility/device, performance, Human play, and Full Vertical Slice validation remain `NOT_RUN` unless actually executed.
- No Festival full-content batch, all-NPC portrait batch, Year-One full asset set, companion growth stages, guardian battlefield body, or second-incident art.

---

## File Structure

**Planning/evidence**
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md`
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json`
- `docs/planning/visual/first_session_image_batch_01_background_candidates.json`
- `docs/planning/visual/first_session_image_batch_01_character_candidates.json`
- `docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md`
- `docs/planning/visual/first_session_image_batch_01_rights_review.json`
- `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md`
- `tests/test_first_session_image_batch_contract.py`

**Runtime raster exports after selection/rights clearance**
- `assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp`
- `assets/art/backgrounds/school/bg_school_common.webp`
- `assets/art/characters/professor/chr_maren_portrait_instructive.png`
- `assets/art/characters/companion/chr_nea_field_neutral.png`

**Runtime SVGs**
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

**Runtime manifest/gallery**
- One `assets/manifests/<export-basename>.json` per runtime export/SVG.
- `src/ui/asset_gallery/first_session_asset_gallery.gd`
- `src/ui/asset_gallery/first_session_asset_gallery.tscn`
- `tests/integration/test_first_session_asset_gallery.gd`
- `tools/capture_first_session_asset_gallery.gd`
- `.github/workflows/validate-first-session-image-assets.yml`
- `docs/planning/FIRST_SESSION_IMAGE_BATCH_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- `docs/planning/sync/GR-SYNC-20260820-34-FIRST-SESSION-IMAGE-ASSETS.md`

**Library roots**
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

### Task 1: Contract RED and exact image briefs

**Files:**
- Create: `tests/test_first_session_image_batch_contract.py`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md`
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json`

**Interfaces:**
- Consumes: Art Bible, Asset Spec, Board A/B manifests, production spec, Base RM-VIS contracts.
- Produces: exactly seven production groups plus one ornament/VFX sufficiency check; no image output.

- [ ] **Step 1: Write the failing Python contract**

```python
from pathlib import Path
import json
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
PLAN = ROOT / "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json"
BRIEF = ROOT / "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md"
SCHEMA = ROOT / "docs/planning/ASSET_MANIFEST_SCHEMA.json"
EXPECTED = [
    "GREENHOUSE_BACKGROUND", "CLASSROOM_BACKGROUND", "MAREN_PORTRAIT",
    "NEA_SOURCE", "GLYPH_SYMBOLS", "LENS_SYMBOLS", "RESULT_AXIS_SYMBOLS",
    "ORNAMENT_VFX_SUFFICIENCY",
]

class FirstSessionImageBatchContractTests(unittest.TestCase):
    def test_plan_and_brief_exist(self):
        self.assertTrue(PLAN.is_file())
        self.assertTrue(BRIEF.is_file())

    def test_candidate_plan_has_bounded_groups(self):
        data = json.loads(PLAN.read_text(encoding="utf-8"))
        self.assertEqual(EXPECTED, [row["group_id"] for row in data["groups"]])
        self.assertFalse(data["mass_generation_authorized"])
        self.assertTrue(all(row["status"] == "PLANNED" for row in data["groups"]))
        self.assertTrue(all(row["runtime_validation"] == "NOT_RUN" for row in data["groups"]))

    def test_brief_preserves_visual_authority_and_live_text_boundary(self):
        text = BRIEF.read_text(encoding="utf-8")
        self.assertIn("b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a", text)
        self.assertIn("NO_FUNCTIONAL_TEXT_BAKED_INTO_IMAGE", text)
        self.assertIn("USER_VISUAL_APPROVAL_REQUIRED", text)

    def test_manifest_schema_keeps_traceability_fields(self):
        schema = json.loads(SCHEMA.read_text(encoding="utf-8"))
        for key in ("asset_id", "source", "export", "license", "status", "used_in_screens", "runtime_validation"):
            self.assertIn(key, schema["required"])

    def test_runtime_manifests_contain_no_template_markers(self):
        root = ROOT / "assets/manifests"
        if not root.is_dir():
            return
        marker = re.compile(r"(replace_me|example_sha|example_file_id|__fill__)", re.I)
        for path in root.glob("*.json"):
            self.assertNotRegex(path.read_text(encoding="utf-8"), marker, path.name)

if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run RED**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
```

Expected: failure because BRIEF/PLAN do not exist.

- [ ] **Step 3: Create the bounded machine plan**

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

- [ ] **Step 4: Write the exact brief**

Global tokens in the brief:
```text
NO_FUNCTIONAL_TEXT_BAKED_INTO_IMAGE
USER_VISUAL_APPROVAL_REQUIRED
NO_COMPETITOR_TRADE_DRESS_COPY
LOCKED_REFERENCE_EDIT_FORBIDDEN
```

Group requirements:
- Greenhouse: 2560×1440 target, fixed 3/4 storybook environment, frostbloom damage/pressure, readable irrigation/root/spirit-channel landmarks, no characters/UI/text; alternatives vary camera elevation, foreground framing, landmark distribution.
- Classroom: 2560×1440 target, same academy world, practice surface + field-maintenance preparation cues, no tutorial text; alternatives vary room orientation, practice-surface location, staging area.
- Maren: half-body source, professor identity/costume family fixed, neutral-to-instructive; vary expression, small gesture, framing only.
- Nea: small white/pale-blue wolf spirit, rounded face, large ears/tail, small elemental glow, no growth form; vary pose/energy emphasis only.
- Glyph directions: FLOW curved directional stream; FOCUS compressed convergence/core; DISPERSE expanding/diverging wave.
- Lens directions: REST recovery/quiet; PREPARE tool/readiness; SOCIAL people/context; PRACTICUM field handling/comparison.
- Result directions: FACILITY structure; LIFE growth; SPIRIT resonance; RELATIONSHIP linked nodes; DISCOVERY revealed knowledge.
- Ornament/VFX: inspect existing common assets first; no speculative generation.

Reject pseudo-text/watermarks, malformed anatomy, nonsensical repeated architecture, identity drift, crowded gameplay/read zones, and style drift.

- [ ] **Step 5: Run GREEN and commit**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
git add tests/test_first_session_image_batch_contract.py docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_PLAN.json
git commit -m "test(art): define first-session image batch contract"
```

---

### Task 2: Generate and select Greenhouse/Classroom candidates

**Files/Library:**
- Read: exact locked reference + Board A/B.
- Write: 3 Greenhouse + 3 Classroom candidates to Library roots.
- Create: `docs/planning/visual/first_session_image_batch_01_background_candidates.json`

**Interfaces:**
- Produces: six candidate records with observed file IDs/paths/hashes/dimensions; no runtime exports.

- [ ] **Step 1: Recover exact references**

Search Library by exact names; inspect native images. Verify the locked reference record names the required SHA. If exact recovery fails, record blocker and stop candidate generation.

- [ ] **Step 2: Generate exactly three Greenhouse candidates**

Image-generation request must preserve GRIMOIRE style, 3/4 greenhouse, frostbloom pressure/damage, irrigation/root/spirit-channel landmarks, quiet gameplay center, no characters/UI/text, 16:9. Only composition axes vary.

- [ ] **Step 3: Recover generated file IDs, hash once, and persist**

Use current-conversation Files search with `model_generated=true`, identify the three new outputs, materialize once for SHA/dimensions, and upload/copy to Library as `greenhouse_candidate_01.png` through `03.png`.

- [ ] **Step 4: Generate/persist exactly three Classroom candidates**

Use the Classroom brief and save `classroom_candidate_01.png` through `03.png`.

- [ ] **Step 5: Build the receipt from observed metadata**

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

Each candidate object is populated from tool outputs with `file_id`, `library_path`, `sha256`, `width`, `height`, and `generation_id` only if surfaced.

- [ ] **Step 6: User selects one candidate per group**

Present A/B/C differences. Do not auto-select. Write the selected exact file IDs into the receipt after user choice.

- [ ] **Step 7: Commit receipt only**

```bash
git add docs/planning/visual/first_session_image_batch_01_background_candidates.json
git commit -m "docs(art): record first-session background candidates"
```

---

### Task 3: Generate and select Maren/Nea source families

**Files/Library:**
- Write: 3 Maren + 3 Nea candidates.
- Create: `docs/planning/visual/first_session_image_batch_01_character_candidates.json`

**Interfaces:**
- Consumes: Art Bible/Board continuity + RM-VIS-005.
- Produces: one selected Maren and one selected Nea source; no runtime export.

- [ ] **Step 1: Record supported identity locks**

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

Do not add unsupported facial/costume details to the lock.

- [ ] **Step 2: Generate exactly three Maren candidates**

Transparent background when supported; costume/palette/light family fixed; vary only expression, small gesture, framing. Reject face drift/costume redesign/accessory creep.

- [ ] **Step 3: Generate exactly three Nea candidates**

Transparent background when supported; body/palette/silhouette fixed; vary neutral, alert, field-attention poses. Reject growth/armor/mount scale/extra appendages.

- [ ] **Step 4: Persist/hash/record all six outputs**

Use the same Files/Library procedure as Task 2. Status remains `IN_VISUAL_REVIEW`.

- [ ] **Step 5: User selects one Maren and one Nea source**

Write selected file IDs; selection moves source family only to `SOURCE_READY`.

- [ ] **Step 6: Commit receipt**

```bash
git add docs/planning/visual/first_session_image_batch_01_character_candidates.json
git commit -m "docs(art): record first-session character candidates"
```

---

### Task 4: Explore symbol directions and author final SVGs

**Files:**
- Library: concept direction sheets only.
- Create: 12 runtime SVGs listed in File Structure.
- Create: `docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md`
- Modify: `tests/test_first_session_image_batch_contract.py`

**Interfaces:**
- Consumes: RM-VIS-002 + GRIMOIRE visual language.
- Produces: text-free/raster-free/filter-free SVGs.

- [ ] **Step 1: Generate three direction sheets per symbol family**

Generate glyph, Lens, and Result family sheets separately; no readable text. Persist as `REFERENCE_ONLY`.

- [ ] **Step 2: User chooses one direction per family**

Evaluate 16/24/32/48 px legibility, semantic distinctness, GRIMOIRE fit, AI-look reduction, collision with existing symbols.

- [ ] **Step 3: Add SVG RED checks**

```python
SVG_PATHS = [
    "assets/art/ui/glyphs/glyph_flow.svg", "assets/art/ui/glyphs/glyph_focus.svg", "assets/art/ui/glyphs/glyph_disperse.svg",
    "assets/art/ui/lens/icon_lens_rest.svg", "assets/art/ui/lens/icon_lens_prepare.svg", "assets/art/ui/lens/icon_lens_social.svg", "assets/art/ui/lens/icon_lens_practicum.svg",
    "assets/art/ui/result/icon_result_facility.svg", "assets/art/ui/result/icon_result_life.svg", "assets/art/ui/result/icon_result_spirit.svg",
    "assets/art/ui/result/icon_result_relationship.svg", "assets/art/ui/result/icon_result_discovery.svg",
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

Run RED; missing SVGs are expected.

- [ ] **Step 4: Author glyph SVGs from semantic geometry**

```text
FLOW = continuous curved stream + secondary parallel accent
FOCUS = converging outer geometry + small central core
DISPERSE = central origin + three expanding/diverging arcs
```

Do not trace concept-sheet pixels.

- [ ] **Step 5: Author Lens SVGs**

```text
REST = quiet crescent/settled pulse
PREPARE = tool/readiness diamond + handle
SOCIAL = linked nodes + context bridge
PRACTICUM = field marker + handling/compare split
```

- [ ] **Step 6: Author Result SVGs**

```text
FACILITY = structural arch/beam
LIFE = sprout/leaf
SPIRIT = resonance spiral/core
RELATIONSHIP = linked rings/nodes
DISCOVERY = open-page/reveal silhouette without letters
```

- [ ] **Step 7: Test and commit**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
git add assets/art/ui/glyphs assets/art/ui/lens assets/art/ui/result tests/test_first_session_image_batch_contract.py docs/planning/visual/first_session_image_batch_01_symbol_direction_review.md
git commit -m "feat(art): add first-session semantic symbols"
```

---

### Task 5: Layer/reuse review and ornament/VFX sufficiency

**Files:**
- Create: `docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md`

**Interfaces:**
- Consumes: selected sources + RM-VIS-003/004/005.
- Produces: truthful provenance/reuse classification; one sufficiency verdict.

- [ ] **Step 1: Classify each selected background**

Record `base_environment`, `midground`, `foreground_props`, `lighting`, `story_state_overlay`, `atmosphere_fx`; each part gets exactly one provenance: `SOURCE_LAYER`, `MASK_CUTOUT`, `MANUAL_OR_SEMANTIC_REBUILD`, `DERIVED_GENERATIVE_RECOVERY`.

- [ ] **Step 2: Classify Maren/Nea**

Maren = `VARIANT_SEED` for expression-only variants. Nea = `VARIANT_SEED` for bounded pose/reaction variants. Growth/costume expansion remains outside scope.

- [ ] **Step 3: Inspect existing ornament/VFX assets**

Check `academy_corner_ornament.svg`, phase/warning/Mana icons, StarCircuitBoard visuals. If sufficient, record `NO_NEW_ORNAMENT_VFX_REQUIRED`. A concrete missing semantic triggers a separate bounded design, not speculative generation here.

- [ ] **Step 4: Run five reuse adversarial passes**

1. Primary-quality attack.
2. Fake-layer provenance attack.
3. Identity-drift attack.
4. Over-reuse attack.
5. Scope-creep attack.

- [ ] **Step 5: Commit review**

```bash
git add docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_LAYER_REUSE_REVIEW.md
git commit -m "docs(art): classify first-session asset reuse"
```

---

### Task 6: Rights review, deterministic export, and manifest generation

**Files:**
- Create: `docs/planning/visual/first_session_image_batch_01_rights_review.json`
- Create: selected raster exports + per-export manifests.
- Modify: `tests/test_first_session_image_batch_contract.py`
- Modify: `docs/ASSET_LICENSE_LEDGER.md` with observed records only.

**Interfaces:**
- Consumes: exact selected source receipt + computed hashes + current rights evidence.
- Produces: `APPROVED_RUNTIME_CANDIDATE` only for rights-cleared assets.

- [ ] **Step 1: Create rights records from selected receipts, not hand-entered IDs**

Execution code reads the selected file ID directly:

```python
selection = json.loads(Path("docs/planning/visual/first_session_image_batch_01_background_candidates.json").read_text(encoding="utf-8"))
selected_id = selection["groups"]["GREENHOUSE_BACKGROUND"]["selected_file_id"]
assert selected_id
rights_entry = {
    "source_file_id": selected_id,
    "status": "REVIEW_REQUIRED",
    "evidence": [],
    "commercial_use": "UNRESOLVED",
    "modification": "UNRESOLVED",
    "redistribution": "UNRESOLVED",
    "credit_required": "UNRESOLVED"
}
```

Repeat from the relevant receipt for all selected raster sources. Then read current applicable service/tool terms and project policy. Replace `REVIEW_REQUIRED`/`UNRESOLVED` only when evidence directly supports a specific claim. Unresolved assets stop here.

- [ ] **Step 2: Materialize by selected file ID and verify SHA**

Compute SHA-256 and compare it against the candidate receipt before any export. A mismatch is a hard block.

- [ ] **Step 3: Export without creative alteration**

```text
bg_greenhouse_field_base.webp       2560×1440 WebP lossless alpha=false
bg_school_common.webp                2560×1440 WebP lossless alpha=false
chr_maren_portrait_instructive.png  1024×1536 PNG RGBA
chr_nea_field_neutral.png            256×256 PNG RGBA
```

Creative anatomy/background repair returns to image editing/generation + review, never hidden inside conversion code.

- [ ] **Step 4: Add manifest validation helpers before manifest creation**

```python
import hashlib
SHA_RE = re.compile(r"^[a-f0-9]{64}$")
RESOLVED_LICENSE = {"PROJECT_ORIGINAL", "USER_OWNED", "COMMERCIAL_USE_APPROVED"}

def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def assert_runtime_manifest(testcase, manifest, path):
    testcase.assertRegex(manifest["source"]["sha256"], SHA_RE, path.name)
    testcase.assertRegex(manifest["export"]["sha256"], SHA_RE, path.name)
    testcase.assertIn(manifest["license"]["status"], RESOLVED_LICENSE, path.name)
    testcase.assertEqual(sha256_file(ROOT / manifest["export"]["file_path"]), manifest["export"]["sha256"])
    testcase.assertEqual("NOT_RUN", manifest["runtime_validation"])
```

- [ ] **Step 5: Generate manifests entirely from observed records**

Use this builder; inputs come from selected receipts, rights records, and actual export files:

```python
def build_manifest(*, asset_id, role, decisions, source, rights, export_path,
                   export_format, width, height, alpha, import_profile, screens):
    assert source["file_id"]
    assert SHA_RE.fullmatch(source["sha256"])
    assert rights["status"] in RESOLVED_LICENSE
    assert rights["evidence"]
    export_sha = sha256_file(ROOT / export_path)
    return {
        "schema_version": 1,
        "asset_id": asset_id,
        "role": role,
        "decision_ids": decisions,
        "source": {
            "storage": source["storage"],
            "file_id_or_path": source["file_id"],
            "sha256": source["sha256"],
            "tool": source["tool"],
            "owner": source["owner"],
            "prompt_or_brief_path": "docs/planning/visual/FIRST_SESSION_IMAGE_BATCH_01_BRIEF.md",
            "parent_asset_ids": source.get("parent_asset_ids", [])
        },
        "export": {
            "file_path": str(export_path), "sha256": export_sha, "format": export_format,
            "width": width, "height": height, "alpha": alpha, "import_profile": import_profile
        },
        "license": {
            "status": rights["status"], "evidence": " | ".join(rights["evidence"]),
            "credit_required": rights["credit_required"],
            "modification_allowed": rights["modification_allowed"],
            "redistribution_allowed": rights["redistribution_allowed"]
        },
        "status": "APPROVED_RUNTIME_CANDIDATE",
        "approved_by": "USER_VISUAL_SELECTION",
        "approved_at": "2026-08-20",
        "used_in_screens": screens,
        "runtime_validation": "NOT_RUN"
    }
```

For project-authored SVGs, use repository path + file SHA + authored-tool/owner evidence; never invent Library IDs.

- [ ] **Step 6: Validate manifests and scan for template markers**

```bash
python -m unittest tests.test_first_session_image_batch_contract -v
python - <<'PY'
from pathlib import Path
import re
marker = re.compile(r'(replace_me|example_sha|example_file_id|__fill__)', re.I)
for path in Path('assets/manifests').glob('*.json'):
    if marker.search(path.read_text(encoding='utf-8')):
        raise SystemExit(f'manifest marker found: {path}')
print('manifest marker scan: PASS')
PY
```

- [ ] **Step 7: Update Asset License Ledger truthfully and commit**

Runtime verified/project-approved counts remain unchanged.

```bash
git add docs/planning/visual/first_session_image_batch_01_rights_review.json assets/art/backgrounds assets/art/characters assets/art/ui/glyphs assets/art/ui/lens assets/art/ui/result assets/manifests docs/ASSET_LICENSE_LEDGER.md tests/test_first_session_image_batch_contract.py
git commit -m "feat(art): export first-session runtime asset candidates"
```

---

### Task 7: Godot import verification and asset gallery

**Files:**
- Create: `src/ui/asset_gallery/first_session_asset_gallery.gd`
- Create: `src/ui/asset_gallery/first_session_asset_gallery.tscn`
- Create: `tests/integration/test_first_session_asset_gallery.gd`
- Create: `tools/capture_first_session_asset_gallery.gd`
- Create: `.github/workflows/validate-first-session-image-assets.yml`
- Modify: `tests/test_runner.gd`
- Modify: manifests after real import/render PASS.

**Interfaces:**
- Produces: Texture2D import evidence + one 1920×1080 GL-compatible gallery PNG; not Human/Device/Full Slice evidence.

- [ ] **Step 1: Write RED gallery/import tests**

Register `test_first_session_asset_gallery.gd`. Load every manifest export path and assert a non-null `Texture2D` after Godot import.

- [ ] **Step 2: Create gallery scene**

Use `GrimoireThemeFactory.create_theme()` and live labels:
```text
left top: greenhouse fit preview
right top: classroom fit preview
lower left: Maren on Navy inspection plate
lower center: Nea on Navy inspection plate
lower right: glyph 3 + Lens 4 + Result 5 icon grid
```

- [ ] **Step 3: Capture deterministic 1920×1080 evidence**

Reuse SubViewport + five frames + `RenderingServer.force_draw`; save `build/visual/first-session-asset-gallery.png`; fail on dimension mismatch or file size <20 KB.

- [ ] **Step 4: Create dedicated CI**

```text
Python contract
→ Godot 4.7.1 setup
→ --headless --import
→ full custom test runner
→ xvfb GL-compatible gallery capture
→ PNG/log upload
```

- [ ] **Step 5: Promote only successful imports to `RUNTIME_VERIFIED`**

Set `runtime_validation = PASS`, `status = RUNTIME_VERIFIED`; do not set `PROJECT_ASSET_APPROVED`.

- [ ] **Step 6: Commit evidence**

```bash
git add src/ui/asset_gallery tests/integration/test_first_session_asset_gallery.gd tests/test_runner.gd tools/capture_first_session_asset_gallery.gd .github/workflows/validate-first-session-image-assets.yml assets/manifests
git commit -m "test(art): verify first-session runtime assets"
```

---

### Task 8: Runtime-rendered approval, adversarial closure, merge, and Notion sync

**Files/Systems:**
- Create: `docs/planning/FIRST_SESSION_IMAGE_BATCH_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- Create: `docs/planning/sync/GR-SYNC-20260820-34-FIRST-SESSION-IMAGE-ASSETS.md`
- Modify: manifests only after explicit user approval of the Godot-rendered gallery.
- Update: Notion Asset Library + TASK-13.

**Interfaces:**
- Produces: project-approved first-session runtime asset set + merged SHA + complete provenance.

- [ ] **Step 1: Present the real Godot-rendered gallery**

If an asset is rejected, return to its owning source task. Do not compensate by silently editing other assets.

- [ ] **Step 2: Promote only explicitly approved assets**

```text
status = PROJECT_ASSET_APPROVED
runtime_validation = PASS
approved_by = USER_RUNTIME_VISUAL_APPROVAL
```

- [ ] **Step 3: Adversarial pass 1 — AI artifact/consistency**

Inspect anatomy, pseudo-text, repeated architecture, perspective/light, Maren continuity, Nea silhouette/palette, cross-scene cohesion.

- [ ] **Step 4: Pass 2 — gameplay readability**

Check quiet play/read zones; icon readability at 16/24/32/48; FLOW/FOCUS/DISPERSE without hue dependence.

- [ ] **Step 5: Pass 3 — rights/provenance**

Every approved asset must trace source ID/path + source SHA + brief/tool + rights evidence + export SHA.

- [ ] **Step 6: Pass 4 — scope/reuse**

Verify no Festival batch, extra NPC portraits, growth forms, speculative extra backgrounds, or unconsumed VFX; verify layer provenance.

- [ ] **Step 7: Pass 5 — evidence overclaim**

Runtime import/render PASS is not Human playtest, device, accessibility, performance, emotion/fun, or Full Slice PASS. Those remain `NOT_RUN`.

- [ ] **Step 8: Open PR and require exact-head checks**

Require dedicated asset CI and all applicable Planning/Visual/Toolchain/Star workflows. Inspect changed files/review threads. Do not touch unrelated active PRs.

- [ ] **Step 9: Squash merge with expected head SHA**

Re-read GRIMOIRE `main` and record merge SHA in Sync34.

- [ ] **Step 10: Sync Notion `ASSET LIBRARY · Master`**

For every approved runtime asset, update Name, Asset ID, Category, Record Type `ASSET`, Status `APPROVED`, Approved checkbox, Reuse classification, Source, Hash, Rights/License, Implementation Path, brief reference, Project relation, Last Synced. Concept sheets remain reference records only when they have reuse value.

- [ ] **Step 11: Close TASK-13 only after both implementation plans complete**

Record Component Sheet merged SHA, image asset merged SHA, selected asset IDs, and all remaining `NOT_RUN` boundaries. TASK-13 becomes `완료` only when Sheets A–D and this image batch are both merged/synced.
