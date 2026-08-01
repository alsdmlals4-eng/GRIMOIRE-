# GR-APPROVE-BATTLE-TIME-FLOW-01 동기화 영수증

## 상태

```yaml
sync_id: GR-APPROVE-BATTLE-TIME-FLOW-01
decision_id: GM-BATTLE-TIME-FLOW-01
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
main_sync: PENDING_PR_MERGE
verified_at: 2026-08-01T09:15:00+09:00
```

## 승인 계약

```text
플레이어 판단·작성·후보 검토 중 = 적 공격 타이머 진행
마법·적 공격·보스 전환 해결 중 = 적 공격 타이머 정지
작성 보조 감속 = 선택 가능, 초기 프로토타입 목표 0.5×
```

감속 사용으로 보상·콘텐츠·기록을 제한하지 않는다.

## GitHub 변경

| 역할 | 경로 | Commit |
|---|---|---|
| QUICK 벤치마킹 | `docs/planning/benchmarks/BATTLE_TIME_FLOW_01_QUICK_BENCHMARK_2026-08-01.md` | `29f88777573cb4a99e7f8ed3411456dd429833cf` |
| 승인 책임 원본 | `docs/planning/BATTLE_TIME_FLOW_01_APPROVAL_2026-08-01.md` | `5e3baf8f1fa4487bbc4eb281828bf5e18153d5d6` |
| 상태 데이터 | `docs/planning/BATTLE_TIME_FLOW_01_STATE.json` | `4f031abea690c73c22347383cd0e3df09f18bf09` |
| 결정 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01E.md` | `f14008ec512608ffc9c73f36aed3dfc93e2508eb` |

## Google Sheet 반영 범위

- `01_작업순서!A15:J15`
- `02_현재_확정결정!A22:J22`
- `04_누락_충돌_감사!A16:H16`
- `05_GDD_요약!A16:H16`
- `12_핵심루프!A8:H8`
- `15_조작_게임규칙!A8:H8`
- `40_핵심시스템_메인콘텐츠!A13:H13`
- `60_UX_UI_접근성!A13:H13`
- `80_데모_버티컬슬라이스_플레이테스트!A10:H10`
- `99_변경이력!A16:H16`

재조회 결과 Decision ID, 시간 진행·정지 상태, 작성 보조 감속, 미검증 수치와 구현 경계가 일치한다.

## 적대적 검토

### 통과

- 작성 패널을 열어 시간을 완전히 멈추는 악용을 차단한다.
- 시스템 연출·기기 처리 시간이 적 공격 위험으로 전환되지 않는다.
- `[구현]`과 공격 타이머의 경합 순서가 결정적이다.
- 적 공격 후 작성 획·후보·조합을 유지한다.
- 감속 옵션 사용자를 불이익 처리하지 않는다.

### 후행 검증

- 공격 간격과 난이도별 변화.
- 작성 보조 최종 배율.
- 포커스·일시정지 복귀 유예 시간.
- 실제 작성 피로와 불공정감.
- Godot 상태 머신에서 동시 이벤트 0건 검증.

## 미검증 경계

- Godot 구현: `NOT_STARTED`.
- Runtime·PC Input·Human Playtest: `NOT_RUN`.
- main 반영: Draft PR #22 병합 후 재조회 필요.
