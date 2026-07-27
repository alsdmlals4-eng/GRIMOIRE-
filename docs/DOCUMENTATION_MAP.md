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
→ 이 DOCUMENTATION_MAP.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 현재 책임 원본
→ skills/SKILL_REGISTRY.json
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ 현재 Issue·Goal·Plan·PR
→ 실제 코드·데이터·Scene·Resource·자산·테스트
```

기본 제외:

- 최신 결정 추적에 필요하지 않은 이전 날짜별 Addendum
- 백업·보류·제거 후보
- 전체 Base Skill 본문
- 구현 미착수 상태의 존재하지 않는 Godot 경로

## 2. 프로젝트 허브 책임

| 질문 | 현행 책임 원본 | 갱신 Trigger |
|---|---|---|
| 프로젝트를 어디서 시작하는가? | `START_HERE.md` | 시작 경로·단계·다음 작업 변경 |
| 최상위 작업 규칙은? | `AGENTS.md` | 엔진·플랫폼·권한·보호 범위 변경 |
| Base와 v6 기준은? | `docs/BASE_RULES_VERSION.md`·`docs/contracts/` | Base pin·계약 버전 변경 |
| 현재 무엇이 사실인가? | `docs/ACTIVE_CONTEXT.md`·실제 파일 | 상태·우선순위·구현·검증 변경 |
| 현재 제품 Gate는? | `docs/DEVELOPMENT_GATES.md` | Gate 판정·진입·종료 조건 변경 |
| 전체 기획 정본은 어디인가? | `docs/DESIGN_DOCUMENT_REGISTRY.json` | 문서 생성·이동·책임 변경 |
| 최신 사용자 결정은? | `docs/planning/DECISION_LOG.md` | 방향·범위·규칙 결정 |
| 어떤 Skill을 사용하는가? | `skills/SKILL_REGISTRY.json` | Trigger·mode·Base pin 변경 |
| 프로젝트 경로·보호 계약은? | `skills/PROJECT_BASE_SKILL_ADAPTER.json` | 실제 Godot·자산·검증 경로 변경 |
| 자산 라이선스는? | `docs/ASSET_LICENSE_LEDGER.md` | 외부 자산 조사·채택·교체 |
| 운영체계가 정상인가? | `docs/OPERATING_SYSTEM_HEALTH_REPORT.md` | 설치·마이그레이션·주요 Gate |

## 3. Gate 1 핵심 책임 원본

| 책임 | 현행 원본 | 보조 근거 | 상태 |
|---|---|---|---|
| Gate 1 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | Active Context·Decision Log | `ACTIVE_GATE_1_WORKING_SOURCE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | 수업·현장실습·학교 육성 참조 문서 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | Loop·글자 문법·스톡 참조 문서 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | Loop·경험 곡선·글자·스톡·소환수 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | 코어 경계·경험 곡선·Loop | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| 벤치마킹·SWOT·VRIO·1인 제작성 | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | 기존 벤치마크·공식 외부 출처 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | 최신 Addendum J→F | 활성 |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` | 실제 파일·PR 상태 | 활성 |

## 4. 기존 시스템 참조 원본

Gate 1 재기획 이전의 시스템 문서는 자동 확정하지 않는다.

| 책임 | 참조 원본 | 현재 지위 |
|---|---|---|
| 기존 프로젝트 전체 코어 | `docs/planning/SPELL_GAME_DESIGN.md` | `REFERENCE_CANDIDATE` |
| 전투 코어 | `docs/planning/COMBAT_CORE_SYSTEM.md` | `REFERENCE_CANDIDATE_WITH_PROTECTED_BOUNDARIES` |
| 마법 글자·회로 문법 | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` | `DIRECTION_CONFIRMED` 구성 포함 |
| 메인 글자 성장 | `docs/planning/MAIN_LETTER_LEVEL_SYSTEM.md` | `UNPROVEN` |
| 보조 글자 성장·운용량 | `SUPPORT_LETTER_MASTERY_SYSTEM.md`·`SUPPORT_LETTER_OPERATION_CAPACITY_SYSTEM.md` | 방향·수치 상태 분리 |
| 스톡 | `docs/planning/STOCK_SYSTEM.md` | `REFERENCE_CANDIDATE_WITH_PROTECTED_BOUNDARIES` |
| 소환수 | `docs/planning/SUMMON_SYSTEM.md` | 책임 경계 확정, 효용 `UNPROVEN` |
| 마나 | `docs/planning/MANA_SYSTEM.md` | `REFERENCE_CANDIDATE` |
| 세계관 | `docs/planning/WORLD_SETTING_CONCEPT.md` | `REFERENCE_CANDIDATE` |
| 학교 육성 | `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md` | `REFERENCE_CANDIDATE` |
| 선택형 서사 | `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md` | 방향 재승인, 세부 `REFERENCE_CANDIDATE` |
| 기존 회로 벤치마크 | `docs/planning/BENCHMARK_CIRCUIT_GRAMMAR.md` | `SUPPORTING_EVIDENCE` |
| 기존 학교 벤치마크 | `docs/planning/BENCHMARK_MAGIC_SCHOOL_GROWTH.md` | `SUPPORTING_EVIDENCE` |
| 기존 소환수 벤치마크 | `docs/planning/BENCHMARK_SUMMON_SYSTEM.md` | `SUPPORTING_EVIDENCE` |

세부 목록과 발행 정책은 `docs/DESIGN_DOCUMENT_REGISTRY.json`을 따른다.

## 5. 질문별 최소 읽기

