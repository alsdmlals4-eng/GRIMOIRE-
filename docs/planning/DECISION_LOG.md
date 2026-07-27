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
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27O.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 승인과 Gate 1 책임 원본이 우선한다.

---

## Gate 1 결정 인덱스

| 질문 ID | 결정 | 상태 |
|---|---|---|
| GM-CORE-01 | 조합·발견을 주 경험으로 확정 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` |
| GM-AUDIENCE-01 | 10~15분 단위 모바일 플레이 | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` |
| GM-NARRATIVE-03 | 기본은 짧게, 선택 시 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` |
| GM-PROMISE-01 | 배움→설계→세계 변화 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` |
| GM-LOOP-01 | 수업·연습·일상·시험·축제·현장 + 자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| GM-CURVE-01 | 첫 5분 직접 작성·설계, 자동화 후행 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` |
| GM-CORE-BOUNDARY-01 | 의미 기반 작성·조합·상황 반응·학습 순환 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` |
| GM-SALES-01 | 직접 작성·상황별 설계·학교 학습 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` |
| GM-BENCHMARK-01 | 직접 입력 / 조합 문제 / 학교 성장 3그룹 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` |
| GM-MASCOT-01 | 메인 동반 + 전투 보조 2계층 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` |
| GM-VS-ROUTE-01 | CORE_POC 없이 Vertical Slice로 직접 진행 | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` |
| GM-SLICE-01 | 4개 핵심 세션 + 자유일정 3회 | `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1` |
| GM-GATE1-REVIEW-01 | 적대적 범위·제작성 검토 | `ADVERSARIAL_REVIEW_AUTHORED_P0_P1_PROPOSED` |
| GM-GATE1-RISK-01 | 권장 P0 처리 패키지 전체 승인 | `P0_RISK_TREATMENT_PACKAGE_CONFIRMED_FOR_GATE_1` |

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

Slice에서는 보조 소환수의 수호 또는 견제 하나만 구현한다. 두 소환수 모두 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## 직접 Vertical Slice 경로

```text
Gate 1 콘셉트 정리
→ Vertical Slice 구조 계약
→ 적대적 검토
→ P0 처리 패키지 승인
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 별도 CORE_POC를 다른 이름으로 재도입하지 않는다.

---

## P0 보완 Vertical Slice 계약

책임 원본: `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

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

수업·시험·축제·현장은 같은 계약을 사용하며 위험·압박·자원·평가·결과·소환수 허용·복구 방식으로 차이를 만든다.

### 세션 역할

| 세션 | 역할 |
|---|---|
| 수업·연습 | 원리 이해와 비교 |
| 실기시험 | 제한 조건 안에서 이해 증명 |
| 학교축제 | 표현·개성·관계·비전투 활용 |
| 현장실습 | 위험 속 우선순위·재설계·발견 |

### 자유일정

모든 슬롯은 다음 세 원형을 재사용한다.

- `휴식`: 컨디션·집중 회복과 안전 보정
- `준비`: 시험 복습·축제 준비·현장 조사 또는 소환수 조율
- `교류`: 메인 동반자 또는 핵심 인물과 관계·관점 획득

보호:

- 중요 일정 사이 총 3회
- 슬롯당 행동 하나 선택
- 필수 진행·정보·정답 차단 금지
- 신규 지역·전투·독립 미니게임 제작 금지
- 휴식·준비·교류 사이 절대 우위 금지

### 시간

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 첫 5분 안에 직접 작성
- 15분 안에 메인·보조 차이 이해
- 연속 플레이 강제 없음

### 내부 구현 순서

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 Vertical Slice 내부 체크포인트이며 CORE_POC가 아니다.

### 최소 저장

- 세션 시작·완료
- 자유일정 선택 전·완료
- 현장 전투 문제 완료 후
- 귀환·기록 완료

상태는 현재 단계, 배운 글자, 자유일정 선택, 시험·축제·현장 결과 태그, 동반자 관계 구간, 보조 소환수 준비, 마도서 발견으로 제한한다.

---

## P1 제약

- 시험 표시 평가 축: 상황 적합성 / 주문 설계 / 실행 안정성
- 축제는 학교 장면 상태 재사용
- 축제 결과: `ELEGANT / PRACTICAL / SPECTACULAR`
- 메인 동반자 관계 단계 최대 3개
- 보조 소환수는 수호 또는 견제 하나
- 작성 화면 고정 정보: 목표·메인·보조·자원·위험 경고

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화나 자유일정에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 자유일정은 필수 진행을 차단하지 않음
- 모든 세션은 공통 Situation Challenge 사용
- 첫 완주 허용 상한 60분
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- 현재 단계에서 Godot 구현·Codex 실행·프로필 전환·PR 병합 금지

---

## 보류 항목

### `PLAYTEST_TUNING_REQUIRED`

- 각 세션의 정확한 시간
- 입력 판정 허용 범위
- 완전 정지·감속·실시간 최종안
- 자유일정 보정 수치
- 시험 점수·성적 보상
- 보조 소환수 수호·견제 수치

### `DEFERRED_CONTENT_DATA`

- 첫 메인·보조 글자 명칭과 효과
- 시험 문제 소재
- 축제 대표 활동
- 현장실습 사건·적·환경
- 교수·학생·동반자 대사

---

## 다음 결정

`GM-GATE1-APPROVAL-01`: P0 보완 계약을 포함한 Gate 1 콘셉트와 Vertical Slice 범위를 최종 승인할 것인가?

상태: `NEXT_BLOCKING_DECISION`
