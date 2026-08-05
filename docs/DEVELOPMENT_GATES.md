# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
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
```

## Gate 0 — 최신 정본

3×3은 역사로만 보존하고 활성 코드·Suite에 Stage2/3×3 경로를 두지 않는다. 현재: `PASS`.

## Gate 1 — 핵심 재미

`조사 → 의도 → FIVE_POINT_STAR → 회로 Preview → Target Keyword → 최종 Preview → Commit → 변화·복기`. 현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — 회로 문법

중앙 메인 정확히 1개, 동등 외곽 0~5개, Target node 금지, 중복 Vertex·보조 글자 금지, 자동 수정 금지. 현재: `AUTOMATED_RUNTIME_PASS`.

## Gate 3 — 숙련도·성공률

글자별 0~100, `메인45%+보조평균35%+최저20%`, 보조당 -10%p, 5~98 Clamp, PRECISION 반영. 현재: `CALCULATION_RUNTIME_PASS / PLAYTEST_TUNING_REQUIRED`.

## Gate 4 — Stock·Mana·Commit

Typed Vault/Stock 예약, 보조당 Mana +10%, PRECISION +25%, REDUCTION 감소, Main base 미만 금지, 명시 Commit, Exactly-once, 실패 Reservation 해제, Cancel 무변이. 현재: `AUTOMATED_ATOMIC_PASS`.

## Gate 5 — UX·접근성

Low-fi Landscape Harness, 중앙·외곽5, Circuit Preview·Target·Final Preview 분리, 48dp, Reduced Motion 0ms. 현재: `AUTOMATED_SCENE_PASS / DEVICE_NOT_RUN / ACCESSIBILITY_NOT_RUN`.

## Gate 6 — 콘텐츠·서사

Frostbloom 복수 해결과 교수 예시 비정답을 유지한다. 결과 Pipeline·부분 성공·역류는 후속이다. 현재: `PLANNING_PASS / END_TO_END_HUMAN_NOT_RUN`.

## Gate 7 — 개발환경

`project.godot`과 Main Scene이 존재한다. `tools/run_star_runtime.py`가 Godot 4.7.1·Export Template을 검증하고 Headless Suite 또는 Editor를 실행한다. 현재: `TOOLCHAIN_AND_RUNTIME_AUTOMATED_PASS`.

## Gate 8 — PR·Sheet

```yaml
pull_request: 69
sheet_ranges: 00_H2_K2__02_ROW62__04_ROW66__05_ROW20__12_ROW27__15_ROW15__40_ROW29__41_ROW13__60_ROW35__99_ROW80
sheet_write: PASS
sheet_readback: PASS
merge_authorized: true
main_merge: PENDING
```

병합 전 exact-head 세 Workflow·PR diff·리뷰 스레드·구형 Runtime 부재를 다시 확인한다. 병합 후 main Push Workflow와 Sheet main SHA Readback 전에는 `SYNCED_TO_MAIN`으로 올리지 않는다.
