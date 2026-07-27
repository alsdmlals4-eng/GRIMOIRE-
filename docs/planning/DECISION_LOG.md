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
- Gate 1 Loop 책임 원본: `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
- Gate 1 경험 곡선 책임 원본: `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
- Gate 1 코어 경계 책임 원본: `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
- Gate 1 세일즈포인트 책임 원본: `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27I.md`
- 이전 재기획 결정: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27H.md`, `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27G.md`, `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27F.md`, `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27E.md`
- 전체 이전 결정 표: Git 이력과 날짜별 Addendum

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 v6 재기획 결정은 Gate 1 기준선, 최신 Addendum, Active Context 순으로 확인한다.

---

## 현재 Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 답변 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 모든 시스템을 지적 마법 판타지에 정렬 |
| GM-AUDIENCE-01 | 목표 플레이어·플레이 상황 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 한 세션에 문제 해결·발견 완결 |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 대화 선택 시 다양하고 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 핵심층·선택형 상세층 분리 |
| GM-PROMISE-01 | 플레이어 약속 | 제안 문장 확정 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | 배움→설계→세계 변화로 시스템 필터링 |
| GM-LOOP-01 | 게임플레이 Loop | 수업·연습·일상·현장실습 순환 + 고정 핵심 사건·자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | 학습·실전·관계 결과가 다음 선택으로 순환 |
| GM-CURVE-01 | 초반 경험 곡선 | 짧은 수업에서 즉시 작성·설계 후 모의 실습과 첫 숙련 자동화 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | 첫 5분에 핵심 재미 증명, 자동화는 숙련 보상으로 후행 |
| GM-CORE-BOUNDARY-01 | 프로젝트 코어 경계 | 마법 학습·설계를 비타협 코어로 두고 학교·관계·스톡·소환수는 지원층으로 분리 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | 범위 축소 시에도 의미 기반 작성·조합·상황 반응·학습 순환 보존 |
| GM-SALES-01 | 세일즈포인트 최대 3개 | 직접 작성·상황별 주문 설계·수업에서 실전 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | 한 문장과 세 장면으로 입력·판단·장기 성장 차별점 전달 |

## 확정된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 확정된 기본 Loop

```text
수업에서 알고
→ 연습에서 할 수 있게 되고
→ 실전에서 다르게 써 보며
→ 일상에서 관계와 의미가 누적되고
→ 다음 수업·연구가 변화한다
```

일정은 `고정 핵심 사건 + 자유 일정` 혼합형이다.

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

핵심 문장:

> 먼저 마법이 작동하는 기쁨을 주고, 곧바로 내가 설계했다는 감각을 주며, 실전에서 응용한 뒤 숙련된 반복만 자동화한다.

## 확정된 프로젝트 코어 경계

### 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 적·환경·사건을 바꾸는 즉각적이고 설명 가능한 결과
6. 수업→연습→현장실습→발견·기록→다음 학습의 순환

핵심 문장:

> 의미를 배운 글자를 직접 쓰고 상황에 맞게 조합하여, 내가 설계한 주문으로 세계를 변화시키고 새 활용을 발견한다.

### 지원 시스템

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 소환수 전투·수호·지정 충전 지원

### 변경 가능한 외피

- 3년·6학기와 학기 `10+4`
- 학교 규모·지역·등장인물·관계 분기량
- 주인공 세부 출신
- 실시간 전투 압박과 집중 모드
- 메인 레벨·보조 운용량·스톡 수치
- 완성 주문 스톡의 존재와 비중
- 소환수 수·편성·성장 방식
- 정확한 세션 시간과 저장·복귀 단위

책임 원본: `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`

## 확정된 세일즈포인트

### 통합 한 문장

> 마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.

### 세일즈포인트 최대 3개

1. **손으로 직접 쓰는 마법** — 버튼 대신 마법 글자를 직접 그려 발동한다.
2. **상황에 맞게 만드는 주문** — 같은 메인 글자도 보조 조합과 상황에 따라 다른 역할과 결과를 만든다.
3. **수업에서 배우고 실전에서 발견하는 마법학교** — 원리를 배운 뒤 현장실습에서 새 활용을 발견해 마도서에 기록한다.

