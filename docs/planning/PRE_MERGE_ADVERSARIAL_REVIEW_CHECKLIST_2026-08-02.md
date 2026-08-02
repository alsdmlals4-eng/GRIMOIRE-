# GM-PREMERGE-ADVERSARIAL-GATE-01 — 병합 직전 전수 점검 체크리스트

## 1. 상태

```yaml
gate_id: GM-PREMERGE-ADVERSARIAL-GATE-01
status: MANDATORY_BEFORE_EVERY_MERGE
parent_decisions:
  - GM-GRILL-MERGE-CADENCE-01
  - GM-GRILL-WORK-QUALITY-GATE-01
applies_to: 모든 승인 기획·정본·운영·main sync PR
failure_behavior: DO_NOT_MERGE
```

이 체크리스트는 최신 PR HEAD·main·Sheet를 기준으로 실행한다. 이전 CI·Readback 결과는 최신 HEAD 검증을 대체하지 않는다.

## 2. Phase 0 — Scope Freeze

- [ ] Batch ID 또는 Sync ID가 있다.
- [ ] 포함 Decision ID 목록이 고정됐다.
- [ ] 각 Decision의 사용자 승인 근거가 있다.
- [ ] 승인되지 않은 후보·시험값·브레인스토밍이 포함되지 않았다.
- [ ] 제품 구현 권한·잠긴 Asset 변경 여부를 명시했다.
- [ ] `GRILL_ME_BATCH_MERGE_STATE.json`의 카운터·pending 목록이 실제 범위와 같다.

```text
BATCH_SCOPE = FROZEN
or
BATCH_SCOPE = BLOCKED
```

## 3. Phase 1 — Benchmark·현업 비교 Gate

실질 설계·작업 Decision마다 확인한다.

- [ ] 결정 질문이 한 문장으로 정의됐다.
- [ ] QUICK/STANDARD/DEEP 규모가 기록됐다.
- [ ] 직접 사례 2개 이상 또는 규모에 맞는 사례 수가 있다.
- [ ] 인접 사례·현업·표준 근거가 최소 1개 있다.
- [ ] 공식·1차 자료를 우선했다.
- [ ] `ADOPT / ADAPT / REJECT`가 기록됐다.
- [ ] 현업 제작·QA·Mobile·접근성·운영 비용 비교가 있다.
- [ ] 권장하지 않은 대안과 이유가 있다.
- [ ] 다른 작품의 고유 설계를 복제하지 않았다.

단순 동기화라면:

```yaml
benchmark_applicability: N/A_NO_DESIGN_CHANGE
```

벤치마킹 누락은 `BENCHMARK_GATE_FAILED`다.

## 4. Phase 2 — GitHub 상세 감사

### Repository·main

- [ ] 저장소가 `alsdmlals4-eng/GRIMOIRE-`인지 확인.
- [ ] default branch가 `main`인지 확인.
- [ ] 최신 main SHA를 재조회.
- [ ] 작업 브랜치 merge-base와 behind/ahead 확인.
- [ ] 같은 목적의 열린·stale·중복 PR 검색.
- [ ] 과거 승인됐지만 미병합된 PR 검색.

### Changed Files

- [ ] 변경 파일 전체 목록 확인.
- [ ] 각 파일이 승인 범위에 필요한지 설명 가능.
- [ ] 제품 코드·Scene·Script·Resource·게임 데이터 침범 여부 확인.
- [ ] 잠긴 기준 이미지·Asset 원본 변경 없음.
- [ ] 생성물 직접 편집 없음.
- [ ] 삭제·이름 변경·권위 경로 이동이 Registry에 반영됨.

### Canon·Routing

- [ ] Decision ID가 권위 문서·cold-start·Sheet에 동일.
- [ ] 책임 원본 경로가 실제 존재.
- [ ] `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`가 새 작업을 복원.
- [ ] `docs/DEVELOPMENT_GATES.md`와 충돌 없음.
- [ ] `docs/DESIGN_DOCUMENT_REGISTRY.json` 경로·상태 유효.
- [ ] Adapter·생성 Snapshot drift 없음.
- [ ] `tools/generate_project_operating_views.py --check` PASS.
- [ ] 모든 변경 JSON parse PASS.

### Stale·Placeholder

- [ ] `TODO`, `TBD`, `FIXME`, `PLACEHOLDER`, `PENDING_USER_DECISION` 검색.
- [ ] 구형 Base·PC-first·이전 Gate·SUPERSEDED Decision 재활성화 없음.
- [ ] working branch SHA를 main SHA로 표기한 곳 없음.
- [ ] `SYNCED_TO_MAIN` 조기 표기 없음.

## 5. Phase 3 — Text Integrity Gate

대상:

- `.md`, `.json`, `.yml`, `.yaml`, `.py`, `.gd`, `.tscn`, `.tres`, `.txt`, `.csv`.

필수 자동 검사:

- [ ] 모든 대상 파일 UTF-8 strict decode PASS.
- [ ] UTF-8 BOM 0건.
- [ ] Unicode NFC PASS.
- [ ] replacement character `U+FFFD` 0건.
- [ ] 허용되지 않은 C0 제어문자 0건.
- [ ] 알려진 mojibake 패턴 0건.
- [ ] JSON parse PASS.

알려진 의심 패턴:

