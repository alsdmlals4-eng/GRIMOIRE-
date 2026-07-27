# 스펠 기획 결정 원장

## 문서 상태

- 프로젝트: `스펠` (임시)
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 최신 결정 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27Q.md`
- 최종 승인 원본: `docs/planning/GATE_1_FINAL_APPROVAL.md`
- 최신 적대적 검토: `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 결정과 승인 원본이 우선한다.

---

## 결정 인덱스

| ID | 결정 | 상태 |
|---|---|---|
| GM-CORE-01 | 조합·발견을 최상위 경험으로 설정 | `CONFIRMED` |
| GM-AUDIENCE-01 | 10~15분 단위 모바일 플레이 | `CONFIRMED` |
| GM-NARRATIVE-03 | 기본은 짧게, 선택 시 깊게 | `CONFIRMED` |
| GM-PROMISE-01 | 배움→설계→세계 변화 | `CONFIRMED` |
| GM-LOOP-01 | 수업·시험·축제·현장·자유일정 Loop | `CONFIRMED` |
| GM-CURVE-01 | 첫 5분 직접 작성, 자동화 후행 | `CONFIRMED` |
| GM-CORE-BOUNDARY-01 | 의미 기반 작성·조합·상황 반응 | `CONFIRMED` |
| GM-SALES-01 | 직접 작성·상황별 설계·학교 학습 발견 | `CONFIRMED` |
| GM-BENCHMARK-01 | 직접 입력 / 조합 문제 / 학교 성장 벤치마크 | `RESEARCH_AUTHORED` |
| GM-MASCOT-01 | 메인 동반 + 전투 보조 2계층 | `CONFIRMED` |
| GM-VS-ROUTE-01 | CORE_POC 없이 Vertical Slice 직행 | `CONFIRMED` |
| GM-SLICE-01 | 4개 핵심 세션 + 자유일정 3회 | `CONFIRMED` |
| GM-GATE1-REVIEW-01 | Gate 1 적대적 범위 검토 | `AUTHORED` |
| GM-GATE1-RISK-01 | P0 처리 패키지 승인 | `CONFIRMED` |
| GM-GATE1-APPROVAL-01 | Gate 1 전체 최종 승인 | `APPROVED` |
| GM-VS-REVIEW-LOOP-01 | Gate 2 진입 전 5렌즈 적대적 검토 | `PASS_WITH_FOLLOWUP` |
| GM-VS-PROFILE-01 | 실행 프로필 전환 | `DEFERRED_UNTIL_VISUAL_AUDIO_PREPRODUCTION` |
| GM-VISUAL-PRESENTATION-01 | 화면 방향·카메라·게임 표현 구조 | `NEXT_BLOCKING_DECISION` |

---

## 승인된 프로젝트 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→평가·표현→응용→발견·기록 순환

## 승인된 Vertical Slice

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

보호:

- 모든 핵심 세션은 공통 `Situation Challenge` 사용
- 첫 완주 목표 `45~50분`, 상한 `60분`
- 자유일정은 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지
- 메인 동반·전투 보조 소환수의 책임 분리

---

## 적대적 검토 루프 결정

사용자 최신 순서:

```text
적대적 검토 루프
→ 그림체 선정 준비
→ 캐릭터 이미지
→ 배경 이미지
→ 사운드
→ 효과
→ 이후 구현 준비
```

적대적 검토로 다음 순서를 확정했다.

```text
화면 방향·카메라·게임 표현 구조
→ 캐릭터 표현 수준
→ 그림체 후보 비교·선정
→ Art Bible
→ Asset Specification
→ 캐릭터·배경·UI·효과·사운드 작업
→ 실행 프로필 전환 재검토
```

판정:

- Gate 1 코어와 Slice 범위: `NO_CHANGE`
- 문서 상태 회귀: `MUST_FIX / FIXED`
- Problem Differentiation Matrix: `SHOULD_FIX`
- Save Schema v1: `TECHNICAL_REVIEW_PROPOSAL`
- 화면 방향·카메라·표현 구조: `USER_DECISION_REQUIRED`
- 대량 자산 제작: `BLOCKED_BY_VISUAL_PRESENTATION_DECISIONS`
- 런타임·Android·접근성·성능: `BLOCKED_UNVERIFIED`

---

## 현재 보호 결정

- 승인된 코어를 증거 없이 다시 개방하지 않음
- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 세션별 전용 미니게임·프레임워크 금지
- 첫 완주 상한 60분
- 화면 구조 전 대량 자산 제작 금지
- 생성·편집 자산의 출처·도구·파생 관계·승인 기록
- 실행 프로필 전환 전 Codex·Godot 구현 금지
- 사용자 승인 없는 PR 병합 금지

---

## 보류·미검증

### `PLAYTEST_TUNING_REQUIRED`

- 각 세션의 정확한 시간
- 입력 판정 허용 범위
- 완전 정지·감속·실시간 최종안
- 자유일정 보정 수치
- 시험 점수·성적 보상
- 보조 소환수 수호·견제 수치

### `BLOCKED_UNVERIFIED`

- 실제 Android 화면비·성능·복귀
- 공통 Situation Challenge 런타임 재사용성
- 자유일정 선택 가치
- 아트·FX 가독성
- 사운드 믹스·무음 대체
- 외부 자산·폰트·사운드 라이선스

### `DEFERRED_CONTENT_DATA`

- 첫 글자 명칭과 효과
- 시험·축제·현장 문제 소재
- 교수·학생·동반자 대사
- 구체적 캐릭터·배경·사운드 자산

---

## 다음 결정

`GM-VISUAL-PRESENTATION-01`: Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄 것인가?

상태: `NEXT_BLOCKING_DECISION`
