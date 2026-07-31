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
situation_screen_workflow: APPROVED_PROJECT_WORK_PRINCIPLE
situation_screen_spec: USER_REVIEW_REQUIRED_TECHNICAL_DESIGN_ONLY
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

이 문서는 승인된 현재 결정, 승인된 작업 원칙, 미승인 Gate와 검토 중 설계안을 빠르게 구분한다.

## 2. 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31S.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
→ docs/planning/SITUATION_SCREEN_SPEC_STATE.json
```

확정된 결정은 기억 확인 목적으로 다시 묻지 않는다. `USER_DECISION_REQUIRED`와 `USER_REVIEW_REQUIRED`는 승인 상태가 아니다.

## 3. 프로젝트 바인딩

- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- Google Sheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- Godot 프로젝트: `NOT_STARTED`
- 실제 `project.godot`, `.tscn`, `.gd`, `.tres`: `NOT_FOUND`
- Codex: `NOT_AUTHORIZED`

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

이 구조는 확정됐지만 실제 그림체·색·선·명암·재질·내부 해상도는 확정되지 않았다.

## 8. 승인된 작업 원칙

### GM-BENCHMARK-FIRST-01

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위 맞춤 벤치마킹 후 설계한다.

### GM-CANON-SYNC-01

주요 승인 변경은 같은 Decision ID로 GitHub 권위 문서·계획 데이터와 Google Sheet에 즉시 반영하고, working branch와 main 상태를 구분한다.

### GM-SITUATION-SCREEN-WORKFLOW-01

프로젝트별 상황 화면 명세는 다음 순서로 작성한다.

```text
프로젝트·실제 파일 확인
→ 핵심 경험
→ 필수 기준 화면 4종
→ 실제 플레이 상황 도출
→ P0~P3
→ P0 A~T 상세 명세
→ 전체 전환·의존 관계
→ 상황 보드
→ 완료·테스트
→ Base 승격 후보·프로젝트 전용 분리
```

책임 원본:

- `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md`

## 9. GM-SITUATION-SCREEN-SPEC-01 — 검토 중 기술 설계

```yaml
status: USER_REVIEW_REQUIRED
spec_type: TECHNICAL_DESIGN_ONLY
benchmark: STANDARD_COMPLETE
implementation_authority: NONE
```

작성 범위:

- 필수 기준 화면 4종: Main, 별도 전투, 마도서·자원 대응, Result.
- P0 상황 10개, P1~P3 Backlog.
- 각 P0의 진입·화면·입력·시스템·Godot Scene/Node/Resource/Signal·Save·예외·완료·테스트.
- Persistent ApplicationRoot + World Scene 교체 + CanvasLayer Overlay + Snapshot 권장안.
- 9칸 상황 보드와 전체 상태 전환도.

책임 원본:

- `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md`
- `docs/superpowers/specs/grimoire-situations/P0_01_ENTRY_FIELD_DIALOGUE.md`
- `docs/superpowers/specs/grimoire-situations/P0_02_SCHEDULE_SPELL_BATTLE.md`
- `docs/superpowers/specs/grimoire-situations/P0_03_RESULT_RETURN_GRIMOIRE.md`
- `docs/superpowers/specs/grimoire-situations/SITUATION_BOARD_AND_BACKLOG.md`
- `docs/planning/SITUATION_SCREEN_SPEC_STATE.json`

검토 중 제안:

- ApplicationRoot·WorldHost·UIHost 구체 구조.
- 최소 Main Menu.
- 마도서 화면 배치.
- Resource·Save JSON·Sheet export Pipeline.
- Signal·Scene 경로·상태 명칭.

이 문서는 구현 권한이 아니다.

## 10. ART-STYLE-01 — 미승인 Gate

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
- 이미지 생성·팔레트·선·명암·재질·내부 해상도 미착수.
- 승인 후 같은 `ART-STYLE-01` ID로 정본·Sheet 동기화.

## 11. 게이트 상태

| 게이트 | 상태 |
|---|---|
| 기획 완료 | `TRUE` |
| 상황 화면 작업 원칙 | `APPROVED_PROJECT_WORK_PRINCIPLE` |
| 상황 화면 기술 설계 | `USER_REVIEW_REQUIRED` |
| `ART-STYLE-01` 벤치마킹 | `COMPLETE` |
| `ART-STYLE-01` 결정 | `USER_DECISION_REQUIRED` |
| `ART-BIBLE-01` | `BLOCKED_BY_ART_STYLE` |
| `ASSET-SPEC-01` | `BLOCKED_BY_ART_BIBLE` |
| `AUDIO-DIRECTION-01` | `PENDING` |
| Codex Plan | `BLOCKED_BY_ART_AND_INTEGRATED_REVIEW` |
| Godot 구현 | `NOT_STARTED` |

## 12. 검증 경계

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
ART_STYLE_USER_APPROVAL = NOT_GRANTED
SITUATION_SCREEN_SPEC_USER_REVIEW = NOT_GRANTED
```
