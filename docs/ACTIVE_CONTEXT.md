# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
platform: MOBILE_LANDSCAPE_FIXED
current_working_sync: GR-SYNC-20260806-02-STAR-RUNTIME-POC
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 실제 구현 범위

- `FIVE_POINT_STAR` 별형 회로 Validator: 중앙 1, 외곽 0~5, 동등 Vertex, 중복·Target node·잘못된 Source 거부.
- Calculator: 글자 숙련 가중, 보조 복잡도, PRECISION·REDUCTION, 5~98 성공률, 마나 올림·최소값.
- State: 회로 편집→회로 Preview→Target→최종 Preview→Commit Confirm.
- Coordinator: Vault·Stock 예약, Mana·결과 Exactly-once Commit, 실패 해제, Cancel 무변이.
- Low-fi Landscape Scene: 중앙·외곽5·두 Preview·Target·Commit, 48dp, Reduced Motion 0ms.
- 6글자 인식·Resource·Persistence 기반 통합.

## 검증

```yaml
runtime_green_head: c6dfc7d1b02f831e2f9d3b88f7262eaa728c4a1c
runtime_green_run: 31050121154
godot_suites: 26
assertions: 1010
failures: 0
godot_version: 4.7.1.stable.official.a13da4feb
export_templates: PASS
sheet_readback: PASS
```

## 남은 경계

실제 Android/iOS 기기, Narrow/Tall Landscape, Touch·Stylus, Text130%, Screen Reader, 성능, 사람 핵심 재미, 결과 Pipeline, 부분 성공·실패·역류, Full Vertical Slice는 `NOT_RUN` 또는 미구현이다. 교수 예시는 정답표가 아니며 자동 Target·자동 Commit·Best route를 추가하지 않는다.
