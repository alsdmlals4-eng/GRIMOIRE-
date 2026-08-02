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
stock_system_01: USER_APPROVED_RECOMMENDED_DEFAULTS
summon_system_01: USER_APPROVED_RECOMMENDED_DEFAULTS
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
핵심 기획·Vertical Slice·Art·Battle·Asset 계약 — 완료
→ Mobile 플랫폼·Landscape·Save/Resume·UX Flow·Writing Wireframe — 완료
→ 전체 게임 Macro·Chapter·Curriculum·Growth·Reward·Failure·Scope — 완료
→ 핵심/보조 시스템 계층 — 완료
→ Stock·Summon Prototype 기본값 — 현재 Working Decision
→ State/Ledger/Save 인터페이스·HUD·Test 계약
→ Slice 제작 미니게임·시간 예산
→ Battle/Result Tuning
→ Grimoire/Main/Audio·접근성
→ Godot Toolchain preflight
→ Base v9.4.3 Implementation Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ Foundation POC
→ Runtime·Device·Performance·Accessibility·Human Validation
→ Vertical Slice Production Approval
```

## 2. 완료된 기획 Gate

- 플레이어 약속과 핵심 재미.
- 상황 해결형 단일 강적 전투.
- 적 Attack Timer·작성 중 진행·시스템 해결 중 정지.
- 불안정도 0 진정·환경 결과 품질.
- Mobile 우선·PC 후속.
- Landscape 고정 Smartphone 품질 Gate.
- Scene-first Focus Task·우측 Writing Panel.
- Save/Resume Anchor·Session Snapshot·Atomic Result Ledger 방향.
- 학습 나선·다계열 수강·포트폴리오·학기 평가.
- 재료·제작·미니게임 경제.
- 1학년 Demo·3학년 Full Game 범위.
- 핵심/진행/적용/보조/인프라 시스템 계층.

별도 시험 Chapter·시험장·시험 전용 미니게임은 사용하지 않는다.

## 3. GM-STOCK-SYSTEM-01

상태: `USER_APPROVED_RECOMMENDED_DEFAULTS`.

Prototype 기본값:

- 확인 글자 Token Rack `4칸`.
- 동일 글자 최대 `2개`.
- Chapter·주요 Resume Anchor에서 2개 미만이면 `2개까지 보정`.
- 글자별·Focus Task별 첫 직접 유효 Commit 후 Token `+1`.
- 사용은 글자 1개당 Token `1개`.
- Commit 승인과 세계 변화 적용 시 소비.
- 취소·문법 실패·마나 부족은 소비하지 않음.
- 완성 주문·대상·상황·자동 최적 조합은 저장하지 않음.
- 영구 계정 자원·Offline 충전 금지.

검증 Gate:

- 직접 작성 4~6회, Stock 보조 2~4회, 총 해결 7~10회 후보.
- 직접 작성 비율 40% 미만이면 REWORK.
- Token 중복 소비·Anchor 반복 보정·Save 불일치 0건.

## 4. GM-SUMMON-SYSTEM-01

상태: `USER_APPROVED_RECOMMENDED_DEFAULTS`.

Prototype 기본값:

- 메인 소환수 1체 상시 활성.
- 기타 소환수는 `[소환]` Commit 후 최대 1체 활성.
- 소환 비용 최대 마나 `20%`.
- 지속 Active Pressure `30초`.
- 종료 후 Cooldown `20초`.
- 메인 Stock 지원: `20초` 후 Token 1개, Focus Task당 1회.
- 주문형 보조: `10초` Tick, 활성당 최대 3회, 플레이어 비교 효과 `60%`.
- Stock형 보조: `12초` Tick, 활성당 최대 2개.
- 모든 소환수 Stock 충전 합산 Focus Task당 최대 `3개`.
- 자동 주문 기여 상한: 시작 불안정도·핵심 목표 `25%`.
- 자동 주문은 불안정도 0·치명 목표 완료·마지막 승리 Event 금지.

Slice 수호형:

- 플레이어 피해 `35%`, 환경 피해 `25%` 완화.
- 중첩 불가.
- 적 Timer 정지 없음.

이 Decision은 `GM-BATTLE-RULES-01`의 수동 1회·자동 행동 금지 수호 소환수 규칙을 대체한다.

## 5. Active Pressure Clock Gate

진행:

- 관찰·작성·후보·조합 등 플레이어 조작 가능 상태.

정지:

- 주문·적 공격·소환수 행동 System Resolve.
- Pause·강제 Tutorial.
- Focus loss·Background.
- Save/Load.
- 입력을 막는 Recognition·Loading.

- 작성 감속은 적·소환수 Clock 모두 같은 비율로 적용한다.
- Offline catch-up과 복귀 순간 다중 Tick을 금지한다.

## 6. P1 — Execution Readiness 전 필수

### P1-01 State·Ledger·Save 인터페이스

필수 데이터:

- Stock Token·Source·Pending·Anchor floor Ledger.
- Active Summon·Duration·Next Tick·Action Count·Cooldown.
- 고유 `summon_event_id`와 Transaction 소유권.

### P1-02 작성·자동화·시간 예산

- 총 해결 7~10회.
- 직접 작성 4~6회.
- Stock 2~4회.
- Summon 자동 행동 1~3회.
- 46분 목표·53분 상한에서 재검증.

### P1-03 Mobile HUD

- Stock 4칸·Pending.
- 메인 READY·다음 Tick.
- 활성 보조·남은 시간·다음 행동·Cooldown.
- 대상 규칙·자동 행동 출처.

### P1-04 Test 계약

- 중복 소비·중복 Tick·중복 결과 0.
- Pause·Background·Save/Resume Clock 정지.
- 자동 승리 종결 0.
- Anchor reload 자원 증식 0.
- Small-screen 필수 정보 가림 0.

### P1-05 Toolchain·Plan

- Godot binary·version·renderer·export 확인.
- Base v9.4.3 최종 main에서 Implementation Plan 재검증.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01` P0=0·P1=0.

## 7. P2 — Vertical Slice 제작 전 필수

1. `BATTLE-TUNING-01`.
2. `RESULT-GRADING-01`.
3. Slice 대표 제작 미니게임 확정 — 권장 `촉매 배합·안정화 1개`.
4. 추가 선택형 현장실습 전투 Slice 포함 여부 — 권장 실제 플레이 제외·Preview만.
5. `GRIMOIRE-SCREEN-01`.
6. `MAIN-SCREEN-01`.
7. `AUDIO-DIRECTION-01`.
8. 접근성·난이도 기본 정책.
9. Year-One 6~8 Chapter 실제 Map.
10. 커리큘럼 글자 Catalog·수강 슬롯·전문화 시점.
11. 성장·평가·재료·레시피·인벤토리 기본값.
12. Slice 장면별 시간·대사·작성·제작·전투 예산.

## 8. P3 — Slice 검증 후

- Boss 다중 페이즈.
- 소환수 4단계 성장·탑승·전체 Roster.
- 2·3학년 Chapter·상급 연구.
- Full Game 실제 콘텐츠 수량.
- 저장 Migration.
- Store·사업화·PC Adaptation.
- 최종 Art·Audio·Asset 대량 제작.

## 9. Foundation POC 진입

승인된 것은 전체 Vertical Slice 구현이 아니다.

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

Stock·Summon Runtime은 인터페이스 설계와 별도 Scope 확인 없이 자동 포함하지 않는다.

## 10. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
CODEX_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
