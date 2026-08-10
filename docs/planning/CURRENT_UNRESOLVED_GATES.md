# GRIMOIRE 현재 미확정·차단 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_version: "4.4"
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision_id: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
gut_implementation_status: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

## 닫힌 Spell Workflow implementation gates

Task 2의 `TASK2_MERGED_MAIN_VERIFIED`는 역사적으로 닫힌 gate이며, Tasks 3–7도 더 이상 unresolved가 아니다. 이 표의 Task 2 기록은 provenance이지 current next-task 권위가 아니다.

```yaml
task2:
  merge: 975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
  status: TASK2_MERGED_MAIN_VERIFIED
task3:
  pr: 104
  merge: 3a79c8d1aab67813ef6d1c6662f1e460a711613c
  status: MERGED_MAIN_VERIFIED
task4:
  pr: 105
  merge: 97942d0be7404d52316dec0143041e2971c365f1
  status: MERGED_MAIN_VERIFIED
task5:
  pr: 106
  merge: 275ba48eb9c07ce24d4b17b2c57de66c98923e1a
  status: MERGED_MAIN_VERIFIED
task6:
  pr: 108
  merge: 4a9daf0ed8de7bb39173a71e6ada9324d5a462b7
  status: MERGED_MAIN_VERIFIED
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
```

Task 3의 과거 `TASK3_TDD_RED`와 `HIGODOT_PERSISTENT_TASK3_AUTHORING_WITH_FRESH_RECEIPT_GATE`는 진입/검증 provenance로 보존하지만 현재 허용 next action이 아니다.

## 현재 next implementation gate

```yaml
next_task: TASK8_SPELL_USE_SCREEN
scope:
  - explicit target selection UI
  - final expected-result preview
  - user confirmation boundary
  - consume existing Task 5 Stage 3 transaction authority
must_not:
  - duplicate target/use authority
  - auto-select target as final behavior
  - spend Mana before explicit confirmation
  - upgrade human/device/performance evidence without new runs
persistent_godot_authoring: HIGODOT_ONLY_WITH_FRESH_RECEIPT
formal_test_authority: GUT_9_7_1
live_qa: HERA_OBSERVABILITY_ONLY_SOURCE_DELTA_NONE
```

## Task 9 precondition findings

Task 9 responsive/E2E 구현 전에 아래 두 항목을 닫는다.

1. **APPROVED_DEVICE_MATRIX_PROPAGATION** — Sheet에 이미 승인된 `16:9`, `18:9`, `19.5:9`, `20:9`, cutout/safe-area, foldable/tablet 분류를 Task 9 acceptance에 명시한다.
2. **GODOT_STRETCH_ASPECT_EXPLICIT_VERIFICATION** — 현재 1280×720 + `canvas_items` reference surface와 함께 multiple-aspect 처리 설정을 실제 project setting에서 확인한다. engine default를 검증 증거로 간주하지 않는다.

이 둘은 새 제품 방향을 만드는 Gate가 아니라 기존 승인 요구의 consumer propagation / technical verification이다.

## 구현 이후 acceptance 대기

| ID | 상태 |
|---|---|
| `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9` | Tasks 2–7 merged; Tasks 8–9 + Task 10 evidence remaining |
| `WINDOWS_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_DEVICE_NOT_RUN` | `NOT_CLAIMED` |
| `HUMAN_NOT_RUN` | `NOT_CLAIMED` |
| `PERFORMANCE_NOT_RUN` | `NOT_CLAIMED` |
| `FULL_VERTICAL_SLICE_NOT_RUN` | `NOT_CLAIMED` |

`THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`은 기존 gate ID를 추적성 때문에 유지한다. 현재 사실상 남은 구현은 Tasks 8–9이며, Task 10 evidence 이후 acceptance한다.

## 현재 provenance / delivery limits

| ID | 상태 |
|---|---|
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_NO_LOCAL_ACCESS` |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_FINAL_VISUAL_AUDIO_COMPLETION` |
| `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT` | `PROVENANCE_LIMIT` |
| `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` |
| `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` |

## Contract decision required, independent of Task 8

첨부 v4.5 thin-adapter 계약은 현재 v4.4보다 최신 입력이지만 저장소에 바인딩되지 않았다.

```yaml
v4_5_binding: USER_DECISION_REQUIRED
current_binding: GM-CONTRACT-V4-4-BINDING-01
silent_rebinding: FORBIDDEN
task8_dependency_on_v4_5_approval: false
```

즉 Task 8 factual next-state는 current v4.4 아래에서도 유효하다. v4.5 채택은 별도 Grill Me Decision으로 닫는다.

## 현재 허용

```yaml
allowed_next_actions:
  - TASK8_TDD_RED
  - HIGODOT_PERSISTENT_TASK8_AUTHORING_WITH_FRESH_RECEIPT_GATE
  - GUT_DETERMINISTIC_TASK8_TESTING
  - HERA_TASK8_ACCEPTANCE_QA_OBSERVABILITY_ONLY
  - PROPAGATE_APPROVED_DEVICE_MATRIX_INTO_TASK9_ACCEPTANCE
  - VERIFY_GODOT_MULTIPLE_ASPECT_POLICY_BEFORE_TASK9
forbidden_next_actions:
  - PERSISTENT_GODOT_PRODUCT_AUTHORING_OUTSIDE_HIGODOT
  - LET_HERA_PERSISTENTLY_MUTATE_SOURCE
  - CLAIM_TASK8_IMPLEMENTED_BEFORE_FRESH_AUTHORING_AND_GREEN_VALIDATION
  - CLAIM_THREE_SCREEN_RUNTIME_PASS_BEFORE_TASKS8_9_AND_TASK10_EVIDENCE
  - CLAIM_WINDOWS_OR_ANDROID_EXPORT_OR_DEVICE_PASS
  - CLAIM_HUMAN_OR_PLAYER_EXPERIENCE_PASS
  - CLAIM_VISUAL_AUDIO_COMPLETE
  - CLAIM_LOCAL_SYNC_OR_PROJECT_PLAY_COMPLETE
```
