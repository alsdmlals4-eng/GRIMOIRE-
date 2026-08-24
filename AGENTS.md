# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_preservation_receipt: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
authority_sync_pr: 158
base_project_pin: v9.4.3
base_live_readback: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_status: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 현재 작업 원칙

1. 최신 사용자 지시 → 이 파일/`START_HERE.md` → `docs/ACTIVE_CONTEXT.md` + active v4.8 binding → 실제 code/Scene/Resource/Test → 필요한 분야 정본 순으로 읽는다.
2. Base는 프로젝트 pin만 맹신하지 않고 새 실질 작업 단위마다 latest completed `main`과 관련 owner를 다시 읽는다.
3. Notion은 사람이 읽는 Project Home·Work·Core System·Visual/Asset/Flow의 기본 작업면이다.
4. Repository는 Markdown/JSON/game data/code/Scene/Resource/Test/runtime evidence 정본이다.
5. Google Sheets는 역사 migration source다. 신규 canon write를 하지 않고, 고유 자료 흡수 확인 전 삭제도 하지 않는다.
6. 모든 live open/draft/ready PR은 기본 READ_ONLY다. **PR #151은 이미 `MERGED_MAIN_VERIFIED`인 역사/current-main 구성요소**이며 더 이상 `DO_NOT_TOUCH` open-work가 아니다. 실제 PR lifecycle과 현재 open PR 집합은 항상 live GitHub에서 읽는다.
7. 실제 실행하지 않은 Human/Device/Performance/Full Slice 증거를 PASS로 승격하지 않는다.
8. Task8의 로컬 dirty delta는 사용자 PC read-only probe로 존재가 확인됐고, 두 후보는 외부 snapshot으로 보존됐다. 역사 worktree를 직접 sync/rebase/clean하지 않고 별도 clean reconciliation worktree에서 current main과 조정한다.
9. 보존 성공은 제품 호환성·HiGodot readiness·fresh tests를 증명하지 않는다. 다음 gate는 `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`다.
10. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`의 v4.5-era machine snapshot은 v4.8 migration 이후 **historical compatibility locator**로만 취급한다. 현재 authority는 이 파일 + `START_HERE.md` + `docs/ACTIVE_CONTEXT.md` + v4.8 binding이다.

## 프로젝트 코어

> 조사 → 의도 → `FIVE_POINT_STAR` 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·Mana·위험 Preview → 명시 Commit → 결과·대가 → 복기.

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
stock_scope: TYPED_GLYPH_ONLY
commit: EXPLICIT_EXACTLY_ONCE
```

## Godot 현실

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Main Scene 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- 권장 엔진: Godot `4.7.1`
- Renderer: GL Compatibility

Star Circuit Runtime component는 다음 병합 증거를 가진다.

```yaml
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
canon_status: SYNCED_TO_MAIN
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_component_validation: AUTOMATED_HEADLESS_PASS
```

위 component PASS는 제품 전체 완료가 아니다. 현재 제품 구현 상태는 `PARTIAL_FOUNDATION`, Full Vertical Slice는 `NOT_RUN`이다.

## Spell Workflow 현재 경계

- `GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE`
- `TASK7_MERGED_MAIN_VERIFIED`
- 호환 locator: `TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING`
- 호환 next locator: `TASK8_RECEIPT_HERA_REVIEW_PR`
- 현재 continuation owner: `GR-SYNC-20260812-21-TASK8-HANDOFF-BCP`
- 현재 parent gate: `TASK8_PR_PREP_REVERIFY_PENDING`
- 현재 recovery state: `TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS`
- 현재 execution subgate: `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`
- primary: `feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b`
- secondary/reference: `task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f`
- `task8_product_commit: NONE`
- `task8_remote_product_branch: NOT_PRESENT`
- `task8_remote_product_pr: NONE`

`8c611f...`는 PR #131 HiGodot v3.1.4 authority reconciliation commit이며 Task8 제품 코드가 들어 있는 commit이 아니다. Task8 제품 구현은 이 HEAD 위의 uncommitted local delta로 보존됐다.

따라서 Task8 재개는 다음 순서를 따른다.

```text
preserved historical candidates
→ separate clean reconciliation worktree from exact fresh origin/main
→ fresh exact-project HiGodot readback
→ primary v2 recovery + secondary parity comparison
→ fresh GUT/Hera/diff/adversarial revalidation
→ stage/commit/push/PR
→ exact-head CI/review
→ merge/readback
```

GitHub text write로 `spell_use_screen.gd/.tscn`를 재구축하는 것은 persistent Godot authoring 대체 경로가 아니므로 금지한다.

## 금지

활성 3×3 Runtime, Universal Stock 임의 대체, 자동 Target·Commit, Best Route, 교수 예시 정답화, Commit 전 소비, 중복 소비, 실패 원인 은폐, 자동 테스트를 기기·사람·출시 PASS로 주장하는 행위를 금지한다.

## 출시·권리

- `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`
- `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`

## Authority Sync provenance

`GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC`는 이전 current-authority 교정의 병합·Notion readback provenance다. v4.8 전환은 `GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC` / PR #158이 추적한다. PR의 lifecycle과 open PR 집합은 이 정본에 고정하지 않고 live GitHub에서 읽는다.

현재 v4.8 바인딩은 `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`가 소유한다. v4.5 이하 바인딩은 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 보존한다.
