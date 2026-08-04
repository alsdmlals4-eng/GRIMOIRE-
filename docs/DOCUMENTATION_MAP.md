# GRIMOIRE Documentation Map — 현재 정본 경로

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

과거 `DECISION_LOG_ADDENDUM`, 과거 main Sync, Planning Canon 단독 진입은 현재 시작 경로가 아니다.

## 최상위 권위

| 책임 | 문서 | 상태 |
|---|---|---|
| 작업 규칙 | `AGENTS.md` | 활성 |
| 첫 화면 | `START_HERE.md` | 활성 |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` | 활성 |
| 개발·기획 Gate | `docs/DEVELOPMENT_GATES.md` | 활성 |
| 파일 상태 | `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` | 활성 |
| 확정 결정 Snapshot | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | 활성 |
| 문서 Router | `docs/DESIGN_DOCUMENT_REGISTRY.json` | 활성 |
| Grill Batch | `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json` | 기계 권위 |
| Google Sheet 계약 | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | 활성 |

## 주문·자원

| 책임 | 문서 |
|---|---|
| 3×3 승인 | `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md` |
| 구현 설계 | `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md` |
| 회로 문법 | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 글자 Stock | `docs/planning/STOCK_SYSTEM.md` |
| 용량·예약 | `docs/planning/STOCK_CAPACITY_SYSTEM.md` |
| 자연충전 | `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md` |
| 충전 대상 전환 | `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` |
| 피격 방해 | `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md` |
| 마나 | `docs/planning/MANA_SYSTEM.md` |
| 상태이상 | `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md` `[보류]` |

폐기된 문서:

- `docs/planning/AUTO_SPELL_SYSTEM.md`.
- `docs/planning/CIRCUIT_SYSTEM.md`.
- 완성 주문 원터치 Stock 계약.

## Frostbloom 사건

| 책임 | 문서 |
|---|---|
| Heat·Flow 승인 | `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md` |
| 복수 해결 승인 | `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md` |
| Route Guidance | `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md` |
| 20개 내부 패턴 | `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md` |
| 교육 개입 | `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md` |
| 인물·대사 승인 | `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md` |
| 실제 대사 Script | `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md` `[활성 연결 콘텐츠]` |
| 대사 Design | `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md` `[활성 연결 콘텐츠]` |

파일명의 `DRAFT`는 생성 당시 이름이며 Approval이 현재 상태를 소유한다.

## 운영·검증

| 책임 | 문서 |
|---|---|
| 사전 적대적 검토 | `docs/planning/THREE_BY_THREE_CANON_PREMERGE_ADVERSARIAL_REVIEW_2026-08-04.md` |
| Working Sync | `docs/planning/sync/GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS.md` |
| Godot 도구 보고 | `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md` `[구현완료 보관]` |
| Codex 제품 Handoff | `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md` `[보류]` |
| Codex Overlay | `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md` `[보류]` |

제품 `project.godot`, Runtime, 모바일 실기기, 성능, 접근성, 사람 검증은 아직 없다.

## Base

```yaml
release: v9.4.3
adapter: skills/PROJECT_BASE_ADAPTER.json
adapter_active_scope:
  - base_release
  - routing
  - protected_paths
  - generated_outputs
adapter_noncanonical_snapshots:
  - current_state
  - gdd_sheet
  - old_branch_and_sync_values
```

Base 생성 View는 직접 편집하지 않는다.

## Legacy 정책

- 상태 색인에서 `[대체됨]·[폐기]`인 파일은 현재 답변·구현·기획의 근거로 사용하지 않는다.
- `[부분 대체됨]`은 명시된 유지 범위만 사용한다.
- `[보류]`는 실행 지시로 사용하지 않는다.
- `[이력]` Sync는 당시 증거일 뿐 현재 상태가 아니다.
- 분류되지 않은 과거 파일은 최신 정본과 충돌하면 최신 Decision이 우선한다.
