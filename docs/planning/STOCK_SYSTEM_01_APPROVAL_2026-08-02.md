# GM-STOCK-SYSTEM-01 — 준비 주문·하위 글자 Stock 자연충전 승인 이력

## 1. 현재 상태

```yaml
decision_id: GM-STOCK-SYSTEM-01
status: USER_APPROVED_HISTORY_SUPERSEDED_IN_PART
approved_at: 2026-08-02T23:14+09:00
superseded_in_part_at: 2026-08-04T09:14+09:00
superseding_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
current_authority:
  - docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md
  - docs/planning/STOCK_SYSTEM.md
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

이 문서는 2026-08-02에 승인된 Stock 설계의 역사적 근거다. 최신 사용자 결정은 3×3 글자 노드 조합을 모든 주문의 실행 경로로 채택했으므로 일부 항목을 명시적으로 대체한다.

## 2. 유지되는 결정

다음 원칙은 계속 유효하다.

- Stock은 반복 직접 작성을 줄이는 준비 시스템이다.
- 공용 준비 용량을 사용한다.
- 한 번에 준비 대상 1종만 자연충전한다.
- 대상별 진행도를 보존한다.
- Offline catch-up을 사용하지 않는다.
- 소환수 `[스톡]`은 남은 충전시간을 정수 초 단축한다.
- 소환수가 충전 대상을 자동으로 바꾸지 않는다.
- 소비와 결과 적용은 같은 Transaction ID로 원자 처리한다.
- 신규·미숙련 글자는 Stock으로 건너뛰지 않는다.

Prototype 계승값:

```yaml
shared_capacity: 8_TEST_VALUE
one_glyph_base_charge_seconds: 10_TEST_VALUE
summon_support_cycle_seconds: 5_TEST_VALUE
main_summon_stock: 1_TEST_VALUE
secondary_stock_summon_stock: 2_TEST_VALUE
slice_total_active_stock_stat_cap: 3_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
```

## 3. 대체된 결정

### 완성 주문 Stock

과거:

```text
등록 주문 설계도 전체를 Stock 1회로 원터치 기동
```

현재:

```text
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
```

이유:

- 3×3 노드 배치와 연결 판단을 우회한다.
- 대상·분기·보조 글자 선택을 없앤다.
- 상황 해결과 전투 주문 제작의 공통 규칙을 깨뜨린다.

알려진 주문 설계도는 자동 시전이 아니라 배치 안내·초안으로만 사용할 수 있다.

### 기능 글자 수 기반 완성 주문 충전 공식

과거:

```text
10 + 5 × (n - 1)초
```

현재:

```text
특정 글자 Stock 1개
= Active Pressure 10초 TEST_VALUE
```

모든 주문은 필요한 글자 Stock을 각각 사용해 3×3 회로에서 조합한다.

### 직접 작성의 역할

과거:

- 주문 회로에 직접 글자를 작성하는 기본 또는 병렬 입력.

현재:

- 기본 입력은 Stock 선택과 노드 배치·연결.
- 직접 작성은 `[집중 필사]`로 특정 글자 Stock을 보충하는 보조 행동.
- 필사 중 Active Pressure는 느려지고 실제 시간 기준 마나가 소모된다.

## 4. 최신 Stock 정의

```text
특정 글자 Stock 1
= 그 글자를 직접 그리지 않고 글자 노드 1개 배치
```

```yaml
stock_scope: TYPED_GLYPH_ONLY
target_keyword_stock_cost: 0
connection_edge_stock_cost: 0
completed_spell_stock: PROHIBITED
```

## 5. 최신 집중 필사 정의

```yaml
state: FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
successful_recognition_gain: SAME_GLYPH_STOCK_PLUS_1
```

- 시간은 완전히 멈추지 않는다.
- 적·환경은 느려진 Active Pressure로 계속 진행한다.
- 자연충전·소환수 주기는 Active Pressure 기준이라 실제 시간 가속이 없다.
- 취소·인식 실패·직접 피해·마나 0에서 Stock을 얻지 못한다.

## 6. 최신 연결 문서

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`

## 7. 금지

```text
LEGACY_COMPLETE_SPELL_STOCK_AS_CURRENT_RULE = PROHIBITED
LEGACY_MULTI_GLYPH_CHARGE_FORMULA_AS_CURRENT_RULE = PROHIBITED
DRAWING_AS_MANDATORY_CIRCUIT_INPUT = PROHIBITED
GENERIC_STOCK_FROM_ANY_DRAWN_GLYPH = PROHIBITED
```

이 문서의 과거 세부값과 최신 책임 원본이 충돌하면 `GM-3X3-CIRCUIT-STOCK-FOCUS-01`과 최신 책임 원본을 우선한다.
