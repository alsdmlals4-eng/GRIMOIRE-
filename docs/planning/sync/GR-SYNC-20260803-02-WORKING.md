# GR-SYNC-20260803-02 — 보조 3슬롯 Mobile HUD Wireframe Working Sync

## 1. 상태

```yaml
sync_id: GR-SYNC-20260803-02
status: SYNCED_TO_WORKING_BRANCH_CANDIDATE_VERIFIED_AWAITING_FINAL_STATUS_RECHECK_AND_USER_SPEC_REVIEW
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
approved_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
approved_at: 2026-08-03T07:49:00+09:00
approval_mode: USER_DELEGATED_RECOMMENDED_OPTION
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
working_branch: agent/grimoire-stock-summon-detail-audit
pull_request: 51
verification_candidate_head: d56a2105357593222fef3e7b26ca36a5725b45b1
verification_candidate_ci_run: 30771278479
verification_candidate_ahead: 58
verification_candidate_behind: 0
verification_candidate_changed_files: 24
grill_counter: 5_of_10
pending_decisions: 5
sheet_readback: PASS
sheet_sentinel: PASS
candidate_ci_gate: PASS
candidate_adversarial_gate: PASS
candidate_text_integrity_gate: PASS
candidate_review_threads: 0
candidate_reviews: 0
final_status_head_ci: RECHECK_REQUIRED
spec_user_review: PENDING
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 2. 승인 구조

```text
좌측 Safe Area
→ MAIN / S1 / S2 / S3 세로 압축 Rail
→ 선택한 슬롯 1개만 중앙 방향 상세 Drawer

우측 Safe Area
→ 기존 확장 Writing Focus Panel
```

상단 목표·적 의도·타이머·환경 위험과 하단 HP·마나·Stock·Commit 책임을 침범하지 않는다.

## 3. 슬롯 정보

각 압축 슬롯:

- 슬롯 ID.
- 소환수 초상 또는 Silhouette.
- 주 역할 아이콘과 문구.
- 대표 정수 스탯.
- 다음 행동까지 남은 초 또는 `상시`.
- 상태 문구.

상태:

```text
정상 / 정지 / 봉인 / 무효 / 오류 / 빈 슬롯
```

## 4. 선택 상세 Drawer

하나의 슬롯만 확장한다.

- 소환수 이름·역할.
- 고정 대상 규칙.
- 대표 정수 스탯.
- 다음 Event 적용 전·후 예상값.
- 남은 주기·정지 사유.
- 마지막 Event ID·결과.
- 허용 상태의 귀환·교체.

Drawer 열기만으로 Active Pressure Clock을 정지하지 않는다.

## 5. Writing Focus

Writing Panel 확장 중:

- Rail 유지.
- 전체 Drawer 닫힘.
- 읽기 전용 Micro Detail만 허용.
- 귀환·교체 숨김.
- Canvas 입력 우선.
- Rail 입력으로 진행 중 Stroke 취소 금지.

## 6. Event·Result

동시 Event 표시 순서:

```text
MAIN → S1 → S2 → S3
```

- 한 번에 출처 슬롯 하나 강조.
- 정수 Delta 표시.
- 슬롯과 Event ID를 Result Ledger에 기록.
- 자동 공격은 불안정도 1 아래·마지막 해결 Event 금지.

## 7. 접근성·Safe Area

- Android Touch target 최소 `48dp × 48dp`.
- iOS 주요 Touch target 최소 `44pt × 44pt`.
- Text Scale `130%` 필수.
- 색 외 슬롯·역할·수치·시간·상태 문구.
- Reduced Motion 정적 강조.
- Godot `DisplayServer.get_display_safe_area()` 기반 런타임 Safe Area.
- `16:9`, `19.5:9`, `20:9`, 좌·우 Cutout 검증.

## 8. Benchmark 판정

```yaml
ADOPT:
  - SAFE_AREA_EDGE_ANCHOR
  - PLATFORM_TOUCH_TARGETS
  - CONTEXTUAL_CONTROL_VISIBILITY
  - UNIQUE_ACCESSIBLE_DESCRIPTIONS
ADAPT:
  - LEFT_VERTICAL_RAIL_FOR_RIGHT_WRITING_PANEL
  - ONE_SELECTED_DETAIL_DRAWER
  - MAIN_S1_S2_S3_VISUAL_EVENT_ORDER
REJECT:
  - TOP_RAIL_COMPETING_WITH_TIMER
  - BOTTOM_RAIL_COMPETING_WITH_RESOURCES_AND_HAND
  - FOUR_ALWAYS_EXPANDED_CARDS
  - HIDDEN_CAROUSEL_SLOTS
  - COLOR_ONLY_STATE
  - FREE_PAUSE_DETAIL_PANEL
```

## 9. GitHub 반영 완료

- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- 이 Working Sync.

## 10. Google Sheet 반영 완료

- `00_프로젝트_허브`.
- `01_작업순서`.
- `02_현재_확정결정`.
- `03_근거_라이브러리`.
- `04_누락_충돌_감사`.
- `05_GDD_요약`.
- `12_핵심루프`.
- `60_UX_UI_접근성`.
- `80_데모_버티컬슬라이스_플레이테스트`.
- `99_변경이력`.

같은 Decision·Benchmark·Sync ID를 재조회했다. `소환수·자연충전·적대적 검토·벤치마킹·마도서` Sentinel은 PASS이고 대체문자 `�` 검색 결과는 0건이다.

## 11. 적대적 위험

- 좌측 대상 정보와 Rail 충돌.
- Drawer를 이용한 무료 Pause.
- Rail Touch가 Writing Stroke 취소.
- 네 Event 출처 혼동.
- Text Scale 130%에서 슬롯 붕괴.
- HUD가 State를 직접 수정.

가드:

- 충돌 시 슬롯 순서를 유지한 하단 Safe Anchor.
- 읽기 Drawer Clock 계속 진행.
- Writing 중 관리 조작 숨김.
- 결정적 Event 순서와 출처 1개 강조.
- 장식 우선 축소.
- 읽기 전용 View Model.

## 12. 검증 후보 증거

```yaml
head: d56a2105357593222fef3e7b26ca36a5725b45b1
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
ahead: 58
behind: 0
changed_files: 24
product_code_changed: false
ci_run: 30771278479
ci_gate: PASS
json_parse: PASS
utf8_nfc_text_integrity: PASS
adversarial_gate: PASS
review_threads: 0
reviews: 0
```

이 Receipt와 Batch 상태를 기록한 최종 상태 HEAD는 별도로 재검증한다.

## 13. 다음 Gate

```text
사용자 Spec Review
→ writing-plans 기반 TDD Plan·Test Matrix
→ Godot Toolchain preflight
→ Base v9.4.3 Plan 재검증
→ Execution Readiness
```

## 14. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED
TDD_IMPLEMENTATION_PLAN = BLOCKED_UNTIL_USER_SPEC_REVIEW
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
USER_MERGE_APPROVAL = NOT_GIVEN
```