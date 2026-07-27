# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 1: `UNVERIFIED`
- Vertical Slice 계약: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`
- 구현: `NOT_STARTED`

## 1. 시작 경로

```text
START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/V6_CONCEPT_REBASE_BASELINE.md
→ docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
```

## 2. Gate 1 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | `ACTIVE_GATE_1_WORKING_SOURCE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 벤치마킹·SWOT·VRIO·제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | `RESEARCH_AUTHORED` |
| 소환수·동반자 구조 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 직접 Vertical Slice 경로 | `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md` | `CONFIRMED_FOR_GATE_1` |
| 축약 학기형 Vertical Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `CONFIRMED_FOR_GATE_1` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27M.md` | `LATEST_DECISION_RECORD` |

## 3. Vertical Slice 계약 요약

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A 1회
→ 첫 실기시험
→ 자유일정 B 1회
→ 학교축제 준비·학교축제
→ 자유일정 C 1회
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

세션별 책임:

- 수업·연습: 배움
- 시험: 이해의 증명
- 학교축제: 표현·관계·비전투 활용
- 현장실습: 실제 위험 속 응용·발견
- 자유일정: 휴식·준비·관계·연구의 완충
- 귀환·기록: 결과 해석·다음 학습 연결

자유일정:

- 총 3회
- 한 슬롯에서 행동 1개
- 휴식은 유효한 선택
- 필수 진행·정보·정답 차단 금지

## 4. 제품 경로

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약 — 승인됨
→ GM-GATE1-REVIEW-01 적대적 검토
→ P0·P1 처리안
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

CORE_POC:

- `REMOVED_BY_USER_DECISION`
- 검증 책임은 Vertical Slice에 흡수
- 다른 이름으로 재도입 금지

## 5. 시스템 참조 문서

다음은 기존 결정과 후보를 보존하는 `REFERENCE_CANDIDATE`다.

- `docs/planning/SPELL_GAME_DESIGN.md`
- `docs/planning/COMBAT_CORE_SYSTEM.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/CIRCUIT_SYSTEM.md`
- `docs/planning/MAIN_LETTER_LEVEL_SYSTEM.md`
- `docs/planning/MAIN_LETTER_SPECIALIZATION_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_OPERATION_CAPACITY_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/SUMMON_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- 학교·학년·학기·수업·현장실습 문서
- 내러티브·벤치마크 문서

사용 규칙:

- 최신 Gate 1 책임 원본과 충돌하면 최신 원본 우선
- 보호 결정은 유지
- 수치는 `UNVERIFIED` 또는 `BALANCE_TUNING_BACKLOG`
- 폐기·대체 결정은 이력으로 보존

## 6. 구현·검증 문서

| 문서 | 현재 상태 |
|---|---|
| `docs/DEVELOPMENT_GATES.md` | Gate 1 진행 중 |
| Godot 구현 계획 | `NOT_AUTHORED` |
| Android 검증 매트릭스 | `NOT_AUTHORED` |
| Balance Tuning Backlog | `NOT_AUTHORED` |
| 적대적 Gate 1 검토 | `NEXT_BLOCKING_DECISION` |
| QA·접근성·성능 | `NOT_RUN` |

## 7. 현재 금지

- `main` 직접 수정
- 사용자 승인 없는 PR 병합
- Gate 1 승인 전 구현
- Codex 실행
- `CORE_CONFIRMED` 선언
- 별도 CORE_POC 재도입
- 자유일정 선택으로 필수 진행 차단
- 휴식을 손해 전용 선택으로 설계

## 8. 다음 라우팅

`GM-GATE1-REVIEW-01`

검토 대상:

- 4개 핵심 세션 + 자유일정 3회의 1인 제작성
- 시험·축제·현장실습의 플레이 중복
- 전체 52~84분의 모바일 완주 부담
- 자유일정의 가치와 제작 비용
- 터치 입력·소환수·환경 UI 인지 부하
- 저장·복귀와 콘텐츠 재사용성
- P0·P1 감량 순서
