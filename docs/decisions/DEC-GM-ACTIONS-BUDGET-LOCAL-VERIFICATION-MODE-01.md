# GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01

```yaml
decision_id: GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01
status: SUPERSEDED
approved_at: 2026-08-07T06:52+09:00
superseded_at: 2026-08-07T07:57+09:00
superseded_by: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
project: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
```

## Historical decision

GitHub Actions 예산 차단을 전제로 Windows와 WSL2에서 exact-head evidence를 생성하려던 임시 검증 방식이었다.

## Supersession

저장소가 공개 상태이며 공개 저장소의 표준 GitHub-hosted runner가 무료·무제한이라는 GitHub 공식 정책을 재확인했다. 사용자는 로컬 Windows+WSL2 필수 게이트를 폐기하고 표준 GitHub-hosted runner를 공식 검증 권위로 사용하는 방향을 승인했다.

이 Decision은 더 이상 활성 병합 게이트가 아니다. 이후 검증에는 `GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`을 사용한다.

```yaml
local_matrix_required: false
local_manifest_required: false
claim_local_matrix_pass: false
historical_pr85_execution:
  windows_py311: FAIL_TOOLING
  windows_py312: FAIL_TOOLING
  windows_py313: FAIL_TOOLING
  wsl_ubuntu_py312: FAIL_TOOLING
  product_validation_reached: false
```
