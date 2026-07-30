# GRIMOIRE 기획 정본 즉시 동기화 정책

## 1. 문서 상태

```yaml
status: ACTIVE_PROJECT_WORK_PRINCIPLE
policy_id: GM-CANON-SYNC-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
effective_date: 2026-07-31
github_repository: alsdmlals4-eng/GRIMOIRE-
google_sheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
```

## 2. 원칙

주요 변경사항과 사용자 승인 결정은 대화 안에만 남기지 않는다. 같은 작업 단위에서 GitHub 권위 문서·계획 데이터와 연결된 Google Sheet 위치를 찾아 **같은 Decision ID**로 반영하고, 변경 경로·커밋·Sheet 범위·동기화 상태를 기록한다.

작업 브랜치에 반영된 상태와 main에 병합된 상태는 구분한다.

```text
승인
→ Decision ID 확정
→ GitHub 권위 문서·계획 데이터 갱신
→ authority commit 생성
→ 연결된 Sheet 탭·행 갱신
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main SHA·Sheet 변경이력 재검증
→ SYNCED_TO_MAIN
```

## 3. 필수 발동 조건

다음 중 하나가 승인되거나 의미 있게 변경되면 즉시 동기화한다.

- 프로젝트 코어·플레이어 약속·비타협 원칙
- 새 시스템·핵심 규칙·자원·성장·실패 구조
- Vertical Slice·에피소드·세션·전투·자유일정 등 콘텐츠 구조
- 주요 인물·세계관·서사 진행·복선·결과 구조
- 주요 화면 전환·입력·오류 복구·정보 위계·접근성 등 UX 흐름
- 플랫폼·엔진·제작량·시간 예산·출시 범위
- Gate 승인·차단·프로필 전환·Codex 또는 구현 권한
- Art Style·Art Bible·Asset Specification·Audio Direction의 승인
- 기존 정본을 대체하거나 `SUPERSEDED` 처리하는 결정

## 4. 비발동 조건

다음은 설계 의미가 바뀌지 않으면 전체 정본 동기화 번들을 요구하지 않는다.

- 오탈자·문장 다듬기
- 링크·날짜·SHA의 단순 정정
- 승인된 구조의 반복 데이터 입력
- 결정이나 상태를 바꾸지 않는 명백한 버그 수정
- 아직 승인되지 않은 브레인스토밍·후보·연구 메모

다만 위 작업도 기존 권위 문서와 Sheet 사이의 불일치를 발견하면 감사 항목으로 기록한다.

## 5. Decision ID 규칙

- 하나의 결정은 GitHub와 Sheet에서 동일한 ID를 사용한다.
- 승인 내용을 여러 하위 계약으로 분리할 필요가 있으면 각 계약 ID를 유지하고, 동기화 작업 묶음은 별도의 Sync ID로 연결한다.
- Sheet의 `02_현재_확정결정`에는 제품 결정 ID를 기록한다.
- Sheet의 `99_변경이력`에는 Sync ID와 포함된 Decision ID를 기록한다.
- 대체 결정은 이전 ID를 삭제하지 않고 `대체 Decision` 또는 `SUPERSEDED_BY`로 연결한다.

## 6. GitHub 필수 반영 위치

결정의 성격에 따라 다음 중 필요한 위치를 같은 작업 단위에서 갱신한다.

1. `docs/planning/DECISION_LOG.md` 또는 최신 Addendum
2. 해당 분야의 단일 책임 정본
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/ACTIVE_CONTEXT.md`
5. `AGENTS.md` — 프로젝트 전역 작업 규칙일 때
6. `docs/DEVELOPMENT_GATES.md` — Gate·권한·순서가 바뀔 때
7. `docs/DESIGN_DOCUMENT_REGISTRY.json` 또는 연결된 계획 데이터
8. `docs/DOCUMENTATION_MAP.md` — 새 책임 원본이 생길 때
9. `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` — Sheet 계약·매핑이 바뀔 때

## 7. Google Sheet 필수 반영 위치

모든 승인 결정은 최소 다음 위치를 검토한다.

- `02_현재_확정결정`: Decision ID·결정·책임 원본·authority commit
- 해당 도메인 탭: 실제 계획 데이터
- `04_누락_충돌_감사`: 충돌·미검증·부분 동기화 여부
- `99_변경이력`: Sync ID·GitHub 커밋·Sheet 범위·재검증 결과

작업 순서나 현재 Gate가 바뀌면 추가로 갱신한다.

- `00_프로젝트_허브`
- `01_작업순서`
- `05_GDD_요약`

## 8. 동기화 상태

| 상태 | 의미 |
|---|---|
| `SYNC_PENDING` | 승인됐지만 양쪽 반영이 시작되지 않음 |
| `GITHUB_ONLY` | GitHub 반영 성공, Sheet 실패·차단 |
| `SHEET_ONLY` | Sheet 반영 성공, GitHub 실패·차단 |
| `SYNCED_TO_WORKING_BRANCH` | 작업 브랜치 authority commit과 Sheet가 같은 Decision ID·값으로 재조회됨 |
| `SYNCED_TO_MAIN` | PR 병합 후 main SHA와 Sheet가 다시 일치함 |
| `SYNC_CONFLICT` | 양쪽 값·상태·책임 경로가 충돌함 |

`SYNCED_TO_WORKING_BRANCH`는 main 병합을 의미하지 않는다. `SYNCED_TO_MAIN`은 병합된 main과 Sheet를 모두 재조회한 뒤에만 사용한다.

## 9. 실패 처리

- 한쪽 쓰기가 실패하면 성공한 쪽을 롤백해 숨기지 않는다.
- `GITHUB_ONLY` 또는 `SHEET_ONLY`로 기록하고 실패 위치·원인·다음 복구 작업을 남긴다.
- 충돌 상태에서 완료·승인·검증 완료를 주장하지 않는다.
- Sheet 단독 값은 GitHub 권위 결정을 대체하지 않는다.
- 작업 브랜치 커밋을 main commit으로 표기하지 않는다.

## 10. 완료 보고 형식

주요 변경 작업의 최종 보고에는 다음을 포함한다.

```text
Decision ID
→ 승인·변경 요약
→ GitHub 변경 경로
→ authority commit SHA
→ sync verification commit SHA(있는 경우)
→ Google Sheet 탭·범위
→ 동기화 상태
→ 미검증·후행 항목
```

## 11. 현재 초기 동기화 번들

Sync ID: `GR-SYNC-20260731-04`

포함 Decision ID:

- `GM-PLANNING-APPROVAL-01`
- `GM-BENCHMARK-FIRST-01`
- `GM-WRITING-FREQUENCY-01`
- `GM-GRIMOIRE-RECORD-01`
- `GM-PLANNING-GATES-01`
- `GM-CANON-SYNC-01`

이 번들은 직전 승인 기획을 Sheet에 소급 반영하고, 이후 승인부터 본 정책을 기본 절차로 적용한다.
