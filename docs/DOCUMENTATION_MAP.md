# GRIMOIRE Documentation Map — 현재 정본·체크포인트 경로

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_pull_request: 61
working_branch: agent/glyph-vault-stock-governance-design
grill_counter: 2_of_10
pending_decisions: 2
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
related_approved_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
merge_authorized: false
current_gate: USER_SPEC_REVIEW_PENDING
```

main 정본은 PR #57~#60 상태를 유지한다. PR #61은 사용자 승인된 자원·작업 운영 변경을 기록한 Draft 체크포인트이며 아직 병합되지 않았다.

## 시작 경로

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 새 승인·Spec·책임 원본
→ Batch
→ GR-SYNC-20260805-01
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
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json` — Batch `2/10`.
- `docs/planning/sync/GR-SYNC-20260805-01-GLYPH-VAULT-STOCK-GOVERNANCE.md` — Draft Sheet Readback 영수증.

## 보관함·Stock·문양

### 승인·병합 대기

- `GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- `2026-08-05-glyph-vault-universal-stock-design.md`.
- `STOCK_SYSTEM.md`.
- `STOCK_CAPACITY_SYSTEM.md`.
- `MANA_SYSTEM.md`.
- `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.

```text
보관함 = 미리 그린 특정 글자 전용
Stock = 습득한 핵심·보조 글자 범용
용량 = 보관함 슬롯과 Stock 별도
```

### 사용자 검토 제안·미승인

- `2026-08-05-glyph-vocabulary-v1-proposal.md` — 핵심 10·보조 10 및 Slice 우선 6종 후보. Decision으로 아직 집계하지 않는다.

### 부분 대체

- `GM-3X3-CIRCUIT-STOCK-FOCUS-01`: 3×3 회로·대상·마나·시간 압박은 유지하고 Typed Glyph Stock·특정 글자 충전·필사 출력만 새 Decision이 대체한다.

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
- Draft 체크포인트 Sync: `GR-SYNC-20260805-01-GLYPH-VAULT-STOCK-GOVERNANCE`.
- Godot toolchain 자료 `[구현완료 보관]`.
- 제품 Handoff·Overlay `[보류]`.
- Base 공용 정책 승격 `[보류]`.

제품 `project.godot`, Runtime, 문양 인식, 모바일, 성능, 접근성, 사람 검증은 미실행이다.

## Legacy 정책

- `[대체됨]·[폐기]`: 현재 근거로 사용 금지.
- `[부분 대체됨]`: 유지 범위만 사용.
- `[보류]`: 실행 지시로 사용 금지.
- `[이력]`: 당시 증거일 뿐 현재 상태 아님.

## 다음 Gate

```text
Contract·회귀 GREEN
→ 적대적 P0/P1 0
→ Sheet Readback PASS
→ 사용자 Spec·Vocabulary 검토
→ 구현 계획
```

PR #61은 Draft이며 병합 권한이 없다.
