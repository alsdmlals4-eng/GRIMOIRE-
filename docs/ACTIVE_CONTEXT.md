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
visual_situation_board_workflow: APPROVED_PROJECT_WORK_PRINCIPLE
grimoire_visual_board: REWORK_REQUIRED_USER_REVIEW_REQUIRED
previous_situation_screen_spec: SUPPORTING_TECHNICAL_APPENDIX_ONLY
previous_generated_visuals: REJECTED_NOT_AUTHORITY
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

제품 코드·Scene·Resource·게임 데이터·실제 런타임 자산은 아직 없다.

## 질문 전 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31T.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ docs/workflows/PROJECT_VISUAL_SITUATION_SCREEN_BOARD_WORK_ORDER.md
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
→ docs/planning/VISUAL_SITUATION_BOARD_STATE.json
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

## 벤치마킹·정본 동기화

- `GM-BENCHMARK-FIRST-01`: 새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위 맞춤 벤치마킹 후 설계.
- `GM-CANON-SYNC-01`: 주요 승인 변경은 같은 Decision ID로 GitHub 권위 문서·계획 데이터와 Google Sheet에 즉시 반영.
- working branch 동기화와 main 동기화를 구분.
- 승인 기획 번들 `GR-SYNC-20260731-04`는 working branch·Sheet 재조회 완료, main은 PR #22 병합 대기.

## 비주얼 중심 상황 화면 작업 원칙

결정 ID: `GM-VISUAL-SITUATION-BOARD-WORKFLOW-01`

상태: `APPROVED_PROJECT_WORK_PRINCIPLE`

사용자에게 먼저 보여 줄 산출물은 기술 감사 문서가 아니라 **“이 프로젝트가 구현되면 실제로 어떻게 보이는가”**를 보여 주는 비주얼 중심 화면 보드다.

```text
프로젝트 핵심 경험
→ 프로젝트 비주얼 기준 보드
→ 필수 기준 화면 4종 보드
→ 핵심 상황별 화면 시퀀스 보드
→ 전체 화면 전환도
→ 구현 명세 부록
→ 적대적 검토
```

필수 화면:

1. 메인 화면.
2. 전투 또는 핵심 플레이 화면.
3. 인벤토리 또는 자원 관리 대응 화면.
4. 결과 화면.

모든 화면·요소는 `CURRENT / INFERRED / PROPOSED / PLACEHOLDER`를 구분한다.

금지:

- 기술 구조가 화면보다 앞에 오는 구성.
- 한 장 과밀 대시보드.
- UI가 읽히지 않는 작은 화면.
- 기존 프로젝트 이미지 확인 없이 generic 장르 UI 생성.
- CURRENT와 PROPOSED 혼합.

책임 원본:

- `docs/workflows/PROJECT_VISUAL_SITUATION_SCREEN_BOARD_WORK_ORDER.md`.
- `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31T.md`.
- `docs/planning/VISUAL_SITUATION_BOARD_STATE.json`.

## 이전 기술 명세의 현재 역할

- `GM-SITUATION-SCREEN-WORKFLOW-01`: `SUPERSEDED_PRIMARY_OUTPUT_ROLE / SUPPORTING_APPENDIX_ONLY`.
- `GM-SITUATION-SCREEN-SPEC-01`: `SUPPORTING_TECHNICAL_APPENDIX_ONLY`.

기존 P0 10개 A~T Godot 명세는 폐기하지 않는다. 다만 다음 용도로만 사용한다.

- PART D 기술 부록.
- Scene·Node·Resource·Signal·Save·Test 연결.
- 향후 Codex Plan 입력.

이전 기술 명세는 사용자 1차 검토용 비주얼 산출물이 아니며 구현 권한도 아니다.

## GRIMOIRE 비주얼 화면 보드 재작업

결정 ID: `GR-VISUAL-SITUATION-BOARD-01`

상태:

```text
REWORK_REQUIRED
USER_REVIEW_REQUIRED
CORRECTED_IMAGE_GENERATION = NOT_STARTED
```

이전 생성 결과 판정:

```text
generic dark fantasy 조사·인벤토리형 이미지 = REJECTED_NOT_AUTHORITY
기술 대시보드 중심 이미지 = REJECTED_AS_PRIMARY_ARTIFACT
```

재작업에서 반드시 보존할 기존 요소:

- 마법학교 생활·수업·시험·축제·현장실습.
- 장면 기반 가로 16:9 3/4 필드.
- 필드 SD 주인공·NPC·동반 정령.
- 같은 장소 배경 위 대화용 반신 일러스트.
- 직접 마법 글자 작성 Overlay.
- 별도 고정 3/4 전술 전투장.
- 작은 늑대형 메인 동반 정령 초기 형상.
- 기존 정령수 성장 이미지는 장기 방향 참고이며 Slice 런타임을 확장하지 않음.
- 결과 후 원래 Field 환경 변화 복귀.
- 마도서 과정 기록.

재작업 보드:

1. `BOARD-GR-A` 프로젝트 비주얼 기준.
2. `BOARD-GR-B1` 필드·대화.
3. `BOARD-GR-B2` 직접 작성·전술 전투.
4. `BOARD-GR-B3` 마도서·결과.
5. `BOARD-GR-C1` 수업·연습 시퀀스.
6. `BOARD-GR-C2` 시험·축제 시퀀스.
7. `BOARD-GR-C3` 현장실습·귀환 시퀀스.
8. `BOARD-GR-D` 전체 전환도·최소 기술 부록.

각 보드는 화면과 UI가 읽히는 크기로 분리하고 근거 태그를 표시한다.

## 적대적 검토 필수 항목

다음이 모두 PASS여야 완료다.

- 화면 중심 산출물 유지.
- 필수 화면 4종 가시성.
- 핵심 상황 시퀀스 명확성.
- CURRENT/PROPOSED 구분.
- 프로젝트 고유성 반영.
- 판독성·가독성.
- 비교·재사용 가능성.

FAIL이 있으면 보드를 분리·확대·수정한 뒤 재판정한다.

## ART-STYLE-01

```text
STANDARD_BENCHMARK_COMPLETE
USER_DECISION_REQUIRED
IMAGE_GENERATION = NOT_STARTED
```

후보 A `Soft Storybook Cel 2D Hybrid`는 권장이지만 미승인이다. B와 C도 정본이 아니다. 기존 이미지 기반 보드 제작은 새 그림체 승인으로 간주하지 않는다.

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

비주얼 화면 보드 검토는 이 경로를 보조하며 Art Gate를 우회하지 않는다.

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
- 이전 잘못된 이미지를 정본·승인 근거로 사용 금지.
- 전환·Save·인식·전투를 실제 실행하지 않은 상태에서 완료 주장 금지.

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
CORRECTED_VISUAL_BOARD_USER_REVIEW = NOT_GRANTED
```
