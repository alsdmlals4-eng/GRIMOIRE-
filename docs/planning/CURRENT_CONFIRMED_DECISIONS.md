# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_V4_5_R2_TASK7_CURRENT_STATE
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
current_planning_decision: GM-YEAR-ONE-CHAPTER-CURRICULUM-01
current_planning_sync: GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM
year_one_chapters: 7
year_one_term_distribution: 2_2_3
next_planning_axis: C_WORLD_CHARACTERS_THREE_YEAR_STORY
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
higodot_tool_state_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
higodot_tool_state_sheet_sync: SHEET_WRITE_READBACK_PASS
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_merged_main: a35baed94fe064e57529ffee7b8c48e14ac5e1bb
hera_sheet_sync: SHEET_WRITE_READBACK_PASS
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
visual_platform_merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
visual_platform_sheet_sync: SHEET_WRITE_READBACK_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

## GM-CONTRACT-V4-5-BINDING-01 — current contract

```yaml
decision_id: GM-CONTRACT-V4-5-BINDING-01
sync_id: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
approval: USER_APPROVED
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
base_source_snapshot_7ce3fb64_role: HISTORICAL_OBSERVATION_ONLY
base_current_main_315c66ee_role: LIVE_OBSERVATION_FOR_BINDING_EXECUTION_ONLY
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
```

v4.5 r2는 Base current canon을 복제하지 않는 thin adapter다. Base는 매 작업 `main`과 Registry/관련 owner를 다시 읽는다. Superpowers 같은 process framework는 `EXTERNAL_PROCESS_OVERLAY`이며 프로젝트/Base canon을 소유하지 않는다.

## GM-YEAR-ONE-CHAPTER-CURRICULUM-01 — current planning decision

```yaml
decision_id: GM-YEAR-ONE-CHAPTER-CURRICULUM-01
sync_id: GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM
approval: USER_APPROVED_ACTIVE
year_one_chapters: 7
term_distribution: 2_2_3
chapter_function_contract: FIXED_FUNCTIONS_VARIABLE_ORDER
separate_exam: FORBIDDEN_AS_REQUIRED_CONTENT
year_one_major_incident: 서리꽃 온실의 심장
year_one_ending: FIRST_INDEPENDENT_PRINCIPLE_AND_SMALL_WORLD_REWRITE
growth_economy_numbers: TEST_VALUE
next_planning_axis: C_WORLD_CHARACTERS_THREE_YEAR_STORY
```

1학년은 `정답 학습 → 복수 원리 비교 → 실패·부분성공 복기 → 실제 현장 책임 → 자기 원리 작성`으로 완결한다. 각 Chapter는 `발견·학습 / 선택·준비 / 통제 응용 / 실전·책임 / 복기·다음 질문`의 다섯 기능을 보존하되 장면 순서·시작 압력·형태·비중을 바꾼다. `서리꽃 온실의 심장`은 Internal Slice의 압축 검증판과 Year-One Chapter 6의 확장판을 구분한다. Chapter 7은 같은 전투 재시도가 아니라 마도서 증거를 바탕으로 첫 작은 세계 재작성을 수행한다.

현재 주문 제품 권위는 `FIVE_POINT_STAR / GM-SPELL-WORKFLOW-UI-V2-01`이며 historical 3×3 회로 언어를 신규 Chapter 권위로 사용하지 않는다. 수강 슬롯·자유일정 횟수·평가 가중치·재료량 등 수치는 후속 성장·경제 단계까지 `TEST_VALUE`다.

## GM-SPELL-WORKFLOW-UI-V2-01 — current implementation state

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

- Stage 2는 glyph preparation / circuit placement 중심이다.
- Stage 3는 explicit target selection, expected-result preview, confirmation, atomic use transaction을 소유한다.
- FIVE_POINT_STAR, Typed Glyph Stock, exactly-once 의미를 보존한다.

| Task | PR | Merge | 확정된 구현 의미 |
|---|---:|---|---|
| 3 | #104 | `3a79c8d1aab67813ef6d1c6662f1e460a711613c` | immutable PreparedSpell + exactly-once inventory |
| 4 | #105 | `97942d0be7404d52316dec0143041e2971c365f1` | Stage 2 atomic glyph preparation |
| 5 | #106 | `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` | Stage 3 atomic target/use transaction |
| 6 | #108 | `4a9daf0ed8de7bb39173a71e6ada9324d5a462b7` | glyph drawing screen |
| 7 | #110 | `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` | circuit placement screen |

```yaml
current_status: TASK7_MERGED_MAIN_VERIFIED
next_task: TASK8_SPELL_USE_SCREEN
next_task_role: UI_CONSUMER_OF_EXISTING_TASK5_STAGE3_AUTHORITY
new_product_decision_required_for_task8: false
```

## GM-STAR-CIRCUIT-MASTERY-BALANCE-01

```yaml
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
circuit_topology: FIVE_POINT_STAR
canon_status: SYNCED_TO_MAIN
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
human_validation: NOT_RUN
tuning_status: PLAYTEST_TUNING_REQUIRED
```

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

```yaml
higodot:
  release: v3.1.3
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
  post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
  reconciled_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
  sheet_sync: SHEET_WRITE_READBACK_PASS
  plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
  vendor_integrity: PASS_EXACT_TREE_IDENTITY
  direct_local_upgrade_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
  status: GUT_FORMALLY_ADOPTED
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
  merged_main: a35baed94fe064e57529ffee7b8c48e14ac5e1bb
  sheet_sync: SHEET_WRITE_READBACK_PASS
  persistent_source_mutation_authorized: false
```

## Historical v4.4 / Task2 provenance

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

```text
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
TASK2_MERGED_MAIN_VERIFIED
TASK2_HIGODOT_RECEIPT_READBACK_PASS
```

## Visual / platform preserved provenance

```yaml
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
visual_platform_merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
visual_platform_sheet_sync: SHEET_WRITE_READBACK_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
```

## 현재 증거 한계

```text
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

## Contract binding

현재 확정 계약은 v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`이다. v4.4 / `GM-CONTRACT-V4-4-BINDING-01`은 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 보존한다.
