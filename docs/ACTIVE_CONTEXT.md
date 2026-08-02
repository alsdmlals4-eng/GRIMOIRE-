# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 책임 원본을 우선한다.

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
current_working_sync: GR-SYNC-20260802-25
current_pull_request: 51
current_decisions:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
grill_counter: 3_of_10
pending_decisions: 3
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
4. `docs/planning/STOCK_SYSTEM.md`
5. `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
6. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
7. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
8. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`
9. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
10. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
11. `docs/planning/sync/GR-SYNC-20260802-25-WORKING.md`

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

핵심은 필기 속도가 아니라 무엇을 바꾸고 무엇을 포기할지 결정하는 것이다.

## 시스템 계층

1. 비타협 핵심 플레이: 상황 판독·의미 조합·Commit·설명 가능한 결과·복기.
2. 핵심 진행: 학습 나선·다계열 수강·포트폴리오·학기 평가.
3. 적용 모드: 비전투 Situation·전투·제작·현장실습.
4. 보조·운용: 자유일정·관계·Stock·소환수·재료·도구.
5. 전달·안전·기술: Mobile UX·Recognition·Atomic Ledger·Save/Resume·접근성.

## Stock 최신 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
- `GM-STOCK-SYSTEM-01`

PR #51 초기의 `확인 글자 Token Rack` 해석은 폐기한다.

```text
완성 주문·하위 글자를 공용 준비 용량 안에서 편성
→ 지정 대상 1종 자연 충전
→ 플레이어가 필요한 순간에 사용
```

Prototype 기본값:

```yaml
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

충전 공식:

```text
기능 글자 수 n
→ 10 + 5 × (n - 1)초
```

## 소환수 최신 계약

책임 원본: `GM-SUMMON-SYSTEM-01`.

```text
메인 1체 = 상시 활성
기타 소환수 = [소환 주문] Commit 후 활성
Slice 추가 활성 상한 = 1체
지속시간·Cooldown = 없음
```

- 기타 소환수는 수동 귀환·교체·강제 귀환 전까지 유지한다.
- 장면 전환과 Save/Resume만으로 자동 해제하지 않는다.
- 시간 압박이 없는 장면에서는 행동 Clock만 정지한다.
- 소환 주문 비용은 고정 `마나 2`다.

### 정수 스탯

```text
[스톡] N
→ 5초마다 현재 자연충전 남은 시간 N초 감소

[방어도] N
→ 활성 중 총 방어도 +N
→ 최종 직접 피해 = max(1, 원피해 - 총 방어도)

[공격] N
→ 5초마다 유효 대상 불안정도 N 감소
→ 불안정도 1 아래·마지막 해결 Event 금지

[치유] N
→ 5초마다 플레이어 HP N 회복
→ 초과 회복 저장 없음
```

Slice 기본값:

- 메인 동반 정령 `[스톡] 1`.
- 생산형 `[스톡] 2`.
- 수호형 `[방어도] 2`.
- 공격형 `[공격] 2`.
- 치유형 `[치유] 2`.

## State·Ledger·Save

책임 원본: `GM-STOCK-SUMMON-STATE-INTERFACE-01`.

핵심 계약:

- Stock 편성·충전·소환 상태·전투 상태·Ledger 소유권을 분리한다.
- `[소환 주문]`의 마나 차감·교체·활성은 한 Transaction이다.
- Stock 소비와 효과 적용은 한 Transaction이다.
- 소환수 행동은 고유 `summon_event_id`로 정확히 한 번만 적용한다.
- 같은 시각 Event 순서는 `방어도 → 피해 → 충전 정지 → 치유 → 자연충전 → [스톡] → Stock 완성 → 공격`이다.
- Background·Offline 경과로 행동을 생성하지 않는다.

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

## Mobile UX 필수 정보

- 전체 Stock 준비 용량 `현재/8`.
- 현재 충전 대상·수량·남은 초.
- 활성 `[스톡]` 합계와 다음 5초 주기.
- 메인·추가 소환수 상태.
- `[방어도]·[공격]·[치유]` 정수값.
- 적 의도·불안정도·환경·플레이어 HP·마나.
- Writing Panel과 Commit.

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

## 잔여 기획

### P1

- 정수 State Interface를 TDD Plan과 연결.
- Stock·소환수 Mobile HUD Wireframe.
- 전용 Save/Resume·중복 Event Test.
- Godot Toolchain preflight.
- Base v9.4.3 Plan 재검증.
- Execution Readiness P0=0·P1=0.

### P2

- Battle Tuning·Result Grading.
- 대표 제작 미니게임.
- Grimoire·Main·Audio.
- 접근성·난이도.
- Year-One Chapter Map·글자 Catalog.
- 성장·평가·경제 수치.
- Slice 시간 예산.

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
STATE_INTERFACE = APPROVED_DESIGN_ONLY
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
