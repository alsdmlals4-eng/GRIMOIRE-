# Notion → Repository Migration Audit — 2026-08-28

> Purpose: preserve the former GRIMOIRE Notion structure and all nonlegacy work that still has project value, without reviving stale facts as current canon. Notion is read-only for this audit; the repository is the destination and the final owner.

```yaml
audit_id: GR-NOTION-MIGRATION-20260828-01
status: COMPLETE__MERGED_MAIN_READ_BACK
user_authorization: "노션의 기존 노션의 구조나 작업물들이 누락되지않게 옮겨줘(구형 데이터는 안 옮겨도 괜찮아)"
source_access: READ_ONLY
notion_write_delete_archive_export: FORBIDDEN
destination: GITHUB_REPOSITORY_ONLY
legacy_exclusion: ALLOWED_BY_USER
repository_readback_at_kst: 2026-08-28
completion_pr: 238
completion_merge_commit: 1a30b9e0715b1d19e56e24f256f695b869369ca2
completion_checks: PR_EXACT_HEAD_ALL_REQUIRED_CHECKS_PASS
```

## 1. Classification rules

| Class | Meaning | Migration handling |
| --- | --- | --- |
| `CURRENT_UNIQUE` | Current, project-specific content not represented by an equal repository human owner | Migrate into a named repository document and read it back. |
| `CURRENT_DUPLICATED` | Current content whose current repository owner already contains the same governing contract | Record the exact owner; do not make a second canonical copy. |
| `SUPERSEDED` | Content whose policy, target, visual direction, or authority was replaced | Keep source identity and replacement owner only. |
| `HISTORICAL` | Useful provenance but old current-main/SHA/previous handoff state | Keep a locator only; never promote it as active state. |
| `RETIRED` | Explicitly retired/duplicate/obsolete data | Do not migrate content; keep optional source identity only. |
| `UNKNOWN_UNVERIFIED` | The audit cannot prove coverage or retirement | Must be resolved to a user decision before migration can be called complete. |

## 2. Former structure → repository structure

The former Notion arrangement was `00 Project Hub → GRIMOIRE Home → 5 domain pages → L3 pages/databases`. Its useful GRIMOIRE structure is now represented without copying global Base/project-hub content into this project.

| Notion structure | Source identity | Class | Repository destination / result |
| --- | --- | --- | --- |
| `00 · 프로젝트 허브` | `3c01b237-eb1c-814193aec528c4f3c40c` | `HISTORICAL` shared hub | Not migrated: this was cross-project/Base navigation. GRIMOIRE’s local entry is `docs/PROJECT_HOME.md`. |
| `GRIMOIRE · Home` | `3c41b237-eb1c-816c-80d0-dfcfe28ec973` | `CURRENT_UNIQUE` | **Migrated**: `docs/PROJECT_HOME.md` preserves the human-facing North Star, flow, visual/evidence boundaries, domain map, and gates; current state is linked to current owners. |
| `01 · Direction · Planning` | `3c51b237-eb1c-8180-9e1b-fb390962dc4b` | `CURRENT_DUPLICATED` | `docs/ACTIVE_CONTEXT.md`, `docs/planning/`, and `docs/PROJECT_HOME.md` own it. |
| `02 · Magic Systems · Learning` | `3c51b237-eb1c-8152-aa57-db88883484a1` | `CURRENT_DUPLICATED` | Spell flow, core loop, implementation, and learning policy map to `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`, `src/core/`, `data/`, and `tests/`. |
| `03 · Visual · UX · Components` | `3c51b237-eb1c-819f-be22-fb36024a4fad` | `CURRENT_DUPLICATED` | `docs/planning/visual/`, Art Bible, asset manifests, and `assets/reference/visual/` own it. |
| `04 · Production · Validation` | `3c51b237-eb1c-8136-82bd-e763327e7e9e` | `CURRENT_DUPLICATED` | `docs/ACTIVE_CONTEXT.md`, `docs/validation/`, `docs/testing/`, `tests/`, and `tools/` own it. |
| `05 · Reference · Benchmark` | `3c51b237-eb1c-81ee-b933-c44824520e68` | `CURRENT_DUPLICATED` | `docs/planning/benchmarks/` and `docs/planning/PROJECT_BENCHMARKING_POLICY.md` own it. |

## 3. Current work and design records

