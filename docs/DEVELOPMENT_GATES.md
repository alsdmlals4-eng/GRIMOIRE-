# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 현재 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 2: `ENTERED_PLANNING_ONLY`
- 적대적 검토 루프: `PASS_WITH_FOLLOWUP`
- 다음 Greenlight: `GM-VISUAL-PRESENTATION-01`

> Gate 1 승인은 콘셉트와 범위를 확정한다. 구현·런타임·성능·접근성·플레이테스트 통과를 의미하지 않는다.

---

## 1. 현재 제품 경로

```text
Gate 1 최종 승인 — 완료
→ Gate 2 적대적 검토 루프 — 완료
→ 화면 방향·카메라·게임 표현 구조
→ 캐릭터 표현 수준
→ 그림체 선정
→ Art Bible·Asset Specification
→ 캐릭터·배경·효과·사운드 작업
→ VERTICAL_SLICE_FULL_PROFILE 전환 재검토
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
```

`GM-VS-PROFILE-01`은 폐기하지 않고 아트·사운드 프리프로덕션 이후로 순서를 이동한다.

### CORE_POC

- 상태: `REMOVED_BY_USER_DECISION`
- 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 다른 이름으로 재도입: `FORBIDDEN`

---

## 2. Gate 1 — CONCEPT_APPROVAL

현재 상태: `APPROVED`

승인 범위:

```text
플레이어 약속
+ 비타협 프로젝트 코어
+ 세일즈포인트 3개
+ 2계층 소환수
+ 수업·시험·축제·현장실습
+ 자유일정 3회
+ 공통 Situation Challenge
+ 시간·저장·UI·범위 상한
+ M0~M4 Validation-First 순서
```

승인 증거:

- `docs/planning/GATE_1_FINAL_APPROVAL.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

---

## 3. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

현재 상태: `ENTERED_PLANNING_ONLY`

### 3.1 적대적 검토 루프

- 보고서: `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md`
- 판정: `PASS_WITH_FOLLOWUP`
- 코어·Slice 범위: `NO_CHANGE`
- 문서 상태 회귀: `FIXED`
- 아트·사운드 대량 제작: `BLOCKED_BY_VISUAL_PRESENTATION_DECISIONS`

### 3.2 시각·사운드 프리프로덕션 진입 조건

1. `GM-VISUAL-PRESENTATION-01` 화면 방향·카메라·표현 구조
2. `GM-CHARACTER-PRESENTATION-01` 캐릭터 표현 수준
3. `ART-STYLE-01` 그림체 후보 비교·사용자 선정
4. `ART-BIBLE-01` 색·선·명암·재질·실루엣·배경·FX·접근성
5. `ASSET-SPEC-01` 자산 수량·상태·변형·기술 규격
6. `AUDIO-DIRECTION-01` 사운드 정체성·우선순위·무음 대체
7. Asset License Ledger 후보 등록과 승인

### 3.3 대량 자산 제작 금지 조건

- 화면 방향이 미정
- 카메라·월드 표현이 미정
- 대화·탐색·마법 작성 화면 관계가 미정
- 주인공·NPC·소환수 표현 수준이 미정
- 해상도·화면비·안전 영역이 미정
- 자산 수량 예산과 기술 규격이 미정
- 그림체 기준 샷 사용자 승인 없음

스타일 비교용 소수 기준 샷은 별도 승인 후 제작할 수 있다.

### 3.4 구현 시작 조건

1. `GM-VS-PROFILE-01` 사용자 승인
2. 실행 프로필 `VERTICAL_SLICE_FULL_PROFILE` 전환
3. Codex read-only Plan 검수
4. 구현 브랜치·검증 매트릭스·완료 기준 확정
5. Godot 버전·렌더러·Android 대상 기기 확정
6. Save Schema v1과 Situation Challenge 데이터 계약
7. Android·접근성·성능 검증 매트릭스
8. Balance Tuning Backlog

현재 판정: `IMPLEMENTATION_NOT_READY`

---

## 4. 승인된 Vertical Slice 계약

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

### 시간·자유일정·저장

- 목표: `45~50분`
- 상한: `60분`
- 첫 5분 직접 작성
- 15분 안에 메인·보조 이해
- 자유일정: `휴식 / 준비 / 교류`
- 저장: 세션 경계 중심 최소 상태

### 내부 구현 순서

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 CORE_POC가 아니라 Vertical Slice 내부 체크포인트다.

---

## 5. 구현 중단 조건

- 입력 실패와 설계 실패를 구분하지 못함
- 직접 작성 피로가 핵심 경험을 방해
- 공통 문제 계약으로 두 번째 문제를 추가할 수 없음
- 세션별 전용 프레임워크가 필요해짐
- 첫 완주가 60분을 구조적으로 초과
- 자유일정·관계 제작량이 핵심 세션보다 커짐
- 보조 소환수 운용이 주문 설계보다 복잡
- Android 주요 화면비에서 작성 영역이 성립하지 않음
- 최종 아트·FX가 글자 궤적·위험·대상을 가림

---

## 6. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- Codex 미실행
- 이미지·사운드 자산 생성 미착수
- 외부 자산·폰트·사운드 라이선스 조사 `NOT_RUN`
- 런타임·Android·접근성·성능·플레이테스트 `NOT_RUN`
- 정량 임계값 `PLAYTEST_TUNING_REQUIRED`
- PR은 Draft 유지
- 병합하지 않음

---

## 7. 다음 Greenlight

`GM-VISUAL-PRESENTATION-01`

Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄지 결정한다.
