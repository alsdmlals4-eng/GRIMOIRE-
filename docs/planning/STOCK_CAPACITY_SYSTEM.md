# 보관함·범용 Stock 용량 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: USER_APPROVED_PENDING_MERGE_RESPONSIBILITY_SOURCE
decision_id: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
partially_supersedes: GM-3X3-CIRCUIT-STOCK-FOCUS-01
updated_at: 2026-08-05T00:31+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 용량 원칙

```text
SEPARATE_VAULT_AND_STOCK_CAPACITY
```

보관함과 범용 Stock은 생성 방식·전략적 의미·사용 범위가 다르므로 하나의 공용 용량으로 합치지 않는다.

```yaml
universal_stock:
  capacity_contract: UNIVERSAL_STOCK_CAPACITY
  capacity: TEST_VALUE
  current: int
  reserved: int

exact_glyph_vault:
  capacity_contract: EXACT_GLYPH_VAULT_SLOT_CAPACITY
  slot_capacity: TEST_VALUE
  slots:
    - EMPTY
    - AVAILABLE
    - RESERVED
```

- 범용 Stock 1개는 Stock 용량 1을 사용한다.
- 보관함의 특정 글자 1개는 보관함 슬롯 1칸을 사용한다.
- 대상 노드와 연결선은 어느 용량도 사용하지 않는다.
- 완성 주문 Stock과 그 용량은 존재하지 않는다.
- 두 용량의 초기값은 Runtime·사람 검증 전 `TEST_VALUE`다.

## 범용 Stock 예약

```text
Stock 1개 사용 출처 선택
→ 보유 Stock 1개를 AVAILABLE에서 RESERVED로 전환
→ 노드 배치
```

```text
RESOURCE_RESERVATION_DOES_NOT_CREATE_EXTRA_CAPACITY_USAGE
```

예약은 이미 용량을 사용 중인 자원의 상태를 바꿀 뿐 추가 용량을 점유하지 않는다.

```yaml
stock_capacity_usage: current_total_including_reserved
stock_available: current_total - reserved
```

- 노드 이동은 예약을 유지한다.
- 노드 제거·출처 교체·회로 취소는 예약을 해제한다.
- Commit 성공은 RESERVED를 소비해 전체 Stock 수량을 감소시킨다.
- Commit 실패·대상 취소·시스템 오류는 예약만 해제하고 수량을 보존한다.

## 보관함 예약

```text
일치하는 보관함 글자 출처 선택
→ 해당 vault_slot_id를 AVAILABLE에서 RESERVED로 전환
→ 노드 배치
```

예약된 보관함 슬롯은 이미 점유된 슬롯이며 추가 슬롯을 사용하지 않는다.

- 노드 이동은 같은 슬롯 예약을 유지한다.
- 글자·출처 교체 또는 취소는 슬롯을 AVAILABLE로 되돌린다.
- Commit 성공은 해당 슬롯을 EMPTY로 만든다.
- 실패·취소는 슬롯 내용을 보존한다.

## 집중 필사 예약

```text
FOCUS_SCRIBE_RESERVES_VAULT_SLOT
```

```text
집중 필사 시작 요청
→ EMPTY 보관함 슬롯 1칸 확인
→ 해당 slot_id를 RESERVED_FOR_SCRIBE로 예약
→ 선택 glyph_id와 reservation_id 기록
→ 필사 시작
```

- 성공하면 예약 슬롯에 해당 `glyph_id`를 기록하고 AVAILABLE로 전환한다.
- 취소·인식 실패·직접 HP 피해·행동 불가·마나 0·Focus loss에서는 슬롯을 EMPTY로 되돌린다.
- 동일 `scribe_reservation_id`의 성공 Event는 Exactly-once로 적용한다.
- 보관함 빈 슬롯이 없으면 집중 필사를 시작할 수 없다.

## 자연충전 완료

```text
NATURAL_CHARGE_RESPECTS_STOCK_CAPACITY
```

자연충전은 보관함 슬롯을 사용하지 않고 범용 Stock만 증가시킨다.

```text
Stock 용량 여유 있음
→ 범용 Stock +1

Stock 용량 가득 참
→ 완료 직전 상태에서 정지
→ Stock 소비 후 재개
```

- 보관함이 가득 찼다는 이유로 자연충전을 막지 않는다.
- Stock 용량이 가득 찼을 때 보관함으로 자동 전환하지 않는다.
- 완료분을 중복 Queue로 저장하거나 Offline에서 소급 생성하지 않는다.

## 용량 계산

```yaml
universal_stock_capacity_usage:
  formula: CURRENT_UNIVERSAL_STOCK_TOTAL
  reserved_is_subset_of_current: true

vault_capacity_usage:
  formula: NON_EMPTY_OR_RESERVED_VAULT_SLOTS
  circuit_reserved_is_existing_item: true
  scribe_reserved_empty_slot_counts_as_used: true
```

예시:

```text
Stock: 총 3 / 예약 1 / 사용 가능 2 / 용량 5
보관함: 글자 2 + 필사 예약 1 / 슬롯 4
```

## UI

- 범용 Stock은 `사용 가능 / 예약 / 총량 / 최대`를 표시한다.
- 보관함은 슬롯별 문양, 이름, AVAILABLE/RESERVED/필사 예약 상태를 표시한다.
- 두 용량을 하나의 `n/m` 숫자로 합쳐 표시하지 않는다.
- 필사 진입 전에 예약될 빈 보관함 슬롯을 강조한다.
- 용량 부족 시 `Stock 가득 참`과 `보관함 빈 슬롯 없음`을 다른 오류로 설명한다.
- 색 외 아이콘·테두리·텍스트로 상태를 구분한다.

## Save·Resume

저장 필드:

- 범용 Stock 총량·예약 수량·충전 진행도.
- 보관함 슬롯별 `slot_id`, `glyph_id`, 상태.
- 회로 노드별 자원 출처·reservation ID.
- 집중 필사 선택 `glyph_id`, 예약 슬롯, scribe reservation ID.
- 적용 완료 생성·소비 Transaction/Event ID.

손상되거나 중복된 예약은 자동으로 자원을 생성하지 않고 안전 복구 대상으로 분류한다.

## 금지

```text
SHARED_VAULT_AND_STOCK_CAPACITY
RESERVATION_DOUBLE_COUNTS_CAPACITY
VAULT_FULL_BLOCKS_NATURAL_STOCK_CHARGE
STOCK_FULL_CONVERTS_TO_VAULT
COMPLETED_SPELL_CAPACITY
TARGET_OR_EDGE_CAPACITY_COST
SCRIBE_SUCCESS_OVER_VAULT_CAPACITY
DUPLICATE_RESERVATION_CONSUMPTION
```

## 연결 정본

- 승인: `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- 자원 책임: `docs/planning/STOCK_SYSTEM.md`.
- 상세 설계: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 상태 색인: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.
