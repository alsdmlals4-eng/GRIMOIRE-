# GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01 — 벤치마크·TDD·체크포인트 운영 승인

## 승인 상태

```yaml
decision_id: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
status: USER_APPROVED_SPEC_REVIEW_COMPLETE_PENDING_MERGE
approved_at: 2026-08-05T00:31+09:00
spec_reviewed_at: 2026-08-05T07:52+09:00
approval_source: conversation_user_explicit_approval
counter_increment: true
grill_counter_after_approval: 2_of_10
checkpoint_reason:
  - EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
  - EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
checkpoint_pull_request: 61
```

## 운영 결정

```text
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
SOURCE_VERSION_LIMIT_REQUIRED
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

## 벤치마킹

의미 있는 질문·기획·UX·아트·구현·검증 작업은 프로젝트 정본과 실제 상태를 먼저 확인하고, 같은 목표를 다룬 공식 자료·연구·현업 사례와 비교한다.

각 기록에는 다음이 필요하다.

- 출처 이름과 유형.
- 날짜 또는 버전.
- 관찰한 작동 원리.
- GRIMOIRE에 전이 가능한 원칙.
- 프로젝트와 맞지 않는 한계.
- 채택·변형·기각·보류 결론.

유명 사례의 결과나 외형을 그대로 복제하지 않는다.

## TDD

### 실행 가능한 작업

```text
RED 테스트 작성
→ 예상 이유로 실패 확인
→ 최소 GREEN 구현
→ 집중 테스트와 회귀 테스트 성공
→ GREEN 상태에서 Refactor
```

테스트가 실제 CI·실행 경로에 연결되지 않았다면 RED 완료가 아니다.

### 문서·아트·기획 작업

자동화 가능한 정본 상태·필수 필드·금지 계약은 contract test로 검증한다. 시각적 직관성·재미·피로도처럼 자동 판정할 수 없는 부분은 제작 전에 수용·거부 사례와 검증 계획을 선언하고, 실제 사람/기기 검증 전에는 `NOT_RUN`으로 유지한다.

## 승인 Batch

```yaml
max_approved_decisions_per_batch: 10
current_approved_decisions: 3
merge_required: false
counter_reset: false
```

10건은 최대 Batch 크기다. 10건이 되기 전에는 병합이 자동 요구되지 않는다.

## 조기 체크포인트

다음 조건에서는 10건 이전에도 Draft PR·Sync·Sheet 상태 기록을 허용한다.

1. 활성 정본끼리 고위험 충돌이 발생한다.
2. 세션 종료·컨텍스트 손실 가능성이 있어 복원 지점이 필요하다.
3. 핵심 루프·자원·주문 문법·작업 규칙처럼 정본 영향이 크다.

조기 체크포인트는 다음을 의미하지 않는다.

- 자동 병합 승인.
- Batch counter 초기화.
- 제품 구현 완료.
- Runtime·사람 검증 완료.

## TDD 증거

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
initial_red_workflow: 30925666145
ci_discovery_fix_commit: 64ca7465f5e5624be2e8e001f97dbe70d5131ef1
capacity_red_workflow: 30928418370
entrypoint_red_workflow: 30928799903
charge_lifecycle_red_workflow: 30929106014
spec_review_red_workflow: 30958182618
```

최초 테스트 커밋은 기존 CI가 새 모듈을 호출하지 않아 잘못된 PASS가 발생했다. 실행 경로를 조사해 테스트 모듈을 명시적으로 연결한 뒤 예상 RED를 확인했다. 이후 문서와 구현 계획도 같은 테스트 우선 계약으로 검증한다.

## Base 경계

```yaml
base_promotion_candidate: HOLD
reason:
  - project_evidence_first
  - overlapping_open_base_pull_requests_134_136_137
```

이번 Decision은 GRIMOIRE 프로젝트에서 먼저 검증하며 Base 저장소는 수정하지 않는다.

## 연결 문서

- 상세 운영 설계: `docs/superpowers/specs/2026-08-05-benchmark-tdd-checkpoint-governance-design.md`.
- 자원 구현 계획: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
- 인식 구현 계획: `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.
- 벤치마크: `docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`.
- Batch: `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- 최상위 규칙: `AGENTS.md`.

## 병합 경계

Spec 검토는 완료됐지만 PR #61은 고위험·정본 영향 조기 Draft 체크포인트다. 최신 exact-head CI, 적대적 검토, Google Sheet Readback과 별도 병합 승인 전에는 Ready 전환이나 병합을 하지 않는다.
