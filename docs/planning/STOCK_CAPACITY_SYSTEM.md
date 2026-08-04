# Spell 글자 Stock 준비 용량 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
updated_at: 2026-08-04T09:37+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 단일 제약

```text
Stock 보유·예약 제약
= 공용 글자 Stock 용량
```

Prototype 초기값:

```yaml
shared_capacity: 8_TEST_VALUE
capacity_unit: ONE_TYPED_GLYPH_STOCK
completed_spell_capacity: prohibited
mana_reservation: none
individual_glyph_hard_cap: none
```

- 글자 Stock 1개는 용량 1을 사용한다.
- 대상 노드와 연결선은 용량을 사용하지 않는다.
- 완성 주문 Stock은 존재하지 않는다.
- 동일 글자를 여러 개 보유할 수 있다.

## 용량 계산

```text
사용 용량
= 보유 글자 Stock
+ 회로 편집 중 예약된 글자 Stock
+ 집중 필사 예약 용량
```

총합은 공용 용량을 넘을 수 없다.

## 회로 편집 예약

- 글자 노드를 배치하면 같은 glyph_id Stock 1개를 예약한다.
- 노드 이동은 예약량을 바꾸지 않는다.
- 글자 교체는 이전 예약 해제 후 새 Stock을 예약한다.
- 노드 삭제·회로 취소는 예약을 해제한다.
- Commit 성공은 예약을 소비로 전환한다.
- Commit 실패·대상 취소·시스템 오류는 예약을 소비하지 않는다.

## 집중 필사 예약

```text
집중 필사 시작 요청
→ 빈 용량 1칸 확인
→ glyph_id와 함께 용량 1칸 예약
→ 필사 시작
```

- 예약칸은 자연충전과 소환수 지원이 채울 수 없다.
- 성공하면 예약칸에 같은 글자 Stock 1개를 생성한다.
- 취소·실패·피격·마나 0·Focus loss에서 예약을 해제한다.
- 예약이 없으면 성공 Event를 적용하지 않는다.
- 예약과 생성은 같은 `scribe_reservation_id` 아래 Exactly-once 처리한다.

이 규칙은 필사 도중 자연충전이 마지막 용량을 채워 성공 보상을 잃는 경합을 방지한다.

## 자연충전 완료

자연충전 완료 Event는 적용 직전에 사용 가능 용량을 다시 확인한다.

```text
사용 가능 용량 있음
→ Stock 생성

회로·필사 예약 때문에 용량 없음
→ 완료 직전 상태로 정지
→ 용량 해제 후 재개
```

완료분을 대기열에 중복 저장하거나 다른 글자로 자동 전환하지 않는다.

## UI

- `보유 / 회로 예약 / 필사 예약 / 전체 용량`을 구분한다.
- 예: `보유 5 + 회로 예약 2 + 필사 예약 1 = 8/8`.
- 집중 필사 진입 전에 예약될 1칸을 미리 표시한다.
- 용량 부족 시 무엇을 해제해야 하는지 설명한다.
- Stock이 최대 마나를 감소시키지 않는다는 안내를 유지한다.

## Save·Resume

저장 필드:

- 글자별 보유 수량.
- 회로별 예약 수량과 reservation ID.
- 집중 필사 glyph_id와 scribe reservation ID.
- 전체 용량과 사용량.
- 적용 완료 생성·소비 Transaction ID.

손상되거나 중복된 예약은 자동으로 Stock을 생성하지 않고 안전 복구 대상으로 분류한다.

## 금지

```text
완성 주문 Stock 용량
대상·연결선 용량 비용
집중 필사 성공 시 용량 초과
같은 예약 ID의 중복 생성
예약 해제 없이 노드 교체
```
