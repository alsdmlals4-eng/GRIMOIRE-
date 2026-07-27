# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 다음 Greenlight: `GM-GATE1-REVIEW-01 적대적 검토 + P0·P1 처리안 + 사용자 Gate 1 최종 승인`

> 게이트는 문서 존재만으로 통과하지 않는다. 관찰 가능한 결과와 증거로 판정하며 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 표시한다.

---

## 1. 최신 제품 경로

### CORE_POC 제거

사용자 결정:

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

상태:

- 결정 ID: `GM-VS-ROUTE-01`
- 직접 Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 별도 CORE_POC 재도입: `FORBIDDEN_BY_LATEST_USER_DECISION`

### Vertical Slice 계약

- 결정 ID: `GM-SLICE-01`
- 상태: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`
- 책임 원본: `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

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

---

## 2. 작업 실행 게이트

### 2.1 Intake·Context Gate

현재 상태: `PASS_WITH_LIMITS`

- [x] 최신 사용자 지시와 저장소 확인
- [x] START_HERE·Active Context·Documentation Map·Registry 연결
- [x] 책임 원본과 Draft PR 확인
- [x] 제품 단계·프로필·Work Mode 판정
- [x] 기존 기획 문서와 보호 결정 확인
- [ ] 실제 Godot 코드·Scene·데이터·테스트 — 구현 미착수로 `NOT_APPLICABLE_NOW`

### 2.2 Definition of Ready — 기획

- [x] 플레이어 약속
- [x] 비타협 코어와 변경 가능한 외피
- [x] 세일즈포인트 3개
- [x] Core Loop와 경험 곡선
- [x] 벤치마킹·SWOT·VRIO·1인 제작성
- [x] 2계층 소환수 구조
- [x] CORE_POC 없는 직접 Slice 경로
- [x] 축약 학기형 Vertical Slice 대표 구간
- [x] Slice 포함·제외 범위
- [x] 자유일정 3회와 휴식 가드레일
- [x] 정성 통과·실패 기준
- [ ] 정량 검증 임계값 — `PLAYTEST_TUNING_REQUIRED`
- [ ] 적대적 범위 검토
- [ ] P0·P1 처리안
- [ ] 사용자 Gate 1 최종 승인

현재 판정: `VERTICAL_SLICE_CONTRACT_READY / GATE_1_REVIEW_PENDING`

### 2.3 Definition of Ready — 구현

구현 시작 조건:

1. 사용자 Gate 1 최종 승인
2. 적대적 검토 P0 해소 또는 수용
3. `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
4. Codex read-only Plan 검수
5. 구현 브랜치·검증 매트릭스·완료 기준 확정
6. Godot 버전·렌더러·Android 대상 기기 확정

현재 판정: `IMPLEMENTATION_NOT_READY`

---

## 3. Gate 1 — CONCEPT_APPROVAL

현재 상태: `IN_PROGRESS`

### 목표

1인 개발 범위 안에서 외부 플레이 가능한 Vertical Slice로 핵심 마법 경험과 마법학교 생활 약속을 증명할 수 있는지 판단한다.

### 확보된 산출물

- [x] 목표 플레이어와 플레이 상황
- [x] 최상위 플레이 경험
- [x] 플레이어 약속
- [x] 뾰족한 재미 우선순위
- [x] Core Loop와 경험 곡선
- [x] 프로젝트 코어·지원층·변경 가능한 외피
- [x] 세일즈포인트 최대 3개
- [x] 벤치마킹·SWOT·VRIO·1인 제작성
- [x] 메인 동반·전투 보조 소환수 역할
- [x] CORE_POC 없는 직접 Vertical Slice 경로
- [x] 축약 학기형 Vertical Slice 계약
- [x] 중요 일정 사이 자유일정 1회씩

### 남은 필수 산출물

- [ ] `GM-GATE1-REVIEW-01` 적대적 콘셉트·범위 검토
- [ ] P0·P1 처리 방안
- [ ] Android·접근성·성능 검증 매트릭스의 정량 초안
- [ ] Balance Tuning Backlog 초안
- [ ] 사용자 Gate 1 최종 승인

### 통과 금지 조건

- 사용자 승인 없는 `CORE_CONFIRMED`
- 수업·시험·축제·현장실습이 같은 문제의 외형 변경에 불과함
- 자유일정이 최적 보상 메뉴 또는 무의미한 대화로만 작동함
- 휴식이 명백한 손해 선택임
- 핵심 차별점이 실제 플레이로 증명될 범위가 없음
- 모바일 터치 작성이 현실적 판정·피로 범위로 축소되지 않음
- Slice가 3년·6학기 또는 학교 전체 제작으로 팽창함
- 별도 CORE_POC를 다른 이름으로 다시 만듦
- 직접 작성·조합 검증이 아트·서사 제작 뒤로 밀림

---

## 4. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

현재 상태: `NOT_ENTERED`

### 진입 조건

- 사용자 Gate 1 최종 승인
- `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
- Codex read-only Plan 검수
- 구현 계획·검증 매트릭스 승인

CORE_POC 계약·통과는 진입 조건이 아니다.

### 실행 순서

```text
핵심 마법 인과와 세션 전환 구현
→ Slice 내부 검증 빌드
→ 입력·조합·세션 역할·자유일정 수정
→ 최종 방향의 UI·아트·사운드 통합
→ 외부 플레이 가능한 축약 학기형 Slice
→ QA·외부 SLICE_VALIDATION
→ Gate 3 판단 자료
```

### 필수 증거

#### 핵심 마법

- 상황 관찰→글자 선택→직접 작성→세계 변화→재설계→기록
- 메인·보조 글자 역할 이해
- 최소 두 가지 유효 해결법
- 입력 실패와 설계 실패 분리

#### 학교생활

- 수업 = 배움
- 시험 = 증명
- 학교축제 = 표현·관계·비전투 활용
- 현장실습 = 응용·발견
- 중요 일정 사이 자유일정 1회씩
- 휴식 선택의 실제 가치
- 자유일정 선택이 진행을 차단하지 않음

#### 소환수

- 메인 동반자의 학습·관계·기록 연결
- 보조 소환수의 수호 또는 견제
- 소환수 대행 없이 플레이어가 주문 설계

#### 모바일·제품

- Android 실제 기기
- 완전 정지·감속·실시간 비교
- 손가락 가림·피로·접근성
- 주요 화면비·보급형 기기 성능
- 세션·자유일정 사이 저장·중단·복귀
- 최종 방향에 가까운 UI·아트·사운드
- 두 번째 유사 콘텐츠 제작 증거

---

## 5. Slice 계약 요약

### 포함

- 핵심 세션 4개
- 자유일정 3회
- 메인 글자 1개, 보조 글자 2개
- 시험·축제·현장 전투·현장 환경 문제 각 1개
- 학교 재사용 구역 1개, 현장 구역 1개
- 적 1~2종
- 메인 동반 소환수 1체
- 수호 또는 견제형 보조 소환수 1체
- 저장·복귀

### 제외

- 3년·6학기 전체
- 다수 시험·축제 부스·현장 지역
- 대규모 관계 분기
- 완성 주문 스톡
- 복잡한 소환수 경제
- 다중 상태이상
- 고정밀 자유 손글씨
- 온라인·협동·풀보이스

---

## 6. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- Codex 미실행
- 런타임·Android·접근성·성능·플레이테스트 `NOT_RUN`
- 정량 통과 임계값 `PLAYTEST_TUNING_REQUIRED`
- PR은 Draft 유지
- 병합하지 않음
