# GM-GLYPH-VAULT-UNIVERSAL-STOCK-01 — 보관함·범용 Stock 승인

## 승인 상태

```yaml
decision_id: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
status: USER_APPROVED_PENDING_MERGE_DESIGN_REVIEW
approved_at: 2026-08-05T00:31+09:00
approval_source: conversation_user_explicit_approval
counter_increment: true
grill_counter_after_approval: 1_of_10
checkpoint_reason: EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
checkpoint_pull_request: 61
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_validation: NOT_RUN
human_validation: NOT_RUN
```

## 결정

```text
보관함
= 플레이어가 미리 직접 그려 저장한 특정 글자 재고
= 저장한 glyph_id에만 사용 가능

Stock
= 습득한 핵심 단어·보조 단어 중 원하는 글자 노드 1개를 즉시 배치하는 범용 자원
```

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
target_and_edge_cost: TARGET_AND_EDGE_COST_ZERO
spell_commit: SPELL_COMMIT_USES_MANA
completed_spell_stock: COMPLETED_SPELL_STOCK_PROHIBITED
resource_source: EXPLICIT_SOURCE_SELECTION
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
natural_charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
```

## 부분 대체 범위

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`에서 다음 항목만 `[부분 대체됨]`이다.

- `TYPED_GLYPH_ONLY` Stock.
- 자연충전 대상이 특정 글자라는 계약.
- 집중 필사 성공 결과가 특정 글자 Stock이라는 계약.
- Stock 공용 용량과 특정 글자별 재고를 하나로 취급한 데이터 모델.

다음 항목은 유지한다.

- 3×3 인접 방향 회로.
- 메인·보조·대상 노드 문법.
- 대상과 연결선 자원 비용 0.
- 모든 주문 Commit 마나 사용.
- 완성 주문 원터치 Stock 금지.
- 집중 필사 중 완전 Pause 금지와 실제 시간 마나 소모.
- 직접 그리기에 위력 보너스 없음.

## 문양 설계

```yaml
input_glyph:
  preferred_strokes: 1_to_3
  advanced_max_strokes: 4
  goal: SIMPLE_DISTINCT_SEMANTIC_SILHOUETTE
ornamented_display_glyph:
  preserves_base_silhouette: true
  recognition_input: false
```

핵심 단어는 현상을, 보조 단어는 방향·작동 방식을 실루엣으로 보여준다. 색상만으로 역할을 구분하지 않으며 텍스트 이름과 역할 아이콘을 함께 제공한다.

## TDD 증거

```yaml
red_test: tests/test_glyph_vault_stock_governance_contract.py
red_commit: fc9134598bc3ffb427d6801074eba9ef9c2df25f
ci_connection_commit: 64ca7465f5e5624be2e8e001f97dbe70d5131ef1
red_workflow_run: 30925666145
red_result: 6_tests_3_failures_3_errors_expected_missing_contracts
```

제품 구현에서는 보관함·Stock 예약, 출처 선택, 취소, Commit 원자 처리 테스트를 코드보다 먼저 작성한다.

## 연결 문서

- 상세 설계: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 벤치마크: `docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`.
- 자원 책임 원본: `docs/planning/STOCK_SYSTEM.md`.
- 기존 3×3 승인: `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md` `[부분 대체됨]`.

## 병합 경계

이 Decision은 승인됐지만 PR #61의 설계 검토·CI·Sheet Readback이 끝나기 전 main 정본으로 병합하지 않는다. 승인 Batch는 `1/10`이며 이번 Draft는 정본 영향이 큰 변경에 대한 조기 체크포인트다.
