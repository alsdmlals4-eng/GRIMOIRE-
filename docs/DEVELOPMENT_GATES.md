# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 다음 Greenlight: `GM-GATE1-RISK-01 P0 처리 패키지 승인`

> 게이트는 문서 존재만으로 통과하지 않는다. 관찰 가능한 결과와 증거로 판정하며 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 표시한다.

---

## 1. 현재 상태

- 프로젝트 코어: `CORE_CANDIDATE`
- Gate 1: `UNVERIFIED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- Vertical Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Vertical Slice 계약: `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1`
- 적대적 검토: `ADVERSARIAL_REVIEW_AUTHORED_P0_P1_PROPOSED`
- 현재 1인 제작 범위: `CONDITIONAL_FAIL`
- P0 감량 후 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1 최종 승인: `BLOCKED_BY_P0_DECISION`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`

---

## 2. 확보된 Gate 1 산출물

- [x] 목표 플레이어·플레이 상황
- [x] 최상위 플레이 경험
- [x] 플레이어 약속
- [x] 게임플레이 Loop·경험 곡선
- [x] 프로젝트 코어 경계
- [x] 세일즈포인트 3개
- [x] 벤치마킹·SWOT·VRIO·1인 제작성
- [x] 2계층 소환수 구조
- [x] CORE_POC 없는 직접 Slice 경로
- [x] 축약 학기형 Vertical Slice 계약
- [x] 중요 일정 사이 자유일정 1회씩
- [x] 적대적 콘셉트·범위 검토
- [x] P0·P1 위험 및 처리안 제안
- [ ] `GM-GATE1-RISK-01` P0 처리 패키지 사용자 승인
- [ ] P0 승인안의 Vertical Slice 계약 반영
- [ ] 사용자 Gate 1 최종 승인

현재 판정: `GATE_1_REVIEW_COMPLETE / P0_DECISION_REQUIRED`

---

## 3. 적대적 검토 P0

1. 네 핵심 세션이 네 개의 별도 게임으로 분열
2. 수업·시험·축제·현장실습의 플레이 역할 중복
3. 52~84분 범위에 첫 완주 상한이 없음
4. 자유일정이 최대 12개 독립 이벤트로 폭증
5. 터치 입력 검증보다 콘텐츠·아트 제작이 선행
6. 저장·복귀 상태가 초기 범위보다 복잡해짐

책임 원본: `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`

---

## 4. 권장 P0 처리 패키지 — 미승인

1. 공통 `Situation Challenge` 계약으로 수업·시험·축제·현장을 제작
2. 세션별 판단·압박·결과·실패 역할 분리
3. 첫 완주 `45~50분` 목표, `60분` 상한
4. 자유일정은 `휴식 / 준비 / 교류` 세 원형
5. 구현 순서는 입력·피드백→공통 문제→학교→현장→연출
6. 저장은 세션 경계와 현장 문제 전환 지점의 최소 상태

이 패키지는 다음을 제거하지 않는다.

- 수업·교내 연습
- 실기시험
- 학교축제
- 현장실습
- 중요 일정 사이 자유일정 3회
- 휴식의 유효성

---

## 5. 구현 Definition of Ready

구현 시작 조건:

1. `GM-GATE1-RISK-01` P0 처리 패키지 승인
2. 승인안을 Vertical Slice 계약·Loop·Registry에 반영
3. 사용자 Gate 1 최종 승인
4. `VERTICAL_SLICE_FULL_PROFILE` 전환 승인
5. Codex read-only Plan 검수
6. Godot 버전·렌더러·Android 대상 기기 확정
7. 구현 브랜치·검증 매트릭스·완료 기준 승인

현재 판정: `IMPLEMENTATION_NOT_READY`

---

## 6. Gate 1 통과 금지 조건

- P0 결정 없이 Gate 1 최종 승인
- 사용자 승인 없는 `CORE_CONFIRMED`
- 세션별 전용 게임 시스템 제작
- 자유일정마다 독립 미니게임·지역·장문 분기 제작
- 첫 완주 시간 상한 부재
- 휴식을 명백한 손해 선택으로 설계
- 터치 입력 검증 전 축제·관계·연출 자산 대량 제작
- 저장 범위를 전투 중 임의 저장·대화 한 줄 저장까지 확대
- 별도 CORE_POC를 다른 이름으로 재도입

---

## 7. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

현재 상태: `NOT_ENTERED`

진입 전제:

- P0 패키지 승인·반영
- Gate 1 최종 승인
- 실행 프로필 전환
- Codex Plan 검수

권장 구현 체크포인트:

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 Vertical Slice 내부 체크포인트이며 별도 CORE_POC가 아니다.

---

## 8. 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- 런타임·Android·접근성·성능·플레이테스트 `NOT_RUN`
- 정지·감속·실시간 최종안 `BLOCKED_UNVERIFIED`
- 첫 완주 시간·자유일정 균형 `PLAYTEST_TUNING_REQUIRED`
- PR은 Draft 유지
- 병합하지 않음
