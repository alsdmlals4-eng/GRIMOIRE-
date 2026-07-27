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
- 이미지·사운드 대량 제작: `NOT_STARTED`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 최신 결정 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27S.md`
- 빠른 복원 원본: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- 최종 승인 원본: `docs/planning/GATE_1_FINAL_APPROVAL.md`
- 최신 적대적 검토: `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
- 시각 표현 원본: `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
- 캐릭터 표현 원본: `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
- 소환수 성장 원본: `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 결정·승인 원본·현재 확정 결정 스냅샷이 우선한다.

---

## 1. 결정 인덱스

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
| GM-VS-REVIEW-LOOP-01 | Gate 2 1차 적대적 검토 | `PASS_WITH_FOLLOWUP` |
| GM-VISUAL-PRESENTATION-01 | 가로형 하이브리드 2D | `CONFIRMED` |
| GM-CHARACTER-PRESENTATION-01 | 필드 SD + 대화 반신 + 전투 SD 재사용 | `CONFIRMED` |
| GM-BATTLE-PRESENTATION-01 | 별도 고정 3/4 전술 전투장 | `CONFIRMED` |
| GM-SUMMON-GROWTH-01 | 메인 소환수 4단계 성장·이전 형상 선택·후반 탑승 | `CONFIRMED_DIRECTION` |
| GM-VS-REVIEW-LOOP-02 | 캐릭터·전투·소환수·결정 기억 최종 검토 | `PASS_WITH_CORRECTIONS` |
| GM-VS-PROFILE-01 | 실행 프로필 전환 | `DEFERRED_UNTIL_VISUAL_AUDIO_PREPRODUCTION` |
| ART-STYLE-01 | 승인된 인게임 구성으로 그림체 비교·선정 | `NEXT_BLOCKING_DECISION` |

---

## 2. 승인된 프로젝트 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 학습→평가·표현→응용→발견·기록 순환

---

## 3. 승인된 Vertical Slice

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

- 공통 `Situation Challenge`
- 첫 완주 목표 `45~50분`, 상한 `60분`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 메인 동반·전투 보조 소환수 책임 분리
- 별도 CORE_POC 재도입 금지

---

## 4. 승인된 시각·캐릭터·전투 구조

```text
학교·자유일정·비전투 탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 기존 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드와 동일한 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 전용 작성 오버레이

전투 종료
= 결과를 반영한 원래 필드 장면으로 복귀
```

화면비:

- 기준 `16:9`
- 확장 `18:9~20:9`
- 핵심 UI·작성 영역은 안전 구도 유지
- 내부 해상도는 `ASSET-SPEC-01`

기존 `같은 필드 화면에서 전투` 규칙은 `SUPERSEDED_BY_GM-BATTLE-PRESENTATION-01`이다.

책임 원본:

- `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`

---

## 5. 승인된 소환수 방향

### 2계층

```text
메인 동반 소환수
= 항상 같은 개체
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 위험·전투에서 호출
= 작성 시간을 확보하는 전술 지원
```

### 메인 동반 소환수

- 원소·정령 우선
- 동물 형상은 가능하지만 전체 체계를 동물형으로 고정하지 않음
- 대표 방향은 신비한 정령수 계열, 현재 늑대형 레퍼런스가 유력
- 장기 4단계 성장
- 성장 단계별 크기·실루엣·원소 표현 변화
- 해금한 현재 단계 이하의 이전 형상 선택 가능
- 실제 성장 단계와 표시 형상 분리
- 장기 탑승 기능
- 탑승과 2~4단계 전체 런타임은 Vertical Slice 제외

### 전투 보조 소환수

확정:

- 같은 원소·정령 시각 언어
- 역할 우선 실루엣
- Vertical Slice는 수호 또는 견제 1체

미확정:

- 4역할 전체 체계
- 성장 단계와 이전 형상 선택
- 탑승
- 획득·편성·재화 구조

책임 원본:

- `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
- `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`

---

## 6. 적대적 검토 루프 02 결론

