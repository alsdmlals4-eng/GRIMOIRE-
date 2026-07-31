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
codex: BLOCKED_BY_ART_BIBLE_ASSET_SPEC_AND_INTEGRATED_REVIEW
next_product_gate: ART-BIBLE-01
art_style_status: APPROVED_A_MODIFIED
visual_board_status: APPROVED_LOCKED_REFERENCE_BOARD
locked_reference_edit: PROHIBITED
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

제품 코드·Scene·Resource·게임 데이터·런타임 Asset은 아직 없다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31U.md
→ docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ docs/planning/ART_STYLE_01_STATE.json
→ docs/planning/VISUAL_SITUATION_BOARD_STATE.json
```

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

## ART-STYLE-01 승인

```yaml
decision_id: ART-STYLE-01
status: APPROVED
selected_candidate: A_MODIFIED
selected_name: Soft Storybook Cel 2D Hybrid
approved_at: 2026-07-31T21:58:00+09:00
next_gate: ART-BIBLE-01
```

사용자가 제공한 화면 보드를 GRIMOIRE 아트·화면 구성 기준으로 승인했으며, 원본 이미지는 수정하지 않는다.

### 잠긴 기준 이미지

- Library: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`.
- File ID: `file_0000000061bc81fa93d8b1b30d553943`.
- 크기: `662 × 455 px`.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- Manifest: `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`.
- 승인 정본: `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md`.

원본 이미지의 수정·재생성·리터치·크롭 대체·텍스트 교체·패널 재배치·색 변경은 금지한다. 후속 작업은 별도 파일로만 제작한다.

## 승인된 화면·시각 구조

```text
가로형 16:9
+ 장면 기반 고정 3/4 학교 필드
+ 필드 SD 주인공·NPC·동반 정령
+ 같은 장소 배경 위 대화 반신
+ 탐색·비전투 직접 글자 작성 Overlay
+ 별도 고정 3/4 전술 전투장
+ 전투 중 글자 작성 Overlay
+ 결과 후 원래 장면 복귀
```

시각 기준:

- 밝은 마법학교·현장 배경.
- SD와 반신이 동일 인물로 보이는 캐릭터 키.
- 네이비·금색 UI 프레임.
- 파랑 계열 고대비 글자·마법 강조.
- 수업·시험·축제·현장실습 배경 상태 변형.
- 주인공·메인 정령·보조 소환수의 화면 간 일관성.

## GR-VISUAL-SITUATION-BOARD-01

```yaml
status: APPROVED_LOCKED_REFERENCE_BOARD
role: VISUAL_DIRECTION_AND_SCREEN_COMPOSITION_AUTHORITY
runtime_asset: false
implementation_authority: NONE
```

이 이미지는 최종 게임 Asset이 아니라 이후 화면·배경·캐릭터·UI·VFX를 맞추는 방향 기준이다.

이전 generic dark fantasy 조사·인벤토리형 이미지와 기술 대시보드형 이미지는 `REJECTED_NOT_AUTHORITY`를 유지한다.

## 비주얼 중심 화면 작업 원칙

결정 ID: `GM-VISUAL-SITUATION-BOARD-WORKFLOW-01`.

- 사용자에게 먼저 보여 주는 것은 실제 화면 중심 보드.
- 필수 화면: 메인, 핵심 플레이/전투, 자원 관리 대응, 결과.
- 기술 감사·Scene·Node·Signal·데이터·테스트는 별도 부록.
- `CURRENT / INFERRED / PROPOSED / PLACEHOLDER` 구분.
- generic 장르 UI 생성 금지.
- 잠긴 승인 이미지를 후속 보드에서 편집·재조합하지 않음.

기존 P0 10개 A~T Godot 명세는 `SUPPORTING_TECHNICAL_APPENDIX_ONLY`다.

## 다음 제품 Gate — ART-BIBLE-01

승인 이미지를 수정하지 않고 다음 규칙을 추출한다.

1. 필드 SD·대화 반신·전투 SD의 공통 얼굴·머리·의상·실루엣.
2. 선 굵기·선 색·셀 명암 단계.
3. 학교·시험·축제·현장 색 스크립트.
4. 배경 질감과 플레이 공간의 대비.
5. 네이비·금색 패널·버튼·아이콘·Font 계층.
6. 글자 획·집중·분산·위험 FX.
7. 동반 정령과 보조 소환수의 색·형태·FX 분리.
8. PC 16:9 Safe Frame과 후속 Mobile 적응.

실제 크기·파일 포맷·상태·변형은 `ASSET-SPEC-01`에서 확정한다.

## 현재 제품 경로

```text
ART-STYLE-01 APPROVED
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ 기술 계획·검수
→ 구현
```

## 보호·검증 경계

- 기본 브랜치 직접 수정 금지.
- 사용자 승인 없는 PR 병합 금지.
- Codex·Godot 구현 금지.
- Art Bible·Asset Spec 전 대량 Asset 제작 금지.
- 잠긴 승인 원본 이미지 수정 금지.
- 이미지의 예시 수치를 실제 런타임 규격으로 단정 금지.

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
ART_STYLE_USER_APPROVAL = GRANTED
LOCKED_REFERENCE_INTEGRITY = SHA256_RECORDED
GODOT_IMPLEMENTATION = NOT_STARTED
```
