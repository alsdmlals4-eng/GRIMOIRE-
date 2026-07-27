# 스펠 v6 콘셉트 재기획 기준선

## 문서 상태

- 프로젝트: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 상태: `GATE_1_WORKING_BASELINE`
- 작성일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 프로젝트 코어 전체: `CORE_CANDIDATE`
- 프로젝트 코어 경계: `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1`
- 세일즈포인트: `SALES_POINTS_CONFIRMED_FOR_GATE_1`
- 벤치마킹·SWOT·VRIO·제작성: `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED`
- VRIO: `VRIO_POTENTIAL_NOT_PROVEN`
- 1인 제작성: `FEASIBLE_WITH_STRICT_SCOPE`
- Gate 1 전체: `UNVERIFIED`
- 구현 상태: `NOT_STARTED`
- CORE_POC: `NOT_AUTHORED`
- Vertical Slice: `BLOCKED_BY_GATE_1`

이 문서는 Gate 1의 통합 상태와 승인된 방향을 요약한다. 세부 책임은 각 전용 원본에 위임한다.

---

## 1. 권한과 자료 지위

### 최상위 원본 계약

- 사용자 제공 `VERTICAL_SLICE_MASTER_REFERENCE_v6.md`
- `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`의 버전·해시 Manifest

v6는 기획 순서, Skill 오케스트레이션, Gate, 증거, 검증과 상태 표현을 책임진다.

### Gate 1 책임 원본

1. 이 문서 — Gate 1 통합 기준선과 진행 상태
2. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` — Micro·Combat·Session·Semester Loop
3. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` — 첫 5분부터 첫 숙련 자동화
4. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` — 비타협 코어·지원층·외피
5. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` — 세일즈포인트·한 문장·대표 세 장면
6. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` — 경쟁군·SWOT·VRIO·Godot·1인 제작성
7. `docs/planning/DECISION_LOG.md` — 사용자 결정과 상태 인덱스
8. `docs/ACTIVE_CONTEXT.md` — 현재 작업 상태
9. `docs/DESIGN_DOCUMENT_REGISTRY.json` — 단일 책임 원본 라우팅

### 기존 Spell 기획 문서

기존 `docs/planning/` 문서는 아이디어·사용자 결정 이력·후보 시스템·수치·폐기 이력·벤치마킹·제작 위험을 제공하는 참조 자료다.

```text
기존 작업물
→ 사실·선호·가설·폐기 이력 추출
→ v6 기준 재검토
→ AMPLIFY / SUPPORT / NEUTRAL / CONFLICT / UNPROVEN
→ 사용자 승인
→ 새 책임 원본 반영
```

기존 문서에 존재한다는 이유만으로 Gate 1 확정값으로 자동 승계하지 않는다.

---

## 2. 승인된 최상위 경험 — GM-CORE-01

상태: `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED`

> **마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.**

```text
1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감
```

2번과 3번은 1번을 약화시키지 않는 범위에서만 확대한다.

---

## 3. 승인된 목표 플레이어·플레이 상황 — GM-AUDIENCE-01

상태: `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED`

> 집·카페·휴식 시간처럼 잠깐 집중할 수 있는 환경에서 10~15분 동안 하나의 수업·현장실습·마법 발견 단위를 완주하고, 장기적으로 학교생활과 주문 연구를 축적하려는 모바일 플레이어.

```text
Micro 상황: 약 30초~2분
전투·문제 묶음: 약 3~5분
기본 세션: 약 10~15분
선택형 상세 감상: 추가 대화·조사·기록으로 자율 연장
```

정확한 시간은 `PLAYTEST_TUNING_REQUIRED`다.

---

## 4. 승인된 서사 깊이 — GM-NARRATIVE-03

상태: `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED`

> 기본적으론 스토리와 설명을 짧게 하고, 대화 선택 시 더 다양하고 깊게 제공한다.

필수 핵심층:

- 현재 상황·행동 이유·목표
- 위험·실패 조건
- 중요한 선택 결과
- 주문 문제 해결에 필요한 핵심 정보

선택형 상세층:

- 관계·학교생활·세계관·사건 배경
- 주문 원리·다른 해결법·실패 사례
- 소환수·지역·학교 역사

필수 정보는 선택형 상세 대화에만 숨기지 않는다.

---

## 5. 확정된 플레이어 약속 — GM-PROMISE-01

상태: `PLAYER_PROMISE_CONFIRMED_FOR_GATE_1`

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

```text
배움
→ 글자와 문제의 원리를 이해한다.

