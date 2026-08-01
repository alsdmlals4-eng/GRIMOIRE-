# GRIMOIRE Decision Log Addendum — 2026-07-31R

## 문서 상태

- 상태: `ACTIVE_LATEST_USER_DECISION_AUTHORITY`
- 결정일: 2026-07-31
- 선행 Addendum: `DECISION_LOG_ADDENDUM_2026-07-31Q.md`
- 근거: 사용자의 주요 변경·승인 내용 즉시 기획 정본 동기화 지시

## GM-CANON-SYNC-01 — 기획 정본·계획 데이터·Google Sheet 즉시 동기화

상태: `APPROVED_PROJECT_WORK_PRINCIPLE`

주요 변경사항과 승인된 내용은 같은 작업 단위에서 다음을 수행한다.

1. Decision ID를 확정한다.
2. GitHub 권위 문서와 연결된 계획 데이터를 찾는다.
3. 작업 브랜치에 반영하고 authority commit을 생성한다.
4. 연결된 Google Sheet 탭·행을 같은 Decision ID로 반영한다.
5. GitHub와 Sheet를 재조회한다.
6. 변경 경로·커밋·Sheet 범위·동기화 상태를 남긴다.

```text
SYNCED_TO_WORKING_BRANCH
= 작업 브랜치 authority commit과 Sheet가 일치

SYNCED_TO_MAIN
= PR 병합 후 main SHA와 Sheet가 다시 일치
```

작업 브랜치 반영을 main 병합으로 오인하지 않는다.

## 기존 정책 대체

다음 기존 규칙은 `SUPERSEDED`다.

> 관련 PR 병합 전에는 Google Sheet를 수정하지 않는다.

다음 규칙으로 대체한다.

> 승인된 주요 변경은 작업 브랜치와 Sheet에 즉시 동기화한다. 병합 전에는 `SYNCED_TO_WORKING_BRANCH`, 병합 후 main 재검증이 끝난 경우에만 `SYNCED_TO_MAIN`으로 표기한다.

Sheet 단독 수정이나 미승인 후보는 정본 승격 대상이 아니다.

## GR-SYNC-20260731-04 — 직전 승인 기획 소급 동기화

상태: `SYNCED_TO_WORKING_BRANCH`

포함 Decision ID:

- `GM-PLANNING-APPROVAL-01`
- `GM-BENCHMARK-FIRST-01`
- `GM-WRITING-FREQUENCY-01`
- `GM-GRIMOIRE-RECORD-01`
- `GM-PLANNING-GATES-01`
- `GM-CANON-SYNC-01`

추적 정보:

- 작업 브랜치: `agent/grimoire-v93-canon`
- PR: `#22`
- authority commit: `fa82c4c4cebe1232f0ff809ff4321ebacefb3731`
- Sync State 승격 commit: `23c33be138bf530c4bcee4dbca3c3233dae34d7c`
- 검증 영수증: `docs/planning/sync/GR-SYNC-20260731-04.md`
- 영수증 commit: `46141385621ff77ea728dc23c2cd912ca3f3b89d`
- Sheet 반영: 18개 탭
- Sheet 재조회: `READBACK_PASS`
- main 동기화: `PENDING_PR_MERGE`

GitHub 대상:

- `AGENTS.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- `docs/planning/CANON_SYNC_STATE.json`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`
- `docs/DOCUMENTATION_MAP.md`
- `docs/planning/sync/GR-SYNC-20260731-04.md`

Sheet 대상:

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `04_누락_충돌_감사`
- `05_GDD_요약`
- `10_제품방향`
- `13_주요인물`
- `15_조작_게임규칙`
- `20_코어경험_데모목표`
- `30_데모범위_품질기준_제작기반`
- `40_핵심시스템_메인콘텐츠`
- `41_성장_경제`
- `50_메인콘텐츠`
- `51_미니게임`
- `52_글쓰기_서사`
- `60_UX_UI_접근성`
- `80_데모_버티컬슬라이스_플레이테스트`
- `99_변경이력`

## 변경 보고 의무

주요 변경의 완료 보고에는 반드시 다음을 적는다.

- Decision ID
- GitHub 변경 경로
- authority commit SHA
- sync verification commit SHA
- Google Sheet 탭·범위
- `SYNCED_TO_WORKING_BRANCH` 또는 `SYNCED_TO_MAIN`
- 남은 미검증·후행 작업

## 현재 제품 상태

- 기획 완료: `TRUE`
- 다음 제품 Gate: `ART-STYLE-01`
- Codex: `BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES`
- Godot 구현: `NOT_STARTED`
- 런타임·PC 입력·모바일·사람 검증: `NOT_RUN`
