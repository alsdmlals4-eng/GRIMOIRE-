# ASSET-SPEC-01 STANDARD Benchmark — 2026-08-01

## 1. 질문

> 승인된 GRIMOIRE Art Bible을 보존하면서 PC 우선 Solo Vertical Slice에 필요한 이미지·UI·Font·Animation·파일 구조를 어떤 해상도·형식·수량 상한으로 고정해야 하는가?

```yaml
benchmark_id: GR-BM-ASSET-SPEC-01
scale: STANDARD
status: COMPLETE
project: "GRIMOIRE: 세계를 다시 쓰는 법"
engine_candidate: Godot 4.7.1 stable
primary_platform: PC
follow_up_platform: Mobile
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 2. 고정된 프로젝트 제약

- 잠긴 Art Style 원본을 수정·재생성하지 않는다.
- 16:9 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- Soft Storybook 배경 + Clean Anime Cel 캐릭터.
- Navy/Gold UI + High-contrast Blue Glyph.
- 전투 상시 주인공 초상 1개, 동반 정령·수호 소환수 상태 배지.
- 일반 전투는 강한 적 1개체·단일 페이즈.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 제품 Godot 프로젝트와 Runtime Asset은 아직 없다.

## 3. 공식 Godot 근거

### 3.1 Multiple resolutions

Godot 4.7 공식 문서는 기준 Window Size와 Stretch Mode·Aspect 정책을 조합해 여러 해상도를 처리하고, `canvas_items`와 `expand`를 2D 프로젝트의 일반적인 출발점으로 설명한다. `expand`는 화면비가 넓어질 때 기준 영역 바깥의 World가 보일 수 있으므로, UI Anchor와 배경 확장 경계를 별도로 설계해야 한다.

- Source: https://docs.godotengine.org/en/4.7/tutorials/rendering/multiple_resolutions.html
- 적용: 1920×1080 Logical Frame + 1280×720 최소 판독 기준 + 16:9 UI Safe Frame.
- 판정: `ADOPT_WITH_SAFE_FRAME`.

### 3.2 Image·Texture import

Godot 4.7은 PNG·WebP·SVG 등 일반 이미지 형식을 Import해 `CompressedTexture2D`로 사용한다. SVG는 Import 과정에서 Rasterize되므로 단순 UI Shape·Icon에 적합하고, 실제 Pixel 수정이 필요한 경우에는 `Image`를 별도로 사용한다.

- Source: https://docs.godotengine.org/en/4.7/tutorials/assets_pipeline/importing_images.html
- 적용: Transparent Character·Portrait·UI·VFX는 PNG, Opaque Painterly Background는 WebP 후보, 단순 Icon Source는 SVG.
- 판정: `ADOPT`.

### 3.3 Texture compression·filtering

공식 Texture Import 문서는 Lossless·Lossy·VRAM Compressed 목적을 구분한다. 선명한 투명 UI·Glyph·Character는 Lossless가 안전하며, 큰 Opaque Background는 시각 비교 후 WebP Lossy 또는 VRAM Compression을 검토할 수 있다. Mipmap은 실제 축소·Camera Scale이 있는 자산에만 켠다.

- Source: https://docs.godotengine.org/en/4.7/tutorials/assets_pipeline/importing_images.html#compress-mode
- 적용: 제작 초기에는 Lossless를 기본으로 하고 Memory·Load Test 후 큰 Background만 단계적으로 압축.
- 판정: `ADAPT_AFTER_VISUAL_QA`.

### 3.4 Fonts

Godot 4.7 공식 문서는 TTF·OTF·WOFF·WOFF2의 Dynamic Font 사용과 Font License 확인을 요구한다. MSDF는 큰 Scale 변화에 유용하지만 작은 본문·Mobile 비용과 품질을 별도로 검증해야 한다.

- Source: https://docs.godotengine.org/en/4.7/tutorials/ui/gui_using_fonts.html
- 적용: 한글 지원 본문 Sans 1 Family + 제목용 제한적 Serif 1 Family. 정확한 Family는 License Ledger 후 확정.
- 판정: `ADOPT_WITH_LICENSE_GATE`.

### 3.5 Project organization·naming

Godot 공식 Project Organization 권장안은 관련 Scene·Script·Asset을 책임 단위로 묶고, Import하지 않을 Source Folder에는 `.gdignore`를 사용할 수 있음을 설명한다. File·Folder는 lowercase `snake_case`로 고정해 Case-sensitive Export 오류를 줄인다.

- Source: https://docs.godotengine.org/en/4.7/tutorials/best_practices/project_organization.html
- Source: https://docs.godotengine.org/en/4.7/tutorials/scripting/gdscript/gdscript_styleguide.html#file-names
- 적용: Domain-first Asset Folder, lowercase snake_case, Layered Source와 Runtime Export 분리.
- 판정: `ADOPT`.

### 3.6 Sprite animation

Godot의 `AnimatedSprite2D`와 `SpriteFrames`는 Clip별 Frame Animation을 관리할 수 있다. 한 Actor의 모든 Frame을 하나의 거대한 Atlas로 강제하지 않고 Action 단위로 분리하면 Import·Diff·Memory·교체 위험을 줄일 수 있다.

- Source: https://docs.godotengine.org/en/4.7/classes/class_animatedsprite2d.html
- Source: https://docs.godotengine.org/en/4.7/classes/class_spriteframes.html
- 적용: Actor/Action 단위 Atlas, 최대 Texture Size를 보수적으로 유지.
- 판정: `ADOPT`.

## 4. 세 가지 제작 모델 비교

| 안 | 계약 | 장점 | 위험 | 판정 |
|---|---|---|---|---|
| A. 1920×1080 Full-resolution All-master | 모든 배경·캐릭터·UI를 화면 최종 크기로 직접 제작 | 이해가 간단함 | 1440p·Ultrawide 품질 부족, Source/Runtime 혼합, 수정 비용 증가 | `REJECT` |
| B. 4K Source-first | 모든 자산을 4K 이상 Layered Master로 제작 | 확대·홍보 재사용 여유 | Solo 제작·Storage·Import·Revision 비용 과대, Slice 범위 팽창 | `REJECT_FOR_SLICE` |
| C. Logical Frame + Role-based Masters | 1920×1080 UI 기준, 2560×1440 Background Master, Actor별 제한된 Runtime Canvas, Vector UI Source | 가독성·품질·제작량·교체 가능성 균형 | Manifest·Export Rule이 없으면 Source Drift 발생 | `ADOPT_WITH_MANIFEST` |

## 5. 권장 해상도 모델

```text
Logical UI / Design Frame = 1920×1080
Minimum PC Readability Check = 1280×720
Ultrawide = Background·World 확장, UI는 중앙 16:9 Safe Frame 유지
```

### Safe Frame

- 1920×1080 기준 기본 Margin: 좌우 `64 px`, 상하 `48 px`.
- 1280×720에서는 비례 축소 후 Body Text가 최소 약 `16 px`에 해당하도록 Token을 설계한다.
- Writing Panel·Portrait·Attack Warning은 Safe Frame 안에서 겹침 없이 작동해야 한다.

## 6. 권장 Asset 역할별 형식

| 자산 | Source | Runtime Export | 기본 Import 방향 |
|---|---|---|---|
| Opaque Painterly Background | Layered Source, 2560×1440 | WebP Lossless 우선 | Linear Filter, 실제 축소 시 Mipmap 검토 |
| Character·Portrait·Enemy·Transparent VFX | Layered Source | PNG RGBA | Lossless, Linear Filter, Mipmap 기본 Off |
| Simple UI Shape·Icon·Glyph Reference | SVG Source | SVG 또는 Import Raster | 복잡 Filter·Baked Text 금지 |
| Font | Licensed TTF/OTF/WOFF2 | Dynamic Font | Body Raster AA 우선, MSDF 별도 Trial |
| Text | Editable Localization Data | Godot UI Text | Image에 한글 Bake 금지 |

## 7. Source와 Runtime 분리

```text
External or .gdignore Layered Source
→ Asset Manifest·SHA·License
→ Approved Runtime Export
→ Godot Import
→ Visual·Memory·Readability QA
```

- PSD·KRA·Clip 등 Layered Source는 Godot Import Root에서 제외한다.
- GitHub에는 실제 Runtime Export와 Manifest를 둔다.
- 외부 Library·Drive Source는 File ID·SHA·Owner·License·Export Version을 기록한다.
- 원본과 Runtime Export를 같은 이름으로 덮어쓰지 않는다.

## 8. Solo Vertical Slice 수량 비교

### 배경

- 학교 공용 Base 1.
- 현장 Greenhouse Field Base 1.
- 동일 사건 Battle Arena Base 1.
- 수업·시험·축제·손상·복구는 Overlay·Lighting·Prop State로 변형.
- Main은 학교 Base의 별도 Composite로 만들고 신규 Full Paint를 의무화하지 않는다.
- Grimoire는 공용 UI Component와 제한된 Illustration Slot으로 구성한다.

판정: `3 OPAQUE BASE MASTERS + MAX 8 STATE OVERLAYS`.

### 인물·존재

- Protagonist·Professor·Peer Half-body: 각 4 Expression, 총 12.
- Companion Reaction Icon: 최대 4.
- 일반 NPC Half-body: 0.
- Guardian: Badge 1 + Cut-in 1 + Protection FX 1 Set.
- Enemy: 1 Body Set, 일반 Multi-phase Variant 없음.

### UI·FX

- 공용 UI Component Family 최대 12.
- Base Icon 최대 24.
- Glyph Base 3; 상태 차이는 Tint·Outline·Material 우선.
- Reusable VFX Module 최대 12.
- Screen-specific Full-frame UI Art는 Grimoire·Main 합계 최대 2개지만, 기존 Base 재사용을 우선한다.

## 9. 위험 공격

### 과잉 해상도

4K Source를 모든 Asset에 의무화하면 Solo Slice가 Rendering 품질이 아니라 Source 관리 비용으로 막힌다.

### Frame 과잉

고프레임 Character Animation은 현재 고정 장면·초상 중심 화면에서 체감 대비 비용이 낮다. 핵심은 Glyph·Attack Warning·Enemy State 변화다.

### Font 과잉

서체 Family를 늘리면 한글 Glyph Coverage·License·Fallback·Font Memory 문제가 증가한다. Body 1 + Title 1을 상한으로 둔다.

### Duplicate State Asset

색·활성·잠김·선택 상태를 PNG 복제본으로 늘리면 UI 유지보수가 붕괴한다. Theme·Tint·Outline·Shader로 처리 가능한 상태는 Texture를 복제하지 않는다.

### Add-on 조기 도입

현재 Asset Pipeline은 Godot 기본 Import·Theme·SpriteFrames로 설계 가능하다. Asset Manager·Dialogue UI·Inventory UI Add-on은 필요성·License·제거 가능성이 증명되기 전 채택하지 않는다.

## 10. 최종 적용 판정

```yaml
ADOPT:
  - 1920x1080_logical_frame
  - 1280x720_minimum_readability
  - central_16_9_safe_frame
  - 2560x1440_background_master
  - png_for_transparency
  - webp_lossless_first_for_opaque_background
  - svg_for_simple_shapes_only
  - dynamic_licensed_fonts
  - lowercase_snake_case_paths
  - source_runtime_manifest_boundary
  - action_split_sprite_atlases
ADAPT_AFTER_QA:
  - lossy_or_vram_background_compression
  - mipmaps
  - msdf_fonts
REJECT:
  - universal_4k_source_requirement
  - baked_korean_text
  - one_giant_actor_atlas
  - duplicate_texture_per_ui_state
  - early_asset_pipeline_addons
```

## 11. 검증 경계

- 해상도·수량은 승인된 Production Contract이며 실제 Runtime 품질 증거가 아니다.
- Import Compression·MSDF·Mipmap 최종값은 Godot PC Build에서 비교한다.
- Mobile은 PC Runtime 검증 후 별도 Texture·Layout·Memory Budget을 만든다.
- 생성 이미지·외부 Asset·Font는 Source·License·유사성 검수 전 제품 자산이 아니다.
