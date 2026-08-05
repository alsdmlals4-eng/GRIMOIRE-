# GRIMOIRE 프로젝트 Google Sheets Workbook

## 현재 계약

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
required_tabs: 27
primary_platform: Mobile
follow_up_platform: PC
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_bundle: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
sync_status: SYNCED_TO_WORKING_BRANCH
sheet_write: PASS
sheet_readback: PASS
main_sync: PENDING_PR69_MERGE
sync_receipt: docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
```

Sheet는 사용자 기획 작업면이며 Code·Scene·Test·Runtime 증거를 대체하지 않는다.

## 책임 원본

- 현재 결정: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- 별형 회로 승인·Spec·회로·Mana·숙련·Stock 책임 원본.
- Mobile Wireframe: `docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md`
- 결과 Policy: `docs/planning/SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md`
- 집중 필사: `docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md`
- Frostbloom UX: `docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md`
- Runtime Sync: `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md`
- Godot 테스트: `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## Sync03 Readback

```yaml
00_프로젝트_허브: H2:K2 PASS
02_현재_확정결정: A63:J63 PASS
04_누락_충돌_감사: E67:H67 PASS
05_GDD_요약: A21:J21 PASS
12_핵심루프: A28:J28 PASS
15_조작_게임규칙: A16:J16 PASS
40_핵심시스템_메인콘텐츠: A30:J30 PASS
41_성장_경제: A14:I14 PASS
60_UX_UI_접근성: A36:J36 PASS
99_변경이력: A81:H81 PASS
```

## 구현 결과

- 최신 main 기획 정본 위에 별형 Runtime POC를 재기반했다.
- 같은 glyph_id만 대체하는 `TypedGlyphStockPool`과 활성 Commit 경로를 구현했다.
- Mobile Wireframe 상태, 다단계 결과 Policy, 집중 필사 세션·Overlay, Frostbloom 6개 해결 UX Fixture를 구현했다.
- 구형 Stage2/3×3 Runtime은 이식하지 않았다.
- Completion RED `31052151348`.
- Implementation GREEN `f3187672bc18c989052d9e3f84a5306a272d9083`.
- Star Runtime `31053300711`: Godot 4.7.1, 31 Suites·1,137 assertions·0 failures.
- Planning/Base `31053301043`, Toolchain `31053300879`, 플랫폼 권리 `31053300688` PASS.

## 상태 경계

`SYNCED_TO_WORKING_BRANCH`는 PR #69 병합 전 상태다. 병합 후 main SHA와 Push Workflow를 Sheet에 다시 기록하기 전에는 `SYNCED_TO_MAIN`으로 승격하지 않는다. Mobile Device·Performance·Screen Reader·Human·Full Slice는 `NOT_RUN`, 수치는 `PLAYTEST_TUNING_REQUIRED`다.
