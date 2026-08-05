# Spell 마나 시스템 — 별형 회로 기준

## 문서 상태

```yaml
status: ACTIVE_PROTOTYPE_NUMERIC_DIRECTION_MAIN
decision_alignment: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
merged_pull_request: 68
sheet_sync: SYNCED_TO_MAIN
sheet_readback: PASS
updated_at: 2026-08-06T06:27+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

Typed glyph Stock은 글자 입력을 대체하고, 마나는 완성된 주문을 세계에 실행하는 자원이다. Stock 사용 여부와 무관하게 모든 주문 Commit은 마나를 사용한다.

## 주문 Commit

```text
FIVE_POINT_STAR 회로 유효성 확인
→ 회로 Preview
→ 대상 키워드 선택
→ 최종 Preview
→ 예약된 글자 Stock 확인
→ 최종 마나 비용 확인
→ Stock 소비 + 마나 소비 + 결과 적용
→ 같은 Transaction ID로 Exactly-once 처리
```

- 대상 취소·유효성 실패·Commit 시스템 오류에서는 마나와 예약 Stock을 소비하지 않는다.
- 직접 그리기·접근성 입력·Stock 선택은 같은 주문 의미와 비용 공식을 사용한다.
- 직접 그리기는 숙련도 획득 근거지만 즉시 마나 할인이나 위력 보너스를 주지 않는다.

## 기준 마나

```text
기준 마나
= 메인 글자 기본 마나
+ 모든 보조 글자 기본 마나 합계
+ 대상 키워드 비용
+ 출력·범위·지속 비용
```

## 최종 마나

```text
최종 마나
= ceil(기준 마나 × (1
  + 보조 복잡도 가산
  + 정밀 마나 가산
  - 절감 마나 감소
  + 기타 명시적 마나 보정))
```

최종 마나는 메인 글자의 기본 마나보다 낮아질 수 없다. 모든 비율은 초기 계약에서 합연산한다.

## 보조 복잡도 마나 가산

```yaml
auxiliary_complexity_mana:
  0: +0%
  1: +10%
  2: +20%
  3: +30%
  4: +40%
  5: +50%
```

| 보조 글자 수 | 회로 마나 가산 |
|---:|---:|
| 0 | +0% |
| 1 | +10% |
| 2 | +20% |
| 3 | +30% |
| 4 | +40% |
| 5 | +50% |

보조 글자 자체 기본 마나를 먼저 더한 뒤 회로 복잡도 비율을 적용한다. 따라서 보조 5개 주문은 메인 단독 주문의 단순 150%가 아니라 훨씬 큰 비용을 요구한다.

### 단순 예시

메인 기본 마나 `10`, 각 보조 기본 마나 `4`, 대상·출력 추가비용 `0`을 가정한다.

| 보조 수 | 기준 마나 | 복잡도 적용 | 최종 마나 |
|---:|---:|---:|---:|
| 0 | 10 | ×1.00 | 10 |
| 1 | 14 | ×1.10 | 16 |
| 2 | 18 | ×1.20 | 22 |
| 3 | 22 | ×1.30 | 29 |
| 4 | 26 | ×1.40 | 37 |
| 5 | 30 | ×1.50 | 45 |

이 표는 구조 검증용 `TEST_VALUE`이며 실제 글자별 비용은 Playtest로 조정한다.

## PRECISION / 정밀

정밀은 마나를 더 공급해 회로 오차와 불안정성을 줄인다.

```yaml
special_auxiliary: PRECISION
mana_rate: +25%
success_bonus: precision_mastery_divided_by_10_percentage_points
power_bonus: 0
occupies_auxiliary_slot: true
```

정밀도 보조 개수와 복잡도 계산에 포함된다. 따라서 정밀은 무료 성공률 보너스가 아니라 **마나와 효과 슬롯을 안정성으로 교환**하는 글자다.

## REDUCTION / 절감

절감은 회로의 불필요한 마나 흐름을 줄인다.

```yaml
special_auxiliary: REDUCTION
mana_reduction: 10%_plus_reduction_mastery_divided_by_10
success_bonus: 0_percentage_points
occupies_auxiliary_slot: true
minimum_final_mana: MAIN_GLYPH_BASE_MANA
```

숙련도 0~100에서 감소율은 10~20%다. 절감도 보조 개수와 성공률·마나 복잡도 계산에 포함되므로 무료 효율 글자가 아니다.

## 정밀+절감 동시 사용

숙련도 60의 정밀과 절감을 보조 2개로 사용하면:

```text
복잡도 +20%
정밀 +25%
절감 -16%
최종 비율 +29%
```

성공률 측면에서는 보조 2개 `-20%p`와 정밀 `+6%p`가 적용되어 순수 `-14%p`다. 슬롯 두 개를 사용하므로 효과형 보조의 기회비용도 남는다.

## 마나 비용 요인

```yaml
cost_drivers:
  - MAIN_GLYPH_BASE_COST
  - AUXILIARY_GLYPH_BASE_COST
  - AUXILIARY_SLOT_COUNT
  - TARGET_KEYWORD_COST
  - OUTPUT_AND_SCOPE
  - DURATION
  - PRECISION
  - REDUCTION
not_cost_drivers:
  - INPUT_MODE
  - DRAWING_ACCURACY_ALONE
  - STAR_VERTEX_POSITION
  - LINE_LENGTH
  - ACCESSIBILITY_ASSISTANCE
```

## Preview UI

### 회로 Preview

- 대상 선택 전 기준 마나.
- 보조 복잡도 가산.
- 정밀·절감 비율.
- 미해결 대상·범위 비용.

### 최종 Preview

- 최종 마나.
- Commit 후 잔여 마나.
- 최종 성공률과 상태.
- 마나 부족과 Stock 부족을 서로 다른 이유로 표시.

## 기본 회복과 무한 순환 방지

- 마나 0에서도 장시간 행동 불능이 되지 않는 복구 경로는 필요하다.
- 자동 회복만 기다리는 행동이 최적이 되지 않게 한다.
- 마나 회복 주문·절감·집중 필사를 조합한 무비용 무한 증식을 금지한다.
- 실제 회복 속도와 전투 지속시간은 Runtime Tuning 전까지 미확정이다.

## 집중 필사 보존 계약

```yaml
mana_drain_per_real_second: 1_TEST_VALUE
active_pressure_scale: 0.25_TEST_VALUE
mana_zero: EXIT_FOCUS_SCRIBE
refund_on_cancel_or_interrupt: 0
```

필사는 같은 글자 Stock을 보충하는 선택 기능이며 마나 회복이나 주문 위력 증가 수단이 아니다.

## 책임 경계

- 회로·성공률: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 글자 숙련도: `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`.
- 승인: `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`.
- Main Sync: `docs/planning/sync/GR-SYNC-20260806-01-MAIN.md`.

## 금지

```text
STOCK_CASTS_WITHOUT_SPELL_MANA
INPUT_MODE_MANA_PENALTY
ACCESSIBILITY_MANA_PENALTY
DRAWING_ACCURACY_DIRECT_MANA_BONUS
STAR_VERTEX_POSITION_MANA_BONUS
REDUCTION_BELOW_MAIN_BASE_MANA
PRECISION_REDUCTION_INFINITE_EFFICIENCY
RUNTIME_EVIDENCE_WITHOUT_EXECUTION
```
