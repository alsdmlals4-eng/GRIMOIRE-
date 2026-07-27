# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- Gate 2: `ENTERED_PLANNING_ONLY`
- Vertical Slice 계약: `APPROVED_AT_GATE_1`
- 구현: `NOT_STARTED`
- 다음 차단 결정: `GM-VS-PROFILE-01`

## 1. 시작 경로

```text
START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/GATE_1_FINAL_APPROVAL.md
→ docs/planning/V6_CONCEPT_REBASE_BASELINE.md
→ docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md
→ docs/planning/GATE_1_ADVERSARIAL_REVIEW.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
```

## 2. 승인 및 Gate 1 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| Gate 1 최종 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | `GATE_1_APPROVED_BASELINE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 벤치마킹·SWOT·VRIO·제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | `ACTIVE_RESEARCH_EVIDENCE` |
| 소환수·동반자 구조 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 직접 Vertical Slice 경로 | `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md` | `APPROVED_AT_GATE_1` |
| P0 보완 Vertical Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `APPROVED_AT_GATE_1` |
| 적대적 검토 | `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md` | `ACTIVE_REVIEW_EVIDENCE` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27P.md` | `LATEST_DECISION_RECORD` |

## 3. 승인된 Vertical Slice 구조

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

- 수업·연습: 배움과 원리 비교
- 시험: 제한 조건 안의 이해 증명
- 축제: 표현·개성·관계·비전투 활용
- 현장: 위험 속 응용·재설계·발견
- 자유일정: 휴식·준비·교류

## 4. 승인된 공통 구조

### Situation Challenge

```text
상황 목표
→ 관찰 상태
→ 글자·제한 조건
→ 방향성 미리보기
→ 직접 작성
→ 세계 변화
→ 결과 원인
→ 기록·후속 반응
```

### 시간·자유일정·저장

- 목표: `45~50분`
- 상한: `60분`
- 자유일정: 슬롯당 `휴식 / 준비 / 교류`
- 저장: 세션 경계와 현장 전환 중심 최소 상태
- 세션별 전용 미니게임·프레임워크 금지

### 내부 구현 순서

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 별도 CORE_POC가 아니다.

## 5. 제품 경로

```text
Gate 1 콘셉트 정리
→ Slice 구조 승인
→ 적대적 검토
→ P0 처리 패키지 승인
→ Gate 1 최종 승인 — 완료
→ GM-VS-PROFILE-01 실행 프로필 전환 결정
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

## 6. 기존 시스템 참조

다음 문서들은 기존 결정과 후보를 보존하는 `REFERENCE_CANDIDATE`다.

- `docs/planning/SPELL_GAME_DESIGN.md`
- 전투·글자·회로·스톡·마나·소환수 문서
- 학교·학년·학기·수업·현장실습 문서
- 내러티브·벤치마크 문서

사용 규칙:

- 최신 승인 원본과 충돌하면 승인 원본 우선
- 보호 결정 유지
- 수치는 `UNVERIFIED` 또는 `BALANCE_TUNING_BACKLOG`
- 폐기·대체 결정은 이력으로 보존

## 7. 구현·검증 문서

| 문서 | 현재 상태 |
|---|---|
| `docs/DEVELOPMENT_GATES.md` | Gate 1 승인 / Gate 2 계획 진입 |
| Godot 구현 계획 | `NOT_AUTHORED` |
| Codex read-only Plan | `BLOCKED_BY_PROFILE_TRANSITION` |
| Android 검증 매트릭스 | `NOT_AUTHORED` |
| Balance Tuning Backlog | `NOT_AUTHORED` |
| 런타임·QA·접근성·성능 | `NOT_RUN` |

## 8. 현재 금지

- `main` 직접 수정
- 사용자 승인 없는 PR 병합
- 승인 전 `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- 별도 CORE_POC 재도입
- 세션별 전용 게임·미니게임 제작
- 자유일정 선택으로 필수 진행 차단
- 첫 완주 범위를 구조적으로 60분 초과

## 9. 다음 라우팅

`GM-VS-PROFILE-01`

실행 프로필을 `VERTICAL_SLICE_FULL_PROFILE`로 전환하고 Codex read-only Plan 및 구현 준비 문서 작성을 시작할지 결정한다.
