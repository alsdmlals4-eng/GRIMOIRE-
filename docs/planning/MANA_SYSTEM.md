# Spell 마나 시스템 — 현재 방향

## 문서 상태

```yaml
status: ACTIVE_DIRECTION_NUMERIC_TUNING_DEFERRED
decision_alignment: GM-3X3-CIRCUIT-STOCK-FOCUS-01
updated_at: 2026-08-04T09:37+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

과거 `완성 주문 Stock은 마나를 쓰지 않는다`는 계약은 폐기한다. 현재 Stock은 글자 입력만 대체하며 주문 실행 자원이 아니다.

## 자원 역할

```text
글자 Stock
= 숙련 글자 노드의 반복 입력 대체

마나
= 완성된 주문 회로를 세계에 실행하는 에너지

집중 필사
= 실제 시간 기준 마나를 소비해 같은 글자 Stock 보충
```

## 주문 Commit

```text
3×3 회로 유효성 확인
→ 예약된 글자 Stock 확인
→ 주문 마나 비용 확인
→ Stock 소비 + 마나 소비 + 결과 적용
→ 같은 Transaction ID로 Exactly-once 처리
```

- Stock으로 배치한 글자와 직접 교육 과정에서 작성한 글자는 동일한 회로 효과와 마나 비용을 가진다.
- 편의성·접근성 입력에 위력·마나 효율 페널티를 주지 않는다.
- Commit 실패·대상 취소·시스템 오류에서는 마나와 Stock을 소비하지 않는다.
- 대상 노드와 연결선 자체에는 Stock 비용이 없지만 주문 효과·범위·대상 수는 마나 비용에 영향을 줄 수 있다.

## 마나 비용 방향

정확한 공식은 전투 Tuning Decision으로 보류한다. 현재는 다음 요인만 후보로 유지한다.

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
  - CELL_DISTANCE
  - LINE_LENGTH
  - TARGET_NODE_UI_COUNT_ALONE
```

보조 글자가 많다고 무조건 피해량만 커지지 않으며, 기능·범위·지속·안정·효율에 따라 비용과 이득이 달라진다.

## 기본 회복

- 전투 중 느린 자동 회복을 최소 복구 안전망 후보로 유지한다.
- 자동 회복만 기다리는 행동이 최적이 되지 않게 한다.
- 마나 0에서도 장시간 행동 불능이 되지 않는 복구 경로가 필요하다.
- 실제 속도·최저 회복 보장·전투 종료 회복은 Runtime Tuning 전까지 미확정이다.

## 플레이 행동 보상

방어·반격·약점 활용·주문 연계·소환수 동조에 마나 회복 또는 비용 절감 보상을 줄 수 있으나 별도 Tuning 전 확정하지 않는다.

그림 정확도는 마나 환급·위력·Stock 추가 지급의 기본 보상이 아니다.

## 집중 필사

```yaml
mana_drain_per_real_second: 1_TEST_VALUE
active_pressure_scale: 0.25_TEST_VALUE
mana_zero: EXIT_FOCUS_SCRIBE
refund_on_cancel_or_interrupt: 0
```

- 필사 마나는 실제 시간 기준으로 감소한다.
- 중단·실패해도 이미 소비한 마나는 반환하지 않는다.
- 성공하면 같은 글자 Stock 1개만 얻는다.
- 필사는 마나 회복 수단이 아니다.

## 마나 회복 주문

마나 회복·흡수·효율 글자는 향후 주문 글자 후보로 남길 수 있다. 다만 다음을 금지한다.

- 무비용 무한 마나 회복.
- 마나 회복 주문과 집중 필사로 Stock·마나를 동시에 무한 증식.
- 쉬운 필사 반복이 공격·방어보다 항상 우세한 순환.

구체 글자·비율·대상 규칙은 별도 Decision으로 승인한다.

## UI

- 현재/최대 마나.
- 회로 예상 마나 비용.
- 집중 필사 초당 마나 소모.
- Commit 후 예상 잔여 마나.
- 마나 부족과 Stock 부족을 서로 다른 이유로 표시.

## 금지

```text
STOCK_CASTS_WITHOUT_SPELL_MANA = PROHIBITED
INPUT_MODE_MANA_PENALTY = PROHIBITED
DRAWING_ACCURACY_MANA_BONUS = PROHIBITED
FOCUS_SCRIBE_MANA_RECOVERY = PROHIBITED
CELL_DISTANCE_MANA_COST = PROHIBITED
```
