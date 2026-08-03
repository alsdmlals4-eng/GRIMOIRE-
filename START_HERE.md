# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile / Landscape Fixed` |
| 후속 플랫폼 | `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| main 권위 | `7fd2c137469120a9ccf942df5b9860af135acc87 / GR-SYNC-20260803-04` |
| Working Branch | `agent/mobile-summon-hud-spec-hardening` |
| Working Sync | `GR-SYNC-20260803-05` |
| Grill Batch | `0/10 / pending distinct decisions 0` |
| Mobile HUD 사용자 명세 | `USER_APPROVED_HARDENED_SPEC_ACTIVE` |
| TDD Plan·Test Matrix | `WRITTEN_NOT_EXECUTED` |
| 남은 P1 | `2 — Toolchain preflight / Base v9.4.3 Plan 재검증·Execution Readiness` |
| 제품 구현 | `NOT_STARTED` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/DEVELOPMENT_GATES.md`.
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
5. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
6. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
7. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
8. `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
9. `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
10. `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.
11. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
12. `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.
13. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`.
14. `docs/planning/sync/GR-SYNC-20260803-05-WORKING.md`.
15. `docs/planning/sync/GR-SYNC-20260803-04-MAIN.md`.

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 조합해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

```text
상황·위험 판독
→ 직접 작성·준비 Stock·[소환 주문] 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

## Stock 최신 계약

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
기능 글자 수 n의 Stock 충전시간
= 10 + 5 × (n - 1)초
```

소환수 `[스톡] N`은 5초마다 현재 지정 Stock 남은 시간을 `N초` 감소시키며 초과분은 이월하지 않는다.

## 소환수 최신 계약

```yaml
persistent_main_summon: 1
secondary_slots: [S1, S2, S3]
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_role_duplicate_cap_in_slice: 1
summon_duration_limit: NONE
resummon_cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
```

보조 역할은 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`다. Slice에서는 네 역할 중 최대 세 역할을 선택하며 보조 사이 같은 역할 중복을 금지한다.

Prototype 기본값:

```yaml
main_stock_stat: 1
production_stock_stat: 2
guardian_defense_stat: 2
assault_attack_stat: 2
recovery_heal_stat: 2
```

자동 공격은 불안정도를 `1` 아래로 낮추거나 마지막 해결 Event가 될 수 없다.

## State·Ledger·Save

- 보조 상태는 `secondary_summon_states` 최대 3개 배열이다.
- 슬롯·보조 역할은 각각 유일해야 한다.
- `[소환 주문]`은 마나 차감·교체·활성화를 한 Transaction으로 처리한다.
- Stock 소비와 주문 효과 적용도 한 Transaction이다.
- `summon_event_id`의 Exactly-once 적용은 `ResultLedger`가 단독 소유한다.
- HUD는 canonical presentation record만 읽으며 Event 적용 여부를 판단하지 않는다.
- Background·Offline 경과로 행동·충전 지원을 생성하지 않는다.

## 승인된 Mobile Summon HUD

```text
좌측 Safe Area
MAIN → S1 → S2 → S3 압축 Rail
+ 선택한 1슬롯 Contextual Drawer
+ 우측 Writing Focus Panel
```

확정 계약:

```yaml
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_order: [MAIN, S1, S2, S3]
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_tests: [100_PERCENT, 130_PERCENT, ANDROID_MAX_200_PERCENT]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
hud_mutates_gameplay_state: false
```

- Active Stroke 중 Rail 접촉은 선택·Focus 이동·귀환·교체를 만들지 않는다.
- 빈 슬롯·오류 슬롯은 nullable ViewModel과 `timing_mode: NONE`을 사용한다.
- Drawer 읽기는 무료 Pause가 아니다.
- 안전한 Draft 보존 뒤 명시적 `MANAGEMENT_CONFIRM`에서만 Clock이 정지한다.
- 동시 Event의 전체 HUD 연출 예산은 `1.2초 TEST_VALUE`다.
- 타이머는 매초 음성 발표하지 않는다.

## TDD Plan·Test Matrix

작성 완료:

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

주요 미래 Test:

- nullable ViewModel과 안정된 슬롯 순서.
- Drawer·관리 확인 Clock 계약.
- `MAIN→S1→S2→S3`와 전체 `1200ms` 표시 예산.
- Active Stroke 입력 소유권.
- `16:9 / 19.5:9 / 20:9`, 좌·우 Cutout.
- Text Scale `100% / 130% / Android 최대 200%`.
- 타이머 비과잉 발표.
- Save/Resume·오류 보존·HUD dedup 소유권 금지.

모든 Test는 현재 `NOT_RUN`이다.

## 작업 품질 Gate

```text
프로젝트 근거
→ 벤치마킹
→ 공식·현업·표준 비교
→ ADOPT / ADAPT / REJECT
→ 중립 권장안
→ 적대적 검토
→ UTF-8·NFC·Text Integrity
→ GitHub·Sheet Readback
```

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정
→ 교내 일상 응용·대표 제작 미니게임
→ 학교축제 비전투 응용
→ 첫 현장실습 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기 평가·장기 Preview
```

- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 권장: `촉매 배합·안정화 1개`.

## 남은 P1

1. Godot Toolchain preflight: binary·version·renderer·headless test·Mobile export template·경로 권한.
2. Base v9.4.3 최종 main 기준 Plan 재검증과 `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.

P0는 `0`이다. P1이 모두 닫히고 별도 Scope가 승인되기 전에는 제품 코드 실행으로 넘어가지 않는다.

## 구현 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = WRITTEN_NOT_EXECUTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
