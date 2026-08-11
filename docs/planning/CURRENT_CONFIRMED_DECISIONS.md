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
prework_research_decision: GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01
prework_research_sync: GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH
prework_research_gate: REQUIRED_BEFORE_NEW_SUBSTANTIVE_WORK_UNIT
prework_research_same_work_unit_receipt_reuse: ALLOWED_IF_SCOPE_AND_KEY_ASSUMPTIONS_UNCHANGED
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
current_planning_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
current_planning_sync: GR-SYNC-20260811-12-FROSTBLOOM-POSTMERGE-CURRENT-CONSUMER-CLEANUP
current_planning_design_sync: GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE
current_planning_spec_review_sync: GR-SYNC-20260811-11-FROSTBLOOM-SPEC-REVIEW-PLAN-READY
year_one_chapters: 7
year_one_term_distribution: 2_2_3
world_model: PRECEDENT_CONTEXT_REVISION
year_one_schools: FLOW_HEAT_PROTECT
year_one_free_schedule_windows: 6
year_one_focus_model: TERM2_3_PICK_2_OF_3
year_one_portfolio_weights: FOUR_AXES_25_EACH
year_one_crafting_scope: MATERIAL6_RECIPE8_INPUT3_CAP12
year_one_practicum_repeat_material_reward: 100_50_25_0
frostbloom_slice_model: SINGLE_INCIDENT_SPIRAL
frostbloom_slice_time_contract: TARGET46_REWORK53_HARD60
frostbloom_writing_contract: SUCCESS7_RECOVERY_CAP10
frostbloom_investigation_contract: PICK_2_OF_4
frostbloom_result_dimensions: FACILITY_LIFE_SPIRIT_RELATIONSHIP_DISCOVERY
frostbloom_implementation_plan: docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md
frostbloom_runtime_implementation: BLOCKED_BY_HIGODOT_EXECUTOR_AND_TASK8_DEPENDENCY
next_planning_axis: D_RUNTIME_IMPLEMENTATION_BLOCKED_BY_TASK8_HIGODOT
current_process_axis: PREWORK_BENCHMARK_INDUSTRY_RESEARCH_ACTIVE
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

## GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01 — current process gate

```yaml
decision_id: GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01
sync_id: GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH
approval: USER_APPROVED_ACTIVE
canon_document: docs/planning/PREWORK_BENCHMARK_INDUSTRY_RESEARCH_01_APPROVAL_2026-08-11.md
scope: PROJECT_PROCESS_ONLY
trigger: BEFORE_EVERY_NEW_SUBSTANTIVE_WORK_UNIT
required_steps:
  - FRESH_BASE_PROJECT_SHEET
  - DEFINE_WORK_QUESTION
  - BENCHMARK_AND_INDUSTRY_RESEARCH
  - SOURCE_ROLE_FRESHNESS_APPLICABILITY
  - EXISTING_SOLUTION_FIRST
  - DISPOSITION
  - ADVERSARIAL_REVIEW
  - WORK
  - EXACT_HEAD_AND_READBACK
required_dispositions:
  - ADOPT
  - ADAPT
  - TEST
  - AVOID
  - IGNORE
  - REFERENCE_ONLY
same_work_unit_receipt_reuse: ALLOWED_ONLY_IF_SCOPE_PRODUCT_DECISION_KEY_ASSUMPTIONS_UNCHANGED
competitor_expression_copying: FORBIDDEN
product_decision_mutation: NONE
persistent_godot_source_mutation: NONE
```

이 Gate는 Base current Source Context 흐름을 프로젝트 작업 시작 조건으로 연결하는 thin adapter다. 비교군의 콘텐츠를 복제하지 않고 패턴·제약·실패모드·검증방법만 사용한다. 범위나 핵심 가정이 바뀌면 같은 대화 안에서도 새 work unit으로 보고 fresh research를 다시 수행한다.

## GM-YEAR-ONE-CHAPTER-CURRICULUM-01 — approved Year-One planning decision

```yaml
decision_id: GM-YEAR-ONE-CHAPTER-CURRICULUM-01
sync_id: GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM
supplemental_sync: GR-SYNC-20260811-06-YEAR-ONE-NO-EXAM-CONSUMER-CLEANUP
approval: USER_APPROVED_ACTIVE
year_one_chapters: 7
term_distribution: 2_2_3
chapter_function_contract: FIXED_FUNCTIONS_VARIABLE_ORDER
separate_exam: FORBIDDEN_AS_REQUIRED_CONTENT
year_one_major_incident: 서리꽃 온실의 심장
year_one_ending: FIRST_INDEPENDENT_PRINCIPLE_AND_SMALL_WORLD_REWRITE
growth_economy_numbers: REFINED_BY_GM_YEAR_ONE_GROWTH_ECONOMY_TEST_VALUES_01
world_detail_successor: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01
```

