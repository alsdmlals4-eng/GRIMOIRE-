# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/glyph-vault-stock-governance-design
working_pull_request: 61
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
grill_counter: 2_of_10
pending_decisions: 2
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
merge_authorized: false
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 정본 복원

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 새 자원/운영 승인·Spec → 3×3 회로 문서 → Frostbloom → Batch → PR #61`.

## 플레이어 약속

> 조사로 상황을 이해하고 의도를 정한 뒤, 글자·대상·3×3 회로로 주문을 구현하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

## 회로

```yaml
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
skip_connection: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

Slice는 `열` 메인, `흐름` 연결 보조, `집중·분산` 보조를 사용한다. 보이고 식별된 전투 참가자는 자동 대상이며 환경·장치·숨은 약점은 조사 후 열린다.

## 보관함·Stock·필사

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
source_selection: EXPLICIT_SOURCE_SELECTION
natural_charge: UNIVERSAL_GLYPH_STOCK_PLUS_1
focus_scribe_gain: EXACT_GLYPH_VAULT_PLUS_1
target_and_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
```

보관함은 직접 그린 특정 글자만 사용한다. Stock은 사용 시점에 습득한 핵심·보조 글자 중 하나를 고른다. 둘 다 가능하면 플레이어가 출처를 명시적으로 선택한다.

## 문양

- 입력형: 단순하고 의미가 읽히는 1~3획 후보, 고급 최대 4획.
- 표시형: 입력형 실루엣을 유지하고 외곽 룬·광원만 추가.
- 핵심 단어: 무엇을 일으키는가.
- 보조 단어: 어떻게 작동하는가.
- 색상 외 이름·역할 아이콘·형태로 구분.

## 작업 운영

```yaml
benchmark: BENCHMARK_AND_PRO_COMPARISON_REQUIRED
evidence: SOURCE_VERSION_TRANSFER_LIMIT_REQUIRED
executable_work: STRICT_RED_GREEN_REFACTOR
non_executable_work: TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
max_approved_decisions_per_batch: 10
early_checkpoint:
  - HIGH_RISK_CONFLICT
  - SESSION_END_OR_CONTEXT_LOSS
  - MAJOR_CANON_IMPACT
```

PR #61의 contract test는 CI 실행 경로 연결 후 예상된 `3 failures + 3 errors` RED를 확인했다. 설계 문서·정본·Sheet를 최소 GREEN 범위로 채우는 중이다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 외부 확산만 막는 한 가지 주문 예시를 보여주며 내부 목표를 대신 해결하지 않는다. 교수 방식과의 일치는 채점 기준이 아니다.

## 다음 우선순위

1. PR #61 Spec·정본·Sheet GREEN 및 적대적 검토.
2. 사용자 Spec 검토.
3. 승인 후 구현 계획 작성.
4. 문양 1차 세트·3×3 Mobile Landscape Wireframe 수용 테스트.
5. 집중 필사 Overlay와 Frostbloom UX Map.

## 금지

완성 주문 원터치 Stock, Stock 주문 무마나 실행, 보관함 글자 변환, 미습득 글자 Stock 선택, 자원 출처 자동 소비, 집중 필사 완전 Pause, 그림 위력 보너스, 설계도 자동 대상·자동 Commit, 교수 예시 정답화, 숫자 성공률 Preview, 검증 없는 Runtime PASS.
