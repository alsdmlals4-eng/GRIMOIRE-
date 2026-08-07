# GRIMOIRE 개발·기획 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
current_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
gut_formal_adoption: GUT_FORMALLY_ADOPTED
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
implementation_entry: BLOCKED_BY_BROADER_PROJECT_GATES
```

## Gate 0 — v4.4 Application Binding

`PASS_MERGED_MAIN`

- 바인딩: `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`
- Base current main observed: `fa69a77a14f923a756064f6ae151d34cadb374f7`; project pin은 9.4.3 그대로다.
- Decision/미확정/이미지 Sheet readback을 작업 진입 때마다 다시 계산한다.

## 보존 Runtime Gate

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
```

v4.4 적용과 GUT formal adoption은 기존 Five-point Star 핵심 runtime 결정을 삭제하거나 약화하지 않는다.

## Gate 15.1 — HiGodot single authoring authority

`BLOCKING_BEFORE_NEXT_PERSISTENT_GODOT_AUTHORING`

```yaml
release: v3.1.2
pinned_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
vendor_integrity: HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2
authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
```

PR #85 자체는 protected product diff 0으로 `HiGodot Authoring Receipt Gate`를 통과했다. 이후 제품 Scene/Resource/script/project settings 저작은 HiGodot authority 경계와 vendor audit를 먼저 닫는다.

## Gate 15.2–15.3 — GUT 9.7.1

`GUT_FORMALLY_ADOPTED`

```yaml
spec_pr: 84
implementation_pr: 85
merged_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
release: v9.7.1
pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
full_vendor_tree_identity: false
critical_runtime_equivalence_decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
editor_plugin: DISABLED
windows_godot_gut: PASS
ubuntu_godot_gut: PASS
junit_discovery_exit: PASS
product_mutation_hash: PASS
legacy_required_contract_parity: PASS
```

## Gate 15.4 — Hera

`HERA_CLI_ADDON_PAIR_UNVERIFIED`

Hera는 LIVE_QA_AND_OBSERVABILITY_ONLY다. exact CLI/addon pair·localhost/token·source-delta-none canary 검증 전 acceptance QA 권위로 사용하지 않는다.

## Gate 15.5 — PR #82 Task 2 entry

```yaml
pr: 82
task1: GREEN
task2: NOT_STARTED_ON_BRANCH
spell_workflow_task2_authorized: false
```

GUT formal adoption blocker는 닫혔다. 다음 package가 실제 소비하는 HiGodot/Hera/visual/platform 선행 Gate가 닫히기 전에는 Task 2를 시작하지 않는다.

## Gate 16 — Windows·Android shared core

`WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED`

Hosted Windows Godot/GUT 검증은 GUT formal-adoption 증거이며 Android export/device validation을 대신하지 않는다.

## Gate 17 — Visual·Audio

```text
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN
```

## Gate 18 — CI supply chain

`CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE`

PR #85에서 수정한 GUT/authority workflows는 verified full SHA로 pin했다. 다른 기존 workflow의 mutable major tags는 별도 hardening 필요 상태로 남긴다.

## Delivery Gate

```text
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

이 환경에서는 사용자 Windows checkout에 직접 접근할 수 없으므로 merged local main과 실제 Project Play 완료를 주장하지 않는다.
