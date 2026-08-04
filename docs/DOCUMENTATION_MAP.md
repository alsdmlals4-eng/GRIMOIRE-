# GRIMOIRE Documentation Map — 현재 정본·체크포인트 경로

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_pull_request: 61
working_branch: agent/glyph-vault-stock-governance-design
grill_counter: 3_of_10
pending_decisions: 3
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
approved_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
merge_authorized: false
current_gate: IMPLEMENTATION_PLANS_READY
```

main 정본은 PR #57~#60 상태를 유지한다. PR #61은 사용자 승인된 자원·작업 운영·Vocabulary 결정을 기록한 Draft 체크포인트이며 아직 병합되지 않았다.

## 시작 경로

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 승인 3종·Spec·책임 원본
→ 구현 계획 2종
→ Batch
→ GR-SYNC-20260805-02
→ PR #61
```

## 최상위 권위

- `AGENTS.md` — 작업 규칙과 사용자 승인 Draft 상태.
- `START_HERE.md` — 첫 화면.
- `docs/ACTIVE_CONTEXT.md` — 현재 작업 상태.
- `docs/DEVELOPMENT_GATES.md` — Gate.
- `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` — 구형·부분 대체·Draft 상태.
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` — 완료 Decision과 승인·병합 대기 Decision Snapshot.
- `docs/DESIGN_DOCUMENT_REGISTRY.json` — Router.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json` — Batch `3/10`.
- `docs/planning/sync/GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS.md` — 승인·계획·Sheet 동기화 영수증.

## 보관함·Stock

- 승인: `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- Spec: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 책임 원본: `STOCK_SYSTEM.md`, `STOCK_CAPACITY_SYSTEM.md`, `STOCK_CHARGE_TIME_SYSTEM.md`, `STOCK_HIT_PAUSE_SYSTEM.md`, `MANA_SYSTEM.md`, `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 구현 계획: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.

```text
보관함 = 미리 그린 특정 글자 전용
Stock = 습득한 핵심·보조 글자 범용
용량 = 보관함 슬롯과 Stock 별도
충전 = 단일 범용 Stock 진행도
```

## Vocabulary·인식

- 승인: `docs/planning/GLYPH_VOCABULARY_V1_01_APPROVAL_2026-08-05.md`.
- 상세 제안/Spec: `docs/superpowers/specs/2026-08-05-glyph-vocabulary-v1-proposal.md`.
- 구현 계획: `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.
- 의미 Vocabulary: 핵심 10종 + 보조 10종.
- Runtime Slice: `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST`.
- 확대 Gate: `HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION`.

## 벤치마크·TDD 운영

- 승인: `WORKFLOW_BENCHMARK_TDD_CHECKPOINT_01_APPROVAL_2026-08-05.md`.
- Spec: `2026-08-05-benchmark-tdd-checkpoint-governance-design.md`.
- Benchmark: `GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`.
- Contract test: `tests/test_glyph_vault_stock_governance_contract.py`.
- CI entry: `.github/workflows/validate-base-v9-adoption.yml`.

```text
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
STRICT_RED_GREEN_REFACTOR
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

## 주문·Frostbloom

- 3×3 인접 방향 회로와 `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- Heat·Flow 승인, 복수 해결 Spec·Route Guidance·내부 패턴.
- 학교 위기 교육·대사 승인과 실제 Script `[활성 연결 콘텐츠]`.
- 교수 시연은 하나의 예시이며 정답·채점키가 아니다.

## 운영·검증

- main 완료 Sync: `GR-SYNC-20260804-12-CLOSURE`.
- Draft 체크포인트 Sync: `GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS`.
- Godot toolchain 자료 `[구현완료 보관]`.
- 제품 구현은 아직 `NOT_STARTED`.
- Base 공용 정책 승격 `[보류]`.

제품 `project.godot`, Runtime, 실제 문양 인식, 모바일, 성능, 접근성, 사람 검증은 미실행이다.

## Legacy 정책

- `[대체됨]·[폐기]`: 현재 근거로 사용 금지.
- `[부분 대체됨]`: 유지 범위만 사용.
- `[보류]`: 실행 지시로 사용 금지.
- `[이력]`: 당시 증거일 뿐 현재 상태 아님.

## 다음 Gate

```text
Contract·회귀 exact-head GREEN
→ 적대적 P0/P1 0
→ Sheet Readback PASS
→ Codex에서 Resource 계획부터 TDD 실행
```

PR #61은 Draft이며 병합 권한이 없다.
