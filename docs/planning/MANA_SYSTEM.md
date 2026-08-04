# Spell 마나 시스템 — 현재 방향

## 문서 상태

```yaml
status: ACTIVE_DIRECTION_NUMERIC_TUNING_DEFERRED
decision_alignment:
  - GM-3X3-CIRCUIT-STOCK-FOCUS-01
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
updated_at: 2026-08-05T00:31+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

과거 `완성 주문 Stock은 마나를 쓰지 않는다`는 계약은 폐기한다. 보관함과 범용 Stock은 글자 노드 입력만 준비하며 주문 실행 자원이 아니다.

## 자원 역할

```text
보관함
= 미리 그린 특정 글자 노드의 입력 대체

범용 Stock
= 습득한 핵심·보조 글자 중 선택한 노드의 입력 대체

마나
= 완성된 주문 회로를 세계에 실행하는 에너지

집중 필사
= 실제 시간 기준 마나를 소비해 선택한 글자의 보관함을 보충
```

## 주문 Commit

```text
3×3 회로 유효성 확인
→ 각 글자 노드의 보관함/Stock 예약 확인
→ 주문 마나 비용 확인
→ 예약 자원 소비 + 마나 소비 + 결과 적용
→ 같은 Transaction ID로 Exactly-once 처리
```

- 보관함·Stock 출처는 동일한 회로 효과와 마나 비용을 가진다.
- 편의성·접근성 입력에 위력·마나 효율 페널티를 주지 않는다.
- Commit 실패·대상 취소·시스템 오류에서는 마나와 예약 자원을 소비하지 않는다.
- 대상 노드와 연결선 자체에는 자원 비용이 없지만 주문 효과·범위·대상 수는 마나 비용에 영향을 줄 수 있다.

## 마나 비용 방향

정확한 공식은 전투 Tuning Decision으로 보류한다.

```yaml
possible_cost_drivers:
  - MAIN_GLYPH_BASE_COST
  - SUPPORT_GLYPH_FUNCTION_COST
  - OUTPUT_AND_SCOPE
  - TARGET_COUNT
  - DURATION
  - STABILITY_AND_RISK
not_cost_drivers:
  - DRAWING_ACCURACY
  - INPUT_MODE
  - RESOURCE_SOURCE_VAULT_OR_STOCK
  - CELL_DISTANCE
  - LINE_LENGTH
  - TARGET_NODE_UI_COUNT_ALONE
```

## 기본 회복

- 전투 중 느린 자동 회복을 최소 복구 안전망 후보로 유지한다.
- 자동 회복만 기다리는 행동이 최적이 되지 않게 한다.
- 마나 0에서도 장시간 행동 불능이 되지 않는 복구 경로가 필요하다.
- 실제 속도·최저 회복 보장·전투 종료 회복은 Runtime Tuning 전까지 미확정이다.

## 플레이 행동 보상

방어·반격·약점 활용·주문 연계·소환수 동조에 마나 회복 또는 비용 절감 보상을 줄 수 있으나 별도 Tuning 전 확정하지 않는다.

그림 정확도는 마나 환급·위력·보관함/Stock 추가 지급의 기본 보상이 아니다.

## 집중 필사

```yaml
mana_drain_per_real_second: 1_TEST_VALUE
active_pressure_scale: 0.25_TEST_VALUE
mana_zero: EXIT_FOCUS_SCRIBE
refund_on_cancel_or_interrupt: 0
success_output: EXACT_GLYPH_VAULT_PLUS_1
```

- 필사 마나는 실제 시간 기준으로 감소한다.
- 중단·실패해도 이미 소비한 마나는 반환하지 않는다.
- 성공하면 선택한 같은 `glyph_id`의 보관함 1개만 얻는다.
- 필사는 범용 Stock이나 마나 회복 수단이 아니다.

## 마나 회복 주문

마나 회복·흡수·효율 글자는 향후 후보로 남길 수 있다. 다음은 금지한다.

- 무비용 무한 마나 회복.
- 마나 회복 주문과 집중 필사로 보관함·Stock·마나를 동시에 무한 증식.
- 쉬운 필사 반복이 공격·방어보다 항상 우세한 순환.

## UI

- 현재/최대 마나.
- 회로 예상 마나 비용.
- 집중 필사 초당 마나 소모.
- Commit 후 예상 잔여 마나.
- 마나 부족·보관함 부족·범용 Stock 부족을 서로 다른 이유로 표시.

## 금지

```text
STOCK_CASTS_WITHOUT_SPELL_MANA = PROHIBITED
INPUT_MODE_MANA_PENALTY = PROHIBITED
RESOURCE_SOURCE_MANA_DIFFERENCE = PROHIBITED
DRAWING_ACCURACY_MANA_BONUS = PROHIBITED
FOCUS_SCRIBE_MANA_RECOVERY = PROHIBITED
CELL_DISTANCE_MANA_COST = PROHIBITED
```
