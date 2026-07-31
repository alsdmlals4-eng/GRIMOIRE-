# GRIMOIRE Documentation Map

## 현재 기준

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning_complete: true
next_product_gate: ART-STYLE-01
situation_screen_workflow: APPROVED_PROJECT_WORK_PRINCIPLE
situation_screen_spec: USER_REVIEW_REQUIRED
canon_sync_state: SYNCED_TO_WORKING_BRANCH
```

## 1. 시작 경로

```text
README.md
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31S.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 질문 주제의 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ docs/planning/CANON_SYNC_STATE.json
→ docs/planning/SITUATION_SCREEN_SPEC_STATE.json
```

## 2. 활성 권위·책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| 최상위 작업 규칙 | `AGENTS.md` | `ACTIVE_PROJECT_AUTHORITY` |
| 시작·다음 작업 | `START_HERE.md` | `ACTIVE_ENTRYPOINT` |
| 현재 상태·위험 | `docs/ACTIVE_CONTEXT.md` | `ACTIVE_CONTEXT_AUTHORITY` |
| 확정 결정 복원 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | `ACTIVE_FIRST_READ_AUTHORITY` |
| 최신 사용자 결정 | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31S.md` | `ACTIVE_LATEST_USER_DECISION_AUTHORITY` |
| 기획 완결 정본 | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` | `ACTIVE_APPROVED_PLANNING_CANON` |
| 벤치마킹 원칙 | `docs/planning/PROJECT_BENCHMARKING_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 정본·Sheet 동기화 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 프로젝트 상황 화면 작업지시문 | `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md` | `ACTIVE_PROJECT_WORK_ORDER` |
| 상황 화면 설계 Master | `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md` | `USER_REVIEW_REQUIRED_TECHNICAL_DESIGN` |
| 상황 화면 상태 데이터 | `docs/planning/SITUATION_SCREEN_SPEC_STATE.json` | `ACTIVE_MACHINE_READABLE_REVIEW_STATE` |
| Canon 동기화 상태 | `docs/planning/CANON_SYNC_STATE.json` | `ACTIVE_MACHINE_READABLE_SYNC_STATE` |
| Google Sheet 계약 | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | `USER_FACING_GDD_WORKSPACE_CONTRACT` |
| 개발 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| 문서 Router | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| Base 핀 | `docs/BASE_RULES_VERSION.md` | `STALE_RECONCILIATION_REQUIRED` |
| Base Adapter | `skills/PROJECT_BASE_ADAPTER.json` | `RECONCILIATION_PENDING` |
| Skill Snapshot | `skills/PROJECT_SKILL_SNAPSHOT.json` | `RECONCILIATION_PENDING` |

## 3. 상황 화면 명세 경로

### 작업 원칙

- 결정 ID: `GM-SITUATION-SCREEN-WORKFLOW-01`.
- 책임 원본: `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md`.
- 상태: `APPROVED_PROJECT_WORK_PRINCIPLE`.
- Base 승격: `CANDIDATE`.

### GRIMOIRE 설계

- 결정 ID: `GM-SITUATION-SCREEN-SPEC-01`.
- 상태: `USER_REVIEW_REQUIRED / TECHNICAL_DESIGN_ONLY`.
- 구현 권한: 없음.

```text
공식 Godot 벤치마킹
→ 필수 기준 화면 4종
→ P0~P3 상황 목록
→ P0 10개 A~T 상세 명세
→ 전체 상태 전환·의존 관계
→ 9칸 화면 보드
→ 사용자 검토
```

책임 파일:

- `docs/planning/benchmarks/GM_SITUATION_SCREEN_ARCHITECTURE_BENCHMARK_2026-07-31.md`
- `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md`
- `docs/superpowers/specs/grimoire-situations/P0_01_ENTRY_FIELD_DIALOGUE.md`
- `docs/superpowers/specs/grimoire-situations/P0_02_SCHEDULE_SPELL_BATTLE.md`
- `docs/superpowers/specs/grimoire-situations/P0_03_RESULT_RETURN_GRIMOIRE.md`
- `docs/superpowers/specs/grimoire-situations/SITUATION_BOARD_AND_BACKLOG.md`
- `docs/planning/SITUATION_SCREEN_SPEC_STATE.json`

