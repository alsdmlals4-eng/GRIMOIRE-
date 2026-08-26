# GR-SYNC-20260826-36 · v4.8 r5.4 + Visual Asset Coverage

## Scope

```yaml
sync_id: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
contract_decision: GM-CONTRACT-V4-8-BINDING-01
contract_revision: 2026-08-26-r5.4-superset-final
baseline_project_main: 829094fd87433e14fe42b23f9b7bec6321f5048d
baseline_base_main: edb3b3376603c9f6b00d64af3126304f8c9946bf
work_scope: VISUAL_IMAGE_ASSET_PLANNING_ONLY
product_implementation_mutation: NONE
image_generation: NONE
sheet_canon_write: NONE
```

이번 sync는 사용자의 `작업재개`와 이어진 `진행해`에 따라, 이전 fresh-read audit에서 선택한 **A안: r5.4 authority reconciliation → Visual Asset Coverage → 다음 정확히 1장 Text Brief**를 실행한다.

이 continuation은 Task8/Godot 제품 구현 재개가 아니다.

## Fresh-read bootstrap

### Base

- completed `main`: `edb3b3376603c9f6b00d64af3126304f8c9946bf`
- 최신 사용자 제공 r5.4가 이 Base snapshot을 역사 관찰값으로 포함하지만, 새 work unit마다 Base latest completed `main`을 재조회하는 정책을 유지한다.

### GRIMOIRE

- completed `main`: `829094fd87433e14fe42b23f9b7bec6321f5048d`
- current planning: `COMPLETE_FROSTBLOOM_FIRST_SESSION`
- current implementation: `PARTIAL_FOUNDATION`
- main scene: `res://src/ui/star_circuit_harness.tscn` · `DEVELOPMENT_RUNTIME_POC_ENTRY`
- Task8 product commit/remote branch/remote PR: 없음
- Task8 preservation: `TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS`
- current product recovery subgate: `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`

### Open PR

- PR #166 `docs: route README to current GRIMOIRE canon`
- state: Draft
- changed path: `README.md`
- disposition: `ACTIVE_OTHER_WORKSTREAM_READ_ONLY`

PR #166은 수정·rebase·close·merge·absorb하지 않는다.

## r5.4 contract reconciliation

기존 `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`는 같은 Decision `GM-CONTRACT-V4-8-BINDING-01`을 보존하면서 revision을 `2026-08-24-r2`에서 `2026-08-26-r5.4-superset-final`로 전진시킨다.

추가된 현재 경계:

- `FRESH_READ_PROJECT_BOOTSTRAP`
- `ENTRY_STATE_RECONCILIATION`
- `VISUAL_ASSET_INVENTORY_AND_STYLE_LOCK`
- `TEXT_BRIEF → EXPLICIT_USER_APPROVAL → EXACTLY_ONE_RESULT`
- project-specific local Codex orchestration retired
- project-specific dedicated Godot executable/port assignment을 기본 current invariant로 사용하지 않음

제품 gameplay decision은 변경하지 않는다.

## Visual Asset Coverage preflight

Structured owner:

`docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`

Human owner:

Notion `Visual Asset Coverage · 2026-08-26 · r5.4`

`https://app.notion.com/p/3c81b237eb1c8143a3d5e2a4e6510989?pvs=204`

### Existing sources reused

- `ART-STYLE-01` locked visual reference
- `GM-VISUAL-DIRECTION-20260825-01` · Logo 01 + Magic/Anime
- `GM-REPRESENTATIVE-SCREENS-20260825-01`
- `GM-INGAME-ART-CHECKPOINT-01`
- Component Sheets A–D + semantic UI pack · PR #151 merged
- Star UI Kit lineage
- legacy `ASSET-SPEC-01` production caps as historical project input
- Google Sheet visual inventory only for unique migration compatibility categories; no current Sheet authority/write

### Coverage summary

```text
REUSE
- Logo 01 / approved style
- Component Sheets A–D / semantic UI family

ADAPT
- dialogue
- glyph drawing
- typed glyph Vault/Stock presentation
- core feedback/VFX
- Result/Grimoire
- simple 2D movement/scene transition
- initial companion presentation
- font/icon support

CREATE
- FIVE_POINT_STAR → Prepared Spell Stage2 representative visual
- Frostbloom environment runtime-intent candidates
- first-session character half-body set
- Frostbloom focal threat/entity

DEFER
- Prepared Spell → Target → Final Preview → Use representative final visual until Task8 product consumer is reconciled or explicitly authorized
- store/key art
- long-term companion growth forms

CUT / NOT_APPLICABLE
- new 3D exploration asset family
- multi-enemy wave art family for current Slice
- generic NPC half-body bulk library before first-session need
- baked functional text/numbers/state truth
```

