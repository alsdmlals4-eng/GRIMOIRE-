# 스펠 Active Context

## 현재 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 기획 상태: `PLANNING_IN_PROGRESS`
- 프로젝트 코어 상태: `CORE_CANDIDATE`
- 세계관 코어 상태: `REFERENCE_CANDIDATE`
- 최상위 경험 방향: `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED`
- Gate 1 판정: `UNVERIFIED`
- 구현 상태: `NOT_STARTED`
- CORE_POC: `NOT_AUTHORED`
- Vertical Slice: `BLOCKED_BY_GATE_1`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 기준 날짜: 2026-07-27

## 작업 권한과 자료 지위

### 최상위 원본 계약

- 사용자 제공 `VERTICAL_SLICE_MASTER_REFERENCE_v6.md`
- `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md` Manifest

v6는 기획 순서, Skill 오케스트레이션, 제품 Gate, 검증, 증거와 상태 표현을 책임진다.

### 새 Gate 1 기준선

- `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
- `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27E.md`

### 기존 작업물

기존 `docs/planning/` 문서는 삭제하지 않고 참조 자료로 사용한다.

- 사용자 결정 이력: 보존
- 기존 프로젝트 코어·세계관·시스템: `REFERENCE_CANDIDATE`
- 개별 수치: `BALANCE_TUNING_BACKLOG` 또는 `UNVERIFIED`
- 폐기·대체 이력: `SUPERSEDED`·`REJECTED` 유지
- 새 확정값: v6 재기획 과정에서 사용자 승인 후 승격

## 승인된 최상위 경험 방향 — GM-CORE-01

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

사용자 승인: 2026-07-27, `권장안대로 진행해`

```text
주 경험
= 조합하고 발견하는 지적 재미

직접 작성
= 마법을 내가 실제로 다룬다는 손맛과 주체성

숙련·스톡
= 이미 이해한 반복을 줄이고 새로운 조합에 집중시키는 성장 보상

소환수
= 작성 시간을 확보하고 준비·충전 우선순위를 만드는 보조자

마법학교
= 새로운 글자·활용 문제·관계·전문화를 공급하는 장기 프레임
```

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

이 결정은 `CORE_CONFIRMED`, Gate 1 승인, 개별 시스템·수치 확정, CORE_POC 통과 또는 구현 승인이 아니다.

## 플레이어 약속 초안

```text
플레이어는 마법학교의 학생이 되어
마법 글자의 의미와 현장의 문제를 읽고 주문을 직접 설계하며
내가 생각한 마법이 실제 세계를 바꾸는 발견·영리함·성장의 판타지를 경험한다.
```

상태: `DESIGN_HYPOTHESIS_PENDING_GATE_1`

목표 플레이어와 플레이 상황을 확정한 뒤 문장을 압축·수정한다.

## 뾰족한 재미 초안

```text
상황과 위험을 읽는다
→ 필요한 현상과 변형을 선택한다
→ 핵심 글자를 직접 작성하고 숙련 반복은 스톡으로 삽입한다
→ 주문 결과가 적·환경·문제를 어떻게 바꾸는지 즉시 확인한다
→ 새 활용을 발견하거나 실패 원인을 이해한다
→ 다음 주문을 더 영리하게 설계한다
```

### 반복 행동

- 관찰
- 의미 선택
- 조합
- 직접 작성 또는 스톡 삽입
- 결과 해석
- 재설계

### 핵심 고민

- 지금 필요한 핵심 현상은 무엇인가?
- 어떤 보조 효과가 상황을 가장 효율적으로 바꾸는가?
- 직접 작성할 것인가, 준비한 스톡을 사용할 것인가?
- 짧고 안전한 주문과 복잡하고 강한 주문 중 무엇을 선택할 것인가?

### 목표 감정

- 발견
- 영리함
- 마법을 이해했다는 숙련감
- 내 설계가 작동했다는 주체성

## 현재 요소 판정

| 요소 | 판정 | 현재 의미 |
|---|---|---|
| 마법 글자 의미·문법 | `AMPLIFY` | 조합 발견의 원인 규칙 |
| 상황별 주문 변형 | `AMPLIFY` | 핵심 고민과 재설계 |
| 직접 터치 작성 | `AMPLIFY` | 주체성과 손맛 |
| 즉각적인 현상 변화 | `AMPLIFY` | 원인·결과 학습 |
| 하위 글자 스톡 | `SUPPORT` | 숙련 반복 감소 |
| 완성 주문 스톡 | `SUPPORT_WITH_RISK` | 긴급 대응, 버튼 전투화 위험 |
| 소환수 전투·수호 | `SUPPORT` | 작성 시간 확보 |
| 소환수 충전 관리 | `UNPROVEN` | 실질적 판단인지 미검증 |
| 실시간 전투 | `UNPROVEN` | 긴장 또는 사고 방해 가능 |
| 집중 모드 | `SUPPORT` | 모바일 작성과 압박 조절 |
| 마법학교 수업 | `SUPPORT` | 새 문법과 문제 공급 |
| 3년·6학기 | `NEUTRAL_SCOPE_RISK` | 장기 프레임·콘텐츠 범위 위험 |
| 메인 글자 Lv.0~5 | `UNPROVEN` | 조합 발견보다 수치 성장에 치우칠 위험 |
| 보조 미숙·숙련·달인 | `SUPPORT` | 직접 작성에서 스톡화로 연결 |
| 학년별 보조 2·4·6 | `BALANCE_TUNING_BACKLOG` | 테스트 전 고정 불가 |

## 보호할 기존 결정

다음은 이번 재기획에서도 유지한다. Gate 1 전체 승인 전 프로젝트 전체 코어로 승격하지 않는다.

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`
- 메인 글자 하나만으로 기본 주문 성립
- 복수 메인 글자 결합 금지
- 신규·미숙 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 소환수는 회로·글자를 직접 작성·배치·연결하지 않음
- 소환수 보조 묶음 자동 연결 재도입 금지
- 소환수 주문 보조는 전투·수호·스톡 생산·충전 범위
- 스톡 없이 직접 시전 가능
- 조건부 완전 자동 발동 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 사용 금지
- 현재 단계에서 Godot 코드·Scene·Resource·게임 데이터 구현 금지
- Codex 실행 금지

