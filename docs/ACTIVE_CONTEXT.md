# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning_complete: true
implementation: NOT_STARTED
codex: BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
next_product_gate: ART-STYLE-01
art_style_status: USER_DECISION_REQUIRED
situation_screen_workflow: APPROVED_PROJECT_WORK_PRINCIPLE
situation_screen_spec: USER_REVIEW_REQUIRED
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

제품 코드·Scene·Resource·게임 데이터·실제 자산은 아직 없다.

## 질문 전 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31S.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
→ docs/planning/SITUATION_SCREEN_SPEC_STATE.json
```

확정된 결정을 기억 확인 목적으로 다시 묻지 않는다.

## 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

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

- 목표 46분, 콘텐츠 상한 53분, 하드 상한 60분.
- 글자 `흐름 / 집중 / 분산`.
- 자유일정 `휴식 / 준비 / 교류`.
- Situation Challenge마다 유효 해법 2개 이상.
- 정상 완주 필수 성공 작성 7회, 복구 포함 목표 상한 10회.
- 마도서는 상황·의도·결과·부작용·발견·플레이어 명명을 기록하며 자동 주문 Stock이 아니다.

## 승인된 표현 구조

```text
필드 = 가로형 16:9 고정·장면 기반 3/4 + 3.5~4등신 SD
대화 = 같은 장소 배경 위 반신 일러스트
전투 = 별도 고정 3/4 전술 전투장 + 필드 SD 재사용
작성 = 현재 World 감속·암전 + 작성 Overlay
결과 = 원래 Field 환경 변화로 복귀
```

실제 그림체·팔레트·선·명암·재질·내부 해상도는 아직 미승인이다.

## 벤치마킹 선행 원칙

결정 ID: `GM-BENCHMARK-FIRST-01`

새 시스템, 핵심 규칙, 콘텐츠 구조, UX 흐름을 설계하거나 의미 있게 변경할 때 범위에 맞는 벤치마킹을 먼저 수행한다.

책임 원본: `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 기획 정본 즉시 동기화

결정 ID: `GM-CANON-SYNC-01`

```text
Decision ID
→ GitHub 권위 문서·계획 데이터
→ authority commit
→ 연결된 Google Sheet
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

승인 기획 번들 `GR-SYNC-20260731-04`는 working branch와 Sheet 재조회까지 완료됐고 main은 PR #22 병합 대기다.

## 프로젝트 상황 화면 작업 원칙

결정 ID: `GM-SITUATION-SCREEN-WORKFLOW-01`

상태: `APPROVED_PROJECT_WORK_PRINCIPLE`

필수 기준 화면 4종을 먼저 조사한 뒤, 실제 플레이 상황을 P0~P3로 도출하고 P0를 A~T 형식으로 상세 설계한다.

필수 기준 화면:

1. Main·시작.
2. 전투 또는 핵심 플레이.
3. 인벤토리 또는 보유 지식·자원 대응.
4. 결과.

책임 원본:

- `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md`

## GRIMOIRE 상황별 화면·상태 구현 설계

결정 ID: `GM-SITUATION-SCREEN-SPEC-01`

상태: `USER_REVIEW_REQUIRED / TECHNICAL_DESIGN_ONLY`

### 프로젝트 감사

```text
project.godot = NOT_FOUND
*.tscn = NOT_FOUND
*.gd = NOT_FOUND
*.tres = NOT_FOUND
actual implementation = NOT_STARTED
```

### 권장 기술 구조

```text
Persistent ApplicationRoot
├─ GameFlowController
├─ SessionStateOwner
├─ WorldHost
│  └─ FieldScene | BattleScene
├─ UIHost
│  └─ Main | Dialogue | Schedule | Spell | Result | Grimoire | Pause
├─ TransitionLayer
└─ AudioDirector
```

- Field와 Battle은 별도 World Scene.
- 대화·일정·작성·결과·마도서는 CanvasLayer Overlay.
- `FieldReturnSnapshot`과 Result Tag로 Battle→Field 복귀.
- 최소 Autoload 후보는 `ContentRegistry / SaveService / SettingsService`.
- UI는 인식·문법·비용·피해·보상을 계산하지 않음.

### P0 상황

1. `SIT-GR-001 최초 실행·세이브 선택`.
2. `SIT-GR-002 학교 장면 진입·이상 징후 관찰`.
3. `SIT-GR-003 교수·동급생·동반 정령 대화`.
4. `SIT-GR-004 자유일정 선택`.
5. `SIT-GR-005 Situation Challenge 관찰·준비`.
6. `SIT-GR-006 직접 작성·인식·조합·Commit`.
7. `SIT-GR-007 전술 전투·수호 소환`.
8. `SIT-GR-008 결과·원인·보상 복기`.
9. `SIT-GR-009 원래 필드 복귀·환경 변화`.
10. `SIT-GR-010 귀환·마도서 기록·Checkpoint`.

책임 원본:

- `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md`
- `docs/superpowers/specs/grimoire-situations/P0_01_ENTRY_FIELD_DIALOGUE.md`
- `docs/superpowers/specs/grimoire-situations/P0_02_SCHEDULE_SPELL_BATTLE.md`
- `docs/superpowers/specs/grimoire-situations/P0_03_RESULT_RETURN_GRIMOIRE.md`
- `docs/superpowers/specs/grimoire-situations/SITUATION_BOARD_AND_BACKLOG.md`
- `docs/planning/SITUATION_SCREEN_SPEC_STATE.json`

이 명세는 사용자 검토 대상이며 구현 권한이 아니다.

## ART-STYLE-01

상태:

```text
STANDARD_BENCHMARK_COMPLETE
USER_DECISION_REQUIRED
IMAGE_GENERATION = NOT_STARTED
```

후보 A `Soft Storybook Cel 2D Hybrid`가 권장이지만 미승인이다. B와 C도 정본이 아니다.

## 현재 제품 경로

```text
기획 완료
→ ART-STYLE-01 사용자 결정
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 구현
```

상황 화면 명세 검토는 이 경로를 보조하며 Art Gate를 우회하지 않는다.

## Base·운영 정합화 위험

- AGENTS·Registry 기준 Base는 v9.3.
- `docs/BASE_RULES_VERSION.md`는 과거 v8 값.
- `skills/PROJECT_BASE_ADAPTER.json` 본문은 v9.1·과거 Sheet conflict 값을 포함.
- Adapter·Snapshot 정합화는 Issue #21의 별도 운영 변경.

## 보호·검증 경계

- 기본 브랜치 직접 수정 금지.
- 사용자 검토 없는 PR 병합 금지.
- Codex·Godot 구현 금지.
- Art Bible·Asset Spec 전 대량 자산 제작 금지.
- 전환·Save·인식·전투를 실제 실행하지 않은 상태에서 완료 주장 금지.

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
SITUATION_SCREEN_SPEC_USER_REVIEW = NOT_GRANTED
```
