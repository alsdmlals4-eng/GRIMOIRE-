# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/glyph-vocabulary-recognition-poc
working_pull_request: 63
platform: MOBILE_LANDSCAPE_FIXED_PC_LATER
product_stage: DEMO_FIRST_VERTICAL_SLICE
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
source_product_commit: ec947f232b533d5a2acac20683287080c34a811f
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
```

## 현재 작업 권위

`CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md`와 `CANON_STATUS_INDEX_2026-08-05.md`가 현재 Runtime 상태를 설명한다. 2026-08-04 상태 인덱스와 PR #61 구현 계획 완료 문구는 `[이력]`이며 현재 작업 지시로 사용하지 않는다.

## 플레이어 약속

> 조사로 상황을 이해하고 무엇을 지킬지 결정한 뒤, 글자·대상·3×3 회로로 의도를 구현하고 결과와 대가를 책임진다.

```text
SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE
조사 → 의미 선택 → 회로 → Preview → Commit → 변화·대가 → 복기
```

## 핵심 시스템

```yaml
circuit_grid: 3x3
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
```

상황 조사와 의미 선택, 회로 구성, Preview/Commit, 결과·대가·Grimoire 기록이 핵심이다.

## 보조 시스템

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
resource_source: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
recognition_runtime: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
recognition_success_output: EXACT_GLYPH_VAULT_ONLY
recognition_creates_universal_stock: false
```

Recognition과 Vault·Stock은 핵심 판단을 대신하지 않는다. `RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN`, `EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS`.

## 완료·미완료

- PR #62 Resource Foundation: 자동화 PASS, Draft·미병합.
- PR #63 Recognition: 자동화 PASS, Draft·미병합.
- 합성 Fixture: 승인된 오인식 0, 증거 범위 `SYNTHETIC_FIXTURES_ONLY`.
- 실제 모바일·좌우손·의미 이해·필사 피로·전체 루프: `NOT_RUN`.
- 7종 이상 Runtime 확대와 PR 병합: `BLOCKED / NOT_AUTHORIZED`.

## 다음 우선순위

1. PR #63 정본·CI·Sheet exact-head 마감.
2. 사람·실기기 검증 범위를 GrillMe로 승인.
3. 인식 단독 진단과 전체 의미 회로 검증을 구분한 프로토콜 작성.
4. 검토 완료 후에만 필요한 이미지·애니메이션·후속 Codex 작업으로 이동.

## 금지

낮은 확신 자동 확정, 선택 글자 불일치 저장, Recognition 성공으로 Universal Stock 생성, 완성 주문 Stock, 사람 검증 전 7종 이상 확대, 합성 증거를 사람 품질 PASS로 표현, 병합 승인 없는 Ready/merge.
