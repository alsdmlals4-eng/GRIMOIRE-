# GM-STOCK-SYSTEM-01 — 확인 글자 Token Stock 상세 계약

## 1. 승인 상태

```yaml
decision_id: GM-STOCK-SYSTEM-01
status: USER_APPROVED_RECOMMENDED_DEFAULTS
approved_by: USER_DELEGATED_RECOMMENDED_OPTION
approved_at: 2026-08-02T22:36:00+09:00
approved_option: A_TEMPORARY_CONFIRMED_GLYPH_TOKEN_RACK
benchmark_id: GR-BM-STOCK-SUMMON-01
grill_me_batch: 1_of_10
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

사용자는 Stock 상세 수치를 권장안대로 진행하도록 승인했다. 아래 값은 **Prototype·Vertical Slice 권장 기본값**이며, 사람 검증 없이 상용 최종 밸런스로 주장하지 않는다.

## 2. 역할

> Stock은 이미 직접 작성해 확인한 글자의 기계적인 반복 획을 줄이되, 현재 상황 판독·의미 조합·대상 선택·비용 검토·Commit은 플레이어에게 남기는 임시 글자 자원이다.

## 3. 저장 단위

```text
Stock 1개 = 확인된 글자 Token 1개
```

Stock이 저장하지 않는 것:

- 완성 주문.
- 글자 조합 순서.
- 대상.
- 상황 조건.
- 의미 해석·출력·위험 설정.
- 자동 최적 조합 또는 정답 추천.

## 4. Slice 기본 수치

| 항목 | 권장 기본값 |
|---|---:|
| Stock Rack | `4칸` |
| 동일 글자 중복 상한 | `2개` |
| Chapter·주요 Resume Anchor 최소 보정 | Stock이 2개 미만이면 `2개까지 보정` |
| 직접 작성 생성 | Focus Task에서 해당 글자를 처음 유효하게 직접 Commit하면 `1개` |
| 직접 작성 생성 상한 | 글자별·Focus Task별 `1회` |
| 플레이어 Stock 사용 | 삽입 글자 `1개당 Token 1개` |
| 소환수 전체 충전 상한 | Focus Task당 총 `3개` |
| Slice 목표 직접 작성 비중 | 유효 주문 해결의 `45~65%` |
| Slice 목표 Stock 보조 비중 | `20~40%` |
| Slice 목표 소환수 자동 기여 | `10~25%` |

`유효 주문 해결`은 입력 성공 횟수가 아니라 세계 변화·전투 결과·제작 결과가 실제 적용된 Commit을 뜻한다.

## 5. 획득·보정

### 직접 작성

```text
직접 작성
→ 후보 확인
→ 상황 검증
→ Commit
→ 결과 적용
→ 동일 글자 Stock +1
```

- 입력 실패·문법 실패·마나 부족은 Stock을 생성하지 않는다.
- 상황 설계가 부적절해도 유효 주문으로 세계 변화가 발생했다면 해당 글자 경험은 남으므로 Stock을 생성할 수 있다.
- 같은 글자를 반복 시전해 무한 충전하지 못하도록 글자별·Focus Task별 1회로 제한한다.

### Resume Anchor 보정

- Chapter 시작과 정의된 주요 Resume Anchor에서 Stock 총량이 2개 미만이면 2개까지 보정한다.
- 2개 이상이면 추가 지급하지 않는다.
- 보정 대상 글자는 안전한 준비 화면에서 학습 완료 글자 중 선택한다.
- Anchor 재진입·Save reload로 반복 획득하지 않도록 `anchor_stock_floor_applied` Ledger를 저장한다.

### 소환수 충전

- 메인·보조 소환수의 Stock 충전은 `GM-SUMMON-SYSTEM-01`을 따른다.
- 모든 소환수 합산 충전은 Focus Task당 최대 3개다.
- Rack이 가득 찬 상태에서는 즉시 덮어쓰지 않고 `READY` 상태로 1회 보류한다.

## 6. 사용과 소비 시점

```text
Stock 선택
→ 글자 삽입
→ 의미·대상·비용·위험 검토
→ Commit
→ Commit 승인 시 Token 소비
```

소비하지 않는 경우:

- 취소.
- 후보 변경.
- 입력·문법 실패.
- 마나 부족.
- 중복 Commit 차단.
- 시스템 오류.

소비하는 경우:

- 유효 Commit 후 세계 변화가 원자적으로 적용됨.
- 상황에 부적절해 부분 성공·부작용이 발생했더라도 주문이 실제 적용됨.

Token 소비와 결과 적용은 같은 Transaction ID 아래 처리하되 서로 다른 Ledger 항목으로 기록한다.

## 7. Rack 초과·교체

- Rack이 가득 차면 새 Token은 `PENDING_STOCK` 1개로 표시한다.
- 플레이어는 안전한 Review 또는 결과 화면에서 기존 1개를 교체하거나 새 Token을 포기한다.
- 자동 덮어쓰기와 자동 최적 교체를 금지한다.
- 전투 중 Rack 관리 화면을 강제하지 않는다. 전투 중 획득한 Pending Token은 결과 화면까지 보류한다.

## 8. 저장 범위

- Stock은 Chapter·Session Snapshot에 저장한다.
- App pause/resume과 안전 Anchor 복구 후 유지한다.
- Chapter가 종료되면 다음 Chapter 시작 보정 규칙으로 재구성한다.
- 영구 소지품·계정 자원으로 누적하지 않는다.
- Offline·Background 시간으로 자연 충전하지 않는다.

## 9. 상황 불일치

- Stock 글자는 현재 상황에서 다시 검증한다.
- 대상·범위·출력·보조 문법이 맞지 않으면 수정하거나 Token 삽입을 취소한다.
- Stock이 있다는 이유로 경고를 숨기거나 성공 가능성을 과장하지 않는다.
- 자동 분해·자동 수정·자동 시전을 금지한다.

## 10. UI 계약

- Writing Panel에 `4개` 고정 슬롯을 표시한다.
- 슬롯은 글자·수량·출처를 보여준다.
- 소환수 충전 예정 Token은 다음 Tick과 함께 예고한다.
- `PENDING_STOCK`은 결과 화면에서 교체 선택을 제공한다.
- 완성 주문 바로가기처럼 보이는 카드형 표현을 피한다.

## 11. Slice 작성 횟수 계약 보정

기존 `필수 직접 작성 7회 / 복구 포함 10회`는 다음처럼 재해석한다.

```text
의미 있는 주문 해결 총 7~10회
= 직접 작성 4~6회
+ Stock 보조 2~4회
+ 소환수 자동 주기 행동 1~3회
```

- 동일 결과가 두 범주에 중복 집계되지 않게 한다.
- 소환수 자동 행동은 플레이어 주문 해결 횟수와 별도 기록하되 전체 피로·결과 기여 분석에 포함한다.
- 직접 작성이 4회 미만이거나 전체 유효 해결의 40% 미만이면 핵심 경험 약화로 `REWORK`한다.

## 12. 실패·중단 보호

- 중복 Token 소비 0건.
- Anchor reload 반복 보정 0건.
- 취소·마나 부족 시 Token 손실 0건.
- Save/Resume 후 Rack·Pending·Ledger 불일치 0건.
- Stock이 가득 찬 상태에서 소환수 Tick이 무한 누적되지 않음.

## 13. 후행 튜닝

사람 검증에서 조정 가능한 범위:

- Rack `3~5칸`.
- Anchor floor `1~2개`.
- 직접 작성 비율 목표.
- 동일 글자 중복 상한.

다음 변경은 별도 재승인이 필요하다.

- 완성 주문 Stock 허용.
- 영구·계정 누적 Stock.
- 자동 최적 조합·자동 대상 선택.
- Rack 6칸 이상 또는 Anchor 완전 충전.
