# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT_WORKING_BRANCH
main_authority_commit: 2012a9f4c2da09a1defec07f8d8f7a0d3c867d93
previous_main_sync: GR-SYNC-20260806-01-MAIN
current_working_sync: GR-SYNC-20260806-02-STAR-RUNTIME-POC
working_pull_request: 69
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
previous_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_TUNING_REQUIRED
```

## 승인 계약

1. `FIVE_POINT_STAR`: 중앙 메인 1개, 동등한 별 꼭짓점 보조 0~5개.
2. 회로 Preview 후 관찰로 열린 Target Keyword 선택.
3. Target 적용 후 최종 Mana·숫자 성공률 Preview.
4. 글자별 숙련도 0~100; 학년 직접 성공률 보너스 금지.
5. 보조당 성공률 `0,-10,-20,-30,-40,-50%p`, Mana `0,+10,+20,+30,+40,+50%`.
6. `PRECISION`: Mana +25%, 성공률 숙련도÷10%p.
7. `REDUCTION`: Mana `10%+숙련도÷10` 감소, 직접 성공률 0.
8. 최종 성공률 5~98, 최종 Mana는 Main base 미만 금지.
9. Vault·Stock·Mana·결과는 명시 Commit에서 원자 처리; Cancel·실패·중복 Commit 추가 소비 금지.

## 구현된 POC

- Validator·Calculator·State·Coordinator·Landscape Harness.
- 정확히 6개 Runtime 글자 인식과 Vault/Stock Resource 기반.
- 회로 Preview와 Final Preview 분리.
- Target node·중복 Vertex/보조·자동 Target/Commit·Best route·숨은 Vertex 효과 거부.
- Godot 4.7.1, 26 Suites·1,010 assertions·0 failures (`31050121154`).

## 대체 경계

3×3 셀·회로 내부 Target·인접/교차/끝점 문법·보조2 상한·숫자 성공률 금지는 폐기된 활성 계약이다. 과거 문서는 역사 증거로 보존한다.

## 미검증·후속

실제 Android/iOS 기기, Narrow/Tall, Touch·Stylus, Text130%, Screen Reader, 성능, 사람 핵심 재미, 부분 성공·실패·역류, Frostbloom 결과 Pipeline, Full Vertical Slice는 미검증 또는 미구현이다. 모든 Prototype 수치는 `PLAYTEST_TUNING_REQUIRED`다.
