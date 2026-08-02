# GRIMOIRE 현재 확정 결정 Addendum — Grill Me 병합 주기

## 1. 결정 상태

```yaml
decision_id: GM-GRILL-MERGE-CADENCE-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02T15:16+09:00
parent_policy: GM-CANON-SYNC-01
batch_threshold: 10
current_counter: 0
next_merge_at: 10
required_pre_merge_gate: GM-PREMERGE-ADVERSARIAL-GATE-01
latest_complete_decision_main: 2aec51244ea96fc4d4c9088fcb133f41862faa1d
latest_complete_cold_start_main: fe983e3d4ec327d8ceacc41b9976002cad88a524
open_prs_at_approval: 0
product_implementation: NOT_STARTED
codex: BLOCKED
```

## 2. 확정 내용

- 주요 승인 결정은 계속 즉시 GitHub 작업 브랜치와 Google Sheet에 같은 Decision ID로 동기화한다.
- Grill Me에서 승인된 서로 다른 Decision ID를 누적한다.
- 기본적으로 `10/10`에 도달하면 승인된 항목 전체를 병합한다.
- 병합 직전 GitHub·Google Sheet·PR을 상세히 재조회하고 적대적 검토 루프를 실행한다.
- P0/P1 충돌, Sheet 불일치, CI 실패, review block이 있으면 병합하지 않는다.
- 병합 후 main·Sheet Readback과 cold-start 전파까지 완료한 뒤 카운터를 0으로 Reset한다.

## 3. 이전 정책과 관계

`GM-CANON-SYNC-01`의 다음 원칙은 유지된다.

- 승인 내용을 대화에만 남기지 않음.
- 같은 Decision ID로 GitHub와 Sheet 동기화.
- working branch와 main 상태 분리.
- Readback 없는 완료 주장 금지.

다음 항목만 대체한다.

```text
기존 기본 = 승인마다 즉시 PR 병합
새 기본 = working-branch 즉시 동기화 + Grill Me 승인 10건마다 Batch 병합
```

사용자의 명시적 병합 요청, Gate/구현 경계, P0/P1 안전 수정, 작업 인계 Flush는 10건 전 조기 병합 Trigger다.

## 4. 현재 Flush 확인

정책 채택 전까지 승인된 내용은 모두 병합됐다.

- PR #31: Resume·Save, Landscape UX, Smartphone 정식 Gate·Tablet Best-effort.
- PR #32: cold-start·Active Context·Current Addendum·Main Sync Receipt 전파.
- Decision main: `2aec51244ea96fc4d4c9088fcb133f41862faa1d`.
- Cold-start main: `fe983e3d4ec327d8ceacc41b9976002cad88a524`.
- Google Sheet: `SYNCED_TO_MAIN / MAIN_SHEET_READBACK_PASS`.
- Open PR: `0`.

따라서 새 Grill Me Batch 카운터는 `0/10`이다.

## 5. 책임 원본

- Merge cadence policy:
  `docs/planning/PROJECT_CANON_SYNC_POLICY_ADDENDUM_GRILL_BATCH_2026-08-02.md`
- Machine-readable state:
  `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- Mandatory pre-merge checklist:
  `docs/planning/PRE_MERGE_ADVERSARIAL_REVIEW_CHECKLIST_2026-08-02.md`
- PR checklist:
  `.github/PULL_REQUEST_TEMPLATE.md`

## 6. 다음 기획 작업

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
```

이 운영 결정은 제품 범위·전투·UX·플랫폼 계약을 변경하지 않으며 구현 권한을 부여하지 않는다.
