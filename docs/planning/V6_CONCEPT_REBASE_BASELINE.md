# 스펠 v6 콘셉트 재기획 기준선

## 문서 상태

- 프로젝트: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 상태: `GATE_1_WORKING_BASELINE`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 프로젝트 코어 전체: `CORE_CANDIDATE`
- Gate 1 전체: `UNVERIFIED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- CORE_POC 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- Vertical Slice 경로: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- Vertical Slice 계약: `NOT_AUTHORED`
- 구현 상태: `NOT_STARTED`

이 문서는 Gate 1의 통합 상태와 승인된 방향을 요약한다. 세부 책임은 각 전용 원본에 위임한다.

---

## 1. 최신 제품 경로 override

사용자 결정:

> `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`

최신 경로:

```text
Gate 1 콘셉트 정리
→ Vertical Slice 계약 승인
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ VERTICAL_SLICE_FULL_PROFILE 전환
→ Codex read-only Plan 검수
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
→ Gate 3 판단
```

기존 CORE_POC 계약·구현·통과 단계는 `SUPERSEDED_BY_GM-VS-ROUTE-01`이다.

검증을 제거하지 않는다. CORE_POC가 담당하던 입력·조합·전투 압박·소환수·모바일 UX 검증을 Vertical Slice의 통과 기준으로 흡수한다.

책임 원본:

- `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
- `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27L.md`

---

## 2. Gate 1 책임 원본

1. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
2. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
3. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
4. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
5. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
6. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
7. `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
8. `docs/planning/DECISION_LOG.md`
9. `docs/ACTIVE_CONTEXT.md`
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 Spell 기획 문서는 `REFERENCE_CANDIDATE`다. 문서에 존재한다는 이유만으로 Gate 1 확정값으로 자동 승계하지 않는다.

---

## 3. 승인된 최상위 경험

> **마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.**

우선순위:

```text
1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감
```

직접 작성과 자동화는 조합·발견의 재미를 약화시키지 않는 범위에서만 확대한다.

---

## 4. 목표 플레이어·플레이 상황

> 집·카페·휴식 시간처럼 잠깐 집중할 수 있는 환경에서 10~15분 동안 하나의 수업·현장실습·마법 발견 단위를 완주하고, 장기적으로 학교생활과 주문 연구를 축적하려는 모바일 플레이어.

시간 목표는 `PLAYTEST_TUNING_REQUIRED`다.

---

## 5. 서사 깊이

기본은 짧고 명확하게 제공한다.

필수 핵심층:

- 현재 상황과 행동 이유
- 목표와 위험
- 중요한 선택 결과
- 주문 문제 해결에 필요한 핵심 정보

선택형 상세층:

- 인물 감정과 관계
- 학교생활과 세계관
- 다른 해결법과 실패 사례
- 소환수·지역·학교 역사

필수 정보를 선택형 상세 대화에만 숨기지 않는다.

---

## 6. 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

설계 필터:

```text
배움
→ 글자와 문제의 원리를 이해

설계
→ 상황에 맞는 주문 구조 선택·작성

