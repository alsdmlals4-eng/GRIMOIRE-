# GR-SYNC-20260805-01 — Glyph Vault·Universal Stock·Workflow Checkpoint

```yaml
sync_id: GR-SYNC-20260805-01-GLYPH-VAULT-STOCK-GOVERNANCE
status: APPROVED_DRAFT_CHECKPOINT_SHEET_READBACK_PASS
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
- 핵심·보조 단어 10+10 Vocabulary 후보와 Slice 우선 6종을 사용자 검토 대상으로 작성했다.

## TDD 상태

```yaml
red_test: tests/test_glyph_vault_stock_governance_contract.py
red_test_commit: fc9134598bc3ffb427d6801074eba9ef9c2df25f
ci_connection_commit: 64ca7465f5e5624be2e8e001f97dbe70d5131ef1
red_workflow_run: 30925666145
red_result: 6_TESTS_3_FAILURES_3_ERRORS_EXPECTED
focused_green_workflow_run: 30927476468
focused_green_result: PASS
current_phase: EXACT_HEAD_REGRESSION_AND_ADVERSARIAL_REVIEW
```

최초 CI가 새 테스트 모듈을 호출하지 않아 잘못된 PASS가 발생했다. 실행 경로를 추적해 workflow에 테스트를 연결한 후 누락된 계약 때문에 예상 RED가 발생함을 확인했다. 문서·정본 최소 구현 후 Planning workflow의 focused contract와 기존 회귀가 성공했다.

## Google Sheet Readback

```yaml
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
write_status: PASS
readback_status: PASS
ranges:
  - 00_프로젝트_허브_H2_K2
  - 01_작업순서_H47_J47
  - 02_현재_확정결정_A55_J56
  - 04_누락_충돌_감사_E56_H56
  - 30_데모범위_품질기준_제작기반_G20_H20
  - 60_UX_UI_접근성_A26_J26
  - 99_변경이력_A70_H70
```

GitHub와 Sheet는 같은 두 Decision ID, PR #61, Grill `2/10`, 병합 미승인 상태를 가리킨다. 이는 main 병합 완료가 아니라 Draft 체크포인트 동기화다.

## 다음 Gate

1. 최신 exact HEAD에서 Planning·Godot CI 성공.
2. 적대적 P0/P1 0.
3. 미해결 Review Thread 확인.
4. 사용자에게 두 승인 Spec과 Vocabulary 제안 검토 요청.
5. 승인 후 구현 계획 작성.

PR #61은 Draft이고 병합 권한이 없다.
