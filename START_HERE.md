# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정, 다음 작업과 Skill route를 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트명 | `스펠` (임시) |
| 한 줄 약속 | 마법학교 학생이 되어 메인 글자와 핵심 변형을 직접 작성하고, 숙련 반복 보조는 스톡으로 사용하며, 소환수의 충전을 지휘한다. |
| 핵심 행동 | 상황 판단, 글자 직접 작성, 스톡 삽입·소비, 소환수 충전 대상 지정 |
| 뾰족한 재미 후보 | 직접 작성의 손맛 + 주문 조합 발견 + 스톡 편성·충전 우선순위 판단 |
| 장르·플랫폼 | 모바일 실시간 마법 전투·육성 / Android·Google Play |
| 엔진 | Godot, 버전·렌더러 `UNVERIFIED` |
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 코어 상태 | `CORE_CANDIDATE` |
| 구현 상태 | 미착수 |
| 현재 브랜치 | `gpt/planning-spell-20260725` |
| 현재 PR | Draft PR #1 |
| 다음 결정 | `GM-STOCK-01` — 1학년 기본 스톡 준비 용량과 초기 편성 |
| 다음 제품 증거 | 프로젝트 코어 승인과 CORE_POC 계약 |
| 가장 큰 위험 | 모바일 터치 작성·스톡 UI가 실제 전투에서 의미 있는 판단과 가독성을 유지하는지 미검증 |
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

## 현재 플레이어 약속

> 플레이어는 메인 글자와 핵심 변형을 직접 작성하고, 숙련된 반복 보조는 스톡으로 삽입하며, 소환수의 충전 지원을 지휘해 더 복잡한 주문을 빠르게 완성한다.

## 전투 코어 후보

```text
상황·위험 인지
→ 메인 글자와 주문 구조 선택
→ 핵심 글자 직접 작성
→ 필요하면 하위 글자 스톡 삽입
→ 또는 완성 주문 스톡 즉시 기동
→ 주문 결과 피드백
→ 소환수가 지정 스톡 충전
→ 다음 조합·발동·충전 우선순위 판단
```

### 책임 경계

| 시스템 | 책임 |
|---|---|
| 직접 작성 | 신규·미숙 글자, 핵심 판단, 즉석 변형 |
| 하위 글자 스톡 | 숙련 글자 하나의 자동 배치·연결 |
| 완성 주문 스톡 | 등록 주문 전체의 즉시 기동 |
| 소환수 | 전투·수호·지정 스톡 생산·충전·동조 |

## 현재 상태

| 구분 | 상태 | 책임 원본·증거 |
|---|---|---|
| 확정 방향 | 메인 1 + 보조 0개 이상, 직접 작성·스톡·소환수 책임 경계, 마법학교 3년 육성 | `docs/planning/DECISION_LOG.md`와 최신 Addendum D |
| 코어 | `CORE_CANDIDATE` | `docs/planning/SPELL_GAME_DESIGN.md` |
| 현재 사실 | `PLANNING_IN_PROGRESS`, 구현 미착수 | `docs/ACTIVE_CONTEXT.md` |
| 구현 | `NOT_STARTED` | Godot 프로젝트·코드·Scene 없음 |
| 런타임 검증 | `NOT_RUN` | 빌드 없음 |
| 운영체계 | Governance foundation 설치 | `docs/OPERATING_SYSTEM_HEALTH_REPORT.md` |
| 다음 작업 | `GM-STOCK-01` 후 Concept Gate·CORE_POC 계약 | `docs/ACTIVE_CONTEXT.md`·`docs/DEVELOPMENT_GATES.md` |

## 보호할 결정

- 복수 메인 글자 주문 금지
- 소환수의 글자·회로 직접 작성 금지
- 소환수 보조 묶음 자동 연결 재도입 금지
- 미발견·미숙련 글자·주문 스톡화 금지
- 조건부 완전 자동 발동 재도입 금지
- 학년 상승만으로 모든 글자 자동 성장 금지
- 1학년 전체를 직접 작성만 하는 긴 튜토리얼로 만들지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지
- 현재 프로필에서 Godot 구현·Codex Build 금지
- 기획 브랜치에 구현 산출물 혼입 금지

세부 근거는 `docs/ACTIVE_CONTEXT.md`와 `docs/planning/DECISION_LOG.md`를 따른다.

## 책임 원본 바로가기

