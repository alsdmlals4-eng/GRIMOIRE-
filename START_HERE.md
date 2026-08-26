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
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr_predecessor: 158
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
current_user_work_scope: SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_AND_VISUAL_ALIGNMENT
product_implementation_authorized_by_current_user_work_scope: false
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
visual_generation_state: NOT_REQUESTED_AFTER_PLAYER_FLOW_APPROVAL
visual_direction_decision: GM-VISUAL-DIRECTION-20260825-01
representative_screens_decision: GM-REPRESENTATIVE-SCREENS-20260825-01
art_style_lock: ART-STYLE-01
logo_direction: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
product_decision_overlay: docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
product_decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
player_facing_spell_flow: GLYPH_TO_SPELL_TO_TARGET_TO_CAST
player_facing_ux_groups: SPELL_BUILD_AND_SPELL_CAST
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
task8_product_unit: TASK8_SPELL_USE_SCREEN
next_product_task: TASK8_SPELL_USE_SCREEN
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_delta_existence: OBSERVED_PRESENT
task8_candidate_preservation: OBSERVED_PASS
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
gut_status: GUT_FORMALLY_ADOPTED
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_current_reconciliation_readback: NOT_RUN
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
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

`v4.8 r5.4 / GM-CONTRACT-V4-8-BINDING-01`이 현재 프로젝트 실행 계약이다. v4.5 이하 binding은 역사 provenance로 보존하며 current authority로 사용하지 않는다. Base의 과거 SHA도 영구 authority가 아니고 새 실질 work unit마다 latest completed Base `main`과 필요한 owner를 다시 읽는다.

2026-08-26 사용자는 `GM-SPELL-WORKFLOW-UI-V2-01`의 **플레이어 노출 흐름 간략화**를 승인했다. 현재 작업은 기획/Visual 정본 교정이며 Task8/Godot 제품 구현은 사용자가 구현 작업을 명시적으로 재개하기 전까지 시작하지 않는다. `TASK8_SPELL_USE_SCREEN`은 다음 제품 task locator일 뿐 현재 구현 권한을 뜻하지 않는다.

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

Google Sheet는 current state writer가 아니다. 현재 Sheet의 과거 `GM-SPELL-WORKFLOW-UI-V2-01` 문구가 새 플레이어 용어보다 오래되어도 신규 canon write로 교정하지 않는다. 새 정본은 GitHub + Notion이며 Sheet는 migration compatibility 자료로만 읽는다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 **플레이어 노출 흐름**은 다음이다.

```text
글자
→ 주문
→ 대상
→ 시전
```

화면 경험은 두 덩어리로 묶는다.

```text
주문 만들기
= 글자 선택·작성
+ FIVE_POINT_STAR 회로 조합
+ 완성 주문 이름 확인

주문 쓰기
= 게임 장면에서 대상 지정
+ 필요한 최종 Preview
+ 명시 시전
```

`Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`는 구현·데이터·테스트 내부 용어로 계속 유지하지만 기본 플레이어 UI의 주 용어로 먼저 가르치지 않는다. `PreparedSpell`의 기본 플레이어 표현은 **완성 주문 / 완성 주문 이름**, Stage3의 기본 플레이어 표현은 **대상 / 시전**이다.

현재까지 병합된 제품 계층:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen (`TASK7_MERGED_MAIN_VERIFIED`)
- PR #151 — Component Sheets A–D + reusable semantic UI pack (`MERGED_MAIN_VERIFIED`)

내부 authority는 바꾸지 않는다. Task8은 계속 Task5 Stage3 authority의 thin UI consumer이며 새 target/use/Mana/inventory/result/rollback authority를 만들지 않는다. 자동 Target·자동 시전·회로 자동 최적화도 금지한다.

현재 revision owner:

`docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`

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
- **CREATE**: Frostbloom environment runtime candidates, first-session character/companion/threat assets.
- **DEFER**: Task8 final use screen visual, store key art/platform assets.
- **CUT**: 새 3D exploration asset family, baked functional text/numbers, Slice용 다중 enemy-wave production.

## 현재 Spell UX 시각 방향

최근 Stage2 시안은 `보관 글자 → 주문 회로 → 준비 주문` 구조와 FIVE_POINT_STAR의 가독성을 검토하는 데 사용됐다. 사용자 피드백으로 세로 패찰/부적 느낌은 폐기하고, **직접 쓰인 마법 글자**를 중심으로 단순화한 표현이 승인됐다.

현재 시각 규칙:

1. 글자는 부적·패찰·수집 카드보다 **획이 보이는 직접 쓰인 문자**로 읽혀야 한다.
2. 회로에는 글자를 패찰째 꽂기보다 **글자를 직접 놓거나 써 넣는 느낌**을 우선한다.
3. 회로 조합의 가장 중요한 결과 라벨은 `준비 주문`보다 **완성 주문 이름**이다.
4. 완성 주문 선택 뒤에는 별도 복잡한 대상 화면을 기본 가정하지 않고, 가능하면 게임 장면에서 직접 대상 지정 → 필요한 Preview → **시전**으로 이어간다.
5. 주문 이름의 실제 생성 문법/로컬라이징 알고리즘은 아직 별도 설계 대상이며 임의로 확정하지 않는다.

현재 사용자 메시지는 새 이미지 생성 요청이 아니다. 다음 이미지 작업은 fresh text brief와 명시적 생성 요청이 있을 때만 진행한다.

## Task8 실제 복구 상태

2026-08-24 사용자 PC read-only probe와 preservation receipt로 두 역사 Task8 candidate가 보존된 사실은 확인됐다.

```yaml
preservation_status: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
primary: feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b
secondary: task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
current_execution_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
```

이것은 current-main compatibility, fresh HiGodot, GUT/Hera, runtime 또는 제품 병합 증거가 아니다. 이번 기획/Visual work unit에서 Task8 제품 코드는 변경하지 않는다.

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

새 작업 시작 시 live GitHub를 다시 읽는다. 2026-08-26 이번 work unit 시작 시점의 open PR은:

- PR #166 `docs: route README to current GRIMOIRE canon` — Draft, `README.md` only, **READ_ONLY other workstream**.

이번 current-task work는 latest completed `main`에서 별도 branch/PR로 진행한다. PR #166을 수정·병합·흡수하지 않는다.

## 현재 Authority chain

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
→ docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
→ current Visual / domain owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`의 v4.5-era machine snapshot은 `HISTORICAL_COMPATIBILITY_SNAPSHOT`으로만 읽는다.

## 제품 구현을 다시 시작할 때의 순서

현재 기획/Visual work와 별개로, 사용자가 구현을 명시적으로 재개하면 제품 순서는 다음을 유지한다.

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. 새 플레이어 용어 overlay를 Task8 UI에 매핑하고 기존 Stage3 authority와 충돌 없는지 확인
4. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
5. Task8 product PR / exact-head CI / merge / merged-main readback
6. Task9 Product Root + responsive/E2E integration
7. 대표 00~10분 Human Slice
8. 10~23 → 46분 증거 확장
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
5. `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`
6. `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`
7. `docs/planning/visual/GRIMOIRE_VISUAL_DIRECTION_APPROVAL_2026-08-25.json`
8. `docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json`
9. 현재 목표의 분야별 owner / actual code·Scene·Resource·Test
10. `CURRENT_*` machine snapshot — historical compatibility lookup only
