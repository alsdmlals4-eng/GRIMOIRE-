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
- v6 Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27K.md`
- 이전 재기획 결정: Addendum J→A와 Git 이력

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 승인과 Gate 1 책임 원본이 기존 후보보다 우선한다.

---

## 현재 Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 답변 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 모든 시스템을 지적 마법 판타지에 정렬 |
| GM-AUDIENCE-01 | 목표 플레이어·상황 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 한 세션에 문제 해결·발견 완결 |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 선택 시 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 핵심층과 선택형 상세층 분리 |
| GM-PROMISE-01 | 플레이어 약속 | 제안 문장 확정 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | 배움→설계→세계 변화로 필터링 |
| GM-LOOP-01 | 게임플레이 Loop | 수업·연습·일상·현장실습 순환 + 고정 핵심 사건·자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | 학습·실전·관계 결과가 다음 선택으로 순환 |
| GM-CURVE-01 | 초반 경험 곡선 | 첫 5분 직접 작성·설계 후 모의 실습과 첫 숙련 자동화 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | 핵심 재미를 초반에 증명, 자동화는 후행 |
| GM-CORE-BOUNDARY-01 | 프로젝트 코어 경계 | 마법 학습·설계를 비타협 코어로, 학교·관계·스톡·소환수는 지원층 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | 범위 축소 시에도 작성·조합·상황 반응 보존 |
| GM-SALES-01 | 세일즈포인트 최대 3개 | 직접 작성·상황별 주문·수업에서 실전 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | 한 문장과 세 장면으로 차별점 전달 |
| GM-BENCHMARK-01 | 벤치마킹·SWOT·VRIO·제작성 | 직접 입력 / 조합 문제 해결 / 학교 학습 성장 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` | CORE_POC 검증 조건 강화 |
| GM-MASCOT-01 | 소환수·상징 동반자 구조 | 메인 동반 소환수 + 전투 보조 소환수 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` | 관계·기록과 전투 지원을 별도 계층으로 분리 |

---

## 확정된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

---

## 확정된 기본 Loop

```text
수업에서 알고
→ 연습에서 할 수 있게 되고
→ 실전에서 다르게 써 보며
→ 일상에서 관계와 의미가 누적되고
→ 다음 수업·연구가 변화한다
```

일정은 `고정 핵심 사건 + 자유 일정` 혼합형이다.

---

## 확정된 경험 곡선

```text
학교 도착·현재 목표 소개
→ 교수의 짧은 시범
→ 첫 메인 글자 직접 작성
→ 세계가 변하는 결과 확인
→ 보조 글자 하나로 작은 설계 선택
→ 짧은 일상·관계 장면
→ 첫 모의 현장실습에서 응용
→ 새 활용 발견·마도서 기록
→ 반복 숙련 후 첫 하위 글자 스톡 해금
```

> 먼저 마법이 작동하는 기쁨을 주고, 곧바로 내가 설계했다는 감각을 주며, 실전에서 응용한 뒤 숙련된 반복만 자동화한다.

---

## 확정된 프로젝트 코어 경계

### 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 적·환경·사건을 바꾸는 즉각적이고 설명 가능한 결과
6. 수업→연습→현장실습→발견·기록→다음 학습의 순환

> 의미를 배운 글자를 직접 쓰고 상황에 맞게 조합하여, 내가 설계한 주문으로 세계를 변화시키고 새 활용을 발견한다.

### 지원 시스템

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 메인 동반 소환수
- 전투 보조 소환수

### 변경 가능한 외피

- 3년·6학기와 학기 `10+4`
- 학교 규모·지역·등장인물·관계 분기량
- 주인공 세부 출신
- 실시간 전투 압박과 집중 모드
- 메인 레벨·보조 운용량·스톡 수치
- 완성 주문 스톡의 존재와 비중
- 보조 소환수 편성·수·성장 방식
- 정확한 세션 시간과 저장·복귀 단위

---

## 확정된 세일즈포인트

> 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.

1. **손으로 직접 쓰는 마법**
2. **상황에 맞게 만드는 주문**
3. **수업에서 배우고 실전에서 발견하는 마법학교**

---

## 확정된 벤치마킹 프레임과 조사 결론

### 세 그룹

1. 직접 입력·마법 조작군
2. 조합·시스템 문제 해결군
3. 마법학교·학습 성장군

### 결론

- 직접 작성은 강한 훅이나 단독 코어로는 필기 미니게임화 위험이 있다.
- 장기 재미는 의미가 명확한 소수 글자와 상황 반응의 조합 밀도에서 나온다.
- 학교는 콘텐츠 양보다 배운 원리가 다음 실습의 해결법을 바꾸는지가 중요하다.
- 세 축의 결합은 `RARE_IN_REVIEWED_SET`이나 시장 가치와 장기 재미는 `UNPROVEN`이다.
- VRIO는 `VRIO_POTENTIAL_NOT_PROVEN`이다.
- 작은 2D 모바일 CORE_POC는 `FEASIBLE_WITH_STRICT_SCOPE`다.

---

## 확정된 2계층 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 수업·연습·일상·현장실습·복귀·마도서 기록
= 관계·서사·학습 연속성의 중심

전투 보조 소환수
= 전투 준비 또는 전투 중 호출
= 공격·견제·수호·지정 충전 지원
= 전투 종료 후 기본적으로 해제
```

### 책임 경계

- 메인 동반 소환수는 관계·기록·관찰을 맡고 주력 전투 유닛이 되지 않는다.
- 전투 보조 소환수는 플레이어가 글자를 작성할 시간을 확보한다.
- 두 계층은 별도 슬롯과 성장 책임을 가진다.
- 기존 `전투 시작 전 기본 소환수 1체 미리 전개` 원칙은 `SUPERSEDED_BY_GM-MASCOT-01`이다.

