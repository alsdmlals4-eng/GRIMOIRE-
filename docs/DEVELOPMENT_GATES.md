# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-02
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
base_release: v9.4.3
core_system_alignment: APPROVED_AND_SYNCED_TO_MAIN
stock_system_01: USER_APPROVED_REVISED_DEFAULTS
summon_system_01: USER_APPROVED_REVISED_DEFAULTS
stock_summon_state_interface_01: USER_DELEGATED_RECOMMENDED_OPTION
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation_ready: false
implementation: NOT_STARTED
codex_plan: ALLOWED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. 전체 경로

```text
핵심 기획·Mobile·전체 게임 구조·시스템 계층 — 완료
→ 자연충전 Stock·정수 상주 소환수 — 현재 Working Decision
→ State/Ledger/Save 계약 — 현재 Working Decision
→ Mobile HUD·전용 Test
→ Slice 제작 미니게임·시간 예산
→ Battle/Result Tuning
→ Grimoire/Main/Audio·접근성
→ Godot Toolchain preflight
→ Base v9.4.3 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ Foundation POC
→ Runtime·Device·Performance·Accessibility·Human Validation
→ Vertical Slice Production Approval
```

## 2. 완료된 큰 방향

- 상황 판독·의미 설계·Commit·설명 가능한 결과·마도서 복기.
- 상황 해결형 단일 강적 전투와 불안정도 0 진정.
- Mobile Landscape Smartphone 품질 Gate.
- Scene-first Focus Task·Writing Panel.
- Save/Resume Anchor·Session Snapshot·Atomic Result Ledger 방향.
- 학습 나선·다계열 수강·포트폴리오·학기 평가.
- 1학년 Demo·3학년 Full Game 범위.
- 핵심/진행/적용/보조/인프라 시스템 계층.

별도 시험 Chapter·시험장·시험 전용 미니게임은 사용하지 않는다.

## 3. GM-STOCK-SYSTEM-01 Gate

상태: `USER_APPROVED_REVISED_DEFAULTS`.

Prototype 계약:

```yaml
stock_types:
  - FULL_SPELL
  - SUB_GLYPH
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

충전 공식:

```text
기능 글자 수 n
→ 10 + 5 × (n - 1)초
```

검증 Gate:

- 준비 용량 초과 0건.
- 자연충전 대상 자동 변경 0건.
- Stock 소비·결과 적용 중복 0건.
- Save/Resume 충전 중복 완성 0건.
- 완성 주문 Stock이 새로운 상황 설계를 전면 대체하지 않음.

## 4. GM-SUMMON-SYSTEM-01 Gate

상태: `USER_APPROVED_REVISED_DEFAULTS`.

Prototype 계약:

```yaml
main_summon: ALWAYS_ACTIVE
additional_active_summon_cap: 1
duration_limit: NONE
cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
```

정수 스탯:

- 메인 `[스톡] 1`.
- 생산형 `[스톡] 2`.
- 수호형 `[방어도] 2`.
- 공격형 `[공격] 2`.
- 치유형 `[치유] 2`.

공식:

```text
[스톡] N
→ 5초마다 현재 충전 남은 시간 -N초

최종 직접 피해
= max(1, 원피해 - 총 방어도)

[공격] N
→ 유효 대상 불안정도 -N, 하한 1

[치유] N
→ HP +N, 최대 HP 초과 없음
```

검증 Gate:

- 시간 제한 없이도 추가 소환수 교체 선택이 의미 있음.
- 슬롯 상한 초과 0건.
- 자동 공격으로 불안정도 0·최종 해결 0건.
- 방어도 상시 무적 0건.
- Offline 공격·치유·Stock 지원 0건.

이 Decision은 `GM-BATTLE-RULES-01`의 수동 단발 수호 소환수 규칙과 PR #51 초기 퍼센트·30초 지속 계약을 대체한다.

## 5. GM-STOCK-SUMMON-STATE-INTERFACE-01 Gate

상태: `USER_DELEGATED_RECOMMENDED_OPTION`.

필수 소유권:

- `StockLoadoutState`.
- `StockChargeState`.
- `SummonRosterState`.
- `SummonActionState`.
- `PlayerCombatState`.
- `SituationCombatState`.
- `ResultLedger`.
- `SessionSnapshot`.

필수 원자성:

- `[소환 주문]`의 마나 차감·기존 보조 귀환·새 보조 활성.
- Stock 소비·주문 효과 적용.
- 고유 `summon_event_id` 기반 주기 행동 Exactly-once.
- 고유 `stock_charge_event_id` 기반 Stock 완성 Exactly-once.

## 6. Active Pressure Clock Gate

진행:

- 플레이어가 관찰·작성·후보·조합을 조작할 수 있는 상태.

정지:

- 플레이어 주문·소환수 행동·적 공격 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·Background.
- Save/Load·입력 차단 Recognition·Loading.
- 직접 피해 Stock 정지.

Offline catch-up과 복귀 순간 다중 Event를 금지한다.

## 7. P1 — Execution Readiness 전 필수

### P1-01 Mobile HUD Wireframe

- 준비 용량 `현재/8`.
- 현재 충전 대상·현재/최대·남은 초.
- 활성 `[스톡]` 합계와 다음 5초 주기.
- 메인·추가 소환 상태.
- `[방어도]·[공격]·[치유]` 정수값.
- 적 의도·불안정도·환경·HP·마나·Writing Panel.

### P1-02 Test 계약 실행 계획

- 소환 교체 Transaction 롤백.
- Stock 사용 Transaction 롤백.
- 중복 Event 0.
- Background Clock 0 진행.
- 방어도 최소 피해.
- 공격 하한 1.
- 치유 초과 저장 0.
- Save/Resume 상태 유지.

### P1-03 Toolchain·Plan

- Godot binary·version·renderer·export 확인.
- Base v9.4.3 최종 main에서 Implementation Plan 재검증.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01` P0=0·P1=0.

## 8. P2 — Vertical Slice 제작 전

1. `BATTLE-TUNING-01`: HP·마나·적 불안정도·공격 간격·정수 스탯 스케일.
2. `RESULT-GRADING-01`.
3. 대표 제작 미니게임 — 권장 `촉매 배합·안정화 1개`.
4. 선택형 현장실습 전투 — 권장 실제 Slice 제외·Preview.
5. `GRIMOIRE-SCREEN-01`.
6. `MAIN-SCREEN-01`.
7. `AUDIO-DIRECTION-01`.
8. 접근성·난이도 기본 정책.
9. Year-One 6~8 Chapter Map.
10. 커리큘럼 글자 Catalog·수강 슬롯·전문화.
11. 성장·평가·재료·레시피·인벤토리 수치.
12. Slice 장면별 시간 예산.

## 9. P3 — Slice 검증 후

- Boss 다중 페이즈.
- 추가 소환 슬롯·전체 Roster·장기 성장·탑승.
- 2·3학년 콘텐츠.
- 저장 Migration.
- Store·사업화·PC Adaptation.
- 최종 Art·Audio·Asset 대량 제작.

## 10. Foundation POC 경계

Execution Readiness PASS 뒤 허용 후보:

- 최소 Godot 프로젝트·Headless tests.
- Focus Task 상태 전이.
- Atomic Result Ledger.
- Stroke·Draft·Candidate 생명주기.
- Deterministic Test Recognizer.
- Session Snapshot·atomic save.
- Pause·Resume·Focus loss.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

Stock·소환수 Runtime은 별도 Scope 승인 없이 자동 포함하지 않는다.

## 11. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
CODEX_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
STATE_INTERFACE = APPROVED_DESIGN_ONLY
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
