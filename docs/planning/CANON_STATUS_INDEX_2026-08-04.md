# GRIMOIRE 정본 상태 색인 — 2026-08-04

> 파일명에 `DRAFT`, `WORKING`, 과거 날짜 또는 `CURRENT`가 남아 있어도 이 문서가 현재 참조 가능 여부를 판정한다.

## 상태

| 표기 | 의미 |
|---|---|
| `[활성]` | 현재 기획·운영 정본 |
| `[활성 연결 콘텐츠]` | 과거/DRAFT 파일명이지만 승인 래퍼가 현재 콘텐츠로 승격 |
| `[부분 대체됨]` | 명시 범위만 유효 |
| `[대체됨]` | Git 이력으로만 보존, 현재 참조 금지 |
| `[보류]` | 현재 실행 지시가 아님 |
| `[구현완료 보관]` | 완료 이력, 새 실행 지시로 사용 금지 |
| `[폐기]` | 현재 설계에서 사용하지 않음 |
| `[이력]` | 당시 상태 증거, 현재 권위 아님 |

## 현재 main 상태

```yaml
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
finalization_pull_request: 58
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
```

## 복원 순서

1. `[활성]` `AGENTS.md`
2. `[활성]` `START_HERE.md`
3. `[활성]` `docs/ACTIVE_CONTEXT.md`
4. `[활성]` `docs/DEVELOPMENT_GATES.md`
5. `[활성]` 이 문서
6. `[활성]` `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `[활성]` `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `[활성]` 3×3 승인·Spec
9. `[활성]` Frostbloom 승인 문서
10. `[활성]` Batch와 `GR-SYNC-20260804-10-MAIN`

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
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md`
- `[활성 연결 콘텐츠]` `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- `[활성 연결 콘텐츠]` `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`

## 부분 대체됨

- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`: 자연충전·공유 용량·소환수 정수 단축·Offline 금지만 유지. 완성 주문 Stock·무마나 실행은 폐기.
- `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`: 복수 해결 코어만 유지. 과거 직접 작성 UI·Flow-main 예시는 대체.
- `docs/planning/SPELL_GAME_DESIGN.md`: 마법학교·학습·응용·복기 코어 입력만 유지.
- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`: 최신 Decision이 바꾼 주문·Stock·소환·모바일 UX 항목은 사용 금지.
- `skills/PROJECT_BASE_ADAPTER.json`: Base pin·routing·protected paths·generated outputs만 활성. 상태 Snapshot 비권위.

## 대체됨

- `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`.
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`.
- `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`.
- `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.
- `docs/planning/CIRCUIT_SYSTEM.md`.

## 보류

- `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` — typed glyph Stock 재설계 필요.
- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.

## 구현완료 보관

- Godot toolchain setup plan·approval·report·script·tests.

이는 개발환경 완료를 뜻하며 제품 프로젝트 완료가 아니다.

## 폐기

- `docs/planning/AUTO_SPELL_SYSTEM.md`.
- `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
- 완성 주문 원터치 Stock.
- Stock 주문 무마나 실행.
- `흐름` Slice 메인 계약.
- 교수 회로 정답표·자동 복사.
- 집중 필사 완전 정지.
- 그림 정확도 위력·마나·추가 Stock 보너스.
- Stage 0 현재 Gate 명칭.

## Sync 이력

- `[이력]` `GR-SYNC-20260803-07-WORKING`.
- `[이력]` `GR-SYNC-20260804-04`부터 `09B`까지 Draft·Working·Premerge Sync.
- `[활성 Main Sync]` `docs/planning/sync/GR-SYNC-20260804-10-MAIN.md`.

## 후속 보류 검증

- 상태이상–typed Stock 재설계.
- 마나 비용 공식.
- 3×3 Mobile Wireframe.
- Godot 다운로드 SHA-256 고정 검증.
- Runtime·모바일·성능·접근성·사람 검증.

Prototype 수치는 모두 `TEST_VALUE`다.