## Three-alternative next visual trade study

A. `Glyph Drawing + Vault`
- strong direct-writing fantasy
- but Task6 implementation + existing direction already provide relatively high coverage

B. `Typed Glyph Vault/Stock → FIVE_POINT_STAR → Prepared Spell`
- directly closes the approved rework finding where Stock/circuit/use semantics were oversimplified
- uses merged Stage2 semantics
- does not invent Task8 Stage3 behavior

C. `Prepared Spell → Target → Final Preview → Use`
- important explicit final decision visual
- but current main has no Task8 product screen, so early fixation has higher rework risk

**Selected: B.**

## Next exactly-one Text Brief

```yaml
brief_id: GR-VISUAL-BRIEF-STAGE2-STOCK-CIRCUIT-20260826-01
status: TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL
aspect: 16:9 LANDSCAPE
result_count: 1
```

Composition:

1. left Source Rail — exact Vault vs typed Glyph Stock as distinct sources
2. center — FIVE_POINT_STAR, exactly one center Main + 0–5 equivalent outer auxiliaries
3. right — circuit Preview + Prepared Spell status only
4. greenhouse/incident context remains visible behind UI

Required semantics:

- Stock = typed glyph source, not completed spell
- no hidden position bonus
- no auto target
- no auto commit
- Stage2 prepares spell before Stage3 target/use
- reserved/consumed/unavailable source states use icon/shape/text redundancy, not color only

Do not bake arbitrary names/dialogue/costs/success rates/Mana/target/button copy into the image. Minimal concept section labels may use `보관 글자 / 주문 회로 / 준비 주문`.

**STOP:** brief completion does not authorize image generation.

## Notion bounded correction

### Human Home

`GRIMOIRE · Home`

- `PORTFOLIO HOLD` → `ACTIVE · VISUAL_IMAGE_ASSET_PLANNING`
- active scope is r5.4 Visual Coverage + next single Text Brief
- Task8/Godot implementation remains separately gated
- image generation remains separately gated after brief approval
- Human/Device/Performance/Full Slice remain `NOT_RUN`

### Visual Bible

Created child:

`Visual Asset Coverage · 2026-08-26 · r5.4`

`https://app.notion.com/p/3c81b237eb1c8143a3d5e2a4e6510989?pvs=204`

### System Record

Bounded operational metadata correction:

- Status → `ACTIVE`
- project-specific `Codex Home` removed
- project-specific `Dedicated Godot Executable` removed
- Godot default routing metadata → `8000 / 9500`, explicitly **not a live-session proof**
- project-specific Godot Slot removed
- Sync State stays `REPO_UPDATE_REQUIRED` until current-task PR merge/readback
- runtime evidence remains `NOT_RUN`

### TASK-13

`Component Sheet & Image Production Contract` remains `진행 중`.

- component portion remains complete
- r5.4 coverage preflight recorded
- next exactly-one brief recorded
- no image generated yet
- first-session source/asset selection, rights/provenance, runtime import/render, explicit result approval and final sync remain future work where applicable
- Task8 implementation and Human/Device/Performance/Full Slice remain separate gates

## Evidence ceiling

```text
CONTRACT_REVISION: r5.4 documented on current-task branch
VISUAL_COVERAGE_PREFLIGHT: documented on current-task branch + Notion
NEXT_SINGLE_VISUAL_TEXT_BRIEF: ready, generation not authorized
PRODUCT_CODE_OR_SCENE_MUTATION: NONE
IMAGE_GENERATION: NONE
HUMAN: NOT_RUN
DEVICE: NOT_RUN
PERFORMANCE: NOT_RUN
FULL_VERTICAL_SLICE: NOT_RUN
RUNTIME_VISUAL_COMPLETE: NOT_PROVEN
```

## Remaining delivery gates

1. GitHub branch diff/readback
2. minimum 5 full adversarial review loops
3. current-task PR
4. exact-head CI / ruleset / review / unresolved-thread gate
5. safe merge only if gates pass
6. merged-main readback
7. Notion Repo Main SHA / Sync State finalization
8. final cross-system readback

이미지 생성은 이 delivery unit의 완료 작업이 아니다.
