# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 다음 Greenlight: 프로젝트 코어·뾰족한 재미·CORE_POC 계약 사용자 승인

> 게이트는 문서가 존재한다는 이유로 통과하지 않는다. 관찰 가능한 결과와 증거로 판정하며 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 표시한다.

## 1. 작업 실행 게이트

### 1.1 Intake·Context Gate

현재 상태: `PASS_WITH_LIMITS`

- [x] 최신 사용자 지시와 저장소 URL을 확인했다.
- [x] `AGENTS.md`, `START_HERE.md`, Active Context, Documentation Map을 연결했다.
- [x] 현재 책임 원본과 Draft PR을 확인했다.
- [x] 현재 제품 단계·프로필·Work Mode를 판정했다.
- [x] 기존 기획 문서와 보호 결정을 확인했다.
- [ ] 실제 Godot 코드·Scene·데이터·테스트 확인 — 구현 미착수로 `NOT_APPLICABLE_NOW`

```yaml
problem: v6와 Base 기준으로 Spell의 콘셉트·코어를 확정하고 CORE_POC·버티컬 슬라이스로 이어갈 수 있는 운영 구조가 필요함
user_or_player_value: 중요한 결정과 플레이어 경험을 잃지 않고 일관된 순서로 기획·검증·구현함
primary_discipline: game-design-and-project-governance
affected_disciplines:
  - combat-design
  - progression-and-world
  - ux-and-touch-input
  - godot-engineering
  - qa-and-playtest
change_type: planning-and-governance
current_truth_sources:
  - docs/ACTIVE_CONTEXT.md
  - docs/planning/DECISION_LOG.md
  - docs/planning/SPELL_GAME_DESIGN.md
  - docs/planning/COMBAT_CORE_SYSTEM.md
protected_decisions_and_paths:
  - docs/planning/**
  - docs/ACTIVE_CONTEXT.md
  - direct-writing-stock-summon-boundaries
unknowns:
  - approved-project-core
  - target-player-definition
  - core-poc-evidence
  - godot-version-and-runtime
```

### 1.2 Definition of Ready

현재 기획 작업은 다음을 만족할 때 Ready다.

- [x] 이번 요청의 목적과 범위가 명확하다.
- [x] 사용자 승인 범위와 금지 범위가 분리됐다.
- [x] 책임 원본과 영향 문서를 지정했다.
- [x] 기존 기획·결정 보존 범위를 확인했다.
- [x] 완료 기준과 참조 검증 방법이 있다.
- [x] Base Skill과 프로젝트 Skill route를 연결했다.
- [ ] 기능 구현 Ready — `PLANNING_ONLY_PROFILE`이므로 `BLOCKED_BY_PROFILE`

Ready 판정: `PLANNING_READY / IMPLEMENTATION_NOT_READY`

### 1.3 Planning·Approval Gate

| 항목 | 현재 내용 | 상태 |
|---|---|---|
| 구조 조사 | README·Active Context·46개 기획 문서·Draft PR·Base 템플릿 조사 | `PASS` |
| 보호 파일 | `docs/planning/**`, Active Context, v6 계약 | `PASS` |
| 변경 파일 | 운영 진입점·Registry·Gate·Adapter·링크만 추가 | `PASS` |
| 구현 영향 | 없음 | `PASS` |
| 저장·Schema 영향 | 없음 | `PASS` |
| 이미지·사운드·UI 영향 | 없음 | `PASS` |
| 롤백 | 신규 Commit revert, 기존 기획 원본 유지 | `PASS` |
| 사용자 승인 | 2026-07-27 `좋아 작업해` | `PASS` |
| Concept Gate 승인 | 아직 없음 | `PENDING` |
| Godot 구현 승인 | 없음 | `BLOCKED` |

### 1.4 Documentation Implementation Gate

