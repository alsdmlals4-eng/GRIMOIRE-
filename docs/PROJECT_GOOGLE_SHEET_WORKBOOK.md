# GRIMOIRE 프로젝트 Google Sheets Workbook

```yaml
project: GRIMOIRE: 세계를 다시 쓰는 법
sheet_status: PROJECT_SHEET_CONFIGURED
spreadsheet_url: https://docs.google.com/spreadsheets/d/19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM/edit
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: PROPOSED_SHEET_CHANGE
base_commit: c987647d01ad2baa028a16e03d85ddfc1572a727
last_verified_at: 2026-07-29
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
| Vertical Slice | Gate 1 승인 정본과 Gate 2 시각·전투·소환수 문서 |
| 미니게임·서사 | `51_미니게임`, `52_글쓰기_서사`와 Situation Challenge 정본 |
| 아트·이미지 | `ART-STYLE-01`, `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md` |
| 구현 상태 | `IMPLEMENTATION_NOT_STARTED`; 실제 인식 알고리즘 미선택 |

## 동기화 규칙

- GitHub 정본에 없는 사용자 수정은 `PROPOSED_SHEET_CHANGE`로 보존한다.
- 승인된 변경은 GitHub 책임 원본과 Sheet에 반영한 뒤 양쪽을 재조회한다.
- 생성 이미지나 simulated 후보는 실제 인식 정확도·지연·런타임 증거가 아니다.
- `SYNCED`는 GitHub와 Sheet의 값·상태·책임 경로가 모두 일치할 때만 사용한다.