```text
대표 장면 1
직접 글자 작성→즉시 마법 발현

대표 장면 2
같은 메인 글자→다른 보조 조합→다른 상황 결과

대표 장면 3
수업의 원리→현장 응용→새 활용 마도서 기록
```

책임 원본: `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`

## 기존 결정 기록의 지위

v6 재기획 이전의 세부 결정 원문은 Git 이력과 날짜별 Addendum에 보존한다. 이 원장은 현재 Gate 1의 활성 인덱스와 재해석 상태를 제공한다.

- 보호 결정: 명시적으로 유지
- 기존 코어·세계관·시스템: `REFERENCE_CANDIDATE`
- 개별 수치: `BALANCE_TUNING_BACKLOG` 또는 `UNVERIFIED`
- 폐기·대체 이력: `SUPERSEDED`·`REJECTED` 유지
- 최신 확정값: v6 기준선과 최신 Addendum의 사용자 승인만 승격

### 보호 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`
- 메인 글자 하나만으로 기본 주문 성립
- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 소환수는 회로·글자를 직접 작성·배치·연결하지 않음
- 소환수 보조 묶음 자동 연결 재도입 금지
- 스톡 없이 직접 시전 가능
- 조건부 완전 자동 발동 재도입 금지
- 필수 정보를 선택형 상세 대화에만 숨기지 않음
- 수업은 완성 주문 상점이 아님
- 현장실습은 배운 주문을 그대로 재생하는 시험이 아님
- 일상은 전투와 무관한 호감도 메뉴가 아님
- 자유 일정은 필수 진행을 영구 차단하지 않음
- 첫 마법 사용 전 장문 세계관 설명을 강제하지 않음
- 첫 5분에 스톡·소환수 충전·완성 주문 스톡을 동시에 공개하지 않음
- 수동 작성 경험 없이 자동화를 먼저 공개하지 않음
- 첫 자동화는 숙련 보조 글자의 하위 글자 스톡부터 시작
- 의미 기반 글자·직접 작성·상황 변형·세계 변화·학습 순환을 범위 축소 대상으로 삼지 않음
- `무한 자유 조합`, `무엇이든 가능한 마법`, `완전한 손글씨 인식`을 세일즈 약속으로 사용하지 않음
- 실시간 전투·완성 주문 스톡·소환수 충전을 검증 전 대표 세일즈포인트로 사용하지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지

### 주요 책임 원본

