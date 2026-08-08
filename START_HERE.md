# GRIMOIRE 시작 지점

## 현재 상태

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_pr: 87
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
gut_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_vendor_integrity_evidence: docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_evidence: docs/validation/HERA_V1_0_0_EXACT_PAIR.json
gut_status: GUT_FORMALLY_ADOPTED
gut_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
gut_version: 9.7.1
gut_formal_adoption_pr: 85
gut_formal_adoption_exact_head: fc178bdc7a3e12faf4ae7ae78fd1f92dd2735849
gut_formal_adoption_run: 31227323973
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
base_release_pin: 9.4.3
base_binding_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
base_latest_main_observed_pr91: eee98a930219065e30b4d7d14d99d5ac7db44c60
base_pin_update: NOT_APPROVED_NOT_PERFORMED
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

`project_main_authority`는 저장된 SHA가 아니라 GitHub 기본 브랜치 `main`의 live readback이다. `gut_formal_adoption_main`과 `post_merge_canon_sync_merge`는 각각 PR #85와 PR #87의 역사적 merged-main 증거이며 현재 main을 뜻하지 않는다.

PR #85의 GUT 9.7.1 CLI/headless deterministic test authority는 정식 채택되었다. `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`은 critical-runtime equivalence만 승인하며 full vendor-tree identity를 의미하지 않는다. GUT Editor Plugin은 계속 비활성이다.

`GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`에 따라 active workflow의 official `actions/*` ref는 repo-wide full commit SHA Gate로 보호되며 `REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS` 상태다.

HiGodot v3.1.2는 official tag commit `678b16a6...`의 `plugin/addons/godot_ai`와 프로젝트 `addons/godot_ai`가 동일 Git tree `a7d1e2fe...`를 가리켜 `PASS_EXACT_TREE_IDENTITY`다. 과거 mismatch는 `plugin/` wrapper tree와 wrapper 아래 plugin subtree를 비교한 scope 오류였으며 `GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY`가 교정한다.

Hera v1.0.0은 upstream/project addon tree `6cb87ac8...` exact identity와 official Linux CLI SHA/version을 고정했다. Hosted Godot 4.7.1 ephemeral canary run `31254032278`에서 `127.0.0.1` bind, wrong-token rejection, correct-token `status`, repository source-delta zero가 PASS했다. Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`이며 persistent GRIMOIRE source mutation 권위가 아니다.

Base `main`은 PR #91 진입 시 `eee98a930...`로 전진해 있었지만 현재 Base contract test는 exact pair, localhost-only, shared token, persistent write 금지, acceptance source delta `NONE`을 계속 요구한다. GRIMOIRE의 Base release pin `9.4.3`은 갱신 승인되지 않았으므로 그대로 유지한다.

## 제품 보존 정본

- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`: `FIVE_POINT_STAR`, Typed Glyph Stock, Exactly-once 처리 유지.
- `GM-SPELL-WORKFLOW-UI-V2-01`: `글자 그리기 → 회로 배치 → 주문 사용` 유지.
- PR #82 Task 1 GREEN은 보존하지만 Task 2는 아직 시작하지 않는다.

## 현재 broader blockers

```text
WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

HiGodot은 persistent Godot authoring의 단일 권위다. vendor subtree identity는 PASS지만 persistent product authoring에서는 기존 fail-closed HiGodot authoring receipt Gate를 계속 적용한다. Hera acceptance QA는 허용되지만 Task 2 전체 진입은 remaining visual/platform Gate 때문에 여전히 금지다.

## 시각·오디오

```yaml
visual_direction_approval: COMPLETE
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
audio_vault_path: "C:/Users/user/Documents/GitHub/shered audio vault"
audio_vault_status: BLOCKED_UNVERIFIED
audio_rights: BLOCKED_UNVERIFIED
```

## Godot

```text
project.godot
└─ Main Scene: res://src/ui/star_circuit_harness.tscn
```

Hosted Godot 4.7.1/GUT/Hera 검증은 PASS했지만 사용자 로컬 `Fetch/Pull` 및 clean merged-main `Run Project`는 이 환경에서 실행하지 못했다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`
3. `docs/planning/ENTRY_STATE_RECONCILIATION_V4_4.md`
4. `docs/ACTIVE_CONTEXT.md`
5. `docs/DEVELOPMENT_GATES.md`
6. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
8. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
9. `docs/testing/GUT_9_7_1_ADOPTION_SPEC.md`
10. `docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json`
11. `docs/validation/HERA_V1_0_0_EXACT_PAIR.json`

다음 제품 구현은 위 broader blocker 중 해당 작업 package가 실제 소비하는 선행 Gate를 먼저 닫은 뒤 진행한다.
