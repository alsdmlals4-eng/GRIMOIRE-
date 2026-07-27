# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정, 다음 작업과 Skill route를 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트명 | `스펠` (임시) |
| 플레이어 약속 | 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG |
| 통합 세일즈 문장 | 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG |
| 주 경험 | 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계·발견하는 지적 마법 판타지 |
| 비타협 코어 | 의미 기반 글자·직접 작성·상황별 조합·설명 가능한 세계 변화·학습→실전→기록 순환 |
| 세일즈포인트 | 직접 쓰는 마법 / 상황에 맞게 만드는 주문 / 수업에서 실전 발견 |
| 벤치마크 그룹 | 직접 입력 / 조합·문제 해결 / 마법학교·학습 성장 |
| VRIO | `VRIO_POTENTIAL_NOT_PROVEN` |
| 1인 제작성 | 작은 2D 모바일 CORE_POC는 `FEASIBLE_WITH_STRICT_SCOPE` |
| 기본 Loop | 수업→교내 연습→일상→현장실습→복귀·정리→다음 학습 |
| 경험 곡선 | 첫 5분 직접 작성·설계→첫 모의 실습→첫 발견→첫 하위 글자 스톡 |
| 일정 방식 | 고정 핵심 사건 + 자유 일정 |
| 장르·플랫폼 | 집중형 모바일 마법학교 RPG / Android·Google Play |
| 기본 세션 목표 | 약 10~15분, 수업·연습·현장실습·일상 중 하나를 중심으로 완결 |
| 엔진 | Godot, 버전·렌더러 `UNVERIFIED` |
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 프로젝트 코어 전체 | `CORE_CANDIDATE` |
| 코어 경계 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| 세일즈포인트 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| 벤치마킹 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| Gate 1 | `UNVERIFIED` |
| 구현 상태 | `NOT_STARTED` |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-MASCOT-01` — 마스코트·상징 동반자 역할 |
| 다음 제품 증거 | 동반자 역할→CORE_POC 계약→적대적 검토→Gate 1 승인 |
| 가장 큰 위험 | 모바일에서 직접 작성·상황 판단이 재미와 가독성을 유지하는지 미검증 |
| Base 기준 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |

## 먼저 읽기

```text
AGENTS.md
→ docs/BASE_RULES_VERSION.md
→ 이 START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DOCUMENTATION_MAP.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 현재 책임 원본
→ skills/SKILL_REGISTRY.json
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ 현재 Issue·Goal·Plan·PR
→ 실제 파일·테스트
```

전체 저장소와 모든 Skill을 무작정 읽지 않는다. 현재 요청의 Trigger에 맞는 최소 충분 책임 원본과 Skill mode만 선택한다.

## Gate 1 책임 원본

| 책임 | 원본 | 상태 |
|---|---|---|
| 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | `ACTIVE_GATE_1_WORKING_SOURCE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| 벤치마킹·SWOT·VRIO·1인 제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | 활성 |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` | 활성 |
| 라우팅 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | 활성 |

## 현재 보호 경계

- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자는 직접 작성
- 복수 메인 글자 결합 금지
- 스톡과 소환수는 조합 판단을 대체하지 않음
- 입력 실패와 설계 실패를 같은 실패로 처리하지 않음
- `무한 자유 조합`, `무엇이든 가능한 마법`, `완전한 손글씨 인식`을 약속하지 않음
- 실시간 전투·완성 주문 스톡·소환수 충전은 검증 전 대표 세일즈포인트가 아님
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지
- 현재 프로필에서 Godot 구현·Codex 실행 금지

## 다음 결정

`GM-MASCOT-01`

> 소환수를 전투 유닛보다 마법 학습·실습·기록을 함께하는 상징 동반자로 우선 배치할 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`