1학년은 `정답 학습 → 복수 원리 비교 → 실패·부분성공 복기 → 실제 현장 책임 → 자기 원리 작성`으로 완결한다. 각 Chapter는 `발견·학습 / 선택·준비 / 통제 응용 / 실전·책임 / 복기·다음 질문`의 다섯 기능을 보존하되 장면 순서·시작 압력·형태·비중을 바꾼다. `서리꽃 온실의 심장`은 Internal Slice의 압축 검증판과 Year-One Chapter 6의 확장판을 구분한다. Chapter 7은 같은 전투 재시도가 아니라 마도서 증거를 바탕으로 첫 작은 세계 재작성을 수행한다.

현재 주문 제품 권위는 `FIVE_POINT_STAR / GM-SPELL-WORKFLOW-UI-V2-01`이며 historical 3×3 회로 언어를 신규 Chapter 권위로 사용하지 않는다.

## GM-WORLD-CHARACTER-THREE-YEAR-STORY-01 — approved world/story decision

```yaml
decision_id: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01
sync_id: GR-SYNC-20260811-07-WORLD-CHARACTER-THREE-YEAR-STORY
supplemental_sync: GR-SYNC-20260811-08-WORLD-NAME-CONSUMER-CLEANUP
approval: USER_APPROVED_ACTIVE
canon_document: docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md
world_layers:
  - 원문
  - 정식
  - 문맥
  - 개정
year_one_schools:
  - 유동학_FLOW
  - 변성학_HEAT
  - 결계학_PROTECT
common_grammar: FOCUS_DISPERSE
core_characters:
  - 플레이어_이름고정없음
  - 마렌_지도교수
  - 카시안_핵심동급생
  - 네아_메인정령동반자
  - 에일린_현장복원마법사
  - 모트_기록원
factions:
  - 마도학원_정식위원회
  - 현장복원단
  - 정령협약망
  - 개방서고_연합
year_questions:
  year_1: 정답은_왜_맞는가
  year_2: 누가_세계를_바꿀_권리가_있는가
  year_3: 무엇을_바꾸지_않을_책임이_있는가
growth_economy_successor: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01
```

학교의 정식은 절대진리가 아니라 검증된 안전 선례다. 플레이어는 장소·역사·정령·사람이 만든 문맥을 읽고 충분한 근거와 책임 아래 제한된 개정을 수행한다. `원문`은 학생이 직접 편집하는 숨은 소스코드가 아니며 `개정`은 실패 기록이나 타인의 선택을 삭제하는 리셋 도구가 아니다.

1학년의 세 계열은 `유동학(FLOW) / 변성학(HEAT) / 결계학(PROTECT)`이며 `FOCUS / DISPERSE`는 공통 조율 문법이다. 계열은 정치·윤리 성향과 1:1로 대응하지 않는다. 세력별 별도 메인 캠페인을 만들지 않고 공유 사건을 서로 다른 보호 대상·비용·증거의 관점으로 재해석한다.

## GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01 — approved planning decision

```yaml
decision_id: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01
sync_id: GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES
approval: USER_APPROVED_TEST_VALUES_ACTIVE
canon_document: docs/planning/YEAR_ONE_GROWTH_ECONOMY_TEST_VALUES_01_APPROVAL_2026-08-11.md
test_value_not_final_balance: true
free_schedule:
  year_one_total_windows: 6
  distribution: CH1_TO_CH6_ONE_EACH_CH7_NONE
  one_center_action_per_window: true
focus:
  term_1: COMMON_FOUNDATION_NO_CHOICE
  term_2: PICK_2_DISTINCT_OF_FLOW_HEAT_PROTECT
  term_3: PICK_2_DISTINCT_OF_FLOW_HEAT_PROTECT_FREE_RESELECT
specialization_readiness:
  valid_school_evidence_min: 3
  distinct_context_categories_min: 2
  responsibility_or_reflection_min: 1
  bridge_assignment_if_short: 1
portfolio:
  principle_understanding: 25
  context_application: 25
  responsibility_recovery: 25
  reflection_explanation: 25
  mid_term_numbers: HIDDEN
hidden_responsibility_deduction:
  ordinary_failure_alone: NONE
  per_incident_cap: -2
  per_semester_cap: -6
grade_bands_internal_test_value:
  A: 85_TO_100
  B: 70_TO_84
  C: 55_TO_69
  D: BELOW_55
crafting:
  material_groups: 6
  core_recipes: 8
  max_inputs: 3
  inventory_cap_per_group: 12
  mandatory_story_material_guarantee: CEIL_1_5_X_REQUIRED
practicum_repeat_material_reward_percent: 100_50_25_0
protected_owners:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
  - GM-SPELL-WORKFLOW-UI-V2-01
successor: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
```

