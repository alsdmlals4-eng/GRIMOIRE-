# GRIMOIRE 시작 지점

> 새 사용자·GPT·Codex·작업자가 현재 상태, 확정 결정과 다음 작업을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Gate 1 | `APPROVED` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| Vertical Slice 계약 | `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT` |
| 적대적 검토 루프 02 | `PASS_WITH_CORRECTIONS` |
| 시각 표현 | `LANDSCAPE_HYBRID_2D_WITH_SEPARATE_TACTICAL_BATTLE_CONFIRMED` |
| 캐릭터 표현 | `SD_FIELD_HALF_BODY_DIALOGUE_CONFIRMED` |
| 메인 소환수 성장 | `FOUR_STAGE_FORM_SELECTION_AND_LONG_TERM_RIDING_CONFIRMED_DIRECTION` |
| 구현 | `NOT_STARTED` |
| Codex | `NOT_RUN` |
| 이미지·사운드 대량 제작 | `NOT_STARTED` |
| Google Sheet | `PROJECT_SHEET_CONFIGURED` |
| Workbook 역할 | `USER_FACING_GDD_WORKSPACE` |
| 다음 차단 결정 | `ART-STYLE-01` |
| 기준 브랜치 | `main` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
3. `docs/planning/DECISION_LOG.md`
4. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27S.md`
5. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
6. `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
7. `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
8. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
9. `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`
10. `docs/DEVELOPMENT_GATES.md`
11. `docs/DESIGN_DOCUMENT_REGISTRY.json`
12. `docs/ASSET_LICENSE_LEDGER.md`
13. `skills/SKILL_REGISTRY.json`
14. `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
15. `docs/DOCUMENTATION_MAP.md`

## 재질문 방지

새 질문을 하기 전에 `CURRENT_CONFIRMED_DECISIONS.md`에서 상태를 확인한다.

질문 가능한 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자 명시적 재개방

이미 `CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED`인 결정을 기억 확인 목적으로 다시 선택하게 하지 않는다.

## 승인된 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

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

## 승인된 화면·캐릭터·전투

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

## 승인된 소환수 방향

```text
메인 동반 소환수
= 원소·정령 중심의 고정 동반자
= 장기 4단계 성장
= 해금된 이전 형상 선택 가능
= 장기 탑승 기능

전투 보조 소환수
= 전투에서 호출하는 원소 정령
= Vertical Slice는 수호 또는 견제 1체
```

범위 보호:

- Vertical Slice는 메인 동반 초기 형상 1개만 런타임 필수
- 메인 2~4단계·형상 선택 UI·탑승은 후행
- 전투 소환수 4역할 전체·성장·탑승은 미확정

## GDD Google Sheets 규칙

- Sheet는 독립 정본이 아니라 `USER_FACING_GDD_WORKSPACE`다.
- GitHub에 없는 편집은 `PROPOSED_SHEET_CHANGE`로 보존한다.
- 확정 결정·임시 값·미검증 상태를 같은 값으로 취급하지 않는다.
- 승인 후 GitHub와 Sheet를 모두 재조회한 경우에만 `SYNCED`로 판정한다.
- `05_GDD_요약`, `15_조작_게임규칙`, `51_미니게임`, `52_글쓰기_서사`를 포함한 검증 탭은 `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`가 소유한다.

## 이미지 작업 규칙

- 이미지 관련 선택은 가능한 경우 인게임 예상 이미지로 제시
- 생성 이미지는 자동 최종 자산·시스템 확정이 아님
- 사용자 승인 두 번째 인게임 구성 이미지는 `USER_APPROVED_VISUAL_REFERENCE`
- 생성 실패 시 같은 요청 재입력을 기본 해결책으로 사용하지 않고 기존 브리프를 단순화해 재시도

## 현재 작업 순서

```text
ART-STYLE-01
그림체 후보를 동일한 인게임 구성으로 이미지 비교
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 사용자 승인 후 자산 작업
→ GM-VS-PROFILE-01 재검토
```

## 현재 금지

- Art Bible·Asset Specification 전 대량 이미지·사운드 제작
- 메인 소환수 4단계 전체를 Vertical Slice 범위에 추가
- 전투 소환수 4역할 전체를 승인 없이 시스템 확정
- 별도 CORE_POC 재도입
- `VERTICAL_SLICE_FULL_PROFILE` 자동 전환
- Godot 구현·Codex 실행
- 사용자 명시적 요청과 검증 없는 PR 병합

## 다음 결정

`ART-STYLE-01`

승인된 필드 SD·대화 반신·별도 전투장·원소 정령 소환수 구성을 동일하게 사용하여 그림체 후보를 이미지로 비교한다.
