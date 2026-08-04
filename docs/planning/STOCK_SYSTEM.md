# 주문 글자 보관함·Stock 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: USER_APPROVED_PENDING_MERGE_RESPONSIBILITY_SOURCE
decision_id: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
partially_supersedes: GM-3X3-CIRCUIT-STOCK-FOCUS-01
updated_at: 2026-08-05T00:31+09:00
checkpoint_pull_request: 61
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 시스템 약속

```text
보관함
= 직접 그려 미리 저장한 특정 글자 재고
= 저장된 glyph_id에만 사용 가능

Stock
= 습득한 핵심 단어·보조 단어 중 원하는 글자 노드 1개를 즉시 배치하는 범용 자원
```

```yaml
vault_contract: EXACT_GLYPH_VAULT
stock_contract: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
target_and_edge_cost: TARGET_AND_EDGE_COST_ZERO
spell_commit: SPELL_COMMIT_USES_MANA
completed_spell_stock: COMPLETED_SPELL_STOCK_PROHIBITED
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
resource_source_rule: EXPLICIT_SOURCE_SELECTION
```

완성 주문 Stock은 존재하지 않는다. 알려진 주문도 3×3 회로에서 글자·대상·연결을 구성하고 Commit한다.

## 보관함

```yaml
unit: ONE_EXACT_GLYPH_NODE_PLACEMENT
key: glyph_id
conversion: prohibited
source: SUCCESSFUL_SCRIBING
shared_with_stock: false
```

예:

```yaml
vault:
  열: 2
  흐름: 1
  보호: 0
```

`열` 보관함은 `열` 노드에만 사용할 수 있다. 다른 글자나 범용 Stock으로 전환할 수 없다.

## 범용 Stock

```yaml
unit: ONE_LEARNED_MAIN_OR_SUPPORT_GLYPH_NODE_PLACEMENT
selection_time: NODE_PLACEMENT
unlearned_glyph: prohibited
target_node_cost: 0
connection_edge_cost: 0
```

Stock 1개는 사용 시점에 습득한 핵심 단어 또는 보조 단어 하나로 결정된다. 대상 키워드와 연결선에는 사용할 수 없다.

## 출처 선택과 예약

글자 노드 하나는 정확히 하나의 출처를 예약한다.

```yaml
sources:
  - UNIVERSAL_STOCK
  - MATCHING_VAULT_ENTRY
source_selection: EXPLICIT_SOURCE_SELECTION
automatic_priority: prohibited
```

```text
글자 선택
→ 사용 가능한 [보관함: 해당 글자]와 [Stock] 표시
→ 플레이어가 출처 선택
→ 해당 출처 1개 예약
→ 노드 배치

노드 이동
→ 예약 유지

글자 또는 출처 교체
→ 이전 예약 해제 후 새 출처 예약

노드 제거·회로 취소
→ 예약 해제

Commit 성공
→ 예약 자원 + 주문 마나 + 결과를 같은 Transaction ID로 원자 처리

Commit 실패·대상 취소·시스템 오류
→ 자원·마나 미소비
```

보관함과 Stock의 효과·위력·마나 효율은 동일하다. 차이는 준비 방식과 선택 가능 범위뿐이다.

## 자연충전

```yaml
output: UNIVERSAL_GLYPH_STOCK_PLUS_1
base_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
clock: ACTIVE_PRESSURE
summon_support: INTEGER_REMAINING_SECONDS_REDUCTION
offline_charge: false
vault_output: prohibited
```

- 자연충전은 글자를 미리 지정하지 않는다.
- 완료 시 범용 Stock이 1 증가한다.
- Pause·System Resolve·Focus loss·Background·Save/Load에서는 진행하지 않는다.
- 소환수는 현재 Stock 충전의 남은 시간만 줄인다.

## 집중 필사

```yaml
state_id: STATE_FOCUS_SCRIBE
player_label: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
successful_gain: FOCUS_SCRIBE_WRITES_TO_VAULT
vault_capacity_reservation_on_entry: 1
full_pause: false
```

### 진입

```text
필사할 습득 글자 선택
→ 보관함 빈 슬롯 1칸 예약
→ 집중 필사 시작
```

