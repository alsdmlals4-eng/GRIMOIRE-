# GR-SYNC-20260805-01 — Glyph Vault·Universal Stock·Workflow Checkpoint

```yaml
sync_id: GR-SYNC-20260805-01-GLYPH-VAULT-STOCK-GOVERNANCE
status: APPROVED_DRAFT_CHECKPOINT_SHEET_PENDING
created_at: 2026-08-05T00:31+09:00
repository: alsdmlals4-eng/GRIMOIRE-
base_main_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
working_branch: agent/glyph-vault-stock-governance-design
working_pull_request: 61
decision_ids:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
grill_counter: 2_of_10
merge_required: false
merge_authorized: false
checkpoint_reason:
  - HIGH_RISK_CONFLICT
  - MAJOR_CANON_IMPACT
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 변경 요약

- 특정 글자 Stock과 보관함의 책임 중복을 해소했다.
- 보관함은 미리 그린 특정 글자 전용, Stock은 습득한 핵심·보조 글자 범용으로 분리했다.
- 자연충전은 범용 Stock, 집중 필사는 특정 글자 보관함을 생산한다.
- 3×3 회로·대상/연결 비용 0·Commit 마나·완성 주문 Stock 금지는 유지한다.
- 의미 있는 작업에 벤치마크·현업 비교와 TDD/테스트 우선 계약을 추가했다.
- 승인 Batch 최대 10건과 조기 체크포인트 조건을 명시했다.

## TDD 상태

```yaml
red_test: tests/test_glyph_vault_stock_governance_contract.py
red_test_commit: fc9134598bc3ffb427d6801074eba9ef9c2df25f
ci_connection_commit: 64ca7465f5e5624be2e8e001f97dbe70d5131ef1
red_workflow_run: 30925666145
red_result: 6_TESTS_3_FAILURES_3_ERRORS_EXPECTED
current_phase: GREEN_IN_PROGRESS
```

최초 CI가 새 테스트 모듈을 호출하지 않아 잘못된 PASS가 발생했다. 실행 경로를 추적해 workflow에 테스트를 연결한 후 누락된 계약 때문에 예상 RED가 발생함을 확인했다.

## 동기화 범위

```text
GitHub 승인·Spec·책임 원본·상태 색인·Registry·Batch
↔ Google Sheet 00·01·02·04·30·60·99
```

Sheet 쓰기와 Readback은 아직 `PENDING`이다. 완료 전 `SYNCED_TO_MAIN` 또는 `SHEET_PASS`로 표기하지 않는다.

## 다음 Gate

1. Contract test GREEN.
2. 기존 Planning·Base·Godot CI 회귀 성공.
3. 적대적 P0/P1 0.
4. Sheet 동일 Decision ID 쓰기·Readback.
5. 사용자 Spec 검토.
6. 승인 후 구현 계획 작성.
