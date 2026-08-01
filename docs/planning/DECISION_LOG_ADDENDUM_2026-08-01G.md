# GRIMOIRE Decision Log Addendum — 2026-08-01G

## ASSET-SPEC-01

```yaml
decision_id: ASSET-SPEC-01
status: APPROVED_VERTICAL_SLICE_ASSET_SPEC
approved_at: 2026-08-01
approved_by: USER_BATCH_APPROVAL_RECOMMENDED_OPTION
benchmark: GR-BM-ASSET-SPEC-01 / STANDARD_COMPLETE
```

사용자의 권장안 일괄 승인에 따라 GRIMOIRE Solo Vertical Slice Asset Specification을 승인한다.

### 화면·해상도

- Logical Design Frame `1920×1080`.
- 최소 PC 판독 기준 `1280×720`.
- Ultrawide는 Background·World를 확장하고 UI는 중앙 16:9 Safe Frame 유지.
- 1080p Safe Margin: 좌우 `64 px`, 상하 `48 px`.

### 형식

- Opaque Painterly Background: `2560×1440 WebP Lossless` 우선.
- Transparent Character·Portrait·Enemy·VFX: `PNG RGBA`.
- Simple UI Shape·Icon·Glyph Reference: `SVG`.
- Font: 상업 이용·한글 Coverage가 확인된 Dynamic Font.
- 한글 Text Image Bake 금지.

### Solo 제작 상한

- Opaque Background Base `3`.
- Background State Overlay Set `8`.
- 핵심 Half-body Portrait `12`, 일반 NPC Portrait `0`.
- Protagonist Field Frame `36`.
- Professor·Peer Field Frame 각 `16`.
- Companion Frame `20`, Reaction Icon `4`.
- Guardian Full Battlefield Body Set `0`; Badge 1, Cut-in 1, FX 최대 8 Frame.
- Enemy Body Set `1`, 최대 `50 Frame`, 일반 Multi-phase Variant `0`.
- UI Component Family `12`.
- Base Icon `24`.
- Glyph Base `3`.
- Reusable VFX Module `12`.
- Font Family `2`.

### Source·Manifest·License

- Layered Source와 Runtime Export를 분리한다.
- Source는 외부 Library 또는 `.gdignore` Root에 보관한다.
- Runtime Export·SHA·License·사용 Screen·Approval·Runtime Validation을 Manifest로 추적한다.
- `docs/planning/ASSET_MANIFEST_SCHEMA.json`을 사용한다.
- 현재 Godot Asset Pipeline Add-on은 채택하지 않는다.

### 승인 경계

```text
ASSET SPEC = APPROVED
ASSET PRODUCTION = NOT_STARTED
GODOT IMPORT = NOT_RUN
RUNTIME·PERFORMANCE·HUMAN QA = NOT_RUN
```

정확한 Compression·Mipmap·MSDF·Memory·Load Time은 PC Runtime에서 검증한다.

## 다음 Gate

```text
BOSS-PHASE-01
→ GRIMOIRE-SCREEN-01
→ MAIN-SCREEN-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

권위:

- `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`.
- `docs/planning/ASSET_SPEC_01_STATE.json`.
- `docs/planning/benchmarks/ASSET_SPEC_01_STANDARD_BENCHMARK_2026-08-01.md`.
- `docs/planning/ASSET_MANIFEST_SCHEMA.json`.
- `docs/ASSET_LICENSE_LEDGER.md`.
