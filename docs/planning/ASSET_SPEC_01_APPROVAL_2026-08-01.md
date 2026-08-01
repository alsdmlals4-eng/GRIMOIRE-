# ASSET-SPEC-01 승인 — GRIMOIRE Vertical Slice Asset Specification

## 1. 결정 상태

```yaml
decision_id: ASSET-SPEC-01
status: APPROVED_VERTICAL_SLICE_ASSET_SPEC
approved_at: 2026-08-01
approved_by: USER_BATCH_APPROVAL_RECOMMENDED_OPTION
benchmark_id: GR-BM-ASSET-SPEC-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
primary_platform: PC
follow_up_platform: Mobile
engine_candidate: Godot 4.7.1 stable
implementation_authority: NONE
asset_production_authority: SPEC_APPROVED_PRODUCTION_NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

사용자의 일괄 승인에 따라 공식 Godot 4.7 Asset Pipeline 근거와 현재 Art Bible·Battle Rules를 바탕으로 권장 규격을 기획 정본으로 확정한다.

---

# PART A. 화면·해상도 계약

## 2. Logical Frame

```yaml
logical_design_frame: 1920x1080
minimum_pc_readability: 1280x720
primary_aspect_ratio: 16:9
ultrawide_policy: EXPAND_BACKGROUND_AND_WORLD_KEEP_UI_IN_16_9_SAFE_FRAME
portrait_orientation: NOT_SUPPORTED_IN_PC_SLICE
mobile_layout: SEPARATE_FOLLOW_UP_DERIVATIVE
```

- UI·Layout·Text Token은 `1920×1080`에서 설계한다.
- `1280×720`에서 Text·Attack Warning·Glyph·Button·Focus가 읽혀야 한다.
- Ultrawide에서는 배경·World만 확장하고 핵심 UI는 중앙 16:9 Safe Frame 안에 유지한다.
- Godot 구현 시 `canvas_items + expand`를 첫 기술 후보로 사용하되 실제 Project Setting은 기술 검수에서 확정한다.

## 3. Safe Frame

1920×1080 기준:

```yaml
safe_margin_left: 64
safe_margin_right: 64
safe_margin_top: 48
safe_margin_bottom: 48
```

- Title·Subtitle·Button·Gauge·Glyph Canvas의 필수 정보는 Safe Frame 밖으로 나가지 않는다.
- Decorative Background·Particle·World Prop만 Safe Frame 밖 확장을 허용한다.
- Battle에서 Enemy Telegraph, Player Portrait, Writing Panel은 서로 겹치지 않는다.

## 4. Battle Layout Asset Boundary

```text
상단·중앙 = Enemy·Environment·Attack Telegraph
좌측 하단 = Protagonist Portrait·HP·Mana·Status
좌측 보조 = Companion·Guardian Status Badge
우측 = Collapsed Writing Rail → Expanded Writing Panel
```

- Collapsed Writing Rail: Logical Width `96 px` 기준.
- Expanded Writing Panel: 화면 너비의 `30~34%` 범위.
- Player Portrait Group: 화면 너비의 최대 `22%`.
- 수치는 Layout 제작 기준이며 실제 Runtime Scale은 1280×720·Ultrawide QA에서 조정한다.
- 아군·Guardian 몸체를 전장에 상시 배치하는 Asset Set은 만들지 않는다.

---

# PART B. 파일 형식·Source 관리

## 5. 형식 계약

| 자산군 | Source Master | Runtime Export | Alpha | 기본 Import |
|---|---|---|---|---|
| Painterly Background | Layered Source, 2560×1440 | WebP Lossless | 없음 | Linear, Mipmap Trial |
| Character·Portrait·Enemy | Layered Source | PNG RGBA | 있음 | Lossless, Linear, Mipmap Off |
| UI Panel·Frame·Badge | SVG 또는 Layered Source | SVG/PNG | 있음 | Linear |
| Simple Icon·Glyph Reference | SVG Source | SVG | 있음 | Rasterize on Import |
| Animated VFX | Layered Sequence | PNG RGBA Atlas/Frames | 있음 | Lossless, Linear |
| Font | Licensed TTF/OTF/WOFF2 | Dynamic Font | 해당 없음 | Font Import |
| Text·Label | Localization Data | Godot UI Text | 해당 없음 | Image Bake 금지 |

### 금지

- UI·Glyph·Character에 JPEG 사용.
- 한글 Text를 이미지에 Bake.
- SVG에 복잡한 Filter·Mask·Embedded Raster·Font Text 의존.
- Source Layer File을 Runtime Texture로 직접 Import.
- 같은 State를 색만 바꾼 PNG 복제본으로 증식.

## 6. Source Master와 Runtime Export

```text
Layered Source
→ Manifest·SHA·License·Owner
→ Review Candidate Export
→ User/Project Approval
→ Runtime Export
→ Godot Import
→ Runtime QA
```

- Layered Source는 외부 Library·Drive 또는 `.gdignore` Source Folder에 둔다.
- GitHub 제품 경로에는 Runtime Export·Manifest·License Ledger만 둔다.
- Source를 외부 보관하면 File ID·SHA-256·Owner·Tool·Export Version을 Manifest에 기록한다.
- 승인된 잠긴 기준판은 Source Asset이 아니라 Visual Authority Reference다.
- Runtime Export는 Source와 다른 File ID·SHA·State를 가진다.

## 7. 파일명·폴더명

- 전부 lowercase `snake_case`.
- 날짜·`final`·`final2`·`latest`를 활성 File Name에 사용하지 않는다.
- State·Variant는 명시적 suffix를 사용한다.

예:

```text
bg_school_common.webp
bg_school_festival_overlay.webp
chr_protagonist_portrait_neutral.png
chr_protagonist_portrait_concerned.png
enemy_greenhouse_spirit_attack_pressure_01.png
ui_battle_writing_panel.svg
vfx_glyph_flow_path_01.png
```

---

# PART C. 목표 폴더 구조

## 8. Runtime Asset Root

```text
assets/
├─ art/
│  ├─ backgrounds/
│  │  ├─ school/
│  │  ├─ greenhouse/
│  │  └─ battle/
│  ├─ characters/
│  │  ├─ protagonist/
│  │  ├─ professor/
│  │  ├─ peer/
│  │  ├─ companion/
│  │  └─ guardian/
│  ├─ enemies/
│  │  └─ greenhouse_spirit/
│  ├─ ui/
│  │  ├─ common/
│  │  ├─ field/
│  │  ├─ dialogue/
│  │  ├─ writing/
│  │  ├─ battle/
│  │  ├─ result/
│  │  ├─ grimoire/
│  │  └─ main/
│  └─ vfx/
│     ├─ glyph/
│     ├─ battle/
│     └─ result/
├─ fonts/
├─ audio/
└─ manifests/
```

Audio는 Folder만 예약하고 실제 규격은 `AUDIO-DIRECTION-01`에서 확정한다.

## 9. Source Root

```text
art_source/            # .gdignore 또는 외부 Library
├─ backgrounds/
├─ characters/
├─ ui/
├─ vfx/
└─ exports/
```

- Source Root는 Godot Runtime Import 대상이 아니다.
- Export Script·Preset을 사용하면 Tool Version과 Preset Hash를 기록한다.

---

# PART D. 배경 Asset 상한

## 10. Opaque Background Master

Vertical Slice 신규 Full Paint 상한:

| ID | Asset | Master | Runtime | 역할 |
|---|---|---:|---:|---|
| BG-01 | School Common Base | 2560×1440 | 2560×1440 WebP | 수업·시험·축제 공용 |
| BG-02 | Greenhouse Field Base | 2560×1440 | 2560×1440 WebP | 현장 관찰·복귀 |
| BG-03 | Greenhouse Battle Arena | 2560×1440 | 2560×1440 WebP | 동일 사건 별도 전투장 |

Hard Cap: `3 OPAQUE BASE MASTERS`.

### 파생 정책

- 수업·시험·축제는 BG-01의 Lighting·Prop·Crowd·Damage State로 변형한다.
- Main은 BG-01을 기반으로 한 별도 Composite를 우선하고 신규 Full Paint 의무 없음.
- Grimoire는 공용 UI Frame + 제한된 Illustration Slot으로 구성하며 전용 Full Paint 의무 없음.

## 11. State Overlay

Hard Cap: `8 STATE OVERLAY SETS`.

권장 슬롯:

1. class_practice.
2. exam_crystal.
3. festival_decoration.
4. festival_light_thread_damage.
5. greenhouse_pressure_warning.
6. greenhouse_damage.
7. greenhouse_resolved.
8. field_return_result_variant.

- Lighting·Color Grade·Particle만 다른 경우 Texture Duplicate보다 Material·Modulate·Light를 우선한다.
- 완전 다른 Perspective·Camera로 재제작하면 새 Base Master로 계산한다.

---

# PART E. Character·Creature Asset 상한

## 12. Half-body Portrait

Runtime Export 기준:

```yaml
portrait_canvas: 1024x1536_rgba
source_master_recommended_height: 2048_to_3072
crop_contract: waist_or_mid_thigh_with_headroom
```

### 핵심 인물

| Character | Expression | 수량 |
|---|---|---:|
| Protagonist | neutral / focused / concerned / relieved | 4 |
| Professor | neutral / instructive / stern / approving | 4 |
| Peer | neutral / confident / frustrated / respectful | 4 |

Hard Cap: `12 HALF-BODY EXPORTS`.

- Expression은 얼굴·눈썹·입·작은 손동작 변화 중심.
- 의상 Variant·Festival Costume·Battle Costume는 Slice에서 제외.
- 일반 NPC Half-body는 `0`.

## 13. Protagonist Field SD

```yaml
runtime_frame_canvas: 384x384_rgba
source_frame_canvas: 768x768_recommended
side_direction: MIRROR_ALLOWED
hard_frame_cap: 36
```

Clip 상한:

| Clip | Direction | Frame |
|---|---:|---:|
| idle | front / back / side | 4 each = 12 |
| move | front / back / side | 6 each = 18 |
| interact_cast | shared or context variant | max 6 |

- Battle에 Protagonist Full-body Animation을 상시 표시하지 않는다.
- Dialogue·Portrait·Field SD는 같은 Hair·Face·Uniform Key를 공유한다.
- 고프레임 Emote·Cutscene Animation은 Slice 제외.

## 14. Professor·Peer Field SD

각 Character:

```yaml
runtime_frame_canvas: 384x384_rgba
hard_frame_cap_per_character: 16
```

권장:

- idle front/side: 4×2 = 8.
- talk/reaction shared clip: 최대 8.
- Full directional Move Set은 필요 Scene이 승인되기 전 제작하지 않는다.

Hard Cap: `32 FRAMES TOTAL`.

## 15. Main Companion

```yaml
runtime_frame_canvas: 256x256_rgba
hard_frame_cap: 20
```

- idle 6.
- move 6.
- reaction 4 states ×2 = 8.
- 성장 2~4단계·탑승·대형 Battle Form은 Slice 제외.
- Dialogue에서는 별도 Full-body Portrait보다 Reaction Icon·Field Reaction을 우선한다.

## 16. Companion Reaction Icon

```yaml
runtime_canvas: 256x256_rgba
count_cap: 4
states: neutral / curious / alarmed / pleased
```

## 17. Guardian Support

Vertical Slice 필수:

- Status Badge `1`.
- Short Cut-in `1`.
- Protection FX Sequence `1`, 최대 `8 Frames`.

```yaml
guardian_full_battlefield_body_set: 0
multi_role_variants: 0
```

- Timer Stop·Automatic Cast·Permanent Shield를 암시하는 Visual은 금지.
- 정확한 사용 횟수·완화율은 Prototype Tuning 후 State Mark를 추가한다.

## 18. Greenhouse Spirit Enemy

```yaml
runtime_frame_canvas: 512x512_rgba
source_frame_canvas: 1024x1024_recommended
hard_frame_cap: 50
normal_phase_count: 1
```

권장 Clip 상한:

| Clip | Frame Cap |
|---|---:|
| idle_unstable | 8 |
| telegraph_pressure | 4 |
| attack_pressure | 6 |
| telegraph_surge | 4 |
| attack_surge | 6 |
| telegraph_environment | 4 |
| attack_environment | 6 |
| instability_reaction | 4 |
| calm_resolve | 8 |

합계: `50`.

- 적당한 Spell이 불안정도를 낮추는 상태 변화를 Texture 전체 교체보다 Overlay·Material·VFX로 우선 표현한다.
- 일반 적 Multi-phase Full Body Variant는 `0`.
- Boss Phase 파생은 `BOSS-PHASE-01` 승인 전 제작하지 않는다.

---

# PART F. UI·Icon·Glyph·VFX 상한

## 19. UI Component Family

Hard Cap: `12 COMPONENT FAMILIES`.

1. panel.
2. button.
3. tab.
4. badge.
5. gauge.
6. icon_slot.
7. tooltip.
8. modal.
9. scrollbar.
10. divider.
11. focus_ring.
12. cursor_pointer.

- Field·Dialogue·Writing·Battle·Result·Grimoire·Main은 동일 Family를 Theme·Size·Content로 변형한다.
- Screen마다 독립 Frame Set을 만들지 않는다.
- Hover·Pressed·Disabled·Selected는 Theme·Tint·Outline을 우선한다.

## 20. Base Icon

Hard Cap: `24 BASE ICONS`.

필수 후보:

- HP, Mana, Instability, Environment, Attack Timer, Slow, Pause, Warning.
- Flow, Focus, Disperse.
- Calm, Prepared, Connected.
- Companion, Guardian.
- Undo, Clear, Cancel, Confirm.
- Grimoire, Result, Save, Settings.

- 같은 Icon의 색 Variant는 수량에 포함하지 않지만 Texture Duplicate는 만들지 않는다.
- Icon은 색 외 Shape·Interior Mark로 구분한다.

## 21. Glyph

```yaml
base_glyph_count: 3
base_canvas: 512x512_vector_or_rgba
states_by_material_or_outline: true
```

Base:

- flow.
- focus.
- disperse.

State:

- raw_stroke.
- recognized.
- selected.
- invalid_grammar.
- insufficient_condition.
- committed.

State는 Base Texture 복제보다 Line Style·Outline·Color·Icon Mark로 표현한다.

## 22. Reusable VFX Module

Hard Cap: `12 MODULES`.

1. raw_glyph_stroke.
2. recognition_confirm.
3. target_lock.
4. flow_path.
5. focus_core.
6. disperse_wave.
7. enemy_attack_warning.
8. instability_reduction.
9. environment_change.
10. guardian_protection.
11. result_success_partial.
12. failure_reason.

- 한 Situation 전용 VFX는 기존 Module 조합으로 먼저 해결한다.
- 전 화면 Bloom·긴 Flash·Glyph 가림 금지.

## 23. Screen-specific Full-frame UI Art

Hard Cap: `2`.

- Grimoire Screen supporting illustration/frame.
- Main Screen supporting composite.

둘 다 공용 Component·Background Base 재사용이 우선이며 신규 Full Paint를 자동 의무화하지 않는다.

---

# PART G. Typography 계약

## 24. Font Family 상한

```yaml
body_ui_family_count: 1
limited_title_family_count: 1
system_font_dependency: PROHIBITED
licensed_korean_glyph_coverage: REQUIRED
```

- Body/UI: Sans Family 1개.
- Title/Chapter/Grimoire Heading: Serif 또는 Decorative Family 1개.
- Fallback Chain은 숫자·기호·한글이 끊기지 않도록 License와 함께 기록한다.
- 정확한 Family 채택 전 License Ledger와 PC Runtime Rendering을 확인한다.

## 25. 1920×1080 Typography Token

| Token | Size | 용도 |
|---|---:|---|
| display | 56 px | Main Title·Major Result |
| h1 | 40 px | Screen Title |
| h2 | 32 px | Section·Modal Title |
| body | 24 px | Dialogue·Description |
| label | 20 px | Button·Gauge·Status |
| small | 18 px | Auxiliary Text, 최소 상한 |

- Body Line Height 목표 `1.35~1.45`.
- 1280×720 비례 축소에서 Small이 약 12 px가 되므로, 실제 최소 해상도에서는 UI Scale·Font Override로 가독성을 보정한다.
- 필수 정보는 1280×720에서 실측 최소 `16 px`를 목표로 한다.
- Text Overflow·Long Korean·Keyboard Focus를 Runtime에서 검증한다.

## 26. Font Rendering

- Body는 기본 Grayscale Anti-aliasing을 우선한다.
- MSDF는 큰 Scale 변화가 있는 Heading·World Label에서만 Trial한다.
- Mobile 비용과 작은 Font 선명도가 검증되지 않으면 MSDF를 전역 적용하지 않는다.

---

# PART H. Import·Atlas·Memory 정책

## 27. Filter

- 프로젝트는 Pixel Art가 아니므로 기본 `Linear`.
- Nearest는 의도적으로 Pixel-snapped Icon을 설계한 예외에서만 승인한다.
- UI Line·Glyph가 흐려지면 Source Stroke·Export Resolution·Scale을 먼저 교정한다.

## 28. Mipmap

기본:

- UI·Portrait·Glyph·Field SD: Off.
- Background·Enemy가 실제로 큰 폭 Downscale되면 On Trial.
- Final은 1080p·720p·1440p 비교 후 확정.

## 29. Compression

### 제작 초기

- PNG·WebP Lossless.
- Visual Artifact 비교 기준을 먼저 확보.

### 최적화 단계

- Opaque Background만 WebP Lossy 또는 VRAM Compression Trial.
- Character·Glyph·UI는 Edge·Alpha Artifact가 없을 때만 변경.
- 품질 비교 Capture와 Memory 결과 없이 일괄 압축 금지.

## 30. Atlas

- Actor/Action 단위로 분리한다.
- One Giant Atlas 금지.
- 최대 Texture Dimension 목표 `4096×4096` 이하.
- Clip 교체가 다른 Clip Hash를 불필요하게 바꾸지 않도록 분리한다.

예:

```text
chr_protagonist_idle.png
chr_protagonist_move.png
chr_protagonist_interact_cast.png
enemy_greenhouse_spirit_pressure.png
enemy_greenhouse_spirit_surge.png
```

---

# PART I. Manifest·License·Approval

## 31. Asset Manifest 필수 Field

```yaml
asset_id:
role:
decision_ids:
source_file_id:
source_sha256:
source_tool:
source_owner:
license:
license_evidence:
export_file:
export_sha256:
dimensions:
format:
alpha:
import_profile:
status:
approved_by:
approved_at:
used_in_screens:
replacement_or_supersession:
runtime_validation:
```

## 32. Asset 상태

```text
PLANNED
→ SOURCE_READY
→ EXPORTED_CANDIDATE
→ IN_VISUAL_REVIEW
├─ REVISION_REQUIRED
├─ REJECTED
└─ APPROVED_RUNTIME_CANDIDATE
   → IMPORTED
   → RUNTIME_VERIFIED
   → PROJECT_ASSET_APPROVED
