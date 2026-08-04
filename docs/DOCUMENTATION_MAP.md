# GRIMOIRE Documentation Map — 현재 정본 경로

## 상태

```yaml
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
finalization_pull_request: 58
grill_counter: 0_of_10
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
```

## 시작 경로

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 질문 주제의 최신 승인 책임 원본
```

## 최상위 권위

| 책임 | 문서 |
|---|---|
| 작업 규칙 | `AGENTS.md` |
| 첫 화면 | `START_HERE.md` |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` |
| Gate | `docs/DEVELOPMENT_GATES.md` |
| 구형 파일 상태 | `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` |
| 결정 Snapshot | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| 문서 Router | `docs/DESIGN_DOCUMENT_REGISTRY.json` |
| Batch | `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json` |
| Main Sync | `docs/planning/sync/GR-SYNC-20260804-10-MAIN.md` |

## 주문·자원

| 책임 | 문서 |
|---|---|
| 승인 | `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md` |
| 상세 Spec | `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md` |
| 회로 | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| Stock | `docs/planning/STOCK_SYSTEM.md` |
| 용량·예약 | `docs/planning/STOCK_CAPACITY_SYSTEM.md` |
| 충전 | `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md` |
| 충전 대상 전환 | `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` |
| 피격 | `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md` |
| 마나 | `docs/planning/MANA_SYSTEM.md` |
| 상태이상 | `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` `[보류]` |

폐기·대체: `AUTO_SPELL_SYSTEM.md`, `CIRCUIT_SYSTEM.md`, 완성 주문 원터치 Stock, Stock 주문 무마나 계약.

## Frostbloom

| 책임 | 문서 |
|---|---|
| Heat·Flow | `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md` |
| 복수 해결 | `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md` |
| Route Guidance | `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md` |
| 내부 패턴 | `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md` |
| 교육 | `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md` |
| 대사 승인 | `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md` |
| 실제 Script | `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md` `[활성 연결 콘텐츠]` |

Script 파일명의 `DRAFT`는 이력이며 승인 문서가 상태를 소유한다.

## 운영·검증

- `docs/planning/THREE_BY_THREE_CANON_PREMERGE_ADVERSARIAL_REVIEW_2026-08-04.md`.
- `docs/planning/sync/GR-SYNC-20260804-10-MAIN.md`.
- `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md` `[구현완료 보관]`.
- Codex 제품 Handoff·Overlay `[보류]`.

제품 `project.godot`, Runtime, 모바일, 성능, 접근성, 사람 검증은 미실행이다.

## Base

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 활성 권위이며 과거 상태 Snapshot은 비권위다.

## Legacy 정책

- `[대체됨]·[폐기]`: 현재 근거로 사용 금지.
- `[부분 대체됨]`: 유지 범위만 사용.
- `[보류]`: 실행 지시로 사용 금지.
- `[이력]`: 당시 증거일 뿐 현재 상태가 아님.
