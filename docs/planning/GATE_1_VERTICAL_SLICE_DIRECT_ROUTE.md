# 스펠 — CORE_POC 없는 직접 Vertical Slice 경로

## 현재 상태

- 경로 결정 ID: `GM-VS-ROUTE-01`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 계약: `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT`
- 적대적 검토 루프: `PASS_WITH_FOLLOWUP`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 다음 결정: `GM-VISUAL-PRESENTATION-01`

> **별도 CORE_POC는 만들지 않는다. 직접 작성·의미 기반 조합·학교 학습 순환·2계층 소환수는 승인된 Vertical Slice 내부 체크포인트와 외부 플레이테스트로 검증한다.**

---

## 승인된 제품 경로

```text
Gate 1 콘셉트·코어·Slice 승인 — 완료
→ Gate 2 적대적 검토 루프 — 완료
→ 시각·사운드 프리프로덕션
→ VERTICAL_SLICE_FULL_PROFILE 전환 재검토
→ Codex read-only Plan
→ M0~M4 Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

사용자 최신 작업 순서에 따라 `GM-VS-PROFILE-01`은 폐기하지 않고 시각·사운드 프리프로덕션 뒤로 이동한다.

---

## 승인된 Vertical Slice

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

핵심 계약:

- 모든 세션은 공통 `Situation Challenge` 사용
- 첫 완주 목표 `45~50분`, 상한 `60분`
- 자유일정은 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 수업·시험·축제·현장의 역할 차이 유지
- 메인 동반 소환수와 전투 보조 소환수의 책임 분리

---

## Validation-First 체크포인트

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 별도 제품 단계나 CORE_POC가 아니다.

순서 보호:

- M0에서 입력 실패와 설계 실패 분리
- M1 확인 전 축제 전용 연출·장문 대화·다수 자산 확대 금지
- M2까지 학교 장면 세트 재사용
- 공통 문제 계약 검증 전 세션별 전용 시스템 금지

---

## 적대적 검토 후 프리프로덕션 경로

```text
GM-VISUAL-PRESENTATION-01
화면 방향·카메라·게임 표현 구조
→ GM-CHARACTER-PRESENTATION-01
주인공·NPC·소환수 표현 수준
→ ART-STYLE-01
그림체 후보 비교·선정
→ ART-BIBLE-01
시각 규칙·접근성·FX 규칙
→ ASSET-SPEC-01
자산 수량·상태·변형·기술 규격
→ 캐릭터·배경·효과·사운드 작업
→ GM-VS-PROFILE-01 재검토
```

그림체보다 화면 구조를 먼저 결정한다. 시각 표현 구조가 미정인 상태에서 대량 이미지·사운드를 제작하지 않는다.

---

## 현재 검증 항목

### 핵심 마법

- 첫 5분 직접 작성
- 메인·보조 역할 이해
- 입력 실패와 설계 실패 분리
- 최소 두 가지 유효 해결법
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
- 최종 아트·FX의 가독성
- 사운드와 무음 대체 정보

---

## 포함·제외 경계

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
- 핵심 UI·아트·사운드
- 저장·복귀

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

## 현재 금지

- 별도 CORE_POC 재도입
- 시각 표현 구조 전 대량 자산 생성
- 실행 프로필 자동 전환
- Codex 실행
- Godot 구현
- 런타임 완료 주장
- 사용자 승인 없는 PR 병합

## 다음 단계

`GM-VISUAL-PRESENTATION-01`: Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄 것인가?
