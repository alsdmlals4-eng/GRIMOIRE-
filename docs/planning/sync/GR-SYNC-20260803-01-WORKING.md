# GR-SYNC-20260803-01 — 보조 3체·벤치마킹/현업 비교·Text Integrity Working Sync

## 1. 상태

```yaml
sync_id: GR-SYNC-20260803-01
status: SYNCED_TO_WORKING_BRANCH_PENDING_FINAL_VERIFICATION
decision_ids:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
  - GM-GRILL-WORK-QUALITY-GATE-01
benchmark_id: GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01
approved_at: 2026-08-03T00:04:00+09:00
approval_mode: USER_DIRECTED_REAPPROVAL_AND_RECOMMENDED_GUARDS
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
working_branch: agent/grimoire-stock-summon-detail-audit
pull_request: 51
head: RESOLVE_FROM_FINAL_PR_HEAD
grill_counter: 4_of_10
pending_decisions: 4
sheet_readback: PASS
sheet_text_integrity_sentinel: PASS
final_head_ci: PENDING
adversarial_gate: PENDING
text_integrity_gate: PENDING
review_threads: PENDING
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 2. 승인 변경

### 소환수 활성 상한

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slots: [S1, S2, S3]
duration_limit: NONE
cooldown: NONE
summon_spell_mana_cost: 2
```

- 보조는 `[소환 주문]` Commit 후 활성화한다.
- 수동 귀환·교체·강제 귀환 전까지 유지한다.
- 세 슬롯이 가득 차면 교체할 슬롯을 먼저 명시하고 마나 2를 다시 지불한다.

### 역할 편성 가드

```yaml
secondary_roles:
  - PRODUCTION
  - GUARDIAN
  - ASSAULT
  - RECOVERY
secondary_role_duplicate_cap_in_slice: 1
```

- Slice에서는 네 역할 중 최대 세 역할을 선택한다.
- 보조 사이 같은 역할 중복을 금지한다.
- 메인 `[스톡] 1`은 보조 역할 중복 검사에서 제외한다.

### 정수 스탯

```yaml
main_stock_stat: 1
production_stock_stat: 2
guardian_defense_stat: 2
assault_attack_stat: 2
recovery_heal_stat: 2
support_cycle_seconds: 5
```

- 활성 `[스톡]` 합계 상한은 3을 유지한다.
- 자동 공격 불안정도 하한은 1이다.
- 마지막 Situation 해결 Event는 플레이어가 담당한다.

## 3. State/Ledger/Save

- `secondary_summon_states` 배열 최대 3개.
- `slot_id`와 보조 `primary_role` 유일성.
- 네 번째 보조 활성 차단.
- 역할 중복 소환 Transaction 롤백.
- 같은 시각 Event 순서 `MAIN → S1 → S2 → S3`.
- 보조 3체의 독립 주기와 Event ID 저장.
- 손상 슬롯·역할 중복 Save 자동 덮어쓰기 금지.
- Background·Offline Event 금지.

## 4. 벤치마킹·현업 비교

Benchmark: `GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01`.

판정:

- 다중 역할 슬롯: `ADAPT`.
- 메인 동반체 별도 상시 정체성: `ADOPT`.
- 현재 상태 중심·선택 상세 HUD: `ADAPT`.
- 보조 3체 자유 역할 중복: `REJECT_FOR_PROTOTYPE`.
- UTF-8 strict decode + Unicode NFC + Readback: `ADOPT`.

GRIMOIRE 권장안:

```text
메인 1체 상시
+ 보조 3체 역할 고유 편성
+ 보조 3슬롯 압축 Rail
+ 선택 슬롯 상세
```

## 5. 작업 품질 Gate

Decision: `GM-GRILL-WORK-QUALITY-GATE-01`.

앞으로 모든 GrillMe 질문과 실질 작업:

```text
결정 질문
→ QUICK/STANDARD/DEEP 벤치마킹
→ 직접 사례 + 현업/공식/표준 비교
→ ADOPT/ADAPT/REJECT
→ 중립 권장안
→ 적대적 검토
→ Text Integrity
→ GitHub·Sheet Readback
```

경량 동기화는 `N/A_NO_DESIGN_CHANGE`를 기록할 수 있지만 Text Integrity와 Readback은 필수다.

## 6. Text Integrity Gate

PR CI에 추가:

- UTF-8 strict decode.
- UTF-8 BOM 금지.
- Unicode NFC.
- replacement character `U+FFFD` 금지.
- 허용되지 않은 C0 제어문자 금지.
- mojibake 휴리스틱.
- JSON parse.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

Sheet 재조회 결과:

```yaml
secondary_summon_s1_s2_s3: PASS
secondary_role_uniqueness: PASS
benchmark_row: PASS
quality_gate_row: PASS
utf8_visible_text: PASS
replacement_character_visible: 0
sentinel_readback: PASS
obsolete_secondary_cap_1_in_current_decision_range: 0
```

CI·GitHub·Sheet Readback을 모두 통과하기 전 최종 PASS를 주장하지 않는다.

## 7. GitHub 반영 범위

- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`.
- `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
- `docs/planning/GRILL_WORK_BENCHMARK_TEXT_INTEGRITY_01_APPROVAL_2026-08-03.md`.
- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`.
- `docs/planning/PRE_MERGE_ADVERSARIAL_REVIEW_CHECKLIST_2026-08-02.md`.
- `docs/planning/benchmarks/SUMMON_ACTIVE_3_AND_WORK_QUALITY_QUICK_BENCHMARK_2026-08-03.md`.
- `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- `.github/workflows/validate-base-v9-adoption.yml`.
- 이 Sync Receipt.

## 8. Google Sheet 반영·Readback

반영·재조회 완료:

- `00_프로젝트_허브`.
- `01_작업순서`.
- `02_현재_확정결정`.
- `03_근거_라이브러리`.
- `04_누락_충돌_감사`.
- `05_GDD_요약`.
- `12_핵심루프`.
- `15_조작_게임규칙`.
- `40_핵심시스템_메인콘텐츠`.
- `41_성장_경제`.
- `60_UX_UI_접근성`.
- `80_데모_버티컬슬라이스_플레이테스트`.
- `98_Base_반영후보`.
- `99_변경이력`.

같은 Decision·Benchmark·Sync ID를 사용했다. 역사 행은 보존하고 현재 권위 행만 교체했다.

## 9. 적대적 위험

- 5초마다 보조 3체 Event가 겹쳐 결과 로그가 과밀해질 수 있음.
- 보조 3체 상세를 상시 노출하면 Mobile Writing Panel과 충돌함.
- 역할 중복을 허용하면 Stock 과가속·상시 방어·자동 공격 지배가 발생할 수 있음.
- 동시 모델·FX·오디오·Save Fixture·조합 QA 비용이 증가함.
- Text Integrity 휴리스틱은 오탐 가능성이 있으므로 CI 실패 시 원문을 확인해야 함.

가드:

- 역할 중복 금지.
- 압축 Rail + 선택 상세.
- 결정적 Event 순서.
- 슬롯별 Result 출처.
- Prototype 값은 최종 밸런스 아님.
- Runtime·Mobile·사람 검증 `NOT_RUN` 유지.

## 10. 잔여 P1

```yaml
p0_open: 0
p1_open: 4
p2_open: 12
p3_deferred: 8
```

1. 보조 3슬롯 Mobile HUD Wireframe.
2. TDD Plan·Test Matrix.
3. Godot Toolchain preflight.
4. Base v9.4.3 Plan 재검증·Execution Readiness.

## 11. 보호 경계

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
USER_MERGE_APPROVAL = NOT_GIVEN
```
