<a id="lean-operating-adoption"></a>

## 현행 운영 조항 — 2026-09-20 선택 채택

- 결정: GM-LEAN-OPERATING-20260920. 사용자 “승인할게”, 이어 “재미검증기준도 같이 추가해줘”를 이 운영 범위에 적용한다.
- Base source: [#883](https://github.com/alsdmlals4-eng/Base/pull/883), [#885](https://github.com/alsdmlals4-eng/Base/pull/885); 확인한 최신 main `23ecad5a3084f97c4e5d1e39a9a6d70d1eeb37ef`. 영구 최신 기준이 아니라 이번 채택 출처다. 새 작업에서 원격 drift를 확인하고 필요한 변경만 판단한다.
- v9.4.3 release/registry lock과 게임·엔진·저장·승인 자산은 유지한다. source revision/owner 경로는 `skills/PROJECT_BASE_ADAPTER.json#/base_policy_adoption`가 소유한다. 생성 snapshot/dashboard는 직접 편집하지 않는다.
- 채택: current-authority read order, 조건부 최소 로딩, 동일 승인/계획 재사용, UNIFIED_WORK_EXECUTION, 같은 승인 후보 계보 전체 검토 총 2회, 기능 경험→표현→consumer→검증 연결.
- 선택 비적용: Base 공용 수치·메뉴·장르 예시, 전역/설치 플러그인 수정, release lock 일괄 교체, 새 재미 감독/분석 서버/독립 보고서. 사람 검수가 없다고 승인된 구현을 전부 정지하지 않는다.
- 기존 handoff-only, 매 단계 5회 전체 검토, 외부 조사 무조건 재수행은 아래 역사 조항보다 이 절이 우선한다. 코드 실행은 승인 범위와 실제 capability로 판단하며 권한 우회는 금지한다. 상위 시스템·도구의 필수 규칙은 바꾸지 않는다.
- 과거 단계·고정 SHA·옛 승인 대기는 역사 locator다. 같은 소비처의 유효 증거는 재사용하되 변경 영향은 다시 검증한다. 실제 main과 작업 브랜치의 제품 상태를 혼합하지 않는다.
- 승인된 계획: 진입점/Skill 교정 → 출처 loader·생성 뷰·관련 검사 → 독립 검토·표적 교정 → dedicated PR 정상 병합·main readback → 기존 게임 브랜치에 운영 변경만 반영.
- 보호: 60개 미병합 게임 커밋, 다른 PR(#253 포함), 사용자 dirty/임시 자산은 흡수·삭제하지 않는다. 추가 비용 0, 공개 Git에 개인 증빙 없음.
- 현재 본문 아래의 2026-08-26 제품 스냅샷은 역사 호환 내용이다. 제품 의미는 현재 체크아웃의 Active Context·승인 기능 원본·실제 consumer를 함께 확인한다.

### 검토와 증거 기록

기준 main: `d384c454768a8aa3b0adb939e0b035ac2afa426e`.
변경 전 전체 Python 회귀: 340개, 17 failure / 1 error / 2 skipped. 구 버전/역사 상태 검사 실패를 이번 게임·플러그인 변경으로 숨기지 않는다.
출처 loader 신규 회귀 4개는 구현 전 실패 → 구현 후 통과했다. 로컬 Base 본문 변경, 원격 drift, 미승인 경로, 다른 계보를 검사한다.
스킬 baseline 검토는 본문 출처 불일치·역사 owner 오선택 위험을 확인했으며 실제 에이전트 규칙 위반을 관측했다고 과장하지 않는다.
전체 검토 사용: 1/2. 독립 검토 1에서 P0/P1 없음, P2 두 건 발견: 빈 읽기 경로의 생성 쓰기 전환과 생성 뷰의 역사 상태 오표시.
빈 경로 회귀는 RED 확인 후 교정했고, 호환 뷰는 역사 scope·현재 owner·승인 원본 분리를 전파했다. 신규 집중 검사 12개 통과.
350개 전체 검사 시점에서 17 failure / 1 error / 2 skipped이며 실패 ID 18개가 변경 전과 동일했다. 전체 PASS로 주장하지 않는다.
최종 candidate의 전체 회귀·검토 2·CI·병합/main readback은 다음 완료 단계다.
재미 기준은 [기존 UX/UI owner](../UX_UI_SYSTEM.md#fun-verification-binding)에서 프로젝트에 맞게 선택 적용한다. 문서 채택은 게임 재미 검증 완료가 아니다.

---

# GRIMOIRE 프로젝트 계약 v4.8 r5.4 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: '4.8'
revision: '2026-08-26-r5.4-superset-final'
contract_status: ACTIVE_BASE_CURRENT_MAIN_THIN_ADAPTER_PROJECT_EXECUTION_CONTRACT
binding_decision_id: GM-CONTRACT-V4-8-BINDING-01
binding_sync_id: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
current_governance_overlay: GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01
current_governance_overlay_owner: docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
approved_at: 2026-08-26
approval_source: 사용자 명시 continuation "진행해" after r5.4 fresh-read audit
execution_request_state: USER_EXPLICIT_CONTINUATION_PRESENT
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: main
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
base_loading_policy: BASE_OWNER_PROGRESSIVE_LOAD
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
project_fact_policy: PROJECT_CANON_AND_ACTUAL_IMPLEMENTATION_FIRST
fresh_read_bootstrap_policy: PROJECT_GITHUB_REPOSITORY_ONLY_RECONSTRUCTION_REQUIRED
entry_state_reconciliation_policy: REQUIRED_BEFORE_MATERIAL_MUTATION
workspace_human_canon: REPOSITORY_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
notion_policy: RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
notion_migration_audit: docs/planning/NOTION_TO_REPOSITORY_MIGRATION_AUDIT_2026-08-28.md
notion_migration_state: MERGED_MAIN_READ_BACK__GR_NOTION_MIGRATION_20260828_01
google_sheets: COMPATIBILITY_ONLY_MIGRATION_SOURCE_UNTIL_REMOVAL
visual_asset_inventory_and_style_lock_policy: REQUIRED_BEFORE_SERIAL_VISUAL_PRODUCTION
visual_generation_policy: USER_PREAUTHORIZED_CANDIDATE_GENERATION_AFTER_PREFLIGHT__FINAL_LOCK_ONLY
open_pr_policy: OPEN_PR_READ_ONLY_BY_DEFAULT
current_task_pr_policy: CURRENT_TASK_CONTINUATION_AUTHORIZES_READY_MERGE
force_and_ruleset_bypass_policy: FORBIDDEN
local_codex_policy: RETIRED_NOT_USED
gpt_local_codex_orchestration_policy: RETIRED
codex_execution_policy: INDEPENDENT_GODOT_PRODUCT_IMPLEMENTATION_HANDOFF_ONLY
shared_godot_runtime_policy: SHARED_APPROVED_EXACT_PIN_DEFAULT_NO_PER_PROJECT_DUPLICATE_BINARY
shared_godot_ai_port_policy: FIXED_DEFAULT_PORTS_WITH_EXACT_SESSION_ROUTING
incremental_cost_policy: ZERO_INCREMENTAL_COST_REQUIRED
adversarial_full_loop_minimum: 5
implementation_reality_gate: REQUIRED_FOR_MATERIAL_CLAIMS_AND_CAPABILITY_DEPENDENT_WORK
```

## 1. 바인딩 의미

이 문서는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8-r5.4_SUPERSET_FINAL_20260826.md`를 GRIMOIRE에 적용하는 **프로젝트 전용 thin adapter**다.

Base의 Work Mode, Skill routing, CI, PR, 검증, 완료 절차를 복제하지 않는다. 새 실질 작업 단위마다 최신 완료 Base `main`과 필요한 owner를 progressive-load한다.

```yaml
v4_8_source_role: USER_SUPPLIED_ACTIVE_PROJECT_EXECUTION_CONTRACT
base_snapshot_observed_when_r5_4_written: edb3b3376603c9f6b00d64af3126304f8c9946bf
base_snapshot_role: HISTORICAL_OBSERVATION_ONLY_REFETCH_BEFORE_NEW_WORK
project_main_observed_at_binding_start: 829094fd87433e14fe42b23f9b7bec6321f5048d
project_main_observation_role: EXACT_BASELINE_FOR_THIS_RECONCILIATION_ONLY
same_decision_revision_rule: GM-CONTRACT-V4-8-BINDING-01_PRESERVED
```

v4.5, v4.4, v4.3 binding 문서는 삭제하지 않는다. 모두 역사 provenance로 보존하고 current contract authority만 v4.8 r5.4로 전진한다. 기존 v4.8 r2 내용과 `GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC`는 predecessor provenance로 보존한다.

## 2. 프로젝트 현재 불변식

```yaml
product_stage: DEMO_FIRST_VERTICAL_SLICE
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
current_main_scene: res://src/ui/spell_workflow/spell_workflow_product_root.tscn
main_scene_role: DEVELOPMENT_PRODUCT_ROOT_ENTRY
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
circuit_topology: FIVE_POINT_STAR
next_product_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
task9_product_commit: db038a4fd964ca037bfe97f6aee5d0cc7d0daf93
task9_product_pr: 192
task9_status: MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY
component_sheet_pr151: MERGED_MAIN_VERIFIED
parallel_open_pr_at_binding_start: PR_166_DRAFT_READ_ONLY_README_ONLY
current_user_work_scope: SPELL_WORKFLOW_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE
product_implementation_authorized_by_current_user_work_scope: true
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
```

현재 POC/Component PASS를 완성형 첫 세션 또는 전체 제품 PASS로 승격하지 않는다. Task9 Product Root는 자동화 가능한 범위에서 main 병합까지 완료됐으며, 사람·기기·성능·출시 검증은 다음 사용자 검증 게이트로 남는다.

## 3. Task8 복구 경계

Task8은 기존 Task5 Stage3 atomic target/use authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

현재 GitHub/보존 사실:

```yaml
task8_primary_recovery_branch: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_head_role: HISTORICAL_GIT_BASELINE_NOT_PRODUCT_COMMIT
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
preservation_status: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
historical_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
historical_acceptance_only:
  focused_gut: 15_tests_90_assertions_0_failures
  predecessor_regression: 42_suites_1588_assertions_0_failures
  hera_source_delta: NONE_OBSERVED
current_fresh_compatibility_and_test_state: NOT_RUN
```

이번 ChatGPT 세션은 사용자 Windows checkout의 현재 Godot/Task8 product state를 직접 실행한 세션이 아니다.

```text
LOCAL_SYNC: NOT_RUN / BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: NOT_RUN / BLOCKED_NO_LOCAL_ACCESS
FRESH_TASK8_COMPATIBILITY: NOT_RUN
```

보존 성공은 current-main 호환성·fresh HiGodot/GUT/Hera·product PR readiness를 증명하지 않는다. 제품 구현이 다시 명시적으로 승인되면 별도 clean reconciliation worktree와 fresh exact-project evidence부터 시작한다.

## 4. Workspace authority

```text
GitHub repository
→ 사람이 읽는 Markdown Project Home / Flow / Visual / Core System / Asset / Work
→ JSON / code / data / Scene / Resource / Test / tracked asset / CI / runtime truth

Notion
→ HISTORICAL_DISCOVERY_ONLY
→ routine read/write, current-canon ownership, destination readback, delete/archive/export 금지

Google Sheets
→ 고유 미이관 자료가 남은 경우에만 migration compatibility source
→ 신규 canon write 금지
```

Repository documentation readback은 runtime PASS가 아니며, GitHub 구현 PASS도 Human/Player validation을 자동 보장하지 않는다.

Google Sheet와 historical Notion의 기존 자료는 **UNIQUE migration/discovery input**으로만 읽는다. 현재 coverage owner는 GitHub `GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`과 repository visual owners다.

## 5. Visual production 경계

현재 승인된 스타일을 다시 결정하지 않는다.

```yaml
art_style_base_lock: ART-STYLE-01
art_style_base_name: Soft Storybook Cel 2D Hybrid
current_visual_overlay: GM-VISUAL-DIRECTION-20260825-01
logo_direction: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
representative_screen_boundary: GM-REPRESENTATIVE-SCREENS-20260825-01
```

r5.4 시각 작업 순서:

```text
Visual Requirement Delete Test
→ existing approved/runtime/component reuse
→ VISUAL_ASSET_COVERAGE + ART_STYLE_LOCK readback
→ exactly one text brief
→ STOP
→ explicit user generation approval
→ exactly one result
→ STOP
→ result approval/revision
→ approved destination sync/readback
```

현재 다음 1장 후보는 `Typed Glyph Vault/Stock → FIVE_POINT_STAR → Prepared Spell` Stage2 대표 화면이다. 이유는 승인된 전투/주문 시안의 가장 큰 rework finding이 Stock/circuit semantics였고, Task6보다 visual gap이 크며 Task8 Stage3를 미리 발명하지 않기 때문이다.

`Prepared Spell → Target → Final Preview → Use`는 Task8 PR #190과 Task9 Product Root PR #192에서 구현·병합됐으며, 이후 검증은 사용자 수동 실행 게이트에서 다룬다.

## 6. Open PR / workstream 경계

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 이미 병합된 current-main 역사다.

현재 fresh-read open PR:

```yaml
pr_166:
  title: docs: route README to current GRIMOIRE canon
  state: DRAFT
  changed_path: README.md
  policy: ACTIVE_OTHER_WORKSTREAM_READ_ONLY
```

이번 r5.4/Visual 작업은 latest completed `main`에서 별도 current-task branch/PR로 진행하며 PR #166을 수정·rebase·close·merge·absorb하지 않는다.

## 7. Evidence ceiling

```text
CONTRACT_REVISION: 2026-08-26-r5.4-superset-final
VISUAL_COVERAGE_PREFLIGHT: DOCUMENTED
NEXT_SINGLE_VISUAL_TEXT_BRIEF: READY_AWAITING_EXPLICIT_GENERATION_APPROVAL
RUNTIME_VISUAL_COMPLETE: NOT_PROVEN
HUMAN_USABILITY_EVIDENCE: NOT_RUN
PLAYER_EXPERIENCE_EVIDENCE: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_VERTICAL_SLICE: NOT_RUN
WINDOWS_EXPORT: NOT_RUN
ANDROID_EXPORT: NOT_RUN
ANDROID_DEVICE: NOT_RUN
KOREAN_RUNTIME_FONT_VALIDATION: NOT_RUN
AUDIO_VAULT_PATH: BLOCKED_UNVERIFIED
AUDIO_RIGHTS: BLOCKED_UNVERIFIED
VISUAL_AUDIO_COMPLETE: CLAIM_UNVERIFIED
```

자동 테스트·렌더·component capture를 위 evidence로 승격하지 않는다.

## 8. r5.4 reconciliation delivery provenance

```yaml
authority_sync_id: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
baseline_project_main: 829094fd87433e14fe42b23f9b7bec6321f5048d
baseline_base_main: edb3b3376603c9f6b00d64af3126304f8c9946bf
delivery_sequence:
  - FRESH_READ_PROJECT_BOOTSTRAP_AND_ENTRY_STATE_RECONCILIATION
  - R5_4_BINDING_CORRECTION
  - NOTION_SYSTEM_METADATA_BOUNDED_CORRECTION
  - VISUAL_REQUIREMENT_DELETE_TEST_AND_COVERAGE_PREFLIGHT
  - NEXT_SINGLE_VISUAL_TEXT_BRIEF_ONLY
  - GITHUB_NOTION_READBACK
  - FIVE_PLUS_ADVERSARIAL_REVIEW
  - CURRENT_TASK_PR_EXACT_HEAD_CHECKS
  - SAFE_MERGE_IF_GATES_PASS
  - POSTMERGE_MAIN_AND_NOTION_READBACK
product_code_or_scene_mutation: NONE
image_generation_in_this_unit: NONE
```

## 9. 역사 바인딩

```yaml
superseded_bindings:
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
  - docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
deletion: FORBIDDEN
```

이 바인딩은 제품 방향 변경이 아니라 current execution/governance contract, current Visual production gate, 그리고 repository-only current canon을 정렬하는 교정이다. 과거 delivery provenance 안의 Notion readback 문자열은 historical record로 보존한다.
