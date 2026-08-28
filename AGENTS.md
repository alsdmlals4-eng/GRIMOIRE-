# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-26-r5.4-superset-final
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr_predecessor: 158
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
current_user_work_scope: SPELL_WORKFLOW_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE
product_implementation_authorized_by_current_user_work_scope: true
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_generation_state: FROSTBLOOM_W6_PLANNING_REFERENCE_LOCKED__CROSS_DISCIPLINE_REVIEW_PENDING
visual_candidate_generation_policy: USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY
visual_tone_overlay: GM-VISUAL-TONE-20260828-01
visual_tone_owner: docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
frostbloom_w6_key_decision_visual_owner: docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md
frostbloom_w6_key_decision_visual_age_read: YOUNG_ADULT_ACADEMY_RESEARCHER__USER_DIRECTED_REFINEMENT
frostbloom_w6_key_decision_visual_state: USER_APPROVED_PLANNING_REFERENCE_ONLY
frostbloom_w6_key_decision_visual_issue: 231
post_visual_lock_next_gate: CROSS_DISCIPLINE_PLANNING_REVIEW__BUNDLED_IMPLEMENTATION_CONTRACT_PENDING
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
product_decision_overlay: docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
product_decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
player_facing_spell_flow: GLYPH_TO_SPELL_TO_TARGET_TO_CAST
player_facing_ux_groups: SPELL_BUILD_AND_SPELL_CAST
next_product_task: TASK9_USER_VERTICAL_SLICE_VALIDATION
next_product_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_preservation_receipt: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
task9_product_commit: db038a4fd964ca037bfe97f6aee5d0cc7d0daf93
task9_product_pr: 192
task9_status: MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
base_project_pin: v9.4.3
base_live_readback: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_status: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

`authority_sync_local_observation` / `authority_sync_godot_observation`은 이전 authority sync 시점의 역사 관찰값이며 현재 executor 사실을 덮어쓰지 않는다. 현재 로컬 Task8 존재·보존 상태는 별도 `task8_recovery_state`가 소유한다.

## 현재 작업 원칙

1. 최신 사용자 지시 → 이 파일/`START_HERE.md` → `docs/ACTIVE_CONTEXT.md` + active v4.8 r5.4 binding → 실제 code/Scene/Resource/Test → 필요한 분야 정본 순으로 읽는다.
2. Base는 프로젝트 pin만 맹신하지 않고 새 실질 작업 단위마다 latest completed `main`과 관련 owner를 다시 읽는다.
3. Notion은 사람이 읽는 Project Home·Work·Core System·Visual/Asset/Flow의 기본 작업면이다.
4. Repository는 Markdown/JSON/game data/code/Scene/Resource/Test/runtime evidence 정본이다.
5. Google Sheets는 역사 migration source다. 신규 canon write를 하지 않고, 고유 자료 흡수 확인 전 삭제도 하지 않는다.
6. 모든 live open/draft/ready PR은 기본 READ_ONLY다. **PR #151은 이미 `MERGED_MAIN_VERIFIED`인 역사/current-main 구성요소**이며 더 이상 `DO_NOT_TOUCH` open-work가 아니다. 실제 PR lifecycle과 현재 open PR 집합은 항상 live GitHub에서 읽는다.
7. 실제 실행하지 않은 Human/Device/Performance/Full Slice 증거를 PASS로 승격하지 않는다.
8. Task8의 로컬 dirty delta는 사용자 PC read-only probe로 존재가 확인됐고, 두 후보는 외부 snapshot으로 보존됐다. 역사 worktree를 직접 sync/rebase/clean하지 않고 별도 clean reconciliation worktree에서 current main과 조정한다.
9. 보존 성공은 제품 호환성·HiGodot readiness·fresh tests를 증명하지 않는다. 다음 gate는 `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`다.
10. `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`는 이미 닫힌 **historical compatibility locator**로 보존한다. consumer 검색 가능성 때문에 지우지 않지만 current execution gate로 해석하지 않는다.
11. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`의 v4.5-era machine snapshot은 v4.8 migration 이후 **historical compatibility locator**로만 취급한다. 현재 authority는 이 파일 + `START_HERE.md` + `docs/ACTIVE_CONTEXT.md` + v4.8 r5.4 binding이다.
12. 2026-08-26 사용자는 `GM-SPELL-WORKFLOW-UI-V2-01`의 플레이어 노출을 **글자 → 주문 → 대상 → 시전**으로 단순화하는 방향을 승인했다. 같은 Decision ID의 revision owner는 `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`다.
13. 이번 승인 범위는 기획/Visual 정본 교정이다. Task8/Godot 제품 구현은 별도 명시 요청이 필요하다. Visual 후보는 2026-08-28 사용자 사전 승인에 따라 아래 후보 생성 규칙 안에서 생성할 수 있으나, final lock·runtime 사용·production batch 확장은 사용자 확정이 필요하다.
14. `TASK8_SPELL_USE_SCREEN`은 다음 제품 task locator이며 현재 범위의 구현 허가가 아니다.
15. Visual candidate production은 coverage·current canon·actual/planned consumer·rights boundary를 먼저 읽는다. 2026-08-28 사용자 사전 승인에 따라 후보는 이미지별 재승인 없이 `TEXT_BRIEF → GENERATE_CANDIDATE → QA_AND_RECORD`로 진행한다. 한 번에 하나의 후보 또는 그 후보의 명시적 보정만 생성한다. `PROJECT_ASSET_APPROVED`, `VISUAL_DIRECTION_LOCK`, runtime 사용, production batch 확장은 사용자 확정 전 자동 승격하지 않는다.

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

이 내부 코어는 유지한다. 플레이어가 화면에서 먼저 이해하는 표현만 다음처럼 단순화한다.

```text
글자 → 주문 → 대상 → 시전

