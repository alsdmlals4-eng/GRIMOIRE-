# GRIMOIRE · GPT Work Image Goal Handoff · 2026-08-26

```yaml
handoff_id: GR-WORK-HANDOFF-20260826-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
target_workspace: CHATGPT_WORK
handoff_status: READY_FOR_USER_REVIEW_AND_WORK_RESUME
source_project_main: 27749d2b3a552193283182143fe772e18f0ef45f
source_base_main: 06669fe9c6a3ccd6f3b0d19c5757540bfdcc0623
open_pr_at_handoff: 166_DRAFT_READ_ONLY_OTHER_WORKSTREAM
google_sheet: MIGRATION_ONLY_NO_NEW_CANON_WRITE
image_generation_authorized_by_handoff: false
godot_implementation_authorized_by_handoff: false
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## 1. Work에서 가장 먼저 읽을 것

Work의 지속 컨텍스트/메모리는 작업 편의를 위한 보조층이다. 프로젝트 정본보다 높은 권위로 취급하지 않는다. 매 실질 작업 시작마다 current truth를 다시 읽는다.

1. Notion `GRIMOIRE · Home`
2. repository `AGENTS.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`
5. `docs/planning/visual/GRIMOIRE_VISUAL_PRODUCTION_CHECKLIST_2026-08-26.json`
6. `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`
7. `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`
8. 실제 code / Scene / Resource / Test / runtime consumer
9. latest Base completed `main`과 관련 owner
10. Google Sheet는 migration-only unique legacy drift가 필요할 때만 읽는다.

새 Work 세션에서 과거 채팅의 SHA, PR 상태, Notion 내용, asset 상태를 current truth로 가정하지 않는다.

## 2. 현재 프로젝트/Visual 정본

- 제품 단계: `DEMO_FIRST_VERTICAL_SLICE`
- 기획: `COMPLETE_FROSTBLOOM_FIRST_SESSION`
- 구현: `PARTIAL_FOUNDATION`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Main Scene 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- Art Style Lock: `ART-STYLE-01 · Soft Storybook Cel 2D Hybrid`
- Visual overlay: `GM-VISUAL-DIRECTION-20260825-01 · Logo 01 + Magic/Anime`
- Logo 01: 사람용 승인 Visual 방향. 자동으로 final runtime export가 된 것은 아님.
- 대표 전투/주문 화면: 분위기·온실 구도·Navy/Gold·Blue magic glow만 reference. 구형 Stock/Circuit/Spell UI는 current canon이 아님.
- 대표 대화 화면: 반신 Anime character + Storybook background + Navy/Gold frame + 하단 선택지 구도 reference. 이미지 속 임의 이름/캐릭터 identity/대사는 비정본.
- 이전 3D-like 이동 화면: `REJECTED`. 단순 2D Field/scene transition 방향.

## 3. 플레이어 주문 흐름

Decision `GM-SPELL-WORKFLOW-UI-V2-01`의 현재 player-facing revision은 다음과 같다.

```text
글자 → 주문 → 대상 → 시전
```

```text
주문 만들기
= 글자 선택·작성 + FIVE_POINT_STAR 회로 조합 + 완성 주문 이름 확인

