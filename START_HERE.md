# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정과 다음 작업을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트명 | `스펠` (임시) |
| 장르·플랫폼 | 집중형 모바일 마법학교 RPG / Android·Google Play |
| 플레이어 약속 | 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG |
| 통합 세일즈 문장 | 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG |
| 주 경험 | 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계·발견하는 지적 마법 판타지 |
| 비타협 코어 | 의미 기반 글자·직접 작성·상황별 조합·설명 가능한 세계 변화·학습→실전→기록 순환 |
| 세일즈포인트 | 직접 쓰는 마법 / 상황에 맞게 만드는 주문 / 수업에서 실전 발견 |
| 기본 Loop | 수업→교내 연습→일상·준비→현장실습→복귀·기록→다음 학습 |
| 소환수 구조 | 상시 메인 동반 소환수 + 전투 호출 보조 소환수 |
| 제품 경로 | CORE_POC 없이 Validation-First Vertical Slice로 직접 진행 |
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 프로젝트 코어 | `CORE_CANDIDATE` |
| Gate 1 | `UNVERIFIED` |
| CORE_POC | `REMOVED_BY_USER_DECISION` |
| CORE_POC 검증 | `ABSORBED_INTO_VERTICAL_SLICE` |
| Vertical Slice 계약 | `NOT_AUTHORED` |
| 구현 | `NOT_STARTED` |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-SLICE-01` — Vertical Slice 대표 구간·범위·통과 기준 |
| 가장 큰 위험 | POC 없이 Slice로 가면서 핵심 검증보다 콘텐츠·연출 범위가 먼저 커지는 것 |
| Base 기준 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |

---

## 최신 사용자 결정

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

적용 결과:

```text
CORE_POC 계약·구현·통과
→ 제거

CORE_POC 검증 책임
→ Vertical Slice 필수 통과 조건으로 이동
```

별도 CORE_POC를 다른 이름으로 재도입하지 않는다.

---

## 먼저 읽기

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

필요한 세부 원본:

1. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
2. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
3. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
4. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
5. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
6. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
7. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27L.md`

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 책임 원본과 사용자 override가 우선한다.

---

## 보호 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`
- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 스톡은 이해한 반복만 줄임
- 입력 실패와 설계 실패 분리
- 메인 동반 소환수는 항상 같은 개체
- 전투 보조 소환수는 전투에서 호출
- 소환수는 글자 작성·조합 판단·정답 제시를 대행하지 않음
- 필수 정보는 선택형 상세 대화에만 숨기지 않음
- 별도 CORE_POC 재도입 금지
- Gate 1 및 Slice 계약 승인 전 구현·Codex 실행 금지
- 사용자 승인 없는 PR 병합 금지

---

## Validation-First Vertical Slice 필수 증거

- 직접 글자 작성과 즉각적 발현
- 메인·보조 글자의 역할 차이
- 같은 메인 글자의 전투·환경 재사용
- 최소 2개의 유효 해결법
- 실패 원인 이해와 재설계
- 완전 정지·감속·실시간 비교
- 메인 동반자의 학습·기록 연결
- 전투 보조 소환수의 수호·견제 효과
- Android 실제 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

---

## 다음 작업 — GM-SLICE-01

권장 첫 Slice:

```text
짧은 수업
→ 교내 연습
→ 메인 동반자와 짧은 일상·준비
→ 첫 현장실습의 전투 문제
→ 환경·구조 문제
→ 복귀·마도서 기록
```

이 결정 이후 적대적 범위 검토와 사용자 Gate 1 승인을 진행한다. 구현은 아직 시작하지 않는다.
