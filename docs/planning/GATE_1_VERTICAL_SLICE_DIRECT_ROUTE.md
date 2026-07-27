# 스펠 Gate 1 — CORE_POC 없는 직접 Vertical Slice 경로

## 1. 문서 상태

- 프로젝트: `스펠` (임시)
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 경로 결정 ID: `GM-VS-ROUTE-01`
- 경로 상태: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Vertical Slice 계약: `CONFIRMED_BY_GM-SLICE-01_PENDING_P0_AMENDMENT`
- 적대적 검토: `AUTHORED_BY_GM-GATE1-REVIEW-01`
- 현재 범위 제작성: `CONDITIONAL_FAIL`
- P0 감량 후 제작성: `CONDITIONAL_PASS_CANDIDATE`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 구현: `NOT_STARTED`
- Gate 1: `UNVERIFIED`
- 다음 결정: `GM-GATE1-RISK-01`

이 문서는 별도 CORE_POC 없이 검증 중심 Vertical Slice로 직접 이동하는 제품 경로를 책임진다. 정확한 Slice 범위는 `GATE_1_VERTICAL_SLICE_CONTRACT.md`, 적대적 검토는 `GATE_1_ADVERSARIAL_REVIEW.md`가 책임진다.

> **별도 CORE_POC는 만들지 않는다. 핵심 가설을 축약 학기형 Vertical Slice 안에서 검증하되, P0 범위 위험을 처리하기 전에는 Gate 1 최종 승인과 구현으로 이동하지 않는다.**

---

## 2. 현재 제품 경로

```text
Gate 1 콘셉트 정리
→ GM-SLICE-01 축약 학기형 Slice 계약
→ GM-GATE1-REVIEW-01 적대적 검토
→ GM-GATE1-RISK-01 P0 처리 패키지 결정
→ 승인안 계약 반영
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

기존 `GM-POC-01`, CORE_POC 계약·선행 구현·통과 요구는 `SUPERSEDED_BY_GM-VS-ROUTE-01`이다.

---

## 3. 승인된 Slice 구조

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

보호 결정:

- 수업·시험·학교축제·현장실습을 모두 경험
- 중요 일정 사이 자유일정 1회씩
- 휴식은 유효한 정식 선택
- 자유일정은 필수 진행·정보·정답을 차단하지 않음

---

## 4. 적대적 검토 판정

### 현재 계약 그대로

`NO-GO_FOR_GATE_1_FINAL_APPROVAL`

주요 원인:

1. 네 세션이 네 개의 별도 게임으로 분열할 위험
2. 세션별 플레이 역할 중복
3. 52~84분 범위에 첫 완주 상한이 없음
4. 자유일정이 최대 12개 독립 이벤트로 폭증
5. 터치 입력 검증보다 콘텐츠·아트 제작이 선행
6. 저장 상태가 초기 범위보다 복잡해짐

### P0 감량 후

`CONDITIONAL_GO_CANDIDATE_FOR_GATE_1_FINAL_APPROVAL`

---

## 5. 권장 P0 처리 패키지 — 미승인

1. 모든 핵심 세션을 공통 `Situation Challenge` 계약으로 제작
2. 수업·시험·축제·현장의 판단·압박·결과·실패 역할 분리
3. 첫 완주 `45~50분` 목표, `60분` 상한
4. 자유일정은 `휴식 / 준비 / 교류` 세 원형으로 통일
5. 구현 순서는 입력·피드백→공통 문제→학교→현장→연출
6. 저장은 세션 경계와 현장 문제 전환 지점의 최소 상태

이 패키지는 네 핵심 세션과 자유일정 3회를 제거하지 않는다.

---

## 6. Validation-First 구현 순서 제안

```text
M0 입력·피드백
→ 짧은 심볼 3개·넓은 판정·시간 처리 비교

M1 공통 Situation Challenge
→ 관찰·작성·세계 변화·실패 피드백

M2 학교 세션
→ 수업·시험·축제를 공통 계약으로 연결

M3 현장실습
→ 전투·환경 문제·보조 소환수 연결

M4 저장·복귀·최종 연출
→ UI·아트·사운드·관계 반응 통합
```

M0~M4는 Slice 내부 체크포인트이며 별도 CORE_POC가 아니다.

---

## 7. 현재 금지

- P0 결정 전 Gate 1 최종 승인
- `CORE_CONFIRMED`
- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- 별도 CORE_POC 재도입
- PR 병합

---

## 8. 다음 결정

`GM-GATE1-RISK-01`: 권장 P0 처리 패키지를 승인해 Vertical Slice 계약을 감량·강화할 것인가?

상태: `USER_DECISION_REQUIRED`
