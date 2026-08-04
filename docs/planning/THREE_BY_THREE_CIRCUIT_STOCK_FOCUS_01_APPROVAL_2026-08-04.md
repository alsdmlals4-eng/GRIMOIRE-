# GM-3X3-CIRCUIT-STOCK-FOCUS-01 — 3×3 회로 승인 `[부분 대체됨]`

## 현재 상태

```yaml
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: USER_APPROVED_ACTIVE_TOPOLOGY_PARTIALLY_SUPERSEDED_RESOURCE_MODEL
original_approved_at: 2026-08-04T09:14+09:00
partial_superseding_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
partial_superseding_pull_request: 61
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

> 이 문서의 **3×3 회로·대상·마나·시간 압박 계약은 활성**이다. `TYPED_GLYPH_ONLY` Stock, 특정 글자 자연충전, 집중 필사 결과가 같은 글자 Stock이라는 범위는 새 Decision이 대체한다. 과거 자원 정의를 구현에 사용하지 않는다.

## 계속 유효한 계약

```text
글자 노드
+ 대상 키워드 노드
+ 3×3 셀 위치
+ 방향성 인접 연결
= 회로

유효 회로 Commit
= 주문
```

```yaml
grid: 3x3
main_glyph_nodes: exactly_1
support_glyph_nodes_slice: 0_to_2
target_keyword_nodes_slice: 1_to_4
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
skip_connection: prohibited
crossing_edges: prohibited
all_nodes_reachable_from_main: required
hidden_position_bonus: prohibited
slice_target_node_role: TERMINAL_LEAF
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

- 주문명은 글자 이름과 별개다.
- 위치는 연결 가능성과 분기 형태를 결정하며 숨은 수치 보너스가 없다.
- 보이고 식별된 전투 참가자는 대상 후보이고 환경·장치·숨은 약점은 조사 후 열린다.
- `[집중]`은 단일 대상·수렴, `[분산]`은 다중 대상·출력 분배 문법을 가진다.
- 설계도는 `NON_BINDING_GHOST_REFERENCE`이며 자동 대상·자동 Commit을 하지 않는다.
- Preview는 효과·위험·미해결 문제를 보여주고 숫자 성공률·결말을 공개하지 않는다.

## 새 자원 계약으로 대체된 범위

다음 과거 계약은 사용 금지다.

```text
TYPED_GLYPH_ONLY
ONE_TYPED_GLYPH_NODE_PLACEMENT_AS_STOCK
NATURAL_CHARGE_TARGETS_ONE_TYPED_GLYPH
FOCUS_SCRIBE_GIVES_SAME_GLYPH_STOCK
GENERIC_STOCK_CONVERSION_PROHIBITED
```

현재 자원 계약:

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
resource_source: EXPLICIT_SOURCE_SELECTION
natural_charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
```

- 보관함은 미리 그린 특정 글자만 사용한다.
- 범용 Stock은 습득한 핵심·보조 글자 중 원하는 하나를 사용 시점에 선택한다.
- 둘 다 가능하면 플레이어가 소비 출처를 직접 고른다.
- 대상과 연결선은 자원을 소비하지 않고 모든 주문 Commit은 마나를 사용한다.

## 집중 필사의 유지 경계

다음은 유지된다.

```yaml
state_id: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
full_pause: false
enemy_and_environment_continue: true
```

단, 성공 결과는 과거의 특정 글자 Stock이 아니라 **해당 글자 보관함 +1**이다.

## 현재 책임 원본

- 새 승인: `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- 새 자원 Spec: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 자원 책임 원본: `docs/planning/STOCK_SYSTEM.md`.
- 회로 책임 원본: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 상태 판정: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.

과거 전체 본문은 Git 이력에 보존된다. 이 파일에서 명시한 계속 유효 범위 외에는 새 Decision을 우선한다.
