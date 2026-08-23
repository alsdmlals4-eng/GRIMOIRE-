# GRIMOIRE 프로젝트 Google Sheets Workbook — Historical Migration Surface

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: MIGRATION_ONLY_UNTIL_REMOVAL
current_authority: false
new_canon_writes: FORBIDDEN
retirement_gate: BLOCKED_UNVERIFIED_UNIQUE_MATERIAL
historical_runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
historical_runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
historical_validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
historical_validation_merge_commit: 292d2b850b38945e404f81dbcf209220067729d2
historical_sheet_write: PASS
historical_sheet_readback: PASS
current_product_state: PARTIAL_FOUNDATION
current_runtime_evidence: STAR_CIRCUIT_AUTOMATED_POC_PASS_FULL_SLICE_NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_validation: NOT_RUN
```

## 현재 역할

이 Workbook은 더 이상 사용자 기획 정본이나 신규 승인 입력면이 아니다.

현재 GRIMOIRE authority split:

```text
Notion
→ human-facing Project Home / Work / Core System / Visual / Asset / Flow

GitHub repository
→ structured planning data / code / Scene / Resource / tests / runtime evidence

Google Sheets
→ historical migration source only
```

기존 Sheet의 고유 자료가 모두 Notion 또는 repository에 흡수됐는지 아직 전수 재검증하지 않았으므로 파일·탭·역사 sync 기록을 삭제하지 않는다. 이 상태는 `BLOCKED_UNVERIFIED_UNIQUE_MATERIAL`이다.

## 역사 Runtime Main 증거

과거 `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN`, `6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b`, `31 Suites / 1,137 assertions / 0 failures` 기록은 provenance로 유지한다. 이 기록은 당시 자동 Star Circuit Runtime 증거이며 현재 Full Vertical Slice나 Human/Device/Performance PASS로 승격되지 않는다.

## 역사 GR-TEST-033 Sheet Readback

```yaml
00_프로젝트_허브: H2:K2 PASS
01_작업순서: H55:J55 PASS
02_현재_확정결정: A65:J65 PASS
04_누락_충돌_감사: E69:H69 PASS
60_UX_UI_접근성: A38:J38 PASS
80_데모_버티컬슬라이스_플레이테스트: A36:J36 PASS
99_변경이력: A83:H83 PASS
```

위 값들은 **역사적 write/readback 사실**을 의미할 뿐 현재 Sheet authority를 의미하지 않는다.

## 제거 Gate

```text
Sheet inventory
→ UNIQUE / DUPLICATE / OBSOLETE 분류
→ UNIQUE human-facing meaning은 Notion으로 흡수
→ UNIQUE structured/runtime meaning은 repository로 흡수
→ destination readback
→ active Sheet consumer/reference = 0
→ archive/trash/delete 별도 결정
```

이 Gate가 끝나기 전에는 Sheet를 삭제하지 않는다. 그러나 신규 Decision·작업 상태·구현 상태를 Sheet에 쓰지도 않는다.
