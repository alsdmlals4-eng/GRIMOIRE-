# GRIMOIRE Active Context

## 현재 상태

- 프로젝트명: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `https://github.com/alsdmlals4-eng/GRIMOIRE-`
- 기준 브랜치: `main`
- 기준 날짜: 2026-07-31
- 1차 출시 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- 제품 단계: `DEMO_FIRST_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 대량 이미지·사운드 제작: `NOT_STARTED`
- 다음 제품 차단 결정: `ART-STYLE-01`
- 구현 전 추가 계약: `PLATFORM-INPUT-01`
- Base 목표: `v9.3.0`
- Vertical Slice 실행 계약: `v9`

현재 작업은 제품 기능 구현이 아니라 Base v9.3·Vertical Slice v9 운영 정합화다. 승인된 게임 코어·세션 구조·화면·소환수 방향은 변경하지 않는다.

## 질문 전 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md와 최신 Addendum
→ 질문 주제의 단일 책임 원본
```

이미 확정된 결정은 기억 확인 목적으로 다시 묻지 않는다.

## 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

## 승인된 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

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

- 첫 완주 목표 `45~50분`, 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- M0→M1→M2→M3→M4는 Slice 내부 검증 체크포인트
- 별도 `CORE_POC` 재도입 금지

## 승인된 화면·캐릭터·전투

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

기존 `같은 필드 화면에서 전투`는 `SUPERSEDED`다.

## 승인된 소환수 방향

- 메인 동반 소환수: 원소·정령 중심, Vertical Slice는 초기 형상 1개
- 장기 방향: 4단계 성장, 해금된 이전 형상 선택, 탑승
- 후행 범위: 메인 2~4단계 런타임, 형상 선택 UI, 탑승
- 전투 보조 소환수: Vertical Slice는 수호 또는 견제 1체
- 미확정: 전투 보조 소환수 4역할 전체·성장·탑승·획득 경제

## 플랫폼 결정

상태: `PC_FIRST_CONFIRMED / MOBILE_FOLLOWUP_CONFIRMED_DIRECTION`

- PC판을 먼저 설계·검증·출시한다.
- 모바일판은 공통 데이터·게임 규칙을 재사용하되 입력·레이아웃·성능은 별도 적응한다.
- 기존 모바일 터치 입력 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`로 보존한다.
- PC 입력 방식은 `PLATFORM-INPUT-01`에서 마우스·키보드·펜 후보를 비교한다.
- 플랫폼 변경은 승인된 코어·Vertical Slice 세션을 자동으로 재개방하지 않는다.

## Base v9.3 운영 정합화

상태: `APPROVED_IN_PROGRESS`

```text
보호 정본 갱신
→ Base v9.3 adapter·snapshot·router 갱신
→ v6·v8 legacy 분류
→ 테스트·CI 검증
→ Draft PR 검수
→ 병합 후 Google Sheet 동기화
```

v6·v8 계약은 삭제하지 않지만 활성 실행 권한이 아니다.

## GDD Google Sheets

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 역할: `USER_FACING_GDD_WORKSPACE`
- 현재 내용: v9.1 병합 상태까지 기록
- v9.3 상태: `POST_MERGE_UPDATE_REQUIRED`
- 병합 전 쓰기: 금지
- GitHub에 없는 사용자 편집: `PROPOSED_SHEET_CHANGE`

## 현재 보호 결정

- 프로젝트 코어를 증거 없이 재개방하지 않음
- 입력 실패와 주문 설계 실패 분리
- 신규·미숙·중요 글자는 직접 작성
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 첫 완주 상한 60분
- 필드 SD + 대화 반신 + 별도 고정 3/4 전투장
- 메인 소환수 장기 방향이 초기 Slice를 팽창시키지 않음
- Art Bible·Asset Specification 전 대량 자산 제작 금지
- 실행 프로필 전환 전 Godot 구현·Codex Build 금지
- 사용자 검토 없는 PR 병합 금지

## 다음 작업

1. Base v9.3 운영 정합화 Draft PR 검증
2. `ART-STYLE-01`
3. `ART-BIBLE-01`
4. `ASSET-SPEC-01`
5. `AUDIO-DIRECTION-01`
6. `PLATFORM-INPUT-01`
7. 실행 프로필 전환 재검토

실제 런타임·PC·모바일·접근성·성능·사람 검증은 모두 `NOT_RUN`이다.
