# GRIMOIRE Documentation Map — 현재 정본 경로

## 현재 상태

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

## 현재 읽기 경로

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-05.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/PR63_CANON_AND_BASE_DRIFT_ADVERSARIAL_REVIEW_2026-08-05.md
→ Resource PR #62 증거
→ Recognition PR #63 증거
→ GR-SYNC-20260805-04 Receipt
→ Google Sheet 동일 Sync ID
```

## 권위 문서

- `CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md` — 현재 제품·검증 Gate와 핵심/보조 시스템 경계.
- `CANON_STATUS_INDEX_2026-08-05.md` — 현재/이력/차단 상태 분류.
- `CURRENT_CONFIRMED_DECISIONS.md` — 승인 Decision과 구현 결과의 관계.
- `CANON_SYNC_STATE.json` — GitHub·Sheet 동기화 기계 상태.
- `GRILL_ME_BATCH_MERGE_STATE.json` — 승인 Batch `3/10`, 병합 미승인.
- `sync/GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC.md` — PR #63 제품 증거와 Sheet Readback 영수증.

## 핵심·보조 시스템

```text
핵심 = 상황 조사 → 의미 선택 → 3×3 회로 → Preview/Commit → 결과·대가 → Grimoire
보조 = Recognition + Exact Vault + Universal Stock + 마나/예약/저장 + 모바일 UX + 학교/동료 콘텐츠
```

Recognition 정확도만으로 핵심 재미 PASS를 선언하지 않는다.

## 구현 증거

- PR #62: `RESOURCE_FOUNDATION_POC_AUTOMATED_PASS`, Draft·미병합.
- PR #63: `GLYPH_RECOGNITION_POC_AUTOMATED_PASS`, Draft·미병합.
- Recognition 보고서: `docs/validation/GLYPH_RECOGNITION_POC_REPORT.md`.
- Stop Gate: `docs/planning/GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md`.
- 합성 Fixture/혼동 보고: `artifacts/foundation-poc/`.
- 정본 계약: `tests/test_current_checkpoint_authority.py`.

## 이력 경로

`CANON_STATUS_INDEX_2026-08-04.md`와 아래 PR #61 표기는 당시 계획 완료 체크포인트의 이력이다. 현재 실행 권위가 아니며 삭제하지 않는 이유는 계약 회귀와 Decision 추적성을 보존하기 위해서다.

```yaml
historical_checkpoint: PR61_IMPLEMENTATION_PLANS_READY
working_pull_request: 61
working_branch: agent/glyph-vault-stock-governance-design
current_gate: IMPLEMENTATION_PLANS_READY
approved_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
```

## 다음 Gate

```text
PR63 canon GREEN
→ exact-head CI·Review Thread
→ Sheet final HEAD Readback
→ GrillMe human/device scope approval
→ 검토 완료 후 이미지·애니메이션
→ Codex 후속 제품 작업
```

PR #63은 Draft이며 병합 권한이 없다.
