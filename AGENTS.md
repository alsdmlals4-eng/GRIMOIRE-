# AGENTS.md

이 파일은 `스펠` 프로젝트의 최상위 작업 규칙이다. Base 공용 절차와 v6 Vertical Slice 계약을 현재 승인 상태에 맞게 적용한다.

## 1. 프로젝트 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 엔진: Godot
- 목표 플랫폼: Android / Google Play
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 기획 브랜치: `gpt/planning-spell-20260725`
- 기획 PR: Draft PR #1
- 다음 차단 결정: `ART-STYLE-01`

## 2. 최상위 연속성 원칙

새 채팅·새 GPT·새 Codex·새 작업자는 과거 대화 없이 저장소만으로 다음을 찾을 수 있어야 한다.

- 플레이어 약속과 `CORE_CONFIRMED`
- Vertical Slice 범위와 보호 결정
- 화면·캐릭터·전투·소환수 확정 방향
- 현재 제품 단계·실행 프로필·Work Mode
- 최신 결정·대체·보류·미검증 상태
- 다음 차단 결정과 검증 요구
- 실제 구현·테스트 상태

같은 책임의 활성 복제본을 만들지 않는다.

## 3. 우선순위

1. 사용자의 최신 명시적 요청과 승인
2. 이 `AGENTS.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `START_HERE.md`
5. `docs/ACTIVE_CONTEXT.md`
6. `docs/planning/DECISION_LOG.md`와 최신 Addendum
7. `docs/DEVELOPMENT_GATES.md`
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`의 책임 원본
9. `docs/DOCUMENTATION_MAP.md`
10. `skills/SKILL_REGISTRY.json`과 프로젝트 어댑터
11. 실제 코드·Scene·Resource·데이터·자산·테스트
12. Base 고정 Commit
13. 과거 대화·외부 AI 결과·추정

충돌 시 최신 사용자 결정과 최신 책임 원본이 우선한다. 생성 이미지와 외부 AI 결과는 승인 상태가 명시되지 않으면 검수 대기 입력이다.

## 4. 질문 전 필수 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md와 최신 Addendum
→ 질문 주제의 단일 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/SKILL_REGISTRY.json
```

### 질문 허용 상태

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자 명시적 재개방

### 질문 금지

- `CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정을 기억 확인 목적으로 다시 선택하게 함
- 저장소 조회로 해결되는 사항을 사용자에게 재질문
- 과거 답변을 찾지 않고 같은 A/B/C 선택지를 반복 제시

위반 상태: `PROCESS_REGRESSION_REASKED_CONFIRMED_DECISION`

## 5. Base와 v6 계약

- Base 저장소: `alsdmlals4-eng/Base`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 버전 기록: `docs/BASE_RULES_VERSION.md`
- v6 축약 실행문: `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- v6 마스터 계약: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`

Base Skill 본문을 프로젝트에 복제하지 않는다.

## 6. 승인된 프로젝트 코어

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

비타협:

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→평가·표현→응용→발견·기록 순환

## 7. 승인된 Vertical Slice

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

- 목표 `45~50분`, 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지

## 8. 승인된 시각·캐릭터·전투

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

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

기존 `같은 필드 화면에서 전투`는 `SUPERSEDED`다.

## 9. 승인된 소환수 방향

```text
메인 동반 소환수
= 원소·정령 중심
= 장기 4단계 성장
= 해금된 이전 형상 선택
= 장기 탑승 기능

전투 보조 소환수
= 전투 호출형 원소 정령
= Vertical Slice는 수호 또는 견제 1체
```

범위 보호:

- Vertical Slice는 메인 초기 형상 1개만 필수
- 메인 2~4단계·형상 선택 UI·탑승은 후행
- 전투 보조 소환수 4역할 전체·성장·탑승은 미확정
- 소환수는 글자 작성·조합 판단·정답을 대행하지 않음

## 10. Skill 라우팅

기능·게임 경험·아트 방향·구조·워크플로 변경은 `managing-project-intake-and-work-contract`로 시작한다.

주요 단계:

- 콘셉트·코어: `analyzing-and-refining-game-concepts`
- 기존 코어 판정: `identifying-project-core`
- 기획 문서: `managing-design-documents`
- Vertical Slice: `designing-vertical-slices`
- 적대적 검토: `running-adversarial-review-and-refinement`
- 통합 검증: `reviewing-and-validating-project-changes`
- 컨텍스트·인계: `maintaining-project-context-and-handoff`
- Godot 자산·플러그인: `evaluating-godot-assets-and-plugins-before-creation`
- 레거시·아카이브: `governing-legacy-retention-and-archives`

