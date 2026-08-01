# GRIMOIRE Asset·License Ledger

## 1. 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
last_reviewed_at: 2026-08-01
product_stage: DEMO_FIRST_VERTICAL_SLICE
primary_platform: PC
follow_up_platform: Mobile
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
asset_spec_01: APPROVED_VERTICAL_SLICE_ASSET_SPEC
asset_production: NOT_STARTED
external_runtime_assets: NONE_REGISTERED
fonts: NOT_SELECTED
ui_kits: NONE_SELECTED
plugins: NONE_ADOPTED
audio_assets: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

책임 원본:

- `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`.
- `docs/planning/ASSET_MANIFEST_SCHEMA.json`.
- `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`.
- `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`.

출처·권리·Source SHA·Export SHA·사용 화면·Approval·Runtime Evidence가 연결되지 않은 자산은 제품 자산으로 승인하지 않는다.

## 2. 조달·승인 순서

```text
현재 Decision·Art Bible·Asset Spec 확인
→ 기존 보유·승인 Source Inventory
→ 외부·생성 후보 조사
→ License·Style·Technical·Removal Risk 검토
→ Source Manifest
→ Export Candidate
→ Visual Review
→ Runtime Import
→ Runtime·Performance·Accessibility QA
→ PROJECT_ASSET_APPROVED
```

- 새로 만들기 전에 기존 승인 Source·Template·Godot 기본 기능을 조사한다.
- Pinterest·검색 이미지·상용 게임 Screenshot은 Discovery Reference이며 Source Asset이 아니다.
- 외부 Plugin·Asset Pack은 License와 제거 가능성 검증 전 설치하지 않는다.
- 생성 성공만으로 Runtime Asset이 되지 않는다.

## 3. 승인된 비주얼 권위

| Asset ID | 자산 | 역할 | 출처·보관 | 권리·상태 | SHA-256 | Runtime 사용 |
|---|---|---|---|---|---|---|
| `REF-ART-STYLE-LOCKED-01` | GRIMOIRE Art Style 잠긴 기준판 | Art·화면 구성 권위 | ChatGPT Library `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png` | `USER_APPROVED_REFERENCE / SOURCE_EDIT_PROHIBITED` | `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a` | `NO / REFERENCE_ONLY` |

금지:

- 원본 수정·재생성·리터치.
- Crop·Upscale·Text 교체본으로 원본 대체.
- Runtime Background·Character·UI로 직접 Import.
- Image 안의 이름·수치·파티 수를 자동 정본화.

## 4. 역사·Discovery Reference

| Asset ID | 자산 | 현재 역할 | 권리·상태 | 후속 |
|---|---|---|---|---|
| `REF-VISUAL-LEGACY-01` | 과거 Field SD·Half-body·Battle 구성 이미지 | Art Style 승인 이전 참고 | `HISTORICAL_REFERENCE / NOT_AUTHORITY` | 잠긴 기준판으로 대체 |
| `REF-SUMMON-01` | 늑대형 원소 정령수 방향 이미지 | Companion Discovery Reference | `USER_PROVIDED_OR_GENERATED_REFERENCE / NOT_RUNTIME_ASSET` | Asset Spec 기반 Character Sheet 후보 |
| `REF-SUMMON-GROWTH-01` | 성장 4단계 Concept Sheet | 장기 방향 참고 | `DEFERRED_BEYOND_SLICE` | Slice Asset 제작 금지 |
| `REF-GUARDIAN-MULTIROLE-01` | 전투 소환수 다역할 Concept | 과거 탐색 | `REJECTED_FOR_SLICE / NOT_AUTHORITY` | Guardian 1역할 규칙만 유지 |
| `REF-GENERIC-BOARD-REJECTED-01` | Generic Dark Fantasy·기술 Dashboard 이미지 | 실패 근거 | `REJECTED_NOT_AUTHORITY` | 재사용 금지 |

실제 Binary가 다시 필요하면 원본 File ID·SHA·Tool·날짜·권리·파생 관계를 먼저 복구한다.

## 5. Runtime Asset Manifest 상태

```yaml
manifest_schema: docs/planning/ASSET_MANIFEST_SCHEMA.json
runtime_asset_records: 0
project_asset_approved: 0
imported: 0
runtime_verified: 0
```

첫 Runtime Asset Record는 다음을 모두 포함해야 한다.

- Asset ID·역할·Decision ID.
- Source File ID/Path·SHA·Tool·Owner.
- Export Path·SHA·Format·Dimensions·Alpha·Import Profile.
- License Status·Evidence·Credit·Modification·Redistribution 조건.
- 사용 Screen.
- Approval·Supersession.
- Runtime Validation.