## 보류된 기존 결정

`GM-STOCK-01`의 세부 수치는 다음 상위 항목이 정렬될 때까지 보류한다.

1. 목표 플레이어와 플레이 상황
2. 세션 길이·중단 복귀 단위
3. Micro·Combat·Session Loop
4. CORE_POC 범위

상태: `DEFERRED_BY_HIGHER_LEVEL_CONCEPT_WORK`

## 확인된 위험

### P1

- 작성·마나·적·스톡·충전·소환수·대상을 동시에 판단하면 모바일 인지 부하가 과도해질 수 있다.
- 조합 결과가 명확하지 않으면 발견이 아니라 레시피 암기나 시행착오 노동이 된다.
- 직접 작성이 주체성을 전달하기 전에 반복 피로와 화면 가림을 만들 수 있다.
- 완성 주문 스톡 비중이 높아지면 버튼 전투로 퇴행할 수 있다.
- 학교 3년 콘텐츠 범위가 코어 검증보다 먼저 커질 수 있다.

### BLOCKED_UNVERIFIED

- 목표 플레이어와 실제 플레이 상황
- 목표 세션 길이와 중단·복귀 단위
- 터치 작성의 반복 재미와 인식 허용 범위
- 실시간 압박이 사고를 강화하는지 방해하는지
- 스톡이 조합 선택을 보존하는지
- 소환수 충전 판단이 의미 있는지
- 짧은 주문과 복잡한 주문의 공존
- 실제 모바일 UI 혼잡도

## 다음 우선 결정 — GM-AUDIENCE-01

1차 목표 플레이어와 가장 자주 발생할 플레이 상황을 정한다.

현재 권장 가설:

> 짧은 시간에도 한 번의 마법 문제 해결과 발견을 완주하고, 장기적으로는 학교생활과 주문 연구를 축적하고 싶은 모바일 플레이어.

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`

## Gate 1 진행 순서

```text
GM-CORE-01 최상위 경험 방향 — 승인됨
→ GM-AUDIENCE-01 목표 플레이어·플레이 상황
→ 플레이어 약속 확정
→ Micro·Combat·Session·Semester Loop
→ 경험 곡선
→ 프로젝트 코어·변경 가능한 외피
→ 세일즈포인트 최대 3개
→ 벤치마킹 질문·SWOT·VRIO·제작성
→ 마스코트·상징 동반자 역할 후보
→ CORE_POC 계약
→ 적대적 검토
→ 사용자 Gate 1 승인
```

## 먼저 읽을 책임 원본

1. 사용자 제공 `VERTICAL_SLICE_MASTER_REFERENCE_v6.md`
2. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
3. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27E.md`
4. `docs/planning/DECISION_LOG.md`
5. `docs/DESIGN_DOCUMENT_REGISTRY.json`
6. 기존 시스템별 `docs/planning/` 문서 — 참조 필요 시 선택

## GitHub 규칙

- 기획 PR은 Draft 상태로 유지한다.
- 구현 산출물을 기획 브랜치에 혼입하지 않는다.
- 핵심 변경 시 재기획 기준선·결정 기록·Active Context를 함께 갱신한다.
- 기존 기획 문서를 별도 승인 없이 이동·통합·삭제하지 않는다.
- 실제 검증 없이 Gate 통과나 완료를 주장하지 않는다.
