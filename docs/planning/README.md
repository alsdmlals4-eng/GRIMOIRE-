# GRIMOIRE Planning Index — 현재 경로

```yaml
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
```

## 현재 읽기 순서

1. `../../START_HERE.md`.
2. `../ACTIVE_CONTEXT.md`.
3. `../DEVELOPMENT_GATES.md`.
4. `CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md`.
5. `CANON_STATUS_INDEX_2026-08-05.md`.
6. `CURRENT_CONFIRMED_DECISIONS.md`.
7. `PR63_CANON_AND_BASE_DRIFT_ADVERSARIAL_REVIEW_2026-08-05.md`.
8. `GLYPH_RESOURCE_POC_STOP_GATE_01_2026-08-05.md`.
9. `GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md`.
10. `sync/GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC.md`.
11. `GRILL_ME_BATCH_MERGE_STATE.json`.

## 승인 Decision

- `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01` — Exact Vault·Universal Stock·명시적 출처·별도 용량.
- `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01` — 벤치마크·TDD·최대 Batch 10·조기 체크포인트.
- `GM-GLYPH-VOCABULARY-V1-01` — 의미 20종, Slice Runtime 6종, 사람 검증 전 확대 금지.

세 Decision은 승인됐으나 Batch는 `3/10`, PR #61~#63은 병합 미승인이다.

## 현재 구현 결과

```yaml
resource_foundation_pr: 62
resource_gate: AUTOMATED_PASS
recognition_pr: 63
recognition_gate: AUTOMATED_PASS
semantic_entries: 20
runtime_glyphs: 6
runtime_templates: 6
evidence_scope: SYNTHETIC_FIXTURES_ONLY
human_device_validation: NOT_RUN
```

Recognition은 입력 기반이며 핵심 재미가 아니다. 핵심 검증은 상황·의미·회로·Commit·결과의 사람 대상 전체 루프다.

## 작업 계약

```text
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

기획 충돌은 GrillMe 승인 전 확정하지 않는다. 합성 증거는 사람 검증을 대체하지 않는다. 이미지·애니메이션·Codex 후속 작업은 기획 완료와 검토 완료 이후 진행한다.

## 이력 호환 블록

아래는 PR #61 계획 완료 시점의 테스트·추적용 이력이며 현재 권위가 아니다.

```yaml
historical_checkpoint: PR61_IMPLEMENTATION_PLANS_READY
working_pull_request: 61
current_gate: IMPLEMENTATION_PLANS_READY
grill_counter: 3_of_10
approved_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
```

## 다음 기획 Gate

`GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`로 사람·실기기 검증 범위를 승인한다. 승인 전 7번째 Runtime 글자, 제품 품질 PASS, PR Ready/merge를 금지한다.
