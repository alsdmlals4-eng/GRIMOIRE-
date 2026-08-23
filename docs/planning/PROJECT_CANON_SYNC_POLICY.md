# GRIMOIRE 프로젝트 정본 동기화 정책

## 1. 문서 상태

```yaml
status: ACTIVE_PROJECT_WORK_PRINCIPLE
policy_id: GM-CANON-SYNC-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
effective_date: 2026-08-21
sync_update: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
human_facing_canon: NOTION_HUMAN_FACING_CANON
repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: GOOGLE_SHEETS_MIGRATION_ONLY_UNTIL_REMOVAL
```

## 2. 권위 분리

GRIMOIRE는 한 도구가 모든 정보를 소유하지 않는다.

- **Notion** — 사람이 확인·수정하는 Project Home, 전체 방향, Visual/Asset/Flow, 핵심 시스템의 사람용 설명과 작업 상태를 소유한다.
- **GitHub repository** — Markdown spec, JSON/game data, code, Scene, Resource, test, tracked asset, runtime evidence를 소유한다.
- **Runtime evidence** — 실제 동작·테스트·기기·성능·Human 검증 주장의 최종 근거다.
- **Google Sheets** — `MIGRATION_ONLY_UNTIL_REMOVAL`. 신규 기획·승인·상태의 입력면이나 정본으로 사용하지 않는다.

Notion의 설명이 구조화 데이터·코드·Scene·Resource·Test·Runtime 의미를 바꾸면 repository를 먼저 동기화한 후 구현한다. Repository의 구현 사실이 사람용 상태를 바꾸면 병합된 main readback 뒤 Notion에 같은 사실을 반영한다.

## 3. 현재 기본 흐름

```text
사용자 승인 또는 검증된 상태 변화
→ Decision/Sync ID 유지 또는 확정
→ 해당 domain owner 갱신
→ GitHub 작업 브랜치/PR
→ exact-head test + adversarial review
→ merge
→ merged-main readback
→ Notion bounded update
→ Notion destination readback
→ SYNCED_TO_MAIN_AND_NOTION_READBACK
```

진행 중 PR은 main 완료 상태가 아니다. Notion은 진행 중 작업을 표시할 수 있지만 반드시 `DRAFT/UNMERGED/IN_PROGRESS` 경계를 함께 기록한다.

## 4. 필수 발동 조건

다음이 승인되거나 의미 있게 바뀌면 관련 owner를 같은 작업 단위에서 동기화한다.

- 프로젝트 코어·플레이어 약속·비타협 원칙
- 핵심 시스템·규칙·자원·성장·실패 구조
- Vertical Slice·세션·전투·자유일정 등 콘텐츠 구조
- 주요 인물·세계관·서사·결과 구조
- 화면 전환·입력·오류 복구·정보 위계·접근성
- 플랫폼·엔진·제작량·출시 범위
- Gate·실행 권한·구현 상태
- Art Style·Art Bible·Asset Specification·Audio Direction
- 기존 정본을 대체하거나 `SUPERSEDED` 처리하는 결정

## 5. 비발동 조건

설계 의미가 바뀌지 않는 오탈자·문장 정리·링크/SHA 단순 정정·동일 검증 재실행은 전체 동기화 번들을 요구하지 않는다. 다만 정본 간 실제 충돌을 발견하면 별도 감사 또는 교정 work unit으로 기록한다.

## 6. GitHub 반영 위치

변경 성격에 따라 필요한 현재 owner만 갱신한다.

1. 해당 분야 단일 책임 정본
2. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `START_HERE.md`
5. `AGENTS.md` — 프로젝트 전역 작업 규칙이 바뀔 때
6. `docs/DEVELOPMENT_GATES.md` — Gate·권한·순서가 바뀔 때
7. `docs/DESIGN_DOCUMENT_REGISTRY.json` 또는 구조화 데이터
8. `skills/PROJECT_BASE_ADAPTER.json`과 생성 뷰 — 작업 라우팅/실제 상태가 바뀔 때
9. Sync receipt — 중요한 상태 전환일 때

과거 sync receipt나 superseded 문서는 provenance로 보존하고 현재 문서처럼 재작성하지 않는다.

## 7. Notion 반영 위치

사람용 의미가 바뀌면 최소한 다음을 검토한다.

- Project Home — 제품 약속, 현재 단계, Implementation Reality Gate, 다음 blocker
- Work Master — 진행 작업, 완료 기준, 검증 증거, PR/merged-main 상태
- Core System Master — 사람에게 중요한 시스템 의미·의존성·상태
- Visual/Asset/Flow 작업면 — 해당 변경이 실제로 그 domain을 건드릴 때만

모든 write는 목적 레코드만 bounded update하고, 변경 직전 `Revision / Last Edited`를 확인할 수 있는 경우 stale read를 fail-closed 처리한다. 쓰기 뒤 Project/Record Key/Revision/변경 필드를 재조회한다.

## 8. Google Sheets retirement

`GOOGLE_SHEETS_MIGRATION_ONLY_UNTIL_REMOVAL`

기존 Workbook과 역사 sync receipt는 바로 삭제하지 않는다.

```text
legacy Sheet inventory
→ UNIQUE / DUPLICATE / OBSOLETE
→ UNIQUE human meaning → Notion
→ UNIQUE structured/runtime meaning → repository
→ destination readback
→ active consumer/reference count = 0 확인
→ active routing/test 제거
→ archive/trash/delete 별도 결정
```

현재는 고유 자료 전수 흡수 여부를 재검증하지 않았으므로 `BLOCKED_UNVERIFIED_UNIQUE_MATERIAL`이다. 따라서 **새 Sheet 정본 write는 금지하지만 역사 자료 삭제도 금지**한다.

## 9. 동기화 상태

| 상태 | 의미 |
|---|---|
| `WORKING_BRANCH_ONLY` | GitHub 작업 브랜치에만 존재 |
| `PR_IN_PROGRESS` | 원격 PR 진행 중, main 미병합 |
| `MAIN_READBACK_PENDING` | 병합됐지만 main 재조회 전 |
| `NOTION_READBACK_PENDING` | main은 확인됐지만 사람용 Notion 반영/재조회 전 |
| `SYNCED_TO_MAIN_AND_NOTION_READBACK` | 관련 repository main과 Notion을 모두 재조회함 |
| `CONFLICT` | domain owner끼리 현재 사실이 충돌함 |

`PR_IN_PROGRESS`를 완료나 `SYNCED`로 승격하지 않는다.

## 10. 증거 상한

문서·정적 테스트·자동 CI·Godot 자동 Runtime·Human/Device/Performance/Full Slice는 서로 다른 증거 계층이다.

자동 CI가 성공해도 실제 실행하지 않은 다음 항목은 계속 `NOT_RUN`이다.

- Human validation
- physical-device validation
- performance/thermal validation
- Full Vertical Slice validation
- store/release submission

## 11. 역사적 Sheet 동기화

2026-07~08의 `GR-SYNC-*` 문서와 `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`에 기록된 Sheet write/readback은 당시의 provenance로 유효하다. 다만 2026-08-21 이후 active project workflow의 authority는 본 정책의 Notion + repository domain split을 따른다.
