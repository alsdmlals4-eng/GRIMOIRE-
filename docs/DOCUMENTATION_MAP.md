# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- Vertical Slice 계약: `NOT_AUTHORED`

---

## 1. 콜드 스타트 경로

```text
AGENTS.md
→ docs/BASE_RULES_VERSION.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md
→ docs/planning/V6_CONCEPT_REBASE_BASELINE.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ docs/planning/DECISION_LOG.md
```

이 경로를 읽으면 현재 제품 단계, 승인된 코어, CORE_POC 제거 결정, Vertical Slice 진입 조건과 다음 차단 결정을 확인할 수 있어야 한다.

---

## 2. Gate 1 책임 원본

| 책임 | 단일 책임 원본 | 상태 |
|---|---|---|
| Gate 1 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | `ACTIVE_GATE_1_WORKING_SOURCE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| 벤치마킹·SWOT·VRIO·제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| 소환수·동반자 구조 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| CORE_POC 없는 직접 Slice 경로 | `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md` | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 override 기록 | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27L.md` | `LATEST_DECISION_ADDENDUM` |
| 현재 실행 상태 | `docs/ACTIVE_CONTEXT.md` | `ACTIVE_CONTEXT` |
| 제품 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_ROUTER` |
| 책임 라우터 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_SOURCE_ROUTER` |

---

## 3. 최신 제품 경로

```text
Gate 1 콘셉트 정리
→ GM-SLICE-01 Vertical Slice 계약
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice
→ QA·외부 플레이테스트
→ Gate 3 판단
```

제거된 경로:

```text
CORE_POC 계약
→ CORE_POC 구현
→ CORE_POC 통과
```

상태: `SUPERSEDED_BY_GM-VS-ROUTE-01`

CORE_POC 검증 항목은 제거되지 않고 Vertical Slice 통과 기준으로 흡수된다.

---

## 4. 승인된 핵심 요약

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

### 비타협 코어

- 의미를 가진 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 변형 판단
- 설명 가능한 세계 변화
- 수업→연습→현장실습→발견·기록→다음 학습

### 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

---

## 5. Validation-First Vertical Slice 책임

다음은 Slice 계약과 구현에서 반드시 추적한다.

- 직접 작성과 즉시 발현
- 입력 실패와 설계 실패 분리
- 완전 정지·감속·실시간 비교
- 같은 메인 글자의 전투·환경 재사용
- 최소 2개의 유효 해결법
- 실패 원인 이해와 재설계
- 메인 동반자의 학습·기록 연결
- 전투 보조 소환수의 수호·견제 효과
- Android 실제 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

---

## 6. 기존 참조 문서

다음 문서는 최신 Gate 1 원본을 보조하는 `REFERENCE_CANDIDATE`다.

### 마법·전투·자동화

- `docs/planning/COMBAT_CORE_SYSTEM.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/CIRCUIT_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- `docs/planning/SUMMON_SYSTEM.md`

### 학교·세계·서사

- `docs/planning/WORLD_SETTING_CONCEPT.md`
- `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md`
- `docs/planning/WORLD_MAGIC_CURRICULUM_SYSTEM.md`
- `docs/planning/WORLD_FIELD_PRACTICUM_SYSTEM.md`
- `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md`

### 벤치마크

- `docs/planning/BENCHMARK_CIRCUIT_GRAMMAR.md`
- `docs/planning/BENCHMARK_SUMMON_SYSTEM.md`
- `docs/planning/BENCHMARK_MAGIC_SCHOOL_GROWTH.md`

참조 문서의 기존 수치와 범위는 사용자 재승인 없이 Gate 1 확정값으로 승격하지 않는다.

---

## 7. 다음 차단 결정

`GM-SLICE-01`: 첫 Vertical Slice의 대표 구간, 포함·제외 범위, 통과·실패 기준.

권장 후보:

```text
짧은 수업
→ 교내 연습
→ 짧은 일상·준비
→ 첫 현장실습 전투
→ 환경·구조 문제
→ 복귀·마도서 기록
```

---

## 8. 문서 운영 규칙

- 한 책임에는 하나의 정본만 둔다.
- 최신 사용자 결정이 이전 경로를 override할 수 있다.
- 별도 CORE_POC를 다른 이름으로 재도입하지 않는다.
- 과거 결정과 문서는 Git 이력과 Addendum으로 보존한다.
- 실제 파일·빌드·테스트가 구현 주장보다 우선한다.
- 사용자 승인 전 PR을 병합하지 않는다.