### 공통 금지

- 글자·회로 직접 작성
- 메인·보조 글자 자동 선택
- 회로 자동 연결
- 주문 자동 설계·실행
- 문제 정답 제시
- 소환수만으로 전투 자동 해결

책임 원본: `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`

---

## 보호 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`이다.
- 메인 글자 하나만으로 기본 주문이 성립한다.
- 복수 메인 글자 결합은 금지한다.
- 신규·미숙·중요 글자는 직접 작성한다.
- 숙련 보조만 하위 글자 스톡 후보가 된다.
- 스톡 없이 직접 시전할 수 있다.
- 소환수는 글자·회로를 직접 작성·배치·연결하지 않는다.
- 소환수 보조 묶음 자동 연결을 재도입하지 않는다.
- 메인 동반 소환수는 항상 같은 개체가 동행한다.
- 전투 보조 소환수는 전투에서 호출한다.
- 메인 동반자는 필수 정보를 독점하거나 정답을 제시하지 않는다.
- 보조 소환수는 플레이어가 작성할 시간을 확보하는 지원자다.
- 조건부 완전 자동 발동을 재도입하지 않는다.
- 입력 실패와 설계 실패를 같은 실패로 처리하지 않는다.
- 필수 정보를 선택형 상세 대화에만 숨기지 않는다.
- 의미 기반 글자·직접 작성·상황 변형·세계 변화·학습 순환은 범위 축소 대상이 아니다.
- `무한 자유 조합`, `무엇이든 가능한 마법`, `완전한 손글씨 인식`을 약속하지 않는다.
- 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
- 현재 단계에서는 구현과 Codex를 실행하지 않는다.

---

## 주요 책임 원본

| 결정군 | 현재 지위 | 책임 원본 |
|---|---|---|
| 게임플레이 Loop | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | `GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| 경험 곡선 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | `GATE_1_EXPERIENCE_CURVE_SYSTEM.md` |
| 프로젝트 코어 경계 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | `GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` |
| 세일즈포인트 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | `GATE_1_SALES_POINTS_SYSTEM.md` |
| 벤치마킹·SWOT·VRIO·제작성 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` | `GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` |
| 소환수·동반자 구조 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` | `GATE_1_SUMMON_COMPANION_SYSTEM.md` |
| 소환수 전투 세부 후보 | `REFERENCE_CANDIDATE_WITH_LATEST_OVERRIDE` | `SUMMON_SYSTEM.md` |
| 마법 글자 문법 | `DIRECTION_CONFIRMED` | `MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 직접 작성·스톡 | `REFERENCE_CANDIDATE_WITH_PROTECTED_BOUNDARIES` | `COMBAT_CORE_SYSTEM.md`, `STOCK_SYSTEM.md` |
| 메인 글자 Lv.0~5 | `UNPROVEN` | `MAIN_LETTER_LEVEL_SYSTEM.md` |
| 학교 3년·6학기 | `CHANGEABLE_SHELL_SCOPE_RISK` | 학교·학년·학기 참조 문서 |
| 선택형 상세 서사 | `CORE_SUPPORT` | `NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md` |

---

## 보류된 세부 설계

### 스톡·전투 수치

상태: `DEFERRED_BY_HIGHER_LEVEL_CONCEPT_WORK`

- 1학년 기본 스톡 준비 용량과 편성
- 충전시간·전환 지연·피해 정지 수치
- 보조 소환수 생산 계산식
- 상태이상 지속시간·저항·해제·중첩

### 소환수 세부

상태: `PLAYTEST_TUNING_REQUIRED`

- 보조 소환수 편성 수와 동시 전개 수
- 호출 비용·재사용 대기·유지 시간
- 공격·견제·수호·충전·동조 적성 수치
- 메인 동반자의 정체성·이름·외형
- 보조 소환수 획득·계약·성장 방식

---

## 미해결 기획 결정

| 후보 ID | 질문 | 상태 |
|---|---|---|
| GM-POC-01 | CORE_POC 대표 주문·적·환경·구간·동반자 역할·지표는 무엇인가 | `NEXT_BLOCKING_DECISION` |
| GM-CIRCUIT-03 | 각 메인 글자의 기본 발현과 레벨별 변화는 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-04 | 공통 보조와 계열 전용 보조의 비율은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-05 | 보조 글자의 반복·중복·상충·감쇠 규칙은 무엇인가 | `UNRESOLVED` |
| GM-WORLD-13 | 필수·선택 수업은 자유 일정에서 어떤 비용을 사용하는가 | `UNRESOLVED` |
| GM-WORLD-15 | 졸업·진로를 다중 엔딩으로 운영하는가 | `UNRESOLVED` |
| GM-WORLD-16 | 세계의 장기 갈등은 무엇인가 | `UNRESOLVED` |
| GM-NARRATIVE-03-UX | 선택 대화·기록·관계 UI는 어떻게 구성하는가 | `UNRESOLVED` |
| GM-STOCK-01 | 1학년 스톡 초기 준비 용량과 기본 편성은 무엇인가 | `DEFERRED` |

---

## 다음 결정

`GM-POC-01`: 비타협 코어와 세일즈포인트를 가장 작은 실제 플레이로 검증할 CORE_POC 계약을 확정한다.

> 첫 CORE_POC를 `짧은 수업 1개 → 교내 연습 1개 → 전투 문제 1개 → 환경 문제 1개 → 발견 기록`으로 구성할 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`