설계
→ 상황에 맞는 주문 구조를 선택·작성한다.

세계 변화
→ 설계 결과가 적·환경·사건을 실제로 바꾼다.
```

- 직접 작성은 주체성을 증명하고 반복 노동이 되지 않아야 한다.
- 스톡과 소환수는 설계 판단을 대체하지 않는다.
- 학교는 완성 주문 지급 메뉴가 아니라 새 문법과 문제를 학습시키는 프레임이다.
- 수치 성장·자동 전투·장문 서사가 플레이어 약속보다 전면에 나오지 않는다.

---

## 6. 확정된 게임플레이 Loop — GM-LOOP-01

상태: `LOOP_STRUCTURE_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`

```text
수업에서 알고
→ 연습에서 할 수 있게 되고
→ 실전에서 다르게 써 보며
→ 일상에서 관계와 의미가 누적되고
→ 다음 수업·연구가 변화한다
```

일정은 `고정 핵심 사건 + 자유 일정` 혼합형이다.

---

## 7. 확정된 경험 곡선 — GM-CURVE-01

상태: `EXPERIENCE_CURVE_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`

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

초반 공개 순서:

1. 메인 글자 직접 작성
2. 보조 글자 하나와 결과 차이
3. 마나·작성 시간
4. 현장 목표와 환경 반응
5. 여러 보조 조합과 재설계
6. 하위 글자 스톡
7. 소환수 전투·수호 지원
8. 소환수 지정 스톡 충전
9. 완성 주문 스톡과 고급 준비 전술

---

## 8. 확정된 프로젝트 코어 경계 — GM-CORE-BOUNDARY-01

상태: `PROJECT_CORE_BOUNDARY_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`

> **의미를 배운 글자를 직접 쓰고 상황에 맞게 조합하여, 내가 설계한 주문으로 세계를 변화시키고 새 활용을 발견한다.**

### 비타협 프로젝트 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상` 조합 문법
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험을 읽고 주문을 변형하는 판단
5. 즉각적이고 설명 가능한 적·환경·사건 변화
6. 수업→연습→현장실습→발견·기록→다음 학습 순환

### 코어 지원 시스템

- 마법학교
- 일상·관계
- 마도서·발견 기록
- 숙련·하위 글자 스톡
- 소환수 전투·수호·지정 충전 지원

### 변경 가능한 외피

- 3년·6학기와 학기 `10+4`
- 학교·지역·등장인물·관계 분기량
- 실시간 전투 압박과 집중 모드
- 메인 레벨·보조 운용량·스톡 수치
- 완성 주문 스톡의 존재와 비중
- 소환수 편성·성장 방식
- 정확한 세션 시간과 저장·복귀 단위

---

## 9. 확정된 세일즈포인트 — GM-SALES-01

상태: `SALES_POINTS_CONFIRMED_FOR_GATE_1`

책임 원본: `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`

> **마법 글자를 직접 쓰고 조합해, 수업에서 배운 원리로 전투와 환경의 새로운 해답을 발견하는 모바일 마법학교 RPG.**

### 최대 3개

1. **손으로 직접 쓰는 마법**
2. **상황에 맞게 만드는 주문**
3. **수업에서 배우고 실전에서 발견하는 마법학교**

### 대표 세 장면

```text
직접 글자 작성→즉시 마법 발현
같은 메인 글자→다른 보조 조합→다른 상황 결과
수업 원리→현장 응용→새 활용 마도서 기록
```

---

## 10. 벤치마킹·SWOT·VRIO·1인 제작성 — GM-BENCHMARK-01

상태: `BENCHMARK_FRAMEWORK_CONFIRMED_RESEARCH_AUTHORED`

책임 원본: `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`

