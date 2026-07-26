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

- 날짜별 Decision Addendum 중 최신 결정 추적에 필요하지 않은 이전 기록
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
| 현재 제품 게이트는? | `docs/DEVELOPMENT_GATES.md` | Gate 판정·진입·종료 조건 변경 |
| 전체 기획 정본은 어디인가? | `docs/DESIGN_DOCUMENT_REGISTRY.json` | 문서 생성·이동·책임 변경 |
| 최신 사용자 결정은? | `docs/planning/DECISION_LOG.md` | 방향·범위·규칙 결정 |
| 어떤 Skill을 사용하는가? | `skills/SKILL_REGISTRY.json` | Trigger·mode·Base pin 변경 |
| 프로젝트 경로·보호 계약은? | `skills/PROJECT_BASE_SKILL_ADAPTER.json` | 실제 Godot·자산·검증 경로 변경 |
| 자산 라이선스는? | `docs/ASSET_LICENSE_LEDGER.md` | 외부 자산 조사·채택·교체 |
| 운영체계가 정상인가? | `docs/OPERATING_SYSTEM_HEALTH_REPORT.md` | 설치·마이그레이션·주요 Gate |

## 3. 핵심 책임 원본

| 책임 | 현행 원본 | 보조 근거 | 상태 |
|---|---|---|---|
| 프로젝트 전체 코어 | `docs/planning/SPELL_GAME_DESIGN.md` | `docs/ACTIVE_CONTEXT.md` | `CORE_CANDIDATE` |
| 전투 코어 | `docs/planning/COMBAT_CORE_SYSTEM.md` | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27D.md` | `DIRECTION_CONFIRMED` 구성 포함 |
| 마법 글자·회로 문법 | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` | `docs/planning/CIRCUIT_SYSTEM.md` | 활성 |
| 메인 글자 성장 | `docs/planning/MAIN_LETTER_LEVEL_SYSTEM.md` | `docs/planning/MAIN_LETTER_SPECIALIZATION_SYSTEM.md` | 활성 |
| 보조 글자 성장·운용량 | `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md` | `docs/planning/SUPPORT_LETTER_OPERATION_CAPACITY_SYSTEM.md` | 활성 |
| 스톡 | `docs/planning/STOCK_SYSTEM.md` | 용량·충전·전환·피격·상태이상 문서 | 활성 |
| 소환수 | `docs/planning/SUMMON_SYSTEM.md` | `docs/planning/BENCHMARK_SUMMON_SYSTEM.md` | 활성 |
| 마나 | `docs/planning/MANA_SYSTEM.md` | 전투 코어 | 활성 |
| 세계관 | `docs/planning/WORLD_SETTING_CONCEPT.md` | 주인공·학교·학년·학기 문서 | 활성 |
| 학교 육성 | `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md` | 수업·현장실습·학년·학기 문서 | 활성 |
| 선택형 서사 | `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md` | 세계관·일정 문서 | 활성 |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | 최신 Addendum D | 활성 |
| 벤치마킹 | 개별 `BENCHMARK_*.md` | 외부 근거 필요 시 재검증 | 보조 근거 |

세부 목록과 발행 정책은 `docs/DESIGN_DOCUMENT_REGISTRY.json`을 따른다.

## 4. 질문별 최소 읽기

| 작업 | 먼저 읽을 원본 | 필수 Skill·mode | 후속 검증 |
|---|---|---|---|
| 새 요청 접수 | START_HERE·Active Context·Decision Log | `managing-project-intake-and-work-contract: route/contract` | 실행 계약·범위 |
| 프로젝트 코어 논의 | SPELL_GAME_DESIGN·COMBAT_CORE·Decision Log | `identifying-project-core` → `analyzing-and-refining-game-concepts` → 승인 시 `establishing-project-core` | 반례·사용자 승인 |
| `GM-STOCK-01` | STOCK_SYSTEM·CAPACITY·CHARGE_TIME·COMBAT_CORE | `analyzing-and-refining-game-concepts: structure/analyze` | 플레이어 경험·초기값 상태 |
| CORE_POC | 프로젝트 코어·전투·글자·스톡·소환수 | `analyzing-and-refining-game-concepts: poc-contract` | 가설·구간·지표·실패 기준 |
| 버티컬 슬라이스 | 승인 코어·CORE_POC 결과·Development Gates | `designing-vertical-slices` | quality bar·pipeline·playtest |
| UI·터치 작성 | 전투·글자·스톡·접근성 요구 | 설계 후 `auditing-and-refining-ui-art` | 화면·입력·접근성 |
| Godot 자산·플러그인 | 필요 기능·UI·아트 역할 | `evaluating-godot-assets-and-plugins-before-creation` | 라이선스·기술 Trial |
| Godot 구현 | 승인 설계·Codex Plan·데이터 계약 | Superpowers Plan→TDD→review→verification | 정적·런타임·회귀 |
| 구조·문서 변경 | 이 Map·Registry·영향 원본 | `managing-game-project-operating-system`·`managing-design-documents` | 참조 최신성·콜드 스타트 |
| 검수 | 계약·diff·실제 파일 | `running-adversarial-review-and-refinement` → `reviewing-and-validating-project-changes` | 증거 보고 |

