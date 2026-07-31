# GRIMOIRE 현재 확정 결정 스냅샷

## 1. 문서 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
baseline_date: 2026-07-31
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

이 문서는 승인된 현재 결정과 미실행 영역을 빠르게 복원하기 위한 스냅샷이다.

## 2. 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31U.md
→ docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 주제별 책임 원본
```

확정된 결정은 기억 확인을 위해 다시 묻지 않는다.

## 3. 프로젝트 바인딩

- 1차 플랫폼: `PC`.
- 후속 플랫폼: `Mobile`.
- 엔진 기준 후보: `Godot 4.7.1 stable`.
- Google Sheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.
- Godot 프로젝트: `NOT_STARTED`.
- 실제 `project.godot`, `.tscn`, `.gd`, `.tres`: `NOT_FOUND`.
- Codex: `NOT_AUTHORIZED`.

## 4. 플레이어 약속과 핵심 경험

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

1. 의미를 가진 마법 글자.
2. `메인 글자 1개 + 보조 글자 0개 이상`.
3. 신규·미숙·중요 글자의 직접 작성.
4. 상황·목표·위험에 따른 주문 변형 판단.
5. 즉각적이고 설명 가능한 세계 변화.
6. 입력 실패와 주문 설계 실패 분리.
7. 학습→증명→표현→응용→발견·기록 순환.

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

- 목표 중앙값 `45~50분`.
- 콘텐츠 상한 `53분`.
- 하드 상한 `60분`.
- 공통 `Situation Challenge`.
- 문제마다 유효 해법 2개 이상.
- 자유일정 `휴식 / 준비 / 교류` 3회.

## 6. 승인된 마법·인물·콘텐츠

### 마법 문법

- 메인: `흐름`.
- 보조: `집중 / 분산`.
- 흐름: 방향·경로 변경.
- 집중: 좁고 강한 정밀 흐름, 과압·손상 위험.
- 분산: 넓고 안정적인 흐름, 출력·속도 저하.
- Slice에서 다중 보조·순서 의존·완성 주문 자동 Stock 제외.

### 인물

- 주인공: 일반 가정 출신 장학생 신입생.
- 성장: 정답 집착 → 책임 있는 설계자.
- 교수: 의미·조건·책임을 가르치며 정답을 대신 말하지 않음.
- 동급생: 정석·속도 중심 경쟁자이자 협력자.
- 메인 동반 정령: 작은 늑대형 원소 정령수 초기 형상.
- 보조 소환수: 수호형 1체 우선.

### Situation Challenge

| 세션 | 문제 |
|---|---|
| 수업 | 불안정한 마력 수로 |
| 시험 | 취약한 부유 수정구 이송 |
| 축제 | 빛실 장막 복구 |
| 현장 전투 | 관개 압력으로 폭주한 정령 |
| 현장 환경 | 마력 관개관 누출 |

## 7. 승인된 입력·마도서

- PC: 마우스 드래그·펜 보조·키보드 복구.
- Gamepad: `DEFERRED / NOT_PROMISED`.
- 정상 완주 필수 성공 작성 7회.
- 안내형 복구 포함 목표 상한 10회.
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용.
- 명시적 시전 전 Undo·취소·재작성 자원 미소모.
- 마도서: 상황·의도·결과·부작용·발견·플레이어 명명 기록.
- 자동 최적 추천·기록 클릭 자동 시전 금지.

## 8. ART-STYLE-01 — 승인

```yaml
decision_id: ART-STYLE-01
status: APPROVED
selected_candidate: A_MODIFIED
selected_name: Soft Storybook Cel 2D Hybrid
approved_at: 2026-07-31T21:58:00+09:00
next_product_gate: ART-BIBLE-01
```

사용자가 제공한 이미지의 구성을 GRIMOIRE 아트·화면 기준으로 승인하고 수정하지 않도록 잠갔다.

### 승인 기준 이미지

- Library 경로: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`.
- File ID: `file_0000000061bc81fa93d8b1b30d553943`.
- 크기: `662 × 455 px`.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- Manifest: `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`.
- 승인 문서: `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md`.

해시가 다른 파일은 같은 승인 기준판이 아니다.

### 승인된 표현 구조