```text
Ã
Â
â€
ðŸ
ï»¿
한글 문맥의 비정상 ì/í/ë/ê 연속 토큰
```

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

- [ ] GitHub 재조회에서 sentinel 정상.
- [ ] Sheet 재조회에서 해당되는 sentinel 정상.
- [ ] 자동 검출 경고가 있으면 원문과 사람이 대조.

깨진 문자를 추측으로 자동 복원하지 않는다. 실패 시 `TEXT_INTEGRITY_FAILED`다.

## 6. Phase 4 — Google Sheet 상세 감사

### 필수 탭

- [ ] `00_프로젝트_허브`.
- [ ] `01_작업순서`.
- [ ] `02_현재_확정결정`.
- [ ] 각 Decision 도메인 탭.
- [ ] `04_누락_충돌_감사`.
- [ ] `99_변경이력`.

### 값 검증

- [ ] GitHub 권위 문구와 Sheet 결정 문구가 의미상 동일.
- [ ] Decision ID 오탈자·중복·누락 없음.
- [ ] 책임 원본 경로가 실제 파일과 일치.
- [ ] working branch와 main 상태 구분.
- [ ] `NOT_RUN`, `TEST_VALUE`, `PLAYTEST_TUNING_REQUIRED` 유지.
- [ ] 역사 행을 파괴하지 않음.
- [ ] 쓰기 후 대상 범위 Readback.
- [ ] 한글·특수기호·대괄호 스탯 표기 깨짐 없음.

## 7. Phase 5 — GitHub ↔ Sheet 교차 대조

| Decision ID | GitHub Authority | GitHub 상태 | Sheet 행 | Sheet 상태 | 판정 |
|---|---|---|---|---|---|

필수:

- [ ] Decision 값 일치.
- [ ] 책임 경로 일치.
- [ ] Sync ID 일치.
- [ ] 다음 Gate·작업 순서 일치.
- [ ] 미검증 상태 일치.
- [ ] UTF-8·sentinel Readback 일치.

하나라도 다르면 `SYNC_CONFLICT`다.

## 8. Phase 6 — PR 체크

- [ ] PR 제목이 실제 범위를 설명.
- [ ] PR 본문에 Decision·Benchmark·Sync ID·Sheet 범위 포함.
- [ ] base가 최신 `main`.
- [ ] head SHA가 최종 검증 SHA와 동일.
- [ ] mergeable 확인.
- [ ] CI Gate PASS.
- [ ] Adversarial Gate PASS.
- [ ] Text Integrity Gate PASS.
- [ ] review thread 0 또는 전부 해결.
- [ ] requested changes 없음.
- [ ] changed file count와 감사 목록 일치.
- [ ] PR diff에 범위 밖 변경 없음.

## 9. Phase 7 — 적대적 검토 루프

1. 사용자 최신 의도를 과도하게 확대했는가.
2. 기존 승인 코어·플랫폼·Gate를 조용히 약화했는가.
3. 같은 개념을 다른 이름으로 중복 확정했는가.
4. Sheet와 GitHub 중 한쪽에만 중요한 조건이 있는가.
5. Prototype 값을 최종값처럼 표현했는가.
6. 미실행 검증을 PASS로 오인할 여지가 있는가.
7. 다음 작업자가 구형 문서를 먼저 읽을 가능성이 있는가.
8. 병합 후 깨지는 경로·Registry·Generator가 있는가.
9. 사용자 승인 범위 밖 결정을 포함했는가.
10. 제작량·QA·지원 약속을 과도하게 넓혔는가.
11. 다중 소환·자동화·주기 Event가 플레이어 판단을 대체하는가.
12. 한글·기호·대괄호 스탯이 깨지거나 정규화가 달라졌는가.
13. 병합을 미뤄야 할 P0/P1이 남았는가.

판정:

```text
PASS
PASS_WITH_DECLARED_P2_P3
BLOCK_P0_P1
BENCHMARK_GATE_FAILED
TEXT_INTEGRITY_FAILED
SYNC_CONFLICT
CI_FAILED
REVIEW_BLOCKED
```

## 10. Phase 8 — Merge

- [ ] 사용자 승인 또는 병합 Trigger 충족.
- [ ] 최종 HEAD를 expected SHA로 잠금.
- [ ] 기본은 squash merge.
- [ ] merge result main SHA 기록.
- [ ] PR merged 상태 재조회.

## 11. Phase 9 — 병합 후 재검증

- [ ] main에서 변경 파일 재조회.
- [ ] main SHA를 Sheet에 기록.
- [ ] `MAIN_SHEET_READBACK_PASS` 확인.
- [ ] cold-start·Active Context·Registry가 main 상태 복원.
- [ ] UTF-8·NFC·sentinel을 main에서 재검사.
- [ ] 필요 시 main-sync PR 생성·검증·병합.
- [ ] `SYNCED_TO_MAIN` 승격.
- [ ] Batch counter Reset.
- [ ] 남은 `NOT_RUN` 보고.

## 12. 병합 금지 요약

```text
P0/P1 unresolved
benchmark or industry comparison missing
text integrity failure
GitHub-Sheet mismatch
CI or adversarial failure
merge conflict
unresolved review
missing authority path
failed Sheet readback
scope creep into protected product files
false completion claim
```
