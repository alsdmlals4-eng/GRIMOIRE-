# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-26-r5.4-superset-final
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
current_user_work_scope: VISUAL_ASSET_COVERAGE_AND_NEXT_SINGLE_VISUAL_BRIEF
product_implementation_authorized_by_current_user_work_scope: false
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
visual_generation_state: TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL
visual_direction_decision: GM-VISUAL-DIRECTION-20260825-01
representative_screens_decision: GM-REPRESENTATIVE-SCREENS-20260825-01
art_style_lock: ART-STYLE-01
logo_direction: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

`v4.8 r5.4 / GM-CONTRACT-V4-8-BINDING-01`이 현재 프로젝트 실행 계약이다. v4.5 이하 binding은 역사 provenance로 보존하며 current authority로 사용하지 않는다. Base의 과거 SHA도 영구 authority가 아니고 새 실질 work unit마다 latest completed Base `main`과 필요한 owner를 다시 읽는다.

이번 `작업재개 → 진행해`는 **Visual/Image/Asset planning continuation**이다. Task8/Godot 제품 구현은 사용자가 구현 작업을 명시적으로 재개하기 전까지 시작하지 않는다.

## Workspace authority

```text
Notion
→ 사람용 Project Home / Work / Core System / Visual / Asset / Flow

GitHub repository
→ Markdown / JSON / game data / code / Scene / Resource / Test / runtime evidence

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ 신규 canon write 금지
→ 고유 자료 흡수 확인 전 삭제 금지
```

Google Sheet는 current state writer가 아니다. 이번 r5.4 Visual preflight에서는 기존 Asset/이미지 inventory의 **고유한 역사 범위만 migration input으로 흡수**하고, current coverage는 GitHub + Notion Visual Bible이 소유한다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 제품 흐름은 다음이다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재까지 병합된 제품 계층:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen (`TASK7_MERGED_MAIN_VERIFIED`)
- PR #151 — Component Sheets A–D + reusable semantic UI pack (`MERGED_MAIN_VERIFIED`)

Task8은 Task5 Stage3 authority의 thin UI consumer이며 새 target/use/Mana/inventory/result/rollback authority를 만들지 않는다.

## 현재 Visual 정본

```yaml
base_style_lock:
  decision: ART-STYLE-01
  name: Soft Storybook Cel 2D Hybrid
  source_edit_or_regeneration: PROHIBITED_WITHOUT_EXPLICIT_USER_OVERRIDE
current_visual_overlay:
  decision: GM-VISUAL-DIRECTION-20260825-01
  logo: Logo 01
  style: Magic/Anime emphasis over Storybook environment
representative_screens:
  decision: GM-REPRESENTATIVE-SCREENS-20260825-01
  dialogue: APPROVED_REFERENCE
  battle_spell_mood_and_composition: APPROVED_REFERENCE
  battle_spell_system_ui: REWORK_REQUIRED_AGAINST_CURRENT_CANON
movement:
  previous_3d_like_direction: USER_REJECTED
  current_direction: SIMPLE_2D_MOVEMENT_OR_SCENE_TRANSITION
```

현재 Visual serial production의 coverage owner:

`docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`

핵심 판정:

- **REUSE**: Logo 01, 승인 스타일, Component Sheets A–D, semantic UI pack, Star UI Kit 계열.
- **ADAPT**: Dialogue layout, Glyph Drawing, Result/Grimoire, simple 2D transition, core feedback VFX.
- **CREATE**: Frostbloom environment runtime candidates, first-session character/companion/threat assets, 그리고 현재 가장 큰 시스템-시각 gap인 Stage2 representative visual.
- **DEFER**: Task8 final use screen visual, store key art/platform assets.
- **CUT**: 새 3D exploration asset family, baked functional text/numbers, Slice용 다중 enemy-wave production.

## 다음 정확히 한 장의 Visual 브리프

현재 가장 가치가 높은 1장은:

```text
Typed Glyph Vault/Stock
→ FIVE_POINT_STAR Circuit
→ Prepared Spell
```