## 4. 필수 기준 화면 Router

| 화면 | 책임 문서 | 상태 |
|---|---|---|
| SCREEN-01 Main·시작 | Master + P0 01 | `PROPOSED_MINIMUM / NOT_IMPLEMENTED` |
| SCREEN-02 전술 전투·핵심 플레이 | Master + P0 02 | `CONFIRMED_PRESENTATION / TECHNICAL_PROPOSAL` |
| SCREEN-03 마도서·보유 지식·준비 | Master + P0 03 | `INVENTORY_EQUIVALENT_PROPOSAL` |
| SCREEN-04 Result·보상·복기 | Master + P0 03 | `CONFIRMED_RULE / TECHNICAL_PROPOSAL` |

## 5. P0 상황 Router

| 범위 | 문서 |
|---|---|
| 최초 실행·학교 Field·Dialogue | `P0_01_ENTRY_FIELD_DIALOGUE.md` |
| 자유일정·Situation·Spell·Battle | `P0_02_SCHEDULE_SPELL_BATTLE.md` |
| Result·Field Return·Grimoire | `P0_03_RESULT_RETURN_GRIMOIRE.md` |
| P1~P3·Transition·Board | `SITUATION_BOARD_AND_BACKLOG.md` |

## 6. 기획·아트 경로

```text
Gate 1·Vertical Slice 승인
→ 기획 완결 정본
→ ART-STYLE-01 벤치마킹·후보
→ 사용자 ART-STYLE 결정
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ 기술 계획·검수
→ 구현
```

상황 화면 설계는 기술 구조를 준비하지만 Art Gate·Asset Gate·Codex 승인 순서를 우회하지 않는다.

## 7. ART-STYLE-01

| 자료 | 문서 | 상태 |
|---|---|---|
| 벤치마킹 | `docs/planning/benchmarks/ART_STYLE_01_BENCHMARK_2026-07-31.md` | `COMPLETE` |
| 후보 A/B/C | `docs/planning/ART_STYLE_01_CANDIDATES.md` | `USER_DECISION_REQUIRED` |
| 상태 데이터 | `docs/planning/ART_STYLE_01_STATE.json` | `ACTIVE_CANDIDATE_STATE` |

이미지 생성은 시작하지 않았다.

## 8. 정본·Sheet 동기화 경로

```text
Decision ID
→ Decision Addendum·분야 책임 원본·Snapshot·Active Context
→ Registry·Map·계획 상태 데이터
→ authority commit
→ 연결된 Google Sheet
→ 양쪽 재조회
→ 동기화 영수증
→ working branch 상태
→ PR 병합 후 main 재검증
```

필수 Sheet 위치:

- `02_현재_확정결정`.
- 해당 도메인 탭.
- `04_누락_충돌_감사`.
- `99_변경이력`.

Gate·단계 변경 시:

- `00_프로젝트_허브`.
- `01_작업순서`.
- `05_GDD_요약`.

## 9. Legacy·충돌

| 자료 | 현재 역할 |
|---|---|
| v6·v8 Vertical Slice 계약 | `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY` |
| `docs/planning/SPELL_GAME_DESIGN.md` | `LEGACY_REFERENCE_CANDIDATE` |
| Android 터치 연구 | `REFERENCE_CANDIDATE / NOT_PC_RUNTIME_VALIDATED` |
| 생성 이미지 | 승인 상태별 참고, 자동 정본·자산 아님 |
| `docs/BASE_RULES_VERSION.md` 과거 값 | `STALE / ISSUE_21_RECONCILIATION` |
| Adapter v9.1 본문 | `STALE / ISSUE_21_RECONCILIATION` |

## 10. 구현·검증 경계

```text
GODOT_PROJECT = NOT_STARTED
CODEX = BLOCKED
PRODUCT_SCENE_SCRIPT_RESOURCE = NOT_FOUND
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
