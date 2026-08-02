# GM-STOCK-SYSTEM-01 — 준비 주문·하위 글자 Stock 자연충전 상세 계약

## 1. 승인 상태

```yaml
decision_id: GM-STOCK-SYSTEM-01
status: USER_APPROVED_REVISED_DEFAULTS
approved_by: USER_DIRECTED_INTEGER_STAT_REVISION
approved_at: 2026-08-02T23:14:00+09:00
approved_option: B_PREPARED_SPELL_AND_GLYPH_NATURAL_CHARGE
benchmark_id: GR-BM-STOCK-SUMMON-01
grill_me_batch: 1_of_10_reapproval_no_increment
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

이 문서는 PR #51 초안의 `확인 글자 Token Rack 4칸` 해석을 폐기한다. 최신 Stock은 기존 책임 원본의 자연충전형 준비 시스템을 유지한다.

## 2. 역할

> Stock은 이미 학습·숙련한 주문 또는 하위 마법 글자를 전투 전에 준비하고, 전투 중 자연 충전된 횟수를 플레이어가 필요한 순간에 사용하는 시스템이다.

- 직접 작성의 반복 피로를 줄인다.
- 사용 시점과 대상은 플레이어가 결정한다.
- 신규 발견·즉석 변형·상위 주문은 직접 작성한다.
- 조건부 자동 시전과 자동 최적 조합은 사용하지 않는다.

## 3. Stock 종류

### 완성 주문 Stock

```text
준비된 주문 선택
→ 등록 설계도 전체 기동
→ Stock 1회분 소비
```

### 하위 글자 Stock

```text
상위 주문 작성 중 준비 글자 선택
→ 숙련 글자 한 구간 자동 배치·연결
→ Stock 1회분 소비
```

| 종류 | 준비 용량 비용 | 플레이어에게 남는 판단 |
|---|---:|---|
| 하위 글자 Stock | 글자 1개당 `1` | 상위 조합·연결·최종 Commit |
| 완성 주문 Stock | 설계도 기능 글자 수 `n` | 사용 시점·대상·상황 판단 |

## 4. Prototype 준비 용량

```yaml
initial_shared_stock_capacity: 8
capacity_unit: FUNCTIONAL_MAGIC_GLYPH
per_item_hard_cap: NONE
mana_reservation: NONE
stock_activation_mana_cost: 0
```

- 완성 주문과 하위 글자는 공용 준비 용량 `8`을 공유한다.
- 동일 항목을 여러 번 준비할 수 있다.
- 개별 보유 상한 대신 전체 준비 용량만 사용한다.
- 성장 수치는 Vertical Slice 검증 후 결정한다.

## 5. 자연충전 시간

`1.0단위 = Active Pressure 10초`로 확정한다.

```text
기능 글자 수 n인 Stock 1회분 기준 충전시간
= 10 + 5 × (n - 1)초
```

| 기능 글자 수 | 기준 충전시간 |
|---:|---:|
| 1 | 10초 |
| 2 | 15초 |
| 3 | 20초 |
| 4 | 25초 |
| 5 | 30초 |
| 6 | 35초 |

- 지정한 준비 대상 `1종`만 자연 충전한다.
- 같은 대상의 빈 Stock을 한 번에 1회분씩 순차 충전한다.
- 충전 대상 전환 시 기존 진행도를 대상별로 보존한다.
- Pause·System Resolve·Focus loss·Background·Save/Load에서는 충전하지 않는다.
- Offline catch-up은 없다.

## 6. 소환수 `[스톡]` 수치

소환수는 Stock을 직접 생성하지 않고 **현재 자연충전 타이머를 정수만큼 단축**한다.

```text
소환수 지원 주기 도달
→ 현재 지정 Stock의 남은 충전시간
→ [스톡] 수치만큼 초 단위 감소
```

Prototype 기본값:

```yaml
summon_support_cycle_seconds: 5
main_summon_stock: 1
secondary_stock_summon_stock: 2
slice_total_active_stock_stat_cap: 3
minimum_actual_charge_seconds: 3
```

예시:

```text
1글자 Stock 기준 10초
메인 소환수 [스톡] 1
→ 5초 시점에 남은 시간 1초 감소
→ 실제 완성 약 9초
```

```text
메인 [스톡] 1 + 보조 [스톡] 2
→ 활성 합계 [스톡] 3
→ 5초 시점에 남은 시간 3초 감소
→ 1글자 Stock 실제 완성 약 7초
```

가드레일:

- 감소량은 현재 지정 대상에만 적용한다.
- 충전 완료를 초과한 감소량은 다음 Stock으로 이월하지 않는다.
- 지정 대상이 없거나 최대 보유 상태면 효과를 저장·누적하지 않는다.
- 소환수가 충전 대상을 자동 변경하지 않는다.
- Slice에서 활성 `[스톡]` 합계는 `3`을 넘지 않는다.
- Stock 1회분은 최소 Active Pressure `3초`보다 빠르게 완성되지 않는다.

## 7. 사용과 소비

```text
Stock 선택
→ 대상·상황·결과 검토
→ 사용 승인
→ Stock 1회분 소비
→ 주문 또는 글자 적용
```

- 하위 글자 Stock은 최종 주문 Commit 전에 삽입한다.
- 완성 주문 Stock도 대상과 사용 시점을 플레이어가 직접 선택한다.
- 취소·대상 선택 취소·시스템 오류에서는 소비하지 않는다.
- 결과 적용과 Stock 소비는 같은 Transaction ID로 원자 처리한다.

## 8. 피격·상태이상

- 직접 피해는 기존 `STOCK_HIT_PAUSE_SYSTEM.md`에 따라 진행도를 보존한 채 짧게 충전을 정지한다.
- 지속 피해는 충전을 정지시키지 않는다.
- 주문 봉인은 보유 Stock 사용만 막고 자연충전 진행은 유지한다.
- 마력 교란의 기존 퍼센트 감속값은 후속 정수 상태 수치 모델에서 교체한다.

## 9. Save·Resume 필드

- 준비 편성 목록과 각 수량.
- 공용 준비 용량 사용량.
- 현재 충전 대상 ID.
- 대상별 충전 진행도와 남은 시간.
- 소환수 `[스톡]` 지원 주기 잔여시간.
- 적용 완료 Stock Transaction ID.
- 피격 정지 잔여시간.

복귀 순간에 누적 Stock을 몰아서 생성하지 않는다.

## 10. UI 계약

- 준비 화면: 총 용량 `현재/8`, 항목별 비용과 준비 수량.
- 전투 화면: 현재 충전 대상·현재/최대 수량·남은 초·소환수 단축량.
- 소환수 효과는 `%`가 아니라 `[스톡] +N`으로 표시한다.
- 완성 주문 Stock과 하위 글자 Stock을 형태·아이콘·문구로 구분한다.

## 11. 직접 작성 보호

Stock이 있어도 다음은 직접 작성 대상이다.

- 처음 배우는 글자.
- 현재 성장 단계의 신규·상위 주문.
- 즉석 변형과 새로운 조건 문법.
- 준비 설계도에 없는 해결법.

Vertical Slice에서는 직접 작성이 핵심 Situation 해결의 주도권을 유지하는지 사람 검증한다.

## 12. 후행 튜닝

Prototype 범위에서 조정 가능:

- 1.0단위 `8~12초`.
- 소환수 지원 주기 `4~6초`.
- 메인 `[스톡] 1` 유지 여부.
- 보조 `[스톡] 1~3`.
- 초기 준비 용량 `6~10`.

별도 재승인이 필요한 변경:

- 조건부 자동 시전 재도입.
- 소환수의 자동 충전 대상 변경.
- Offline 자연충전.
- 공용 용량 외 개별 과금·마나 예약 재도입.