### 확정된 경쟁군

1. 직접 입력·마법 조작군
2. 조합·시스템 문제 해결군
3. 마법학교·학습 성장군

### 핵심 결론

- 직접 작성은 강한 시각적 훅이지만 단독으로는 필기 미니게임이 될 수 있다.
- 장기 코어는 의미가 명확한 소수 글자와 상황 반응의 조합 밀도다.
- 학교는 콘텐츠 양보다 배운 원리가 다음 실습의 해결법을 바꾸는지가 중요하다.
- 이번 검토군에서 직접 작성·의미 기반 조합·학교 학습 순환을 모두 중심 코어로 제공하는 단일 작품은 확인하지 못했다.
- 결합은 `RARE_IN_REVIEWED_SET`이나 가치와 재미는 `UNPROVEN`이다.
- VRIO는 `VRIO_POTENTIAL_NOT_PROVEN`이다.
- 작은 2D 모바일 CORE_POC는 `FEASIBLE_WITH_STRICT_SCOPE`다.

### Gate 1 강화

- 작성 중 `완전 정지 / 감속 / 실시간`을 비교한다.
- 입력 실패와 설계 실패를 분리한다.
- 대표 문제는 전투와 환경·구조 문제를 함께 포함한다.
- 같은 메인 글자를 다른 보조와 상황에서 재사용한다.
- 복수의 유효 해결법과 실패 원인 재설계를 검증한다.

### 기술 판정

- Godot 터치 궤적 수집·시각화: `TECHNICALLY_FEASIBLE`
- 단순 템플릿 기반 글자 인식: `LIKELY_FEASIBLE_FOR_CORE_POC`
- 고정밀 자유 손글씨 인식: `OUT_OF_SCOPE_FOR_INITIAL_POC`
- Android·Google Play 내보내기: `SUPPORTED_BY_ENGINE`, 실제 프로젝트 설정은 미검증

---

## 11. 뾰족한 재미

```text
상황과 위험을 읽는다
→ 필요한 현상과 변형을 선택한다
→ 핵심 글자를 직접 작성하고 숙련 반복은 스톡으로 삽입한다
→ 주문 결과가 적·환경·문제를 어떻게 바꾸는지 확인한다
→ 새 활용을 발견하거나 실패 원인을 이해한다
→ 다음 주문을 더 영리하게 설계한다
```

핵심 고민:

- 지금 필요한 핵심 현상은 무엇인가?
- 어떤 보조 효과가 상황을 가장 효율적으로 바꾸는가?
- 직접 작성할 것인가, 준비한 스톡을 사용할 것인가?
- 짧고 안전한 주문과 복잡하고 강한 주문 중 무엇을 선택할 것인가?

목표 감정:

- 발견
- 영리함
- 마법을 이해했다는 숙련감
- 내 설계가 작동했다는 주체성

---

## 12. 보호할 결정

- 주문은 `메인 글자 1개 + 보조 글자 0개 이상`이다.
- 메인 글자 하나만으로 기본 주문이 성립한다.
- 복수 메인 글자 결합은 금지한다.
- 신규·미숙·중요 글자는 직접 작성한다.
- 숙련 보조만 하위 글자 스톡 후보가 된다.
- 소환수는 회로·글자를 직접 작성·배치·연결하지 않는다.
- 소환수 보조 묶음 자동 연결을 재도입하지 않는다.
- 스톡 없이 직접 시전할 수 있다.
- 조건부 완전 자동 발동을 재도입하지 않는다.
- 필수 정보를 선택형 상세 대화에만 숨기지 않는다.
- 수업은 완성 주문 상점이 아니다.
- 현장실습은 정답 주문 재생 시험이 아니다.
- 일상은 전투와 무관한 호감도 메뉴가 아니다.
- 자유 일정은 필수 진행을 영구 차단하지 않는다.
- 첫 마법 사용 전 장문 설명을 강제하지 않는다.
- 수동 작성 경험 없이 자동화를 먼저 공개하지 않는다.
- 의미 기반 글자·직접 작성·상황 변형·세계 변화·학습 순환은 범위 축소 대상이 아니다.
- `무한 자유 조합`, `무엇이든 가능한 마법`, `완전한 손글씨 인식`을 약속하지 않는다.
- 입력 실패와 설계 실패를 같은 실패로 처리하지 않는다.
- 실시간 전투·완성 주문 스톡·소환수 충전을 검증 전 대표 세일즈포인트로 사용하지 않는다.
- 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.

