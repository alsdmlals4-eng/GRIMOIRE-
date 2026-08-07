# GRIMOIRE 현재 미확정·차단 게이트

```yaml
contract_version: "4.4"
contract_binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: FORMAL_ADOPTION_SCOPE_CLEAR_BROADER_PROJECT_BLOCKERS_REMAIN
formal_adoption_scope: READY_IF_CURRENT_HEAD_CHECKS_PASS
implementation_entry: PR85_FINAL_EXACT_HEAD_REVALIDATION
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
gut_adoption_spec_pr: 84
gut_implementation_pr: 85
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
sheet_v4_4_sync: READBACK_PASS
base_current_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
project_main_observed: 563c2b08cb96354fdd7209a32d7fd8ec26bb334c
validated_head_before_reconciliation: d20247ac981fb5a934241e13918472a41a93edb6
validated_gut_run_before_reconciliation: 31226874097
```

## GUT formal-adoption 범위에서 해소된 항목

아래 항목은 PR #85의 직전 exact head `d20247ac981fb5a934241e13918472a41a93edb6`에서 객관 증거가 만들어졌다. 이 문서 변경으로 HEAD가 다시 바뀌므로 최종 병합 증거는 새 exact head에서 재실행한다.

| 항목 | 현재 판정 | 근거 |
|---|---|---|
| GUT adoption spec | `MERGED_MAIN_VERIFIED` | PR #84 merged main readback |
| GUT source/version/license | `PASS` | v9.7.1, commit `aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605`, MIT |
| GUT vendor equivalence | `APPROVED_LIMITED_EQUIVALENCE` | `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`; full tree identity는 주장하지 않음 |
| Godot 4.7.1 runtime compatibility | `PASS_PREVIOUS_EXACT_HEAD` | hosted Windows/Ubuntu full lanes, official `4.7.1.stable.official.a13da4feb` |
| actual GUT product consumption | `PASS_PREVIOUS_EXACT_HEAD` | product smoke + `GlyphDefinition` required-contract parity GUT suite |
| public standard GitHub-hosted CI | `PASS_PREVIOUS_EXACT_HEAD` | run `31226874097`, four lanes + final `GUT Validation Gate` |
| JUnit/discovery/exit-code | `PASS_PREVIOUS_EXACT_HEAD` | full GUT validation succeeded; zero-discovery is fail-closed in validator |
| production mutation hash gate | `PASS_PREVIOUS_EXACT_HEAD` | full hosted validator |
| HiGodot authoring receipt | `PASS_PREVIOUS_EXACT_HEAD_ZERO_PROTECTED_DIFF` | `HiGodot Authoring Receipt Gate` success; protected product diff 0 |
| legacy→GUT required-contract parity | `PASS_PREVIOUS_EXACT_HEAD` | parity manifest + GUT `GlyphDefinition` suite consumed by hosted run |
| role-separated static review | `PASS_STATIC_P0_P1_ZERO` | `docs/reviews/PR85_GUT_FORMAL_ADOPTION_ROLE_SEPARATED_REVIEW_2026-08-08.md` |
| Sheet contract binding | `READBACK_PASS` | `GM-CONTRACT-V4-4-BINDING-01` synchronized to Hub/Decision/History rows |

`PASS_PREVIOUS_EXACT_HEAD`는 현재 HEAD의 최종 기술 검증을 대신하지 않는다. 현재 HEAD의 Required Check가 모두 성공하고 unresolved review thread가 0인 경우에만 PR #85 formal adoption 범위가 병합 가능하다.

## 제한적으로 수용된 GUT vendor 차이

```yaml
gut_release: v9.7.1
gut_pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
official_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
project_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
full_tree_identity: false
normalized_critical_runtime_identity: true
decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
scope: CLI_HEADLESS_FORMAL_TEST_AUTHORITY_ONLY
```

