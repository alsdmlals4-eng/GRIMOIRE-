# GRIMOIRE 개발·기획 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3
contract_binding_decision: GM-CONTRACT-V4-3-BINDING-01
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
current_gate: BLOCKED_BY_GUT_ADOPTION_SPEC
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_pr: 83
tool_authority_status: MERGED_MAIN_252063cc
gut_adoption_spec_pr: 84
gut_adoption_spec_status: OPEN_DRAFT_IN_REVIEW
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
higodot_authority: SOLE_AUTHORING_AUTHORITY
higodot_source_version_license: PASS
higodot_vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
gut_source_version_license: PASS
gut_vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
gut_status: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
sheet_v4_3_sync: READBACK_PASS
implementation_entry: BLOCKED
merge_authorized: false
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0 — v4.3 Application Binding

`PASS_IN_PR84 / MERGE_PENDING`

- 프로젝트 바인딩: `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md`.
- generic Switchy-Express path는 GRIMOIRE 권위가 아니다.
- Decision Ledger·미확정 목록·이미지 검수 Sheet readback 후 상태를 재계산한다.
- `[이미지 완료]`는 `[이미지·오디오 완료]`로 호환 해석한다.
- 공유 audio vault는 `C:/Users/user/Documents/GitHub/shered audio vault`이며 로컬 접근 전 `BLOCKED_UNVERIFIED`다.

## Gate 0.1 — Entry State Reconciliation

`BLOCK`

```yaml
reconciliation: docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
prior_state: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
corrected_state: BLOCKED_BY_GUT_ADOPTION_SPEC
allowed_next_action: PR84_SPEC_ONLY_EXACT_HEAD_REVIEW_AND_MERGE
```

GUT adoption spec이 merged main에 없으면 formal installation·PR82 Task2·Scene 전환을 시작하지 않는다.

## Gate 1–14.5 — 보존 권위

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

```yaml
canonical_repository: hi-godot/godot-ai
release: v3.1.2
pinned_source_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
release_asset_sha256: 60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33
official_plugin_source_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
project_vendor_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
license: MIT
source_version_license: PASS
vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
godot_compatibility: 4.7.x_REQUIRED_RUNTIME_NOT_RUN
telemetry: VERIFY_AND_CONFIGURE
authority: SINGLE_GODOT_SCENE_NODE_RESOURCE_PROJECT_SETTINGS_AUTHOR
```

`project.godot`, Scene·Node 구조, `*.tscn`, `*.tres`, `*.res`, Theme·Animation·signal, Project Settings의 유일한 write authority다. protected diff에는 `HIGODOT_AUTHORING_MANIFEST`와 Scene/Resource/Project Settings readback이 필요하다.

프로젝트 vendor tree가 official source tree와 다르므로 release ZIP 추출 hash manifest와 비교하거나 승인된 교체를 완료하기 전 integrity PASS를 선언하지 않는다.

## Gate 15.2 — GUT 9.7.1 Adoption Spec Draft PR

`BLOCKING / PR #84 IN_REVIEW`

```yaml
branch: chore/gut-9.7.1-adoption-spec
pr: 84
spec: docs/testing/GUT_9_7_1_ADOPTION_SPEC.md
decision: docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md
canonical_repository: bitwes/Gut
release: v9.7.1
source_branch_or_release: godot_4_7
pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
pinned_commit_signature: VERIFIED
official_addons_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
project_vendor_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
license: MIT
source_version_license: PASS
vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
godot_compatibility: 4.7.x_METADATA_PASS_RUNTIME_NOT_RUN
project_plugin_enabled: false
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
formal_installation_authorized: false
```

PR #84 허용 범위:

- v4.3 바인딩.
- official release·commit·license·tree 확인과 vendor mismatch 기록.
- adoption spec·Decision.
- entry reconciliation·active canon.
- contract tests·Sheet sync.

PR #84 금지 범위:

```text
.gutconfig.json
actual GutTest
validate-gut-formal-adoption.yml runtime workflow
project.godot
*.tscn
*.tres
*.res
product script/data/asset mutation
addons/gut or addons/godot_ai replacement
```

병합 조건:

```text
same Decision ID GitHub·Sheet sync/readback
exact-head required checks PASS
changed scope spec-only
unresolved review threads 0
P0/P1·Critical·Important 0
role-separated diff review PASS
user decision authority satisfied
PR Ready
merge + main readback
```

## Gate 15.3 — GUT Formal Installation (명세 병합 후)

`NOT_AUTHORIZED_YET`

필수 RED→GREEN:

```text
official GUT tree replacement or approved file-level audit
→ HiGodot release archive integrity comparison
→ actual Godot 4.7.1 compatibility smoke
→ .gutconfig.json
→ actual GRIMOIRE product GutTest
→ Godot 4.7.1 CLI CI + JUnit
→ user:// JUnit workspace copy + artifact
→ production hash 무변경
→ legacy runner 병행·필수 계약 parity
→ HiGodot authoring manifest gate
→ Windows·Android shared-core evidence
→ rollback dry-run
→ Sheet Write·Readback
→ role-separated review + user authority
```

## Gate 15.4 — 동결 구현 브랜치

```yaml
branch: agent/gut-9-7-1-formal-adoption-tdd
status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
merge_authorized: false
cherry_pick_authorized: false
counts_as_adoption_evidence: false
```

PR #84 병합 후 최신 main에서 새 구현 브랜치를 만든다.

## Gate 15.5 — 누락 방지 진입 차단

다음 live/static authority를 읽고 blocker가 하나라도 있으면 제품 구현을 종료한다.

```text
00_프로젝트_허브
01_작업순서
02_현재_확정결정
04_누락_충돌_감사
72_이미지검수_승인로그
docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
docs/planning/CURRENT_UNRESOLVED_GATES.md
docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
```

금지 전환:

```text
SPELL_WORKFLOW_TASK2_START
GUT_FORMAL_INSTALLATION
GUT_FORMALLY_ADOPTED
PROJECT_MAIN_SCENE_SWITCH_TO_UI_V2
READY_FOR_IMPLEMENTATION_MERGE
FINAL_VISUAL_AUDIO_APPROVED
```

## Gate 15.6 — GPT 역할 분리 검토와 사용자 권위

1인 개발이므로 별도 인간 reviewer가 있다고 가장하지 않는다.

```text
구현자 설명을 제외한 요구·exact diff·정본·test artifact 입력 세트 구성
→ 기획·권위·scope·회귀 Pass
→ finding 증거 검증
→ P0/P1 0
→ exact-HEAD CI
→ 사용자 결정 권위
```

PR #83의 review exception은 역사적으로 PR83에만 적용되며 후속 PR 정책으로 재사용하지 않는다.

## Gate 15.7 — 시각·오디오

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
user_direction_approval: COMPLETE
implementation_visual_review: PENDING
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
audio_vault_path: BLOCKED_UNVERIFIED
audio_rights: BLOCKED_UNVERIFIED
```

동일 시각 방향 승인을 다시 기다리지 않는다. 오디오를 프로젝트에 복사·연결하기 전에 Vault 존재·권리·hash를 검증한다. runtime은 절대 Vault 경로를 참조하지 않는다.

## Godot Gate

- Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Godot 4.7.1 CI target / local exact executable unverified
- 1280×720 Mobile Landscape / GL Compatibility
- UI v2 Main Scene 전환은 전체 구현·GUT/legacy 회귀·렌더·HiGodot manifest PASS 전 금지
- Local sync: `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS`
- Local Godot run: `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS`