주문 쓰기
= 게임 장면에서 대상 직접 지정 + 필요한 최종 Preview + 명시 시전
```

내부 `Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`는 runtime/data/test authority로 유지한다. 자동 Target, 자동 Commit, Best Route를 만들지 않는다.

## 4. 이미지 생산 원칙

이미지 backlog 진입 전에 실제 consumer를 묻는다.

```text
actual consumer
→ existing solution/reuse
→ asset slot/path/format/state boundary
→ Image Goal text brief
→ STOP
→ explicit user generation approval
→ exactly one result
→ STOP
→ user approve/revise
→ Notion registration
→ implementation-ready export/provenance
→ CODEX-IMG Goal
→ Godot integration
→ runtime screenshot/play validation
```

설명용 디자인 시트, 전체 화면 한 장짜리 UI PNG, 체크리스트 장식, baked Korean text/Mana/success rate/button labels는 production asset으로 만들지 않는다.

## 5. 이미 실제 Runtime에서 재사용할 것

현재 main의 `src/ui/star_circuit_harness.tscn`이 실제 Texture2D로 소비한다.

- `assets/art/ui/common/academy_corner_ornament.svg`
- `assets/art/ui/common/icon_mana.svg`
- `assets/art/ui/common/icon_phase_diamond.svg`
- `assets/art/ui/common/icon_typed_stock.svg`
- `assets/art/ui/common/icon_warning_diamond.svg`

또한 FIVE_POINT_STAR 자체는 `src/ui/components/star_circuit_board.gd`의 procedural draw와 기존 semantic UI/Component Sheets A-D를 우선 재사용한다.

## 6. Known Drift · Glyph 3종 → Slice Runtime 6종

기존 Runtime Consumer Checklist의 `GR-RA-01-GLYPH-BASE`는 Asset-Spec 역사값인 `FLOW / FOCUS / DISPERSE` 3종을 적고 있다.

하지만 실제 current Slice vocabulary는:

```text
HEAT
PROTECT
FLOW
FOCUS
DISPERSE
BURST
```

6종이다. Task6 recognition과 Task7 loadout/circuit consumer도 이 Slice vocabulary를 사용한다.

사용자는 2026-08-26 이 **6종 Runtime 기준으로 진행**하는 것을 승인했다. 따라서 Work의 IMG-01은 6종을 사용한다. 이전 3종 행은 provenance이며 현재 IMG-01 수량 authority가 아니다.

## 7. Final Image Goal Queue

구조화 owner: `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`

| 순서 | Goal | Priority | Consumer | 상태 |
|---:|---|---|---|---|
| 1 | IMG-01 · Slice Magic Glyph Runtime Set | P0 | Task6 / Task7 / future Task8 | Runtime integration merged; remaining visual/device proof is separate |
| 2 | IMG-02 · First-Session Environment Base Pack | P1 | Class / Field / Greenhouse Battle | Consumer contract defined; `bg_school_common` Brief approval pending |
| 3 | IMG-03 · Frostbloom Environment State Pack | P1 | Greenhouse state/result | IMG-02 + effect reuse test pending |
| 4 | IMG-04 · Maren Dialogue Portrait Pack | P1 | Dialogue UI | character identity brief pending |
| 5 | IMG-05 · Protagonist Portrait Pack | P1 | Dialogue / future battle portrait | protagonist identity pending |
| 6 | IMG-06 · Greenhouse Spirit Combat Pack | P1 | Frostbloom Battle | battle consumer scene pending |
| 7 | IMG-07 · Main Companion Initial Runtime Pack | P1 | Field / Dialogue / Battle reaction / Result | companion canon recheck pending |
| 8 | IMG-08 · Field SD Character Pack | P1 | Simple 2D Field | field scene/clip contract pending |
| 9 | IMG-09 · Main/Title Runtime Pack | P2 | Main/Title | Product Root pending |
| 10 | IMG-10 · Store Key Art | P3 | Product distribution | Playable proof + platform recheck pending |

## 8. Historical · IMG-01 original handoff

### Product Goal

플레이어가 아이콘/부적을 슬롯에 넣는다고 느끼는 것이 아니라 **배운 마법 글자를 직접 써서 주문을 만든다**고 느껴야 한다.

### Actual Consumers

- `src/ui/spell_workflow/glyph_drawing_screen.tscn`
- `src/ui/spell_workflow/components/glyph_card.tscn`
- `src/ui/spell_workflow/circuit_placement_screen.tscn`
- `src/ui/components/star_circuit_board.tscn`
- future Task8 Spell Use thin UI

### Required Runtime Assets

```text
glyph_heat
glyph_protect
glyph_flow
glyph_focus
glyph_disperse
glyph_burst
```

Planned runtime folder:

```text
assets/art/ui/glyphs/
```

Planned runtime export target: `512×512 PNG RGBA` per glyph, unless Work review proves SVG/vector is technically superior and preserves the same consumption/provenance contract.

Runtime states such as recognized/selected/invalid/insufficient/committed should use Material/Outline/Modulate/Semantic Mark before creating duplicate textures.

글자 표현은 glyph PNG와 별도로 우측 하단에 라이브·현지화 가능 이름 라벨을 둔다. 예: `glyph_flow`는 `흐름`으로 표시한다. 이 라벨은 런타임 UI가 소유하며 PNG에 기능 텍스트를 구워 넣지 않는다.

### Must Preserve

- `data/glyphs/v1/glyph_vocabulary_v1.json` canonical shape/stroke identity
- visible handwritten stroke flow
- direct-written magical character impression
- current Magic/Anime + Blue/Blue-Purple magic language
- 48/64/96px UI readability

### Must Not Introduce

- talisman / hanging tag / paper charm
- collectible-card framing
- pictogram-first replacement of the letters
- new glyph ID or new mechanic
- baked functional text/numbers

### Before Image Generation

Work must first present and get approval for the exact **runtime consumer slot contract + six-glyph text brief**. This handoff does not authorize generation.

### 2026-08-26 · IMG-01 temporary visual approval receipt

The user approved all six glyph visual directions for temporary runtime use. That approval was subsequently integrated into current `main`; the original `PROTECT` image-side record is PR #178, and the later runtime integration/readability work is recorded in the current-main receipt below. The current `BURST` silhouette is explicitly approved as temporary even though it reads star-like, and must be re-evaluated at the runtime legibility gate.

All glyph PNGs remain glyph-only. The Korean name (`열기`, `보호`, `흐름`, `집중`, `분산`, `폭발`) is a live, localizable lower-right UI label, not baked image text.

This approval began as image-side provenance. Godot import, the shared resolver, and Task6/Task7 consumer binding are now recorded in the current-main receipt; 48/64/96px legibility, 1920×1080 capture, device, and performance validation remain unrun.

Implementation reconciled the vocabulary difference in the shared visual resolver: existing `AMPLIFY` uses the `BURST` texture visually without changing the glyph catalog, reservation, commit, Mana, target, or cast semantics. The alias remains a compatibility-preserving visual mapping, not a new gameplay glyph ID.

## 9. IMG-01 Integration contract to prepare after image approval

`CODEX-IMG-01 · Slice Glyph Integration`

Goal: approved six glyph assets are consumed by the actual Task6/Task7 UI without altering spell transaction authority.

Expected implementation shape:

```text
glyph_id
→ one shared runtime asset resolver
→ Task6 recognized glyph visual
→ GlyphCard visual
→ FIVE_POINT_STAR center/outer glyph visual
→ later Task8 reuse
```

Expected runtime paths:

```text
assets/art/ui/glyphs/glyph_heat.png
assets/art/ui/glyphs/glyph_protect.png
assets/art/ui/glyphs/glyph_flow.png
assets/art/ui/glyphs/glyph_focus.png
assets/art/ui/glyphs/glyph_disperse.png
assets/art/ui/glyphs/glyph_burst.png

