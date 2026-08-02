# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 Decision 책임 원본을 우선한다.

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
current_decisions:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
grill_counter: 2_of_10
pending_decisions: 2
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
4. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
5. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
6. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
7. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`
8. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260802-25-WORKING.md`
11. 질문 주제의 세부 승인 책임 원본

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미와 상황의 조건을 배우고, 직접 작성·Stock·소환수 주기 지원을 상황에 맞게 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

```text
상황·조건·위험 판독
→ 직접 작성·Stock·소환 운용 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit 또는 [소환] Commit
→ 플레이어 주문·소환수 주기 행동 원자 적용
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

## Stock 상세 계약

책임 원본: `GM-STOCK-SYSTEM-01`.

```text
Stock 1개 = 직접 확인한 글자 Token 1개
```

Slice 권장 기본값:

- Rack `4칸`.
- 동일 글자 최대 `2개`.
- Chapter·주요 Resume Anchor에서 총량이 2개 미만이면 `2개까지 보정`.
- Focus Task에서 글자별 첫 유효 직접 Commit 후 Token `+1`.
- 플레이어 사용은 삽입 글자 1개당 Token 1개.
- Token은 Commit 승인·세계 변화 적용 시 소비.
- 취소·문법 실패·마나 부족·중복 Commit 차단은 소비하지 않음.
- 완성 주문·대상·상황·자동 최적 조합은 저장하지 않음.
- Chapter·Session Snapshot에는 저장하지만 영구 계정 자원으로 누적하지 않음.
- Offline·Background 충전 없음.

Slice 목표:

```text
의미 있는 주문 해결 7~10회
= 직접 작성 4~6회
+ Stock 보조 2~4회
+ 소환수 자동 행동 1~3회
```

직접 작성이 4회 미만 또는 전체 유효 해결의 40% 미만이면 `REWORK`한다.

## 소환수 상세 계약

책임 원본: `GM-SUMMON-SYSTEM-01`.

```text
메인 소환수 1체 = 상시 활성
기타 소환수 = [소환] 주문 Commit 후 활성
Slice 보조 활성 상한 = 1체
활성 소환수 = 일정 시간마다 지정 주문 또는 Stock 충전
```

### 메인 소환수

- Slice 역할: Stock 지원.
- Active Pressure `20초` 후 최근 직접 확인 글자 Token `1개`.
- Focus Task당 최대 `1회`.
- Rack이 가득 차면 READY 1회 보류, 추가 누적 없음.

### 기타 소환수

- 소환 비용: 최대 마나 `20%`.
- 지속시간: Active Pressure `30초`.
- 종료 후 재소환 대기: `20초`.
- 주문 지원형 Tick: `10초`, 활성당 최대 3회, 플레이어 비교 주문 효과의 `60%`.
- Stock 지원형 Tick: `12초`, 활성당 최대 2개.
- 모든 소환수의 Focus Task Stock 충전 합산 상한: `3개`.
- 자동 주문은 시작 불안정도·핵심 목표의 `25%`를 초과해 해결하지 않음.
- 자동 주문은 불안정도 0·치명 목표 완료·마지막 승리 Event가 될 수 없음.

### Slice 수호형

- `[소환]` 후 30초 활성.
- 10초마다 다음 선언 공격 대상 보호.
- 플레이어 피해 `35%`, 환경 피해 `25%` 완화.
- 보호 중첩 불가.
- 적 타이머 정지 없음.

### Clock·Save

- Tick은 적 공격과 같은 Active Pressure Clock을 사용한다.
- 작성 감속이 켜지면 적과 소환수 Clock 모두 같은 비율로 감속한다.
- 시스템 해결·Pause·Focus loss·Background·Save/Load 중 정지한다.
- Offline catch-up 없음.
- 남은 지속·다음 Tick·행동 횟수·Cooldown·Event ID를 Snapshot에 저장한다.

`GM-SUMMON-SYSTEM-01`은 과거 `GM-BATTLE-RULES-01`의 수동 1회 수호 소환수 규칙을 대체한다.

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

- 별도 시험 Chapter·시험장·시험 전용 미니게임 없음.
- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 후보 권장: `촉매 배합·안정화 1개`.
- 추가 선택형 현장실습 전투는 Slice 실제 플레이에서 제외하고 Preview로 제시하는 것을 권장한다.

## Mobile UX

- Landscape 고정 Smartphone이 정식 품질 Gate다.
- Tablet 4:3·3:2는 Best-effort Smoke다.
- Portrait·Runtime 회전은 Vertical Slice 범위 밖이다.
- 기본 흐름은 Scene-first Contextual Focus Task다.
- 작성은 우측 확장 Panel을 사용하며 적·대상·환경·타이머를 유지한다.
- Stock 4칸, Pending Token, 메인 READY, 활성 보조 소환수, 남은 시간, 다음 행동, Cooldown을 표시해야 한다.

## 구현 진입

전체 Vertical Slice 본제작은 승인되지 않았다.

Execution Readiness PASS 후 허용 후보:

- 최소 Godot 프로젝트.
- Focus Task 상태 전이.
- Atomic Result Ledger.
- Stroke·Draft·Candidate 생명주기.
- Deterministic Test Recognizer.
- Session Snapshot·atomic save.
- Pause·Resume·Focus-loss recovery.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

Stock·소환수 실제 Runtime은 Foundation POC 최소 범위에 자동 포함되지 않는다. State/Ledger 인터페이스를 먼저 설계하고 별도 Scope 승인 뒤 추가한다.

## 잔여 기획

책임 원본: `GR-AUD-PLANNING-REMAINDER-20260802-01`.

- P1: State/Ledger/Save 인터페이스, 작성·자동화 예산, Mobile HUD, 전용 Test, Toolchain·Plan 재검증.
- P2: Battle/Result 수치, 대표 제작 미니게임, Grimoire/Main/Audio, 접근성, Year-One Chapter Map, 커리큘럼, 성장·평가·경제, Slice 시간 예산.
- P3: Boss, 소환수 장기 성장·Roster, 2·3학년 콘텐츠, 출시·PC Adaptation, 대량 Asset.

## 다음 작업 순서

```text
GM-STOCK-SYSTEM-01·GM-SUMMON-SYSTEM-01 working sync
→ PR 검증·사용자 병합 승인
→ main·Sheet Readback
→ State/Ledger/Save 인터페이스 설계
→ Stock·Summon HUD·Test 계약
→ Slice 제작 미니게임·시간 예산
→ Battle/Result Tuning
→ Grimoire/Main/Audio
→ Godot Toolchain preflight
→ Base v9.4.3 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0일 때만 Foundation POC 코드 실행
```

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODE_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