주문 만들기
= 글자 선택·작성 + FIVE_POINT_STAR 회로 조합 + 완성 주문 이름 확인

주문 쓰기
= 게임 장면에서 대상 지정 + 필요한 최종 Preview + 명시 시전
```

`Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`는 내부 구현·데이터·테스트 용어로 유지하되 기본 플레이어 UI의 주 용어로 먼저 가르치지 않는다.

## Godot 현실

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/spell_workflow/spell_workflow_product_root.tscn`
- Main Scene 역할: `DEVELOPMENT_PRODUCT_ROOT_ENTRY`
- 권장 엔진 계열: Godot `4.7.1`
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

r5.4에서는 project-specific `CODEX_HOME`, 별도 전용 Godot binary, 8001/9501 전용 포트를 current project invariant로 사용하지 않는다. 실제 local/session 상태는 fresh executor readback으로만 증명한다.

## Spell Workflow 현재 경계

- Task9 Product Root: `db038a4fd964ca037bfe97f6aee5d0cc7d0daf93` / PR #192 / `MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY`
- 현재 다음 게이트: `TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING`
- current player-facing revision: `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`
- `GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE`
- `TASK7_MERGED_MAIN_VERIFIED`
- 호환 locator: `TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING`
- 호환 next locator: `TASK8_RECEIPT_HERA_REVIEW_PR`
- historical continuation owner: `GR-SYNC-20260812-21-TASK8-HANDOFF-BCP`
- historical parent gate: `TASK8_PR_PREP_REVERIFY_PENDING`
- historical product task locator: `TASK8_SPELL_USE_SCREEN`
- 닫힌 predecessor gate: `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`
- historical recovery state: `TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS`
- historical execution subgate: `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`
- primary: `feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b`
- secondary/reference: `task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f`
- `task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733`
- `task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827`
- `task8_remote_product_pr: 190`

Task mapping:

```text
Task6 Glyph Drawing → 주문 만들기 / 글자
Task7 Circuit Placement → 주문 만들기 / 주문 회로 + 완성 주문 이름
Task8 Spell Use → 주문 쓰기 / 대상 + 시전
```