`GUT_VENDOR_TREE_MISMATCH_ACCEPTED_CRITICAL_RUNTIME_EQUIVALENCE_LIMITED`는 full-tree 동일성을 뜻하지 않는다. Editor plugin은 계속 비활성이고, 승인 범위를 넘어선 GUT GUI/editor 사용은 별도 검증이 필요하다.

## broader project blockers — PR #85 formal adoption 자체와 분리

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2` | `BLOCKING_BEFORE_PERSISTENT_AUTHORING` | 공식 v3.1.2 release 배포물과 프로젝트 `addons/godot_ai` 정합성 감사 또는 승인된 교체 |
| `HERA_CLI_ADDON_PAIR_UNVERIFIED` | `BLOCKING_BEFORE_HERA_ACCEPTANCE_QA` | exact CLI/addon pair, localhost/token, live-QA canary 확인 |
| `WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED` | `BLOCKING_FOR_PRODUCT_PLATFORM_COMPLETION` | 공용 core + Windows/Android export/smoke 증거 |
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_NO_LOCAL_ACCESS` | `C:/Users/user/Documents/GitHub/shered audio vault` 존재/inventory 확인 |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` | 선택 파일별 권리·출처·hash 기록 |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_VISUAL_AUDIO_COMPLETION` | 필요한 시각·오디오 requirement 승인·promotion 또는 not-required 근거 |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | `BLOCKING_FOR_VISUAL_COMPLETION` | 3개 실제 Godot Screen 렌더·상호작용 검증 |
| `DEVICE_PERFORMANCE_SCREEN_READER_HUMAN_NOT_RUN` | `RELEASE_BLOCKING` | 실제 실행/접근성/성능 증거 |
| `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` | 사용자 로컬 main safe fast-forward + SHA readback |
| `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` | 동기화 local main에서 import/startup/Project Play smoke PASS |

현재 agent는 사용자 PC의 Local Godot Reference shelf와 shared audio vault에 직접 접근할 수 없으므로 해당 상태를 임의로 PASS로 올리지 않는다.

## Asset Vault readback

```yaml
asset_manifest: ASSET_MANIFEST.yml
current_main_readback: MISSING
interpretation: ASSET_MANIFEST_CURRENT_MAIN_MISSING_NO_PROMOTED_ASSET_CLAIM
new_asset_promotion_in_pr85: false
```

이 상태는 PR #85의 non-asset GUT formal-adoption 작업을 막지 않는다. 승인된 제품 자산을 promote했다고 주장하는 순간에는 manifest와 tracked `res://assets/...` readback이 필수다.

## READY 판정

```yaml
formal_adoption_scope: READY_IF_CURRENT_HEAD_CHECKS_PASS
current_next_action: PR85_CURRENT_EXACT_HEAD_REVALIDATION
merge_authorized_only_after:
  - CURRENT_EXACT_HEAD_REQUIRED_CHECKS_PASS
  - GUT_VALIDATION_GATE_PASS
  - HIGODOT_ZERO_PROTECTED_DIFF_GATE_PASS
  - ROLE_SEPARATED_REVIEW_P0_P1_ZERO
  - UNRESOLVED_REVIEW_THREADS_ZERO
  - REPOSITORY_POLICY_PASS
spell_workflow_task2_authorized: false
```

PR #85가 병합되어 merged-main readback과 Sheet sync가 끝나기 전에는 `GUT_FORMALLY_ADOPTED`를 선언하지 않는다. 또한 GUT formal adoption이 닫혀도 위 broader blocker를 자동 해소한 것으로 간주하지 않는다.

## 이미지·오디오 판정

```yaml
review_id: GR-REV-SPELL-WORKFLOW-UI-V2
image_id: GR-IMG-011
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
audio_vault: BLOCKED_UNVERIFIED
correct_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

동일한 이미지 방향 승인을 다시 요청하지 않는다. 다만 v4.4의 `[이미지·오디오 완료]`는 아직 증명되지 않았다.
