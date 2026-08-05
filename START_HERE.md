# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 최신 Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Working Sync | `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION` |
| PR | `#69 / merge authorized` |
| 제품 Godot 프로젝트 | `CREATED` |
| 제품 구현 | `STAR_RUNTIME_COMPLETION_AUTOMATED_PASS` |
| Runtime | `31 Suites / 1,137 assertions / 0 failures` |
| Sheet | `WRITE_AND_READBACK_PASS` |
| Mobile Device·Performance·A11y Device·Human | `NOT_RUN` |
| Prototype 수치 | `PLAYTEST_TUNING_REQUIRED` |

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. 별형 회로 승인·Spec·회로·마나·숙련·Stock 책임 원본
7. `docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md`
8. `docs/planning/SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md`
9. `docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md`
10. `docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md`
11. `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md`
12. `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## 핵심 흐름

```text
조사 → 의도 → FIVE_POINT_STAR → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과·대가 → 복기
```

중앙 메인 1개와 동등한 외곽 보조 0~5개를 사용한다. Target은 회로 밖 키워드이며 자동 추천하지 않는다. Vault·같은 glyph_id Typed Stock·Mana·결과는 Commit에서 원자 처리하고 Cancel·검증 실패·중복 Commit은 추가 소비하지 않는다.

## 바로 테스트

Windows 저장소 루트:

```powershell
py -3 tools/run_star_runtime.py
py -3 tools/run_star_runtime.py --run --skip-setup
py -3 tools/run_star_runtime.py --editor --skip-setup
```

F5/F6 및 직접 Run의 Main Scene은 `res://src/ui/star_circuit_harness.tscn`이다.

## 구현 확인 항목

- 중앙 Main·외곽 5·빈 보조 슬롯.
- 숙련도·성공률·Mana Breakdown과 원인 글자 경고.
- Mana 부족·불안정 회로·접근성 입력 상태.
- 회로 Preview 이후 Target Keyword, 이후 최종 Preview와 Commit.
- Typed Stock의 glyph_id 격리.
- 부분 성공·불완전 실행·실패·역류의 설명 가능한 결과.
- 집중 필사의 실제 시간 Mana·동일 글자 Stock+1·취소 무환불.
- Frostbloom의 다중 해결과 교수 예시 비정답.

자동 PASS는 Low-fi Runtime 계약 증거다. 실제 Touch·Stylus·기기 성능·Screen Reader·사람 핵심 재미·Full Slice는 검증되지 않았다.
