# [보류] 상태이상–보관함·범용 Stock 연동 시스템

```yaml
status: ON_HOLD_REDESIGN_REQUIRED
held_at: 2026-08-05T00:31+09:00
reference_as_current_numeric_contract: false
reason: LEGACY_TYPED_STOCK_AND_PERCENT_SPEED_MODEL_CONFLICT
parent_current_system: docs/planning/STOCK_SYSTEM.md
current_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
historical_content: GIT_HISTORY_ONLY
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

과거 설계는 완성 주문 Stock·특정 글자 Stock·글자별 충전 대상·`%` 충전 감속을 전제로 한다. 현재는 `EXACT_GLYPH_VAULT + UNIVERSAL_GLYPH_STOCK + 단일 범용 자연충전` 구조이므로 과거 세부 계약을 사용하지 않는다.

## 유지 가능한 방향

- 직접 피해: 범용 Stock 충전 진행도를 삭제하지 않고 짧게 정지.
- 직접 피해: 집중 필사 중단과 예약 보관함 슬롯 해제.
- 지속 피해: 기본적으로 범용 자연충전과 집중 필사를 직접 중단하지 않음.
- 주문 봉인: 회로 Commit 또는 특정 글자 역할 제한 후보.
- 자원 봉인: 범용 Stock과 보관함 사용 제한을 분리하는 후보.
- 마력 봉쇄: 희귀 상위 상태 후보.
- 상태이상으로 보유 Stock·보관함 글자·충전 진행도를 삭제하지 않음.

## 재설계 필요

- `% 충전 감속` 대신 정수 `남은 범용 충전시간 +N` 또는 소환수 주기 감소량 제한.
- 범용 Stock 봉인, 특정 보관함 글자 봉인, 3×3 회로 편집 봉인을 분리.
- `[집중 필사]` 진입·유지·중단과 보관함 슬롯 예약에 대한 상태별 효과.
- 범용 Stock과 보관함이 모두 가능한 노드에서 봉인 우선순위와 오류 설명.
- 상태 중첩·저항·UI·접근성.

## 금지

```text
LEGACY_COMPLETE_SPELL_STOCK_STATUS_RULES
PER_GLYPH_NATURAL_CHARGE_TARGET_STATUS
STATUS_DELETES_STORED_RESOURCE
HIDDEN_PERCENT_SLOW_WITHOUT_PREVIEW
STATUS_AUTO_CONVERTS_VAULT_AND_STOCK
```

이 재설계는 PR #61의 Draft Spec 검토를 막지 않는다. 전투 상태이상 설계 단계에서 별도 Decision과 TDD 계약으로 승인한다.
