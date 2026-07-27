# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정, 다음 작업과 Skill route를 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트명 | `스펠` (임시) |
| 플레이어 약속 | 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG |
| 주 경험 | 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계·발견하는 지적 마법 판타지 |
| 기본 Loop | 수업→교내 연습→일상→현장실습→복귀·정리→다음 학습 |
| 일정 방식 | 고정 핵심 사건 + 자유 일정 |
| 장르·플랫폼 | 집중형 모바일 마법학교 RPG / Android·Google Play |
| 기본 세션 목표 | 약 10~15분, 수업·연습·현장실습·일상 중 하나를 중심으로 완결 |
| 엔진 | Godot, 버전·렌더러 `UNVERIFIED` |
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 코어 상태 | `CORE_CANDIDATE` |
| 구현 상태 | `NOT_STARTED` |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-CURVE-01` — 첫 5분부터 첫 숙련 자동화까지의 경험 곡선 |
| 다음 제품 증거 | 경험 곡선·코어 경계·세일즈포인트·CORE_POC 계약 |
| 가장 큰 위험 | 모바일 실시간 전투에서 직접 작성·스톡·소환수·대상 판단이 조합 발견을 강화하는지 미검증 |
| Base 기준 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |
| 작업 계약 | v6 실행문·마스터 참고 계약 |

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

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

상태: `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1`

## 확정된 게임플레이 Loop

상태: `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1`

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

핵심 문장:

> 수업에서 알고, 연습에서 할 수 있게 되고, 실전에서 다르게 써 보며, 일상에서 그 경험의 관계와 의미가 누적된다.

### Loop 책임 원본

- `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`

### 일정 구조

- 고정 핵심 사건: 학기 시작, 필수 수업, 중간 실습, 학기 핵심 실습, 시험·평가
- 자유 일정: 선택 수업, 교내 연습, 연구, 실습 준비·조사, 일상·관계, 소환수 교감, 휴식·정비

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
| 직접 작성 | 신규·미숙 글자, 핵심 판단, 즉석 변형 | `AMPLIFY` |
| 하위 글자 스톡 | 숙련 글자 하나의 반복 자동 배치·연결 | `SUPPORT` |
| 완성 주문 스톡 | 제한된 긴급 대응과 준비 전술 | `SUPPORT_WITH_RISK` |
| 소환수 | 전투·수호·지정 스톡 생산·충전 지원 | 경계 확정, 효용 `UNPROVEN` |

스톡과 소환수는 주문 설계 판단을 대체하지 않는다.

## 현재 상태

| 구분 | 상태 | 책임 원본·증거 |
|---|---|---|
| 최상위 경험 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 목표 플레이어 | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 선택형 서사 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 플레이어 약속 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | `V6_CONCEPT_REBASE_BASELINE.md` |
| 게임플레이 Loop | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | `GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 프로젝트 코어 전체 | `CORE_CANDIDATE` | Gate 1 진행 중 |
| 기존 세부 시스템 | `REFERENCE_CANDIDATE`·`UNPROVEN`·`BALANCE_TUNING_BACKLOG` | `DESIGN_DOCUMENT_REGISTRY.json` |
| 구현 | `NOT_STARTED` | Godot 프로젝트·코드·Scene 없음 |
| 런타임 검증 | `NOT_RUN` | 빌드 없음 |

## 보호할 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`
- 복수 메인 글자 주문 금지
- 신규·미숙 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 소환수의 글자·회로 직접 작성 금지
- 소환수 보조 묶음 자동 연결 재도입 금지
- 조건부 완전 자동 발동 재도입 금지
- 수업은 완성 주문 상점이 아님
- 현장실습은 정답 주문 재생 시험이 아님
- 일상은 전투와 무관한 호감도 메뉴가 아님
- 자유 일정은 필수 진행을 영구 차단하지 않음
- 필수 정보를 선택형 상세 대화에만 숨기지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지
- 현재 프로필에서 Godot 구현·Codex Build 금지
- 기획 브랜치에 구현 산출물 혼입 금지

세부 근거는 `docs/ACTIVE_CONTEXT.md`와 `docs/planning/DECISION_LOG.md`를 따른다.