| 질문 | 책임 원본 |
|---|---|
| 현재 무엇이 사실인가? | `docs/ACTIVE_CONTEXT.md` |
| 전체 기획 코어는? | `docs/planning/SPELL_GAME_DESIGN.md` |
| 최신 사용자 결정은? | `docs/planning/DECISION_LOG.md`·`docs/planning/DECISION_LOG_ADDENDUM_2026-07-27D.md` |
| 전투 코어는? | `docs/planning/COMBAT_CORE_SYSTEM.md` |
| 마법 글자·회로 문법은? | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 스톡은? | `docs/planning/STOCK_SYSTEM.md` |
| 소환수는? | `docs/planning/SUMMON_SYSTEM.md` |
| 세계관·학교 육성은? | `docs/planning/WORLD_SETTING_CONCEPT.md`·`docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md` |
| 전체 문서 지도는? | `docs/DOCUMENTATION_MAP.md`·`docs/DESIGN_DOCUMENT_REGISTRY.json` |
| 현재 게이트는? | `docs/DEVELOPMENT_GATES.md` |
| 어떤 Skill을 쓰는가? | `skills/SKILL_REGISTRY.json` |
| Base·v6 기준은? | `docs/BASE_RULES_VERSION.md`·`docs/contracts/` |

## 현재 Skill 경로

```text
Base skills/SKILL_REGISTRY.json Trigger route
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ skills/BASE_SHARED_SKILL_ROUTES.json
→ 현재 작업에 필요한 전문 Skill
```

현재 주요 Skill:

- `managing-project-intake-and-work-contract`
- `analyzing-and-refining-game-concepts`
- `identifying-project-core`
- `establishing-project-core`
- `managing-design-documents`
- `designing-vertical-slices`
- `running-adversarial-review-and-refinement`
- `reviewing-and-validating-project-changes`
- `maintaining-project-context-and-handoff`

## 현재 제품 게이트

### Gate 1 — Concept Approval

현재 상태: `IN_PROGRESS`

필요한 다음 증거:

1. 플레이어 약속·프로젝트 코어·뾰족한 재미 사용자 승인
2. 목표 플레이어와 플레이 상황
3. Core Loop와 경험 곡선
4. 세일즈포인트 최대 3개
5. CORE_POC의 가장 위험한 가설·대표 구간·통과 기준
6. 마스코트 또는 상징 동반자 후보의 실제 역할
7. P0·P1 충돌 해소
8. 버티컬 슬라이스 후보와 포함·제외 범위

코어 승인 전 `designing-vertical-slices`의 본 계약으로 넘어가지 않는다.

## 다음 작업

| 우선순위 | 작업 | 완료 기준 |
|---:|---|---|
| 1 | `GM-STOCK-01` | 1학년 기본 준비 용량과 초기 편성이 플레이어 경험·규칙·튜닝 상태로 정의됨 |
| 2 | Concept Gate 정리 | 코어·뾰족한 재미·Core Loop·세일즈포인트·비타협 조건 승인 |
| 3 | CORE_POC 계약 | 대표 주문·적·전투 구간·관찰 지표·실패 기준 정의 |
| 4 | Vertical Slice 후보 | CORE_POC 이후 대표 통합 데모 범위 제안 |

## 지금 하지 말아야 할 것

- 기능 수를 늘려 코어 불확실성을 덮지 않는다.
- 세부 공격력·체력·충전 수치를 플레이테스트 없이 최종 확정하지 않는다.
- Godot UI·코드·Scene을 기획 승인 전에 구현하지 않는다.
- 에셋 검색 전에 화면 목적·정보 위계·입력 흐름을 정의한다.
- 기존 기획 문서를 새 버전명·날짜명 복제본으로 만들지 않는다.
- 실제 빌드·테스트 없이 구현·성능·접근성 통과를 주장하지 않는다.

## 콜드 스타트 확인

이 문서와 연결된 원본만으로 다음을 답할 수 있어야 한다.

- 이 게임에서 플레이어가 반복하는 핵심 행동과 고민은 무엇인가?
- 현재 확정된 것과 후보 상태인 것은 무엇인가?
- 무엇을 변경하면 안 되는가?
- 다음 결정과 제품 게이트는 무엇인가?
- 현재 요청에 어떤 Skill과 mode가 필요한가?
- 구현·런타임·플레이테스트에서 무엇이 미검증인가?