Skill 파일을 읽은 것과 절차를 실행한 것을 구분한다.

## 11. 현재 실행 권한

`PLANNING_ONLY_PROFILE`에서 허용:

- 기획·벤치마킹·시스템·데이터 구조 설계
- Decision Ledger·P0~P3·기술 검수안
- Art Style 비교용 소수 이미지
- Art Bible·Asset Specification·Audio Direction 설계
- GitHub 기획 문서와 Draft PR 갱신

금지:

- Godot 코드·Scene·Resource·게임 데이터 구현
- Codex Build 실행
- 구현 완료·런타임 통과 주장
- 사용자 승인 없는 제품 게이트·프로필 전환
- 기본 브랜치 직접 수정과 PR 병합

## 12. 이미지·에셋·사운드

```text
플레이어 경험·역할
→ 현재 확정 결정 확인
→ 승인된 시각 기준
→ 그림체 후보 비교
→ Art Bible
→ Asset Specification
→ 라이선스·출처 검토
→ 사용자 승인 후 생성·편집
→ 실제 런타임 검수
```

### 이미지 관련 사용자 규칙

- 이미지로 이해하는 선택은 가능한 경우 이미지로 보여 줌
- 생성 이미지는 자동 시스템 확정·최종 자산이 아님
- 사용자 승인 두 번째 인게임 구성 이미지는 `USER_APPROVED_VISUAL_REFERENCE`
- 이미지 생성 실패 시 동일 요청 재입력을 기본 해결책으로 사용하지 않음
- 기존 브리프를 보존하고 한글 장문·복합 UI·한 장의 요소 수를 줄여 재시도
- 실패한 생성물을 완료로 주장하지 않음

상태:

```text
CONCEPT_EXPLORATION
VISUAL_REFERENCE_CANDIDATE
USER_APPROVED_VISUAL_REFERENCE
ART_BIBLE_APPROVED
RUNTIME_ASSET_APPROVED
```

자산 출처·도구·파생 관계·승인은 `docs/ASSET_LICENSE_LEDGER.md`에 기록한다.

## 13. 기획·수치 정책

- 기능보다 플레이어 경험·행동·고민·감정·피드백을 먼저 정의
- 모든 기능은 `WHY → HOW → WHAT` 추적성 보유
- `REMOVE → REDUCE → MERGE → CLARIFY → FEEDBACK 강화 → ADD` 순으로 검토
- 미검증 수치는 `INITIAL_TEST_VALUE`, `TUNING_RANGE`, `PLAYTEST_TUNING_REQUIRED`
- 빌드·표본·관찰 없이 `VALIDATED` 표시 금지

## 14. 변경·GitHub 규칙

- 기획 변경 시 책임 원본·Decision Log·Active Context·현재 확정 스냅샷을 같은 작업 단위에서 갱신
- 이전 결정과 충돌하면 `SUPERSEDED`, `REJECTED`, `LATEST_OVERRIDE` 추적
- 기획 PR과 구현 PR 분리
- Draft PR 유지, 사용자 요청 없이 병합 금지
- 변경 이유·연결 영향·후속 동기화·미실행 검증 보고

## 15. 검증

문서·구조:

- 경로 존재
- Markdown·JSON 문법
- Registry와 책임 원본 연결
- stale reference·중복 책임
- 결정·상태·프로필 일치
- 확정 결정 재질문 여부
- PR diff와 승인 범위
- 새 작업자 콜드 스타트

Godot 구현 이후:

- 정적 검사·자동 테스트·런타임
- 터치 입력·화면비·백그라운드 복귀
- 저장·불러오기
- 접근성·성능·배터리·발열
- 회귀·실기기 검증

실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`다.

## 16. 작업 종료

1. 프로젝트 결정을 책임 원본에 반영
2. `CURRENT_CONFIRMED_DECISIONS.md`와 `ACTIVE_CONTEXT.md` 최신화
3. Decision Log·Documentation Map·Design Registry·Skill Registry 연결 확인
4. Requirement·Skill·Artifact Coverage 감사
5. 프로젝트 전용 유지와 Base 승격 후보 분리
6. 실제 Commit·PR 상태와 미실행 검증 보고
