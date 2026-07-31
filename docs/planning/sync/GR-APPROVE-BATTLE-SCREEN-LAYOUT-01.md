# GR-APPROVE-BATTLE-SCREEN-LAYOUT-01 동기화 영수증

## 1. 상태

```yaml
sync_id: GR-APPROVE-BATTLE-SCREEN-LAYOUT-01
decision_id: GM-BATTLE-SCREEN-LAYOUT-01
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
main_sync: PENDING_PR_MERGE
verified_at: 2026-08-01T05:04:00+09:00
```

## 2. 사용자 승인 내용

```text
전장 상단·중앙 = 적·환경 목표만 상시 표시
좌측 하단 = 아군 얼굴 초상·상태
우측 = 직접 마법 글자·마법진 작성 영역
```

수호 소환수는 전장에 상시 배치하지 않고 상태 배지와 짧은 발동 연출로 제한한다.

## 3. GitHub 변경

| 역할 | 경로 | Commit |
|---|---|---|
| QUICK 벤치마킹 | `docs/planning/benchmarks/BATTLE_SCREEN_LAYOUT_01_QUICK_BENCHMARK_2026-08-01.md` | `d40d932fa004f0298512b5e64014a182095cbabf` |
| 승인 책임 원본 | `docs/planning/BATTLE_SCREEN_LAYOUT_01_APPROVAL_2026-08-01.md` | `73829e0d7b0937d7aac88db5545a41a6f549669a` |
| 상태 데이터 | `docs/planning/BATTLE_SCREEN_LAYOUT_01_STATE.json` | `2e889bd45e9cf3beee53e40d1db5b2f3df284ea0` |
| 결정 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01B.md` | `630224bd0a22a6e9c975ef3db78b2ed8ab54b625` |
| Art Bible 상태 연결 | `docs/planning/ART_BIBLE_01_STATE.json` | `dd5847383f0d34846587d892c754203c903f4be5` |

## 4. Google Sheet 반영 범위

- `01_작업순서!A12:J12`
- `02_현재_확정결정!A19:J19`
- `04_누락_충돌_감사!A13:H13`
- `05_GDD_요약!A13:H13`
- `40_핵심시스템_메인콘텐츠!A10:H10`
- `60_UX_UI_접근성!A10:H10`
- `70_아트_오디오_에셋!A9:H9`
- `80_데모_버티컬슬라이스_플레이테스트!A7:H7`
- `99_변경이력!A13:H13`

재조회 결과 각 범위에 동일한 Decision ID·레이아웃 계약·후행 미정 범위가 저장되어 있음을 확인했다.

## 5. 충돌·보완 상태

### 양립

- 별도 고정 3/4 전술 전투장.
- 우측 작성 Overlay.
- 결과 후 원래 필드 복귀.
- PC 우선·Mobile 후속.

### 교정 필요

`ART_BIBLE_01_DRAFT_2026-08-01.md`의 다음 문장은 최종본 작성 시 교정한다.

```text
주인공·적·수호 소환수·환경 목표가 동시에 식별 가능
```

새 계약에서는 전장 상시 배우가 적·환경 목표로 제한되고, 아군·수호 상태는 초상·배지·짧은 연출로 표현된다.

## 6. 미검증 경계

- Art Bible 상세 최종 승인: `PENDING`.
- 작성 패널 개폐 방식: `USER_DECISION_REQUIRED`.
- 정확한 패널 비율·초상 수·상태 필드: `BATTLE-UX-01 / ASSET-SPEC-01`.
- Godot 구현: `NOT_STARTED`.
- Runtime·PC Input·Human Playtest: `NOT_RUN`.
- main 반영: Draft PR #22 병합 후 재검증.
