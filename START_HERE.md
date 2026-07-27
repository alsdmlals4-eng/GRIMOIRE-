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
| Gate 1 | `UNVERIFIED` |
| 구현 상태 | `NOT_STARTED` |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-BENCHMARK-01` — 벤치마킹·SWOT·VRIO·1인 제작성 |
| 다음 제품 증거 | 경쟁군 검증·제작성·마스코트 역할·CORE_POC 계약 |
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
→ 현재 PR·Issue·Goal·Plan
→ 실제 파일·테스트
```

전체 저장소와 모든 Skill을 무작정 읽지 않는다. 현재 요청의 Trigger에 맞는 최소 충분 책임 원본과 Skill mode만 선택한다.

## 확정된 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

상태: `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1`

## 확정된 세일즈포인트

상태: `SALES_POINTS_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`

### 한 문장

> **마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.**

### 최대 3개

1. **손으로 직접 쓰는 마법**
2. **상황에 맞게 만드는 주문**
3. **수업에서 배우고 실전에서 발견하는 마법학교**

```text
장면 1
직접 글자 작성→즉시 마법 발현

장면 2
같은 메인 글자→다른 보조 조합→다른 상황 결과

장면 3
수업 원리→현장 응용→새 활용 마도서 기록
```

## 확정된 프로젝트 코어 경계

상태: `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`

### 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→현장실습→발견·기록→다음 학습 순환

### 지원 시스템

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 소환수 전투·수호·지정 충전 지원

### 변경 가능한 외피

- 3년·6학기와 학기 `10+4`
- 학교·지역·등장인물·관계 분기량
- 실시간 전투 압박과 집중 모드
- 메인 레벨·보조 운용량·스톡 수치
- 완성 주문 스톡의 존재와 비중
- 소환수 편성·성장 방식
- 정확한 세션 시간과 저장·복귀 단위

## 확정된 게임플레이 Loop

상태: `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`

```text
수업
→ 글자·원리·설계법 학습

교내 연습
→ 직접 작성·조합·사용 연습

일상
→ 관계·정보·동행·실습 관점 누적

현장실습
→ 실전 문제와 전투에서 응용·변형·발견

복귀·정리
→ 주문·활용법·실패 원인·관계 결과 기록

다음 수업·연구
→ 실전에서 드러난 부족함과 관심 분야 재학습
```

## 확정된 경험 곡선

상태: `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`

```text
학교 도착·현재 목표 소개
→ 교수의 짧은 시범
→ 첫 메인 글자 직접 작성
→ 세계가 변하는 결과 확인
→ 보조 글자 하나로 작은 설계 선택
→ 짧은 일상·관계 장면
→ 첫 모의 현장실습에서 응용
→ 새 활용 발견·마도서 기록
→ 반복 숙련 후 첫 하위 글자 스톡 해금
```

## 핵심 행동과 고민

```text
상황·위험 관찰
→ 메인 글자로 핵심 현상 선택
→ 보조 글자로 효과 변형
→ 직접 작성 또는 숙련 스톡 삽입
→ 주문 결과 확인
→ 원인 이해와 재설계
```

핵심 고민:

- 지금 필요한 현상은 무엇인가?
- 어떤 보조 효과가 상황을 가장 효율적으로 바꾸는가?
- 직접 작성할 것인가, 준비한 스톡을 사용할 것인가?
- 짧고 안전한 주문과 복잡하고 강한 주문 중 무엇을 선택할 것인가?

## 직접 작성·스톡·소환수 책임 경계

| 시스템 | 책임 | 현재 상태 |
|---|---|---|
| 직접 작성 | 신규·미숙·중요 글자, 핵심 판단, 즉석 변형 | `NON_NEGOTIABLE_CORE` |
| 하위 글자 스톡 | 숙련한 반복 보조 한 단위 자동 배치·연결 | `CORE_SUPPORT` |
| 완성 주문 스톡 | 제한된 긴급 대응과 준비 전술 후보 | `UNPROVEN_OPTION` |
| 소환수 | 전투·수호·지정 생산·충전 지원 | `CORE_SUPPORT_WITH_UNPROVEN_EFFICIENCY` |

스톡과 소환수는 주문 설계 판단을 대체하지 않는다.

## 현재 상태

