# GRIMOIRE 시작 지점

> 새 사용자·GPT·Codex·작업자가 과거 대화 없이 현재 상태, 확정 결정, 검토 중 후보와 다음 게이트를 복원하는 첫 화면이다.

## 1. 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 저장소 | `alsdmlals4-eng/GRIMOIRE-` |
| 1차 플랫폼 | `PC` |
| 후속 플랫폼 | `Mobile` |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Gate 1 | `APPROVED` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| 기획 완료 | `false` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| 다음 제품 차단 게이트 | `PLANNING-CONTENT-01` |
| Art Style | `BLOCKED_BY_PLANNING_COMPLETE` |

## 2. 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md`
5. `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
6. `docs/planning/DECISION_LOG.md`
7. 질문 주제의 단일 책임 원본
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`
10. `docs/DOCUMENTATION_MAP.md`
11. `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
12. `skills/PROJECT_BASE_ADAPTER.json`
13. `skills/PROJECT_SKILL_SNAPSHOT.json`

질문 전에는 확정 결정과 검토 중 후보를 구분한다. `CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED`는 기억 확인 목적으로 다시 묻지 않는다.

## 3. 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

- 의미를 가진 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 변형
- 즉각적이고 설명 가능한 세계 변화
- 입력 실패와 주문 설계 실패 분리

## 4. 승인된 Vertical Slice

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
- 문제마다 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지

## 5. 승인된 표현·소환수

```text
필드 = 가로형 고정·장면 기반 3/4 + 3.5~4등신 SD
대화 = 같은 장소 배경 위 반신 일러스트
전투 = 별도 고정 3/4 전술 전투장
작성 = 현재 화면 감속·암전 + 작성 오버레이
결과 = 환경 변화를 반영한 필드 복귀
```

- 메인 동반 정령: Slice 초기 형상 1개
- 전투 보조 소환수: Slice 수호 또는 견제 1체
- 장기 4단계 성장·이전 형상 선택·탑승은 후행

## 6. 현재 검토 중인 기획

책임 문서:

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

상태: `DESIGN_SPEC_FOR_USER_REVIEW / NOT_YET_CANON`

권장 후보:

- `흐름 / 집중 / 분산`
- 일반 가정 출신 장학생 신입생의 성장선
- 정석 중심 동급생과의 경쟁·협력
- 빛실 장막 축제 문제
- 생태 온실·마력 관개 수로 현장 문제
- 수호형 보조 소환수
- PC 마우스·펜·키보드 복구 입력
- 목표 46분·콘텐츠 상한 53분·하드 상한 60분

사용자 검토 전 최종 룬·세계관 고유명·런타임 데이터·구현 요구사항으로 확정하지 않는다.

## 7. 현재 작업 순서

```text
PLANNING-CONTENT-01
→ PLANNING-PLATFORM-01
→ PLANNING-SCOPE-01
→ PLANNING-REVIEW-01
→ 사용자 기획 완료 승인
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 마지막에 구현
```

## 8. 플랫폼 방향

```text
PC Vertical Slice·출시
→ 공통 규칙·콘텐츠·데이터 계약 안정화
→ 모바일 입력·레이아웃·접근성·성능 적응
→ 모바일 실기기 검증
```

기존 Android 터치 연구는 참고 자료이며 PC·모바일 런타임 증거가 아니다. Gamepad는 현재 `DEFERRED / NOT_PROMISED`다.

## 9. 현재 금지

- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 생성
- 기획 완료 전 Art Style 최종 확정과 대량 자산 제작
- 검토 중 후보를 확정 결정으로 표시
- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- 병합 전 Google Sheet 쓰기
- 런타임·PC·모바일·사람 검증 없는 완료 선언
- v6·v8 계약을 활성 실행 권한으로 복구
- 메인 소환수 2~4단계·탑승을 초기 Slice에 추가
