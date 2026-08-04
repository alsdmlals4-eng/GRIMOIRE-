# 특정 글자 Stock 충전 대상 전환 시스템 — `[폐기]`

## 현재 상태

```yaml
status: RETIRED_SUPERSEDED
historical_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
superseding_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
superseding_pull_request: 61
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

```text
NO_CHARGE_TARGET_SWITCH_WITH_UNIVERSAL_STOCK
```

이 문서는 특정 글자별 Stock과 글자별 자연충전 진행도를 전제로 작성됐다. 현재 자연충전 결과는 사용 시점에 습득한 핵심·보조 글자 중 하나를 선택할 수 있는 범용 Stock이므로, 충전 대상 글자 선택·진행도 저장·전환 지연 시스템은 필요하지 않다.

## 폐기된 계약

```text
자연충전 대상 glyph_id 선택
글자별 충전 진행도 보존
충전 대상 전환 지연
소환수 지원의 지정 글자 적용
집중 필사와 충전 대상의 병렬 비교
= 현재 구현 금지
```

## 현재 계약

```yaml
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
output: UNIVERSAL_GLYPH_STOCK_PLUS_1
selection_time: GLYPH_NODE_PLACEMENT
allowed_pool: LEARNED_MAIN_OR_SUPPORT
charge_target_switch: prohibited
```

- 자연충전 게이지는 하나다.
- Stock을 소비할 때 사용할 습득 글자를 고른다.
- 보관함은 직접 그린 특정 글자별 슬롯이며 자연충전 대상이 아니다.
- 소환수 `[스톡]`은 단일 범용 충전의 남은 시간만 줄인다.

## UI 영향

다음 UI를 만들지 않는다.

- 현재 충전 글자.
- 다른 글자의 저장 충전 진행도.
- 충전 대상 전환 버튼.
- 전환 지연 게이지.

대신 표시한다.

- 범용 Stock 현재/최대 수량.
- 다음 범용 Stock까지 남은 시간.
- 보관함의 특정 글자 목록.
- 글자 노드 배치 시 보관함/Stock 출처 선택.

## 현재 책임 원본

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`.

과거 전체 설계는 Git 이력에만 보존한다.
