# GM-PREMERGE-ADVERSARIAL-GATE-01 — 병합 직전 전수 점검 체크리스트

## 1. 상태

```yaml
gate_id: GM-PREMERGE-ADVERSARIAL-GATE-01
status: MANDATORY_BEFORE_EVERY_MERGE
parent_decision: GM-GRILL-MERGE-CADENCE-01
applies_to: 모든 승인 기획·정본·main sync PR
failure_behavior: DO_NOT_MERGE
```

이 체크리스트는 PR을 병합하기 직전에 실행한다. 이전 단계에서 CI나 Readback을 통과했더라도 최신 HEAD·main·Sheet를 다시 확인한다.

## 2. Phase 0 — Scope Freeze

- [ ] Batch ID 또는 Sync ID가 있다.
- [ ] 포함 Decision ID 목록이 고정됐다.
- [ ] 각 Decision의 사용자 승인 근거가 있다.
- [ ] 승인되지 않은 후보·시험값·브레인스토밍이 포함되지 않았다.
- [ ] 제품 구현 권한·잠긴 Asset 변경 여부를 명시했다.
- [ ] `GRILL_ME_BATCH_MERGE_STATE.json`의 카운터·pending 목록이 실제 범위와 같다.

산출물:

```text
BATCH_SCOPE = FROZEN
or
BATCH_SCOPE = BLOCKED
```

## 3. Phase 1 — GitHub 상세 감사

### Repository·main

- [ ] 저장소가 `alsdmlals4-eng/GRIMOIRE-`인지 확인.
- [ ] default branch가 `main`인지 확인.
- [ ] 최신 main SHA를 재조회.
- [ ] 작업 브랜치 merge-base와 behind/ahead 상태 확인.
- [ ] 같은 목적의 열린·stale·중복 PR 검색.
- [ ] 과거 승인됐지만 미병합된 PR 검색.

### Changed Files

- [ ] 변경 파일 전체 목록 확인.
- [ ] 각 파일이 승인 범위에 필요한지 설명 가능.
- [ ] 제품 코드·Scene·Script·Resource·게임 데이터 침범 없음.
- [ ] 잠긴 기준 이미지·Asset 원본 변경 없음.
- [ ] 생성물 직접 편집 없음.
- [ ] 삭제·이름 변경·권위 경로 이동이 Registry와 Map에 반영됨.

### Canon·Routing

- [ ] Decision ID가 권위 문서·Current Decisions·Sheet에 동일.
- [ ] 책임 원본 경로가 실제 존재.
- [ ] `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`가 새 작업을 잘 복원.
- [ ] `docs/DEVELOPMENT_GATES.md`의 현재 Gate·권한과 충돌 없음.
- [ ] `docs/DESIGN_DOCUMENT_REGISTRY.json` 경로·상태 유효.
- [ ] `skills/PROJECT_BASE_ADAPTER.json`과 생성 Snapshot drift 없음.
- [ ] `tools/generate_project_operating_views.py --check` PASS.
- [ ] 모든 변경 JSON parse PASS.

### Stale·Placeholder Search

- [ ] `TODO`, `TBD`, `FIXME`, `PLACEHOLDER`, `PENDING_USER_DECISION` 검색.
- [ ] 구형 Base 버전·PC-first·이전 Gate·SUPERSEDED Decision 재활성화 없음.
- [ ] working branch SHA를 main SHA로 표기한 곳 없음.
- [ ] `SYNCED_TO_MAIN` 조기 표기 없음.

## 4. Phase 2 — Google Sheet 상세 감사

### 필수 탭

- [ ] `00_프로젝트_허브`: Stage·Gate·GitHub·다음 Bundle.
- [ ] `01_작업순서`: 순서·선행 조건·BLOCKS·승인 상태.
- [ ] `02_현재_확정결정`: Decision ID·결정·분류·책임 원본·commit.
- [ ] 각 Decision의 실제 도메인 탭.
- [ ] `04_누락_충돌_감사`: 미해결·미검증·부분 동기화.
- [ ] `99_변경이력`: Sync ID·PR·GitHub SHA·Sheet 범위·Readback.

### 값 검증

