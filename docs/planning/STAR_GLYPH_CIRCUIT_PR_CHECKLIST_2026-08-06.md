# 별형 글자 회로 PR 체크리스트 — 2026-08-06

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
branch: agent/star-circuit-mastery-balance
base_commit: 2d80e4afcfc6b530b76912826f5984cdf1184678
reviewed_head_before_pr: bed13e4e0f99705b036c03b0350cc5997d40ee97
changed_files_before_checklist: 16
sheet_readback: PASS
runtime_validation: NOT_RUN
merge_requested: false
```

## 범위

- [x] 활성 3×3 문법을 별형 회로로 대체.
- [x] 사용자 승인 수치와 정밀·절감 반영.
- [x] 메인·보조 글자별 숙련도와 수업 상한 반영.
- [x] GitHub 권위·Registry·상태 색인 동기화.
- [x] Google Sheet 9개 탭 반영 및 Readback.
- [x] 과거 3×3 문서 역사 보존.
- [x] Base adapter·제품 코드·게임 데이터 미변경.

## PR Gate

- [ ] exact-head focused contract test green.
- [ ] full repository CI green or unrelated failure 분리.
- [ ] active authority stale 3×3 conflict zero.
- [ ] JSON Registry parse green.
- [ ] unresolved review thread zero.
- [ ] written design spec review complete.
- [ ] main merge 이후 Sheet 재검증.

## 완료 과장 방지

```text
DESIGN_APPROVED
CANON_SYNCED_TO_WORKING_BRANCH
PRODUCT_IMPLEMENTATION_NOT_STARTED
RUNTIME_NOT_RUN
MOBILE_NOT_RUN
HUMAN_NOT_RUN
FINAL_BALANCE_NOT_PROVEN
```