## 책임 원본 바로가기

| 질문 | 책임 원본 |
|---|---|
| 현재 무엇이 사실인가? | `docs/ACTIVE_CONTEXT.md` |
| Gate 1 전체 기준선은? | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` |
| 게임플레이 Loop는? | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 최신 사용자 결정은? | `docs/planning/DECISION_LOG.md`·`docs/planning/DECISION_LOG_ADDENDUM_2026-07-27F.md` |
| 마법 글자·회로 문법은? | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` — 참조 후보 |
| 전투·스톡·소환수는? | 해당 시스템 문서 — 참조 후보·미검증 상태 확인 |
| 세계관·학교 육성은? | 학교·학년·학기·수업·현장실습 문서 — 참조 후보 |
| 전체 문서 지도는? | `docs/DOCUMENTATION_MAP.md`·`docs/DESIGN_DOCUMENT_REGISTRY.json` |
| 현재 게이트는? | `docs/DEVELOPMENT_GATES.md` |
| 어떤 Skill을 쓰는가? | `skills/SKILL_REGISTRY.json` |
| Base·v6 기준은? | `docs/BASE_RULES_VERSION.md`·`docs/contracts/` |

## 현재 제품 게이트

### Gate 1 — Concept Approval

현재 상태: `IN_PROGRESS`

완료된 항목:

1. 최상위 경험 방향
2. 목표 플레이어와 플레이 상황
3. 선택형 서사 깊이
4. 플레이어 약속
5. Micro·Combat·Session·Semester Loop 구조

남은 주요 증거:

1. 첫 5분부터 장기 성장까지의 경험 곡선
2. 프로젝트 코어와 변경 가능한 외피
3. 세일즈포인트 최대 3개
4. 벤치마킹·SWOT·VRIO·1인 제작성 재검증
5. 마스코트 또는 상징 동반자 역할 후보
6. CORE_POC 위험 가설·대표 구간·통과 기준
7. 적대적 검토와 사용자 Gate 1 승인

코어 승인 전 `designing-vertical-slices`의 본 계약으로 넘어가지 않는다.

## 다음 작업

| 우선순위 | 작업 | 완료 기준 |
|---:|---|---|
| 1 | `GM-CURVE-01` | 첫 5분·첫 수업·첫 주문 설계·첫 현장실습·첫 발견·첫 숙련 자동화의 순서와 감정 정의 |
| 2 | 프로젝트 코어 경계 | 코어·지원·변경 가능한 외피·비타협 조건 승인 |
| 3 | 세일즈포인트·제작성 | 최대 3개 강점과 1인 개발 범위 검증 |
| 4 | CORE_POC 계약 | 대표 주문·적·전투 구간·관찰 지표·실패 기준 정의 |

`GM-STOCK-01`은 경험 곡선·CORE_POC·모바일 인지 부하 검증 전까지 보류한다.

## 지금 하지 말아야 할 것

- 기능 수를 늘려 코어 불확실성을 덮지 않는다.
- 세부 공격력·체력·충전 수치를 플레이테스트 없이 최종 확정하지 않는다.
- 3년·6학기와 학기 `10+4`를 제작 범위 검증 없이 확정 콘텐츠량으로 사용하지 않는다.
- Godot UI·코드·Scene을 기획 승인 전에 구현하지 않는다.
- 에셋 검색 전에 화면 목적·정보 위계·입력 흐름을 정의한다.
- 기존 기획 문서를 새 버전명·날짜명 복제본으로 만들지 않는다.
- 실제 빌드·테스트 없이 구현·성능·접근성 통과를 주장하지 않는다.

## 콜드 스타트 확인

이 문서와 연결된 원본만으로 다음을 답할 수 있어야 한다.

- 플레이어에게 약속한 경험은 무엇인가?
- 수업·연습·실전·일상은 어떻게 순환하는가?
- 현재 확정·후보·미검증 상태는 무엇인가?
- 무엇을 변경하면 안 되는가?
- 다음 결정과 제품 게이트는 무엇인가?
- 구현·런타임·플레이테스트에서 무엇이 미검증인가?
