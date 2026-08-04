# Spell 글자 Stock 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_ACTIVE
primary_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decision: GM-STOCK-SYSTEM-01
updated_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

연결 문서:

- 최신 승인: `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- 과거 승인 이력: `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
- 준비 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- 충전시간: `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- 직접 피해 정지: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- 상태이상: `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md`
- 회로 문법: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`

## 1. 시스템 약속

> Stock은 숙련한 특정 마법 글자 하나를 직접 그리지 않고 3×3 회로판에 노드로 배치할 수 있는 준비량이다.

```text
글자 Stock 준비·자연충전·집중 필사
→ 3×3 회로판에 글자 노드 배치
→ 대상 키워드 노드 배치
→ 노드 연결
→ 주문 Commit
```

- 주문은 항상 3×3 노드 배치와 연결을 거친다.
- 완성 주문을 원터치로 발동하는 Stock은 사용하지 않는다.
- 대상 노드와 연결선은 Stock을 소비하지 않는다.
- Stock 사용 시점·글자·대상·연결은 플레이어가 결정한다.
- 신규 글자와 미숙련 글자는 Stock으로 건너뛰지 않는다.

## 2. Stock 종류

활성 Stock 종류는 **글자 Stock 하나**로 단일화한다.

```yaml
stock_type: TYPED_GLYPH_STOCK
unit: ONE_FUNCTIONAL_GLYPH_COPY
completed_spell_stock: PROHIBITED
```

예:

```yaml
stored_glyph_stock:
  열: 2
  흐름: 1
  보호: 2
  집중: 0
  분산: 1
```

`보호 → 집중 → 카시안` 회로는 보호 Stock 1과 집중 Stock 1을 예약·소비한다. 카시안 대상 노드와 연결선은 무료다.

## 3. 공용 준비 용량

```yaml
prototype_initial_capacity: 8_TEST_VALUE
capacity_unit: TYPED_FUNCTIONAL_GLYPH_COPY
mana_reservation: NONE
stock_use_mana_cost: 0
```

- 모든 글자 Stock은 하나의 공용 용량을 공유한다.
- 글자 Stock 1개는 용량 1을 사용한다.
- 동일 글자를 여러 개 준비할 수 있다.
- 개별 글자 상한 대신 전체 용량만 사용한다.
- 집중 필사도 공용 용량을 초과해 생성할 수 없다.

## 4. 자연충전

```text
선택한 특정 글자 Stock 1회분
→ Active Pressure 10초 TEST_VALUE
→ 해당 글자 Stock +1
```

```yaml
active_charge_target_count: 1
base_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
clock_source: ACTIVE_PRESSURE
progress_persistence: PER_GLYPH
```

- 한 번에 글자 1종만 자연충전한다.
- 글자별 다음 1회분 진행도를 보존한다.
- 최대 용량에 도달해도 다른 글자로 자동 전환하지 않는다.
- Pause·System Resolve·Focus loss·Background·Save/Load에서는 기존 경계에 따라 정지한다.
- Offline catch-up은 없다.

## 5. 소환수 `[스톡]` 지원

```text
소환수 지원 주기 도달
→ 현재 지정 글자 Stock의 남은 충전시간
→ 활성 [스톡] 합계만큼 정수 초 감소
```

Prototype 기존값:

```yaml
support_cycle_seconds: 5_TEST_VALUE
main_summon_stock_stat: 1_TEST_VALUE
secondary_stock_summon_stat: 2_TEST_VALUE
slice_total_stock_stat_cap: 3_TEST_VALUE
```

- 현재 지정 글자에만 적용한다.
- 초과 감소량은 다음 Stock으로 이월하지 않는다.
- 지정 글자가 없거나 용량이 가득 차면 효과를 저장하지 않는다.
- 소환수가 충전 글자를 자동 변경하지 않는다.

## 6. 집중 필사

전투 중 직접 그리기는 주문 회로에 즉시 노드를 삽입하는 필수 입력이 아니라, 특정 글자 Stock을 능동 보충하는 선택적 행동이다.

```yaml
state: FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
successful_recognition_gain: SELECTED_TYPED_GLYPH_STOCK_PLUS_1
stock_cost: 0
item_cost: 0
cooldown: NONE
```

절차:

```text
학습·숙련 글자 선택
→ [집중 필사] 진입
→ Active Pressure와 적·환경 진행이 느려짐
→ 실제 시간 기준 마나 지속 소모
→ 글자 직접 작성
→ 인식 성공
→ 같은 glyph_id Stock +1
```

