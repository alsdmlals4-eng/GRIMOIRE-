# GRIMOIRE 개발·기획 게이트

```yaml
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
current_gate: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_pr: 83
tool_authority_status: DESIGN_APPROVED_IMPLEMENTATION_PLAN_READY
higodot_authority: SOLE_AUTHORING_AUTHORITY
gut_version: 9.7.1
gut_status: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
implementation_entry: BLOCKED
merge_authorized: false
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0–14.5 — 보존 권위

- `FIVE_POINT_STAR` Runtime, Typed Glyph Stock, Exactly-once 계약.
- 주문 3단계 UX와 10-task 구현 계획.
- PR #77 UI Kit v1, 공용 Theme·StarCircuitBoard·SVG.
- 기존 Godot headless custom runner와 자동 렌더 회귀.

실제 Windows/Android export, 기기·Screen Reader·Performance·Human은 `NOT_RUN`이다.

## Gate 15 — Spell Workflow 구현

```yaml
pr: 82
head: 0919b71dfec3c6f57b88e1290789302267936960
task1: GREEN
task2: NOT_STARTED_ON_BRANCH
status: PAUSED_AFTER_TASK1_GREEN
```

## Gate 15.1 — HiGodot 단일 저작 권위

설계 승인 완료. 다음의 유일한 write authority다.

```text
project.godot
Scene·Node 구조
*.tscn
*.tres
*.res
Project Settings·Editor Plugin·Autoload·Main Scene·Input Map
```

protected diff에는 HiGodot receipt와 open/reload evidence가 필요하다. HiGodot은 테스트 expected value·fixture·`.gutconfig.json`·CI 성공 기준을 수정하지 않는다.

## Gate 15.2 — GUT 9.7.1 formal adoption

`BLOCKING`

```yaml
source: https://github.com/bitwes/Gut
version: 9.7.1
license: MIT
godot_compatibility: 4.7.x
bundled: true
project_plugin_enabled: false
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
actual_product_test_consumption: false
ci_enabled: false
status: VENDORED_NOT_CONSUMED
```

실행 계획: `docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md`.

필수 RED→GREEN:

```text
.gutconfig.json
→ 실제 제품 GutTest
→ Godot 4.7.1 CLI CI + JUnit
→ 제품 hash 무변경
→ legacy runner 병행
→ 필수 계약 parity
→ HiGodot receipt gate
→ rollback dry-run
→ Sheet Write·Readback
→ independent review
```

## Gate 15.3 — 누락 방지 진입 차단

다음 live/static authority를 읽고 blocker가 하나라도 있으면 종료한다.

```text
00_프로젝트_허브
01_작업순서
02_현재_확정결정
04_누락_충돌_감사
72_이미지검수_승인로그
docs/planning/CURRENT_UNRESOLVED_GATES.md
docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
```

금지 전환:

```text
SPELL_WORKFLOW_TASK2_START
GUT_FORMALLY_ADOPTED
PROJECT_MAIN_SCENE_SWITCH_TO_UI_V2
READY_FOR_REVIEW
MERGE_AUTHORIZED
FINAL_ART_APPROVED
```

## Gate 15.4 — 이미지

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
user_direction_approval: COMPLETE
implementation_visual_review: PENDING
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
```

동일 방향 승인을 다시 기다리지 않는다.

## Gate 15.5 — PR #83 exact-head와 병합

PR #83은 제품 코드·Scene·Resource·`project.godot`을 수정하지 않는다. 다음이 모두 필요하다.

```text
current exact HEAD 전체 diff 검토
all required checks PASS
unresolved review threads 0
P0/P1·Critical·Important 0
independent review PASS
PR not Draft
main compatibility
merge + main readback
```

독립 리뷰 증거가 없으면 Draft와 미병합 상태를 유지한다.

## Godot Gate

- Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Godot 4.7.1
- 1280×720 Mobile Landscape / GL Compatibility
- UI v2 Main Scene 전환은 전체 구현·GUT/legacy 회귀·렌더·HiGodot receipt PASS 전 금지