- [ ] GitHub 권위 문구와 Sheet 최종 결정 문구가 의미상 동일.
- [ ] Decision ID 오탈자·중복·누락 없음.
- [ ] 책임 원본 경로가 GitHub 실제 파일과 일치.
- [ ] 작업 브랜치 상태와 main 상태가 구분됨.
- [ ] `NOT_RUN`, `TEST_VALUE`, `PLAYTEST_TUNING_REQUIRED` 경계 유지.
- [ ] 이전 행을 덮어써 역사 기록을 잃지 않음.
- [ ] 쓰기 후 대상 범위를 다시 읽어 정확한 값 확인.

## 5. Phase 3 — GitHub ↔ Sheet 교차 대조

Decision별로 다음 표를 작성한다.

| Decision ID | GitHub Authority | GitHub 상태 | Sheet 행 | Sheet 상태 | 판정 |
|---|---|---|---|---|---|
| 예시 | path | SYNCED_TO_WORKING_BRANCH | 02!A:J | 동일 | PASS |

필수 판정:

- [ ] Decision 값 일치.
- [ ] 책임 경로 일치.
- [ ] authority commit 일치.
- [ ] Sync ID 일치.
- [ ] 다음 Gate·작업 순서 일치.
- [ ] 미검증 상태 일치.

하나라도 다르면 `SYNC_CONFLICT`이며 병합 금지다.

## 6. Phase 4 — PR 체크

- [ ] PR 제목이 실제 범위를 설명.
- [ ] PR 본문에 Decision ID·Sync ID·경로·Sheet 범위 포함.
- [ ] base가 최신 `main`.
- [ ] head SHA가 최종 검증 SHA와 동일.
- [ ] mergeable 확인.
- [ ] CI Gate PASS.
- [ ] Adversarial Gate PASS.
- [ ] review thread 0 또는 전부 해결.
- [ ] requested changes 없음.
- [ ] changed file count와 감사 목록 일치.
- [ ] PR diff에 범위 밖 변경 없음.

## 7. Phase 5 — 적대적 검토 루프

다음 공격 질문에 답한다.

1. 이 결정이 기존 승인 코어·플랫폼·Gate를 조용히 약화하는가?
2. 같은 개념을 다른 이름으로 중복 확정했는가?
3. Sheet와 GitHub 중 한쪽에만 중요한 조건이 있는가?
4. 시험값을 확정값처럼 보이게 하는 문구가 있는가?
5. 미실행 검증을 PASS로 오인할 여지가 있는가?
6. 다음 작업자가 구형 문서를 먼저 읽어 잘못 복원할 가능성이 있는가?
7. PR 병합 후 main에서 깨지는 상대경로·Registry·Generator가 있는가?
8. 사용자 승인 범위 밖 추가 결정을 몰래 포함했는가?
9. 되돌리기 어려운 범위·제작량·지원 약속을 과도하게 넓혔는가?
10. 병합을 미루거나 분리해야 더 안전한 P0/P1 문제가 남았는가?

판정:

```text
PASS
PASS_WITH_DECLARED_P2_P3
BLOCK_P0_P1
SYNC_CONFLICT
CI_FAILED
REVIEW_BLOCKED
```

`PASS` 또는 선언된 비차단 P2/P3만 병합할 수 있다.

## 8. Phase 6 — Merge

- [ ] 사용자 승인 또는 `GM-GRILL-MERGE-CADENCE-01` Trigger 충족.
- [ ] 최종 HEAD를 expected SHA로 잠금.
- [ ] 기본은 squash merge.
- [ ] merge result의 main SHA 기록.
- [ ] PR merged 상태 재조회.

## 9. Phase 7 — 병합 후 재검증

- [ ] main에서 변경 파일 재조회.
- [ ] main SHA를 Sheet에 기록.
- [ ] Sheet를 다시 읽어 `MAIN_SHEET_READBACK_PASS` 확인.
- [ ] cold-start·Active Context·Current Decisions가 main 상태 복원.
- [ ] 필요 시 main-sync PR 생성·검증·병합.
- [ ] 최종 cold-start main SHA를 Sheet에 기록.
- [ ] `SYNCED_TO_MAIN` 승격.
- [ ] Batch counter Reset.
- [ ] 다음 작업과 남은 `NOT_RUN` 보고.

## 10. 병합 금지 요약

다음 중 하나라도 있으면 즉시 중단한다.

```text
P0/P1 unresolved
GitHub-Sheet mismatch
CI or adversarial failure
merge conflict
unresolved review
missing authority path
failed Sheet readback
scope creep into protected product files
false completion claim
```