| Notion page | Source identity | Class | Destination readback / disposition |
| --- | --- | --- | --- |
| `Frostbloom 첫 세션 대표 경험 설계` | `3c11b237-eb1c-8157-b75d-c8cf0ef06771` | `CURRENT_DUPLICATED` | Its nonlegacy contracts are already separated into `FROSTBLOOM_FIRST_10_MIN_CLASS_PRACTICUM_01_APPROVAL_2026-08-20.md`, `FROSTBLOOM_W6_BOUNDED_CONSEQUENCE_FORECAST_01_APPROVAL_2026-08-20.md`, `FROSTBLOOM_FIRST_SESSION_PERSISTENT_HANDOFF_ELASTIC_BUFFER_01_APPROVAL_2026-08-20.md`, `FROSTBLOOM_RESULT_GRIMOIRE_CAUSAL_DEBRIEF_01_APPROVAL_2026-08-20.md`, and the W6 L2 feature spec. No full historic page duplication. |
| `03 · UI · 세계 재작성 Flow Map` | `3c01b237-eb1c-8155-b2a0-fd2cdf544613` | `CURRENT_DUPLICATED` | Current player flow is in `SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`; first-session/W6 flow and W7 boundaries are in the Frostbloom owners above; human summary is in `docs/PROJECT_HOME.md`. |
| `08 · 핵심 시스템 · 상세` | `3c11b237-eb1c-8131-bf82-d60126013791` | `CURRENT_DUPLICATED` | Core system terms/flow: spell-flow owner and actual `src/core/`; AI boundary: `AI_INDIE_PATTERN_ADOPTION_2026-08-24.md`. Runtime AI remains `NOT_RUN`. |
| `01 · 프로젝트 전체 작업계획` | `3c01b237-eb1c-81eb-a86a-cce0eae11b85` | `CURRENT_UNIQUE` structure, `HISTORICAL` records | **Migrated structure** to Project Home’s current gates and `docs/ACTIVE_CONTEXT.md`; old database dates/status/SHA are intentionally not current canon. |
| `Vertical Slice 일정` | `3c11b237-eb1c-81a4-b3ef-f486dcb51c61` | `CURRENT_DUPLICATED` | 00–46 minute design is owned by the current Frostbloom planning documents; all timing remains `TEST_VALUE` until Human validation. |
| `06 · Production · Handoff` | `3c01b237-eb1c-81e2-952d-fba2bc650e27` | `HISTORICAL` | Current Product Root/next gates are in `ACTIVE_CONTEXT.md` and `TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27.md`; no old handoff is restored. |
| `GRIMOIRE · GPT Work Image Goal Handoff · 2026-08-26` | `3c81b237-eb1c-81b2-9027-f789349f058a` | `HISTORICAL` / policy `SUPERSEDED` | Repository provenance exists at `docs/planning/GRIMOIRE_GPT_WORK_IMAGE_GOAL_HANDOFF_2026-08-26.md`; its explicit-per-image-approval rule is superseded by the current candidate policy, while runtime-production gates remain current. |
| `GRIMOIRE · Visual Work Handoff · 2026-08-25` | `3c71b237-eb1c-8194-8338-e0c1dde7c9c3` | `HISTORICAL` / partial policy `SUPERSEDED` | Repository provenance exists at `docs/planning/handoffs/2026-08-25-visual-production-handoff.md`. Its reference boundaries and rejected 3D movement survive in current visual owners; its per-candidate approval workflow is superseded. |
| `GRIMOIRE · Visual Work Problems & Lessons · 2026-08-25` | `3c71b237-eb1c-8124-9838-e4f577613851` | `CURRENT_DUPLICATED` / partial policy `SUPERSEDED` | Exact repository lesson owner: `docs/planning/lessons/2026-08-25-visual-generation-approval-boundary-lessons.md`. Semantic-drift, scoped-approval, and negative-knowledge lessons remain; Notion transport/destination details and explicit candidate-approval sequence do not. |

## 4. Visual, asset, and reference records

