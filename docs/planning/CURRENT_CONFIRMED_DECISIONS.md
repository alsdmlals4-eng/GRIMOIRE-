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
codex: BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
next_product_gate: ART-STYLE-01
art_style_status: BENCHMARK_COMPLETE_USER_DECISION_REQUIRED
visual_situation_board_workflow: APPROVED_PROJECT_WORK_PRINCIPLE
grimoire_visual_board: REWORK_REQUIRED_USER_REVIEW_REQUIRED
previous_situation_screen_spec: SUPPORTING_TECHNICAL_APPENDIX_ONLY
previous_generated_visuals: REJECTED_NOT_AUTHORITY
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

이 문서는 승인된 현재 결정, 미승인 Gate, 재작업 상태와 역할이 변경된 이전 산출물을 빠르게 구분한다.

## 2. 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31T.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ docs/workflows/PROJECT_VISUAL_SITUATION_SCREEN_BOARD_WORK_ORDER.md
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
→ docs/planning/VISUAL_SITUATION_BOARD_STATE.json
```

확정된 결정은 기억 확인 목적으로 다시 묻지 않는다. `USER_DECISION_REQUIRED`, `USER_REVIEW_REQUIRED`, `REWORK_REQUIRED`는 승인 상태가 아니다.

## 3. 프로젝트 바인딩

- 1차 플랫폼: `PC`.
- 후속 플랫폼: `Mobile`.
- 엔진 기준 후보: `Godot 4.7.1 stable`.
- Google Sheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.
- Godot 프로젝트: `NOT_STARTED`.
- 실제 `project.godot`, `.tscn`, `.gd`, `.tres`: `NOT_FOUND`.
- Codex: `NOT_AUTHORIZED`.

## 4. 플레이어 약속과 코어

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
- 별도 `CORE_POC` 재도입 금지.

## 6. 승인된 기획

### 마법 문법

- 메인: `흐름`.
- 보조: `집중 / 분산`.
- 흐름: 방향·경로 변경.
- 집중: 좁고 강한 정밀 흐름, 과압·손상 위험.
- 분산: 넓고 안정적인 흐름, 출력·속도 저하.
- 다중 보조·순서 의존·완성 주문 자동 Stock은 Slice 제외.

### 인물·콘텐츠

- 주인공: 일반 가정 출신 장학생 신입생.
- 성장: 정답 집착 → 책임 있는 설계자.
- 교수: 의미·조건·책임을 가르치며 정답을 대신 말하지 않음.
- 동급생: 정석·속도 중심 경쟁자이자 협력자.
- 메인 동반 정령: 작은 늑대형 원소 정령수 초기 형상.
- 보조 소환수: 수호형 1체 우선.

| 세션 | 문제 |
|---|---|
| 수업 | 불안정한 마력 수로 |
| 시험 | 취약한 부유 수정구 이송 |
| 축제 | 빛실 장막 복구 |
| 현장 전투 | 관개 압력으로 폭주한 정령 |
| 현장 환경 | 마력 관개관 누출 |

### 입력·마도서

- PC: 마우스 드래그·펜 보조·키보드 복구.
- Gamepad: `DEFERRED / NOT_PROMISED`.
- 정상 완주 필수 성공 작성 7회.
- 안내형 복구 포함 목표 상한 10회.
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용.
- 명시적 시전 전 Undo·취소·재작성 자원 미소모.
- 마도서: 상황·의도·결과·부작용·발견·플레이어 명명 기록.
- 자동 최적 추천·기록 클릭 자동 시전 금지.

## 7. 승인된 표현 구조

- 가로형 `16:9`.
- 학교·자유일정·탐색: 고정·장면 기반 3/4 필드.
- 필드 캐릭터: 3.5~4등신 SD.
- 대화: 같은 장소 배경 위 반신 일러스트.
- 전투: 별도 고정 3/4 전술 전투장.
- 전투 SD: 필드 비율·기본 골격 재사용.
- 작성: 현재 화면 감속·암전 + Overlay.
- 결과: 원래 필드 환경 변화로 복귀.

실제 그림체·색·선·명암·재질·내부 해상도는 아직 확정되지 않았다.

## 8. 승인된 작업 원칙

### GM-BENCHMARK-FIRST-01

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위 맞춤 벤치마킹 후 설계한다.

### GM-CANON-SYNC-01

주요 승인 변경은 같은 Decision ID로 GitHub 권위 문서·계획 데이터와 Google Sheet에 즉시 반영하고 working branch와 main 상태를 구분한다.

### GM-VISUAL-SITUATION-BOARD-WORKFLOW-01

프로젝트별 상황 화면 산출물은 기술 보고서가 아니라 **구현 후 실제 모습을 보여 주는 비주얼 중심 화면 보드**를 1차 산출물로 한다.

```text
프로젝트 핵심 경험
→ 비주얼 기준 보드
→ 필수 화면 4종 보드
→ 핵심 상황별 화면 시퀀스
→ 전체 화면 전환도
→ 구현 명세 부록
→ 적대적 검토
```

필수 규칙:

- `SCREEN-01` 메인.
- `SCREEN-02` 전투 또는 핵심 플레이.
- `SCREEN-03` 인벤토리 또는 자원 관리 대응.
- `SCREEN-04` 결과.
- 화면·요소마다 `CURRENT / INFERRED / PROPOSED / PLACEHOLDER` 구분.
- 기존 이미지·캐릭터·마스코트·구도 우선 확인.
- 화면을 읽을 수 있도록 여러 장으로 분리.
- 기술 구조는 PART D 부록으로 후행.
- 6단계 적대적 검토에서 FAIL이 남으면 완료 금지.

책임 원본:

- `docs/workflows/PROJECT_VISUAL_SITUATION_SCREEN_BOARD_WORK_ORDER.md`.
- `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31T.md`.
- `docs/planning/VISUAL_SITUATION_BOARD_STATE.json`.

## 9. 이전 상황 명세의 현재 역할

### GM-SITUATION-SCREEN-WORKFLOW-01

```text
SUPERSEDED_PRIMARY_OUTPUT_ROLE
SUPPORTING_TECHNICAL_APPENDIX_ONLY
```

### GM-SITUATION-SCREEN-SPEC-01

기존 P0 10개 A~T Godot 구현 명세는 폐기하지 않고 다음 용도로만 유지한다.

- PART D 기술 부록.
- Scene·Node·Resource·Signal·Save·Test 연결.
- 향후 Codex Plan 입력.

기존 기술 명세는 사용자에게 먼저 보여 줄 비주얼 보드가 아니며 구현 권한도 아니다.

## 10. GRIMOIRE 비주얼 화면 보드 — 재작업 상태

```yaml
decision_id: GR-VISUAL-SITUATION-BOARD-01
status: REWORK_REQUIRED_USER_REVIEW_REQUIRED
previous_generated_visuals: REJECTED_NOT_AUTHORITY
image_generation_for_corrected_board: NOT_STARTED
```

재작업에서 보호할 기존 요소:

- 마법학교 생활·수업·시험·축제·현장실습.
- 장면 기반 가로 16:9 3/4 필드.
- 필드 SD 캐릭터.
- 같은 장소 배경 위 반신 대화.
- 직접 마법 글자 작성 Overlay.
- 별도 고정 3/4 전술 전투장.
- 작은 늑대형 메인 동반 정령 초기 형상.
- 결과 후 원래 필드 환경 변화 복귀.
- 마도서 과정 기록.

재작업 보드:

1. `BOARD-GR-A` 비주얼 기준.
2. `BOARD-GR-B1` 필드·대화.
3. `BOARD-GR-B2` 직접 작성·전투.
4. `BOARD-GR-B3` 마도서·결과.
5. `BOARD-GR-C1` 수업·연습 시퀀스.
6. `BOARD-GR-C2` 시험·축제 시퀀스.
7. `BOARD-GR-C3` 현장실습·귀환 시퀀스.
8. `BOARD-GR-D` 전환도·최소 기술 부록.

이전 일반 다크 판타지 조사·인벤토리형 이미지와 기술 대시보드형 이미지는 프로젝트 비주얼 정본·UI 승인 근거로 사용하지 않는다.

## 11. ART-STYLE-01 — 미승인 Gate

```yaml
benchmark_status: STANDARD_BENCHMARK_COMPLETE
decision_status: USER_DECISION_REQUIRED
asset_generation: NOT_STARTED
```

| 후보 | 이름 | 상태 |
|---|---|---|
| A | Soft Storybook Cel 2D Hybrid | `RECOMMENDED` |
| B | Clean Academy Anime 2D | `SAFE_ALTERNATIVE` |
| C | Illustrated Pixel Diorama | `PRODUCTION_FALLBACK` |

- A/B/C 모두 `NOT_YET_CANON`.
- 기존 이미지 기반 화면 보드는 근거 태그를 사용하며 새 그림체를 확정하지 않는다.
- 승인 후 같은 `ART-STYLE-01` ID로 정본·Sheet를 동기화한다.

## 12. 게이트 상태

| 게이트 | 상태 |
|---|---|
| 기획 완료 | `TRUE` |
| 비주얼 상황 보드 작업 원칙 | `APPROVED_PROJECT_WORK_PRINCIPLE` |
| GRIMOIRE 비주얼 보드 | `REWORK_REQUIRED_USER_REVIEW_REQUIRED` |
| 이전 기술 명세 | `SUPPORTING_TECHNICAL_APPENDIX_ONLY` |
| 이전 생성 이미지 | `REJECTED_NOT_AUTHORITY` |
| `ART-STYLE-01` 벤치마킹 | `COMPLETE` |
| `ART-STYLE-01` 결정 | `USER_DECISION_REQUIRED` |
| `ART-BIBLE-01` | `BLOCKED_BY_ART_STYLE` |
| `ASSET-SPEC-01` | `BLOCKED_BY_ART_BIBLE` |
| `AUDIO-DIRECTION-01` | `PENDING` |
| Codex Plan | `BLOCKED_BY_ART_AND_INTEGRATED_REVIEW` |
| Godot 구현 | `NOT_STARTED` |

## 13. 검증 경계

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
ART_STYLE_USER_APPROVAL = NOT_GRANTED
CORRECTED_VISUAL_BOARD_USER_REVIEW = NOT_GRANTED
```
