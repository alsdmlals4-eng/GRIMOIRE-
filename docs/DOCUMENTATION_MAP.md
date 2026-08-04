# GRIMOIRE Documentation Map — 현재 정본 경로

## 상태

```yaml
main_authority_commit: 39da99fbc56ccdf90904b24b5725cb0d0779595a
current_main_sync: GR-SYNC-20260804-11-MAIN-READBACK
sheet_readback_pull_request: 59
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

- `AGENTS.md` — 작업 규칙.
- `START_HERE.md` — 첫 화면.
- `docs/ACTIVE_CONTEXT.md` — 현재 상태.
- `docs/DEVELOPMENT_GATES.md` — Gate.
- `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` — 구형 파일 상태.
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` — 결정 Snapshot.
- `docs/DESIGN_DOCUMENT_REGISTRY.json` — 문서 Router.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json` — Batch 기계 권위.
- `docs/planning/sync/GR-SYNC-20260804-11-MAIN-READBACK.md` — 최종 Readback Sync.

## 주문·자원

- 승인: `THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`.
- 상세 Spec: `2026-08-04-3x3-circuit-stock-focus-scribing-design.md`.
- 회로: `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- Stock: `STOCK_SYSTEM.md`.
- 용량·예약: `STOCK_CAPACITY_SYSTEM.md`.
- 충전·전환·피격: 각 Stock 책임 원본.
- 마나: `MANA_SYSTEM.md`.
- 상태이상: `STATUS_EFFECT_STOCK_SYSTEM.md` `[보류]`.

폐기·대체: `AUTO_SPELL_SYSTEM.md`, `CIRCUIT_SYSTEM.md`, 완성 주문 원터치 Stock, Stock 주문 무마나 계약.

## Frostbloom

- Heat·Flow 승인.
- 복수 해결 Spec·Route Guidance.
- 20개 내부 QA 패턴.
- 학교 위기 교육 승인.
- 인물·대사 승인.
- `FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`는 `[활성 연결 콘텐츠]`.

## 운영·검증

- 사전 적대적 검토: `THREE_BY_THREE_CANON_PREMERGE_ADVERSARIAL_REVIEW_2026-08-04.md`.
- 최종 Sync: `GR-SYNC-20260804-11-MAIN-READBACK.md`.
- Godot toolchain 자료는 `[구현완료 보관]`.
- Codex 제품 Handoff·Overlay는 `[보류]`.

제품 `project.godot`, Runtime, 모바일, 성능, 접근성, 사람 검증은 미실행이다.

## Base

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 활성 권위이며 상태 Snapshot은 비권위다.

## Legacy 정책

- `[대체됨]·[폐기]`: 현재 근거로 사용 금지.
- `[부분 대체됨]`: 유지 범위만 사용.
- `[보류]`: 실행 지시로 사용 금지.
- `[이력]`: 당시 증거일 뿐 현재 상태 아님.