- 시간을 완전히 멈추지 않는다.
- 자연충전과 소환수 주기는 Active Pressure 기준이라 집중 중 실제 시간으로 가속되지 않는다.
- 필사 마나 소모는 실제 시간 기준이다.
- 취소·인식 실패·직접 피해·제어·마나 0·Focus loss에서는 Stock을 얻지 못한다.
- 미완성 획은 저장하지 않고 소모한 마나·시간은 환불하지 않는다.
- 용량이 가득 차면 필사를 시작할 수 없다.

## 7. 배치 예약과 소비

```text
글자 노드 배치
→ 해당 글자 Stock 1 예약

노드 이동
→ 예약 유지

노드 제거·교체
→ 기존 예약 해제

주문 Commit 성공
→ 예약 Stock 소비 + 주문 마나 소비 + 결과 적용

취소·대상 취소·검증 실패·시스템 오류
→ Stock 미소비 또는 안전한 예약 해제
```

Stock 소비와 주문 결과 적용은 같은 Transaction ID로 원자 처리한다.

## 8. 마나와 Stock의 역할 분리

```text
Stock
= 글자 노드를 얼마나 빠르고 편하게 배치할 수 있는가

마나
= 완성 주문을 실제로 실행하고 집중 필사를 유지할 수 있는가
```

- Stock을 사용해 노드를 배치하는 것 자체에는 마나 비용이 없다.
- 주문 Commit 시 주문 효과에 따른 마나를 소비한다.
- 집중 필사 중에는 별도로 실제 시간 기준 마나를 소비한다.
- 필사로 만든 Stock이라고 주문 위력·효율이 증가하지 않는다.

## 9. 피격·상태이상

### 직접 피해

- 기존 자연충전 진행도는 보존한 채 `STOCK_HIT_PAUSE_SYSTEM.md`에 따라 정지한다.
- 집중 필사 중 직접 피해를 받으면 필사를 중단하고 미완성 획을 폐기한다.

### 지속 피해

- 자연충전을 정지시키지 않는다.
- 집중 필사는 계속 가능하지만 HP 위험은 실시간으로 진행한다.

### 주문 봉인

- 보유 Stock의 글자 노드 배치와 Commit을 막는다.
- 자연충전 진행은 유지한다.
- 봉인 상태에서 집중 필사를 허용할지는 상태 효과 명세가 결정하되, 생성한 Stock을 즉시 사용할 수는 없다.

## 10. Save·Resume

저장 필드:

- 글자별 Stock 수량.
- 예약 수량.
- 공용 용량 사용량.
- 현재 자연충전 글자 ID.
- 글자별 충전 진행도·남은 시간.
- 소환수 `[스톡]` 주기 잔여시간.
- 적용 완료 Stock Transaction ID.
- 피격 정지 잔여시간.

집중 필사 중 Background·Save 진입 시 미완성 획은 저장하지 않고 집중 상태를 종료한다. 복귀 순간에 Stock을 생성하지 않는다.

## 11. UI 필수 정보

### 3×3 회로 조합

- 글자별 현재 Stock.
- 노드 배치 시 예약 후 남을 수량.
- 공용 용량 현재/최대.
- 대상 노드가 Stock 무료임을 구분하는 형태·문구.
- Commit 예상 Stock 소비와 주문 마나 비용.

### 자연충전

- 현재 충전 글자.
- 남은 Active Pressure 초.
- 소환수 `[스톡] +N` 기여.
- 피격 정지·봉인·교란 상태.

### 집중 필사

- 선택한 글자.
- `[집중]` 상태.
- 시간이 느리지만 진행 중이라는 문구.
- 실제 시간 마나 소모 `-1/초 TEST_VALUE`.
- 성공 시 `해당 글자 Stock +1`.
- 적 의도·HP·마나·치명 위험.

## 12. 접근성·편의성

- Stock 선택과 3×3 노드 연결이 기본 입력이다.
- 직접 필사를 하지 않아도 자연충전과 준비 편성으로 기본 전투를 수행할 수 있어야 한다.
- 가이드 선·스냅·획 순서 보조는 허용한다.
- 필사 정확도는 성공 여부만 결정하며 위력·마나 효율·Stock 지급량 보너스를 주지 않는다.
- 편의성 입력 사용자는 주문 성능 페널티를 받지 않는다.

## 13. 금지와 보호 경계

```text
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
GENERIC_STOCK_FROM_DIFFERENT_GLYPH = PROHIBITED
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
TARGET_NODE_STOCK_COST = PROHIBITED
CONNECTION_EDGE_STOCK_COST = PROHIBITED
PASSIVE_CHARGE_REAL_TIME_ACCELERATION_DURING_FOCUS = PROHIBITED
```

## 14. 검증 경계

`용량 8`, `자연충전 10초`, `최소 3초`, `집중 0.25배`, `마나 1/초`는 Prototype 검증값이다. 제품 코드·Runtime·실기기·사람 검증은 아직 `NOT_RUN`이다.
