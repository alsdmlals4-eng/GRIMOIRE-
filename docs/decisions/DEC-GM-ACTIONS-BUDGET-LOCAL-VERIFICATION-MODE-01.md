# GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01

```yaml
decision_id: GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01
status: USER_APPROVED_ACTIVE_WHILE_ACTIONS_BUDGET_BLOCKED
approved_at: 2026-08-07T06:52+09:00
project: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
reason: GitHub Actions budget is unavailable
scope:
  current_conversation: true
  automatic_future_pr_waiver: false
  each_pr_requires_exact_head_receipt: true
  branch_protection_bypass: false
  test_execution_waiver: false
```

## Decision

GitHub Actions가 예산 때문에 실행되지 않는 동안에도 구현과 검증은 계속할 수 있다. 다만 queued, skipped, 미실행 Actions를 성공으로 표시하지 않는다. 각 PR은 현재 exact HEAD에서 생성한 로컬 evidence manifest와 원본 로그를 제출해야 한다.

허용되는 대체 증거:

1. clean local checkout의 `HEAD`가 검토 대상 SHA와 정확히 일치한다.
2. `origin/main`과 base SHA, merge-base를 기록한다.
3. 검증 전 working tree가 clean이고 merge/rebase/cherry-pick이 진행 중이지 않다.
4. 저장소에 포함된 계약 테스트를 실제 실행하고 exit code와 전체 로그를 기록한다.
5. Godot/GUT 작업은 exact Godot 4.7.1, pinned GUT source/tree, test discovery, JUnit XML을 기록한다.
6. GUT 실행 전후 protected production hash가 정확히 같아야 한다.
7. 생성 evidence는 `artifacts/local-validation/` 아래에 두며 product 파일을 수정하지 않는다.
8. GPT 검토자 역할은 manifest, 로그, exact diff를 공격하고 P0/P1을 사용자에게 올린다.
9. Sheet에는 PASS와 NOT_RUN을 구분해 같은 Decision ID로 기록한다.

## Fail-closed rules

다음 중 하나면 병합할 수 없다.

```text
HEAD_MISMATCH
DIRTY_WORKTREE_BEFORE_VALIDATION
OPERATION_IN_PROGRESS
OFFICIAL_GUT_TREE_MISMATCH
GODOT_VERSION_MISMATCH
PYTHON_CONTRACT_FAILURE
GUT_DISCOVERY_ZERO
GUT_TEST_FAILURE
JUNIT_MISSING_OR_INVALID
PRODUCTION_HASH_CHANGED
EVIDENCE_MANIFEST_HEAD_MISMATCH
UNRESOLVED_P0_OR_P1
REPOSITORY_POLICY_REQUIRES_UNAVAILABLE_EXTERNAL_CHECK
```

## Semantics

```yaml
github_actions_status: NOT_RUN_BUDGET_BLOCKED
local_exact_head_status: PASS | FAIL | NOT_RUN
claim_ci_pass: false
merge_evidence_source: LOCAL_EXACT_HEAD_MANIFEST_PLUS_USER_AUTHORITY
```

이 Decision은 검증을 생략하지 않으며, PR #84의 일회성 예외와도 다르다. PR #84 예외는 이미 소비되었다. 이후 PR은 이 Decision에 따라 실제 로컬 명령 실행 결과가 있어야 병합 가능하다.

## Current application

```yaml
pull_request: 85
base_main: 312e491c8e9b333cb585b4e0550f80e3aea5f3f7
branch: agent/gut-9-7-1-formal-adoption-v4-3-tdd
current_state: RED_LOCAL_EXECUTION_NOT_RUN
merge_authorized: false
pr82_task2_authorized: false
```