assets/manifests/glyph_heat.json
...
```

Codex Non-Scope:

- recognition algorithm redesign
- Mana/inventory authority changes
- Stage2/Stage3 transaction changes
- new spell-name algorithm
- auto target / auto cast

Acceptance after integration:

- correct glyph ID maps to correct visual
- Task6 and Task7 consume the same glyph source
- source card and circuit no longer rely on name text alone to represent the letter
- state changes remain semantic and readable without texture explosion
- 1280×720 and 1920×1080 runtime screenshots exist
- existing tests and spell reservation/commit semantics do not regress

## 10. Codex Integration Queue

After each Image Goal reaches `Approved + Notion Registered + Implementation Ready`:

1. `CODEX-IMG-01` Slice Glyph Integration
2. `CODEX-IMG-02` Environment Base Integration
3. `CODEX-IMG-03` Frostbloom State Integration
4. `CODEX-IMG-04` Maren Dialogue Integration
5. `CODEX-IMG-05` Protagonist Portrait Integration
6. `CODEX-IMG-06` Greenhouse Spirit Animation Integration
7. `CODEX-IMG-07` Companion Integration
8. `CODEX-IMG-08` Field SD Integration
9. `CODEX-IMG-09` Main/Title Integration

Codex does not create the visual design by default. GPT/Work owns need analysis, text brief, generation/review, user approval and image-side handoff. Codex owns import/resource/scene/state/animation/runtime/test/evidence integration.

## 11. Do Not Pre-produce

- all 24 possible icons
- all 12 possible VFX modules
- all 8 legacy background overlays
- peer/general NPC portrait library without an actual first-session consumer
- companion growth stages
- Guardian permanent battle body
- 3D exploration family
- mob-wave enemy family
- Grimoire full illustration if Live UI suffices
- Store art before playable proof

## 12. Evidence Ceiling

Do not claim any of the following without fresh execution evidence:

```text
RUNTIME_VISUAL_COMPLETE
HUMAN_PASS
DEVICE_PASS
PERFORMANCE_PASS
FULL_VERTICAL_SLICE_PASS
WINDOWS_EXPORT_PASS
ANDROID_EXPORT_OR_DEVICE_PASS
```

Current values remain `NOT_PROVEN / NOT_RUN`.

## 13. Work Resume Prompt

Use this as the first instruction in the GRIMOIRE Work workspace if a concise restart is useful:

> GRIMOIRE 이미지 작업을 이어간다. 먼저 current Notion Home, AGENTS.md, ACTIVE_CONTEXT, `GRIMOIRE_GPT_WORK_IMAGE_GOAL_HANDOFF_2026-08-26.md`, `GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`, live GitHub main/open PR, latest Base main을 fresh-read해. 과거 메모리는 정본보다 낮게 둔다. 현재 NEXT는 IMG-02 First-Session Environment Base Pack이다. `FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md`를 읽고, 이미지부터 생성하지 말고 `bg_school_common`의 정확한 텍스트 Brief만 제시한 뒤 STOP해서 내 명시 생성 승인을 기다려. 설명용 시트는 만들지 않는다.

## 14. Stop Condition

이 handoff 이후 다음 Work action은 **IMG-02 · `bg_school_common` 텍스트 Brief 제시**다. 이미지 생성, Godot 구현, Task8 복구는 자동으로 시작하지 않는다.

## 15. 2026-08-26 IMG-01 Codex Runtime Integration · Current Main Receipt

사용자는 IMG-01 6종의 구현을 명시 승인했고, GitHub Issue [#179](https://github.com/alsdmlals4-eng/GRIMOIRE-/issues/179)로 범위를 고정했다. 구현과 후속 표시 보정은 PR [#180](https://github.com/alsdmlals4-eng/GRIMOIRE-/pull/180), [#182](https://github.com/alsdmlals4-eng/GRIMOIRE-/pull/182), [#184](https://github.com/alsdmlals4-eng/GRIMOIRE-/pull/184)를 통해 main에 병합됐다.

구현됨:

- `GlyphVisualResolver`가 `HEAT/PROTECT/FLOW/FOCUS/DISPERSE/BURST`의 공용 PNG 경로와 한국어 표시명을 해석한다.
- 기존 `AMPLIFY`는 게임 ID/거래 규칙을 바꾸지 않고 **시각적으로만** `BURST` 자산을 사용한다.
- Task6 인식 패널, Task7 `GlyphCard`, `FIVE_POINT_STAR`의 중심 Main·희소 Aux 슬롯이 같은 resolver를 소비한다.
- 한국어 이름은 PNG에 굽지 않고 런타임 UI의 우측 하단 텍스트로 표시한다.
- `GlyphCatalog.normalize_id`, 예약, 명시 확정, Mana, 대상, 시전은 변경하지 않았다.

자동 검증됨:

- Godot 4.7.2 headless SceneTree: 44 suites, 1,906 assertions, 0 failures.
- resolver direct ID, `AMPLIFY → BURST` 시각 호환, Task6 preview, Task7 card, Main/희소 Aux board binding 및 display-only 계약을 테스트했다.
- 6개 manifest export SHA-256과 512×512 PNG RGBA 기록은 별도 provenance manifest에 보존된다.
- main Runtime에서 1280×720 glyph overlay capture를 확보했다. 이는 48/64/96px 가독성 또는 기기·성능 검증을 대체하지 않는다.

아직 검증하지 않음:

- 48/64/96px 가독성, 1920×1080 capture, 기기, 성능, export, 전체 세로 슬라이스.

현재 이미지 생산의 다음 gate는 IMG-02의 `bg_school_common` 텍스트 Brief 제시와 명시 생성 승인이다. 위 IMG-01 미검증 항목을 PASS로 승격하지 않는다.
