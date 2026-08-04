# [보류] Spell 상태이상–글자 Stock 연동 시스템

```yaml
status: ON_HOLD_REDESIGN_REQUIRED
held_at: 2026-08-04T09:37+09:00
reference_as_current_numeric_contract: false
reason: LEGACY_TWO_STOCK_TYPES_AND_PERCENT_SPEED_MODEL_CONFLICT
parent_current_system: docs/planning/STOCK_SYSTEM.md
current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
historical_content: GIT_HISTORY_ONLY
```

과거 문서는 완성 주문 Stock·하위 글자 Stock의 두 종류와 `%` 충전 감속을 전제로 한다. 현재는 typed glyph Stock만 존재하므로 세부 상태이상 계약을 그대로 사용하지 않는다.

## 유지 가능한 방향

- 직접 피해: 진행도를 삭제하지 않고 짧게 방해.
- 지속 피해: 기본적으로 자연충전과 집중 필사를 직접 중단하지 않음.
- 주문 봉인: 글자 Stock 사용 제한 후보.
- 마력 봉쇄: 희귀 상위 상태 후보.
- 상태이상으로 보유 Stock·진행도를 삭제하지 않음.

## 재설계 필요

- `% 충전 감속` 대신 정수 `남은 충전시간 +N` 또는 소환수 주기 감소량 제한.
- 글자 Stock 사용 봉인과 3×3 회로 편집 봉인을 분리.
- `[집중 필사]` 진입·유지·중단에 대한 상태별 효과.
- 상태 중첩·저항·UI·접근성.

이 재설계는 현재 정본 병합을 막지 않으며 전투 상태이상 설계 단계에서 별도 Decision으로 승인한다.
