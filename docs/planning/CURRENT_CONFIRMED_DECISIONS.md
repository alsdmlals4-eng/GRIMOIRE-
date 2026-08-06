# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_SYNCED_TO_MAIN_PLAN_AND_UI_KIT_COMPLETE
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
runtime_layout: FIVE_POINT_STAR
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
ui_kit_main_sync: GR-SYNC-20260806-08-STAR-UI-KIT-V1-MAIN
ui_kit_pull_request: 77
ui_kit_exact_head: 64116046ab17adac81ce4d238ebf19ddd2ec2293
ui_kit_main_merge: 8165ac983a8236bd780ac0ac0af1c121d36efd67
ui_kit_status: SYNCED_TO_MAIN_AUTOMATED_RENDER_PASS
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_main_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN
spell_workflow_main_merge: 6c39ab683fe7f4cd15fbcdb50bc4cee153deebec
written_spec_review: USER_APPROVED_2026-08-06T19:48+09:00
implementation_plan: COMPLETE
implementation_plan_path: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
canon_status: SYNCED_TO_MAIN
product_project: CREATED
product_implementation: STAR_RUNTIME_AND_UI_KIT_AUTOMATED_PASS_UI_V2_NOT_STARTED
runtime_validation: AUTOMATED_HEADLESS_AND_UI_RENDER_PASS_EXISTING_HARNESS
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 보존되는 Runtime

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, 중앙 Main 1개, Auxiliary 0~5개, 글자별 숙련도, Typed Glyph Stock, 명시 Preview, Exactly-once 자원 처리를 유지한다.

## 주문 3단계 정본

`GM-SPELL-WORKFLOW-UI-V2-01`은 주문 UX를 다음으로 분리한다.

```text
1. 글자 그리기 → 인식·획득·보관함 저장
2. 회로 배치 → 보관함/스톡 예약·Preview·글자 소비·완성 주문 생성
3. 주문 사용 → 대상 선택·상세 예상 결과·마나 소비·실제 판정
```

- 사건 상태 Overlay는 문제·위험·필요 대응 방향·관찰 키워드를 제공하되 정답 글자 조합은 숨긴다.
- 보관함과 스톡은 같은 수를 준비하며 각각 1~5개다.
- 핵심 글자: 열·흐름·보호·냉각·수복.
- 보조 글자: 집중·분산·안정·지속·증폭.
- 공통 경제 재화는 금화, 주문 사용 비용은 마나만 사용한다.
- 2단계 기본 성공률과 3단계 대상 적용 최종 성공률을 구분한다.

## 대체 관계

```text
기존: 회로 Preview → 같은 화면 Target → Final Preview → Commit·마나 소비
신규: 회로 Preview → 주문 확정·글자 소비 → 별도 사용 화면 Target → 마나 소비·실제 판정
```

## 공용 UI Kit 정본

PR #77은 다음 기반을 main에 제공한다.

- 공용 `GrimoireThemeFactory`
- Draw-only `StarCircuitBoard`
- Navy/Gold/Cyan UI 토큰과 상태 Variation
- 프로젝트 원본 공통 SVG 5종
- Godot import·Texture2D·1280×720 GL Compatibility 자동 렌더 계약
- UI 자산 Rights Workflow와 `GR-UI-VECTOR-COMMON-01` provenance

이는 후속 3개 화면에서 직접 재사용한다. 자동 렌더 PASS를 최종 아트나 사람 시각 검증으로 확대 해석하지 않는다.

## 구현 계획과 다음 Gate

설계와 10개 TDD 작업 계획은 PR #78, merge `6c39ab683fe7f4cd15fbcdb50bc4cee153deebec`로 main에 반영되었다. UI Kit 선행 의존성도 PR #77, merge `8165ac983a8236bd780ac0ac0af1c121d36efd67`로 해소되었다.

다음 Gate는 main 기반 별도 Draft TDD 구현 PR을 여는 것이다.

## 검증 경계

현재 PASS는 기존 별형 Runtime, UI Kit 자동 렌더, 기획·계획 계약에 해당한다. UI v2 3단계 코드·Scene·실기기·사람 검증은 `NOT_STARTED / NOT_RUN`이다.
