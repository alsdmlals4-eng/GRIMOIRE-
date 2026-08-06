# GRIMOIRE 현재 미확정·차단 게이트

```yaml
contract_version: "4.3"
contract_binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: BLOCKING
implementation_entry: BLOCKED_BY_GUT_ADOPTION_SPEC
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
gut_adoption_spec_pr: 84
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
sheet_v4_3_sync: READBACK_PASS
official_tool_release_verification: PASS
vendor_integrity: FAIL_MISMATCH
```

## 현재 최우선 차단 항목

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `GUT_ADOPTION_SPEC_NOT_MERGED` | BLOCKING | PR #84 명세·Decision·검증 계획 exact-HEAD PASS 후 main 병합·readback |
| `HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2` | BLOCKING_BEFORE_AUTHORING | 공식 v3.1.2 release ZIP 추출 hash manifest와 `addons/godot_ai` 비교·승인 또는 공식 release 설치물로 교체 |
| `GUT_VENDOR_TREE_MISMATCH_OFFICIAL_V9_7_1` | BLOCKING_BEFORE_INSTALLATION | 프로젝트 tree `09d04030…`를 공식 v9.7.1 tree `5d689383…`로 교체하거나 file-level audit·승인 |
| `GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_NOT_RUN` | BLOCKING_BEFORE_INSTALLATION | 승인된 GUT tree에서 Godot 4.7.1 CLI discovery·actual product test PASS |
| `GPT_ROLE_SEPARATED_REVIEW_NOT_COMPLETE` | BLOCKING_FOR_PR84_MERGE | 구현자 설명과 분리된 exact diff·정본·테스트 입력으로 검토, P0/P1 0 |

## 공식 소스 확인 결과

```yaml
gut:
  release: v9.7.1
  commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
  official_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
  project_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
  license: MIT
  version_and_source: PASS
  vendor_integrity: MISMATCH
higodot:
  release: v3.1.2
  commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
  release_asset_sha256: 60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33
  official_plugin_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
  project_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
  license: MIT
  version_and_source: PASS
  vendor_integrity: MISMATCH_OR_DISTRIBUTION_LAYOUT_DIFFERENCE
```

## 명세 병합 후에도 남는 구현 차단 항목

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `GUT_ACTUAL_CONSUMPTION_NOT_ENABLED` | BLOCKING | 실제 GRIMOIRE product contract를 검증하는 `GutTest`와 `.gutconfig.json` PASS |
| `GUT_CI_NOT_ENABLED` | BLOCKING | Godot 4.7.1 headless GUT CLI·JUnit·exit-code CI PASS |
| `HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED` | BLOCKING | protected Godot diff 0 또는 valid `HIGODOT_AUTHORING_MANIFEST` 대응 CI PASS |
| `GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED` | BLOCKING | GUT 실행 전후 protected production hash 무변경 PASS |
| `LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN` | BLOCKING | custom runner와 GUT 필수 계약 병행·coverage mapping PASS |
| `WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED` | BLOCKING | 공통 core + Windows headless/launch + Android export/smoke 증거 |

## 시각·오디오·로컬 차단 항목

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `AUDIO_VAULT_PATH_UNVERIFIED` | BLOCKED_NO_LOCAL_ACCESS | `C:/Users/user/Documents/GitHub/shered audio vault` 실제 존재·inventory 확인 |
| `AUDIO_RIGHTS_UNVERIFIED` | BLOCKING_FOR_AUDIO_INGESTION | 선택 파일별 권리·출처·hash 기록 |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | BLOCKING_FOR_CODEX_PRODUCT_WORK | 필요한 시각·오디오 자산 승인 또는 `NO_NEW_VISUAL_ASSET_REQUIRED` 근거 승인 |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | BLOCKING_FOR_VISUAL_COMPLETION | 3개 실제 Godot Screen 렌더·상호작용 검증 |
| `DEVICE_PERFORMANCE_SCREEN_READER_HUMAN_NOT_RUN` | RELEASE_BLOCKING | 실제 실행 증거 |
| `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS` | DELIVERY_BLOCKING | 사용자 로컬 main safe fast-forward와 SHA readback |
| `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS` | DELIVERY_BLOCKING | 동기화된 local main Godot import·startup·smoke PASS |

## v4.3 전환으로 해소·교체된 항목

```yaml
pr83_design_pr: MERGED_MAIN_252063cc
pr83_main_readback: PASS
pr83_only_review_exception: HISTORICAL_VALID_FOR_PR83_ONLY
external_independent_reviewer_requirement: SUPERSEDED_BY_V4_3_SOLO_REVIEW_MODEL
active_review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
image_completion_term: VISUAL_AUDIO_COMPATIBILITY_MAPPING_ACTIVE
sheet_v4_3_binding_write_readback: PASS
official_gut_source_version_license: PASS
official_higodot_source_version_license: PASS
sheet_sync_receipt: docs/planning/sync/GR-SYNC-20260806-13-CONTRACT-V4-3-GUT-SPEC.md
```

PR #83의 병합은 당시 사용자 승인과 exact-HEAD 증거로 유효하다. 후속 PR에는 PR83 예외를 재사용하지 않는다. v4.3에 따라 별도 인간 reviewer가 있다고 가장하지 않고, 역할 분리 검토·사용자 결정권·GUT/CI 객관 증거·exact-HEAD Check로 품질 Gate를 구성한다.

## 동결된 선행 구현 브랜치

```yaml
branch: agent/gut-9-7-1-formal-adoption-tdd
status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
merge_authorized: false
cherry_pick_authorized: false
counts_as_adoption_evidence: false
```

명세 병합 전 생성된 해당 브랜치의 commit은 main에 병합하지 않는다. 구현은 PR #84 병합 후 최신 main에서 새 branch로 다시 시작한다.

## READY 판정

```yaml
historical_status: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
current_status: BLOCKED_BY_GUT_ADOPTION_SPEC
reason: CONTRACT_V4_3_REQUIRES_SPEC_DRAFT_PR_AND_MERGED_MAIN_BEFORE_INSTALLATION
allowed_next_action: PR84_SPEC_ONLY_EXACT_HEAD_REVIEW_AND_MERGE
```

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

사용자에게 동일한 시각 방향 승인을 다시 요청하지 않는다. 다만 v4.3의 `[이미지·오디오 완료]`는 아직 증명되지 않았다.

## 진입 금지

다음 상태는 PR #84 명세 병합과 후속 구현 증거 전 선언하거나 시작하지 않는다.

```text
GUT_FORMAL_INSTALLATION
GUT_FORMALLY_ADOPTED
SPELL_WORKFLOW_TASK2_START
PROJECT_MAIN_SCENE_SWITCH_TO_UI_V2
FINAL_VISUAL_AUDIO_APPROVED
WINDOWS_ANDROID_VALIDATED
GODOT_READY_TO_RUN
```
