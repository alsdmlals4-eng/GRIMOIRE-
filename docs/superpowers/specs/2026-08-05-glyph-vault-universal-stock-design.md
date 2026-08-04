# Glyph Vault and Universal Stock Design

## Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
status: USER_APPROVED_DESIGN_DRAFT_CHECKPOINT
approved_at: 2026-08-05T00:31+09:00
supersedes:
  decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
  scope: TYPED_GLYPH_STOCK_AND_FOCUS_SCRIBE_OUTPUT_ONLY
preserves:
  - 3X3_ADJACENT_DIRECTED_NODE_CIRCUIT
  - TARGET_AND_EDGE_COST_ZERO
  - SPELL_COMMIT_USES_MANA
  - COMPLETED_SPELL_STOCK_PROHIBITED
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. Test-first contract

이 문서는 제품 구현 전에 다음 행동을 고정한다.

```yaml
required_tests_before_product_code:
  - universal_stock_can_place_any_learned_main_or_support_glyph
  - vault_entry_can_place_only_its_exact_glyph_id
  - target_and_edge_cost_zero
  - source_is_explicit_when_both_stock_and_vault_are_available
  - cancel_releases_reserved_source
  - commit_consumes_reserved_source_and_mana_atomically
  - focus_scribe_writes_exact_glyph_to_vault_not_universal_stock
  - natural_charge_increases_universal_stock_not_vault
  - completed_spell_stock_path_does_not_exist
```

Executable work uses strict `RED → GREEN → REFACTOR`. Product code cannot begin until these tests exist and fail for the expected missing behavior.

## 2. Problem

이전 정본은 `Stock = 특정 글자 재고`로 정의했다. 사용자가 글자를 미리 그려 저장하는 기능을 별도로 확정하면서 다음 충돌이 생겼다.

- 특정 글자 Stock과 보관함이 같은 역할을 한다.
- 자연충전과 직접 그리기가 같은 결과를 만들어 두 시스템의 의미가 겹친다.
- 전투 중 필요한 글자를 즉시 선택하는 편의성과 사전 준비의 전략성이 구분되지 않는다.

## 3. Considered approaches

### A. Typed glyph Stock만 유지 — 폐기

직접 그린 글자를 저장하는 보관함과 기능이 중복된다.

### B. Universal Stock만 사용하고 보관함 제거 — 폐기

그리기와 사전 준비의 의미가 사라지고 모든 대응이 동일한 범용 자원으로 평준화된다.

### C. Exact Glyph Vault + Universal Glyph Stock — 채택

```text
보관함
= 직접 그려 미리 저장한 특정 글자 재고

스톡
= 습득한 핵심 단어·보조 단어 중 원하는 글자 노드 1개를 즉시 배치하는 범용 자원
```

이 구조는 준비형 자원과 즉응형 자원을 분리하면서 3×3 회로 조합을 유지한다.

## 4. Canonical resource contract

```yaml
vault:
  contract: EXACT_GLYPH_VAULT
  unit: ONE_EXACT_GLYPH_NODE_PLACEMENT
  entry_key: glyph_id
  conversion_to_other_glyph: prohibited
  source: SUCCESSFUL_SCRIBING
  target_or_edge_use: prohibited

stock:
  contract: UNIVERSAL_GLYPH_STOCK
  unit: ONE_LEARNED_MAIN_OR_SUPPORT_GLYPH_NODE_PLACEMENT
  allowed_pool: LEARNED_MAIN_OR_SUPPORT
  target_or_edge_use: prohibited
  completed_spell_use: prohibited

shared:
  target_and_edge_cost: TARGET_AND_EDGE_COST_ZERO
  spell_commit: SPELL_COMMIT_USES_MANA
  completed_spell_stock: COMPLETED_SPELL_STOCK_PROHIBITED
```

대상 키워드와 연결선은 두 자원 모두 소비하지 않는다.

## 5. Placement source selection