```text
가로형 16:9
+ 장면 기반 고정 3/4 학교 필드
+ 필드 SD 주인공·NPC·동반 정령
+ 같은 장소 배경 위 대화 반신
+ 탐색·비전투 직접 글자 작성 Overlay
+ 별도 고정 3/4 전술 전투장
+ 전투 중 작성 Overlay
+ 결과 후 원래 장면 복귀
```

### 승인된 시각 언어

- 밝은 마법학교와 현장 배경을 연결하는 부드러운 일러스트 계열 배경.
- SD와 반신이 같은 인물로 보이는 애니메이션 셀 계열 캐릭터 언어.
- 네이비·금색 판타지 학교 UI 프레임.
- 파랑 계열의 고대비 글자·마법 강조.
- 수업·시험·축제·현장실습을 같은 배경 언어의 상태 변형으로 표현.
- 주인공·동반 정령·소환수의 얼굴·색·의상·실루엣 일관성 유지.

### 원본 잠금

승인 이미지 자체의 다음 작업은 금지한다.

- 수정·재생성·리터치.
- 크롭 또는 업스케일 파일로 원본 대체.
- 텍스트·패널·캐릭터·배경·UI 교체.
- 색상 변경.

후속 산출물은 원본을 변경하지 않고 별도 파일로 제작한다. 변경은 사용자의 명시적 재승인만 허용한다.

## 9. GR-VISUAL-SITUATION-BOARD-01

```yaml
status: APPROVED_LOCKED_REFERENCE_BOARD
role: VISUAL_DIRECTION_AND_SCREEN_COMPOSITION_AUTHORITY
runtime_asset: false
implementation_authority: NONE
```

이 이미지는 최종 런타임 Asset이 아니라 다음의 권위 기준이다.

- 프로젝트가 실제로 보일 방향.
- 필드 SD·대화 반신·직접 작성·별도 전투·결과 복귀의 관계.
- 화면별 정보 우선순위와 UI 배치 방향.
- 학교·마법·정령 동반자 경험의 시각 연결.

## 10. 비주얼 중심 화면 보드 작업 원칙

결정 ID: `GM-VISUAL-SITUATION-BOARD-WORKFLOW-01`.

- 사용자 1차 검토 산출물은 화면 중심 보드.
- 기술 감사·Scene·Node·Signal·데이터·테스트는 별도 부록.
- 필수 화면: 메인, 핵심 플레이/전투, 자원 관리 대응, 결과.
- `CURRENT / INFERRED / PROPOSED / PLACEHOLDER` 구분.
- generic 장르 UI로 대체 금지.
- 승인 원본을 미래 보드 안에서 편집하거나 재조합하지 않음.

기존 A~T 상황별 Godot 명세는 `SUPPORTING_TECHNICAL_APPENDIX_ONLY`로 유지한다.

## 11. 다음 제품 Gate

```text
ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ 기술 계획·검수
→ 구현
```

`ART-BIBLE-01`에서는 승인 이미지를 수정하지 않고 다음을 추출한다.

- 선 굵기·선 색·셀 명암.
- SD·반신 얼굴·의상·인체 비율.
- 학교·시험·축제·현장 색 스크립트.
- 배경 질감과 플레이 영역 대비.
- UI 패널·버튼·아이콘·폰트 계층.
- 글자·집중·분산·위험 FX.
- 16:9 Safe Frame과 후속 Mobile 적응.

## 12. 게이트 상태

| 게이트 | 상태 |
|---|---|
| 기획 완료 | `TRUE` |
| `ART-STYLE-01` | `APPROVED_A_MODIFIED` |
| 승인 이미지 | `LOCKED_NO_EDIT` |
| `GR-VISUAL-SITUATION-BOARD-01` | `APPROVED_LOCKED_REFERENCE_BOARD` |
| `ART-BIBLE-01` | `NEXT_PRODUCT_GATE` |
| `ASSET-SPEC-01` | `BLOCKED_BY_ART_BIBLE` |
| `AUDIO-DIRECTION-01` | `PENDING` |
| Codex Plan | `BLOCKED_BY_ART_BIBLE_ASSET_SPEC_AND_INTEGRATED_REVIEW` |
| Godot 구현 | `NOT_STARTED` |

## 13. 검증 경계

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
ART_STYLE_USER_APPROVAL = GRANTED
LOCKED_REFERENCE_INTEGRITY = SHA256_RECORDED
GODOT_IMPLEMENTATION = NOT_STARTED
```
