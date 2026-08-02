# GR-SYNC-20260802-25 — 자연충전 Stock·정수 상주 소환수·State Interface

## 상태

```yaml
sync_id: GR-SYNC-20260802-25
status: SYNCED_TO_WORKING_BRANCH
decision_ids:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
revised_at: 2026-08-02T23:14:00+09:00
approval_mode: USER_DIRECTED_REVISION_AND_DELEGATED_RECOMMENDED_CONTINUATION
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
working_branch: agent/grimoire-stock-summon-detail-audit
pull_request: 51
head: RESOLVE_FROM_FINAL_PR_HEAD
grill_counter: 3_of_10
pending_decisions: 3
sheet_readback: PASS
final_head_ci: PENDING
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 충돌 교정

기존 책임 원본은 다음 구조였다.

```text
완성 주문·하위 글자 Stock 준비
→ 지정 대상 1종 자연 충전
→ 플레이어가 필요한 순간에 사용
```

PR #51 초기 `확인 글자 Token Rack 4칸`은 동일 이름의 기존 정본과 충돌해 폐기했다.

교정한 책임 원본:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`.

## Stock 승인 기본값

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n인 Stock 충전시간
= 10 + 5 × (n - 1)초
```

## 소환수 승인 기본값

```yaml
main_summon: ALWAYS_ACTIVE
additional_active_summon_cap: 1
duration_limit: NONE
cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
main_stock_stat: 1
secondary_stock_stat: 2
defense_stat: 2
attack_stat: 2
heal_stat: 2
```

- 기타 소환수는 `[소환 주문]` Commit 후 활성화한다.
- 수동 귀환·교체·강제 귀환 전까지 유지한다.
- 장면 전환·Save/Resume만으로 자동 해제하지 않는다.
- 무압박 장면에서는 주기 행동만 정지한다.

```text
[스톡] N
→ 5초마다 현재 Stock 남은 충전시간 -N초

최종 직접 피해
= max(1, 원피해 - 총 방어도)

[공격] N
→ 유효 대상 불안정도 -N, 하한 1

[치유] N
→ HP +N, 초과 회복 저장 없음
```

퍼센트 출력·퍼센트 피해 경감·퍼센트 소환 비용은 사용하지 않는다.

## State/Ledger/Save

```yaml
decision_id: GM-STOCK-SUMMON-STATE-INTERFACE-01
approved_option: A_SINGLE_ACTIVE_PRESSURE_CLOCK_WITH_ATOMIC_EVENT_LEDGER
status: USER_DELEGATED_RECOMMENDED_OPTION
```

확정:

- Stock 편성·충전·소환·전투·Ledger 단일 소유권.
- `[소환 주문]`의 마나 차감·교체·활성 원자 Transaction.
- Stock 소비·효과 적용 원자 Transaction.
- `summon_event_id`·`stock_charge_event_id` Exactly-once.
- 동일 시각 Event 순서.
- 상주 소환 상태 Save/Resume.
- Offline·Background Event 금지.

## Cold-start 교정

- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.

## 잔여 기획

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
p0_open: 0
p1_open: 4
p2_open: 12
p3_deferred: 8
```

P1:

1. Mobile HUD Wireframe.
2. TDD Plan·Test Matrix 연결.
3. Godot Toolchain preflight.
4. Base v9.4.3 Plan 재검증·Execution Readiness.

## Google Sheet Readback

반영·재조회 탭:

- `00`, `01`, `02`, `04`, `12`, `15`, `40`, `41`, `60`, `80`, `99`.

```yaml
natural_charge_stock_rows: PASS
persistent_integer_summon_rows: PASS
state_ledger_save_rows: PASS
obsolete_token_rack_current_rows: REPLACED
obsolete_timed_percentage_current_rows: REPLACED
row_overwrite: 0
sheet_readback: PASS
```

## 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_SUMMON_RUNTIME = NOT_AUTHORIZED_BY_THIS_SYNC
PROTOTYPE_DEFAULTS_ARE_FINAL_BALANCE = false
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```