| Notion page | Source identity | Class | Destination readback / disposition |
| --- | --- | --- | --- |
| `02 · 비주얼 바이블` | `3c01b237-eb1c-819f-959c-debbed69405b` | `CURRENT_DUPLICATED` | Current visual authority is `GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md`, W6 board brief, Art Bible, coverage JSON, and `docs/PROJECT_HOME.md`. |
| `승인 시각 방향 · Logo 01 + Magic Anime` | `3c71b237-eb1c-81fe-b5d0-cfb4ac13cd76` | `CURRENT_DUPLICATED` | Direction/tone is in the tone lock. The former Notion reference image is retained as `assets/reference/visual/GRIMOIRE_visual_direction_approved_2026-08-25.png` (`7937AD53CEBE48359D713B06B868D46F1BC08AA4CD89F1164293C73D12BE1BBE`); reference-only. |
| `대표 화면 참고 기준 · 전투/주문 + 대화` | `3c71b237-eb1c-8169-bdbe-e77bb943edea` | `CURRENT_DUPLICATED` | Battle reference: `assets/reference/visual/GRIMOIRE_representative_battle_spell_screen_2026-08-25.png` (`F6C6491190FB3373E457BDA43ECDA88039BE7DDE53CAE284C2B5141717B4E9E1`); dialogue reference: `assets/reference/visual/GRIMOIRE_dialogue_screen_approved_2026-08-25.png` (`E402B5E5680A280AEDF43026448AE766CBA7307CE9696091EA0538B380FBB152`). Both remain reference-only. |
| `04 · 에셋 라이브러리` | `3c01b237-eb1c-81c7-8acd-d5c199169bf0` | `CURRENT_DUPLICATED` | Human asset structure maps to `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`; binary/metadata/provenance map to `assets/`, `assets/manifests/`, and `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`. |
| `Visual Asset Coverage · 2026-08-26 · r5.4` | `3c81b237-eb1c-8143-a3d5-e2a4e6510989` | `CURRENT_DUPLICATED` | Exact current structured owner: `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`. Old “ask before every candidate” text is superseded by current user instruction; do not restore it. |
| `Runtime Image Consumer Checklist · 2026-08-26` | `3c81b237-eb1c-81b7-987d-e1172e794901` | `CURRENT_DUPLICATED` | Exact current owner: `docs/planning/visual/GRIMOIRE_VISUAL_PRODUCTION_CHECKLIST_2026-08-26.json`. It preserves the runtime-consumer-only rule and live-UI/no-baked-text boundary. |
| six Runtime Glyph records | `glyph_heat` `3c81b237-eb1c-81f0-af90-e0c3f931693e`; `glyph_protect` `3c81b237-eb1c-81cf-aa26-ef49bdc7b2fa`; `glyph_flow` `3c81b237-eb1c-816f-ae77-e370e4acab24`; `glyph_focus` `3c81b237-eb1c-8166-abae-f14293c07585`; `glyph_disperse` `3c81b237-eb1c-8197-b202-f4d535e9a164`; `glyph_burst` `3c81b237-eb1c-8114-b1eb-c78271e30ca1` | `CURRENT_DUPLICATED` | Exact files: `assets/art/ui/glyphs/`; provenance/hashes: `assets/manifests/glyph_{heat,protect,flow,focus,disperse,burst}.json`; actual resolver: `src/ui/spell_workflow/glyph_visual_resolver.gd`. Old per-record “integration pending” status is historical and cannot override current consumer/coverage readback. |
| three First-Session Environment records | `bg_school_common` `3c81b237-eb1c-816c-b09c-f34f0f7f00ce`; `bg_greenhouse_field_base` `3c81b237-eb1c-81d3-9980-fc7a19770bd9`; `bg_greenhouse_battle_arena` `3c81b237-eb1c-81f8-8bf4-f9f3436b26b5` | `CURRENT_DUPLICATED` | Exact files: `assets/art/backgrounds/`; provenance: `assets/manifests/background_*.json`. Actual binding is limited to `bg_greenhouse_field_base` in Product Root; school/battle candidates remain unbound. The exact boundary is `FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md` and current coverage/checklist JSON. |
| `05 · Reference · Benchmark 도서관` | `3c01b237-eb1c-81c2-bc67-e40ec0e84182` | `CURRENT_DUPLICATED` | Repository benchmark source lives in `docs/planning/benchmarks/` and `docs/planning/PROJECT_BENCHMARKING_POLICY.md`; raw reference records are not copied as current facts. |

## 5. Explicitly excluded legacy material

- `PROJECT REGISTRY · Master` record `3c01b237-eb1c-8131-9e43-f33c7a5d0b75`: operational metadata, obsolete ports/SHA/handoff state; classified `HISTORICAL_METADATA`, not a human project source.
- Pages whose title begins `RETIRED`, duplicate PR pages, and prior main/PR readback claims: `RETIRED` or `HISTORICAL` only.
- Earlier W6 board before the warm-academy tone correction: `SUPERSEDED`; no future prompt anchor.
- Notion-hosted temporary image URLs: not migrated as binaries. The two approved representative references and the visual-direction reference have verified repository files above; other source images remain only as reference provenance until an approved consumer/rights path exists.
- Old instructions to stop for explicit *candidate* image permission: `SUPERSEDED` by the user’s current preauthorization. Final lock, runtime use, and production-batch expansion remain confirmation gates.

## 6. Completeness readback

| Completeness check | Result |
| --- | --- |
| Former human Home’s current high-level identity, core loop, visual/evidence/gate structure has a repository-native owner | `PASS` — `docs/PROJECT_HOME.md` |
| Five Notion Domains have repository destinations | `PASS` — section 2 mapping |
| Current Frostbloom, W6, Flow, system, visual, asset, production, and reference pages are classified | `PASS` — sections 3–4 |
| Current unique content is migrated; duplicated content points to exact repository owner | `PASS` — no `UNKNOWN_UNVERIFIED` item remains in the discovered nonlegacy project structure |
| Six glyph and three environment exports match their repository manifests | `PASS` — SHA-256 readback matched all nine tracked files |
| Obsolete current-main/SHA, retired pages, and old image policy are prevented from becoming current canon | `PASS` — section 5 |
| Notion was modified, deleted, archived, or used as a destination | `NOT_PERFORMED` — read-only source only |
| Repository destinations are present before completion is declared | `PASS` — this audit, `docs/PROJECT_HOME.md`, and referenced owners are tracked in the same documentation change |
| Exact PR-head validation and merge readback | `PASS` — PR #238 merged as `1a30b9e0715b1d19e56e24f256f695b869369ca2` after all required PR checks passed |

## 7. Post-migration policy

Notion has returned to `HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE`. A future Notion read requires a new explicit user request, and any newly found unique fact must be classified before it changes the repository owner.
