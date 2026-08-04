# Spell 글자 Stock 준비 용량 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_ACTIVE
primary_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decision: GM-STOCK-SYSTEM-01
updated_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

상위 시스템:

- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`

## 1. 단일 제약 원칙

```text
Stock 제약
= 공용 글자 Stock 준비 용량
```

적용하지 않는 제약:

- 완성 주문 Stock 용량
- 최대 마나 예약
- 현재 마나 선불 소모
- Stock 노드 배치 시 추가 마나 소모
- 글자별 별도 최대 보유량
- 대상 키워드 또는 연결선 용량 비용

## 2. 공용 준비 용량

```yaml
prototype_initial_capacity: 8_TEST_VALUE
capacity_unit: ONE_TYPED_FUNCTIONAL_GLYPH_COPY
```

- 모든 글자 Stock이 하나의 준비 용량을 공유한다.
- 동일 글자를 여러 번 준비할 수 있다.
- 총 사용량이 공용 용량을 넘지 않는 한 개별 글자 상한은 두지 않는다.
- 자연충전과 집중 필사는 같은 용량을 사용한다.

## 3. 비용

```text
숙련 글자 Stock 1개
= 글자 노드 1개를 직접 그리지 않고 배치
= 준비 용량 1
```

계산에 포함:

- 메인 글자 Stock
- 보조 글자 Stock
- 이후 독립 기능 글자로 확정된 조건·순서 글자 Stock

계산하지 않음:

- 대상 키워드 노드
- 연결선
- 연결선 길이와 획수
- 3×3 셀 위치
- 시각 장식
- 주문명과 마도서 설계도

## 4. 예시

```yaml
capacity: 8
stored:
  열: 2
  흐름: 2
  보호: 2
  집중: 1
  분산: 1
used: 8
free: 0
```

`보호 → 집중 → 카시안` 주문을 Commit하면 보호 1과 집중 1을 소비한다. 카시안 대상 노드와 연결선은 용량·Stock 비용이 없다.

## 5. 집중 필사와 용량

```text
필사 시작 전
→ 공용 용량 여유 확인

인식 성공
→ 선택한 글자 Stock +1
→ 공용 사용량 +1
```

- 용량이 가득 차면 필사를 시작할 수 없다.
- 필사 도중 다른 생산 Event로 용량이 가득 차면 성공 결과를 중복 생성하지 않는다.
- 같은 시각 Event는 Stock Transaction 순서에 따라 원자 처리한다.
- 용량 초과분을 대기열·임시 보관·다른 글자로 전환하지 않는다.

## 6. 자연충전과 용량

- 현재 지정 글자의 빈 수량만 충전한다.
- 공용 용량이 가득 차면 충전을 완료하지 않고 정지한다.
- 다른 글자로 자동 전환하지 않는다.
- 소환수 `[스톡]` 초 단축량을 다음 Stock으로 이월하지 않는다.

## 7. 성장과 튜닝

Prototype에서는 초기 용량 `8`을 사용한다.

후행 검증 범위:

- 초기 용량 `6~10`.
- 성장으로 용량 증가 여부.
- 성장 수치와 자연충전·소환수 생산이 동시에 과도하게 증가하지 않는지.

별도 재승인이 필요한 변경:

- 완성 주문 Stock 재도입.
- Stock에 마나 예약·선불 비용 추가.
- 대상 노드나 연결선에 Stock 비용 추가.
- 글자별 하드캡 추가.

## 8. UI 필수 정보

- 공용 준비 용량 현재/최대.
- 글자별 보유·예약·Commit 후 잔량.
- 자연충전 또는 집중 필사 성공 시 용량 변화.
- 용량이 가득 찼을 때 생산이 정지된 이유.
- 대상 노드와 연결선이 무료라는 시각·텍스트 구분.

## 9. 가드레일

```text
COMPLETED_SPELL_CAPACITY_COST = PROHIBITED
TARGET_NODE_CAPACITY_COST = PROHIBITED
CONNECTION_EDGE_CAPACITY_COST = PROHIBITED
OVERFLOW_QUEUE = PROHIBITED
HIDDEN_PER_GLYPH_CAP = PROHIBITED
```

제품 Runtime과 사람 검증 전 `8`을 상용 최종값으로 주장하지 않는다.