| Finding | 판정 | 처리 |
|---|---|---|
| 확정 내용을 다시 묻는 정본 누락 | `P0 MUST_FIX` | 현재 결정 스냅샷·질문 전 조회 규칙 신설 |
| 같은 화면 전투와 최신 결정 충돌 | `P0 MUST_FIX` | 별도 전술 전투장으로 교체 |
| 필드·대화·전투 자산 폭증 | `P1` | 필드·전투 SD 재사용 |
| 메인 소환수 4단계 전체 Slice 제작 | `P0 SCOPE` | 장기 방향 유지, Slice 초기 형상 1개 |
| 이전 형상과 실제 능력 혼동 | `P1` | 실제 성장과 표시 형상 분리 |
| 탑승과 장면 기반 구조 충돌 | `P1` | 연출형·구간형 우선, Slice 제외 |
| 전투 소환수 4역할 과잉 확정 | `P0` | 비교 후보 유지, Slice 수호/견제 1체 |
| 이미지 실패 시 동일 요청 재입력 | `P1 OPERATING` | 브리프 보존·단순화 재시도 규칙 |

최종 판정: `PASS_WITH_CORRECTIONS`

---

## 7. 재질문 방지 규칙

새 질문 전 확인:

```text
START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG와 최신 Addendum
→ 주제별 책임 원본
```

질문 허용 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자 명시적 재개방

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정을 기억 확인 목적으로 다시 선택하게 하지 않는다.

---

## 8. 이미지 작업 규칙

- 이미지 관련 선택은 가능한 경우 예상 인게임 이미지로 제시
- 생성 이미지는 자동 시스템 확정이나 최종 자산이 아님
- 상태 구분:

```text
CONCEPT_EXPLORATION
VISUAL_REFERENCE_CANDIDATE
USER_APPROVED_VISUAL_REFERENCE
ART_BIBLE_APPROVED
RUNTIME_ASSET_APPROVED
```

- 사용자 승인 두 번째 인게임 구성 이미지는 `USER_APPROVED_VISUAL_REFERENCE`
- 이미지 생성 실패 시 동일 요청 재입력을 기본 해결책으로 사용하지 않음
- 기존 브리프를 유지하고 한글 장문·UI 복잡도·한 장의 요소 수를 줄여 재시도

---

## 9. 현재 보호 결정

- 승인된 코어를 증거 없이 재개방하지 않음
- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 세션별 전용 미니게임·프레임워크 금지
- 첫 완주 상한 60분
- 필드 SD + 대화 반신 + 별도 고정 3/4 전투장 유지
- 작성 중 대상·위험·지원 상태 유지
- Art Bible·Asset Specification 전 대량 자산 제작 금지
- 생성·편집 자산의 출처·도구·파생 관계·승인 기록
- 실행 프로필 전환 전 Codex·Godot 구현 금지
- 사용자 승인 없는 PR 병합 금지

---

## 10. 보류·미검증

### `PLAYTEST_TUNING_REQUIRED`

- 입력 판정 허용 범위
- 완전 정지·감속·실시간 최종안과 감속 비율
- 전투장 이동 범위
- 자유일정 보정 수치
- 시험 점수·성적 보상
- 보조 소환수 수호·견제 수치

### `ASSET_SPEC_REQUIRED`

- 내부 렌더 해상도
- 터치 작성 패널 크기
- SD 캐릭터 실제 픽셀 규격·기준선
- 대화 반신 크기·표정 수
- 배경·전투장·효과·사운드 수량
- 메인 동반 초기 형상 자산 구성

### `UNRESOLVED`

- 실제 그림체
- 주인공·교수·학생 구체 디자인
- 메인 동반의 이름·원소·정확한 종족·단계별 최종 외형
- 첫 보조 소환수 역할이 수호인지 견제인지
- 전투 보조 소환수 전체 역할·성장 체계
- Audio Direction

### `BLOCKED_UNVERIFIED`

- Android 화면비·성능·복귀
- 공통 Situation Challenge 런타임 재사용성
- 자유일정 선택 가치
- 아트·FX 가독성
- 사운드 믹스·무음 대체
- 외부 자산·폰트·사운드 라이선스

---

## 11. 다음 결정

`ART-STYLE-01`

승인된 다음 구성을 동일하게 사용한 인게임 이미지로 그림체 후보를 비교한다.

- 학교 필드 SD
- 대화 반신
- 별도 3/4 전술 전투장
- 메인 원소 정령수 초기 형상
- 수호 또는 견제 보조 소환수
- 마법 작성 오버레이
