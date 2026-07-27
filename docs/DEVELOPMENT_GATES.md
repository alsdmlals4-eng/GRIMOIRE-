# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 다음 Greenlight: `GM-SLICE-01 Vertical Slice 계약 + 적대적 검토 + 사용자 Gate 1 승인`

> 게이트는 문서 존재만으로 통과하지 않는다. 관찰 가능한 결과와 증거로 판정하며 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 표시한다.

---

## 1. 최신 제품 경로 override

사용자 결정:

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

상태:

- 결정 ID: `GM-VS-ROUTE-01`
- 직접 Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 계약: `NOT_AUTHORED`

최신 경로:

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약 승인
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

기존 `CORE_POC 계약 승인`, `CORE_POC 구현`, `CORE_POC 통과` 선행 조건은 `SUPERSEDED_BY_GM-VS-ROUTE-01`이다.

---

## 2. 작업 실행 게이트

### 2.1 Intake·Context Gate

현재 상태: `PASS_WITH_LIMITS`

- [x] 최신 사용자 지시와 저장소를 확인했다.
- [x] `AGENTS.md`, `START_HERE.md`, Active Context, Documentation Map, Registry를 연결했다.
- [x] 현재 책임 원본과 Draft PR을 확인했다.
- [x] 제품 단계·프로필·Work Mode를 판정했다.
- [x] 기존 기획 문서와 보호 결정을 확인했다.
- [ ] 실제 Godot 코드·Scene·데이터·테스트 확인 — 구현 미착수로 `NOT_APPLICABLE_NOW`

```yaml
problem: 스펠의 승인된 코어를 별도 CORE_POC 없이 외부 플레이 가능한 Vertical Slice로 증명해야 함
player_value: 직접 작성·의미 기반 조합·학교 학습 순환을 한 완결 경험으로 체험
primary_discipline: game-design-and-project-governance
affected_disciplines:
  - touch-input-ux
  - combat-and-problem-design
  - progression-and-world
  - summon-companion-design
  - godot-engineering
  - qa-and-playtest
current_truth_sources:
  - docs/ACTIVE_CONTEXT.md
  - docs/planning/DECISION_LOG.md
  - docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md
unknowns:
  - vertical-slice-exact-scope
  - vertical-slice-pass-fail-thresholds
  - godot-version-renderer-runtime
  - android-device-performance
```

### 2.2 Definition of Ready — 기획

- [x] 플레이어 약속과 비타협 코어가 있다.
- [x] 세일즈포인트 3개가 있다.
- [x] 기본 Loop와 경험 곡선이 있다.
- [x] 벤치마킹·SWOT·VRIO·1인 제작성 분석이 있다.
- [x] 2계층 소환수 구조가 있다.
- [x] CORE_POC 제거와 검증 책임 이전이 승인됐다.
- [ ] `GM-SLICE-01` 대표 구간·포함·제외 범위 승인
- [ ] Vertical Slice 통과·실패 기준 승인
- [ ] 적대적 범위 검토
- [ ] 사용자 Gate 1 승인

현재 판정: `PLANNING_READY / VERTICAL_SLICE_CONTRACT_NOT_READY`

### 2.3 Definition of Ready — 구현

구현 시작 조건:

1. Gate 1 사용자 승인
2. Vertical Slice 계약 승인
3. `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
4. Codex read-only Plan 검수
5. 구현 브랜치·완료 기준·검증 매트릭스 확정

현재 판정: `IMPLEMENTATION_NOT_READY`

---

## 3. Gate 1 — CONCEPT_APPROVAL

현재 상태: `IN_PROGRESS`

### 목표

만들 가치가 있고, 1인 개발 범위 안에서 외부 플레이 가능한 Vertical Slice로 핵심 경험과 세일즈포인트를 증명할 수 있는지 판단한다.

### 확보된 산출물

- [x] 목표 플레이어와 플레이 상황
- [x] 최상위 플레이 경험
- [x] 플레이어 약속
- [x] 뾰족한 재미 우선순위
- [x] Core Loop와 경험 곡선
- [x] 프로젝트 코어·지원층·변경 가능한 외피
- [x] 세일즈포인트 최대 3개
- [x] 벤치마킹·SWOT·VRIO·1인 제작성
- [x] 마스코트·상징 동반자 역할
- [x] CORE_POC 없는 직접 Vertical Slice 경로

### 남은 필수 산출물

- [ ] `GM-SLICE-01` Vertical Slice 대표 구간
- [ ] Slice 포함·제외 범위
- [ ] Slice 통과·실패 기준
- [ ] Android·접근성·성능·저장·복귀 검증 계획
- [ ] Balance Tuning Backlog 초안
- [ ] 적대적 콘셉트·범위 검토
- [ ] P0·P1 처리 방안
- [ ] 사용자 Gate 1 승인

### 통과 금지 조건

- 사용자 승인 없는 `CORE_CONFIRMED`
- 기능 목록만 있고 반복 행동·고민·감정이 불명확함
- 핵심 차별점이 실제 플레이로 증명될 범위가 없음
- 모바일 터치 작성이 현실적인 판정·피로 범위로 축소되지 않음
- Vertical Slice가 3년·6학기 또는 전체 게임 제작으로 팽창함
- 별도 CORE_POC를 다른 이름으로 다시 만들며 중복 작업함
- 직접 작성·조합·학습 순환의 검증이 아트·서사 제작 뒤로 밀림

---

## 4. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

현재 상태: `NOT_ENTERED`

### 진입 조건

- Gate 1 사용자 승인
- Vertical Slice 계약 승인
- `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
- Codex read-only Plan 검수

