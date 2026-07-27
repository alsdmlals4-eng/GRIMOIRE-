# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 1: `UNVERIFIED`
- Vertical Slice 계약: `CONFIRMED_PENDING_P0_AMENDMENT`
- 적대적 검토: `AUTHORED`
- 구현: `NOT_STARTED`

## 1. 시작 경로

```text
START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/GATE_1_ADVERSARIAL_REVIEW.md
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
| 소환수·동반자 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED_FOR_GATE_1` |
| 직접 Slice 경로 | `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md` | `CONFIRMED_FOR_GATE_1` |
| 축약 학기형 Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `CONFIRMED_PENDING_P0_AMENDMENT` |
| 적대적 Gate 1 검토 | `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md` | `AUTHORED_USER_DECISION_REQUIRED` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27N.md` | `LATEST_DECISION_RECORD` |

## 3. 승인된 Vertical Slice

```text
수업·교내 연습
→ 자유일정 A
→ 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 현장실습
→ 귀환·마도서 기록
```

보호:

- 자유일정 총 3회
- 휴식은 유효한 선택
- 필수 진행 차단 금지

## 4. 적대적 검토 판정

### 현재 계약 그대로

`NO-GO_FOR_GATE_1_FINAL_APPROVAL`

주요 원인:

- 세션별 전용 시스템 분열
- 세션 역할 중복
- 52~84분 시간 범위 상한 부재
- 자유일정 콘텐츠 폭증
- 터치 입력 검증 지연
- 저장 상태 과다

### 권장 P0 패키지 승인 후

`CONDITIONAL_GO_CANDIDATE_FOR_GATE_1_FINAL_APPROVAL`

권장 패키지:

1. 공통 `Situation Challenge` 계약
2. 세션별 판단·압박·결과·실패 분리
3. 45~50분 목표, 60분 상한
4. 자유일정 `휴식 / 준비 / 교류`
5. 입력→공통 문제→학교→현장→연출 구현 순서
6. 경계 중심 최소 저장

## 5. 제품 경로

```text
GM-GATE1-RISK-01 P0 패키지 결정
→ 승인안 계약 반영
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

## 6. 현재 금지

- P0 결정 없는 Gate 1 최종 승인
- `CORE_CONFIRMED`
- 실행 프로필 전환
- Codex 실행
- Godot 구현
- 별도 CORE_POC 재도입
- PR 병합

## 7. 다음 라우팅

`GM-GATE1-RISK-01`: 권장 P0 처리 패키지를 승인할지 결정한다.