글자 노드 하나는 정확히 하나의 자원 출처를 예약한다.

```yaml
placement_sources:
  - UNIVERSAL_STOCK
  - MATCHING_VAULT_ENTRY
source_rule: EXPLICIT_SOURCE_SELECTION
```

- 보관함에 같은 `glyph_id`가 없으면 보관함 출처는 표시하지 않는다.
- Stock이 없으면 Stock 출처는 비활성화한다.
- 둘 다 있으면 플레이어가 출처를 명시적으로 선택한다.
- 자동으로 보관함부터 소비하거나 Stock부터 소비하지 않는다.
- 출처 선택은 효과·마나·성능을 바꾸지 않는다.

### Reservation transaction

```text
글자 선택
→ 사용할 출처 선택
→ 해당 출처 1개 예약
→ 노드 배치

노드 이동
→ 예약 유지

글자 또는 출처 교체
→ 이전 예약 해제
→ 새 출처 예약

노드 제거·회로 취소
→ 예약 해제

Commit 성공
→ 예약 자원 + 주문 마나 + 결과를 원자 소비

Commit 실패·대상 무효·시스템 오류
→ 자원·마나 미소비
```

## 6. Natural charge

자연충전은 범용 Stock만 생산한다.

```yaml
charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
clock: ACTIVE_PRESSURE
base_seconds: TEST_VALUE
minimum_actual_seconds: TEST_VALUE
offline_charge: false
vault_output: prohibited
```

자연충전은 어떤 글자를 미리 정하지 않는다. Stock 사용 시점에 습득한 핵심·보조 글자 중 하나를 선택한다.

## 7. Focus scribing

직접 그리기는 보관함을 채우는 선택적 준비 행동이다.

```yaml
state_id: STATE_FOCUS_SCRIBE
output: FOCUS_SCRIBE_WRITES_TO_VAULT
selected_glyph_required: true
recognized_glyph_must_match_selected: true
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
full_pause: false
```

### Entry

```text
필사할 습득 글자 선택
→ 보관함 빈 슬롯 1칸 예약
→ 집중 필사 진입
```

### Success

```text
선택 glyph_id와 인식 glyph_id 일치
→ 예약한 보관함 슬롯에 해당 glyph_id +1
```

### Interrupt

- 수동 취소
- 인식 실패
- 실제 HP 감소를 동반한 직접 피해
- 행동 불가 상태
- 마나 0
- Focus loss·Background

중단 시 부분 획과 보관함 예약을 폐기한다. 이미 흐른 시간과 소모한 마나는 반환하지 않는다.

## 8. Glyph visual and input grammar

입력 문양과 표시 문양을 분리한다.

```yaml
input_glyph:
  purpose: RECOGNITION_AND_PLAYER_DRAWING
  preferred_strokes: 1_to_3
  advanced_max_strokes: 4
  required: SIMPLE_DISTINCT_SEMANTIC_SILHOUETTE

ornamented_glyph:
  purpose: UI_DISPLAY_EFFECT_AND_WORLD_FX
  base_shape: SAME_AS_INPUT_GLYPH
  additions:
    - outer_ring
    - runic_ticks
    - glow
    - material_fx
  recognition_input: prohibited
```

### 핵심 단어

- 현상 자체가 중심 실루엣으로 읽혀야 한다.
- 예: `열`은 태양·불꽃의 방사, `보호`는 감싸는 방패, `냉기`는 결정.

### 보조 단어

- 작동 방식이 방향과 구조로 읽혀야 한다.
- 예: `흐름`은 이어지는 곡선, `집중`은 수렴, `분산`은 바깥 분기, `고정`은 닫힌 고리.

### 구별 기준

각 문양은 다음 중 최소 두 속성에서 다른 문양과 명확히 달라야 한다.

- 열린 형태 / 닫힌 형태
- 직선 / 곡선
- 분기 수
- 대칭축
- 시작·종료 방향
- 중심점 유무