| 구분 | 상태 | 책임 원본·증거 |
|---|---|---|
| 최상위 경험 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 목표 플레이어 | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 선택형 서사 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 플레이어 약속 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 게임플레이 Loop | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | `GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 경험 곡선 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | `GATE_1_EXPERIENCE_CURVE_SYSTEM.md` |
| 프로젝트 코어 경계 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | `GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` |
| 세일즈포인트 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | `GATE_1_SALES_POINTS_SYSTEM.md` |
| 프로젝트 코어 전체 | `CORE_CANDIDATE` | 벤치마킹·CORE_POC·Gate 승인 필요 |
| 구현 | `NOT_STARTED` | Godot 프로젝트·코드·Scene 없음 |
| 런타임 검증 | `NOT_RUN` | 빌드 없음 |

## 보호할 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`이다.
- 복수 메인 글자 주문을 사용하지 않는다.
- 신규·미숙·중요 글자는 직접 작성한다.
- 숙련 보조만 하위 글자 스톡 후보가 된다.
- 소환수는 글자·회로를 직접 작성·배치·연결하지 않는다.
- 조건부 완전 자동 발동을 재도입하지 않는다.
- 수업은 완성 주문 상점이 아니다.
- 현장실습은 정답 주문 재생 시험이 아니다.
- 일상은 전투와 무관한 호감도 메뉴가 아니다.
- 필수 정보를 선택형 상세 대화에만 숨기지 않는다.
- 첫 마법 사용 전에 장문 설명을 강제하지 않는다.
- 수동 작성 경험 없이 자동화를 먼저 공개하지 않는다.
- 의미 기반 글자·직접 작성·상황 변형·세계 변화·학습 순환은 범위 축소 대상이 아니다.
- `무한 자유 조합`, `무엇이든 가능한 마법`, `완전한 손글씨 인식`을 약속하지 않는다.
- 실시간 전투·완성 주문 스톡·소환수 충전을 검증 전 대표 세일즈포인트로 사용하지 않는다.
- 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
- 현재 프로필에서 Godot 구현·Codex Build를 진행하지 않는다.

## 책임 원본 바로가기

| 질문 | 책임 원본 |
|---|---|
| 현재 무엇이 사실인가? | `docs/ACTIVE_CONTEXT.md` |
| Gate 1 전체 기준선은? | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` |
| 게임플레이 Loop는? | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 경험 곡선은? | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` |
| 프로젝트 코어 경계는? | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` |
| 세일즈포인트는? | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` |
| 최신 사용자 결정은? | `docs/planning/DECISION_LOG.md`·`DECISION_LOG_ADDENDUM_2026-07-27I.md` |
| 전체 문서 지도는? | `docs/DOCUMENTATION_MAP.md`·`docs/DESIGN_DOCUMENT_REGISTRY.json` |
| 현재 게이트는? | `docs/DEVELOPMENT_GATES.md` |
| 어떤 Skill을 쓰는가? | `skills/SKILL_REGISTRY.json` |

## 현재 제품 게이트

### Gate 1 — Concept Approval

현재 상태: `IN_PROGRESS / UNVERIFIED`

완료된 방향:

1. 최상위 경험
2. 목표 플레이어와 플레이 상황
3. 선택형 서사 깊이
4. 플레이어 약속
5. 게임플레이 Loop
6. 경험 곡선
7. 프로젝트 코어 경계
8. 세일즈포인트 최대 3개

남은 주요 증거:

1. 벤치마킹·SWOT·VRIO·1인 제작성
2. 마스코트 또는 상징 동반자 역할 후보
3. CORE_POC 위험 가설·대표 구간·통과 기준
4. 적대적 검토
5. 사용자 Gate 1 최종 승인

## 다음 작업

| 우선순위 | 작업 | 완료 기준 |
|---:|---|---|
| 1 | `GM-BENCHMARK-01` | 경쟁군 3개·비교 축·근거·SWOT·VRIO·제작성 판정 |
| 2 | 마스코트·상징 동반자 | 코어를 가리지 않고 전달·관계·플레이를 강화하는 역할 정의 |
| 3 | CORE_POC 계약 | 대표 주문·상황·전투 표현·관찰 지표·실패 기준 정의 |
| 4 | 적대적 검토 | 코어·세일즈포인트·제작성의 반례와 실패 조건 검토 |

`GM-STOCK-01`은 벤치마킹·CORE_POC·모바일 인지 부하 검증 전까지 보류한다.

## 지금 하지 말아야 할 것

- 기능 수를 늘려 코어 불확실성을 덮지 않는다.
- 세부 공격력·체력·충전 수치를 플레이테스트 없이 최종 확정하지 않는다.
- 3년·6학기와 학기 `10+4`를 제작 범위 검증 없이 확정 콘텐츠량으로 사용하지 않는다.
- Godot UI·코드·Scene을 기획 승인 전에 구현하지 않는다.
- 기존 기획 문서를 새 버전명·날짜명 복제본으로 무분별하게 늘리지 않는다.
- 실제 빌드·테스트 없이 구현·성능·접근성 통과를 주장하지 않는다.