B의 핵심은 `6 / 2-of-3 / 3·2·1 / 4×25 / 6·8·3·12 / 100·50·25·0`이다. 일반 실패·부분성공 자체를 숨은 숫자 감점으로 이중 처벌하지 않고, 감점은 이미 확인한 안전 근거를 의도적으로 무시하거나 기록을 위조하는 등 회피 가능한 책임 위반에만 사용한다. 이는 상위 Failure 결정의 `작은 숨김 감점`을 폐기하지 않고 발동 조건을 좁힌 child refinement다.

필수 제작물의 관련 재료 요구량이 `M`이면 피할 수 없는 메인 경로에서 최소 `ceil(1.5×M)`를 보장한다. 선택형 현장실습 반복은 필수 스토리 파밍이 될 수 없다. 동일 실습의 재료 보상은 첫 고유 완료/새 조건·다른 해법/첫 동일 반복/추가 동일 반복에 대해 `100/50/25/0`을 사용하고, 영구 평가·접근·핵심 성장자원은 동일 반복으로 무한 축적되지 않는다.

위 수치는 인간 플레이테스트 전에는 `BALANCED`, `FINAL`, `FUN_VERIFIED`로 승격하지 않는다.

## GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01 — current planning decision

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
design_sync: GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE
spec_review_plan_sync: GR-SYNC-20260811-11-FROSTBLOOM-SPEC-REVIEW-PLAN-READY
current_consumer_sync: GR-SYNC-20260811-12-FROSTBLOOM-POSTMERGE-CURRENT-CONSUMER-CLEANUP
approval: USER_APPROVED_SPEC_IMPLEMENTATION_PLAN_READY
canon_document: docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md
spec_review_document: docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_USER_SPEC_REVIEW_2026-08-11.md
benchmark_document: docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md
implementation_plan: docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md
slice_model: SINGLE_INCIDENT_SPIRAL
time_contract: TARGET_46_REWORK_53_HARD_60
writing_contract: SUCCESS_7_RECOVERY_CAP_10
free_schedule_windows_actual: 1
investigation: PICK_2_OF_4
major_five_point_star_commits_min: 2
first_solution: MUST_IMPROVE_REAL_STATE_AND_REMAIN_PRESERVED
reveal: OLD_REVISION_ADDS_NEW_CONTEXT_NOT_FAKE_CHOICE
encounter: SINGLE_STRONG_SPIRIT_OR_PRESSURE_NO_MOB_WAVES
result_dimensions:
  - FACILITY
  - LIFE
  - SPIRIT
  - RELATIONSHIP
  - DISCOVERY
anchors:
  - A1
  - A2
  - A3
  - A4
festival: PREVIEW_ONLY
separate_exam: FORBIDDEN_AS_REQUIRED_CONTENT
circuit_authority: FIVE_POINT_STAR
historical_3x3: PROVENANCE_ONLY
runtime_implementation: BLOCKED_BY_HIGODOT_EXECUTOR_AND_TASK8_DEPENDENCY
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

D는 학교·제작·자유일정·조사·주문·결과를 체크리스트로 나열하지 않고 하나의 서리꽃 온실 사건에 인과적으로 묶는다. 첫 주요 해결은 실제로 무언가를 개선하며, 이후 과거 개정 흔적이 드러나도 그 개선을 삭제하거나 “처음부터 틀렸다”로 바꾸지 않는다. `시설복구 / 생명구조 / 정령교섭 / 봉쇄 / 전투제압`은 정답 루트 버튼이 아니라 Target·FIVE_POINT_STAR 회로·문맥·보호가치·결과에서 파생되는 사후 의미다.

구현계획은 기존 `SpellWorkflowCoordinator → AtomicSpellUseService → AtomicResultLedger → SaveRepository` 권위를 재사용한다. Task8 Spell Use Screen은 별도 제품 구현 권위로 유지되며 D가 우회 구현하지 않는다. persistent Godot 실행은 HiGodot executor와 Task8/Task9 의존성이 풀릴 때까지 차단된다.

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