보관함 여유가 없거나 마나가 0이면 시작할 수 없다.

### 성공

```text
선택 glyph_id와 인식 glyph_id 일치
→ 예약한 보관함 슬롯에 같은 glyph_id +1
→ vault_generation_event_id 기록
```

### 중단

- 수동 취소.
- 인식 실패.
- 실제 HP 감소를 동반한 직접 피해.
- 행동 불가 제어 상태.
- 마나 0.
- Focus loss·Background.

중단 시 미완성 획과 보관함 예약을 폐기한다. 이미 소모한 마나와 흐른 시간은 반환하지 않는다.

## 시간계 경계

- 적·환경은 `0.25배 TEST` Active Pressure로 계속 진행한다.
- 필사 마나 소모는 실제 시간 기준이다.
- 자연충전과 소환수 주기는 Active Pressure 기준이다.
- 필사는 완전 Pause도, 범용 Stock과 보관함의 동시 가속도 아니다.

## 입력·접근성

- 범용 Stock 선택이 즉응형 기본 입력이다.
- 보관함은 사전 준비와 직접 필사의 결과다.
- 직접 그리기 없이 자연충전 Stock만으로 기본 전투를 수행할 수 있어야 한다.
- 가이드 추적·스냅·획 순서 보정도 성공 시 같은 보관함 글자 1개를 지급한다.
- 그림 정확도는 주문 위력·효율·보관함 지급량 보너스를 주지 않는다.
- 문양 아이콘은 텍스트 이름과 역할 아이콘을 함께 제공한다.

## 문양 계약

```yaml
input_glyph:
  preferred_strokes: 1_to_3
  advanced_max_strokes: 4
  contract: SIMPLE_DISTINCT_SEMANTIC_SILHOUETTE
ornamented_glyph:
  base_silhouette: SAME_AS_INPUT
  recognition_input: prohibited
```

핵심 단어는 현상, 보조 단어는 방향·작동 방식을 단순한 실루엣으로 보여준다. 장식 원·룬·광원은 표시용이며 실제 인식 획에 포함하지 않는다.

## Save·Resume

저장 필드:

- 범용 Stock 보유·예약 수량과 충전 진행도.
- 보관함 슬롯별 `glyph_id`와 AVAILABLE/RESERVED 상태.
- 노드별 예약 출처와 Transaction ID.
- 집중 필사 상태·선택 `glyph_id`·예약 보관함 슬롯.
- 적용 완료 Transaction/Event ID.

Background 복귀로 Stock이나 보관함을 소급 생성하지 않는다. 집중 필사는 Focus loss에서 종료하고 부분 획을 저장하지 않는다.

## 금지

```text
COMPLETED_SPELL_ONE_TAP_STOCK
STOCK_CASTS_WITHOUT_SPELL_MANA
VAULT_GLYPH_CONVERSION
UNLEARNED_GLYPH_FROM_STOCK
AUTOMATIC_RESOURCE_SOURCE_PRIORITY
FULL_PAUSE_DURING_FOCUS_SCRIBE
DRAWING_POWER_BONUS
DRAWING_REQUIRED_FOR_BASIC_COMBAT
TARGET_OR_EDGE_STOCK_COST
PASSIVE_CHARGE_REAL_TIME_ACCELERATION_DURING_FOCUS
```

## TDD 구현 계약

제품 코드보다 먼저 다음 실패 테스트를 작성한다.

1. Stock은 습득한 핵심·보조 글자 중 원하는 하나를 배치한다.
2. 보관함은 일치하는 `glyph_id`에만 사용된다.
3. 둘 다 가능할 때 출처를 명시적으로 선택한다.
4. 취소는 예약을 해제한다.
5. Commit은 예약 자원·마나·결과를 원자 처리한다.
6. 필사는 보관함을, 자연충전은 범용 Stock을 증가시킨다.
7. 대상·연결선 비용과 완성 주문 Stock 경로는 존재하지 않는다.

## 연결 정본

- 승인: `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- 상세 설계: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 벤치마크: `docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`.
- 회로: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 기존 승인: `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md` `[부분 대체됨]`.
- 상태 색인: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.
