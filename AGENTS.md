# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
current_branch: agent/gr-test-033-star-physical-validation-pack
source_main: ccacb730775056c8d7ea5d7bae6cebcfc260b5df
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
current_sync: GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
current_validation_gate: GR-TEST-033
canon_status: EXECUTION_PACK_READY_DRAFT
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
physical_pack_validation: AUTOMATED_CONTRACT_PASS
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
merge_authorized: false
```

## 권위 순서

`사용자의 최신 명시 결정 → AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 별형 승인·Spec → Runtime Completion 승인 → GR-TEST-033 Design·Runbook·Device Preflight → Sync04 → 실제 코드·테스트·원시 증거`.

## 프로젝트 코어

> 상황을 조사하고 해결 의도를 정한 뒤, 배운 글자와 별형 회로로 주문을 설계하고 비용·성공 가능성·위험을 확인하여 스스로 Commit하고 결과와 대가를 복기한다.

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과·대가 → 복기
```

## 활성 Runtime 계약

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
target_nodes_inside_circuit: prohibited
numeric_success_preview: required
final_success_clamp: 5_to_98_percent
stock_scope: TYPED_GLYPH_ONLY
commit: EXPLICIT_EXACTLY_ONCE
```

## GR-TEST-033 계약

- `SIMPLE_ZERO_AUX / MULTI_AUX / TYPED_STOCK_MISMATCH / FOCUS_COMPLETE / FOCUS_CANCEL / FROSTBLOOM_MULTI_SOLUTION`.
- FIRST_ATTEMPT와 POST_FEEDBACK_RETRY를 분리한다.
- Android 48dp, iOS 44pt, Safe Area, Text130%, Reduced Motion, Screen Reader Reading Order, Touch·Stylus·Finger Occlusion, frame-time을 기록한다.
- Attempt·Observation 원시 레코드를 SHA-256과 record count로 봉인한다.
- PII, Commit 전 Mutation, 중복 비용·결과, cross-glyph Stock, 숨은 Mana, 미리보기 외 Target, Critical Screen Reader Blocker, Moderator Solution Prompt는 Hard Stop이다.
- 분석 등급은 `PENDING_NOT_RUN / PROMISING / TUNE / REWORK / STOP`; 어떤 등급도 Human PASS나 출시 승인이 아니다.

## 금지

활성 3×3 Runtime, Universal Stock 임의 대체, 자동 Target·Commit, Best Route, 교수 예시 정답화, 개인식별정보, 참가자 순위, 실행하지 않은 Device·Performance·Screen Reader·Human·Full Slice를 PASS로 주장하는 행위.

## 다음 Gate

실제 물리 기기·익명 참가자 실행 → 원시 증거 봉인 → Analyzer → 적대 검토. 증거 전에는 `DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / HUMAN_NOT_RUN / FULL_VERTICAL_SLICE_NOT_RUN`을 유지한다.
