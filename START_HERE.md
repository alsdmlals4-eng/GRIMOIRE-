# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정, 다음 작업을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트명 | `스펠` (임시) |
| 플레이어 약속 | 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG |
| 통합 세일즈 문장 | 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG |
| 주 경험 | 의미 기반 글자 조합과 상황별 주문 발견 |
| 비타협 코어 | 의미 기반 글자·직접 작성·상황별 조합·설명 가능한 세계 변화·학습→실전→기록 순환 |
| 기본 Loop | 수업→교내 연습→일상→현장실습→복귀·정리→다음 학습 |
| 메인 동반 소환수 | 항상 같은 개체가 동행하며 학습·관계·기록 담당 |
| 전투 보조 소환수 | 전투에서 호출해 공격·견제·수호·충전 지원 |
| 일정 방식 | 고정 핵심 사건 + 자유 일정 |
| 장르·플랫폼 | 집중형 모바일 마법학교 RPG / Android·Google Play |
| 기본 세션 목표 | 약 10~15분, 중심 활동 하나 완결 |
| 엔진 | Godot, 버전·렌더러 `UNVERIFIED` |
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 프로젝트 코어 전체 | `CORE_CANDIDATE` |
| 소환수 구조 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| Gate 1 | `UNVERIFIED` |
| 구현 상태 | `NOT_STARTED` |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-POC-01` — CORE_POC 계약 |
| 가장 큰 위험 | 모바일에서 작성·상황 판단·전투 보조가 동시에 가독성을 유지하는지 미검증 |
| Base 기준 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |

## 먼저 읽기

```text
AGENTS.md
→ docs/BASE_RULES_VERSION.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DOCUMENTATION_MAP.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 현재 책임 원본
```

## Gate 1 책임 원본

1. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
2. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
3. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
4. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
5. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
6. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
7. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
8. `docs/planning/DECISION_LOG.md`

## 보호 결정 요약

- 메인 글자는 항상 1개다.
- 신규·미숙·중요 글자는 직접 작성한다.
- 숙련 보조만 하위 글자 스톡 후보가 된다.
- 입력 실패와 설계 실패를 분리한다.
- 메인 동반 소환수는 항상 같은 개체가 동행한다.
- 전투 보조 소환수는 전투에서 호출한다.
- 소환수는 글자 작성·조합 선택·정답 제시를 대행하지 않는다.
- 스톡 없이 직접 시전할 수 있다.
- 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
- 현재 단계에서는 Godot 구현과 Codex를 실행하지 않는다.

## 다음 작업

`GM-POC-01`에서 다음 CORE_POC 계약을 확정한다.

```text
짧은 수업 1개
→ 교내 연습 1개
→ 전투 문제 1개
→ 환경 문제 1개
→ 발견 기록
```

검증 대상:

- 직접 작성 손맛
- 의미 기반 조합 이해
- 입력 실패와 설계 실패 구분
- 전투 중 정지·감속·실시간 비교
- 메인 동반자의 학습·기록 연속성
- 전투 보조 소환수의 작성 시간 확보 효과
