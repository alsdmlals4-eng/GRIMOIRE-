# GRIMOIRE Planning Index — 현재 경로

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
working_pull_request: 61
grill_counter: 2_of_10
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
related_approved_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
current_gate: USER_SPEC_REVIEW_PENDING
merge_authorized: false
product_implementation: NOT_STARTED
```

이 디렉터리의 과거 Gate 2·합성 검토 문서는 현재 정본을 대체하지 않는다. 현재 작업 차단점은 `ART-STYLE-01`이 아니라 **PR #61의 자원·운영 Spec 사용자 검토와 후속 구현 계획**이다.

## 현재 읽기 순서

1. `../../AGENTS.md`.
2. `../../START_HERE.md`.
3. `../ACTIVE_CONTEXT.md`.
4. `../DEVELOPMENT_GATES.md`.
5. `CANON_STATUS_INDEX_2026-08-04.md`.
6. `CURRENT_CONFIRMED_DECISIONS.md`.
7. `GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
8. `../superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
9. `WORKFLOW_BENCHMARK_TDD_CHECKPOINT_01_APPROVAL_2026-08-05.md`.
10. `../superpowers/specs/2026-08-05-benchmark-tdd-checkpoint-governance-design.md`.
11. `../superpowers/specs/2026-08-05-glyph-vocabulary-v1-proposal.md` `[사용자 검토 제안]`.
12. `GRILL_ME_BATCH_MERGE_STATE.json`.

## 현재 자원 계약

```text
보관함 = 직접 그려 저장한 특정 글자만 사용
범용 Stock = 습득한 핵심·보조 글자 중 원하는 하나를 사용 시점에 선택
```

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
source_selection: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_PLUS_1
focus_scribe: EXACT_GLYPH_VAULT_PLUS_1
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

## 현재 작업 운영 계약

```text
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
SOURCE_VERSION_LIMIT_REQUIRED
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

승인 Decision은 최대 10건까지 Batch로 누적한다. 고위험 충돌·세션 종료/컨텍스트 손실 위험·큰 정본 영향에서는 Draft 조기 체크포인트를 허용하지만 자동 병합이나 counter 초기화를 의미하지 않는다.

## 현재 문양 작업

- 입력 문양은 1~3획 권장, 고급 후보 최대 4획.
- 장식 표시형은 같은 기본 실루엣을 유지한다.
- 핵심 10·보조 10 후보와 Slice 우선 6종은 `2026-08-05-glyph-vocabulary-v1-proposal.md`에 있다.
- Vocabulary는 사용자 승인 전 Decision으로 집계하지 않는다.
- 사람 인지·혼동 행렬·모바일 입력 검증은 `NOT_RUN`이다.

## 과거 마법 작성·인식 연구

다음 자료는 참고·이력이며 현재 자원 정본이 아니다.

| 질문 | 문서 | 상태 |
|---|---|---|
| 입력·인식·의미 설계 책임 | `GATE_2_MAGIC_WRITING_INPUT_EVIDENCE_PACK_2026-07-29.md` | `[부분 참고 / NOT_CANON]` |
| Android 저충실도 세션 준비 | `../superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md` | `[보류 / HUMAN_AND_DEVICE_NOT_RUN]` |
| 합성 테스터 적용 구조 | `GATE_2_SYNTHETIC_TESTER_STRUCTURE_ANALYSIS_2026-07-29.md` | `[이력 / T6_AI_INFERENCE]` |
| 합성 검토 보고 | `GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md` | `[이력 / HUMAN_NOT_RUN]` |

합성 보고서는 실제 사람 행동·재미·조작감·인식 성능을 증명하지 않는다.

## TDD 현재 증거

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
initial_red_workflow: 30925666145
capacity_red_workflow: 30928418370
entrypoint_red_workflow: 30928799903
focused_green_before_latest_hardening: 30927476468
latest_exact_head_green: PENDING
```

## 다음 Gate

```text
최신 exact-head CI
→ 적대적 P0/P1 0
→ Review Thread 확인
→ 사용자 Spec·Vocabulary 검토
→ writing-plans 기반 구현 계획
```

PR #61은 Draft이며 병합 권한이 없다.
