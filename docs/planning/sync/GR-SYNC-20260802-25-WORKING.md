# GR-SYNC-20260802-25 — Stock·Summon 상세 기본값 및 잔여 기획 감사

## 상태

```yaml
sync_id: GR-SYNC-20260802-25
status: SYNCED_TO_WORKING_BRANCH
decision_ids:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
approved_at: 2026-08-02T22:36:00+09:00
approval_mode: USER_DELEGATED_RECOMMENDED_OPTION
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
working_branch: agent/grimoire-stock-summon-detail-audit
head: RESOLVE_FROM_PR_HEAD
grill_counter: 2_of_10
pending_decisions: 2
sheet_readback: PASS
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 승인된 Stock 기본값

```yaml
unit: CONFIRMED_GLYPH_TOKEN
rack_slots: 4
duplicate_glyph_cap: 2
anchor_floor: 2
direct_first_valid_commit_generation: 1
summon_refill_cap_per_focus_task: 3
persistence: CHAPTER_AND_SESSION
permanent_accumulation: false
offline_generation: false
```

- 완성 주문·대상·상황·자동 최적 조합은 저장하지 않는다.
- Token은 Commit 승인과 세계 변화 적용 시 소비한다.
- 취소·문법 실패·마나 부족은 소비하지 않는다.
- Rack 초과는 Pending 1개로 결과 화면에서 교체한다.

## 승인된 소환수 기본값

```yaml
main_summon: ALWAYS_ACTIVE
secondary_active_cap: 1
main_stock_tick_seconds: 20
main_stock_cap_per_focus_task: 1
summon_cost_max_mana_percent: 20
secondary_duration_seconds: 30
resummon_cooldown_seconds: 20
spell_tick_seconds: 10
spell_action_cap: 3
stock_tick_seconds: 12
stock_refill_cap: 2
auto_spell_output_percent: 60
auto_contribution_cap_percent: 25
guardian_player_damage_reduction_percent: 35
guardian_environment_damage_reduction_percent: 25
```

- Active Pressure Clock을 사용한다.
- Pause·Resolve·Focus loss·Background·Save/Load 중 정지한다.
- Offline catch-up이 없다.
- 자동 주문은 불안정도 0·치명 목표 완료·마지막 승리 Event가 될 수 없다.
- `GM-BATTLE-RULES-01`의 수동 1회·자동 행동 금지 수호 소환수 규칙은 이 Decision이 대체한다.

## 작성·자동화 예산

```text
의미 있는 주문 해결 7~10회
= 직접 작성 4~6회
+ Stock 보조 2~4회
+ 소환수 자동 행동 1~3회
```

직접 작성이 전체 유효 해결의 40% 미만이면 `REWORK`한다.

## Cold-start 교정

직접 교정한 권위 문서:

- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`

교정 내용:

- Mobile 우선·Base v9.4.3·최신 main/Sync.
- 별도 시험 제거.
- Stock·소환수 상세 계약.
- Battle Rules 수동 수호 계약 대체.
- P1/P2/P3 잔여 기획.
- 구현·검증 증거 상한 보존.

## 잔여 기획 감사

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
p0_open: 0
p1_open: 7
p2_open: 12
p3_deferred: 8
```

### P1

1. Stock·Summon State/Ledger/Save 인터페이스.
2. 작성·자동화·시간 예산 검증.
3. Mobile HUD.
4. 전용 Test 계약.
5. Godot Toolchain preflight.
6. Base v9.4.3 Plan 재검증.
7. Execution Readiness P0=0·P1=0.

### P2

- Battle Tuning·Result Grading.
- 대표 제작 미니게임과 Slice 범위.
- Grimoire·Main·Audio.
- 접근성·난이도.
- Year-One Chapter Map.
- 커리큘럼·성장·평가·경제 수치.
- Slice 시간 예산.

## Google Sheet 반영·Readback

반영·재조회 완료:

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `04_누락_충돌_감사`
- `12_핵심루프`
- `15_조작_게임규칙`
- `40_핵심시스템_메인콘텐츠`
- `41_성장_경제`
- `60_UX_UI_접근성`
- `80_데모_버티컬슬라이스_플레이테스트`
- `99_변경이력`

확인:

```yaml
stock_decision_row: PASS
summon_decision_row: PASS
stock_system_and_economy_rows: PASS
summon_system_and_economy_rows: PASS
hud_contract_rows: PASS
test_contract_rows: PASS
planning_remainder_audit_row: PASS
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
