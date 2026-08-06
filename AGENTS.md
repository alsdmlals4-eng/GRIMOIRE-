# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
current_branch: main
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
validation_ready_sync: GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
validation_merge_commit: 292d2b850b38945e404f81dbcf209220067729d2
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
current_validation_gate: GR-TEST-033
canon_status: SYNCED_TO_MAIN
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
physical_pack_validation: AUTOMATED_CONTRACT_PASS
mobile_device_validation: NOT_RUN
physical_device_status: DEVICE_NOT_RUN
performance_validation: NOT_RUN
performance_status: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
human_status: HUMAN_NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
full_vertical_slice_status: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
validation_pack_merged: true
```

## 프로젝트 코어

> 조사 → 의도 → `FIVE_POINT_STAR` 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·Mana·위험 Preview → 명시 Commit → 결과·대가 → 복기.

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
stock_scope: TYPED_GLYPH_ONLY
commit: EXPLICIT_EXACTLY_ONCE
```

## Godot 진입점

- 프로젝트 파일: `project.godot`
- Main Scene: `res://src/ui/star_circuit_harness.tscn`
- 권장 엔진: Godot `4.7.1`
- 화면: 1280×720 Mobile Landscape, GL Compatibility.

## GR-TEST-033

최신 별형 Runtime의 Android/iOS, Touch·Stylus, Finger Occlusion, Text130%, Screen Reader, Performance, Human 이해도·공정성을 검증하기 위한 실행 패키지는 Main에 병합됐다. 실제 참가자·물리 기기 실행은 아직 없으므로 `DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / HUMAN_NOT_RUN / FULL_VERTICAL_SLICE_NOT_RUN`을 유지한다.

## 금지

활성 3×3 Runtime, Universal Stock 임의 대체, 자동 Target·Commit, Best Route, 교수 예시 정답화, Commit 전 소비, 중복 소비, 실패 원인 은폐, 자동 테스트를 기기·사람·출시 PASS로 주장하는 행위를 금지한다.

## 출시·권리

- `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`
- `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`