| 작업 | 먼저 읽을 원본 | 필수 Skill·mode | 후속 검증 |
|---|---|---|---|
| 새 요청 접수 | START_HERE·Active Context·Decision Log | `managing-project-intake-and-work-contract: route/contract` | 실행 계약·범위 |
| 플레이어 약속·코어 논의 | V6 기준선·Decision Log | `identifying-project-core` → `analyzing-and-refining-game-concepts` | 반례·사용자 승인 |
| Loop 논의 | `GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `analyzing-and-refining-game-concepts: structure/analyze` | Loop 간 데이터 흐름 |
| 초반 경험·온보딩 | `GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `analyzing-and-refining-game-concepts: sharpen/structure` | 첫 5분·첫 실습·첫 자동화 테스트 |
| 프로젝트 코어 경계 | `GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `identifying-project-core` → `establishing-project-core` 승인 전 분석 | 제거 테스트·비타협 조건 |
| 세일즈포인트 | `GATE_1_SALES_POINTS_SYSTEM.md` | `analyzing-and-refining-game-concepts: sharpen` | 한 문장·세 장면 이해도 |
| 벤치마킹·SWOT·VRIO | `GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | research → compare → adversarial analysis | 최신 공식 근거·시장·제작성 |
| 마스코트·상징 동반자 | 코어 경계·세일즈포인트·벤치마크·SUMMON | `brainstorming` → 역할 경계 분석 | 코어 강화·범위·비대체성 |
| `GM-STOCK-01` | STOCK_SYSTEM·CAPACITY·CHARGE_TIME·COMBAT_CORE | `analyzing-and-refining-game-concepts: structure/analyze` | CORE_POC 이후 |
| CORE_POC | 승인 코어·Loop·경험 곡선·벤치마크·전투·글자 | `analyzing-and-refining-game-concepts: poc-contract` | 가설·구간·지표·실패 기준 |
| 버티컬 슬라이스 | 승인 코어·CORE_POC 결과·Development Gates | `designing-vertical-slices` | quality bar·pipeline·playtest |
| UI·터치 작성 | 전투·글자·스톡·접근성 요구 | 설계 후 `auditing-and-refining-ui-art` | 화면·입력·접근성 |
| Godot 구현 | 승인 설계·Codex Plan·데이터 계약 | Superpowers Plan→TDD→review→verification | 정적·런타임·회귀 |
| 검수 | 계약·diff·실제 파일 | `running-adversarial-review-and-refinement` → `reviewing-and-validating-project-changes` | 증거 보고 |

## 6. 스톡 책임 분해

`docs/planning/STOCK_SYSTEM.md`가 스톡의 상위 참조 원본이다.

| 하위 책임 | 문서 |
|---|---|
| 준비 용량 | `docs/planning/STOCK_CAPACITY_SYSTEM.md` |
| 충전시간 | `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md` |
| 충전 대상 전환 | `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` |
| 피격 중단 | `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md` |
| 상태이상 | `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` |
| 과거 자동 스펠 해석 | `docs/planning/AUTO_SPELL_SYSTEM.md` — 최신 결정과 충돌 시 Decision Log 우선 |

## 7. 세계관·육성 책임 분해

| 하위 책임 | 문서 |
|---|---|
| 세계관 중심 구조 | `docs/planning/WORLD_SETTING_CONCEPT.md` |
| 주인공 배경 | `docs/planning/WORLD_PROTAGONIST_BACKGROUND.md` |
| 학교 성장 | `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md` |
| 학년 구조 | `docs/planning/WORLD_ACADEMIC_YEAR_STRUCTURE.md` |
| 학기 일정 | `docs/planning/WORLD_SEMESTER_SCHEDULE_SYSTEM.md` |
| 마법 수업 | `docs/planning/WORLD_MAGIC_CURRICULUM_SYSTEM.md` |
| 현장실습 | `docs/planning/WORLD_FIELD_PRACTICUM_SYSTEM.md` |

## 8. 상태와 수명주기

| 구분 | 기본 읽기 | 처리 |
|---|---|---|
| `ACTIVE/CURRENT` | 포함 | 현재 책임 원본으로 사용 |
| `SUPPORTING_EVIDENCE` | 관련 작업만 | 정본과 대조 |
| `REFERENCE_CANDIDATE` | 관련 가설 추출 시 | 최신 Gate 1 결정으로 재검토 |
| `SUPERSEDED/REJECTED` | 충돌·이력 조사만 | 재도입 금지 또는 재승인 필요 |
| `DEFERRED/HOLD` | 제외 | 재개 조건과 승인 확인 |
| 날짜별 Addendum | 최신 결정 추적 시 | Decision Log 통합 상태 확인 |

## 9. 발행·파생본

현재 발행 정책은 `source_only`다.

- PDF: `NOT_BUILT`
- DOCX: `NOT_BUILT`
- Publication Manifest: `NOT_INSTALLED`
- 대시보드: `NOT_BUILT`

## 10. 실제 파일·검증 상태

- Godot `project.godot`: 없음
- `.gd`, `.tscn`, `.tres`, `.res`: 없음 또는 `UNVERIFIED`
- 자동 테스트: 없음
- 런타임 빌드: 없음
- 모바일 실기기 검증: `NOT_RUN`
- 터치 입력 정확도·피로도: `NOT_RUN`
- 시장·사용자 이해도 검증: `NOT_RUN`
- 저장·복귀·접근성·성능·발열·배터리: `NOT_RUN`

기획 문서 존재를 구현 또는 검증 완료로 표시하지 않는다.
