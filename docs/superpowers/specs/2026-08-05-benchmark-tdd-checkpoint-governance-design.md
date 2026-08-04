# Benchmark, TDD, and Canon Checkpoint Governance Design

## Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
status: USER_APPROVED_DESIGN_DRAFT_CHECKPOINT
approved_at: 2026-08-05T00:31+09:00
scope: PROJECT_OPERATING_POLICY
product_implementation: NOT_STARTED
human_validation: NOT_RUN
```

## 1. Purpose

앞으로 프로젝트의 의미 있는 질문과 작업은 내부 기억이나 직감만으로 결론 내리지 않는다. 프로젝트 정본과 실제 구현 상태를 먼저 복원하고, 같은 목표를 다룬 외부 벤치마크와 현업 관행을 비교한 뒤 GRIMOIRE에 전이 가능한 원칙만 채택한다.

```text
프로젝트 사실 복원
→ 벤치마크·현업 비교
→ 전이 가능 원칙과 불일치 분리
→ 적대적 검토
→ 테스트 우선 계약
→ 작업
→ 검증
→ Decision·정본·Sheet 동기화
```

## 2. Mandatory benchmark contract

```yaml
policy: BENCHMARK_AND_PRO_COMPARISON_REQUIRED
applies_to:
  - meaningful_design_question
  - system_design_or_change
  - UX_UI_or_accessibility
  - art_direction_or_asset_pipeline
  - implementation_architecture
  - testing_or_release_workflow
  - balance_or_player_research
exceptions:
  - typo_only
  - exact_formatting_only
  - identical_validation_rerun
```

벤치마크 기록은 최소 다음 필드를 가진다.

```yaml
benchmark_record:
  source_name: string
  source_type: PRIMARY | OFFICIAL | PROFESSIONAL_CASE | SECONDARY
  source_date_or_version: string
  observed_mechanism: string
  transferable_principle: string
  project_mismatch_or_limit: string
  recommendation: ADOPT | ADAPT | REJECT | HOLD
  verification_boundary: string
```

```text
SOURCE_VERSION_LIMIT_REQUIRED
```

출처 이름만 나열하거나 유명 작품의 표면적 형태를 복제하는 것은 벤치마킹으로 인정하지 않는다. 해당 사례가 왜 작동하는지, GRIMOIRE의 모바일 3×3 회로·조사·의도 선택 구조와 어디서 어긋나는지를 함께 기록한다.

## 3. Professional comparison output

사용자에게 선택을 제시할 때 다음을 구분한다.

```text
현재 프로젝트 안
현업 일반 관행
검증된 외부 사례
GRIMOIRE에 적용할 권장안
적용하지 않을 요소와 이유
```

현업 관행은 법칙이 아니라 비교 기준이다. 프로젝트 핵심 재미와 충돌하면 그대로 채택하지 않는다.

## 4. TDD policy

### Executable behavior

```yaml
policy: STRICT_RED_GREEN_REFACTOR
sequence:
  - RED_TEST_WRITTEN_FIRST
  - RED_FAILURE_OBSERVED_FOR_EXPECTED_REASON
  - MINIMAL_GREEN_IMPLEMENTATION
  - FOCUSED_GREEN_VERIFIED
  - REGRESSION_GREEN_VERIFIED
  - REFACTOR_WHILE_GREEN
```

제품 코드, 도구, Validator, 데이터 변환, 상태 머신, UI 동작, 버그 수정에는 실패하는 자동 테스트를 먼저 작성한다. 테스트가 CI에 실제로 연결돼 실패한 증거가 없으면 RED 완료로 보지 않는다.

### Non-executable design and art work

문서·기획·아트처럼 자동 실행 결과가 없는 작업도 제작 전에 검증 계약을 먼저 쓴다.

```yaml
policy: TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
required_before_production:
  - intended_player_reading_or_behavior
  - acceptance_cases
  - rejection_cases
  - adversarial_failure_modes
  - evidence_limit
required_after_production:
  - acceptance_review
  - adversarial_review
  - human_or_device_test_plan