`8c611f...`는 PR #131 HiGodot v3.1.4 authority reconciliation commit이며 Task8 제품 코드가 들어 있는 commit이 아니다. Task8 제품 구현은 이 HEAD 위의 uncommitted local delta로 보존됐다.

따라서 아래 Task8 순서는 PR #190 병합 전 보존·조정 절차의 historical provenance다.

```text
preserved historical candidates
→ separate clean reconciliation worktree from exact fresh origin/main
→ fresh exact-project HiGodot readback
→ primary v2 recovery + secondary parity comparison
→ player-facing overlay를 기존 Stage3 authority에 thin mapping
→ fresh GUT/Hera/diff/adversarial revalidation
→ stage/commit/push/PR
→ exact-head CI/review
→ merge/readback
```

GitHub text write로 `spell_use_screen.gd/.tscn`를 재구축하는 것은 persistent Godot authoring 대체 경로가 아니므로 금지한다.

## 현재 Visual 경계

```yaml
art_style_lock: ART-STYLE-01
art_style_name: Soft Storybook Cel 2D Hybrid
visual_overlay: GM-VISUAL-DIRECTION-20260825-01
visual_tone_overlay: GM-VISUAL-TONE-20260828-01
logo: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
representative_screens: GM-REPRESENTATIVE-SCREENS-20260825-01
coverage_owner: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
spell_visual_player_terms: GLYPH_COMPLETE_SPELL_NAME_TARGET_CAST
image_generation_state: FROSTBLOOM_W6_PLANNING_REFERENCE_LOCKED__CROSS_DISCIPLINE_REVIEW_PENDING
visual_candidate_generation_policy: USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY
```

승인된 Dialogue 구성은 유지한다. Battle/Spell 시안의 분위기·구도는 참고하되 시스템 UI는 current canon에 맞게 재작업한다. 이전 3D-like movement 방향은 거부 상태이며, 이동은 단순 2D 장면 전환/배경/지도 카드 재사용 방향을 따른다.

Spell Visual은 다음을 추가로 따른다.

- 글자는 세로 패찰·부적·수집 카드보다 **직접 쓰인 문자**로 보여야 한다.
- 획과 필기감, 빛나는 잉크/마력 흔적을 우선한다.
- FIVE_POINT_STAR에는 패찰을 꽂기보다 글자를 직접 놓거나 쓰는 느낌을 우선한다.
- `PreparedSpell`의 기본 플레이어 결과 라벨은 `준비 주문`보다 **완성 주문 / 완성 주문 이름**을 우선한다.
- 완성 주문 선택 뒤 대상 지정은 가능하면 게임 장면에서 직접 수행하고 필요한 Preview 뒤 `시전`한다.
- 실제 주문 이름 생성 문법/로컬라이징 알고리즘은 아직 별도 설계 대상이다.

## 금지

활성 3×3 Runtime, Universal Stock 임의 대체, 자동 Target·Commit, Best Route, 교수 예시 정답화, Commit 전 소비, 중복 소비, 실패 원인 은폐, 자동 테스트를 기기·사람·출시 PASS로 주장하는 행위를 금지한다.

추가로 현재 Visual 범위에서는 새 3D exploration asset family, Slice 다중 enemy-wave 대량 제작, baked functional text/수치, 사용자 승인 없는 이미지 연쇄 생성을 금지한다.

## 출시·권리

- `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`
- `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`

## Authority Sync provenance

`GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC`와 `GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC`는 이전 current-authority 교정의 병합 provenance다. 안정된 predecessor PR은 #158이며 current open PR 상태 자체는 live GitHub가 소유한다.

r5.4 Visual Coverage는 `GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE`가 추적한다. 이번 플레이어 노출 간략화는 `GR-SYNC-20260826-37-SPELL-FLOW-PLAYER-FACING`가 추적한다. unrelated PR #166은 read-only다.

현재 v4.8 바인딩은 `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`가 소유한다. v4.5 이하 바인딩은 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 보존한다.
