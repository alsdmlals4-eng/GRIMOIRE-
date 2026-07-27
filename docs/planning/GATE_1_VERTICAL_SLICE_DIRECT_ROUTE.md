# 스펠 Gate 1 — CORE_POC 없는 직접 Vertical Slice 경로

## 1. 문서 상태

- 프로젝트: `스펠` (임시)
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 경로 결정 ID: `GM-VS-ROUTE-01`
- 계약 결정 ID: `GM-SLICE-01`
- 위험 처리 결정 ID: `GM-GATE1-RISK-01`
- 최종 승인 결정 ID: `GM-GATE1-APPROVAL-01`
- 경로 상태: `DIRECT_VERTICAL_SLICE_ROUTE_APPROVED_AT_GATE_1`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 계약: `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT`
- 제작성: `CONDITIONAL_PASS_CANDIDATE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- Vertical Slice 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 다음 결정: `GM-VS-PROFILE-01`

> **별도 CORE_POC는 만들지 않는다. 직접 작성·의미 기반 조합·마법학교 학습 순환·2계층 소환수의 핵심 가설은 승인된 축약 학기형 Vertical Slice 안에서 검증한다.**

---

## 2. 승인된 제품 경로

```text
Gate 1 콘셉트 정리
→ 축약 학기형 Vertical Slice 구조 승인
→ 적대적 범위 검토
→ P0 처리 패키지 승인
→ 사용자 Gate 1 최종 승인 — 완료
→ VERTICAL_SLICE_FULL_PROFILE 전환 승인
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

기존 `GM-POC-01`, `CORE_POC 계약 승인`, `CORE_POC 선행 구현`, `CORE_POC 통과` 요구는 `SUPERSEDED_BY_GM-VS-ROUTE-01`이다.

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

- 수업: 배움과 원리 비교
- 시험: 제한 조건 안의 이해 증명
- 축제: 표현·개성·관계·비전투 활용
- 현장: 위험 속 우선순위·재설계·발견
- 자유일정: 휴식·준비·교류의 완충

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

수업·시험·축제·현장은 같은 문제·데이터 계약을 사용한다.

### 자유일정

- `휴식 / 준비 / 교류`
- 총 3회
- 슬롯당 한 행동
- 필수 진행 차단 없음
- 신규 지역·전투·독립 미니게임 없음

### 시간

- 목표 `45~50분`
- 상한 `60분`
- 첫 5분 직접 작성
- 15분 안에 메인·보조 이해
- 연속 플레이 강제 없음

### 저장

- 세션 시작·완료
- 자유일정 선택 전·완료
- 현장 전투 문제 완료 후
- 귀환·기록 완료
- 최소 결과 태그만 저장

---

## 5. Validation-First 구현 순서

```text
M0 입력·피드백
→ 짧은 심볼 3개, 넓은 판정, 시간 처리 비교

M1 공통 Situation Challenge
→ 관찰·작성·세계 변화·실패 피드백

M2 학교 세션
→ 수업·시험·축제를 공통 계약으로 연결

M3 현장실습
→ 전투·환경 문제와 보조 소환수 연결

M4 저장·복귀·최종 연출
→ UI·아트·사운드·관계 반응 통합
```

M0~M4는 별도 제품 단계나 CORE_POC가 아니라 Vertical Slice 내부 체크포인트다.

순서 보호:

- M0에서 입력 실패와 설계 실패를 구분
- M1 전 축제 전용 연출·장문 대화·다수 자산 확대 금지
- M2까지 학교 장면 세트 재사용
- 공통 Situation Challenge 검증 전 세션별 전용 시스템 제작 금지

---

## 6. 내부 검증 항목

### 핵심 마법

- 첫 5분 직접 작성
- 메인·보조 역할 이해
- 입력 실패와 설계 실패 분리
- 최소 두 가지 유효 해결법
- 실패 원인 이해와 재설계
- 시험·축제·현장에서 같은 문법 재사용

### 학교생활

- 네 핵심 세션의 역할 구분
- 자유일정 3회의 휴식·준비·교류 가치
- 휴식이 손해 선택이 아님
- 자유일정이 필수 진행을 차단하지 않음

### 모바일·제품

- 완전 정지·감속·실시간 비교
- 손가락 가림·피로·인지 부하
- Android 실제 기기와 주요 화면비
- 세션 경계 저장·복귀
- 첫 완주 60분 이내
- 두 번째 문제의 데이터 재사용성

---

## 7. 포함·제외 경계

### 포함

- 메인 글자 1개, 보조 글자 2개
- 작성 심볼 3개
- 학교 장면 세트 1개
- 축제 장식 상태 1개
- 현장 구역 1개
- 교수 1명, 핵심 관계 인물 1명
- 메인 동반 소환수 1체
- 수호 또는 견제형 보조 소환수 1체
- 연습·시험·축제 문제 각 1개
- 현장 전투·환경 문제 각 1개
- 자유일정 3회
- 저장·복귀
- 핵심 UI·아트·사운드

### 제외

- 3년·6학기 전체
- 다수 시험·축제 부스·현장 지역
- 대규모 관계·연애 분기
- 완성 주문 스톡
- 복잡한 소환수 경제·진화·충전
- 다중 상태이상·광범위한 조합표
- 고정밀 자유 손글씨 인식
- 온라인·협동·풀보이스

---

## 8. 승인과 실행의 분리

Gate 1은 승인됐지만 다음은 승인되지 않았다.

- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- 런타임·Android·성능·접근성 통과
- PR 병합

---

## 9. 다음 단계

`GM-VS-PROFILE-01`: 실행 프로필을 `PLANNING_ONLY_PROFILE`에서 `VERTICAL_SLICE_FULL_PROFILE`로 전환하고 Codex read-only Plan 및 구현 준비 문서 작성을 시작할 것인가?