## 5. 스톡 책임 분해

`docs/planning/STOCK_SYSTEM.md`가 스톡의 상위 책임 원본이다. 다음 문서는 하위 규칙을 담당한다.

| 하위 책임 | 문서 |
|---|---|
| 준비 용량 | `docs/planning/STOCK_CAPACITY_SYSTEM.md` |
| 충전시간 | `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md` |
| 충전 대상 전환 | `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` |
| 피격 중단 | `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md` |
| 상태이상 | `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` |
| 과거 자동 스펠 해석 | `docs/planning/AUTO_SPELL_SYSTEM.md` — 현재 스톡 결정과 충돌 시 Decision Log 우선 |

같은 질문을 여러 문서가 다르게 답하면 최신 사용자 결정, Decision Log, 상위 책임 원본 순서로 판정하고 구형 해석을 갱신한다.

## 6. 세계관·육성 책임 분해

| 하위 책임 | 문서 |
|---|---|
| 세계관 중심 구조 | `docs/planning/WORLD_SETTING_CONCEPT.md` |
| 주인공 배경 | `docs/planning/WORLD_PROTAGONIST_BACKGROUND.md` |
| 학교 성장 | `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md` |
| 학년 구조 | `docs/planning/WORLD_ACADEMIC_YEAR_STRUCTURE.md` |
| 학기 일정 | `docs/planning/WORLD_SEMESTER_SCHEDULE_SYSTEM.md` |
| 마법 수업 | `docs/planning/WORLD_MAGIC_CURRICULUM_SYSTEM.md` |
| 현장실습 | `docs/planning/WORLD_FIELD_PRACTICUM_SYSTEM.md` |

## 7. 상태와 수명주기

| 구분 | 기본 읽기 | 처리 |
|---|---|---|
| `ACTIVE/CURRENT` | 포함 | 현재 책임 원본으로 사용 |
| `SUPPORTING_EVIDENCE` | 관련 작업만 | 정본과 대조 |
| `SUPERSEDED/REJECTED` | 충돌·이력 조사만 | 재도입 금지 또는 재승인 필요 |
| `DEFERRED/HOLD` | 제외 | 재개 조건과 승인 확인 |
| 날짜별 Addendum | 최신 결정 추적 시 | Decision Log 통합 상태 확인 |

날짜 접미사가 있다는 이유만으로 파일을 삭제하지 않는다. 레거시 정리는 `governing-legacy-retention-and-archives`와 사용자 승인 후 별도 작업으로 수행한다.

## 8. 발행·파생본

현재 발행 정책은 `source_only`다.

- PDF: `NOT_BUILT`
- DOCX: `NOT_BUILT`
- Publication Manifest: `NOT_INSTALLED`
- 대시보드: `NOT_BUILT`

Concept Gate 또는 외부 공유 시점에 `PUBLICATION_PROFILE`로 별도 작업한다. 발행본은 Markdown·JSON 정본을 대체하지 않는다.

## 9. 실제 파일·검증 상태

- Godot `project.godot`: 없음
- `.gd`, `.tscn`, `.tres`, `.res`: 없음 또는 `UNVERIFIED`
- 자동 테스트: 없음
- 런타임 빌드: 없음
- 모바일 실기기 검증: `NOT_RUN`
- 저장·복귀: `NOT_RUN`
- 접근성·성능·발열·배터리: `NOT_RUN`

기획 문서 존재를 구현 또는 검증 완료로 표시하지 않는다.

## 10. 작업 종료 동기화

다음 중 하나가 바뀌면 관련 항목을 함께 갱신한다.

- 코어·보호 결정 → 책임 원본 + Decision Log + Active Context + START_HERE
- 제품 단계·게이트 → Development Gates + Active Context + START_HERE
- 문서 경로·책임 → Design Registry + Documentation Map + 참조 소비자
- Skill·Base pin → Skill Registry + Adapter + Base Rules Version
- 구현 상태 → 실제 파일·테스트 + Active Context + Gate 증거
- 외부 자산 → Asset License Ledger + 적용 책임 원본

## 11. 콜드 스타트 검수

새 작업자는 10분 안에 다음을 찾아야 한다.

- 플레이어 약속·뾰족한 재미·Core Loop 후보
- 현재 확정·후보·미검증 상태
- 보호 결정과 금지 방향
- 다음 결정 `GM-STOCK-01`
- Concept Gate의 남은 증거
- 현재 요청에 필요한 최소 Skill·mode
- 실제 구현과 테스트가 아직 없다는 사실
