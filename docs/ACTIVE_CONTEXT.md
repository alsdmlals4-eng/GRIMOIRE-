# GRIMOIRE Active Context

## 1. 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: https://github.com/alsdmlals4-eng/GRIMOIRE-
baseline_branch: main
working_branch: agent/grimoire-v93-canon
baseline_date: 2026-07-31
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
gate_1: APPROVED
project_core: CORE_CONFIRMED
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
implementation: NOT_STARTED
codex: BLOCKED
planning_complete: false
next_blocker: PLANNING-CONTENT-01
```

현재 작업은 제품 구현이 아니라 **기획 완결 패스**다. Base v9.3 운영 정합화의 어댑터·CI·구현 인계는 기획과 검수 뒤로 보류한다.

## 2. 최신 사용자 결정

결정 ID: `GM-PLANNING-SEQUENCE-01`

Codex는 기획 완료와 검수 완료 뒤 마지막에 사용한다.

```text
기획 정본 전수 감사
→ 누락·충돌·과잉 범위 보완
→ Vertical Slice 콘텐츠 상세 설계
→ 합성 관점·적대적 검토
→ 정본·Sheet 추적성 검수
→ 사용자 기획 완료 승인
→ Art Style·Art Bible·Asset Specification·Audio Direction
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 마지막에 구현
```

현재 금지:

- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 생성
- 실행 프로필 전환
- 기획 후보의 자동 확정
- Google Sheet 병합 전 쓰기
- 사용자 검토 없는 PR 병합

## 3. 필수 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md
→ docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md
→ 질문 주제의 단일 책임 원본
```

확정 결정을 기억 확인 목적으로 다시 묻지 않는다. 검토 중 후보와 확정 결정을 구분한다.

## 4. 승인된 제품 코어

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

### 비타협

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 입력 실패와 주문 설계 실패 분리
7. 학습→증명→표현→응용→발견·기록 순환

## 5. 승인된 Vertical Slice

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

- 목표 `45~50분`, 하드 상한 `60분`
- 공통 `Situation Challenge`
- 각 문제의 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- M0→M1→M2→M3→M4 내부 체크포인트
- 별도 CORE_POC 재도입 금지

## 6. 승인된 표현과 소환수

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

- 메인 동반 정령: Slice 초기 형상 1개
- 장기 방향: 4단계 성장·이전 형상 선택·탑승
- 전투 보조 소환수: Slice 수호 또는 견제 1체
- 소환수는 글자 작성·조합 판단·정답을 대행하지 않음

## 7. 1차 기획 감사 결과

판정: `PLANNING_INCOMPLETE / CONTENT_DEFINITION_REQUIRED`

P0:

1. PC 우선과 모바일 터치 중심 문서 충돌
2. 구간별 최대 시간 합계와 60분 상한 충돌
3. 대표 글자의 실제 의미·조합 규칙 누락
4. 다섯 Situation Challenge의 실제 문제·복수 해법 누락
5. 교수·핵심 동급생·주인공 성장선 누락
6. 자유일정 결과와 무최적해 구조 미완성
7. 학교 문화·현장실습 이유·마도서 보상 미완성
8. Art Style 전에 확정해야 할 콘텐츠 대상 누락

## 8. 현재 검토 중인 설계

책임 문서:

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

상태: `DESIGN_SPEC_FOR_USER_REVIEW`

권장 후보:

- 글자: `흐름 / 집중 / 분산`
- 주인공: 일반 가정 출신 장학생 신입생
- 성장선: 정답 집착에서 책임 있는 설계자로 이동
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 축제: 빛실 장막 복구
- 현장: 외곽 생태 온실의 마력 관개 수로
- 보조 소환수: 수호형 우선
- PC 입력: 마우스 드래그·펜 보조·키보드 복구
- 시간 후보: 목표 46분·콘텐츠 상한 53분·하드 상한 60분

이 항목은 사용자 검토 전 `NOT_YET_CANON`이다.

## 9. 현재 게이트

| 게이트 | 상태 |
|---|---|
| `PLANNING-CONTENT-01` | `USER_REVIEW_REQUIRED` |
| `PLANNING-PLATFORM-01` | `BLOCKED_BY_CONTENT_REVIEW` |
| `PLANNING-SCOPE-01` | `BLOCKED_BY_CONTENT_REVIEW` |
| `PLANNING-REVIEW-01` | `NOT_STARTED` |
| 사용자 기획 완료 승인 | `NOT_GRANTED` |
| `ART-STYLE-01` | `BLOCKED_BY_PLANNING_COMPLETE` |
| Codex Plan | `BLOCKED` |
| Godot 구현 | `BLOCKED` |

## 10. 플랫폼과 Sheet

- PC판을 먼저 설계·검증·출시한다.
- 모바일은 공통 콘텐츠·데이터 계약을 재사용하되 입력·접근성·성능을 별도 검증한다.
- 기존 Android 터치 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`다.
- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- Sheet 역할: `USER_FACING_GDD_WORKSPACE`
- 현재 Sheet 쓰기: 금지
- 병합 후 계약된 범위만 동기화하고 GitHub main과 Sheet를 재조회해야 `SYNCED`다.

## 11. 검증 경계

```text
RUNTIME = NOT_RUN
PC_INPUT = NOT_RUN
MOBILE = NOT_RUN
ACCESSIBILITY = NOT_RUN
PERFORMANCE = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
CODEX = NOT_RUN
GODOT_PROJECT = NOT_STARTED
```

현재 확인 가능한 것은 문서·결정·범위·추적성뿐이다.
