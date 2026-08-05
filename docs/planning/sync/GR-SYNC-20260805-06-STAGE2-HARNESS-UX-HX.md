# GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX

## Sync Receipt

```yaml
sync_id: GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
change_type: APPROVED_DECISION_IMPLEMENTATION_DETAIL
new_grill_approval: false
grill_counter: 4_of_10
repository: alsdmlals4-eng/GRIMOIRE-
working_branch: agent/glyph-vocabulary-recognition-poc
pull_request: 63
previous_sync: GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE
previous_canon_head: b03152d3af9e99405bdb4afbcf87d2b038b7db9f
human_execution: NOT_RUN
runtime_expansion_7_plus: BLOCKED
merge_authorized: false
```

## 목적

승인된 단계형 사람검증의 Stage 2를 Codex가 구현할 수 있도록 최소 UX/HX 상태팩, State Matrix, TDD 구현 계획을 고정한다. 최종 아트나 사람 결과를 생성하지 않는다.

## TDD

```yaml
red_head: 9280e9bf54f633cd8db051fbfe6809512262d29a
red_workflow_run: 31009239386
red_result: EXPECTED_FAILURE_STAGE2_HX_ARTIFACTS_AND_STATE_ONLY
existing_resource_contract: PASS
existing_vocabulary_contract: PASS
existing_current_authority_contract: PASS
existing_human_protocol_contract: PASS
green_workflow_run: PENDING_EXACT_HEAD
```

## GitHub 변경

- `STAGE2_CIRCUIT_BRIDGE_HARNESS_UX_HX_2026-08-05.md`.
- `STAGE2_CIRCUIT_BRIDGE_HARNESS_STATE_MATRIX_2026-08-05.md`.
- Codex용 Stage 2 Harness TDD 구현 계획.
- 현재 정본, Sync State, Grill Work State 갱신.
- Stage 2 UX/HX 계약 테스트와 CI 수집.

## 정보 구조

```text
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
CENTER_TARGET_AND_3X3_CIRCUIT
RIGHT_WRITING_FOCUS_PANEL
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
```

## 상태 흐름

```text
SCENARIO_BRIEF
→ INTENT_AND_SOURCE_SELECT
↔ WRITING_FOCUS
↔ CIRCUIT_EDIT
→ PREVIEW_READY
→ COMMIT_CONFIRM
→ SYSTEM_RESOLVE
→ RESULT_EXPLAIN
```

오류는 Context를 보존한 `ERROR_SAFE_RECOVERY`로 이동한다.

## Sheet 예정 범위

```yaml
ranges:
  - 00_프로젝트_허브!H2:K2
  - 01_작업순서!H52:J52
  - 02_현재_확정결정!A58:J58
  - 04_누락_충돌_감사!E62:H62
  - 60_UX_UI_접근성!A31:J31
  - 71_이미지기획_생성목록!A9:F9
  - 99_변경이력!A76:H76
sheet_write: PENDING
sheet_readback: PENDING
```

## 경계

```text
LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART
NO_FINAL_ART_ASSET_REQUIRED
NO_SEVENTH_GLYPH
NO_FULL_VERTICAL_SLICE_CONTENT_EXPANSION
HUMAN_EXECUTION_NOT_RUN
```

UX/HX Green 후 Codex는 별도 Stacked Draft PR에서 TDD Harness만 구현한다.
