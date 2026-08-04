# GM-STOCK-SYSTEM-01 — Stock 자연충전 승인 이력 `[부분 대체됨]`

## 현재 상태

```yaml
decision_id: GM-STOCK-SYSTEM-01
status: USER_APPROVED_HISTORY_PARTIALLY_SUPERSEDED
approved_at: 2026-08-02T23:14+09:00
first_superseding_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
latest_superseding_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
latest_superseding_pull_request: 61
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

이 문서는 초기 Stock 방향의 역사적 근거다. 현재 구현 책임 원본이 아니며, 아래 “계승 범위” 외의 공용 용량·특정 글자 충전·충전 대상 전환·특정 글자 Stock 데이터는 사용하지 않는다.

## 계승 범위

다음 원칙만 현재 자원 계약에 계승한다.

- Stock은 반복 입력 부담을 줄이는 준비 자원이다.
- 자연충전은 Active Pressure 기준이다.
- Offline·Background catch-up을 사용하지 않는다.
- 소환수 `[스톡]` 지원은 현재 자연충전의 남은 시간을 정수 단위로 줄이는 후보다.
- 소비와 결과 적용은 같은 Transaction ID로 원자 처리한다.
- 미습득 글자는 준비 자원으로 건너뛰지 않는다.
- 완성 주문 원터치 Stock은 금지한다.

모든 과거 수치는 `TEST_VALUE`이며 새 자원 경제에서 재검증한다.

## 최신 자원 정의

```yaml
current_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_pool: LEARNED_MAIN_OR_SUPPORT
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
focus_scribe: EXACT_GLYPH_VAULT_PLUS_1
source_selection: EXPLICIT_SOURCE_SELECTION
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

## 대체된 과거 계약

```text
공용 보관함·Stock 용량
특정 글자별 자연충전 진행도
자연충전 대상 글자 선택·전환
특정 글자 Stock 수량
집중 필사 성공으로 특정 글자 Stock 생성
완성 주문 Stock
= 현재 구현 금지
```

## 현재 책임 원본

- 승인: `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- 상세 설계: `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.
- 자원: `docs/planning/STOCK_SYSTEM.md`.
- 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`.
- 자연충전: `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- 피격: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`.
- 충전 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md` `[폐기]`.
- 상태 색인: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.

이 문서와 최신 Decision이 충돌하면 `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`을 우선한다.
