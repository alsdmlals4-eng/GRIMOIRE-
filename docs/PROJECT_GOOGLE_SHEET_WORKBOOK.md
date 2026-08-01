# GRIMOIRE 프로젝트 Google Sheets Workbook

```yaml
project: GRIMOIRE: 세계를 다시 쓰는 법
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
required_tabs: 27
last_full_audit: 2026-08-01
sync_status: SYNCED_TO_MAIN
authority_main_commit: a088252349bee94cecef94b216c8cc5e0b9162cb
main_readback: PASS
```

Sheet는 사용자가 기획을 확인·수정하는 작업면이다. GitHub 승인 책임 원본, 계획 JSON, 실제 구현과 함께 읽으며 Sheet 단독 값으로 승인·구현·검증 완료를 확정하지 않는다.

## 1. 필수 탭

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `03_근거_라이브러리`
- `04_누락_충돌_감사`
- `05_GDD_요약`
- `10_제품방향`
- `11_세계관`
- `12_핵심루프`
- `13_주요인물`
- `14_조연_세력_관계`
- `15_조작_게임규칙`
- `20_코어경험_데모목표`
- `30_데모범위_품질기준_제작기반`
- `40_핵심시스템_메인콘텐츠`
- `41_성장_경제`
- `50_메인콘텐츠`
- `51_미니게임`
- `52_글쓰기_서사`
- `60_UX_UI_접근성`
- `70_아트_오디오_에셋`
- `71_이미지기획_생성목록`
- `72_이미지검수_승인로그`
- `80_데모_버티컬슬라이스_플레이테스트`
- `90_본제작_출시_사업`
- `98_Base_반영후보`
- `99_변경이력`

## 2. 현재 핵심 상태

```yaml
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_screen_layout_01: APPROVED
battle_single_enemy_focus_01: APPROVED
battle_active_timer_01: APPROVED
battle_time_flow_01: APPROVED
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 3. 책임 매핑

| Sheet 의미 | GitHub 책임 원본 |
|---|---|
| 프로젝트 코어·Slice | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` |
| 현재 결정 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| 최신 승인 | `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md` |
| Art Style | `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md` |
| Art Bible | `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md` |
| 전투 승패·진정 | `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md` |
| 개발 Gate | `docs/DEVELOPMENT_GATES.md` |
| 운영 감사 | `docs/planning/PROJECT_WIDE_OPERATING_AND_DESIGN_AUDIT_2026-08-01.md` |
| Base Adapter | `skills/PROJECT_BASE_ADAPTER.json` |
| main 동기화 | `docs/planning/sync/GR-SYNC-20260801-05-MAIN.md` |

## 4. 즉시 동기화 규칙

```text
Decision ID 확정
→ GitHub Authority·State·Registry 갱신
→ Authority Commit
→ 관련 Sheet 범위 갱신
→ GitHub·Sheet Readback
→ Sync Receipt
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

필수 Sheet 위치:

- `02_현재_확정결정`.
- 관련 Domain 탭.
- `04_누락_충돌_감사`.
- `99_변경이력`.

Gate·단계 변경 시:

- `00_프로젝트_허브`.
- `01_작업순서`.
- `05_GDD_요약`.
- `10_제품방향`.
- `90_본제작_출시_사업`.

## 5. 상태 계약

| 상태 | 의미 |
|---|---|
| `PROPOSED_SHEET_CHANGE` | GitHub 승인 근거 없는 Sheet 단독 편집 |
| `GITHUB_ONLY` | GitHub 반영, Sheet 실패 |
| `SHEET_ONLY` | Sheet 반영, GitHub 실패 |
| `SYNCED_TO_WORKING_BRANCH` | 작업 브랜치 Commit과 Sheet가 같은 Decision ID·값으로 Readback 됨 |
| `SYNCED_TO_MAIN` | PR 병합 후 main Commit과 Sheet가 다시 일치 |
| `SYNC_CONFLICT` | 값·상태·책임 경로 충돌 |

## 6. 완료된 동기화

Sync Bundle: `GR-SYNC-20260801-05`.

포함:

- `GM-PROJECT-OPERATING-RECONCILIATION-01`.
- `ART-BIBLE-01`.
- `GM-BATTLE-RULES-01`.
- Base v9.3 Adapter·Snapshot·CI 정합화.
- 27개 Sheet 탭 전수 감사 교정.

증거:

- Authority PR: `#22`.
- Authority main Commit: `a088252349bee94cecef94b216c8cc5e0b9162cb`.
- CI: `ci-gate SUCCESS / adversarial-gate SUCCESS`.
- main Authority·Sheet Readback: `PASS`.
- 최종 영수증: `docs/planning/sync/GR-SYNC-20260801-05-MAIN.md`.
- 상태: `SYNCED_TO_MAIN`.

## 7. 검증 경계

- Sheet는 실제 Code·Scene·Resource·Asset·Test를 대체하지 않는다.
- 잠긴 이미지의 예시 이름·수치·파티 수는 자동 정본이 아니다.
- Prototype 수치와 사람 검증이 없는 상태는 `PLAYTEST_TUNING_REQUIRED / NOT_RUN`이다.
- 완료 보고에는 Decision ID, GitHub 경로, Commit, Sheet 범위, Readback, 남은 미검증을 포함한다.