```

- Art Bible 승인만으로 개별 Asset이 `PROJECT_ASSET_APPROVED`가 되지 않는다.
- Generated Image는 `EXPORTED_CANDIDATE` 또는 `IN_VISUAL_REVIEW`다.
- Runtime Capture·Performance·Readability Evidence 전에는 `RUNTIME_VERIFIED`를 사용하지 않는다.

## 33. License Gate

- Font·Texture·Icon·Brush·Audio·Plugin의 상업 사용·수정·재배포·Credit 의무를 기록한다.
- License가 불명확한 Pinterest·검색 Image는 Discovery Reference이며 Source Asset이 아니다.
- 외부 Asset 설치·구매·계정 연결은 별도 사용자 승인과 Removal Plan이 필요하다.
- 현재 Asset Pipeline에 Add-on은 채택하지 않는다.

---

# PART J. 화면별 최소 Asset Checklist

## 34. Main

- School Base Composite.
- Logo/Text는 Editable UI.
- New Game / Continue / Settings Button State.
- Continue Locked/No Save State.
- Companion 또는 Grimoire Symbol 1개.

## 35. Field·Schedule

- School/Greenhouse Background.
- Protagonist SD.
- Professor·Peer SD.
- Companion SD.
- Goal Marker·Interaction Badge.
- Schedule Card는 공용 UI Component.

## 36. Dialogue

- 핵심 인물 Half-body 12.
- Speaker Name·Dialogue Text는 Editable UI.
- Log·Auto/Manual·Skip는 실제 필요성 검토 후 Common Icon에서 사용.

## 37. Writing

- Glyph 3 Base.
- Raw/Recognized/Selected/Invalid/Committed State.
- Candidate Slot·Undo·Clear·Cancel·Confirm.
- Target·Condition·Cost·Risk Indicator.
- Background Dim은 Shader/Overlay, 별도 Full-screen Texture 금지.

## 38. Battle

- Greenhouse Battle Arena.
- Enemy 1 Body Set.
- Protagonist Portrait 1 Active Set.
- Companion·Guardian Badge.
- HP·Mana·Instability·Environment·Attack Timer Gauge/Icon.
- Collapsed/Expanded Writing Panel.
- Time State `1.0× / Slow / Pause`.
- Guardian Cut-in·Protection FX.

## 39. Result·Field Return

- Result Common Panel.
- Success/Partial/Failure Reason Icon.
- Environment Before/After State.
- Reward보다 Cause·Change가 먼저 보이는 Text Layout.

## 40. Grimoire

- Common Navy/Gold Frame.
- Situation List·Entry Detail·Glyph·Intent·Result·Side Effect·Discovery Slot.
- Empty·Selected·New Entry·Unavailable State.
- 자동 최적 조합·Click Auto-cast Asset 금지.

---

# PART K. QA·통과 조건

## 41. Static QA

- lowercase snake_case.
- 허용 Format.
- Dimension·Alpha·Color Space 확인.
- Source·Export SHA 연결.
- Decision ID·Screen Consumer 연결.
- License Evidence 존재.
- Duplicate·Supersession 확인.
- 수량 Hard Cap 초과 없음.

## 42. Visual QA

- Locked Art Style과 같은 게임으로 보임.
- SD·Portrait·Cut-in의 동일 인물성.
- Glyph·Target·Attack Warning이 가장 먼저 읽힘.
- Navy/Gold UI가 Background와 Character를 가리지 않음.
- 1280×720에서 필수 Text·Button·Gauge 판독.
- Ultrawide에서 UI가 중앙 Safe Frame을 유지.
- Color 없이 Icon·Shape·Text로 상태 구분.
- Long Korean Text·Focus Ring·Reduced Motion 대체 가능.

## 43. Runtime QA — 후행

```text
1080p / 720p / 1440p / Ultrawide
→ Import Texture Quality
→ Memory·Load Time
→ UI Scale·Font Rendering
→ Atlas·Animation Playback
→ Glyph·Attack Warning Readability
→ Scene Transition·Resource Reuse
```

현재는 `NOT_RUN`.

## 44. Stop Conditions

- Background Base 3개 또는 Overlay Set 8개 초과.
- 핵심 Half-body 12개 초과.
- 일반 NPC Portrait 제작 시작.
- 일반 적 Full-body Multi-phase Variant 제작.
- Screen마다 독립 UI Frame Set 제작.
- Font Family 2개 초과.
- Base Icon 24개·VFX Module 12개 초과.
- Source·License·Manifest 없는 Asset Import.
- 잠긴 기준판을 Runtime Asset으로 가공.
- Asset Spec 승인만으로 대량 생성 시작.

초과가 필요하면 Scope Change Decision·Benchmark·사용자 승인·Sheet 동기화를 선행한다.

---

## 45. 다음 Gate

```text
ASSET-SPEC-01 — 승인 완료
→ BOSS-PHASE-01
→ GRIMOIRE-SCREEN-01
→ MAIN-SCREEN-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

Asset Production은 아직 시작하지 않는다. 다음 작업은 보스 규칙과 파생 화면 구조를 먼저 닫고, 필요한 Asset Consumer를 확정하는 것이다.
