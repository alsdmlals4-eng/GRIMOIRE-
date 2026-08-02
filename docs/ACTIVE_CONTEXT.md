# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 최신 Decision 책임 원본을 우선한다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-stock-summon-detail-audit
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
last_main_sync: GR-SYNC-20260802-24
current_working_sync: GR-SYNC-20260803-01
current_pull_request: 51
current_decisions:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
  - GM-GRILL-WORK-QUALITY-GATE-01
grill_counter: 4_of_10
pending_decisions: 4
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation: NOT_STARTED
codex_plan: ALLOWED
codex_execution: BLOCKED_BY_EXECUTION_READINESS_GATE
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 복원 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. 이 문서
4. `docs/DEVELOPMENT_GATES.md`
5. `docs/DESIGN_DOCUMENT_REGISTRY.json`
6. `docs/planning/GRILL_WORK_BENCHMARK_TEXT_INTEGRITY_01_APPROVAL_2026-08-03.md`
7. `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
8. `docs/planning/STOCK_SYSTEM.md`
9. `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
10. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
11. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
12. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`
13. `docs/planning/benchmarks/SUMMON_ACTIVE_3_AND_WORK_QUALITY_QUICK_BENCHMARK_2026-08-03.md`
14. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
15. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
16. `docs/planning/sync/GR-SYNC-20260803-01-WORKING.md`

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

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

핵심은 필기 속도나 자동화량이 아니라 무엇을 바꾸고 무엇을 포기할지 결정하는 것이다.

## 시스템 계층

1. 비타협 핵심 플레이: 상황 판독·의미 조합·Commit·설명 가능한 결과·복기.
2. 핵심 진행: 학습 나선·다계열 수강·포트폴리오·학기 평가.
3. 적용 모드: 비전투 Situation·전투·제작·현장실습.
4. 보조·운용: 자유일정·관계·Stock·소환수·재료·도구.
5. 전달·안전·기술: Mobile UX·Recognition·Atomic Ledger·Save/Resume·접근성.

## Stock 최신 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n
→ 10 + 5 × (n - 1)초
```

- 지정 대상 1종만 자연충전한다.
- 충전 대상 전환 시 대상별 진행도를 보존한다.
- 소환수 `[스톡] N`은 5초마다 현재 지정 Stock 남은 시간을 `N초` 감소시킨다.
- 초과 감소량 이월·자동 대상 변경·Offline 충전을 금지한다.

## 소환수 최신 계약

책임 원본: `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slots: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
summon_duration_limit: NONE
resummon_cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
```

보조 역할:

- `PRODUCTION`.
- `GUARDIAN`.
- `ASSAULT`.
- `RECOVERY`.

- Slice에서는 네 역할 중 최대 세 역할을 편성한다.
- 보조 사이 같은 역할 중복을 금지한다.
- 메인 동반 정령의 `[스톡] 1`은 보조 역할 중복 판정에서 제외한다.
- 보조 기본값은 `[스톡] 2 / [방어도] 2 / [공격] 2 / [치유] 2`다.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3` 순서로 처리한다.
- 자동 공격은 불안정도 `1` 아래·마지막 해결 Event를 만들 수 없다.

```text
최종 직접 피해
= max(1, 원피해 - 총 방어도)
```

## State·Ledger·Save

책임 원본: `GM-STOCK-SUMMON-STATE-INTERFACE-01`.

- 보조 상태는 `secondary_summon_states` 배열로 저장하며 최대 3개다.
- `slot_id`와 보조 `primary_role`은 각각 유일해야 한다.
- `[소환 주문]`의 마나 차감·교체·활성은 한 Transaction이다.
- Stock 소비와 효과 적용도 한 Transaction이다.
- 소환수 행동은 고유 `summon_event_id`로 정확히 한 번만 적용한다.
- 슬롯·역할 중복 또는 보조 4체 이상 Save는 자동 수정하지 않고 복구 UI로 보낸다.
- Background·Offline 경과로 행동·충전 지원을 생성하지 않는다.

## Mobile UX 필수 정보

```text
메인 소환수 배지
+ 보조 S1/S2/S3 압축 Rail
+ 선택 슬롯 상세 Panel
```

항상 표시:

- 전체 Stock 준비 용량 `현재/8`.
- 현재 충전 대상·수량·남은 초.
- 활성 `[스톡]` 합계.
- 메인·보조 3슬롯 역할·대표 정수·다음 행동 초·상태.
- 적 의도·불안정도·환경·플레이어 HP·마나.
- Writing Panel과 Commit.

선택한 보조 슬롯에만 대상 규칙·예상 적용값·마지막 Event·귀환·교체를 상세 표시한다.

## 작업 품질 Gate

책임 원본: `GM-GRILL-WORK-QUALITY-GATE-01`.

모든 GrillMe 질문과 실질 작업:

```text
프로젝트 정본·실제 상태
→ 결정 질문
→ QUICK/STANDARD/DEEP 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT/ADAPT/REJECT
→ 중립 권장안
→ 적대적 검토
→ UTF-8·NFC·Text Integrity
→ GitHub·Sheet Readback
```

경량 동기화는 `N/A_NO_DESIGN_CHANGE`를 기록할 수 있지만 Text Integrity와 Readback은 필수다.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## Vertical Slice 범위

```text
첫 수업·교내 연습
→ 자유일정
→ 교내 일상 응용·대표 제작 미니게임
→ 학교축제 비전투 응용
→ 첫 현장실습 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기 평가·장기 Preview
```

- 별도 시험 Chapter 없음.
- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 권장: `촉매 배합·안정화 1개`.

## 구현 진입

전체 Vertical Slice 구현은 승인되지 않았다.

Execution Readiness PASS 후 허용 후보:

- 최소 Godot 프로젝트.
- Focus Task 상태 전이.
- Atomic Result Ledger.
- Stroke·Draft·Candidate 생명주기.
- Deterministic Test Recognizer.
- Session Snapshot·atomic save.
- Pause·Resume·Focus loss.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

Stock·소환수 Runtime은 별도 Scope 승인 없이 Foundation POC에 자동 포함하지 않는다.

## 잔여 P1

1. 보조 3슬롯 Mobile HUD Wireframe.
2. State/Ledger/Save TDD Plan·Test Matrix.
3. Godot Toolchain preflight.
4. Base v9.4.3 Plan 재검증·Execution Readiness.

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
STATE_INTERFACE = APPROVED_DESIGN_ONLY
WORK_QUALITY_GATE = APPROVED_ACTIVE
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
