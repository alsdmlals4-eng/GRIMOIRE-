# GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01

```yaml
decision_id: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-07T07:57+09:00
project: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
repository_visibility: public
supersedes: GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01
official_validation_authority: STANDARD_GITHUB_HOSTED_RUNNERS
larger_runners_allowed: false
self_hosted_runners_allowed: false
required_artifact_upload: false
required_cache: false
```

## Decision

GRIMOIRE의 PR 검증 권위는 공개 저장소에서 제공되는 표준 GitHub-hosted runner로 전환한다. Windows와 Ubuntu를 로컬 WSL2로 재현하는 절차는 필수 병합 게이트에서 제거한다. 기존 로컬 스크립트는 선택적 진단 도구로만 남으며 병합 권위가 아니다.

공식 검증 lane은 다음 네 개다.

1. `windows-py311`: 전체 Python 계약 테스트
2. `windows-py312`: 전체 Python 계약 테스트, Godot 4.7.1, GUT, JUnit, protected-product hash
3. `windows-py313`: 전체 Python 계약 테스트
4. `ubuntu-py312`: 전체 Python 계약 테스트, Godot 4.7.1, GUT, JUnit, protected-product hash

`GUT Validation Gate`는 네 lane이 모두 성공한 경우에만 성공한다. PR exact head는 `pull_request.head.sha`를 직접 checkout하여 검증한다.

## Cost boundary

GitHub 공식 문서에 따라 공개 저장소의 표준 GitHub-hosted runner 사용은 무료이며 무제한이다.

- https://docs.github.com/en/actions/reference/runners/github-hosted-runners
- https://docs.github.com/en/billing/concepts/product-billing/github-actions

비용 또는 저장공간 증가를 피하기 위해 다음을 사용하지 않는다.

- larger runner
- self-hosted runner
- `actions/upload-artifact`
- `actions/cache`
- 장기 evidence 보존

기존 `tools/run_local_validation_matrix.ps1` 실행 결과는 공식 PASS를 대체하지 않는다.

검증 결과는 job log와 `GITHUB_STEP_SUMMARY`에 기록한다.

## Fail-closed rules

다음 중 하나라도 발생하면 `GUT Validation Gate`는 실패한다.

```text
MATRIX_LANE_FAILURE
HEAD_MISMATCH
DIRTY_WORKTREE_BEFORE_VALIDATION
OPERATION_IN_PROGRESS
REMOTE_MISMATCH
PYTHON_VERSION_MISMATCH
PYTHON_CONTRACT_FAILURE
OFFICIAL_GUT_TREE_MISMATCH
GODOT_VERSION_MISMATCH
GUT_CONSUMPTION_FILES_MISSING
GUT_DISCOVERY_ZERO
GUT_TEST_FAILURE
JUNIT_MISSING_OR_INVALID
PRODUCTION_HASH_CHANGED
```

## Current application

```yaml
pull_request: 85
base_main: 312e491c8e9b333cb585b4e0550f80e3aea5f3f7
branch: agent/gut-9-7-1-formal-adoption-v4-3-tdd
workflow: .github/workflows/validate-gut-formal-adoption.yml
state: CONFIGURED_EXECUTION_PENDING
merge_authorized: false
pr82_task2_authorized: false
```