```

이 경우 자동화된 TDD를 수행했다고 과장하지 않는다. 문서 토큰·상태·정본 연결처럼 자동 검증 가능한 부분은 contract test로 RED/GREEN을 수행하고, 시각 인지·재미·피로도는 `HUMAN_NOT_RUN` 또는 실제 플레이테스트 결과로 구분한다.

## 5. Approval batch policy

```yaml
policy: MAX_APPROVED_DECISIONS_PER_BATCH_10
max_approved_decisions_per_batch: 10
normal_merge_trigger: APPROVED_COUNT_REACHES_10
merge_before_threshold: not_required
```

승인된 독립 Decision은 최대 10개까지 하나의 정본 병합 Batch에 누적한다. 10은 목표 수량이 아니라 최대 크기다.

## 6. Early checkpoint policy

다음 경우 10건 이전에도 Draft PR·Sync 영수증·Sheet 상태 기록으로 조기 체크포인트를 만든다.

```text
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

### HIGH_RISK_CONFLICT

- 기존 활성 Decision을 부분 대체하거나 폐기한다.
- 동일 책임을 가진 두 시스템이 충돌한다.
- 잘못 적용하면 제품 데이터·자원 경제·핵심 재미를 훼손한다.

### SESSION_END

- 세션 종료·토큰/컨텍스트 손실 가능성이 높다.
- 다음 작업자가 저장소만 읽고 현재 상태를 복원하기 어렵다.

### MAJOR_CANON_IMPACT

- 최상위 작업 규칙, 주문 문법, 자원 의미, 핵심 루프, 플랫폼 UX가 바뀐다.
- GitHub 정본과 Google Sheet를 같은 Decision ID로 즉시 연결해야 한다.

조기 체크포인트는 자동 병합 승인이 아니다.

```yaml
early_checkpoint:
  draft_pr_allowed: true
  sheet_status: APPROVED_PENDING_MERGE_OR_SPEC_REVIEW
  merge_authorized: false
  batch_counter_reset: false
```

## 7. Canon synchronization

승인 또는 정본 영향 변경은 같은 작업 흐름에서 다음을 수행한다.

```text
Decision ID 확정
→ GitHub 책임 원본·상태 색인·Registry·Batch 반영
→ Commit·PR 위치 기록
→ Google Sheet 같은 Decision ID 반영
→ GitHub·Sheet Readback
→ 상태 일치 확인
```

GitHub가 권위 원본이고 Sheet는 계획·운영 Surface다. 부분 동기화 상태에서는 `SYNCED`를 선언하지 않는다.

## 8. Adversarial review

작업마다 최소 다음 공격 질문을 사용한다.

- 벤치마크가 프로젝트 핵심 재미보다 유명 사례를 우선하게 만들지 않는가.
- 출처가 현재 버전·플랫폼·대상 사용자와 맞는가.
- 자동 테스트가 실제 요구가 아니라 문서 문자열만 보호하고 있지 않은가.
- 비실행 작업을 TDD 완료라고 과장하고 있지 않은가.
- 10건 Batch 때문에 고위험 충돌 기록이 지연되지 않는가.
- 조기 체크포인트가 빈번한 행정 PR 남발이나 무단 병합으로 변하지 않는가.

## 9. Base promotion boundary

이 정책은 프로젝트에서 먼저 검증한다. Base 공용화 후보는 다음 상태로 둔다.

```yaml
base_promotion_candidate: HOLD
reason:
  - project_behavior_not_yet_proven_across_multiple_repositories
  - overlapping_open_base_pull_requests
required_before_promotion:
  - one_complete_project_batch
  - observed_TDD_and_checkpoint_evidence
  - cross_project_reuse_review
```

Base의 병행 PR과 충돌할 가능성이 있으므로 이번 작업에서 Base 파일을 수정하지 않는다.

## 10. Acceptance criteria

- 의미 있는 설계 답변에는 프로젝트 사실과 외부/현업 비교가 구분돼 있다.
- 벤치마크마다 출처 시점, 전이 원칙, 프로젝트 불일치가 기록된다.
- 실행 동작 변경은 테스트가 먼저 작성되고 예상 이유로 실패한 증거가 있다.
- 문서·아트 작업은 제작 전에 수용/거부 사례와 검증 한계를 선언한다.
- 승인 Batch 최대값은 10이다.
- 고위험 충돌·세션 종료·정본 영향이 큰 경우 Draft 조기 체크포인트를 허용한다.
- 조기 체크포인트는 Batch를 초기화하거나 병합을 자동 승인하지 않는다.
- GitHub와 Sheet는 같은 Decision ID와 상태를 사용한다.
