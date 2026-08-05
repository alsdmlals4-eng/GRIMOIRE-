# GRIMOIRE 현재 확정 결정 스냅샷

## 현재 상태

```yaml
status: USER_APPROVED_CANON_WITH_AUTOMATED_RESOURCE_AND_RECOGNITION_POC
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
pending_decisions: 3
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
merge_authorized: false
```

## 승인 Decision 3종

1. `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`
   - 보관함은 직접 그려 저장한 특정 글자 전용.
   - Stock은 습득한 핵심·보조 글자 중 사용 시점에 하나를 고르는 범용 자원.
   - 보관함과 Stock 용량은 별도이며 자원 출처는 명시적으로 선택.
   - 완성 주문 Stock 금지, 주문 Commit은 마나 사용.

2. `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01`
   - 의미 있는 작업은 벤치마크·현업 비교와 전이 한계 기록.
   - 실행 변경은 strict `RED → GREEN → REFACTOR`.
   - 비실행 작업은 수용·거부 사례와 적대적 검토를 먼저 작성.
   - 승인 Batch 최대 10건, 고위험·세션 종료·큰 정본 영향은 조기 Draft 가능.

3. `GM-GLYPH-VOCABULARY-V1-01`
   - 의미 Registry는 Main 10·Support 10.
   - Runtime Slice는 `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST` 6종.
   - 낮은 확신 자동 확정 금지.
   - 사람 인지·손가락·실기기 검증 전 7종 이상 확대 금지.

새 승인은 없으므로 Grill 카운터는 `3/10`이다.

## 핵심 재미와 시스템 경계

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE
조사 → 의미 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

핵심 시스템은 상황 조사, 의미 선택, 3×3 방향 회로, Preview/Commit, 결과·대가·Grimoire 기록이다. Recognition, Exact Glyph Vault, Universal Glyph Stock은 입력·자원 보조 시스템이며 핵심 판단을 우회하지 않는다.

## 3×3 주문 계약

```yaml
grid: 3x3
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

## 구현 결과

### PR #62 — Resource Foundation

`VaultInventory`, `UniversalStockPool`, 예약 Ledger, 원자적 Commit, 마나, 저장·복원, 읽기 전용 View Model과 Scope Checker가 자동화 Gate를 통과했다. PR은 Open·Draft·미병합이다.

### PR #63 — Vocabulary Recognition

- 의미 20종, Runtime 인식·템플릿 6종.
- `$1` 기준선과 최대 48개 획 순서·방향 변형을 제한하는 `$N`.
- 낮은 확신·혼동·stale revision·선택/인식 불일치 차단.
- 성공 시 Exact Glyph Vault에만 저장, Universal Stock 생성 금지.
- 합성 Fixture 승인 결과에서 오인식 0.
- 기존 제품 검증 `19 suites / 913 assertions / 0 failures`.

증거는 `SYNTHETIC_FIXTURES_ONLY`이며 사람·실기기·전체 루프 품질은 `NOT_RUN`이다.

## 현재 Stop Gate

```text
RESOURCE FOUNDATION AUTOMATED = PASS
GLYPH RECOGNITION AUTOMATED = PASS
HUMAN DEVICE = NOT_RUN
HUMAN END TO END CORE LOOP = NOT_RUN
RUNTIME 7 PLUS = BLOCKED
PR 62 AND 63 MERGE = NOT_AUTHORIZED
```

## Base 계약 상태

프로젝트 pin `c987647d...`와 관측 Base main `339a48be...` 사이 54커밋 차이는 별도 TDD 마이그레이션으로 분리한다. PR #63에서 단순 SHA 교체하지 않는다.

## 다음 결정

사람·실기기 검증을 인식 단독, 전체 Vertical Slice, 또는 단계형 혼합 중 어디까지 한 배치로 정의할지 `GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01` GrillMe 승인이 필요하다. 승인 전 후속 이미지·애니메이션·Codex 범위를 확정하지 않는다.

모든 Prototype 수치는 명시적으로 `TEST_VALUE`다.
