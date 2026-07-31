# GR-APPROVE-BATTLE-ACTIVE-TIMER-01 동기화 영수증

## 상태

```yaml
sync_id: GR-APPROVE-BATTLE-ACTIVE-TIMER-01
decision_id: GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
main_sync: PENDING_PR_MERGE
verified_at: 2026-08-01T05:26:00+09:00
```

## 승인 계약

```text
적 = 일정 시간마다 공격
플레이어 = 마법 작성 후 [구현]
조건 = 유효 마법 + 충분한 마나
결과 = 즉시 시전
일반 전투 = 단일 페이즈
보스 전투 = 다중 페이즈 허용
```

일반 적의 방어·충전·지원 행동은 승인하지 않았으며, 보스 페이즈별 공격 패턴은 후행 설계한다.

## GitHub 변경

| 역할 | 경로 | Commit |
|---|---|---|
| QUICK 벤치마킹 | `docs/planning/benchmarks/BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_QUICK_BENCHMARK_2026-08-01.md` | `c06cee963e602be700436a2b70a1fd158656ae9f` |
| 승인 책임 원본 | `docs/planning/BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_APPROVAL_2026-08-01.md` | `1e5bf6d8336f3861d9d5fabeac7c5dd5473547ee` |
| 상태 데이터 | `docs/planning/BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_STATE.json` | `711f0f32da5c5cd44abe758e309c8512cb01e356` |
| 결정 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01D.md` | `9bb62e46bc2ab824c43805b0e5d51d0e8f5bf6b8` |

## Google Sheet 범위

- `01_작업순서!A14:J14`
- `02_현재_확정결정!A21:J21`
- `04_누락_충돌_감사!A15:H15`
- `05_GDD_요약!A15:H15`
- `12_핵심루프!A7:H7`
- `15_조작_게임규칙!A7:H7`
- `40_핵심시스템_메인콘텐츠!A12:H12`
- `60_UX_UI_접근성!A12:H12`
- `80_데모_버티컬슬라이스_플레이테스트!A9:H9`
- `99_변경이력!A15:H15`

재조회 결과 Decision ID, 적의 주기 공격, 일반/보스 페이즈 구분, 마나 부족 복구와 미검증 경계가 일치한다.

## 적대적 검토

### 통과

- 단일 강적·적 중심 전장과 양립.
- 우측 축소형→확장형 작성 패널과 양립.
- `[구현]` 즉시 시전으로 직접 작성의 결과 연결이 짧음.
- 일반 적 페이즈 증식을 막아 Slice 범위를 보호.

### 후행 결정 필요

- 작성 중 적 공격 타이머가 계속 진행되는가, 감속되는가, 정지하는가.
- 적 공격 간격과 난이도별 변화.
- 피해·방어·상태·승리·패배 규칙.
- 보스 페이즈 전환 시 정확한 유지·회복·공격 패턴.

## 미검증 경계

- Godot 구현: `NOT_STARTED`.
- Runtime·PC Input·Human Playtest: `NOT_RUN`.
- main 반영: Draft PR #22 병합 후 재조회 필요.