색상만으로 글자 역할이나 의미를 구분하지 않는다.

## 9. Mobile UI contract

왼쪽 패널은 다음 순서로 구성한다.

```text
컴팩트 상태바
→ 글자 Tray 탭 [핵심 단어 | 보조 단어]
→ 습득 글자 목록
→ 보관함: 미리 필사한 특정 글자 아이콘
→ Stock: 범용 수량
```

글자 선택 후 회로판에 놓을 때 출처를 표시한다.

```text
[보관함: 열 1]   [Stock: 2]
```

- 글자와 버튼의 터치 영역은 플랫폼 최소 권장 크기를 따른다.
- 문양 아이콘에는 텍스트 이름·역할 아이콘을 함께 제공한다.
- 보관함과 Stock은 모양·라벨·배치로 구분하고 색상에만 의존하지 않는다.
- 오른쪽 패널은 상황 설명·키워드/대상·Preview를 유지한다.

## 10. Data model

```yaml
universal_stock:
  current: int
  reserved: int
  capacity: TEST_VALUE
  natural_charge_progress: float

vault:
  slots:
    - slot_id: string
      glyph_id: string | null
      state: EMPTY | AVAILABLE | RESERVED
  capacity: TEST_VALUE

node_resource_reservation:
  node_id: string
  source: UNIVERSAL_STOCK | VAULT
  vault_slot_id: string | null
  glyph_id: string
  transaction_id: string
```

## 11. Accessibility

- 직접 그리기 없이 자연충전 Stock만으로 기본 전투를 수행할 수 있어야 한다.
- 가이드 선·스냅·획 순서 보정은 허용하며 동일한 보관함 글자 1개를 지급한다.
- 그림 정확도는 위력·마나 효율·보관함 지급량을 올리지 않는다.
- 입력 실패는 손실 이유와 다시 시도할 경로를 텍스트·아이콘으로 보여준다.
- 글자를 그리는 제스처 외에 보정·대체 입력을 제공한다.

## 12. Adversarial guards

```text
Universal Stock가 모든 계획을 무력화
→ 낮은 TEST 용량·충전 속도 검증 + 보관함 준비의 별도 가치

보관함과 Stock이 다시 같은 자원처럼 보임
→ 고정 glyph_id 아이콘 대 범용 결정형 아이콘 + 명시적 출처 선택

그리기가 필수 최적 행동
→ Stock 자연충전만으로 기본 전투 가능 + 그림 위력 보너스 금지

출처 자동 소비로 의도하지 않은 자원 손실
→ EXPLICIT_SOURCE_SELECTION

보관함 글자를 다른 글자로 전환
→ EXACT_GLYPH_VAULT conversion prohibited

완성 주문 단축 경로 재등장
→ COMPLETED_SPELL_STOCK_PROHIBITED
```

## 13. Acceptance criteria

- `보관함: 열`은 `열` 노드에만 사용할 수 있다.
- Universal Stock 1개는 습득한 핵심 또는 보조 글자 하나에 사용할 수 있다.
- 미습득 글자는 Stock으로 선택할 수 없다.
- 대상 노드와 연결선은 보관함·Stock을 사용하지 않는다.
- 보관함과 Stock이 모두 가능하면 출처를 직접 고른다.
- 집중 필사 성공은 Universal Stock이 아니라 해당 글자 보관함을 1 증가시킨다.
- 자연충전은 보관함이 아니라 Universal Stock을 1 증가시킨다.
- 취소·실패에서는 예약 자원과 마나가 소비되지 않는다.
- Commit 성공에서 예약 자원·마나·결과가 원자 처리된다.
- 문양은 기본 입력형과 장식 표시형이 같은 의미 실루엣을 공유한다.
- 완성 주문 원터치 자원은 존재하지 않는다.

모든 용량·충전·시간·마나 수치는 Runtime·사람 검증 전 `TEST_VALUE`다.
