# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 상세 기획은 링크된 책임 원본에서 읽고, 이 문서는 현재 Gate와 작업 순서만 관리한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile` |
| 후속 플랫폼 | `PC` |
| 방향 | `LANDSCAPE_FIXED` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 기획 계약 | `APPROVED_AND_MERGED_TO_MAIN` |
| 마지막 최종화 main | `b9e7a6ba3a029c45a59bd20213bc4b7a561609f4` |
| 마지막 완료 Sync | `GR-SYNC-20260802-20 / SHEET_READBACK_PASS` |
| 현재 Decision | `GM-IMPLEMENTATION-ENTRY-01` |
| 승인안 | `A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK` |
| 새 Batch | `1/10` |
| 구현 진입 | `APPROVED_CONDITIONAL_FOUNDATION_POC` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED` |
| Codex 실행 | `BLOCKED` |
| 다음 Gate | `GM-FOUNDATION-POC-EXECUTION-READINESS-01` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 반드시 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/planning/IMPLEMENTATION_ENTRY_01_COLD_START_OVERRIDE_2026-08-02.md`
3. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`
4. `docs/superpowers/specs/2026-08-02-mobile-foundation-poc-implementation-entry-design.md`
5. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`
6. `docs/planning/IMPLEMENTATION_ENTRY_01_ADVERSARIAL_REVIEW_2026-08-02.md`
7. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
8. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
9. `docs/planning/GRIMOIRE_FULL_GAME_STRUCTURE_COMPLETION_OVERRIDE_2026-08-02.md`
10. `docs/planning/MOBILE_UX_FLOW_01_APPROVAL_2026-08-02.md`
11. `docs/planning/MOBILE_WRITING_BATTLE_WIREFRAME_01_APPROVAL_2026-08-02.md`
12. `docs/DEVELOPMENT_GATES.md`
13. `docs/ACTIVE_CONTEXT.md`
14. `docs/DESIGN_DOCUMENT_REGISTRY.json`
15. 질문 주제의 세부 승인 책임 원본

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협 코어:

- 의미를 가진 글자와 직접 작성.
- 상황·목표·위험에 따른 주문 설계 판단.
- 입력 실패·인식 실패·문법 실패·상황 설계 실패·비용 부족 분리.
- 명시적 Commit 뒤에만 설명 가능한 세계 변화 적용.
- 의도·결과·부작용·발견을 Grimoire에 기록.

## 승인된 Mobile UX 코어

```text
장면
→ Context Card
→ 하나의 Focus Task
→ 필요 시 확장형 우측 Writing Panel
→ 단일 원자 Commit
→ 결과·세계 변화
→ Grimoire
→ Hub 또는 다음 Anchor
```

작성 중에도 다음을 유지한다.

- 적 또는 대상.
- 적 의도와 남은 시간.
- 환경 위험과 보존 대상.
- 플레이어 핵심 HP·마나.

Panel collapse·일시 중단은 Draft를 보존하고, 명시적인 전체 취소에서만 폐기한다. 낮은 확신 후보는 자동 확정하지 않는다.

## 구현 진입 승인 범위

이번 승인은 전체 Vertical Slice 본제작 승인이 아니다.

허용된 Foundation POC:

- 최소 Godot 프로젝트와 Headless 테스트 계약.
- Focus Task 순수 상태 전이.
- Atomic Result Ledger.
- Stroke Buffer·Draft·Candidate 상태.
- Deterministic Test Recognizer.
- pause/resume·focus loss Snapshot.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

계속 금지:

- 46–53분 전체 콘텐츠.
- 실제 글자 인식·ML·훈련 데이터.
- 최종 Art·Audio·Asset Import.
- Boss 다중 페이즈.
- 완성 Grimoire/Main.
- 최종 밸런스·성능·Touch 수치.
- Store·배포·사업화.

## 실행 차단 이유

현재 open Draft PR:

- `#38` — Base v9.4.2 planning-first adoption.
- `#42` — Base v9.4.3 first-prompt adapter adoption.

두 PR이 같은 Base Adapter 계층을 다루므로, 코드 실행 전 병합·통합·supersede·close 중 하나로 정리하고 main에서 단일 Base identity를 확인해야 한다.

## 다음 작업

```text
Implementation Entry 설계·계획·Sheet 동기화
→ Draft PR 검토
→ Base PR #38·#42 정리
→ Cold-start 권위 문서 직접 재조정
→ 최신 main에서 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0일 때만 Foundation POC 코드 실행
```

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODE_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

`TEST_VALUE`, Harness, CI PASS를 실기기·성능·접근성·사람 검증 완료로 표시하지 않는다.