| 결정군 | 현재 지위 | 책임 원본 |
|---|---|---|
| Gate 1 게임플레이 Loop | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | `GATE_1_GAMEPLAY_LOOP_SYSTEM.md` |
| Gate 1 경험 곡선 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | `GATE_1_EXPERIENCE_CURVE_SYSTEM.md` |
| Gate 1 프로젝트 코어 경계 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | `GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` |
| Gate 1 세일즈포인트 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | `GATE_1_SALES_POINTS_SYSTEM.md` |
| 마법 글자 문법 | `DIRECTION_CONFIRMED` | `MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 직접 작성·스톡 | `REFERENCE_CANDIDATE_WITH_PROTECTED_BOUNDARIES` | `COMBAT_CORE_SYSTEM.md`, `STOCK_SYSTEM.md` |
| 소환수 책임 | `LATEST_OVERRIDE_CONFIRMED` | `SUMMON_SYSTEM.md` |
| 메인 글자 Lv.0~5 | `UNPROVEN` | `MAIN_LETTER_LEVEL_SYSTEM.md` |
| 보조 미숙·숙련·달인 | `SUPPORT_DIRECTION_CONFIRMED` | `SUPPORT_LETTER_MASTERY_SYSTEM.md` |
| 학교 3년·6학기 | `CHANGEABLE_SHELL_SCOPE_RISK` | 학교·학년·학기 참조 문서 |
| 선택형 상세 서사 | `CORE_SUPPORT` | `NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md` |

## 보류된 세부 설계

### 스톡·전투 수치

상태: `DEFERRED_BY_HIGHER_LEVEL_CONCEPT_WORK`

- 1학년 기본 스톡 준비 용량과 편성
- 충전시간·전환 지연·피해 정지 수치
- 소환수 생산 계산식
- 상태이상 지속시간·저항·해제·중첩

### 콘텐츠·데이터

상태: `DEFERRED_CONTENT_DATA`

- 실제 첫 메인·보조 글자와 수치
- 첫 모의 실습의 적·환경·목표
- 메인 레벨별 기본 발현·효율
- Lv.4~Lv.5 전문 분기명과 효과
- 보조 글자 숙련 요구량·보너스
- 첫 숙련·스톡 해금 요구량
- 학기별 수업·실습 개수와 예상 플레이 시간
- 선택 대화 분량·보상·기록 UI
- 실제 스토어 문구·트레일러 편집·스크린샷 구성

## 미해결 기획 결정

| 후보 ID | 질문 | 상태 |
|---|---|---|
| GM-BENCHMARK-01 | 세일즈포인트 3개를 어떤 경쟁군·비교 축·근거로 검증할 것인가 | `NEXT_BLOCKING_DECISION` |
| GM-CIRCUIT-03 | 각 메인 글자의 기본 발현과 레벨별 변화는 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-04 | 공통 보조와 계열 전용 보조의 비율은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-05 | 보조 글자의 반복·중복·상충·감쇠 규칙은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-10 | Lv.4 전문 분기를 변경할 수 있는가 | `UNRESOLVED` |
| GM-CIRCUIT-11 | 성적 등급별 추가 운용량과 과부하 규칙은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-12 | 보조 글자 달인의 정확한 전투·스톡 보상은 무엇인가 | `UNRESOLVED` |
| GM-WORLD-13 | 필수·선택 수업은 자유 일정에서 어떤 비용을 사용하는가 | `UNRESOLVED` |
| GM-WORLD-14 | 컨디션은 단일 피로도인가, 집중·스트레스 분리인가 | `UNRESOLVED` |
| GM-WORLD-15 | 졸업·진로를 다중 엔딩으로 운영하는가 | `UNRESOLVED` |
| GM-WORLD-16 | 세계의 장기 갈등은 무엇인가 | `UNRESOLVED` |
| GM-NARRATIVE-03-UX | 선택 대화·기록·관계 UI는 어떻게 구성하는가 | `UNRESOLVED` |
| GM-00-35 | 전환 지연 중 재선택을 어떻게 처리하는가 | `UNRESOLVED` |
| GM-00-36 | 플레이어·소환수 생산 계산식은 무엇인가 | `UNRESOLVED` |
| GM-00-37 | 연결·분기·합류를 독립 기능 글자로 계산하는가 | `UNRESOLVED` |
| GM-00-38 | 전체 준비 용량 초기값과 성장량은 얼마인가 | `UNRESOLVED` |
| GM-00-40 | 소환수 추가 편성·교체·동시 전개 방식은 무엇인가 | `UNRESOLVED` |
| GM-STOCK-01 | 1학년 스톡 초기 준비 용량과 기본 편성은 무엇인가 | `DEFERRED` |
| GM-POC-01 | CORE_POC 대표 주문·적·전투 구간은 무엇인가 | `UNRESOLVED` |

## 다음 결정

`GM-BENCHMARK-01`: 세일즈포인트 3개를 경쟁군·비교 축·근거로 검증하고 SWOT·VRIO·1인 제작성 판단으로 연결한다.

> 직접 작성·의미 기반 조합·마법학교 학습 순환을 검증할 벤치마크를 어떤 세 그룹으로 나눌 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`

## 운영 규칙

1. 사용자의 최신 지시가 이전 결정에 우선한다.
2. 변경 결정은 `SUPERSEDED`, `LATEST_OVERRIDE`, `TRANSFERRED`, `REMOVED`, `REJECTED`로 추적한다.
3. 핵심 변경 시 책임 원본·결정 원장·Active Context를 함께 갱신한다.
4. 방향 확정과 세부 수치 확정을 구분한다.
5. 외부 작품은 고유 설정을 복제하지 않고 구조만 참고한다.
6. 구현 파일은 기획 브랜치에 포함하지 않는다.
7. 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
8. 현재 단계에서는 Codex를 실행하지 않는다.
9. 과거 세부 결정의 원문은 Git 이력과 Addendum을 통해 추적한다.
