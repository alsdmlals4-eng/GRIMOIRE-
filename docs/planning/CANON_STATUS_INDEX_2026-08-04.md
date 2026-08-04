# GRIMOIRE 정본 상태 색인 — 2026-08-04

> 파일명에 `DRAFT`, `WORKING`, 과거 날짜 또는 `CURRENT`가 남아 있어도 이 문서가 현재 참조 가능 여부를 판정한다. 분류되지 않은 과거 문서는 최신 Decision과 충돌할 경우 현재 정본으로 사용하지 않는다.

## 상태

| 표기 | 의미 |
|---|---|
| `[활성]` | 현재 기획·운영 정본 |
| `[활성 연결 콘텐츠]` | 과거/DRAFT 파일명이지만 승인 래퍼가 현재 콘텐츠로 승격 |
| `[부분 대체됨]` | 명시된 범위만 유효 |
| `[대체됨]` | Git 이력으로만 보존, 현재 참조 금지 |
| `[보류]` | 방향·자료는 보존하지만 현재 실행 지시가 아님 |
| `[구현완료 보관]` | 계획·도구 작업이 끝나 새 실행 지시로 사용 금지 |
| `[폐기]` | 현재 설계에서 사용하지 않음 |
| `[이력]` | 당시 상태 증거, 현재 상태 권위 아님 |

## 현재 복원 순서

1. `[활성]` `AGENTS.md`
2. `[활성]` `START_HERE.md`
3. `[활성]` `docs/ACTIVE_CONTEXT.md`
4. `[활성]` `docs/DEVELOPMENT_GATES.md`
5. `[활성]` 이 문서
6. `[활성]` `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `[활성]` `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `[활성]` `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
9. `[활성]` `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
10. `[활성]` Frostbloom 승인 문서와 Batch 기계 권위

## 활성 — 주문·자원

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md` — 방향 활성, 수치 Tuning 보류

## 활성 — Frostbloom

- `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_APPROVAL_2026-08-04.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md`
- `[활성 연결 콘텐츠]` `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- `[활성 연결 콘텐츠]` `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`

대사 Script의 `DRAFT`는 파일명 이력이다. 승인 상태는 `FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md`가 소유한다.

## 활성 — 운영·검증

- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- `docs/planning/THREE_BY_THREE_CANON_PREMERGE_ADVERSARIAL_REVIEW_2026-08-04.md`
- `docs/planning/sync/GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS.md` — 병합 전 Working Sync
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- `docs/planning/PRE_MERGE_ADVERSARIAL_REVIEW_CHECKLIST_2026-08-02.md`

## 부분 대체됨

### `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`

유지:

- 자연충전.
- 공유 용량.
- 소환수 정수 초 단축.
- Offline 충전 금지.

대체:

- 완성 주문 Stock.
- 다글자 완성 주문 충전 공식.
- Stock 주문 무마나 실행.

최신: `GM-3X3-CIRCUIT-STOCK-FOCUS-01`.

### `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`

유지:

- 선택지는 의도·우선순위.
- 복수 해결과 미등록 합리적 해결.
- 단일 정답·강제 전투 금지.

대체:

- 과거 직접 작성 UI.
- 자유 회로·Flow-main 예시.

### `docs/planning/SPELL_GAME_DESIGN.md`

유지: 마법학교·글자 학습·응용·마도서 복기·소환수 지원의 코어 입력.

대체: 프로젝트명·브랜치·제품 단계·완성 주문 Stock·직접 작성 중심 전투·무마나 Stock 주문.

### `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

최신 승인 문서가 명시적으로 바꾼 주문·Stock·소환·모바일 UX·Frostbloom 항목은 사용하지 않는다.

### `skills/PROJECT_BASE_ADAPTER.json`

활성 필드:

- Base release pin.
- routing.
- protected paths.
- generated outputs 계약.

비권위 Snapshot:

- `current_state`.
- `gdd_sheet`.
- 과거 branch·sync·commit 상태.

현재 상태는 `AGENTS.md`, Batch, Sheet Readback을 우선한다.

## 대체됨

- `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md` → Heat·Flow Approval.
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md` → Cast Dialogue Approval과 Active Script.
- `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md` → Pedagogy + Cast + 3×3 정본.
- `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md` → Toolchain Report + Development Gates.
- `docs/planning/CIRCUIT_SYSTEM.md` → Magic Letter Circuit responsibility source.

위 파일은 본문 자체가 상태 Stub으로 교체됐다.

## 보류

- `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` — typed glyph Stock 기준 재설계 필요.
- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.

Codex 제품 구현 문서는 3×3 Wireframe·Frostbloom UX·Art 범위가 준비될 때까지 실행 지시로 사용하지 않는다.

## 구현완료 보관

- `docs/superpowers/plans/2026-08-03-godot-toolchain-setup-implementation-plan.md`.
- `docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md`.
- `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.
- `tools/setup_godot_toolchain.py`.
- `tests/test_godot_toolchain_setup.py`.

이는 개발환경 도구 완료를 의미하며 제품 Godot 프로젝트 완료가 아니다.

## 폐기

- `docs/planning/AUTO_SPELL_SYSTEM.md`.
- `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
- 완성 주문 원터치 Stock.
- `흐름`을 Slice 메인 글자로 쓰는 계약.
- 교수 회로 자동 복사·정답표·채점키.
- 집중 필사 완전 시간 정지.
- 그림 정확도 위력·마나·Stock 수량 보너스.
- Stock으로 만든 주문의 무마나 실행.
- `Stage 0`을 현재 제품 Gate 명칭으로 사용하는 방식.

## 이력 Sync

- `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
- `docs/planning/sync/GR-SYNC-20260804-04-FROSTBLOOM-CAST-DIALOGUE-DRAFT.md`.
- `docs/planning/sync/GR-SYNC-20260804-05-FROSTBLOOM-FIRST-YEAR-CAST-DRAFT.md`.
- `docs/planning/sync/GR-SYNC-20260804-06-HEAT-FLOW-OBSERVATION-DRAFT.md`.
- `docs/planning/sync/GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT.md`.
- `docs/planning/sync/GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL.md`.

이력 Sync는 당시 상태 증거이며 현재 복원 진입점이 아니다.

## 보류된 후속 검증

- Godot 공식 배포물 SHA-256 고정 검증: 비차단 공급망 경화.
- 3×3 Mobile Wireframe.
- Runtime·모바일·성능·접근성·사람 검증.
- 상태이상–Stock 재설계.
- 마나 비용 공식.

`0.25배`, `마나 1/초`, 용량 `8`, 1글자 `10초`, 최소 `3초`는 모두 `TEST_VALUE`다.