CORE_POC 계약·통과는 진입 조건이 아니다.

### 실행 순서

```text
Validation-First Vertical Slice 핵심 인과 구현
→ 내부 검증 빌드
→ 결과 기반 설계 수정
→ 최종 방향의 UI·아트·사운드 통합
→ 외부 플레이 가능한 Slice
→ QA·외부 SLICE_VALIDATION
→ Gate 3 판단 자료
```

내부 검증 빌드는 Vertical Slice의 체크포인트이며 독립 CORE_POC 산출물이 아니다.

### 필수 증거

#### 핵심 플레이

- 상황 관찰→글자 선택→직접 작성→세계 변화→재설계→발견 기록
- 같은 메인 글자의 전투·환경 재사용
- 최소 두 가지 유효 해결법
- 실패 원인 이해와 복구

#### 입력·모바일 UX

- 실제 Android 테스트 빌드
- 터치 작성·판정과 즉시 피드백
- 입력 실패와 설계 실패 분리
- 완전 정지·감속·실시간 비교
- 손가락 가림·피로·접근성
- 다양한 화면비와 보급형 기기 성능

#### Loop·소환수

- 수업에서 배운 원리의 현장 이전
- 메인 동반 소환수의 관계·학습·기록 연결
- 전투 보조 소환수의 수호 또는 견제
- 보조 소환수 유무에 따른 작성 시간·피격·완주율 비교

#### 제품·제작성

- 저장·중단·복귀
- 최종 방향에 가까운 UI·아트·사운드
- 두 번째 유사 콘텐츠 제작 증거
- 외부 플레이테스트의 행동·자기보고 분리
- 실제 제작 공수와 병목 기록

### 종료 조건

- Vertical Slice 통과 기준 충족
- 핵심 재미와 세일즈포인트가 외부 플레이어에게 인식됨
- P0 차단 문제 없음
- P1 위험에 수정 계획과 비용 추정이 있음
- 두 번째 콘텐츠 제작성이 증명됨
- Gate 3 판단 자료가 준비됨

---

## 5. Gate 3 — PRODUCTION_APPROVAL

현재 상태: `NOT_ENTERED`

필수 증거:

- 핵심 재미와 세일즈포인트 인식
- 첫 재미 시점·튜토리얼 완료·실패 이유 이해
- 재도전·재방문·구매 의향
- 제작 병목과 두 번째 콘텐츠 제작성
- 목표 기기 성능과 남은 범위·비용·기간
- 메인 동반자와 보조 소환수의 세계관·UX·브랜드 기여
- 데이터 기반 수치 튜닝 구조

---

## 6. Gate 4 — RELEASE_CANDIDATE_APPROVAL

현재 상태: `NOT_ENTERED`

필수 범위:

- 전체 진행과 콘텐츠 완료
- 저장 호환·접근성·성능·장시간 실행
- Google Play 정책·등급·개인정보·데이터 안전·라이선스
- 최종 스토어 자산과 실제 게임 일치
- 출시 Runbook·긴급 수정·롤백 절차

---

## 7. Verification Gate

| 순서 | 검증 | 현재 결과 |
|---:|---|---|
| 1 | 책임 원본 파일 존재 | `PASS` |
| 2 | 상태 문서 일관성 | `IN_PROGRESS` |
| 3 | Registry 경로와 JSON 유효성 | `IN_PROGRESS` |
| 4 | Draft PR·branch HEAD | `IN_PROGRESS` |
| 5 | 구현 파일 미혼입 | `IN_PROGRESS` |
| 6 | Godot 런타임 | `NOT_RUN` |
| 7 | Android·저장·접근성·성능 | `NOT_RUN` |
| 8 | 사용자 수동 검수 | `PENDING` |

---

## 8. 다음 차단 결정

`GM-SLICE-01`: 첫 Vertical Slice의 대표 구간, 포함·제외 범위, 통과·실패 기준을 확정한다.

권장 후보:

```text
짧은 수업
→ 교내 연습
→ 짧은 일상·준비
→ 첫 현장실습의 전투 문제
→ 환경·구조 문제
→ 복귀·마도서 기록
```
