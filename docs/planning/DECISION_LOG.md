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
- Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27L.md`

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 승인, 최신 Addendum, Gate 1 책임 원본, Active Context가 우선한다.

---

## 현재 Gate 1 결정 인덱스

| 질문 ID | 결정 주제 | 사용자 결정 | 상태 | 설계 영향 |
|---|---|---|---|---|
| `GM-CORE-01` | 최상위 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 지적 마법 판타지에 모든 시스템 정렬 |
| `GM-AUDIENCE-01` | 목표 플레이어 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 짧은 세션에 문제 해결·발견 완결 |
| `GM-NARRATIVE-03` | 서사 깊이 | 기본은 짧게, 선택 시 상세하게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 핵심층과 선택 상세층 분리 |
| `GM-PROMISE-01` | 플레이어 약속 | 배움→설계→세계 변화 | `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1` | 시스템 필터 확정 |
| `GM-LOOP-01` | 게임플레이 Loop | 수업·연습·일상·현장실습 순환 + 고정 사건·자유 일정 | `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1` | 학습·실전·관계 결과 순환 |
| `GM-CURVE-01` | 경험 곡선 | 첫 5분 직접 작성·설계, 자동화는 후행 | `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1` | 핵심 재미 조기 증명 |
| `GM-CORE-BOUNDARY-01` | 코어 경계 | 의미 기반 작성·조합·상황 반응·학습 순환을 비타협 코어로 | `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1` | 학교·관계·스톡·소환수는 지원층 |
| `GM-SALES-01` | 세일즈포인트 | 직접 작성 / 상황별 주문 / 수업에서 실전 발견 | `SALES_POINTS_CONFIRMED_FOR_GATE_1` | 한 문장과 세 장면 확정 |
| `GM-BENCHMARK-01` | 벤치마킹 | 직접 입력 / 조합 문제 / 학교 성장 3그룹 | `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED` | UX·제작성·Slice 검증 조건 강화 |
| `GM-MASCOT-01` | 소환수 구조 | 상시 메인 동반자 + 전투 호출 보조 소환수 | `TWO_TIER_SUMMON_STRUCTURE_CONFIRMED_FOR_GATE_1` | 관계·학습과 전투 지원 책임 분리 |
| `GM-VS-ROUTE-01` | 제품 검증 경로 | CORE_POC 없이 Vertical Slice로 직접 진행 | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` | POC 제거, 검증 책임을 Slice에 흡수 |

---

## 최신 사용자 override — GM-VS-ROUTE-01

사용자 원문:

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

최신 경로:

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약 승인
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan
→ Validation-First Vertical Slice
→ QA·외부 검증
```

상태 변경:

| 이전 | 최신 |
|---|---|
| `CORE_POC: NOT_AUTHORED` | `CORE_POC: REMOVED_BY_USER_DECISION` |
| `GM-POC-01 NEXT_BLOCKING_DECISION` | `SUPERSEDED_BY_GM-VS-ROUTE-01` |
| `BLOCKED_BY_GATE_1_AND_CORE_POC` | `BLOCKED_BY_GATE_1_AND_SLICE_CONTRACT` |
| POC 검증 후 Slice | 검증 책임을 Slice 내부 통과 조건으로 흡수 |

별도 CORE_POC를 다른 이름으로 다시 만들지 않는다. Slice 구현 과정의 초기 내부 빌드는 독립 제품 단계가 아니라 통합 Slice의 검증 체크포인트다.

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

## 확정된 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

소환수는 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

---

## Validation-First Vertical Slice 필수 검증

- 터치 작성 손맛과 판정 허용 범위
- 입력 실패와 설계 실패 분리
- 완전 정지·감속·실시간 비교
- 같은 메인 글자의 전투·환경 재사용
- 복수 유효 해법과 실패 원인 재설계
- 메인 동반자의 학습·기록 연결
- 전투 보조 소환수의 작성 시간 확보
- Android 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

책임 원본:

- `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 소환수는 글자·회로를 작성·배치·연결하지 않음
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 보조 소환수는 전투에서 호출
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- Gate 1과 Slice 계약 승인 전 구현·Codex 실행 금지

---

## 보류된 세부 설계

- 첫 메인·보조 글자의 실제 종류와 수치
- 작성 중 시간 처리 최종안
- 완성 주문 스톡의 존재와 비중
- 보조 소환수 편성 수·호출 비용·충전 수치
- 상태이상 중첩·저항·해제
- 3년·6학기와 전체 일정 수
- 관계 분기량과 상세 대화 분량
- 정확한 Slice 통과 정량값

---

## 다음 결정

`GM-SLICE-01`: 첫 Vertical Slice의 대표 구간, 포함·제외 범위, 통과·실패 기준을 확정한다.

권장 후보:

```text
짧은 수업
→ 교내 연습
→ 메인 동반자와 짧은 일상·준비
→ 첫 현장실습의 전투 문제
→ 환경·구조 문제
→ 복귀·마도서 기록
```

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`

---

## 운영 규칙

1. 사용자의 최신 지시가 이전 결정에 우선한다.
2. 변경 결정은 `SUPERSEDED`, `LATEST_OVERRIDE`, `REMOVED`, `REJECTED`로 추적한다.
3. 방향 확정과 세부 수치 확정을 구분한다.
4. 구현 파일은 기획 브랜치에 포함하지 않는다.
5. 현재 단계에서는 Codex를 실행하지 않는다.
6. 실제 빌드·테스트 없이 Gate 통과나 완료를 주장하지 않는다.
7. 과거 세부 결정은 Git 이력과 날짜별 Addendum으로 보존한다.
