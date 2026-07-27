# 스펠 기획 결정 원장

## 문서 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 상태: `PLANNING_IN_PROGRESS`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27N.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 승인과 Gate 1 책임 원본이 우선한다.

---

## Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 결정·검토 | 상태 |
|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견 우선, 직접 작성·자동화 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` |
| GM-AUDIENCE-01 | 목표 플레이어·상황 | 10~15분 집중형 모바일 세션 | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 선택 시 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` |
| GM-PROMISE-01 | 플레이어 약속 | 배움→설계→세계 변화 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` |
| GM-LOOP-01 | 게임플레이 Loop | 고정 중요 일정 + 자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| GM-CURVE-01 | 경험 곡선 | 첫 5분 직접 작성, 자동화 후행 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` |
| GM-CORE-BOUNDARY-01 | 프로젝트 코어 경계 | 의미 기반 작성·조합·상황 반응 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| GM-SALES-01 | 세일즈포인트 | 직접 작성·상황별 설계·학교 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| GM-BENCHMARK-01 | 벤치마킹·SWOT·VRIO·제작성 | 직접 입력 / 조합 문제 / 학교 성장 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| GM-MASCOT-01 | 소환수 구조 | 메인 동반 + 전투 보조 2계층 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| GM-VS-ROUTE-01 | 제품 검증 경로 | CORE_POC 없이 Vertical Slice로 직접 진행 | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` |
| GM-SLICE-01 | Vertical Slice 계약 | 4개 핵심 세션 + 자유일정 3회 | `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1` |
| GM-GATE1-REVIEW-01 | 적대적 범위 검토 | 현재 계약은 조건부 실패, P0 감량안 제안 | `ADVERSARIAL_REVIEW_AUTHORED_P0_P1_PROPOSED` |
| GM-GATE1-RISK-01 | P0 처리 패키지 | 사용자 결정 대기 | `USER_DECISION_REQUIRED` |

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

소환수는 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## 직접 Vertical Slice 경로

사용자 결정:

> COREPOC 없이 우리는 버티칼슬라이스로 갈거야.

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약
→ 적대적 검토·P0 처리
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

- CORE_POC: `REMOVED_BY_USER_DECISION`
- 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 별도 CORE_POC 재도입 금지

---

## 승인된 Vertical Slice 계약

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

역할:

```text
수업·연습 = 배움
시험 = 이해의 증명
학교축제 = 표현·관계·비전투 활용
현장실습 = 위험 속 응용·발견
자유일정 = 휴식·준비·관계·연구의 완충
```

보호 결정:

- 중요 일정 사이 자유일정 1회씩
- 휴식은 유효한 선택
- 필수 진행·정보·정답 차단 금지

---

## GM-GATE1-REVIEW-01 적대적 검토

책임 원본: `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`

### 판정

- 제품 약속 적합성: `PASS`
- 세일즈포인트 커버리지: `PASS`
- 학교생활 대표성: `PASS`
- 현재 1인 제작 범위: `CONDITIONAL_FAIL`
- P0 감량 후 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`

### 확인된 P0

1. 네 세션이 네 개의 별도 게임으로 분열할 위험
2. 세션별 플레이 역할 중복
3. 52~84분 시간 범위의 상한 부재
4. 자유일정이 최대 12개 독립 이벤트로 폭증
5. 터치 입력 검증 전 콘텐츠·아트 제작 위험
6. 저장·복귀 상태의 불필요한 복잡화

### 권장 P0 처리 패키지 — 미승인

1. 공통 `Situation Challenge` 계약
2. 세션별 판단·압박·결과·실패 역할 분리
3. 첫 완주 45~50분 목표, 60분 상한
4. 자유일정은 `휴식 / 준비 / 교류` 세 원형
5. 입력·피드백→공통 문제→학교→현장→연출 구현 순서
6. 세션 경계 중심 최소 저장 상태

### P1 제안

- 시험 표시 평가 축 3개
- 축제는 학교 장면 재사용
- 축제 결과는 표현 성향 태그
- 메인 동반자 관계 단계 최대 3개
- 보조 소환수는 수호 또는 견제 중 하나
- 작성 화면 정보 예산 제한

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 대화·자유일정에만 숨기지 않음
- 소환수는 작성·조합 판단을 대행하지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 자유일정은 필수 진행을 차단하지 않음
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- 현재 단계에서 Godot 구현·Codex 실행 금지

---

## 다음 결정

`GM-GATE1-RISK-01`: 권장 P0 처리 패키지를 승인해 Vertical Slice 계약을 감량·강화할 것인가?

상태: `USER_DECISION_REQUIRED`