- [x] 승인된 Governance foundation 범위만 변경한다.
- [x] 기존 기획 문서의 이동·삭제·강제 개명을 하지 않는다.
- [x] Base Skill 본문을 프로젝트에 복제하지 않는다.
- [x] 신규 파일을 한 책임 단위로 분리한다.
- [x] Draft 기획 브랜치와 PR을 사용한다.
- [x] `main` 직접 수정과 병합을 하지 않는다.

### 1.5 Verification Gate

| 순서 | 검증 | 방법 | 현재 결과 |
|---:|---|---|---|
| 1 | 파일 존재 | GitHub branch fetch | 진행 중 |
| 2 | Markdown·JSON 문법 | 구조·JSON 파싱 검토 | 진행 중 |
| 3 | 경로 참조 | Registry·Map·Adapter 대상 경로 조회 | 진행 중 |
| 4 | 기존 문서 보존 | PR changed files·compare | 진행 중 |
| 5 | 상태 일관성 | 단계·프로필·Work Mode·다음 결정 교차 검토 | 진행 중 |
| 6 | 콜드 스타트 | AGENTS→START_HERE→Context→Registry 읽기 | 진행 중 |
| 7 | Godot 런타임 | 빌드 없음 | `NOT_RUN` |
| 8 | 저장·접근성·성능 | 구현 없음 | `NOT_RUN` |
| 9 | 사용자 수동 검수 | PR 확인 | `PENDING` |

### 1.6 Documentation Gate

- [x] AGENTS
- [x] START_HERE
- [x] Base Rules Version
- [x] Documentation Map
- [x] Development Gates
- [x] Design Document Registry
- [x] Skill Registry·Adapter route
- [x] v6 계약 기록
- [ ] Active Context 운영 경로 갱신 — 설치 작업에서 수행
- [ ] README 진입점 갱신 — 설치 작업에서 수행
- [ ] PDF·DOCX·Manifest — `NOT_REQUIRED_THIS_SCOPE`
- [ ] 자동 Checker·Actions — `DEFERRED`

### 1.7 Integration·Completion Gate

운영체계 설치 완료 조건:

- [ ] 모든 신규 경로가 기획 브랜치에 존재한다.
- [ ] JSON 파일이 유효하게 파싱된다.
- [ ] Registry가 실제 책임 원본을 가리킨다.
- [ ] Skill route·adapter·Base pin이 일치한다.
- [ ] Active Context와 README가 새 진입점을 가리킨다.
- [ ] 기존 `docs/planning/` 정본이 보존된다.
- [ ] Health Report에 PASS·PARTIAL·NOT_RUN을 구분한다.
- [ ] Draft PR 상태와 최종 branch HEAD를 확인한다.

## 2. v6 제품 승인 체계

### Gate 1 — `CONCEPT_APPROVAL`

현재 상태: `IN_PROGRESS`

#### 목표

만들 가치가 있고, 1인 개발 범위 안에서 CORE_POC와 버티컬 슬라이스로 증명할 수 있는 게임인지 판단한다.

#### 현재 확보

- 플레이어 약속 후보
- 직접 작성·스톡·소환수 책임 경계
- 마법 글자·회로 문법
- 마법학교 3년 육성 구조
- Decision Log와 보호 결정
- 다음 결정 `GM-STOCK-01`

#### 남은 필수 산출물

- [ ] 목표 플레이어와 플레이 상황
- [ ] 프로젝트 코어·변경 가능한 외피 사용자 승인
- [ ] 뾰족한 재미 우선순위 승인
- [ ] Core Loop와 경험 곡선
- [ ] 세일즈포인트 최대 3개
- [ ] 제약·비타협 조건
- [ ] 벤치마킹·SWOT·VRIO 행동안
- [ ] 마스코트 또는 상징 동반자 후보와 실제 역할
- [ ] CORE_POC 가설·대표 구간·통과·실패 기준
- [ ] 버티컬 슬라이스 후보와 포함·제외 범위
- [ ] Balance Tuning Backlog 초안
- [ ] 적대적 콘셉트 검토와 P0·P1 해소