---

## 13. 보류와 위험

### 보류

- 실시간 전투 최종 채택
- 집중 모드의 정확한 작동 방식
- 완성 주문 스톡의 필요성
- 소환수 충전 관리의 핵심성
- 3년·6학기와 학교 전체 규모
- 스톡·전투 수치

### P1

- 모바일에서 작성·마나·적·스톡·충전·소환수·대상 판단이 과도해질 수 있다.
- 조합 결과가 불명확하면 레시피 암기와 시행착오 노동이 된다.
- 직접 작성이 반복 피로와 화면 가림을 만든다.
- 완성 주문 스톡 비중이 높아지면 버튼 전투로 퇴행한다.
- 학교·관계 콘텐츠가 코어 검증보다 먼저 비대해질 수 있다.
- 직접 작성만 보이면 단순 필기 미니게임으로 오해받을 수 있다.
- 대형 경쟁작 수준의 3D·협동·도시 생활·관계 콘텐츠를 기대받을 수 있다.

### BLOCKED_UNVERIFIED

- 첫 마법·첫 독립 설계까지의 실제 시간
- 터치 작성의 반복 재미·인식 허용 범위·손가락 가림
- 입력 실패와 설계 실패의 구분
- 실시간·감속·정지 비교
- 같은 메인 글자의 상황별 재사용 가독성
- 복수 해법과 실패 원인 재설계
- 실제 모바일 UI 혼잡도
- 10~15분 세션 적합성
- 스톡·소환수의 판단 보존 여부
- 세일즈포인트 3개의 사용자 이해도·시장 희소성
- 작은 CORE_POC의 독립 재미와 실제 1인 공수

---

## 14. Gate 1 진행 순서

```text
GM-CORE-01 — 승인됨
→ GM-AUDIENCE-01 — 승인됨
→ GM-NARRATIVE-03 — 승인됨
→ GM-PROMISE-01 — 승인됨
→ GM-LOOP-01 — 승인됨
→ GM-CURVE-01 — 승인됨
→ GM-CORE-BOUNDARY-01 — 승인됨
→ GM-SALES-01 — 승인됨
→ GM-BENCHMARK-01 — 승인·조사 작성됨
→ GM-MASCOT-01 마스코트·상징 동반자 역할
→ GM-POC-01 CORE_POC 계약
→ 적대적 검토
→ 사용자 Gate 1 승인
```

---

## 15. 다음 차단 결정 — GM-MASCOT-01

소환수 또는 상징 동반자가 세일즈포인트와 코어를 어떻게 강화하며, 어떤 역할은 맡지 않아야 하는가.

> 소환수를 전투 유닛보다 마법 학습·실습·기록을 함께하는 상징 동반자로 우선 배치할 것인가?

상태: `DESIGN_HYPOTHESIS_REQUIRES_USER_DECISION`

---

## 16. 완료·미완료 판정

- 최상위 경험: `APPROVED`
- 목표 플레이어·플레이 상황: `APPROVED`
- 선택형 서사 깊이: `APPROVED`
- 플레이어 약속: `APPROVED_FOR_GATE_1`
- Loop 구조: `APPROVED_FOR_GATE_1`
- 경험 곡선: `APPROVED_FOR_GATE_1`
- 프로젝트 코어 경계: `APPROVED_FOR_GATE_1`
- 세일즈포인트: `APPROVED_FOR_GATE_1`
- 벤치마크 프레임: `APPROVED`
- SWOT·VRIO·1인 제작성 데스크 리서치: `AUTHORED_NOT_PLAYTESTED`
- 프로젝트 코어 전체: `CORE_CANDIDATE`
- Gate 1 전체: `UNVERIFIED`
- CORE_POC: `NOT_AUTHORED`
- 구현: `NOT_STARTED`
