# GR-BM-STOCK-SUMMON-01 — Stock·소환수 피로 완화 QUICK Benchmark

## 1. 결정 질문

> 자연충전형 준비 Stock과 상주 소환수를 사용하면서, 직접 작성의 가치·상황 판단·결과 책임을 유지하려면 어떤 정수 수치 모델이 적합한가?

```yaml
benchmark_id: GR-BM-STOCK-SUMMON-01
scale: QUICK_PLUS_INTERNAL_CANON_RECONCILIATION
status: COMPLETE_REVISED
project: GRIMOIRE
revised_at: 2026-08-02T23:14:00+09:00
external_claim_scope: MECHANIC_PATTERN_ONLY
```

## 2. 정본 재확인

기존 프로젝트에는 이미 다음 책임 원본이 있었다.

- `STOCK_SYSTEM.md`: 완성 주문·하위 글자 Stock을 준비하고 지정 대상 1종을 자연 충전.
- `STOCK_CAPACITY_SYSTEM.md`: 기능 마법 글자 수 기반 공용 준비 용량.
- `STOCK_CHARGE_TIME_SYSTEM.md`: 기능 글자 수에 따른 완만한 충전시간 증가.

따라서 PR #51 초기의 `확인 글자 Token Rack 4칸`은 기존 Stock 정본과 충돌하며 폐기한다.

## 3. 외부 패턴에서 취할 원칙

| 패턴 | 취할 점 | 버릴 점 |
|---|---|---|
| 예측 가능한 동반체 자동 지원 | 역할·대상·주기를 사전에 표시 | 자유 AI·자동 최적 해법 |
| 소환 후 지속되는 전투 동료 | 소환 선택과 활성 후 행동을 분리 | 다수 소환이 핵심 플레이를 대체 |
| 충전형 자원 지원 | 남은 시간·준비 완료 상태를 명확히 표시 | 무한 누적·Offline catch-up |
| 정수 방어·공격·치유 | 결과를 즉시 계산·예측 가능 | 퍼센트 중첩과 불투명한 계수 |

## 4. 내부 대안 비교

### Stock 구조

| 대안 | 장점 | 위험 | 판정 |
|---|---|---|---|
| 확인 글자 Token Rack | 단순 | 기존 완성 주문·하위 글자 Stock 정본과 충돌 | `REJECT` |
| 범용 Charge Pool | UI 단순 | 준비 대상·글자 복잡도 의미 상실 | `REJECT` |
| 자연충전형 준비 Stock | 기존 정본·성장·편성 선택 유지 | 충전시간과 생산 가속 수치 필요 | `ADOPT` |

### 소환 지속 방식

| 대안 | 장점 | 위험 | 판정 |
|---|---|---|---|
| 30초 제한 소환 | 교대 리듬 명확 | 사용자가 의도한 상주 소환과 충돌 | `REJECT` |
| 상주 + 무제한 수 | 수집·조합 폭 큼 | 화면·자동화·밸런스 폭증 | `REJECT_FOR_SLICE` |
| 메인 상시 + 보조 1체 상주 | 정체성·선택·제작 상한 균형 | 교체 비용·정수 수치 검증 필요 | `ADOPT` |

### 효과 계산

| 대안 | 장점 | 위험 | 판정 |
|---|---|---|---|
| 퍼센트 출력·피해 감소 | 스케일링 쉬움 | 비교·중첩이 불투명하고 사용자 의도와 충돌 | `REJECT` |
| 정수 `[스톡]·[방어도]·[공격]·[치유]` | 읽기 쉽고 결과 예측 가능 | HP·불안정도 스케일과 함께 검증 필요 | `ADOPT` |

## 5. GRIMOIRE 적용 결론

1. Stock은 완성 주문·하위 글자 준비 Stock을 유지한다.
2. 공용 준비 용량 Prototype 기본값은 `8`이다.
3. 1글자 자연충전 기준은 `10초`, 추가 글자당 `+5초`다.
4. 메인 소환수는 상시 활성이다.
5. 기타 소환수는 `[소환 주문]`으로 불러 수동 귀환·교체 전까지 유지한다.
6. Slice 추가 활성 상한은 `1체`다.
7. 소환 주문 비용은 고정 `마나 2`다.
8. 공통 지원 주기는 Active Pressure `5초`다.
9. 효과는 `[스톡]·[방어도]·[공격]·[치유]` 정수로 계산한다.
10. Offline·Background 행동과 자동 최적 대상 선택을 금지한다.

## 6. Prototype 기본값

```yaml
stock_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
support_cycle_seconds: 5
main_stock_stat: 1
secondary_stock_stat: 2
defense_stat: 2
attack_stat: 2
heal_stat: 2
summon_spell_mana_cost: 2
additional_active_summon_cap: 1
```

## 7. 적대적 검토

### 위험 1 — 대기 플레이

`[스톡]`이나 `[치유]` 주기만 기다리는 것이 유리해질 수 있다.

대응:

- 적 Attack Timer와 같은 Active Pressure Clock 사용.
- 자동 공격은 불안정도 1 아래로 낮추지 못함.
- Stock 지원은 충전 대상을 바꾸지 않음.
- 무압박 메뉴·학교 장면에서는 주기 정지.

### 위험 2 — 상시 방어로 무적

대응:

```text
최종 직접 피해 = max(1, 원피해 - 방어도)
```

### 위험 3 — 자동화 과밀

대응:

- 메인 1 + 보조 1만 허용.
- Slice 실제 플레이는 보조 대표 1종만 사용.
- 다른 유형은 합성 Test·Preview로 검증.

### 위험 4 — 충전 폭발

대응:

- `[스톡]` 초과 감소량 이월 금지.
- Slice 활성 `[스톡]` 합계 상한 3.
- Stock 1회분 최소 실제 충전시간 3초.

## 8. 통과 신호

- 플레이어가 정수 수치만 보고 5초 뒤 결과를 예측한다.
- 소환수 없이도 직접 작성·Stock 사용이 가능하다.
- 소환수만 기다리는 전략이 최적이 아니다.
- 중복 Tick·중복 Stock 완성·중복 피해/회복 0건.
- Save/Resume 후 활성 소환수와 주기가 정확히 이어진다.
- 자동 공격이 전투를 끝내지 않는다.
