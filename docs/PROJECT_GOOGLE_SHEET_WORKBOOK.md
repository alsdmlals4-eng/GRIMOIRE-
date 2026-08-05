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
sync_bundle: GR-SYNC-20260806-02-STAR-RUNTIME-POC
sync_status: SYNCED_TO_WORKING_BRANCH
sheet_write: PASS
sheet_readback: PASS
main_sync: PENDING_PR69_MERGE
sync_receipt: docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md
product_project: CREATED
product_implementation: RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

Sheet는 사용자 기획 작업면이며 Code·Scene·Test·Runtime 증거를 대체하지 않는다.

## 책임 원본

- 현재 결정: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- 승인: `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- 상세 설계: `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
- 회로·성공률: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- Mana·정밀·절감: `docs/planning/MANA_SYSTEM.md`
- 숙련도: `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- Runtime Sync: `docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md`
- Godot 테스트: `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## Sync02 Readback

```yaml
00_프로젝트_허브: H2:K2 PASS
02_현재_확정결정: A62:J62 PASS
04_누락_충돌_감사: E66:H66 PASS
05_GDD_요약: A20:J20 PASS
12_핵심루프: A27:J27 PASS
15_조작_게임규칙: A15:J15 PASS
40_핵심시스템_메인콘텐츠: A29:J29 PASS
41_성장_경제: A13:I13 PASS
60_UX_UI_접근성: A35:J35 PASS
99_변경이력: A80:H80 PASS
```

## 구현 결과

- Resource·6글자 Recognition·Persistence·Mobile Safe Root를 최신 main 정본 위에 이식.
- 구형 Stage2/3×3 Runtime은 이식하지 않음.
- Star Validator·Calculator·State·Atomic Coordinator·Harness 구현.
- RED `c5b8c0b5 / 31049468374`, Runtime GREEN `c6dfc7d1 / 31050121154`.
- Godot 4.7.1·Export Template PASS, 26 Suites·1,010 assertions·0 failures.

## 상태 경계

`SYNCED_TO_WORKING_BRANCH`는 PR #69 병합 전 상태다. 병합 후 main SHA와 Push Workflow를 Sheet에 다시 기록하기 전에는 `SYNCED_TO_MAIN`으로 승격하지 않는다. Mobile Device·Performance·Accessibility·Human·Full Slice는 `NOT_RUN`, 수치는 `PLAYTEST_TUNING_REQUIRED`다.