## 6. Font Ledger

| Font ID | 역할 | 후보 | License | 한글 Coverage | Runtime QA | 상태 |
|---|---|---|---|---|---|---|
| `FONT-BODY-01` | Body·UI Sans | 미선정 | `REVIEW_REQUIRED` | `REQUIRED` | `NOT_RUN` | `PLANNED` |
| `FONT-TITLE-01` | 제한적 Title Serif | 미선정 | `REVIEW_REQUIRED` | `REQUIRED` | `NOT_RUN` | `PLANNED` |

상한:

- Body/UI Family 1.
- Title Family 1.
- System Font 의존 금지.
- License Evidence 없는 Font Import 금지.
- Body 전역 MSDF는 PC·Mobile Trial 전 금지.

## 7. External Asset·Plugin Ledger

현재 등록:

```yaml
external_art_packs: 0
ui_kits: 0
font_packages: 0
godot_plugins: 0
audio_packs: 0
```

채택 전 필수:

1. Need Gap.
2. Current Godot 4.7 Compatibility.
3. Commercial License.
4. Modification·Redistribution·Credit.
5. Project Ownership·Trust.
6. Removal·Rollback Plan.
7. Art Style·Performance·Accessibility Trial.
8. 사용자 승인.

현재 Asset Pipeline은 Godot 기본 Import·Theme·SpriteFrames로 충분하므로 Add-on을 채택하지 않는다.

## 8. Runtime Export 형식

| 역할 | 형식 | 상태 |
|---|---|---|
| Opaque Background | WebP Lossless 우선 | `SPEC_APPROVED / NOT_EXPORTED` |
| Transparent Character·Portrait·VFX | PNG RGBA | `SPEC_APPROVED / NOT_EXPORTED` |
| Simple UI·Icon·Glyph Source | SVG | `SPEC_APPROVED / NOT_CREATED` |
| Font | Licensed TTF/OTF/WOFF2 | `SPEC_APPROVED / NOT_SELECTED` |
| Audio | `AUDIO-DIRECTION-01` 후 확정 | `BLOCKED` |

## 9. 수량 상한

| 자산군 | Hard Cap |
|---|---:|
| Opaque Background Base | 3 |
| Background State Overlay Set | 8 |
| 핵심 Half-body Portrait | 12 |
| 일반 NPC Half-body | 0 |
| Protagonist Field Frame | 36 |
| Professor Field Frame | 16 |
| Peer Field Frame | 16 |
| Companion Frame | 20 |
| Guardian Full Battlefield Body Set | 0 |
| Enemy Body Set | 1 |
| Enemy Frame | 50 |
| UI Component Family | 12 |
| Base Icon | 24 |
| Glyph Base | 3 |
| Reusable VFX Module | 12 |
| Font Family | 2 |

초과는 Scope Change Decision·Benchmark·사용자 승인·Sheet 동기화를 요구한다.

## 10. 생성·편집 자산 기록

생성 후보마다 기록:

- 목적과 실제 Screen Consumer.
- Brief·Prompt Path.
- 고정 Reference와 변경 축.
- Tool·Model·Date.
- Source File ID·SHA.
- Rights·Similarity Review.
- Revision History.
- User Approval.
- Export·Import·Runtime Evidence.

한글 UI Text는 Editable Layer로 제작하고 이미지 생성 결과의 Text를 제품 Text로 사용하지 않는다.

## 11. 대량 제작 차단

현재:

```yaml
art_style: PASS
art_bible: PASS
asset_spec: PASS
audio_direction: NOT_APPROVED
derivative_screen_consumers: PARTIAL
runtime_project: NOT_STARTED
mass_asset_generation: BLOCKED
```

다음 전에는 대량 제작을 시작하지 않는다.

- `BOSS-PHASE-01`.
- `GRIMOIRE-SCREEN-01`.
- `MAIN-SCREEN-01`.
- `AUDIO-DIRECTION-01`.
- 기획·아트 통합 검수.
- Asset Manifest·License Workflow 준비.

## 12. 현재 검증 경계

- Godot Asset Import: `NOT_RUN`.
- Texture Compression·Mipmap·MSDF 비교: `NOT_RUN`.
- Memory·Load Time: `NOT_RUN`.
- 720p·1080p·1440p·Ultrawide QA: `NOT_RUN`.
- PC Input·Mobile·Accessibility·Human Visual/Audio QA: `NOT_RUN`.
