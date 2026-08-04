# GR-SYNC-20260805-02 — Glyph Vocabulary·Implementation Plans

```yaml
sync_id: GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS
status: APPROVED_DRAFT_CHECKPOINT_SHEET_READBACK_PASS
created_at: 2026-08-05T07:52+09:00
repository: alsdmlals4-eng/GRIMOIRE-
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
working_branch: agent/glyph-vault-stock-governance-design
working_pull_request: 61
decision_ids:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
merge_required: false
merge_authorized: false
checkpoint_reason:
  - HIGH_RISK_CONFLICT
  - MAJOR_CANON_IMPACT
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인 반영

사용자의 `승인`에 따라 다음을 반영했다.

1. 자원 Spec 검토 완료.
2. 벤치마크·TDD·체크포인트 운영 Spec 검토 완료.
3. Vocabulary v1을 새 Decision으로 승인.
4. 승인 Batch를 `2/10`에서 `3/10`으로 증가.
5. Resource Foundation POC와 Vocabulary Recognition POC 구현 계획 작성.

## Vocabulary v1

```yaml
main_glyphs: 10
support_glyphs: 10
slice_runtime_glyphs:
  - HEAT
  - PROTECT
  - FLOW
  - FOCUS
  - DISPERSE
  - BURST
input_strokes: 1_to_3
advanced_candidate_max_strokes: 4
ornament_is_recognition_input: false
low_confidence: LOW_CONFIDENCE_REQUIRES_RETRY
expansion_gate: HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

20종의 의미 범위는 승인됐지만 Runtime 인식은 6종으로 제한한다. 실제 사람 의미 인지·손가락 조작성·피로·혼동 검증 전 확대하지 않는다.

## 구현 계획

### Resource Foundation POC

`docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`

```text
VaultInventory
UniversalStockPool
ResourceReservationLedger
UniversalStockCharge
AtomicSpellCommitService
Save/Resume
Read-only UI View Model
CI·Evidence·Stop Gate
```

### Vocabulary Recognition POC

`docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`

```text
GlyphDefinition
GlyphTemplateRepository
DollarOneRecognizer
bounded DollarNRecognizer
RecognitionCandidate
confidence·stale·mismatch guards
confusion_matrix
Accessible Writing View Model
Human·Device Stop Gate
```

Resource Stop Gate를 먼저 통과한 뒤 Recognition 계획을 실행한다.

## TDD 증거

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
spec_review_and_plan_red_commit: f9476ffd3bdfa5f67183cf28606a3663b7809a82
spec_review_and_plan_red_workflow: 30958182618
red_result: EXPECTED_FAILURE_MISSING_VOCABULARY_APPROVAL_PLANS_AND_BATCH_3
planning_and_adversarial_green_before_final_authority_update: 30958977292
godot_toolchain_green_before_final_authority_update: 30958977145
final_exact_head_validation: RECHECK_PENDING
```

실행 가능한 제품 코드는 아직 작성하지 않았다. 이번 TDD는 문서·정본·계획 계약을 보호하는 자동 테스트이며, 실제 자원·인식 동작 TDD는 두 구현 계획에서 시작한다.

## Google Sheet Readback

```yaml
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
write_status: PASS
readback_status: PASS
ranges:
  - 00_프로젝트_허브_H2_K2
  - 01_작업순서_H48_J48
  - 02_현재_확정결정_A55_J57
  - 04_누락_충돌_감사_E58_H58
  - 30_데모범위_품질기준_제작기반_G22_H22
  - 60_UX_UI_접근성_A26_J27
  - 99_변경이력_A72_H72
```

GitHub와 Sheet는 같은 세 Decision ID, PR #61, Grill `3/10`, 구현 계획 준비, 병합 미승인 상태를 가리킨다.

## 적대적 경계

- 20종 승인이 곧 20종 Runtime 구현을 뜻하지 않는다.
- 자동 fixture 성공은 사람 인지·모바일 손가락 검증을 대체하지 않는다.
- `$1/$N`은 POC 기준선이며 최종 인식 기술로 확정하지 않는다.
- Resource와 Recognition 계획을 하나의 검토 없는 커밋 묶음으로 실행하지 않는다.
- 계획 작성은 제품 구현·Runtime PASS가 아니다.
- 조기 체크포인트는 병합 승인이나 Batch 초기화가 아니다.

## 다음 Gate

1. 최신 exact HEAD에서 Planning·adversarial·Godot CI 성공.
2. 미해결 Review Thread 0 확인.
3. PR #61 Draft·미병합 상태 유지.
4. Codex에서 Resource 계획부터 격리 worktree·TDD로 실행.

PR #61은 `merge_required: false`, `merge_authorized: false`다.
