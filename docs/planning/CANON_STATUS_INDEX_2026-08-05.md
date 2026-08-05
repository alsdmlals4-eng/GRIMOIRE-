# GRIMOIRE 정본 상태 인덱스 — 2026-08-05

## 현재 권위

```yaml
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
```

현재 상태 복원 순서:

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ PR #62 Resource Foundation 증거
→ PR #63 Recognition 증거
→ docs/planning/sync/GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC.md
→ Google Sheet 동일 Sync ID
```

## 상태 분류

| 범위 | 현재 상태 | 근거 |
|---|---|---|
| 핵심 재미·3×3 의미 회로 | 승인 정본 | `GM-3X3-CIRCUIT-STOCK-FOCUS-01` 및 후속 자원 Decision |
| 보관함·범용 Stock | 자동화 POC PASS | PR #62 / `GR-SYNC-20260805-03-GLYPH-RESOURCE-POC` |
| Vocabulary 의미 20종 | 승인 정본 | `GM-GLYPH-VOCABULARY-V1-01` |
| Runtime Recognition 6종 | 자동화 POC PASS | PR #63 / `GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC` |
| 사람·실기기 전체 루프 | 미실행 | `HUMAN_END_TO_END_CORE_LOOP_VALIDATION_PENDING` |
| Runtime 7종 이상 | 차단 | 사람 인지·기기 검증 전 확대 금지 |
| PR #62·#63 병합 | 미승인 | Open·Draft·미병합 유지 |

## 현재 문서와 이력 문서

- `CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md`: 현재 Runtime 작업 권위.
- `CURRENT_CONFIRMED_DECISIONS.md`: 승인 Decision과 구현 경계.
- `CANON_SYNC_STATE.json`: 기계 판독 동기화 상태.
- `GRILL_ME_BATCH_MERGE_STATE.json`: 승인 Batch `3/10`과 병합 권한.
- `CANON_STATUS_INDEX_2026-08-04.md`: `[이력]` — PR #61 계획 완료 시점 스냅샷이며 현재 Runtime 상태로 사용하지 않는다.

## Base 적용 상태

```yaml
project_base_contract_pin: c987647d01ad2baa028a16e03d85ddfc1572a727
observed_base_main: 339a48be688e312b7894e1f2372aecfe0ee3f6f4
observed_ahead_commits: 54
migration_status: DEFERRED_TO_SEPARATE_TDD_CHANGE
```

Base main에는 Human/Synthetic 증거 거버넌스와 Godot Live Editor Contract v2를 포함한 후속 변경이 있다. PR #63의 제품·인식 증거와 섞어 SHA만 교체하면 회귀 원인을 분리할 수 없으므로, 현재 PR에서는 기존 pin을 유지한다. 선별 채택은 별도 TDD 마이그레이션과 필요 시 GrillMe 승인 대상으로 다룬다.

## 적대적 검토 결론

- P0: 없음.
- P1: 진입점·상태 JSON이 PR #61에 멈춘 정본 드리프트 — 이 체크포인트에서 보정.
- P1: 새 정본 계약 테스트가 CI에 수집되지 않던 검증 사각지대 — Workflow에 명시 등록.
- P1: 합성 인식 증거를 사람 품질로 오해할 위험 — Human/Device `NOT_RUN`, 7+ `BLOCKED` 유지.
- P1: Base pin 54커밋 드리프트 — 현 PR에 혼합하지 않고 별도 마이그레이션으로 분리.

새 제품 기획 승인이나 수치 변경은 없으므로 Grill 카운터는 증가하지 않는다.