세계 변화
→ 설계 결과가 적·환경·사건을 변화
```

---

## 7. 비타협 프로젝트 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 즉각적이고 설명 가능한 적·환경·사건 변화
6. 수업→연습→현장실습→발견·기록→다음 학습 순환

지원 시스템:

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 메인 동반 소환수
- 전투 보조 소환수

변경 가능한 외피:

- 3년·6학기와 학기 일정 수
- 학교 규모·지역·관계 분기량
- 실시간·감속·단계형 전투 표현
- 완성 주문 스톡
- 보조 소환수 편성·수·성장 방식
- 정확한 세션 시간과 저장 단위

---

## 8. 게임플레이 Loop

```text
수업
→ 교내 연습
→ 일상·준비
→ 현장실습
→ 복귀·기록
→ 다음 수업·연구
```

핵심 문장:

> 수업에서 알고, 연습에서 할 수 있게 되고, 실전에서 다르게 써 보며, 일상에서 그 경험의 관계와 의미가 누적된다.

일정은 `고정 핵심 사건 + 자유 일정` 혼합형이다.

---

## 9. 경험 곡선

```text
학교 도착·목표 소개
→ 교수의 짧은 시범
→ 첫 메인 글자 직접 작성
→ 즉시 세계 변화
→ 보조 글자로 작은 설계
→ 짧은 관계 장면
→ 첫 현장실습
→ 새 활용 발견·기록
→ 반복 숙련 후 하위 글자 스톡
```

- 첫 5분에는 직접 작성과 설계 차이를 증명한다.
- 자동화는 직접 학습 이후의 보상이다.
- 첫 자동화는 숙련 보조 글자의 하위 글자 스톡부터 시작한다.

---

## 10. 세일즈포인트

통합 문장:

> **마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.**

최대 3개:

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

직접 작성은 첫 시각적 훅이고, 장기 핵심 재미는 의미 기반 조합·상황 반응·발견이다.

---

## 11. 벤치마킹·제작성 판정

- 직접 입력·마법 조작군
- 조합·시스템 문제 해결군
- 마법학교·학습 성장군

현재 판정:

- 결합 희소성: `RARE_IN_REVIEWED_SET`
- 시장 가치·장기 재미: `UNPROVEN`
- VRIO: `VRIO_POTENTIAL_NOT_PROVEN`
- 제한된 2D 모바일 Slice: `FEASIBLE_WITH_STRICT_SCOPE`
- 3년·6학기 전체 범위: `NOT_YET_FEASIBLE_AS_COMMITTED_SCOPE`

---

## 12. 2계층 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

소환수는 글자·회로 작성, 조합 판단, 정답 제시, 자동 전투 해결을 대행하지 않는다.

---

## 13. Validation-First Vertical Slice

권장 후보:

```text
짧은 수업
→ 교내 연습
→ 메인 동반자와 짧은 일상·준비
→ 첫 현장실습 전투
→ 환경·구조 문제
→ 복귀·마도서 기록
```

필수 검증:

- 직접 작성과 즉각적 발현
- 입력 실패와 설계 실패 분리
- 완전 정지·감속·실시간 비교
- 같은 메인 글자의 전투·환경 재사용
- 최소 2개의 유효 해결법
- 실패 원인 이해와 재설계
- 메인 동반자의 학습·기록 연결
- 전투 보조 소환수의 수호·견제 효과
- Android 기기·화면비·성능·저장·복귀
- 두 번째 유사 콘텐츠 제작성

초기 제외:

- 3년·6학기 전체
- 다수 지역과 대규모 관계 분기
- 완성 주문 스톡
- 복잡한 소환수 충전·다중 편성
- 다중 상태이상
- 고정밀 자유 손글씨 인식
- 온라인·협동·풀보이스

---

## 14. 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 숙련 보조만 하위 글자 스톡 후보
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 상세 대화에만 숨기지 않음
- 메인 동반자는 항상 같은 개체
- 보조 소환수는 전투에서 호출
- 소환수는 작성·조합 판단을 대행하지 않음
- 별도 CORE_POC 재도입 금지
- 사용자 승인 전 `CORE_CONFIRMED` 금지
- Gate 1과 Slice 계약 승인 전 구현·Codex 실행 금지

---

## 15. 주요 위험

### P1

- POC 없이 Slice로 직접 가므로 범위가 비대해질 수 있다.
- 핵심 검증이 아트·서사·콘텐츠 제작 뒤로 밀릴 수 있다.
- 터치 작성의 화면 가림·인식 실패·반복 피로
- 조합 결과의 불명확성과 레시피 암기화
- 작성·전투·환경·스톡·소환수의 UI 과밀
- 동반자의 과도한 힌트와 보조 소환수의 과도한 조작

### BLOCKED_UNVERIFIED

- Slice 대표 구간과 정확한 콘텐츠량
- 작성 중 시간 처리 최종안
- 입력 판정 허용 범위
- 보조 소환수의 실제 작성 시간 확보 효과
- Android 성능·저장·복귀
- 두 번째 유사 콘텐츠 제작비

---

## 16. 다음 결정

`GM-SLICE-01`: 첫 Vertical Slice의 대표 구간, 포함·제외 범위, 통과·실패 기준을 확정한다.

> 첫 Vertical Slice를 `짧은 수업 → 교내 연습 → 짧은 일상·준비 → 첫 현장실습의 전투·환경 문제 → 복귀·마도서 기록`의 완결형으로 구성할 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`
