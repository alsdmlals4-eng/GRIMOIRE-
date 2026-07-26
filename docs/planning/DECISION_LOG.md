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
- 기존 통합 기획 참조: `docs/planning/SPELL_GAME_DESIGN.md`
- 전투 코어 참조: `docs/planning/COMBAT_CORE_SYSTEM.md`
- 세계관 참조: `docs/planning/WORLD_SETTING_CONCEPT.md`
- 선택형 상세 서사 참조: `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27F.md`

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 v6 재기획 결정은 Gate 1 기준선, 최신 Addendum, Active Context 순으로 확인한다.

---

## 현재 Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 답변 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 모든 시스템을 지적 마법 판타지에 정렬 |
| GM-AUDIENCE-01 | 목표 플레이어·플레이 상황 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 한 세션에 문제 해결·발견 완결 |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 대화 선택 시 다양하고 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 핵심층·선택형 상세층 분리 |
| GM-PROMISE-01 | 플레이어 약속 | 제안 문장 확정 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | 배움→설계→세계 변화로 시스템 필터링 |

## 확정된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 기존 결정 기록의 지위

이 파일의 이전 세부 결정 표는 삭제하지 않고 Git 이력과 기존 Addendum에 보존한다. v6 재기획에서는 다음 원칙으로 재해석한다.

- 보호 결정: 명시적으로 유지
- 기존 코어·세계관·시스템: `REFERENCE_CANDIDATE`
- 개별 수치: `BALANCE_TUNING_BACKLOG` 또는 `UNVERIFIED`
- 폐기·대체 이력: `SUPERSEDED`·`REJECTED` 유지
- 최신 확정값: v6 기준선과 최신 Addendum의 사용자 승인만 승격

### 보호 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`
- 메인 글자 하나만으로 기본 주문 성립
- 복수 메인 글자 결합 금지
- 신규·미숙 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 소환수는 회로·글자를 직접 작성·배치·연결하지 않음
- 소환수 보조 묶음 자동 연결 재도입 금지
- 스톡 없이 직접 시전 가능
- 조건부 완전 자동 발동 재도입 금지
- 필수 정보를 선택형 상세 대화에만 숨기지 않음
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지

### 주요 참조 결정군

| 결정군 | 현재 지위 | 책임 원본 |
|---|---|---|
| 마법 글자 문법 | `DIRECTION_CONFIRMED` | `MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 직접 작성·스톡 | `REFERENCE_CANDIDATE_WITH_PROTECTED_BOUNDARIES` | `COMBAT_CORE_SYSTEM.md`, `STOCK_SYSTEM.md` |
| 소환수 책임 | `LATEST_OVERRIDE_CONFIRMED` | `SUMMON_SYSTEM.md` |
| 메인 글자 Lv.0~5 | `UNPROVEN` | `MAIN_LETTER_LEVEL_SYSTEM.md` |
| 보조 미숙·숙련·달인 | `SUPPORT_DIRECTION_CONFIRMED` | `SUPPORT_LETTER_MASTERY_SYSTEM.md` |
| 학교 3년·6학기 | `NEUTRAL_SCOPE_RISK` | 학교·학년·학기 참조 문서 |
| 선택형 상세 서사 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | `NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md` |

## 보류된 세부 설계

### 스톡·전투 수치

상태: `DEFERRED_BY_HIGHER_LEVEL_CONCEPT_WORK`

- 1학년 기본 스톡 준비 용량과 편성
- 충전시간·전환 지연·피해 정지 수치
- 소환수 생산 계산식
- 상태이상 지속시간·저항·해제·중첩

### 콘텐츠·데이터

상태: `DEFERRED_CONTENT_DATA`

- 실제 메인·보조 글자 목록과 수치
- 메인 레벨별 기본 발현·효율
- Lv.4~Lv.5 전문 분기명과 효과
- 보조 글자 숙련 요구량·보너스
- 학기별 수업·실습 개수와 예상 플레이 시간
- 선택 대화 분량·보상·기록 UI

## 미해결 기획 결정

| 후보 ID | 질문 | 상태 |
|---|---|---|
| GM-LOOP-01 | Micro·Combat·Session·Semester Loop는 어떻게 연결되는가 | `NEXT_BLOCKING_DECISION` |
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

`GM-LOOP-01`: 승인된 플레이어 약속을 실제 반복 경험으로 만드는 Micro·Combat·Session·Semester Loop를 정한다.

> 10~15분 세션에서 플레이어가 어떤 순서로 문제를 읽고, 주문을 설계하고, 결과를 확인하며, 발견과 성장을 저장하는가?

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