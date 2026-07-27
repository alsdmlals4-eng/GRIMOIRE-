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
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27M.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 승인과 Gate 1 책임 원본이 우선한다.

---

## Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 결정 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 지적 마법 판타지에 시스템 정렬 |
| GM-AUDIENCE-01 | 목표 플레이어·상황 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 개별 세션 완주와 저장·복귀 우선 |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 선택 시 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 정보와 선택형 상세층 분리 |
| GM-PROMISE-01 | 플레이어 약속 | 배움→설계→세계 변화 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | 모든 기능의 상위 필터 |
| GM-LOOP-01 | 게임플레이 Loop | 수업·연습·일상·현장실습 + 고정 사건·자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | 학습·관계·실전 순환 |
| GM-CURVE-01 | 초반 경험 곡선 | 첫 5분 직접 작성·설계, 자동화 후행 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | 핵심 재미 조기 증명 |
| GM-CORE-BOUNDARY-01 | 프로젝트 코어 경계 | 의미 기반 작성·조합·상황 반응·학습 순환 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | 범위 감량 시 비타협 코어 보존 |
| GM-SALES-01 | 세일즈포인트 | 직접 작성·상황별 설계·학교 학습 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | 스토어·데모 대표 장면 정렬 |
| GM-BENCHMARK-01 | 벤치마킹·SWOT·VRIO·제작성 | 직접 입력 / 조합 문제 / 학교 성장 3그룹 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` | 입력·학습 전이·범위 검증 강화 |
| GM-MASCOT-01 | 소환수 구조 | 메인 동반 + 전투 보조 2계층 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` | 관계·기록과 전투 지원 책임 분리 |
| GM-VS-ROUTE-01 | 제품 검증 경로 | CORE_POC 없이 Vertical Slice로 직접 진행 | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` | POC 검증 책임을 Slice에 흡수 |
| GM-SLICE-01 | Vertical Slice 계약 | 4개 핵심 세션 + 중요 일정 사이 자유일정 1회씩 | `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1` | 축약 학기형 외부 플레이 데모 확정 |

---

## 확정된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 확정된 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→현장실습→발견·기록→다음 학습

## 확정된 세일즈포인트

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

---

## 확정된 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

공통 금지:

- 글자·회로 작성 대행
- 메인·보조 글자 자동 선택
- 자동 주문 설계
- 정답 제시
- 소환수만으로 전투 자동 해결

---

## 직접 Vertical Slice 경로

사용자 결정:

> COREPOC 없이 우리는 버티칼슬라이스로 갈거야.

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약 승인
→ 적대적 범위 검토
→ P0·P1 처리안
→ 사용자 Gate 1 최종 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

- `GM-POC-01`: `SUPERSEDED_BY_GM-VS-ROUTE-01`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 별도 CORE_POC를 다른 이름으로 재도입하지 않는다.

---

## 확정된 Vertical Slice 계약 — GM-SLICE-01

책임 원본: `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A 1회
→ 첫 실기시험
→ 자유일정 B 1회
→ 학교축제 준비·학교축제
→ 자유일정 C 1회
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

세션 책임:

```text
수업·연습 = 배움
시험 = 이해의 증명
학교축제 = 표현·관계·비전투 활용
현장실습 = 실제 위험 속 응용·발견
자유일정 = 휴식·준비·관계·연구의 완충
귀환·기록 = 결과 해석·다음 학습 연결
```

### 자유일정 보호 결정

- 수업 후·시험 후·축제 후 총 3회
- 한 슬롯에서 행동 1개 선택
- `휴식`은 유효한 정식 선택
- 다음 중요 일정 참가를 차단하지 않음
- 필수 정보·정답을 특정 선택에 독점하지 않음
- 결과는 작은 보정·관계·정보·준비 차이로 제한
- 자유일정마다 독립 대형 미니게임을 만들지 않음

### Slice 최소 범위

- 메인 글자 1개, 보조 글자 2개
- 수업·시험·축제·현장 각 대표 문제 1개
- 자유일정 3회
- 학교 재사용 구역 1개, 현장 구역 1개
- 적 1~2종
- 메인 동반 소환수 1체
- 수호 또는 견제형 보조 소환수 1체
- 저장·중단·복귀
- 핵심 UI·아트·사운드

### 잠정 시간

- 전체 약 52~84분
- 정확한 시간: `PLAYTEST_TUNING_REQUIRED`

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화나 자유일정에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 보조 소환수는 전투에서 호출
- 소환수는 작성·조합 판단을 대행하지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 자유일정은 필수 진행을 차단하지 않음
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- 현재 단계에서 Godot 구현과 Codex 실행 금지

---

## 보류된 세부 설계

### `PLAYTEST_TUNING_REQUIRED`

- 각 세션과 자유일정 정확한 시간
- 정량 통과·실패 임계값
- 작성 중 완전 정지·감속·실시간 최종안
- 시험 평가 점수와 성적 보상
- 자유일정 보정 수치
- 보조 소환수 수호·견제 수치

### `DEFERRED_CONTENT_DATA`

- 첫 메인·보조 글자의 실제 명칭과 효과
- 실기시험 문제의 구체 소재
- 학교축제 대표 활동
- 현장실습 사건·적·환경
- 주요 학생·교수·메인 동반자 대사

---

## 다음 결정

`GM-GATE1-REVIEW-01`: 축약 학기형 Vertical Slice의 범위·모바일 UX·콘텐츠 중복·1인 제작성 위험을 적대적으로 검토하고 P0·P1 처리안을 확정한다.

상태: `NEXT_BLOCKING_DECISION`
