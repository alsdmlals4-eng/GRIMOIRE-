# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-26-r5.4-superset-final
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
historical_contract_binding: GM-CONTRACT-V4-5-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr_predecessor: 158
current_authority_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
task8_preservation_observation: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
current_user_work_scope: VISUAL_ASSET_COVERAGE_AND_NEXT_SINGLE_VISUAL_BRIEF
product_implementation_authorized_by_current_user_work_scope: false
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
visual_generation_state: TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL
visual_direction_decision: GM-VISUAL-DIRECTION-20260825-01
representative_screen_decision: GM-REPRESENTATIVE-SCREENS-20260825-01
art_style_lock: ART-STYLE-01
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_delta_existence: OBSERVED_PRESENT
task8_candidate_preservation: OBSERVED_PASS
task8_primary_recovery_branch: feat/task8-spell-use-screen-v2
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_branch: task8/spell-use-screen
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_release: v3.1.4
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_current_reconciliation_readback: NOT_RUN
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

`authority_sync_local_observation` / `authority_sync_godot_observation`은 이전 authority sync 당시의 역사 관찰값이다. 현재 로컬 Task8 존재·보존 상태는 별도 `task8_recovery_state`가 소유하며, 이번 Visual work unit은 로컬 Godot/Task8 실행을 수행하지 않았다.

## 현재 사용자 작업 범위

2026-08-26 사용자가 `작업재개`를 명시했고, 이어 이전 감사에서 권장한 A안에 `진행해`라고 continuation을 승인했다.

```text
r5.4 authority reconciliation
→ Visual Asset Coverage preflight
→ 다음 정확히 1장 Text Brief
```

따라서 현재 범위는 `VISUAL_ASSET_COVERAGE_AND_NEXT_SINGLE_VISUAL_BRIEF`다.

- Task8/Godot 제품 구현: **NOT_AUTHORIZED_BY_CURRENT_WORK_SCOPE**
- `TASK8_SPELL_USE_SCREEN`: 다음 제품 task locator일 뿐 현재 구현 권한이 아님
- 이미지 생성: **TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL**
- Google Sheet 신규 canon write: **FORBIDDEN / MIGRATION_ONLY**
- unrelated open PR: **READ_ONLY**

## 현재 제품 현실

Frostbloom 00~46분 첫 세션 기획은 완료됐지만 제품 구현은 `PARTIAL_FOUNDATION`이다. 현재 `project.godot` 기본 실행점은 `res://src/ui/star_circuit_harness.tscn`이며 역할은 `DEVELOPMENT_RUNTIME_POC_ENTRY`다. 완성형 첫 세션 Product Root로 승격하지 않는다.

Star Circuit Runtime과 Component Sheets A–D에는 자동화/렌더 evidence가 있다. 이 component evidence와 전체 제품 상태를 혼동하지 않는다. `FULL_VERTICAL_SLICE_NOT_RUN`, `HUMAN_NOT_RUN`, `DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`은 유지한다.

## Workspace authority

```text
Notion
→ 사람용 Project Home / Work / Core System / Visual / Asset / Flow

Repository
→ Markdown / JSON / game data / code / Scene / Resource / Test / runtime evidence

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
```

Google Sheet의 기존 visual/image inventory와 asset cap은 이번 r5.4 Coverage에서 고유한 역사 범위를 복구하는 **migration compatibility input**으로만 읽었다. 현재 Visual Coverage owner는 GitHub `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json` + Notion Visual Bible이다.

## 현재 Visual authority

