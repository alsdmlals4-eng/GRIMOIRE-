# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
platform: MOBILE_LANDSCAPE_FIXED_PC_LATER
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
```

PR #62 Resource Foundation과 PR #63 Recognition은 자동화 Gate를 통과했지만 모두 Open·Draft·미병합이다. 제품 품질, 사람 재미, 실기기 조작감은 아직 PASS가 아니다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md`
5. `docs/planning/CANON_STATUS_INDEX_2026-08-05.md`
6. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `docs/planning/PR63_CANON_AND_BASE_DRIFT_ADVERSARIAL_REVIEW_2026-08-05.md`
8. `docs/planning/sync/GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

## 핵심 재미

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임진다.

```text
조사·상황 → 의도·의미 → 3×3 회로 → Preview → Commit → 변화·대가 → 귀환·복기·Grimoire
```

- 핵심 시스템: 상황 조사, 의미 선택, 3×3 방향 회로, Preview/Commit, 결과·대가와 기록.
- 보조 시스템: Recognition, Exact Glyph Vault, Universal Glyph Stock, 마나·예약·저장, 모바일 UX·접근성, 학교·동료 콘텐츠.
- `RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN`.

## 현재 구현 경계

- 의미 Registry: Main 10 + Support 10.
- Runtime Recognition: `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST` 6종.
- 성공 결과는 Exact Glyph Vault에만 저장하며 Recognition으로 Universal Stock을 만들지 않는다.
- 낮은 확신·혼동·stale revision·선택 불일치는 자동 확정/저장을 차단한다.
- 합성 증거만 존재하므로 사람·실기기 검증 전 7종 이상 확대하지 않는다.

## 작업 규칙

- 기획 우선. 기획 충돌은 GrillMe 승인 전 확정·구현 금지.
- 수치성 테스트 값은 명시적으로 `TEST_VALUE`로 관리한다.
- 실행 변경은 `RED → GREEN → REFACTOR`.
- 승인 Batch 최대 10건. 고위험 충돌·세션 종료·큰 정본 영향은 조기 Draft 체크포인트 가능.
- 정본·Sheet는 같은 Decision/Sync ID로 즉시 동기화하고 Readback한다.

## 다음 작업

1. PR #63 현재 정본 체크포인트 GREEN과 exact-head CI 확인.
2. 같은 Sync ID로 Google Sheet 최종 HEAD Readback.
3. GrillMe `GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`로 사람·실기기 검증 범위 승인.
4. 승인 전 이미지·애니메이션·후속 Codex 제품 작업 확정 금지.
