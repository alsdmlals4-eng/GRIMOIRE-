# GR-SYNC-20260806-10 — Godot 저작·GUT 테스트 권위 동기화 영수증

```yaml
sync_id: GR-SYNC-20260806-10-GODOT-AUTHORING-GUT-AUTHORITY
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
source_main: 917ead7499482801610ba95ce37efafd1662d994
design_pull_request: 83
design_review: USER_APPROVED_2026-08-06
red_contract_head: 0ae9fa1722c2036d7ab2032e2e39126ba850be2c
red_gate_run: 31107162554
red_gate_result: EXPECTED_FAIL
approved_plan_head: 2f9a42ee4980151f2261923276a79e1ff6791955
green_gate_run: 31108525219
green_gate_result: PASS
sheet_write: PASS
sheet_readback: PASS
spell_workflow_pull_request: 82
spell_workflow_head: 0919b71dfec3c6f57b88e1290789302267936960
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
current_gate: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
gut_current_consumption: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
merge_authorized: false
```

## Base 상태

```yaml
project_base_pin: 9.4.3
base_current_main_observed: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc
base_pin_update: NOT_APPROVED_NOT_PERFORMED
```

Base 최신 선택적 애드온 소비 정책은 실제 소비 경로가 없는 애드온을 완료로 간주하지 않고, HiGodot의 저작 권위와 역할이 다른 테스트 애드온의 검증된 공존을 허용한다. 프로젝트 pin은 변경하지 않았다.

## GitHub 동기화 범위

- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/planning/CURRENT_UNRESOLVED_GATES.md`
- `docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md`
- `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- `docs/planning/CANON_SYNC_STATE.json`
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- `docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md`
- `tests/test_godot_authoring_gut_authority_contract.py`
- `.github/workflows/validate-godot-authoring-gut-authority.yml`

## Google Sheet Write·Readback

| 탭 | 범위 | 결과 |
|---|---|---|
| `00_프로젝트_허브` | `E2:K2` | stale READY 제거·현재 Gate·다음 작업 일치 |
| `01_작업순서` | `A31:N31` | Decision ID·PR83→GUT adoption 순서·차단 조건 일치 |
| `02_현재_확정결정` | `A69:M69` | 사용자 승인·CLI-only 계획·진입 차단 일치 |
| `04_누락_충돌_감사` | `A74:I74` | GUT 미소비·Sheet stale 상태 복구·PR82 정지 일치 |
| `72_이미지검수_승인로그` | `K6:M6` | 방향 승인과 Runtime·final art 미완료 분리 |
| `99_변경이력` | `A92:H92` | Sync ID·Decision ID·Gate·TDD 증거 일치 |

최종 재조회 판정:

```yaml
hub_gate: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
work_order_gate: USER_APPROVED_DESIGN / IMPLEMENTATION_PLAN_READY / FORMAL_ADOPTION_BLOCKED
decision_sync: SYNCED_TO_WORKING_BRANCH / READBACK_PASS
audit_sync: SHEET_WRITE_READBACK_PASS / PR82_PAUSED
image_approval: APPROVED_DIRECTION_ONLY / IMPLEMENTATION_AND_RUNTIME_REVIEW_PENDING
image_runtime: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN / FINAL_ART_NOT_CLAIMED
```

## Test-first 증거

### RED

Commit `0ae9fa1722c2036d7ab2032e2e39126ba850be2c`에서 다음 누락을 요구했다.

- GUT formal-adoption 구현 계획 없음.
- 활성 문서에 오래된 Review Gate 잔존.
- 사용자 승인 상태 미반영.
- 이미 PASS인 Sheet 동기화가 blocker로 잔존.

Run `31107162554`는 이 사유로 실패했다.

### GREEN

Commit `2f9a42ee4980151f2261923276a79e1ff6791955`에서 다음을 반영했다.

- 설계 사용자 승인.
- `BLOCKED_PENDING_GUT_FORMAL_ADOPTION` 전환.
- CLI-only adoption, Editor Plugin 비활성 유지.
- Base main 관찰과 Base 9.4.3 pin 보존.
- 8-task GUT formal-adoption 구현 계획.
- 실제 blocker만 남긴 미확정 목록.

Authority Gate run `31108525219`는 PASS했다.

## 비주장 경계

이 영수증은 다음을 증명하지 않는다.

- GUT 9.7.1의 실제 제품 테스트 소비.
- GUT CLI·JUnit runtime PASS.
- 제품 경로 hash 무변경 PASS.
- legacy/GUT coverage parity.
- HiGodot authoring receipt Gate 구현.
- PR #83 독립 리뷰·병합·main readback.
- PR #82 Task 2 재개.
- Windows·Android export, 기기·성능·Screen Reader·사람 검증.
- 최종 아트 승인.