```yaml
base_style_lock:
  decision: ART-STYLE-01
  name: Soft Storybook Cel 2D Hybrid
  source_edit_regenerate_recompose: PROHIBITED_WITHOUT_EXPLICIT_USER_OVERRIDE
current_overlay:
  decision: GM-VISUAL-DIRECTION-20260825-01
  logo: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
  style: MAGIC_ANIME_EMPHASIS_OVER_STORYBOOK_ENVIRONMENT
representative_screen_boundary:
  decision: GM-REPRESENTATIVE-SCREENS-20260825-01
  dialogue: APPROVED_REFERENCE
  battle_spell_mood_and_composition: APPROVED_REFERENCE
  battle_spell_system_ui: REWORK_REQUIRED_AGAINST_CURRENT_CANON
movement:
  previous_3d_like_presentation: USER_REJECTED
  current_direction: SIMPLE_2D_MOVEMENT_OR_SCENE_TRANSITION
```

Current coverage summary:

```text
REUSE
- Logo 01 / approved style
- Component Sheets A–D / semantic UI family

ADAPT
- dialogue
- glyph drawing
- typed glyph Vault/Stock presentation
- feedback/VFX
- Result/Grimoire
- simple 2D movement/scene transition
- initial companion
- font/icon support

CREATE
- FIVE_POINT_STAR → Prepared Spell Stage2 representative visual
- Frostbloom environment candidates
- first-session character half-body set
- Frostbloom focal threat/entity

DEFER
- Task8 Stage3 final use representative visual
- store/key art
- long-term companion growth forms

CUT
- new 3D exploration asset family
- current Slice multi-enemy wave asset family
- baked functional text/numbers/state truth
```

## 다음 정확히 한 장의 Visual Text Brief

3개 유효 대안을 비교했다.

A. Glyph Drawing + Vault — direct-writing fantasy는 강하지만 Task6/current reference로 coverage가 상대적으로 높음.

B. **Typed Glyph Vault/Stock → FIVE_POINT_STAR → Prepared Spell** — 승인 battle/spell 시안에서 확인된 Stock/circuit semantic rework gap을 가장 직접적으로 닫음.

C. Prepared Spell → Target → Final Preview → Use — 중요한 P0이지만 Task8 product screen이 current main에 없어 지금 고정하면 재작업 위험이 더 큼.

**Selected: B**

```yaml
brief_id: GR-VISUAL-BRIEF-STAGE2-STOCK-CIRCUIT-20260826-01
status: TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL
aspect: 16:9 LANDSCAPE
result_count: 1
```

Composition:

1. left Source Rail — exact Vault와 typed Glyph Stock을 서로 다른 출처로 구분
2. center — FIVE_POINT_STAR, 중앙 Main 1 + 외곽 보조 0~5 동일 위상
3. right — circuit Preview + Prepared Spell 상태까지만 표시
4. 온실/사건 scene context는 UI 뒤에서도 유지

Required semantics:

- Stock is typed glyph source, not completed spell
- no hidden position bonus
- no auto target
- no auto commit
- Stage2 prepares spell before Stage3 target/use
- reserved/consumed/unavailable states use icon/shape/text redundancy, not color only

Functional success rate, Mana, target, arbitrary names/dialogue/costs/button copy는 이미지에 굽지 않는다. 필요한 최소 concept label만 `보관 글자 / 주문 회로 / 준비 주문`을 사용할 수 있다.

r5.4 conversation gate에 따라 이 Text Brief 뒤에는 **STOP**한다. 사용자 명시 생성 승인 뒤 정확히 1장 생성한다.

## Spell Workflow

```yaml
task3:
  pr: 104
  scope: IMMUTABLE_PREPARED_SPELL_AND_EXACTLY_ONCE_INVENTORY
task4:
  pr: 105
  scope: STAGE2_ATOMIC_GLYPH_PREPARATION
task5:
  pr: 106
  scope: STAGE3_TARGET_USE_ATOMIC_TRANSACTION
task6:
  pr: 108
  scope: GLYPH_DRAWING_WORKFLOW_SCREEN
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
```

Task8은 기존 Task5 Stage3 authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

