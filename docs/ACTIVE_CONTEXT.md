# 스펠 Active Context

## 현재 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 기준 날짜: 2026-07-27
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 기획 상태: `PLANNING_IN_PROGRESS`
- 프로젝트 코어 전체: `CORE_CANDIDATE`
- Gate 1 판정: `UNVERIFIED`
- 구현 상태: `NOT_STARTED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 직접 Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Vertical Slice 계약: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`
- Vertical Slice 구현: `NOT_STARTED`
- 다음 차단 결정: `GM-GATE1-REVIEW-01`

개별 방향과 Slice 계약 승인은 Gate 1 전체 승인이나 `CORE_CONFIRMED`, 구현 승인, 프로필 전환을 의미하지 않는다.

---

## 활성 책임 원본

1. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
2. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
3. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
4. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
5. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
6. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
7. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
8. `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
9. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
10. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27M.md`
11. `docs/planning/DECISION_LOG.md`
12. `docs/DEVELOPMENT_GATES.md`
13. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 기획 문서는 삭제하지 않고 `REFERENCE_CANDIDATE`로 사용한다. 최신 사용자 승인과 위 책임 원본이 우선한다.

---

## 승인된 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

## 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

설계 필터:

```text
배움
→ 글자와 문제의 원리를 이해

설계
→ 상황에 맞는 주문 구조를 선택·작성

세계 변화
→ 적·환경·사건·생활 문제를 실제로 변화
```

---

## 승인된 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→현장실습→발견·기록→다음 학습 순환

지원층:

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 메인 동반 소환수
- 전투 보조 소환수

변경 가능한 외피:

- 3년·6학기 전체 규모
- 학교 지역·관계 분기량
- 실시간·감속·단계형 전투 표현
- 완성 주문 스톡
- 보조 소환수 편성·수·성장 방식
- 정확한 세션 시간과 저장 단위

---

## 승인된 세일즈포인트

> 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

직접 작성은 첫 시각적 훅이며 장기 핵심 재미는 의미 기반 조합·상황 반응·발견이다.

---

## 승인된 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록 연결

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

공통 금지:

- 글자·회로 작성 대행
- 메인·보조 글자 자동 선택
- 주문 자동 설계
- 정답 제시
- 소환수만으로 전투 자동 해결

---

## 확정된 직접 Vertical Slice 경로

별도 CORE_POC는 제작하지 않는다. 그 검증 책임은 Vertical Slice 통과 조건으로 흡수한다.

```text
Gate 1 콘셉트 정리
→ 축약 학기형 Vertical Slice 계약 승인
→ 적대적 범위 검토
→ P0·P1 처리안
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
```

---

## 확정된 Vertical Slice 계약 — GM-SLICE-01

상태: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A 1회
→ 첫 실기시험
→ 자유일정 B 1회
→ 학교축제 준비·학교축제
→ 자유일정 C 1회
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

세션 역할:

```text
수업·연습 = 배움
시험 = 이해의 증명
학교축제 = 표현·관계·비전투 활용
현장실습 = 실제 위험 속 응용·발견
자유일정 = 휴식·준비·관계·연구의 완충
귀환·기록 = 결과 해석·다음 학습 연결
```

### 자유일정 계약

- 중요 일정 사이에 총 3회 제공
- 각 슬롯에서 행동 1개 선택
- `휴식`을 유효한 정식 선택으로 제공
- 복습·관계·축제 준비·현장 조사·보조 소환수 훈련 등을 상황별로 제공
- 어떤 선택도 다음 중요 일정 참가를 차단하지 않음
- 필수 정보와 정답을 특정 자유일정에 독점시키지 않음
- 선택 결과는 작은 보정·관계·정보·준비 차이를 만듦

### 잠정 시간

- 전체 약 52~84분
- 개별 핵심 세션 약 8~18분
- 자유일정 약 3~6분
- 정확한 값: `PLAYTEST_TUNING_REQUIRED`

### 최소 범위

- 메인 글자 1개, 보조 글자 2개
- 수업·시험·축제·현장실습 각 대표 문제 1개
- 자유일정 3회
- 학교 재사용 구역 1개, 현장실습 구역 1개
- 적 1~2종
- 메인 동반 소환수 1체
- 수호 또는 견제형 보조 소환수 1체
- 저장·중단·복귀
- 최종 방향에 가까운 핵심 UI·아트·사운드

### 초기 제외

- 3년·6학기 전체
- 다수 시험 과목·축제 부스·현장 지역
- 대규모 관계 분기
- 완성 주문 스톡
- 다수 보조 소환수 편성·희귀도 경제
- 복잡한 충전·소환 용량
- 다중 상태이상
- 고정밀 자유 손글씨 인식
- 온라인·협동·풀보이스

---

## 핵심 검증

- 첫 5분 직접 작성과 즉각적 발현
- 메인·보조 글자의 역할 차이
- 입력 실패와 설계 실패 분리
- 시험·축제·현장실습에서 같은 문법의 다른 사용
- 최소 두 가지 유효 해결법
- 실패 원인 이해와 재설계
- 자유일정의 휴식·준비 기능
- 메인 동반자의 학습·관계·기록 연결
- 보조 소환수의 실제 작성 시간 확보
- 완전 정지·감속·실시간 비교
- Android 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화나 자유일정에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 보조 소환수는 전투에서 호출
- 소환수는 작성·조합 판단을 대행하지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 자유일정은 필수 진행을 차단하지 않음
- 별도 CORE_POC를 다른 이름으로 재도입하지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- 현재 단계에서 Godot 구현과 Codex 실행 금지

---

## 주요 위험

### P1

- 4개 핵심 세션과 자유일정 3회가 1인 개발 범위를 초과할 수 있음
- 시험·축제·현장 문제가 같은 퍼즐의 외형 변경으로 느껴질 수 있음
- 자유일정이 보상 최적화 메뉴 또는 대화 소모로 변할 수 있음
- 전체 52~84분이 모바일 완주율에 부담이 될 수 있음
- 직접 작성과 소환수·마나·환경 판단이 UI 과밀을 만들 수 있음
- 학교·관계·축제 연출이 핵심 검증보다 먼저 커질 수 있음

### BLOCKED_UNVERIFIED

- 터치 작성의 반복 재미와 허용 범위
- 실시간 압박이 사고를 강화하는지 여부
- 시험·축제·현장실습의 플레이 역할 구분
- 자유일정의 휴식·준비 가치
- 보조 소환수의 작성 시간 확보 효과
- 저장·복귀 후 목표 이해도
- 동일 데이터 계약으로 두 번째 콘텐츠 제작 가능성

---

## 다음 차단 결정

`GM-GATE1-REVIEW-01`: 축약 학기형 Vertical Slice의 범위·모바일 UX·콘텐츠 중복·제작성 위험을 적대적으로 검토하고 P0·P1 처리안을 확정한다.

이 검토와 사용자 Gate 1 최종 승인 전에는 구현으로 전환하지 않는다.
