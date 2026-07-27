# 스펠 기획 결정 원장

## 문서 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 최신 결정 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27P.md`
- 최종 승인 원본: `docs/planning/GATE_1_FINAL_APPROVAL.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 결정과 Gate 1 승인 원본이 우선한다.

---

## Gate 1 결정 인덱스

| 결정 ID | 결정 | 상태 |
|---|---|---|
| GM-CORE-01 | 조합·발견을 주 경험으로 확정 | `CONFIRMED` |
| GM-AUDIENCE-01 | 10~15분 단위 모바일 플레이 | `CONFIRMED` |
| GM-NARRATIVE-03 | 기본은 짧게, 선택 시 깊게 | `CONFIRMED` |
| GM-PROMISE-01 | 배움→설계→세계 변화 | `CONFIRMED` |
| GM-LOOP-01 | 수업·연습·시험·축제·현장 + 자유일정 | `CONFIRMED` |
| GM-CURVE-01 | 첫 5분 직접 작성·설계, 자동화 후행 | `CONFIRMED` |
| GM-CORE-BOUNDARY-01 | 의미 기반 작성·조합·상황 반응·학습 순환 | `CONFIRMED` |
| GM-SALES-01 | 직접 작성·상황별 설계·학교 학습 발견 | `CONFIRMED` |
| GM-BENCHMARK-01 | 직접 입력 / 조합 문제 / 학교 성장 3그룹 | `RESEARCH_AUTHORED` |
| GM-MASCOT-01 | 메인 동반 + 전투 보조 2계층 | `CONFIRMED` |
| GM-VS-ROUTE-01 | CORE_POC 없이 Vertical Slice로 직접 진행 | `CONFIRMED` |
| GM-SLICE-01 | 4개 핵심 세션 + 자유일정 3회 | `CONFIRMED` |
| GM-GATE1-REVIEW-01 | 적대적 범위·제작성 검토 | `AUTHORED` |
| GM-GATE1-RISK-01 | P0 처리 패키지 전체 승인 | `CONFIRMED` |
| GM-GATE1-APPROVAL-01 | Gate 1 전체 최종 승인 | `APPROVED` |

---

## 승인된 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 승인된 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→평가·표현→응용→발견·기록 순환

상태: `CORE_CONFIRMED`

## 승인된 세일즈포인트

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
= 작성 시간을 확보하는 전술 지원
```

Vertical Slice에서는 보조 소환수의 수호 또는 견제 하나만 구현한다. 두 소환수 모두 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## 승인된 직접 Vertical Slice 경로

```text
Gate 1 콘셉트 정리
→ Vertical Slice 구조 계약
→ 적대적 검토
→ P0 처리 패키지 승인
→ 사용자 Gate 1 최종 승인 — 완료
→ VERTICAL_SLICE_FULL_PROFILE 전환 승인
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

- CORE_POC: `REMOVED_BY_USER_DECISION`
- 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 별도 CORE_POC 재도입 금지

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

세션 역할:

| 세션 | 역할 |
|---|---|
| 수업·연습 | 원리 이해와 비교 |
| 실기시험 | 제한 조건 안에서 이해 증명 |
| 학교축제 | 표현·개성·관계·비전투 활용 |
| 현장실습 | 위험 속 우선순위·재설계·발견 |

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

### 자유일정

- `휴식`: 컨디션·집중 회복과 안전 보정
- `준비`: 시험 복습·축제 준비·현장 조사 또는 소환수 조율
- `교류`: 메인 동반자 또는 핵심 인물과 관계·관점 획득
- 중요 일정 사이 총 3회
- 슬롯당 행동 하나
- 필수 진행·정보·정답 차단 금지
- 신규 지역·전투·독립 미니게임 추가 금지

### 시간

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 첫 5분 직접 작성
- 15분 안에 메인·보조 이해
- 연속 플레이 강제 없음

### 구현 순서

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
- 현장 전투 문제 완료 후
- 귀환·기록 완료
- 현재 단계·글자·선택·결과 태그·동반자·소환수·마도서 발견만 저장

---

## 승인된 P1 제약

- 시험 표시 평가 축: 상황 적합성 / 주문 설계 / 실행 안정성
- 축제는 학교 장면 상태 재사용
- 축제 결과: `ELEGANT / PRACTICAL / SPECTACULAR`
- 메인 동반자 관계 단계 최대 3개
- 보조 소환수는 수호 또는 견제 하나
- 작성 화면 고정 정보: 목표·메인·보조·자원·위험 경고

---

## Gate 1 승인과 실행 승인 분리

Gate 1 승인에 포함되지 않는 항목:

- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- 런타임·Android·성능·접근성 검증 통과
- 정량 밸런스 확정
- Draft PR 병합

현재 실행 프로필은 `PLANNING_ONLY_PROFILE`을 유지한다.

---

## 보류 항목

### `PLAYTEST_TUNING_REQUIRED`

- 각 세션의 정확한 시간
- 입력 판정 허용 범위
- 완전 정지·감속·실시간 최종안
- 자유일정 보정 수치
- 시험 점수·성적 보상
- 보조 소환수 수치

### `DEFERRED_CONTENT_DATA`

- 첫 메인·보조 글자 명칭과 효과
- 시험 문제 소재
- 축제 대표 활동
- 현장실습 사건·적·환경
- 교수·학생·동반자 대사

---

## 다음 결정

`GM-VS-PROFILE-01`: 실행 프로필을 `PLANNING_ONLY_PROFILE`에서 `VERTICAL_SLICE_FULL_PROFILE`로 전환하고 Codex read-only Plan 및 구현 준비 문서 작성을 시작할 것인가?

상태: `NEXT_BLOCKING_DECISION`
