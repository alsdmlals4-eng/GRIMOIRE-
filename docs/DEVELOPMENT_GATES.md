# GRIMOIRE 개발·기획 게이트

```yaml
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
current_gate: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_pr: 83
tool_authority_status: DESIGN_DRAFT_REVIEW_REQUIRED
higodot_authority: SOLE_AUTHORING_AUTHORITY_DESIGN
gut_version: 9.7.1
gut_status: VENDORED_NOT_CONSUMED
implementation_entry: BLOCKED
merge_authorized: false
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0–14.5 — 보존된 기존 권위

다음은 유지한다.

- `FIVE_POINT_STAR` Runtime·Typed Glyph Stock·Exactly-once 계약.
- 주문 3단계 UX 설계와 10-task 구현 계획.
- PR #77 UI Kit v1, 공용 Theme·StarCircuitBoard·SVG.
- 기존 Godot headless 커스텀 runner와 자동 렌더 회귀.

실제 Android/iOS·Screen Reader·Performance·Human 실행은 계속 `NOT_RUN`이다.

## Gate 15 — Spell Workflow 구현

PR #82에서 Task 1만 RED→GREEN으로 검증했다.

```yaml
head: 0919b71dfec3c6f57b88e1290789302267936960
task1: GREEN
task2: NOT_STARTED_ON_BRANCH
status: PAUSED_AFTER_TASK1_GREEN
```

새 필수 도구 권위 전제 때문에 Task 2 이후는 차단한다.

## Gate 15.1 — HiGodot 단일 저작 권위 설계

`BLOCKING`

HiGodot/Godot AI는 다음의 유일한 write authority가 된다.

```text
project.godot
Scene·Node 구조
*.tscn
*.tres
*.res
Project Settings
Editor Plugin·Autoload·Main Scene·Input Map
```

protected Godot artifact 변경에는 HiGodot authoring receipt와 open/reload evidence가 필요하다.

HiGodot은 GUT assertion, expected value, fixture, `.gutconfig.json`, CI 성공 기준을 자동 수정할 수 없다.

## Gate 15.2 — GUT 9.7.1 채택 설계

`BLOCKING`

현재 사실:

```yaml
source: https://github.com/bitwes/Gut
version: 9.7.1
license: MIT
godot_compatibility: 4.7.x
bundled: true
project_plugin_enabled: false
actual_product_test_consumption: false
ci_enabled: false
status: VENDORED_NOT_CONSUMED
```

Draft PR #83의 설계가 승인된 뒤 별도 TDD 구현 PR에서 `.gutconfig.json`, 실제 제품 GUT test, GUT CLI CI, JUnit Artifact, product hash immutability gate를 추가한다.

GUT은 제품 파일을 읽고 검증할 뿐 수정할 수 없다.

## Gate 15.3 — 누락 방지 작업 진입 차단

`BLOCKING`

단순 체크리스트가 아니다. 다음 live/static authority를 읽어 unresolved가 1개라도 있으면 실행을 종료한다.

```text
02_현재_확정결정
04_누락_충돌_감사
72_이미지검수_승인로그
docs/planning/CURRENT_UNRESOLVED_GATES.md
docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
```

금지 상태 전환:

```text
SPELL_WORKFLOW_TASK2_START
GUT_FORMALLY_ADOPTED
READY_FOR_REVIEW
MERGE_AUTHORIZED
FINAL_ART_APPROVED
```

## Gate 15.4 — 이미지 판정

사용자 방향 승인은 완료되었다. 같은 방향 승인을 다시 기다리지 않는다.

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
implementation_visual_review: PENDING
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
```

개념 이미지 승인은 실제 화면 구현·가독성·기기·사람 검증을 대체하지 않는다.

## Gate 15.5 — GUT 실제 채택 구현

Draft 설계 승인 후 별도 PR에서만 시작한다.

필수 순서:

```text
RED: 실제 제품 GUT test·CI 계약 부재
→ GREEN: 최소 제품 GUT test + .gutconfig + CLI CI + JUnit
→ 제품 파일 hash 무변경 검증
→ legacy runner 병행 PASS
→ coverage parity
→ rollback dry-run
→ Sheet Write·Readback
→ 검토 승인
```

이 Gate가 GREEN이 되기 전 PR #82를 재개하지 않는다.

## Godot Gate

- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Godot `4.7.1`
- 1280×720 Mobile Landscape / GL Compatibility
- UI v2 Main Scene 전환은 전체 구현·GUT/legacy 회귀·렌더·HiGodot 영수증 PASS 전 금지
