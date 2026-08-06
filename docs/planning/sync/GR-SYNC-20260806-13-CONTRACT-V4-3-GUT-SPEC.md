# GR-SYNC-20260806-13 — Contract v4.3 / GUT Adoption Spec

```yaml
sync_id: GR-SYNC-20260806-13-CONTRACT-V4-3-GUT-SPEC
contract_binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
gut_decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
base_main: 252063ccad18b885fc75cbeba3b807fefd76496e
branch: chore/gut-9.7.1-adoption-spec
pull_request: 84
spec_only: true
status: WORKING_BRANCH_AND_SHEET_SYNCED_EXACT_HEAD_REVIEW_PENDING
```

## 승인 입력

사용자는 2026-08-06에 업로드한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3.md`를 기준 계약으로 진행하라고 승인했다.

```yaml
active_contract_version: "4.3"
project_binding: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
```

## 진입 상태 재판정

```yaml
previous_sheet_state: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
corrected_state: BLOCKED_BY_GUT_ADOPTION_SPEC
reason: v4.3 requires a separate adoption-spec Draft PR merged before formal installation
reconciliation: docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
```

선행 구현 브랜치 `agent/gut-9-7-1-formal-adoption-tdd`는 `FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE`로 동결했다. 해당 commit은 병합·cherry-pick하거나 adoption 증거로 사용하지 않는다.

## RED 증거

```yaml
red_head: 39c352d2ea353184cf239a79829f486d9adc4c7e
red_workflow: Validate Godot Authoring and GUT Authority Gate
red_run: 31113151792
red_result: EXPECTED_FAIL
failure_reason: v4.3 project binding, GUT adoption spec, Decision and reconciled state were intentionally absent
```

## GitHub 정본 반영

```text
docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
docs/testing/GUT_9_7_1_ADOPTION_SPEC.md
docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md
docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
docs/planning/CURRENT_CONFIRMED_DECISIONS.md
docs/planning/CURRENT_UNRESOLVED_GATES.md
docs/planning/CANON_SYNC_STATE.json
docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
START_HERE.md
docs/ACTIVE_CONTEXT.md
docs/DEVELOPMENT_GATES.md
tests/test_v4_3_contract_binding.py
tests/test_godot_authoring_gut_authority_contract.py
tests/test_pr83_review_exception_contract.py
.github/workflows/validate-godot-authoring-gut-authority.yml
```

## Google Sheet write/readback

Spreadsheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`

```yaml
00_프로젝트_허브_E2_K2: READBACK_PASS
01_작업순서_A31_N32: READBACK_PASS
02_현재_확정결정_A69_M70: READBACK_PASS
04_누락_충돌_감사_A74_I75: READBACK_PASS
72_이미지검수_승인로그_K6_M6: READBACK_PASS
99_변경이력_A95_H95: READBACK_PASS
```

같은 Decision ID가 GitHub와 Sheet에 반영됐다.

```yaml
GM-CONTRACT-V4-3-BINDING-01: SYNCED_READBACK_PASS
GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01: UPDATED_TO_V4_3_SPEC_GATE_READBACK_PASS
```

## 명세 PR 비변경 주장

PR #84는 다음을 변경하거나 설치하지 않는다.

```text
project.godot
*.tscn
*.tres
*.res
product scripts or data
assets or audio files
.gutconfig.json
actual GutTest product tests
GUT runtime/JUnit workflow
addons/gut source tree
```

## 남은 검증

```yaml
exact_head_required_checks: PENDING
role_separated_diff_review: PENDING
unresolved_review_threads: PENDING_RECHECK
p0_p1_findings: PENDING_RECHECK
pr_ready: false
merge_authorized: false
```

## 비완료 주장

```yaml
gut_adoption_spec_merged: false
gut_formally_adopted: false
gut_runtime_ci_pass: false
higodot_source_verified: false
gut_source_commit_and_integrity_verified: false
audio_vault_verified: false
visual_audio_complete: false
spell_workflow_task2_authorized: false
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```
