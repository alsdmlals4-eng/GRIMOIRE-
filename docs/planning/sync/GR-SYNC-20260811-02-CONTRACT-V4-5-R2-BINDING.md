# GR-SYNC-20260811-02 — GRIMOIRE v4.5 r2 Contract Binding

```yaml
sync_id: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
decision_id: GM-CONTRACT-V4-5-BINDING-01
status: USER_APPROVED_EXACT_HEAD_GREEN_SHEET_READBACK_PASS_MERGE_PENDING
approved_at: 2026-08-11
approval: USER_APPROVED
source_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5_r2.md
source_revision: 2026-08-11-r2
previous_binding_decision: GM-CONTRACT-V4-4-BINDING-01
previous_binding_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
product_decision_changed: false
persistent_godot_authoring: NOT_RUN
human_device_performance_promotion: NONE
sheet_sync: SHEET_WRITE_READBACK_PASS
merge_state: PENDING_FINAL_EXACT_HEAD_REVALIDATION
```

## 승인 근거

사용자는 현재 대화에서 다음을 명시했다.

```text
v4.5 r2 로 깃허브 정본도 교체해
권장안대로 승인 [연속작업 진행해]
```

따라서 v4.5 r2의 `INSTRUCTION_DOCUMENT_UPDATE_ONLY_UNLESS_EXPLICIT_FUTURE_EXECUTION_REQUEST` guard는 이번 repository/Sheet binding migration을 차단하지 않는다. 명시 실행 요청이 존재한다.

## Base current readback

```yaml
base_repository: alsdmlals4-eng/Base
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
base_source_snapshot_in_v4_5_r2: 7ce3fb64fa6303c5da6c7fc27c979f7233b761ac
source_snapshot_role: HISTORICAL_OBSERVATION_ONLY
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
```

## 전환 범위

Current authority를 다음으로 전진한다.

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
```

다음은 변경하지 않는다.

```yaml
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
gut_authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
```

## 역사 보존

`docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`는 삭제하지 않는다. 해당 파일의 `GM-CONTRACT-V4-4-BINDING-01`, GUT formal-adoption, 과거 Base/Godot observation은 당시 사실의 provenance로 유지한다. v4.5 current-state consumer는 이를 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로 참조한다.

## 적대적 검토 기준

- v4.5 source snapshot SHA를 current Base permanent authority로 동결하지 않았는가.
- Switchy-Express 범용 예시 경로가 GRIMOIRE current path로 섞이지 않았는가.
- v4.4 파일·과거 Decision을 삭제하거나 거짓으로 다시 쓰지 않았는가.
- HiGodot/GUT/Hera 역할이 확대되지 않았는가.
- Task7→Task8 제품 상태가 후퇴하지 않았는가.
- HUMAN/DEVICE/PERFORMANCE/FULL_VERTICAL_SLICE/EXPORT/AUDIO/LOCAL 상태가 근거 없이 승격되지 않았는가.
- GitHub와 Sheet가 같은 Decision/Sync를 갖는가.

## Sheet 동기화 증거

```yaml
sheet_surfaces:
  - 00_프로젝트_허브
  - 01_작업순서
  - 02_현재_확정결정
  - 04_누락_충돌_감사
  - 99_변경이력
sheet_status: SHEET_WRITE_READBACK_PASS
readback_ranges:
  - 00_프로젝트_허브!E2:K2
  - 01_작업순서!A59:N59
  - 02_현재_확정결정!A76:M76
  - 04_누락_충돌_감사!A87:I87
  - 99_변경이력!A127:H127
```

Sheet readback은 같은 `GM-CONTRACT-V4-5-BINDING-01` / `GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING`으로 확인됐다. 이 문서 갱신으로 PR HEAD가 바뀌므로 최종 병합 전 새 exact HEAD의 적용 CI를 다시 실행하고, Sheet의 PR HEAD 표기도 새 SHA로 다시 맞춘다.
