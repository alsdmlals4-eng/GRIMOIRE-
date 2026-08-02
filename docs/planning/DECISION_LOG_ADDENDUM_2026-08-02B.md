# GRIMOIRE Decision Log Addendum — 2026-08-02B

## GM-GRILL-MERGE-CADENCE-01

```yaml
status: USER_APPROVED_ACTIVE
decision_date: 2026-08-02
approved_option: GRILL_ME_APPROVALS_BATCHED_AT_10
parent_policy: GM-CANON-SYNC-01
required_pre_merge_gate: GM-PREMERGE-ADVERSARIAL-GATE-01
counter_baseline: 0_of_10
```

### 결정

1. Grill Me에서 승인된 고유 Decision ID를 누적한다.
2. 승인 즉시 GitHub working branch와 Google Sheet에는 계속 동기화한다.
3. 기본적으로 10건이 누적되면 승인 변경 전체를 PR로 병합한다.
4. 병합 직전 GitHub·Sheet·PR을 다시 상세 확인하고 적대적 검토 루프를 실행한다.
5. P0/P1, Sync 불일치, CI 실패, 미해결 Review가 있으면 병합하지 않는다.
6. 병합 후 main·Sheet Readback과 cold-start 전파를 완료한 뒤 카운터를 0으로 Reset한다.

### 조기 병합 Trigger

- 사용자 명시적 병합 요청.
- Gate·Codex·구현 권한 전환 경계.
- P0/P1 정본 안전 수정.
- 작업 종료·인계 Flush.

### 기준선

이 결정 시점에 PR #31·#32는 모두 병합됐고 열린 PR은 0개다.

```text
decision main = 2aec51244ea96fc4d4c9088fcb133f41862faa1d
cold-start main = fe983e3d4ec327d8ceacc41b9976002cad88a524
Sheet = SYNCED_TO_MAIN / MAIN_SHEET_READBACK_PASS
next Grill Me counter = 0/10
```

### 영향

- 운영·병합 주기만 변경.
- 제품 기획·플랫폼·전투·UX 계약 변경 없음.
- `PLANNING_ONLY_PROFILE`, `implementation: NOT_STARTED`, `codex: BLOCKED` 유지.
