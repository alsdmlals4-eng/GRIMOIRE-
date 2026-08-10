# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
circuit_topology: FIVE_POINT_STAR
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

`latest_product_main`은 제품 구현 계보의 최신 merge이며, 이 문서를 갱신하는 planning/canon-only commit과 구분한다. 실제 저장소 최신 `main`은 매 작업마다 다시 읽는다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 핵심 흐름은 계속 다음과 같다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재까지 병합된 구현:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen

따라서 **현재 다음 구현 단위는 `TASK8_SPELL_USE_SCREEN`**이다. Task 8은 이미 병합된 Task 5의 Stage 3 transaction authority를 소비하는 UI 단계이며, 새 target/use authority를 중복 구현하는 단계가 아니다.

승인된 후속 계획:

```text
Task 8 — Spell Use Screen / Target Selection / Expected Result
Task 9 — Root Coordinator / Responsive Rules / End-to-End Flow
Task 10 — Render Evidence / CI / Main Scene / Canon + Sheet Sync
```

## 도구 권위

- HiGodot/Godot AI `v3.1.3`: persistent `.gd/.tscn/.tres/.res/project.godot` 저작의 단일 권위.
- GUT `v9.7.1`: deterministic GDScript test authority.
- Hera `v1.0.0`: live QA/observability 전용. persistent source mutation 금지.
- direct/local tool-state commit `1337e267d29b00c039039e7197863e2f4f78957d`의 formal HiGodot receipt는 여전히 `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`이다.

## 역사 증거와 현재 권위 분리

Task 2/Task 3 진입 자료는 삭제하지 않고 역사 증거로 보존한다.

```text
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
```

Task 2 merged main은 `975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0`이다. 이 값과 과거 Task 3 handoff는 유효한 provenance지만 더 이상 next-task 권위가 아니다.

## 현재 완료로 주장하지 않는 항목

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

## 읽기 순서

1. `AGENTS.md`
2. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/DEVELOPMENT_GATES.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
7. `docs/planning/sync/GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE.md`
8. `docs/planning/CANON_SYNC_STATE.json`
9. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`

## 계약 바인딩 주의

첨부된 v4.5 thin-adapter 계약은 최신 입력이지만, 저장소 현재 바인딩은 여전히 v4.4 / `GM-CONTRACT-V4-4-BINDING-01`이다. v4.5 채택은 별도 사용자 기획 결정으로 처리하며 이 current-state sync에서 자동 승격하지 않는다.
