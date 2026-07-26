# AGENTS.md

이 파일은 `스펠` 프로젝트의 최상위 작업 규칙이다. Base의 공용 절차와 v6 버티컬 슬라이스 계약을 Spell의 현재 기획·Godot·Android 조건에 맞게 적용한다.

## 1. 프로젝트

- 프로젝트명: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 엔진: Godot
- 목표 플랫폼: Android / Google Play
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 구현 상태: 미착수
- 기획 브랜치: `gpt/planning-spell-20260725`
- 기획 PR: Draft PR #1

## 2. 최상위 연속성 원칙

새 채팅, 새 GPT, 새 Codex와 새 작업자는 과거 대화 없이 저장소만으로 다음을 찾을 수 있어야 한다.

- 플레이어 약속과 프로젝트 코어 후보
- 뾰족한 재미와 Core Loop
- 현재 제품 단계·실행 프로필·Work Mode
- 보호 결정과 금지 방향
- 책임 원본과 최신 결정
- 다음 기획 결정·게이트·검증 요구
- 실제 구현·테스트·미검증 상태

같은 책임의 활성 복제본을 새로 만들지 않는다. 현재 상태는 `docs/ACTIVE_CONTEXT.md`, 결정은 `docs/planning/DECISION_LOG.md`, 문서 라우팅은 `docs/DOCUMENTATION_MAP.md`가 담당한다.

## 3. 우선순위

1. 사용자의 최신 요청과 명시적 승인
2. 이 `AGENTS.md`
3. `docs/BASE_RULES_VERSION.md`와 저장소의 v6 계약
4. `START_HERE.md`
5. `docs/ACTIVE_CONTEXT.md`
6. `docs/DOCUMENTATION_MAP.md`와 `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`에 등록된 책임 원본
8. `skills/SKILL_REGISTRY.json`과 프로젝트 어댑터
9. 현재 Issue·Goal·Plan·Draft PR
10. 실제 코드·Scene·Resource·데이터·자산·테스트
11. Base 원격의 고정 Commit
12. 과거 대화·외부 AI 결과·추정

충돌 시 최신 사용자 결정과 최신 책임 원본이 우선한다. 외부 AI 결과는 검수 대기 입력으로만 취급한다.

## 4. 기본 읽기 순서

```text
AGENTS.md
→ docs/BASE_RULES_VERSION.md
→ START_HERE.md
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

`전부 읽기`는 저장소 전체와 모든 Skill 본문을 무작정 로드한다는 뜻이 아니다. 현재 Trigger에 맞는 최소 충분 Skill과 책임 원본을 단계별로 선택한다.

## 5. Base와 v6 계약

- Base 저장소: `alsdmlals4-eng/Base`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 버전·동기화 기록: `docs/BASE_RULES_VERSION.md`
- v6 축약 실행문: `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- v6 마스터 계약: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`

Base Skill 본문을 프로젝트에 복제하지 않는다.

```text
Base skills/SKILL_REGISTRY.json의 Trigger route
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ skills/BASE_SHARED_SKILL_ROUTES.json
→ 필요한 전문 extension
→ Spell 고유 책임만 프로젝트 전용 Skill
```

## 6. 프로젝트 코어 후보

> 플레이어는 메인 글자와 핵심 변형을 직접 작성하고, 숙련된 반복 보조는 스톡으로 삽입하며, 소환수의 충전 지원을 지휘해 더 복잡한 주문을 빠르게 완성한다.

뾰족한 재미 후보:

```text
상황·위험 인지
→ 메인 글자와 주문 구조 선택
→ 핵심 글자 직접 작성
→ 숙련 보조를 하위 글자 스톡으로 삽입하거나 완성 주문 스톡 사용
→ 주문 결과 확인
→ 소환수가 지정 스톡 충전
→ 다음 조합·발동·충전 우선순위 판단
```

현재는 `CORE_CANDIDATE`이며 사용자 승인 전 `CORE_CONFIRMED`로 변경하지 않는다.

## 7. 보호 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`이다.
- 메인 글자 하나만으로 기본 주문이 성립한다.
- 복수 메인 글자 결합을 허용하지 않는다.
- 신규·미숙 글자와 핵심 변형은 직접 작성 영역이다.
- 숙련 보조 글자만 하위 글자 스톡 후보가 된다.
- 완성 주문 스톡은 등록한 주문 전체를 즉시 기동한다.
- 소환수는 회로판에 글자·선·연결을 직접 작성하지 않는다.
- 소환수에게 보조 묶음을 장착해 자동 연결하는 안을 재도입하지 않는다.
- 소환수의 주문 지원은 지정 스톡 생산·충전·동조로 제한한다.
- 스톡이 없어도 직접 시전 가능하다.
- 소환수가 행동 불능이어도 직접 시전과 이미 준비된 스톡은 유지한다.
- 1학년 첫 학기 안에 직접 작성·스톡·소환수 충전을 모두 경험한다.
- 학년 상승만으로 글자·주문을 자동 지급하지 않는다.
- 선택 대화를 읽지 않아도 메인 진행과 기본 성장에 불이익이 없다.

## 8. 프로젝트 용어

- `DDD`: Digital Dopamine Design. 학기·서사를 축약하는 것이 아니라 행동과 결과 사이 반복 입력을 줄이고 보상을 빠르게 전달하는 원칙이다.
- `마법 글자`: 마법적 의미를 가진 기능 단위.
- `회로`: 글자의 위치·연결·적용 순서를 구성한 문법.
- `주문`: 메인 글자 1개와 보조 글자 0개 이상의 조합.
- `하위 글자 스톡`: 숙련 글자 하나의 자동 배치·연결 자원.
- `완성 주문 스톡`: 등록 주문 전체의 즉시 기동 자원.
- `CORE_POC`: 버티컬 슬라이스 전에 가장 위험한 핵심 가설을 최소 비용으로 검증하는 내부 프로토타입.
- `SLICE_VALIDATION`: 완성된 버티컬 슬라이스를 외부 플레이로 검증하는 단계.

