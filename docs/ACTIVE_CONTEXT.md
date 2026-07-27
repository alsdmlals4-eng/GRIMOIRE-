# 스펠 Active Context

## 현재 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 기준 날짜: 2026-07-27
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 프로젝트 코어 전체: `CORE_CANDIDATE`
- Gate 1: `UNVERIFIED`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- Vertical Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Vertical Slice 계약: `CONFIRMED_WITH_P0_AMENDMENT_FOR_GATE_1`
- 적대적 검토: `AUTHORED_BY_GM-GATE1-REVIEW-01`
- P0 위험 처리: `CONFIRMED_BY_GM-GATE1-RISK-01`
- 현재 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1 최종 승인: `USER_DECISION_REQUIRED`
- 다음 차단 결정: `GM-GATE1-APPROVAL-01`

P0 패키지 승인은 Gate 1 최종 승인, `CORE_CONFIRMED`, 실행 프로필 전환 또는 구현 승인을 의미하지 않는다.

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
10. `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`
11. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27O.md`
12. `docs/planning/DECISION_LOG.md`
13. `docs/DEVELOPMENT_GATES.md`
14. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 세부 문서는 `REFERENCE_CANDIDATE`이며 최신 사용자 결정과 위 책임 원본이 우선한다.

---

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→응용→발견·기록 순환

## 세일즈포인트

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

---

## 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

Slice에서는 전투 보조 소환수의 `수호` 또는 `견제` 중 하나만 구현한다. 소환수는 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## P0 보완 Vertical Slice

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

세션 역할:

```text
수업·연습 = 배움
시험 = 이해의 증명
학교축제 = 표현·관계·비전투 활용
현장실습 = 실제 위험 속 응용·발견
자유일정 = 휴식·준비·교류의 완충
```

### 승인된 공통 Situation Challenge

```text
상황 목표
→ 관찰 가능한 상태
→ 사용 가능한 메인·보조 글자
→ 제한 조건
→ 방향성 결과 미리보기
→ 주문 작성
→ 세계 상태 변화
→ 성공·부분 성공·실패 원인
→ 기록·후속 반응
```

네 핵심 세션은 동일한 문제·데이터 계약을 사용한다. 차이는 위험 수준, 압박, 자원, 평가, 결과, 소환수 허용, 실패 복구 방식으로 만든다.

### 자유일정

모든 슬롯은 다음 세 원형을 재사용한다.

- `휴식`: 컨디션·집중 회복과 안전 보정
- `준비`: 시험 복습·축제 준비·현장 조사 또는 소환수 조율
- `교류`: 메인 동반자 또는 핵심 인물과 관계·관점·짧은 정보 획득

보호:

- 총 슬롯 3개 유지
- 슬롯당 행동 하나 선택
- 필수 진행·정보·정답 차단 금지
- 신규 지역·전투·독립 미니게임 추가 금지
- 세 원형 사이 절대 우위 금지

### 시간 계약

- 목표 중앙값: `45~50분`
- 허용 상한: `60분`
- 첫 5분 안에 직접 작성
- 15분 안에 메인·보조 차이 이해
- 연속 플레이 강제 없음

### 내부 구현 순서

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 Vertical Slice 내부 체크포인트이며 CORE_POC가 아니다.

### 최소 저장

- 핵심 세션 시작·완료
- 자유일정 선택 전·완료
- 현장실습 전투 문제 완료 후
- 귀환·기록 완료

최소 상태는 현재 단계, 배운 글자, 세 자유일정 선택, 시험·축제·현장 결과 태그, 동반자 관계 구간, 보조 소환수 준비, 마도서 발견으로 제한한다.

---

## 주요 P1 제약

- 시험 표시 평가 축: 상황 적합성 / 주문 설계 / 실행 안정성
- 축제: 별도 맵 없이 학교 장면 상태 재사용
- 축제 결과: `ELEGANT / PRACTICAL / SPECTACULAR`
- 메인 동반자 관계 단계: 최대 3개
- 보조 소환수: 수호 또는 견제 하나
- 작성 화면 고정 정보: 목표·메인·보조·자원·위험 경고

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 자유일정은 필수 진행을 차단하지 않음
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- 현재 단계에서 Godot 구현·Codex 실행·프로필 전환·PR 병합 금지

---

## 다음 차단 결정

`GM-GATE1-APPROVAL-01`: P0 보완 계약을 포함한 Gate 1 콘셉트와 Vertical Slice 범위를 최종 승인할 것인가?

최종 승인 전 금지:

- `CORE_CONFIRMED`
- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- PR 병합
