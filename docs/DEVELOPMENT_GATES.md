# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 1 상태: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- Gate 2 상태: `ENTERED_PLANNING_ONLY`
- 다음 Greenlight: `GM-VS-PROFILE-01 VERTICAL_SLICE_FULL_PROFILE 전환 승인`

> Gate 1 승인은 제품 콘셉트와 Vertical Slice 범위를 확정한다. 구현·런타임·성능·접근성·플레이테스트 통과를 의미하지 않는다.

---

## 1. 제품 경로

```text
Gate 1 콘셉트 정리
→ Vertical Slice 구조 계약
→ 적대적 검토
→ P0 처리 패키지 승인
→ 사용자 Gate 1 최종 승인 — 완료
→ VERTICAL_SLICE_FULL_PROFILE 전환 승인
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

### CORE_POC

- 상태: `REMOVED_BY_USER_DECISION`
- 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 다른 이름으로 재도입: `FORBIDDEN`

### Vertical Slice 계약

- 상태: `APPROVED_AT_GATE_1`
- 제작성: `CONDITIONAL_PASS_CANDIDATE`
- 최종 승인: `CONFIRMED_BY_GM-GATE1-APPROVAL-01`
- 책임 원본: `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
- 승인 증거: `docs/planning/GATE_1_FINAL_APPROVAL.md`
- 적대적 검토: `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`

---

## 2. Gate 1 — CONCEPT_APPROVAL

현재 상태: `APPROVED`

### 승인 증거

- [x] 목표 플레이어와 플레이 상황
- [x] 최상위 플레이 경험
- [x] 플레이어 약속
- [x] Core Loop와 경험 곡선
- [x] 프로젝트 코어·지원층·변경 가능한 외피
- [x] 세일즈포인트 3개
- [x] 벤치마킹·SWOT·VRIO·1인 제작성
- [x] 2계층 소환수 구조
- [x] CORE_POC 없는 직접 Slice 경로
- [x] 축약 학기형 Vertical Slice 구조
- [x] 중요 일정 사이 자유일정 3회
- [x] 적대적 범위 검토
- [x] P0 처리 패키지 승인
- [x] 공통 Situation Challenge 계약
- [x] 첫 완주 45~50분 목표·60분 상한
- [x] 자유일정 `휴식 / 준비 / 교류` 원형
- [x] 최소 저장 계약
- [x] M0~M4 내부 구현 체크포인트
- [x] 사용자 Gate 1 최종 승인

### Gate 1 승인 범위

```text
플레이어 약속
+ 비타협 프로젝트 코어
+ 세일즈포인트 3개
+ 2계층 소환수
+ 수업·시험·축제·현장실습
+ 자유일정 3회
+ 공통 Situation Challenge
+ 시간·저장·UI·범위 상한
+ Validation-First 구현 순서
```

### Gate 1 승인에 포함되지 않음

- 실행 프로필 전환
- Codex 실행
- Godot 구현
- 정량 밸런스 확정
- Android 런타임·성능·접근성 통과
- Draft PR 병합

---

## 3. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

현재 상태: `ENTERED_PLANNING_ONLY`

실행 상태: `BLOCKED_BY_PROFILE_TRANSITION`

### 구현 시작 조건

1. `GM-VS-PROFILE-01` 사용자 승인
2. 실행 프로필 `VERTICAL_SLICE_FULL_PROFILE` 전환
3. Codex read-only Plan 검수
4. 구현 브랜치·검증 매트릭스·완료 기준 확정
5. Godot 버전·렌더러·Android 대상 기기 확정
6. M0~M4 작업 순서와 중단 기준 확정
7. Android·접근성·성능 검증 매트릭스 초안
8. Balance Tuning Backlog 초안

현재 판정: `IMPLEMENTATION_NOT_READY`

### 승인된 실행 순서

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
→ QA·외부 플레이테스트
```

M0~M4는 CORE_POC가 아니라 Vertical Slice 내부 체크포인트다.

### 구현 중단 조건

- 입력 실패와 설계 실패를 구분하지 못함
- 직접 작성 피로가 핵심 경험을 방해
- 공통 문제 계약으로 두 번째 문제를 추가할 수 없음
- 세션별 전용 프레임워크가 필요해짐
- 첫 완주 상한 60분을 구조적으로 초과
- 자유일정·관계 제작량이 핵심 세션보다 커짐
- 보조 소환수 운용이 주문 설계보다 복잡
- Android 주요 화면비에서 작성 영역이 성립하지 않음

---

## 4. 승인된 P0 계약

### 공통 Situation Challenge

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

### 세션 역할

- 수업: 원리 이해·비교
- 시험: 제한 조건 안의 증명
- 축제: 표현·개성·관계
- 현장: 위험 속 우선순위·재설계

### 시간

- 목표: `45~50분`
- 상한: `60분`
- 첫 5분 직접 작성
- 15분 안에 메인·보조 이해
- 연속 플레이 강제 없음

### 자유일정

- `휴식 / 준비 / 교류`
- 총 3회
- 슬롯당 한 행동
- 공통 이벤트 구조·결과 태그 재사용
- 필수 진행·정보·정답 차단 금지

### 저장

- 세션 시작·완료
- 자유일정 선택 전·완료
- 현장 전투 문제 완료 후
- 귀환·기록 완료 후
- 최소 결과 태그만 저장

---

## 5. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- Codex 미실행
- 런타임·Android·접근성·성능·플레이테스트 `NOT_RUN`
- 정량 임계값 `PLAYTEST_TUNING_REQUIRED`
- PR은 Draft 유지
- 병합하지 않음

---

## 6. 다음 Greenlight

`GM-VS-PROFILE-01`: 실행 프로필을 `PLANNING_ONLY_PROFILE`에서 `VERTICAL_SLICE_FULL_PROFILE`로 전환하고 Codex read-only Plan 및 구현 준비 문서 작성을 시작할 것인가?
