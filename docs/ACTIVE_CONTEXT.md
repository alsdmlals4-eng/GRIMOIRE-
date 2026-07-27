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
- 프로젝트 코어 경계: `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1`
- 세일즈포인트: `SALES_POINTS_CONFIRMED_FOR_GATE_1`
- 벤치마킹: `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED`
- 소환수 구조: `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1`
- 직접 Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Gate 1 판정: `UNVERIFIED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 계약: `NOT_AUTHORED`
- Vertical Slice 구현: `NOT_STARTED`
- Godot 구현: `NOT_STARTED`

개별 방향 승인은 Gate 1 전체 승인, `CORE_CONFIRMED`, Vertical Slice 구현 승인 또는 제품 Gate 통과를 의미하지 않는다.

---

## 최상위 사용자 override

사용자 결정:

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

따라서 기존 `GM-POC-01`, CORE_POC 계약·구현·통과 선행 요구는 `SUPERSEDED_BY_GM-VS-ROUTE-01`이다.

최신 제품 경로:

```text
Gate 1 콘셉트 정리
→ GM-SLICE-01 Vertical Slice 계약 승인
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환 승인
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

검증을 제거한 것이 아니다. 직접 작성·조합·전투 압박·소환수·모바일 UX 검증을 Vertical Slice의 필수 통과 조건으로 이동했다.

---

## Gate 1 활성 원본

1. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
2. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
3. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
4. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
5. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
6. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
7. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
8. `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
9. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27L.md`
10. `docs/planning/DECISION_LOG.md`
11. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 `docs/planning/` 문서는 삭제하지 않고 `REFERENCE_CANDIDATE`로 사용한다. 최신 사용자 승인과 책임 원본이 우선한다.

---

## 승인된 플레이어 경험

### 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

### 통합 세일즈 문장

> 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.

세일즈포인트:

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

---

## 승인된 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 즉각적이고 설명 가능한 적·환경·사건 변화
6. 수업→연습→현장실습→발견·기록→다음 학습 순환

지원 시스템:

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 메인 동반 소환수
- 전투 보조 소환수

변경 가능한 외피:

- 3년·6학기와 학기 일정 수
- 학교 규모·지역·관계 분기량
- 실시간·감속·단계형 전투 표현
- 완성 주문 스톡
- 보조 소환수 편성·수·성장 방식
- 정확한 세션 시간과 저장 단위

---

## 승인된 Loop와 경험 곡선

### 기본 Loop

```text
수업
→ 교내 연습
→ 일상·준비
→ 현장실습
→ 복귀·기록
→ 다음 수업·연구
```

일정은 `고정 핵심 사건 + 자유 일정` 혼합형이다.

### 첫 경험 곡선

```text
학교 도착·목표 소개
→ 교수의 짧은 시범
→ 첫 메인 글자 직접 작성
→ 즉시 세계 변화
→ 보조 글자로 작은 설계
→ 짧은 관계 장면
→ 첫 현장실습
→ 새 활용 발견·기록
→ 반복 숙련 후 하위 글자 스톡
```

- 첫 5분에는 직접 작성과 설계 차이를 증명한다.
- 자동화는 직접 학습 이후의 보상이다.
- 첫 자동화는 숙련 보조 글자의 하위 글자 스톡부터 시작한다.

---

## 확정된 2계층 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 수업·연습·일상·현장실습·복귀·기록
= 관계·학습·서사 연속성

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·지정 충전 지원
= 플레이어의 작성 시간 확보
```

공통 금지:

- 글자·회로 직접 작성
- 메인·보조 글자 자동 선택
- 회로 자동 연결
- 주문 자동 설계·실행
- 문제 정답 제시
- 소환수만으로 전투 자동 해결

---

## Validation-First Vertical Slice 경계

별도 CORE_POC 없이 다음 검증을 Slice 내부에 포함한다.

- 완전 정지 / 감속 / 실시간 작성 비교
- 입력 실패 / 설계 실패 분리
- 같은 메인 글자의 전투·환경 재사용
- 최소 2개의 유효 해결법
- 실패 원인 이해와 재설계
- 메인 동반자의 학습·기록 연결
- 전투 보조 소환수의 수호·견제 효과
- Android 실제 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

권장 Slice 후보:

```text
짧은 수업
→ 교내 연습
→ 메인 동반자와 짧은 일상·준비
→ 첫 현장실습의 전투 문제
→ 환경·구조 문제
→ 복귀·마도서 기록
```

초기 제외:

- 3년·6학기 전체
- 다수 지역과 대규모 관계 분기
- 완성 주문 스톡
- 복잡한 소환수 충전·다중 편성
- 다중 상태이상
- 고정밀 자유 손글씨 인식
- 온라인·협동·풀보이스

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 보조 소환수는 전투에서 호출
- 소환수는 작성·조합 판단을 대행하지 않음
- 별도 CORE_POC를 다른 이름으로 재도입하지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- Gate 1·Slice 계약 승인 전 Godot 구현과 Codex 실행 금지

---

## 주요 위험

### P1

- POC 없이 Slice로 직접 가므로 초기 범위가 비대해질 수 있다.
- 핵심 검증이 아트·서사·콘텐츠 제작 뒤로 밀릴 수 있다.
- 직접 작성이 반복 피로와 화면 가림을 만들 수 있다.
- 조합 결과가 불명확하면 레시피 암기나 시행착오 노동이 된다.
- 작성·마나·적·환경·스톡·보조 소환수를 동시에 판단하면 UI가 과밀해질 수 있다.
- 메인 동반자가 과도한 힌트를 주면 발견 주체가 플레이어에서 동반자로 이동한다.
- 전투 보조 소환수 조작이 주문 작성보다 커지면 핵심 경험이 펫 운용으로 변한다.

### BLOCKED_UNVERIFIED

- 첫 Vertical Slice의 정확한 대표 구간과 분량
- 터치 작성의 반복 재미와 판정 허용 범위
- 실시간 압박이 사고를 강화하는지 방해하는지
- 전투 보조 소환수가 실제 작성 시간을 확보하는지
- 메인 동반자가 관계와 학습 연속성을 강화하는지
- 두 계층의 역할을 플레이어가 즉시 구분하는지
- 두 번째 유사 콘텐츠 제작비
- 목표 Android 기기 성능과 저장·복귀

---

## 다음 차단 결정 — GM-SLICE-01

첫 Vertical Slice의 대표 구간, 포함·제외 범위, 통과·실패 기준을 확정한다.

> 첫 Vertical Slice를 `짧은 수업 → 교내 연습 → 짧은 일상·준비 → 첫 현장실습의 전투·환경 문제 → 복귀·마도서 기록`의 완결형으로 구성할 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`

그다음:

```text
GM-SLICE-01 Vertical Slice 계약
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ 구현
```