선정 이유:

1. 승인된 전투/주문 시안의 가장 큰 rework finding이 `Stock / circuit / spell` 의미 축약이었다.
2. Task6 Glyph Drawing은 이미 구현/참고가 있어 상대적으로 coverage가 높다.
3. Task8 Stage3 사용 화면은 current main에 없으므로 지금 final visual을 먼저 만들면 재작업 위험이 높다.
4. Stage2 화면은 현재 정본의 `typed glyph source → center main + 0~5 auxiliary → prepared spell`을 직접 보여주면서 Task8 behavior를 발명하지 않는다.

브리프 상태는 `TEXT_BRIEF_READY_AWAITING_EXPLICIT_USER_GENERATION_APPROVAL`이다. r5.4 규칙에 따라 **이 텍스트 브리프 뒤 자동으로 이미지를 생성하지 않는다.**

## Task8 실제 복구 상태

2026-08-24 사용자 PC read-only probe와 preservation receipt로 두 역사 Task8 candidate가 보존된 사실은 확인됐다.

```yaml
preservation_status: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
primary: feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b
secondary: task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
current_execution_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
```

이것은 current-main compatibility, fresh HiGodot, GUT/Hera, runtime 또는 제품 병합 증거가 아니다. 이번 Visual work unit에서 Task8 제품 코드는 변경하지 않는다.

## Historical compatibility anchors — current gate 아님

아래 문자열은 기존 machine consumer와 과거 handoff 탐색을 위해 보존한다. r5.4의 current local-Codex 운영 지시로 해석하지 않는다.

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

현재 r5.4에서 project-specific local Codex orchestration은 retired다. 위 문자열은 **HISTORICAL_COMPATIBILITY_LOCATOR**이며 현재 실행 경계는 active r5.4 binding과 fresh executor/session readback이 소유한다.

## Godot 진입점과 Runtime Reality

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- Renderer: GL Compatibility

Star Circuit Runtime component와 Component Sheets에는 자동화 evidence가 있다. 그러나 현재 전체 제품 구현 판정은 `PARTIAL_FOUNDATION`; Human/Device/Performance/Full Vertical Slice는 계속 `NOT_RUN`이다.

Godot/Godot AI의 설치·exact pin·port 정책은 r5.4와 current Base owner를 따른다. project-specific `CODEX_HOME`, 전용 Godot binary, 전용 8001/9501 port를 current project invariant로 사용하지 않는다.

## Open PR 경계

새 작업 시작 시 live GitHub를 다시 읽는다. 2026-08-26 r5.4 reconciliation 시작 시점의 open PR은:

- PR #166 `docs: route README to current GRIMOIRE canon` — Draft, `README.md` only, **READ_ONLY other workstream**.

이번 current-task work는 latest completed `main`에서 별도 branch/PR로 진행한다. PR #166을 수정·병합·흡수하지 않는다.

## 현재 Authority chain

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
→ current Visual / domain owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`의 v4.5-era machine snapshot은 `HISTORICAL_COMPATIBILITY_SNAPSHOT`으로만 읽는다.

## 제품 구현을 다시 시작할 때의 순서

현재 Visual work와 별개로, 사용자가 구현을 명시적으로 재개하면 제품 순서는 다음을 유지한다.

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
4. Task8 product PR / exact-head CI / merge / merged-main readback
5. Task9 Product Root + responsive/E2E integration
6. 대표 00~10분 Human Slice
7. 10~23 → 46분 증거 확장
```

## 현재 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
FRESH_TASK8_TESTS_NOT_RUN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
RUNTIME_VISUAL_COMPLETE_NOT_PROVEN
```

## 읽기 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`
5. `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`
6. `docs/planning/visual/GRIMOIRE_VISUAL_DIRECTION_APPROVAL_2026-08-25.json`
7. `docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json`
8. 현재 목표의 분야별 owner / actual code·Scene·Resource·Test
9. `CURRENT_*` machine snapshot — historical compatibility lookup only