역사 compatibility locator:

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
```

현재 continuation state:

```yaml
product_status_historical: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
historical_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
current_execution_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
```

`8c611f...`는 당시 local Git baseline이지 Task8 product commit이 아니다. 과거 `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 그때 관찰한 uncommitted worktree의 역사 evidence다.

2026-08-24 사용자 PC read-only recovery probe로 두 로컬 Task8 후보가 실제 존재함을 확인했고, 이어 병합된 preservation tool을 실행해 외부 snapshot으로 보존했다. 직접 반환된 receipt는 `TASK8_CANDIDATES_PRESERVED`, `source_unchanged=true`, `source_content_unchanged=true`이며 primary 11 files, secondary 33 files가 snapshot에 기록됐다.

따라서 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`와 candidate-preservation gate는 닫혔다. compatibility consumer 검색을 위해 locator 문자열은 보존하지만 current gate로 재해석하지 않는다. 보존 성공을 current-main 호환성이나 fresh HiGodot/GUT/Hera PASS로 승격하지 않는다.

제품 구현이 다시 명시적으로 승인되면 역사 worktree에 pull/rebase/clean을 하지 않고 fresh `origin/main`에서 별도 clean reconciliation worktree를 만든다. 이후 exact-project HiGodot readback을 거쳐 primary v2를 우선 복구하고 secondary는 parity evidence로만 비교한다.

## Sync21 continuation / executor boundary — historical compatibility anchors

아래 문자열은 과거 handoff 탐색과 machine consumer compatibility를 위해 보존한다. r5.4의 current GPT→local Codex 운영 방식으로 재승격하지 않는다.

```text
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

Remote authority readback은 local worktree/HEAD/HiGodot evidence를 대체하지 않는다. 현재 r5.4의 local Codex policy는 retired이며, 위 문자열은 current orchestration instruction이 아니라 historical locator다.

## Base proposal / learning closure provenance

```yaml
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
```

이 값들은 Sync21 handoff가 닫은 역사 provenance이며 r5.4 전환이 새로운 Base implementation authority를 부여하지 않는다.

## Tool authority

- Historical project tool provenance: HiGodot/Godot AI `v3.1.4`, GUT `v9.7.1`, Hera `v1.0.0`.
- r5.4는 project-specific local Codex home/binary/port를 current invariant로 사용하지 않는다.
- 실제 shared Godot/Godot AI runtime/session readiness는 fresh local executor/session readback 없이 주장하지 않는다.
- historical live receipts는 현재 local readiness를 자동 증명하지 않는다.

## PR #151 / current open PR boundary

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 **병합 완료**된 current-main 역사다. Component Sheet A–D와 semantic UI pack은 병합된 사실로 읽되, 이것이 Task8 또는 Human/Device/Performance/Full Slice PASS를 의미하지 않는다.

2026-08-26 r5.4 work 시작 시 live open PR은 PR #166 하나이며 `README.md`만 변경하는 Draft other-workstream이다. `OPEN_PR_READ_ONLY_BY_DEFAULT`로 유지하고 이번 current-task branch에 흡수하지 않는다.

## v4.8 migration / legacy snapshot boundary

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`는 v4.5 시기의 장기 machine snapshot을 보존한다. v4.8 thin-adapter 전환 후에는 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 사용하고 새 current decision/gate를 기록하지 않는다.

현재 authority chain:

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
→ task/domain-specific current owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

## 제품 구현을 다시 시작할 때의 순서

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
4. Task8 product PR / exact-head CI / merge / merged-main readback
5. Task9 Product Root + responsive/E2E integration
6. 대표 00~10분 Human Slice
7. 10~23 → 46분 증거 확장
```

## 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
HIGODOT_CURRENT_RECONCILIATION_READBACK_NOT_RUN
FRESH_TASK8_TESTS_NOT_RUN
FRESH_FULL_RUNNER_NOT_RUN
HERA_SOURCE_DELTA_NOT_RUN
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
RUNTIME_VISUAL_COMPLETE_NOT_PROVEN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```
