# GRIMOIRE 프로젝트 계약 v4.5 r2 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: '4.5'
revision: '2026-08-11-r2'
contract_status: ACTIVE_BASE_CURRENT_MAIN_THIN_ADAPTER_GODOT_DELIVERY_CONTRACT
binding_decision_id: GM-CONTRACT-V4-5-BINDING-01
binding_sync_id: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
approved_at: 2026-08-11
approval_source: 사용자 명시 요청 "v4.5 r2 로 깃허브 정본도 교체해" + "권장안대로 승인 [연속작업 진행해]"
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: main
project_local_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
canonical_local_checkout: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
godot_project_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
project_google_sheet: "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
```

## 1. 바인딩 의미

이 문서는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5_r2.md`를 GRIMOIRE에 적용하는 프로젝트별 current binding이다. v4.5 r2는 v4.4를 삭제하거나 과거 사실로 부정하지 않는다. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`와 v4.3 자료는 **HISTORICAL_SUPERSEDED_CURRENT_BINDING** 증거로 보존한다.

v4.5 r2는 Base current canon을 복제하지 않는 thin adapter다. Base 운영 절차·Skill·Template·Gate의 현재 의미는 매 작업 실제 Base `main`에서 다시 읽으며, 이 파일에 저장된 Base SHA는 영구 권위가 아니다.

```yaml
base_source_snapshot_from_v4_5_r2:
  sha: 7ce3fb64fa6303c5da6c7fc27c979f7233b761ac
  role: HISTORICAL_OBSERVATION_ONLY
  use_as_permanent_authority: false
base_current_main_observed_at_binding:
  sha: 315c66eea9614c284b9c11c4d522141065dfa4b0
  role: LIVE_OBSERVATION_FOR_THIS_BINDING_EXECUTION_ONLY
  use_as_permanent_authority: false
```

Base current `main`이 전진하면 다음 작업에서 다시 조회한다. 프로젝트의 Base release pin `9.4.3`은 이 바인딩으로 자동 변경하지 않는다.

## 2. v4.5 r2 source execution-scope 해석

원문에는 다음 guard가 있다.

```text
execution_scope_guard: INSTRUCTION_DOCUMENT_UPDATE_ONLY_UNLESS_EXPLICIT_FUTURE_EXECUTION_REQUEST
```

이번 세션에는 사용자의 명시적 repository canon 교체 요청과 `[연속작업 진행해]`가 존재한다. 따라서 현재 작업은 예외 조건을 충족한다.

```yaml
execution_scope_resolution: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
repository_canon_write: AUTHORIZED_WITHIN_APPROVED_V4_5_BINDING_SCOPE
google_sheet_sync: AUTHORIZED_WITH_SAME_DECISION_AND_SYNC_ID
product_behavior_change: NOT_AUTHORIZED_BY_THIS_BINDING
persistent_godot_product_authoring: NOT_PERFORMED_BY_THIS_BINDING
```

## 3. Base·Skill·외부 process 합성 계약

```yaml
current_base_recovery:
  base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
  repository_review: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
  skill_routing: BASE_REGISTRY_TRIGGER_MATCH_MINIMUM_OWNER_SET
  existing_solution_first: REQUIRED
thin_adapter:
  policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
  project_specific_values_only: true
external_process_overlay:
  authority: EXECUTION_PROCESS_ONLY
  role: EXTERNAL_PROCESS_OVERLAY
  examples:
    - Superpowers brainstorming
    - test-driven-development
    - systematic-debugging
    - verification-before-completion
  may_own_project_canon: false
  may_weaken_base_or_project_gates: false
```

외부 process framework는 실행 순서를 더 엄격하게 만들 수 있지만 프로젝트 Decision, Base canon, 승인 권한을 획득하지 않는다.

## 4. 승인·병합·연속작업 계약

```yaml
continuous_work: CONTINUOUS_WORK_ACTIVE_WHEN_EXPLICITLY_TRIGGERED
current_conversation_merge_policy: RECOMMENDED_AUTO_APPROVAL_WITHIN_ALREADY_APPROVED_SCOPE
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
merge_safety_gate:
  exact_head_required: true
  applicable_ci_success_required: true
  unresolved_review_threads: 0
  p0_p1_blockers: 0
  sheet_readback_when_decision_sync_applies: required
  merged_main_readback: required
```

승인 상속은 검증 우회가 아니다. exact HEAD, 적용 CI, review thread, 적대적 검토, Sheet/merged-main readback 조건을 그대로 유지한다.

## 5. Godot 저작·테스트·QA 권위

```yaml
higodot:
  release: v3.1.3
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  vendor_integrity: PASS_EXACT_TREE_IDENTITY
  tracked_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
  fresh_receipt_required_for_new_persistent_product_authoring: true
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
  status: GUT_FORMALLY_ADOPTED
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
  persistent_source_mutation: FORBIDDEN
```

v4.5 바인딩은 위 권위를 새로 승인하거나 확대하지 않고 현재 검증된 상태를 소비한다. GitHub 텍스트 API로 `.gd/.tscn/.tres/.res/project.godot` persistent 저작 권위를 우회하지 않는다.

## 6. 현재 제품 정본 보존

```yaml
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
next_product_task: TASK8_SPELL_USE_SCREEN
task8_authority_boundary: UI_CONSUMER_OF_EXISTING_TASK5_STAGE3_ATOMIC_TARGET_USE_TRANSACTION
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
```

이 바인딩은 제품 방향 변경이 아니다. `글자 그리기 → 회로 배치 → 주문 사용`, FIVE_POINT_STAR, Typed Glyph Stock, exactly-once 처리 의미를 유지한다.

## 7. 검증 증거 경계

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

v4.5 채택 자체는 위 상태를 PASS로 승격하지 않는다.

## 8. GitHub·Google Sheet 동기화

```yaml
decision_id: GM-CONTRACT-V4-5-BINDING-01
sync_id: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
required_sheet_surfaces:
  - 00_프로젝트_허브
  - 01_작업순서
  - 02_현재_확정결정
  - 04_누락_충돌_감사
  - 99_변경이력
sync_rule: SAME_DECISION_AND_SYNC_ID_BOTH_SURFACES
```

GitHub와 Sheet가 충돌하면 완료로 주장하지 않고 stale consumer를 교정한 뒤 readback한다.

## 9. 역사 바인딩

```yaml
superseded_current_binding:
  decision_id: GM-CONTRACT-V4-4-BINDING-01
  path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
  disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
  deletion: FORBIDDEN
```

v4.4 시기의 GUT formal adoption, HiGodot/Hera/supply-chain provenance와 Task2 역사 증거는 계속 유효하다. current contract만 v4.5 r2로 전진한다.
