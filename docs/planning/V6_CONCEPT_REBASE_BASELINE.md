# 스펠 v6 콘셉트 재기획 기준선

## 문서 상태

- 프로젝트: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 상태: `GATE_1_WORKING_BASELINE`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 프로젝트 코어: `CORE_CANDIDATE`
- Gate 1: `UNVERIFIED`
- 구현: `NOT_STARTED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- Vertical Slice 계약: `CONFIRMED_BY_GM-SLICE-01_PENDING_P0_AMENDMENT`
- 적대적 검토: `AUTHORED_BY_GM-GATE1-REVIEW-01`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`

이 문서는 Gate 1의 통합 상태를 요약한다. 세부 규칙은 각 단일 책임 원본이 우선한다.

---

## 1. 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 2. 최상위 경험

> **마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.**

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

## 3. 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→응용→발견·기록 순환

## 4. 세일즈포인트

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

## 5. 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

소환수는 주문 설계·글자 작성·정답 제시를 대행하지 않는다.

---

## 6. 직접 Vertical Slice 경로

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약
→ 적대적 검토·P0 처리
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

별도 CORE_POC는 만들지 않으며 검증 책임은 Slice에 흡수한다.

---

## 7. 승인된 축약 학기형 Vertical Slice

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

보호:

- 중요 일정 사이 자유일정 1회씩
- 휴식은 유효한 정식 선택
- 자유일정은 필수 진행·정보·정답을 차단하지 않음

---

## 8. 적대적 검토 결과

책임 원본: `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`

### 종합 판정

- 제품 약속 적합성: `PASS`
- 세일즈포인트 커버리지: `PASS`
- 학교생활 대표성: `PASS`
- 현재 1인 제작 범위: `CONDITIONAL_FAIL`
- P0 감량 후 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`

### P0 위험

1. 네 세션이 네 개의 별도 게임으로 분열
2. 세션별 플레이 역할 중복
3. 52~84분 범위에 첫 완주 상한이 없음
4. 자유일정이 최대 12개 독립 이벤트로 폭증
5. 터치 입력 검증 전 콘텐츠·아트 제작
6. 저장 상태의 불필요한 복잡화

### 권장 P0 처리 패키지 — 미승인

1. 공통 `Situation Challenge` 계약
2. 세션별 판단·압박·결과·실패 역할 분리
3. 첫 완주 45~50분 목표, 60분 상한
4. 자유일정 `휴식 / 준비 / 교류` 세 원형
5. 입력·피드백→공통 문제→학교→현장→연출 구현 순서
6. 세션 경계 중심 최소 저장 상태

이 패키지는 네 핵심 세션과 자유일정 3회를 유지한다.

---

## 9. P1 제안

- 시험 표시 평가 축 3개
- 축제는 학교 장면을 장식 상태로 재사용
- 축제 결과는 표현 성향 태그
- 메인 동반자 관계 단계 최대 3개
- 보조 소환수는 수호 또는 견제 중 하나만 구현
- 작성 화면 정보 예산 제한

---

## 10. 검증 경계

- 터치 작성의 재미·피로: `BLOCKED_UNVERIFIED`
- 완전 정지·감속·실시간: `BLOCKED_UNVERIFIED`
- 세션별 실제 차별성: `BLOCKED_UNVERIFIED`
- 자유일정 세 원형 균형: `PLAYTEST_TUNING_REQUIRED`
- Android 성능·화면비·저장: `NOT_RUN`
- 첫 완주 60분 달성: `PLAYTEST_TUNING_REQUIRED`
- 두 번째 콘텐츠 제작성: `NOT_RUN`

---

## 11. 다음 결정

`GM-GATE1-RISK-01`: 권장 P0 처리 패키지를 승인해 Vertical Slice 계약을 감량·강화할 것인가?

상태: `USER_DECISION_REQUIRED`
