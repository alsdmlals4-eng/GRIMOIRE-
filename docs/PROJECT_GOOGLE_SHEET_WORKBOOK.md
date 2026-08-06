# GRIMOIRE 프로젝트 Google Sheets Workbook — Main + Validation Overlay

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
required_tabs: 27
primary_platform: Mobile
follow_up_platform: PC
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_bundle: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
sync_status: SYNCED_TO_MAIN
sheet_write: PASS
sheet_readback: PASS
runtime_pull_request: 69
runtime_main_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
```

Sheet는 사용자 기획 작업면이며 Code·Scene·Test·Runtime 증거를 대체하지 않는다.

## Main Closure Readback

```yaml
00_프로젝트_허브: H2:K2 PASS
02_현재_확정결정: A64:J64 PASS
04_누락_충돌_감사: E68:H68 PASS
05_GDD_요약: A22:J22 PASS
12_핵심루프: A29:J29 PASS
15_조작_게임규칙: A17:J17 PASS
40_핵심시스템_메인콘텐츠: A31:J31 PASS
41_성장_경제: A15:I15 PASS
60_UX_UI_접근성: A37:J37 PASS
99_변경이력: A82:H82 PASS
```

## Main 증거

```yaml
pr_exact_head: c68a553d77d6d7e0cc6f92f4c318f00c267db6c5
pr_star_runtime_run: 31054934827
pr_planning_base_adversarial_run: 31054934887
pr_godot_toolchain_run: 31054934882
pr_platform_rights_run: 31054934838
runtime_main_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
main_star_runtime_run: 31055213468
main_platform_rights_run: 31055213609
godot_suites: 31
assertions: 1137
failures: 0
```

요약: `31 Suites / 1,137 assertions / 0 failures`.

## GR-TEST-033 Validation Overlay

```yaml
validation_sync: GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY
validation_gate: GR-TEST-033
pull_request: 72
implementation_evidence_head: 829d1c68729ab3702fa33015ffe27faad64fe9be
status: EXECUTION_PACK_AUTOMATED_PASS_HUMAN_NOT_RUN
physical_pack_run: 31065294476
star_runtime_run: 31065294439
planning_base_adversarial_run: 31065294443
godot_toolchain_run: 31065294442
platform_rights_run: 31065294446
sheet_write: PASS
sheet_readback: PASS
mobile_device_execution: DEVICE_NOT_RUN
performance_execution: PERFORMANCE_NOT_RUN
screen_reader_execution: DEVICE_NOT_RUN
human_execution: HUMAN_NOT_RUN
full_vertical_slice_execution: FULL_VERTICAL_SLICE_NOT_RUN
```

### Validation Readback

```yaml
00_프로젝트_허브: H2:K2 PASS
01_작업순서: H55:J55 PASS
02_현재_확정결정: A65:J65 PASS
04_누락_충돌_감사: E69:H69 PASS
60_UX_UI_접근성: A38:J38 PASS
80_데모_버티컬슬라이스_플레이테스트: A36:J36 PASS
99_변경이력: A83:H83 PASS
```

## 책임 원본

- 현재 결정: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- 별형 회로 승인·Spec·회로·Mana·숙련·Stock 책임 원본.
- Mobile Wireframe·결과 Policy·집중 필사·Frostbloom UX 승인.
- `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN.md`
- `docs/superpowers/specs/2026-08-06-star-circuit-physical-validation-design.md`
- `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`
- `docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md`
- `docs/planning/sync/GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY.md`

## 경계

Main Sync는 제품 Runtime 자동 계약 완료를 뜻하고 Validation Overlay는 실행 패키지 자동 준비 완료를 뜻한다. 실제 Mobile Device·Performance·Screen Reader·Human·Full Slice는 `NOT_RUN`; 수치는 `PLAYTEST_TUNING_REQUIRED`다.
