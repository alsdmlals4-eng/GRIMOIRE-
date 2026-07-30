# GRIMOIRE 프로젝트 Google Sheets Workbook

```yaml
project: GRIMOIRE: 세계를 다시 쓰는 법
sheet_status: PROJECT_SHEET_CONFIGURED
spreadsheet_url: https://docs.google.com/spreadsheets/d/19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM/edit
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
working_branch_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
last_verified_at: 2026-07-31
```

Google Sheets는 마법 작성·학교 일정·전술 전투·소환수·미니게임·서사의 전체 흐름을 사용자가 확인·수정하고, AI가 GitHub 정본·실제 구현과 함께 읽는 GDD 작업면이다. Sheet 단독 값으로 승인·구현·검증 완료를 확정하지 않는다.

## 검증된 탭

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

## 프로젝트 책임 매핑

| 의미 구조 | 프로젝트 책임 원본 |
|---|---|
| 핵심루프 | 학교 일정 → 마법 작성·확인 → 의미 조합 → 상황 검증 → 세계 변화 → 마도서 기록 |
| Vertical Slice | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` |
| 기획 승인 이력 | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31Q.md`와 최신 Addendum |
| 기획 정본 동기화 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` / `docs/planning/CANON_SYNC_STATE.json` |
| 미니게임·서사 | `51_미니게임`, `52_글쓰기_서사`와 Situation Challenge 정본 |
| 아트·이미지 | `ART-STYLE-01`, `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md` |
| 구현 상태 | `IMPLEMENTATION_NOT_STARTED`; 실제 인식 알고리즘 미선택 |

## 즉시 동기화 규칙

결정 ID: `GM-CANON-SYNC-01`

- 주요 변경사항과 승인 결정은 GitHub 권위 문서·계획 데이터와 Sheet에 같은 Decision ID로 반영한다.
- GitHub 작업 브랜치 authority commit을 먼저 생성한 뒤 Sheet에 해당 SHA와 경로를 기록한다.
- `02_현재_확정결정`에는 제품 Decision ID를 기록한다.
- 관련 도메인 탭에는 실제 계획 데이터를 기록한다.
- `04_누락_충돌_감사`에는 충돌·미검증·부분 동기화를 기록한다.
- `99_변경이력`에는 Sync ID, 포함 Decision ID, GitHub commit, Sheet 범위, 재검증 결과를 기록한다.
- 작업 순서나 Gate가 바뀌면 `00_프로젝트_허브`, `01_작업순서`, `05_GDD_요약`도 갱신한다.

## 상태 계약

| 상태 | 의미 |
|---|---|
| `PROPOSED_SHEET_CHANGE` | GitHub에 승인 근거가 없는 사용자·Sheet 단독 편집 |
| `GITHUB_ONLY` | GitHub 반영 성공, Sheet 반영 실패·차단 |
| `SHEET_ONLY` | Sheet 반영 성공, GitHub 반영 실패·차단 |
| `SYNCED_TO_WORKING_BRANCH` | 작업 브랜치 commit과 Sheet가 같은 Decision ID·값으로 재조회됨 |
| `SYNCED_TO_MAIN` | PR 병합 후 main SHA와 Sheet가 다시 일치함 |
| `SYNC_CONFLICT` | 양쪽 값·상태·책임 경로가 충돌함 |

`SYNCED_TO_WORKING_BRANCH`는 main 병합을 의미하지 않는다. `SYNCED_TO_MAIN`은 병합된 main과 Sheet를 모두 재조회한 뒤에만 사용한다.

## 현재 동기화 번들

Sync ID: `GR-SYNC-20260731-04`

포함 Decision ID:

- `GM-PLANNING-APPROVAL-01`
- `GM-BENCHMARK-FIRST-01`
- `GM-WRITING-FREQUENCY-01`
- `GM-GRIMOIRE-RECORD-01`
- `GM-PLANNING-GATES-01`
- `GM-CANON-SYNC-01`

## 검증 경계

- 생성 이미지나 simulated 후보는 실제 인식 정확도·지연·런타임 증거가 아니다.
- Sheet는 실제 코드·Scene·Resource·자산·테스트를 대체하지 않는다.
- 한쪽 쓰기가 실패하면 성공한 쪽을 숨기지 않고 부분 상태로 기록한다.
- 완료 보고에는 Decision ID, GitHub 변경 경로, authority commit, Sheet 범위, 동기화 상태를 포함한다.