## 9. 요청 접수와 Skill 라우팅

기능·게임 경험·아트 방향·구조·워크플로 변경은 `managing-project-intake-and-work-contract`로 시작한다.

```text
route
→ 저장소 사실 조사
→ 저장소로 해결되지 않는 차단 기획 결정만 clarify
→ contract
→ L2 이상이면 decompose-and-sequence
→ execution-report
```

주요 단계:

- 콘셉트·코어: `analyzing-and-refining-game-concepts`
- 기존 코어 판정: `identifying-project-core`
- 코어 승인: `establishing-project-core`
- 기획 문서: `managing-design-documents`
- 버티컬 슬라이스: `designing-vertical-slices`
- 적대적 검토: `running-adversarial-review-and-refinement`
- 통합 검증: `reviewing-and-validating-project-changes`
- 컨텍스트·인계: `maintaining-project-context-and-handoff`
- Godot 자산·플러그인: `evaluating-godot-assets-and-plugins-before-creation`
- 레거시·아카이브: `governing-legacy-retention-and-archives`

Skill 파일을 읽은 것과 실제 절차를 실행한 것을 구분하고 `EXECUTED_AND_EVIDENCED`, `EXECUTED_UNVERIFIED`, `ROUTED_NOT_NEEDED`, `NOT_AVAILABLE`, `BLOCKED`, `FALLBACK_USED`로 보고한다.

## 10. 현재 실행 권한

`PLANNING_ONLY_PROFILE`에서 허용:

- 기획·벤치마킹·시스템·데이터 구조 설계
- Decision Ledger·P0~P3·기술 검수안
- CORE_POC·Vertical Slice 계약
- Codex read-only Plan·Issue·Goal 초안
- GitHub 기획 문서와 Draft PR 갱신

금지:

- Godot 코드·Scene·Resource·게임 데이터 구현
- Codex Build 실행
- 구현 완료·런타임 통과 주장
- 사용자 승인 없는 제품 게이트 전환
- 기본 브랜치 직접 수정과 PR 병합

## 11. 기획·수치 정책

- 기능보다 플레이어 경험·행동·고민·감정·피드백을 먼저 정의한다.
- 모든 기능은 `WHY → HOW → WHAT` 추적성을 가져야 한다.
- 필요성이 약한 기능은 `REMOVE → REDUCE → MERGE → CLARIFY → FEEDBACK 강화 → ADD` 순으로 검토한다.
- 개별 공격력·비용·쿨타임·충전시간 같은 세부값은 `INITIAL_TEST_VALUE`, `TUNING_RANGE`, `PLAYTEST_TUNING_REQUIRED`로 관리한다.
- 세션 길이·실패 철학·수익 모델·범위·비용을 바꾸는 값만 사용자 결정 대상으로 올린다.
- 실제 빌드·표본·관찰 없이 수치를 `VALIDATED`로 표시하지 않는다.

## 12. 에셋·UI·사운드

```text
플레이어 경험·역할 정의
→ 기존 승인 자산
→ 보유 자산
→ Godot Asset Library·플러그인·외부 후보
→ 라이선스·기술·스타일 검토
→ 적합한 것이 없을 때만 생성
→ 실제 런타임 검수
```

- 이미지 생성은 사용자의 명시적 요청과 작업 계약이 있을 때만 수행한다.
- 자산의 출처·라이선스·상업 이용·수정·적용 경로는 `docs/ASSET_LICENSE_LEDGER.md`에 기록한다.
- 콘셉트 이미지와 실제 게임 캡처를 같은 상태로 취급하지 않는다.

## 13. 변경·GitHub 규칙

- 기존 `docs/planning/` 정본을 임의로 이동·삭제·강제 통합하지 않는다.
- 기획 변경 시 관련 책임 원본·Decision Log·Active Context를 함께 갱신한다.
- 이전 결정과 충돌하면 `SUPERSEDED`, `REJECTED`, `LATEST_OVERRIDE`로 추적한다.
- 기획 PR과 구현 PR을 분리한다.
- Draft PR 상태를 유지하고 사용자가 요청하지 않으면 병합하지 않는다.
- 변경 파일의 이유, 연결 영향, 후속 동기화 여부를 보고한다.

## 14. 검증

문서·구조 변경:

- 경로 존재 여부
- Markdown·JSON 문법
- Registry와 책임 원본 연결
- stale reference와 중복 책임 원본
- 결정·상태·프로필 일치
- PR diff와 승인 범위
- 새 작업자의 콜드 스타트

Godot 구현 이후에만 추가:

- 정적 검사
- 자동 테스트
- 런타임
- 터치 입력·화면비·백그라운드 복귀
- 저장·불러오기
- 접근성·성능·배터리·발열
- 회귀·실기기 검증

실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 기록한다.

## 15. 작업 종료

1. 프로젝트 전용 결정과 상태를 책임 원본에 반영한다.
2. `docs/ACTIVE_CONTEXT.md`를 최신화한다.
3. Documentation Map·Design Registry·Skill Registry 연결을 확인한다.
4. Requirement·Skill·Artifact Coverage를 감사한다.
5. 프로젝트 전용 유지 내용과 Base 승격 후보를 분리한다.
6. 실제 Commit·Push·PR 상태와 미실행 검증을 보고한다.
