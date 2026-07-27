# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`

> 모든 파일을 무작정 읽지 않는다. 질문에 맞는 단일 책임 원본, 필요한 최소 Skill, 실제 파일과 검증 증거를 선택한다.

## 1. 기본 읽기 순서

```text
최신 사용자 지시
→ AGENTS.md
→ docs/BASE_RULES_VERSION.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 현재 책임 원본
→ skills/SKILL_REGISTRY.json
→ 현재 Issue·Goal·Plan·PR
→ 실제 코드·데이터·Scene·Resource·테스트
```

기본 제외:

- 최신 결정 추적에 필요하지 않은 이전 Addendum
- 현재 질문과 무관한 시스템 세부 문서
- 구현 미착수 단계의 코드·런타임 가정

## 2. Gate 1 책임 라우팅

| 질문 | 단일 책임 원본 |
|---|---|
| 전체 Gate 1 상태·진행 순서 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` |
| 현재 작업 상태 | `docs/ACTIVE_CONTEXT.md` |
| 사용자 결정·보류·override | `docs/planning/DECISION_LOG.md` |
| Micro·Combat·Session·Semester Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 첫 5분·첫 실습·첫 자동화 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` |
| 비타협 코어·지원층·외피 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` |
| 세일즈포인트·대표 세 장면 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` |
| 벤치마킹·SWOT·VRIO·제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` |
| 메인 동반·전투 보조 소환수 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` |
| 소환수 전투·충전 세부 후보 | `docs/planning/SUMMON_SYSTEM.md` |
| 문서 라우팅 | `docs/DESIGN_DOCUMENT_REGISTRY.json` |

## 3. 최신 결정

### GM-MASCOT-01

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·현장 동행·마도서 기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·지정 충전 지원
```

상태: `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1`

이전 `전투 시작 전 기본 소환수 1체 미리 전개`는 `SUPERSEDED_BY_GM-MASCOT-01`이다.

## 4. 현재 다음 결정

`GM-POC-01`: CORE_POC 계약

```text
짧은 수업 1개
→ 교내 연습 1개
→ 전투 문제 1개
→ 환경 문제 1개
→ 발견 기록
```

필수 비교:

- 직접 작성 성공·피로·인식 허용 범위
- 입력 실패와 설계 실패 분리
- 완전 정지 / 감속 / 실시간
- 같은 메인 글자의 다른 보조·상황 재사용
- 메인 동반자의 학습·기록 연속성
- 보조 소환수 유무에 따른 작성 시간·피격·완주율

## 5. 기존 참조 문서 사용 규칙

- 기존 `docs/planning/` 문서는 `REFERENCE_CANDIDATE`다.
- 최신 승인과 책임 원본에 충돌하면 최신 승인에 따른다.
- 수치와 편성 수는 테스트 전 `UNVERIFIED` 또는 `BALANCE_TUNING_BACKLOG`다.
- `SUPERSEDED`와 `REJECTED` 이력은 삭제하지 않는다.
- 외부 작품의 고유 설정·명칭·데이터를 복제하지 않는다.

## 6. 구현 경계

현재 상태:

- Godot 코드·Scene·Resource·게임 데이터: `NOT_STARTED`
- Codex: `NOT_RUN`
- CORE_POC: `NOT_AUTHORED`
- 런타임·모바일·접근성·성능·플레이테스트: `NOT_RUN`
- PR: Draft 유지
- 병합: 금지

Gate 1 전체 승인과 CORE_POC 계약 전에는 구현 계획으로 전환하지 않는다.
