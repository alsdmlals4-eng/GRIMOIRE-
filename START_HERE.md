# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Main Sync | `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN` |
| Runtime Main | `6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b` |
| 제품 구현 | `STAR_RUNTIME_COMPLETION_AUTOMATED_PASS` |
| Godot | `4.7.1 / 31 Suites / 1,137 assertions / 0 failures` |
| Google Sheet | `SYNCED_TO_MAIN / READBACK_PASS` |
| Mobile Device·Performance·A11y Device·Human | `NOT_RUN` |
| 수치 | `PLAYTEST_TUNING_REQUIRED` |

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. 별형 회로 승인·Spec·회로·Mana·숙련·Stock 책임 원본
7. Mobile Wireframe·Resolution·Focus Scribing·Frostbloom 승인
8. `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN.md`
9. `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## 핵심 루프

```text
조사 → 의도 → FIVE_POINT_STAR → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과·대가 → 복기
```

중앙 Main 1개와 동등한 외곽 Auxiliary 0~5개를 사용한다. Target은 회로 밖 키워드이며 자동 추천하지 않는다. 같은 glyph_id Typed Stock 또는 Vault·Mana·결과를 Commit에서 Exactly-once 처리한다.

## Godot 실행

```powershell
py -3 tools/run_star_runtime.py
py -3 tools/run_star_runtime.py --run --skip-setup
py -3 tools/run_star_runtime.py --editor --skip-setup
```

Main Scene은 `res://src/ui/star_circuit_harness.tscn`이다. 현재 화면은 최종 아트가 아닌 Low-fi 검증 Harness다.

## 구현 확인

- 중앙 Main·외곽5·빈 슬롯 허용.
- 숙련도·성공률·Mana Breakdown과 원인 glyph 경고.
- Mana 부족·불안정 회로·접근성 입력 상태.
- 부분 성공·불완전 실행·실패·역류 설명.
- 집중 필사 실제 시간 Mana·동일 glyph Stock+1·취소 무환불.
- Frostbloom 다중 해결과 교수 예시 비정답.

자동 PASS는 Runtime 계약 증거이며 실제 기기·사람·Full Slice 증거가 아니다.
