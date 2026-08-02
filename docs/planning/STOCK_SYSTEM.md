# Spell Stock 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_status: USER_APPROVED_REVISED_DEFAULTS
decision_id: GM-STOCK-SYSTEM-01
updated_at: 2026-08-02T23:14:00+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

연결 문서:

- 상세 승인: `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
- 준비 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- 충전시간: `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`
- 직접 피해 정지: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`
- 상태이상: `docs/planning/STATUS_EFFECT_STOCK_SYSTEM.md`

## 1. 시스템 약속

```text
학습·숙련한 주문·하위 글자를 전투 전에 준비
→ 지정 대상 1종 자연 충전
→ 플레이어가 필요한 순간에 터치해 사용
→ 직접 작성·정확 행동·소환수 [스톡] 수치로 충전 지원
```

- 조건부 자동 시전은 사용하지 않는다.
- Stock 사용 시점과 대상은 플레이어가 결정한다.
- 신규 발견·즉석 변형·상위 주문은 직접 작성한다.

## 2. Stock 종류

### 완성 주문 Stock

```text
준비 주문 선택
→ 등록 설계도 전체 기동
→ Stock 1회분 소비
```

### 하위 글자 Stock

```text
주문 작성 중 준비 글자 선택
→ 숙련 글자 한 구간 자동 배치·연결
→ Stock 1회분 소비
```

Stock이 없어도 직접 작성은 가능하다.

## 3. 공용 준비 용량

```yaml
prototype_initial_capacity: 8
capacity_unit: FUNCTIONAL_MAGIC_GLYPH
mana_reservation: NONE
stock_use_mana_cost: 0
```

- 하위 글자 Stock 1개는 준비 용량 `1`을 사용한다.
- 완성 주문 Stock 1개는 설계도 기능 글자 수 `n`만큼 사용한다.
- 동일 주문·글자를 여러 번 준비할 수 있다.
- 개별 보유 상한 대신 전체 준비 용량만 사용한다.

## 4. 자연충전

```text
기능 글자 수 n인 Stock 1회분
= 10 + 5 × (n - 1)초
```

- `1.0단위 = Active Pressure 10초`다.
- 지정 대상 `1종`만 자연 충전한다.
- 빈 수량을 한 번에 1회분씩 순차 충전한다.
- 대상 전환 시 진행도를 대상별로 보존한다.
- Pause·Resolve·Focus loss·Background·Save/Load 중에는 정지한다.
- Offline catch-up은 없다.

## 5. 소환수 `[스톡]` 지원

```text
소환수 지원 주기 5초
→ 현재 지정 대상 남은 충전시간
→ 활성 [스톡] 합계만큼 초 단위 감소
```

Prototype:

- 메인 소환수 `[스톡] 1`.
- 생산형 보조 소환수 `[스톡] 2`.
- Slice 활성 합계 상한 `[스톡] 3`.
- Stock 1회분 최소 실제 충전시간 `3초`.

가드레일:

- 감소 초과분을 다음 Stock으로 이월하지 않는다.
- 지정 대상이 없거나 최대 수량이면 효과를 저장하지 않는다.
- 소환수는 충전 대상을 자동 변경하지 않는다.

## 6. 플레이어 능동 기여

추가 충전 기여 후보:

- 직접 주문 작성·유효 Commit.
- 정확한 글자 완성.
- 방어·반격 성공.
- 주문 연계 성공.
- 소환수 공격·수호·동조 성공.

능동 기여의 정수값은 후속 Tuning에서 결정한다. 퍼센트 충전 배율은 사용하지 않는다.

## 7. 사용·소비 원자성

```text
Stock 선택
→ 대상·상황 확인
→ 사용 승인
→ Stock 1회분 소비
→ 주문·글자 적용
```

- 취소·대상 취소·시스템 오류에서는 소비하지 않는다.
- Stock 소비와 결과 적용은 같은 Transaction ID 아래 원자 처리한다.
- 하위 글자 Stock은 최종 Commit 전에 삽입한다.

## 8. 피격·상태이상

### 직접 피해

- 실제 HP 감소량을 기준으로 충전을 잠시 정지한다.
- 진행도는 보존한다.
- 완전 방어로 최종 피해가 0이면 정지하지 않는다.
- 세부 공식은 `STOCK_HIT_PAUSE_SYSTEM.md`를 따른다.

### 지속 피해

- HP를 감소시키지만 충전을 정지하지 않는다.

### 주문 봉인

- 보유 Stock 사용을 막는다.
- 자연충전과 진행도는 유지한다.

### 마력 교란

기존 퍼센트 감속은 폐기 후보다. 후속 정수 상태 수치로 `남은 충전시간 +N` 또는 `주기 감소량 -N` 중 하나를 결정한다.

## 9. Save·Resume

저장 필드:

- 준비 편성·수량·용량 사용량.
- 현재 충전 대상.
- 대상별 진행도·남은 시간.
- 소환수 `[스톡]` 주기 잔여시간.
- 피격 정지 잔여시간.
- 적용 완료 Transaction ID.

복귀 순간에 누적 Stock을 일괄 생성하지 않는다.

## 10. UI 필수 정보

- 전체 준비 용량 `현재/8`.
- 각 항목의 기능 글자 수·비용·현재/최대 수량.
- 지정 충전 대상과 남은 초.
- 자연충전량과 소환수 `[스톡] +N` 기여.
- 피격 정지·봉인·교란 상태.

## 11. 책임 경계

```text
직접 작성
→ 신규·상위·즉석 변형·마나 사용

완성 주문 Stock
→ 준비 설계도 원터치 사용

하위 글자 Stock
→ 숙련 글자 자동 배치

소환수 [스톡]
→ 자연충전 남은 시간 정수 감소

소환수 [공격]/[방어도]/[치유]
→ 전투 지원, Stock 대상 선택은 하지 않음
```

## 12. 검증 경계

- 제품 코드와 Runtime은 아직 없다.
- 초기 용량 `8`, 1글자 `10초`, `[스톡] 1/2`, 5초 지원 주기는 Prototype 기본값이다.
- 사람 검증 전 상용 최종 밸런스로 주장하지 않는다.