#### 통과 금지 조건

- 사용자 승인 없는 `CORE_CONFIRMED`
- 기능 목록만 있고 반복 행동·고민·감정이 불명확함
- 핵심 차별점이 실제 플레이로 증명되지 않음
- 모바일 터치 작성이 현실적으로 검증 가능한 범위로 축소되지 않음
- CORE_POC가 전체 게임 또는 버티컬 슬라이스로 팽창함

### Gate 2 — `PROTOTYPE_AND_VERTICAL_SLICE`

현재 상태: `NOT_ENTERED`

진입 조건:

- Gate 1 승인
- CORE_POC 계약 승인
- `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
- Codex read-only Plan 검수

종료 조건:

```text
CORE_POC
→ 결과 기반 기획 재조정
→ 버티컬 슬라이스 통합 데모
→ QA
→ 외부 SLICE_VALIDATION
→ Gate 3 판단 자료
```

필수 증거:

- 실제 Android 테스트 빌드
- 터치 작성·회로 판정
- 직접 작성·스톡·소환수 연결
- 성공·실패·복구
- 저장·복귀
- 최종 방향에 가까운 UI·아트·사운드
- 접근성·다양한 화면비·보급형 기기 성능
- 두 번째 유사 콘텐츠 제작 증거
- 외부 플레이테스트의 행동·자기보고 분리

### Gate 3 — `PRODUCTION_APPROVAL`

현재 상태: `NOT_ENTERED`

필수 증거:

- 핵심 재미와 세일즈포인트 인식
- 첫 재미 시점·튜토리얼 완료·실패 이유 이해
- 재도전·재방문·구매 의향
- 제작 병목과 두 번째 콘텐츠 제작성
- 목표 기기 성능과 남은 범위·비용·기간
- 마스코트의 세계관·UX·브랜드 기여
- 데이터 기반 수치 튜닝 구조

### Gate 4 — `RELEASE_CANDIDATE_APPROVAL`

현재 상태: `NOT_ENTERED`

필수 범위:

- 전체 진행과 콘텐츠 완료
- 저장 호환·접근성·성능·장시간 실행
- Google Play 정책·등급·개인정보·데이터 안전·라이선스
- 최종 스토어 자산과 실제 게임 일치
- 출시 Runbook·긴급 패치·롤백·출시 후 대응

## 3. 현재 기획 진행 순서

```text
GM-STOCK-01
→ 목표 플레이어·플레이 상황
→ 프로젝트 코어·뾰족한 재미 반례 검토
→ Core Loop·경험 곡선·세일즈포인트
→ 벤치마킹·SWOT·VRIO·제작성
→ 마스코트 역할 후보
→ CORE_POC 계약
→ 적대적 검토
→ GRILL_3_CORE_CONFIRMATION
→ 사용자 Gate 1 승인
```

## 4. 현재 `BLOCKED_UNVERIFIED`

- Godot 버전·렌더러·프로젝트 구조
- 터치 입력 인식 방식과 허용 오차
- 실제 모바일 화면의 회로 작성 공간
- 스톡 UI와 직접 작성 UI의 혼잡도
- 집중 모드 시간 감속의 조작감
- 소환수 충전 지원의 체감
- 1학년 `메인 1 + 보조 2` 조합 재미
- 저장·복귀·성능·발열·배터리
- Google Play 실제 정책·API·계정 조건

## 5. 게이트 판정 규칙

가능한 판정:

- `APPROVED`
- `APPROVED_WITH_CONDITIONS`
- `REWORK`
- `REPEAT_VALIDATION`
- `HOLD`
- `STOP`
- `UNVERIFIED`

세부 수치·기술값이 미확정이라는 이유만으로 사용자에게 질문하지 않는다. 기술안과 Balance Tuning Backlog로 묶고, 프로젝트 코어·플레이어 경험·주요 UX·범위·비용이 달라지는 충돌만 한 문항씩 결정한다.
