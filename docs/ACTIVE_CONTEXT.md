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
- Vertical Slice 계약: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`
- 적대적 검토: `ADVERSARIAL_REVIEW_AUTHORED_P0_P1_PROPOSED`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`
- 다음 차단 결정: `GM-GATE1-RISK-01`

개별 방향과 Vertical Slice 계약 승인은 `CORE_CONFIRMED`, Gate 1 최종 승인, 실행 프로필 전환 또는 구현 승인을 의미하지 않는다.

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
11. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27N.md`
12. `docs/planning/DECISION_LOG.md`
13. `docs/DEVELOPMENT_GATES.md`
14. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 결정과 위 책임 원본이 우선한다.

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

## 승인된 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

소환수는 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## 승인된 축약 학기형 Vertical Slice

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
자유일정 = 휴식·준비·관계·연구의 완충
```

보호 결정:

- 중요 일정 사이 자유일정 1회씩
- 휴식은 유효한 정식 선택
- 자유일정은 필수 진행·정보·정답을 차단하지 않음
- 별도 CORE_POC 재도입 금지

---

## 적대적 검토 결과

### 종합 판정

- 제품 약속 적합성: `PASS`
- 세일즈포인트 커버리지: `PASS`
- 학교생활 대표성: `PASS`
- 현재 1인 제작 범위: `CONDITIONAL_FAIL`
- P0 감량 후 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`

현재 계약을 그대로 제작하면 다음 위험이 있다.

- 수업·시험·축제·현장실습이 네 개의 별도 게임으로 분열
- 자유일정이 최대 12개 독립 이벤트로 폭증
- 52~84분 범위가 모바일 테스트를 희석
- 입력 검증보다 콘텐츠·연출 제작이 선행
- 저장 상태와 관계·결과 분기가 불필요하게 확대

### 권장 P0 처리 패키지 — 미승인

1. 모든 세션을 공통 `Situation Challenge` 계약으로 제작
2. 세션별 판단·압박·결과·실패 역할을 분리
3. 첫 완주 `45~50분` 목표, `60분` 상한
4. 자유일정은 `휴식 / 준비 / 교류` 세 원형으로 통일
5. 구현 순서를 입력·피드백→공통 문제→학교 세션→현장→연출로 고정
6. 저장은 세션 경계와 현장 문제 전환 지점의 최소 상태로 제한

이 패키지는 수업·시험·축제·현장실습과 자유일정 3회를 제거하지 않는다.

---

## 주요 P1 제안

- 시험의 플레이어 표시 평가 축은 3개
- 축제는 별도 맵이 아니라 학교 장면의 장식 상태로 재사용
- 축제 결과는 대규모 분기보다 표현 성향 태그로 제한
- 메인 동반자 관계 단계는 Slice에서 최대 3단계
- 전투 보조 소환수는 수호 또는 견제 중 하나만 구현
- 작성 화면 고정 정보는 목표·메인·보조·자원·위험 경고로 제한

---

## 다음 차단 결정

`GM-GATE1-RISK-01`: 권장 P0 처리 패키지를 승인해 Vertical Slice 계약을 감량·강화할 것인가?

승인 전 금지:

- 사용자 Gate 1 최종 승인
- `CORE_CONFIRMED`
- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
