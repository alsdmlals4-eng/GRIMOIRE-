# 스펠 Active Context

## 현재 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 기준 날짜: 2026-07-27
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 프로젝트 코어: `CORE_CONFIRMED`
- Gate 1: `APPROVED`
- Vertical Slice 계약: `APPROVED_AT_GATE_1`
- 제작성: `CONDITIONAL_PASS_CANDIDATE`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- PR 병합: `NOT_APPROVED`
- 다음 차단 결정: `GM-VS-PROFILE-01`

Gate 1 승인은 제품 콘셉트와 Vertical Slice 범위를 확정한다. 실행 프로필 전환, Codex 실행, Godot 구현, 런타임 검증, PR 병합은 별도 승인 대상이다.

---

## 활성 책임 원본

1. `docs/planning/GATE_1_FINAL_APPROVAL.md`
2. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`
5. `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
6. `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md`
7. `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
8. `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md`
9. `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md`
10. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
11. `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
12. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27P.md`
13. `docs/planning/DECISION_LOG.md`
14. `docs/DEVELOPMENT_GATES.md`
15. `docs/DESIGN_DOCUMENT_REGISTRY.json`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 결정, 최종 승인 문서와 위 책임 원본이 우선한다.

---

## 승인된 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 승인된 최상위 경험

> **마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.**

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

## 승인된 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→평가·표현→현장실습→발견·기록→다음 학습 순환

## 승인된 세일즈포인트

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

---

## 승인된 Vertical Slice

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
→ 다음 학기 예고
```

세션 역할:

```text
수업·연습 = 배움과 원리 비교
시험 = 제한 조건 안에서 이해 증명
학교축제 = 표현·개성·관계·비전투 활용
현장실습 = 위험 속 우선순위·재설계·발견
자유일정 = 휴식·준비·교류의 완충
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

수업·시험·축제·현장실습은 같은 문제·데이터 계약을 사용한다.

### 시간 계약

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 첫 직접 작성: 시작 후 5분 이내
- 메인·보조 차이 이해: 시작 후 15분 이내
- 연속 플레이 강제 없음

### 자유일정 계약

- 중요 일정 사이 총 3회
- 슬롯당 행동 하나
- `휴식 / 준비 / 교류` 세 원형 재사용
- 필수 진행·정보·정답 차단 금지
- 신규 지역·전투·독립 미니게임 추가 금지
- 휴식은 손해 전용 선택이 아님

### 최소 저장

- 핵심 세션 시작·완료
- 자유일정 선택 전·완료
- 현장 전투 문제 완료 후
- 귀환·기록 완료 후

대화 한 줄 단위 저장, 자유 위치 저장, 전투 중 임의 저장과 모든 주문 궤적 기록은 초기 범위에서 제외한다.

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

Vertical Slice에서는 보조 소환수의 `수호` 또는 `견제` 중 하나만 구현한다.

두 소환수 모두 글자 작성, 조합 판단, 주문 설계와 정답 제시를 대행하지 않는다.

---

## 승인된 구현 체크포인트

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 Vertical Slice 내부 체크포인트이며 별도 CORE_POC가 아니다.

가드레일:

- M0에서 입력 실패와 설계 실패 분리
- M1 확인 전 축제 전용 연출·장문 대화·다수 자산 확대 금지
- M2까지 학교 장면 세트 재사용
- 구현 순서 역전 금지

---

## 현재 미검증

- 터치 작성의 실제 재미·인식 허용 범위·반복 피로
- 완전 정지·감속·실시간 최종안
- 공통 Situation Challenge의 런타임 재사용성
- 첫 완주 60분 이내 달성
- 자유일정 세 원형의 선택 가치
- 보조 소환수의 작성 시간 확보 효과
- Android 실제 기기·화면비·성능·복귀
- 두 번째 유사 콘텐츠 제작 비용

상태는 `NOT_RUN`, `BLOCKED_UNVERIFIED` 또는 `PLAYTEST_TUNING_REQUIRED`다.

---

## 보호 결정

- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 스톡 없이 직접 시전 가능
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 모든 핵심 세션은 공통 Situation Challenge 사용
- 첫 완주 허용 상한 60분
- 별도 CORE_POC 재도입 금지
- 실행 프로필 전환 전 Codex·Godot 구현 금지
- 사용자 승인 없는 PR 병합 금지

---

## 다음 차단 결정

`GM-VS-PROFILE-01`: 실행 프로필을 `PLANNING_ONLY_PROFILE`에서 `VERTICAL_SLICE_FULL_PROFILE`로 전환하고 Codex read-only Plan 및 구현 준비 문서 작성을 시작할 것인가?

전환 승인 전 허용:

- 승인된 계약 문서 정리
- 구현 계획·검증 항목 논의
- Godot·Android 기술 후보 검토

전환 승인 전 금지:

- Codex 실행
- Godot 구현
- 런타임 산출물 작성
- Draft PR 병합
