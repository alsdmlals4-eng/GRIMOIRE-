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
- 보관함 슬롯과 범용 Stock 용량을 분리했다.
- 자연충전은 하나의 범용 Stock 게이지만 사용한다.
- 특정 글자 충전 대상·글자별 진행도·대상 전환 시스템을 폐기했다.
- 집중 필사는 특정 글자 보관함을 생산한다.
- 3×3 회로·대상/연결 비용 0·Commit 마나·완성 주문 Stock 금지는 유지한다.
- 의미 있는 작업에 벤치마크·현업 비교와 TDD/테스트 우선 계약을 추가했다.
- 승인 Batch 최대 10건과 조기 체크포인트 조건을 명시했다.
- 핵심·보조 단어 10+10 Vocabulary 후보와 Slice 우선 6종을 사용자 검토 대상으로 작성했다.

## 적대적 검토에서 닫은 충돌

1. `특정 글자 Stock`과 보관함의 동일 책임.
2. 공용 자원 용량이 두 자원을 다시 합치는 충돌.
3. 범용 Stock인데도 특정 글자를 미리 선택·전환하는 구형 자연충전.
4. 필사 성공이 보관함이 아니라 특정 글자 Stock을 생성하는 표기.
5. `MAGIC_LETTER_CIRCUIT_SYSTEM`과 `MANA_SYSTEM`의 구형 예약·출력 문구.
6. `docs/planning/README.md`의 과거 `ART-STYLE-01` 현재 차단 표기.
7. Documentation Map의 Batch `0/10` 구형 진입점.
8. 보류 상태이상 문서의 typed Stock 전제.

## TDD 상태

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
initial_red_test_commit: fc9134598bc3ffb427d6801074eba9ef9c2df25f
ci_connection_commit: 64ca7465f5e5624be2e8e001f97dbe70d5131ef1
initial_red_workflow_run: 30925666145
initial_red_result: 6_TESTS_3_FAILURES_3_ERRORS_EXPECTED
focused_green_workflow_run: 30927476468
capacity_red_workflow_run: 30928418370
entrypoint_red_workflow_run: 30928799903
charge_lifecycle_red_workflow_run: 30929106014
latest_green_before_final_sync: 30929333702
current_phase: FINAL_EXACT_HEAD_REGRESSION_AND_USER_SPEC_REVIEW
```

최초 CI가 새 테스트 모듈을 호출하지 않아 잘못된 PASS가 발생했다. 실행 경로를 추적해 workflow에 테스트를 연결한 뒤 예상 RED를 확인했다. 이후 용량·진입점·충전 생명주기 충돌마다 테스트를 먼저 추가해 RED를 관찰하고 최소 문서 계약으로 GREEN을 복구했다.

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
3. 미해결 Review Thread 0 확인.
4. 사용자에게 두 승인 Spec과 Vocabulary 제안 검토 요청.
5. 승인 후 `writing-plans`로 구현 계획 작성.

PR #61은 Draft이고 병합 권한이 없다.
