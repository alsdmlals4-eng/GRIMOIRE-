# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법** 프로젝트의 최상위 운영 규칙이다. 승인된 게임 코어와 Vertical Slice를 보존하면서 Base v9.3 및 `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`를 프로젝트에 적용한다.

## 1. 프로젝트 바인딩

- 프로젝트명: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 기준 브랜치: `main`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- 1차 출시 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 제품 단계: `DEMO_FIRST_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 다음 제품 차단 결정: `ART-STYLE-01`
- 구현 전 추가 필수 계약: `PLATFORM-INPUT-01`

첨부된 Godot Linux 실행 파일은 엔진 버전 확인 자료다. 저장소의 프로젝트 파일이나 배포 자산으로 간주하거나 커밋하지 않는다.

## 2. 우선순위

1. 사용자의 최신 명시적 요청과 승인
2. 이 `AGENTS.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `START_HERE.md`
5. `docs/ACTIVE_CONTEXT.md`
6. `docs/planning/DECISION_LOG.md`와 최신 Addendum
7. 주제별 단일 책임 원본
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`
10. `docs/DOCUMENTATION_MAP.md`
11. `skills/PROJECT_BASE_ADAPTER.json`과 `skills/PROJECT_SKILL_SNAPSHOT.json`
12. 실제 코드·Scene·Resource·데이터·자산·테스트
13. 프로젝트가 고정한 Base release/evidence commit
14. v6·v8 호환 자료, 과거 대화, 외부 AI 결과와 추정

충돌 시 최신 사용자 결정과 최신 책임 원본이 우선한다. 생성 이미지·Sheet 단독 편집·외부 AI 결과는 승인 상태가 명시되지 않으면 제안 또는 검수 입력이다.

## 3. Base와 Vertical Slice 실행 계약

- Base 저장소: `alsdmlals4-eng/Base`
- Base 릴리스: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `Base:templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- 프로젝트 적용 원본: `skills/PROJECT_BASE_ADAPTER.json`
- 생성 라우팅 뷰: `skills/PROJECT_SKILL_SNAPSHOT.json`
- 프로젝트 라우터: `.agents/skills/grimoire-workflow-router/SKILL.md`

v6·v8 계약은 `LEGACY_REFERENCE_INPUT` 또는 `SUPERSEDED_COMPATIBILITY`다. 삭제하지 않지만 현재 실행 권한으로 사용하지 않는다. Base 공용 Skill 본문은 프로젝트에 복제하지 않는다.

## 4. 질문 전 필수 읽기

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md와 최신 Addendum
→ 주제별 단일 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
→ skills/PROJECT_SKILL_SNAPSHOT.json
```

질문 가능한 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자의 명시적 재개방

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정을 기억 확인 목적으로 다시 묻지 않는다. 저장소·Sheet·실제 파일로 확인할 수 있는 사실을 사용자에게 전가하지 않는다.

## 5. 승인된 플레이어 약속과 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협 코어:

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→평가·표현→현장실습→발견·기록→다음 학습 순환

## 6. 승인된 Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 첫 완주 목표 `45~50분`, 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 `CORE_POC` 재도입 금지

## 7. 승인된 화면·캐릭터·전투·소환수

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

```text
메인 동반 소환수
= 원소·정령 중심
= Vertical Slice는 초기 형상 1개
= 장기 4단계 성장·이전 형상 선택·탑승은 후행

전투 보조 소환수
= 위험·전투 호출형 원소 정령
= Vertical Slice는 수호 또는 견제 1체
```

기존 `같은 필드 화면에서 전투`는 `SUPERSEDED`다. 소환수는 글자 작성·조합 판단·정답을 대행하지 않는다.

## 8. 플랫폼 정책

- PC판을 먼저 설계·검증·출시한다.
- 모바일판은 PC Vertical Slice와 데이터 계약이 안정된 뒤 별도 입력·레이아웃·성능 검증을 거쳐 진행한다.
- PC와 모바일은 프로젝트 코어·게임 규칙·콘텐츠 의미를 공유한다.
- 마우스·키보드 또는 펜 입력과 터치 입력의 차이는 `PLATFORM-INPUT-01`에서 검증한다.
- 기존 모바일 터치 연구는 폐기하지 않고 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`로 보존한다.
- PC 우선 결정이 자동으로 자유 이동형 대형 맵, 복잡한 단축키, 실시간 액션 중심 전투를 승인하지 않는다.

## 9. Work Mode와 Skill 라우팅

비정상적으로 모든 Skill을 기본 로드하지 않는다. 현재 요청과 Registry trigger가 일치하는 최소 Skill·Skill Mode만 사용한다.

- 요청·계약: `managing-project-intake-and-work-contract`
- 운영체계: `managing-game-project-operating-system`
- 기획 문서: `managing-design-documents`
- 게임 코어·근거: `analyzing-and-refining-game-concepts`
- Vertical Slice: `designing-vertical-slices`
- 적대적 검토: `running-adversarial-review-and-refinement`
- 변경 검증: `reviewing-and-validating-project-changes`
- 정본 최신성: `auditing-canonical-reference-freshness`
- 컨텍스트·인계: `maintaining-project-context-and-handoff`

프로젝트 전용 Skill:

- `art-style-decision-gate`
- `magic-writing-recovery`

Skill 파일을 읽은 것과 실제 절차를 실행한 것을 구분하고, 작업 종료 시 사용 이유·결과·미검증을 보고한다.

## 10. 현재 권한

`PLANNING_ONLY_PROFILE`에서 허용:

- 기획·벤치마킹·시스템·데이터·UX 설계
- Decision Log·Registry·Issue·Plan·Draft PR 정리
- Art Style 비교용 소수 시각 자료
- Art Bible·Asset Specification·Audio Direction 설계
- PC 입력 계약과 후속 모바일 적응 계획

금지:

- Godot 코드·Scene·Resource·게임 데이터 구현
- Codex Build 실행
- 구현·런타임·PC·모바일·사람 검증 완료 주장
- 사용자 승인 없는 제품 범위·게이트·프로필 전환
- 기본 브랜치 직접 수정
- 사용자 검토 없이 PR 병합

## 11. Google Sheets

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 역할: `USER_FACING_GDD_WORKSPACE`
- GitHub에 없는 편집: `PROPOSED_SHEET_CHANGE`
- 쓰기 시점: 관련 PR이 병합된 뒤
- 쓰기 범위: 계약된 tab·range만
- 완료 판정: 병합된 main과 Sheet를 모두 재조회한 뒤에만 `SYNCED`

Sheet는 독립 정본이 아니며, 실제 구현·테스트 증거를 대체하지 않는다.

## 12. 변경·검증·종료

- 기획 변경은 책임 원본·Decision Log·Active Context·현재 확정 스냅샷을 같은 작업 단위에서 갱신한다.
- 이전 결정과 충돌하면 `SUPERSEDED`, `REJECTED`, `LATEST_OVERRIDE`를 기록한다.
- 기획 PR과 구현 PR을 분리한다.
- 제품 파일이 없는 현재 단계에서는 운영 계약·문서·JSON·라우팅·Sheet 동기화만 검증한다.
- 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`다.

작업 종료 전 확인:

1. 단일 책임 원본과 Registry 연결
2. stale reference·중복 책임·누락
3. 결정·상태·플랫폼·프로필 일치
4. Base release/evidence pin과 Registry hash
5. PR diff와 승인 범위
6. 새 작업자의 콜드 스타트
7. 프로젝트 전용 유지와 Base 승격 후보 분리
8. 실제 Commit·PR·Sheet·테스트 상태 보고
