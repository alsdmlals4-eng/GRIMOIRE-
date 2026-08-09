# GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01

```yaml
decision_id: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-07T08:00+09:00
project: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
supersedes: GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01
```

## Decision

GRIMOIRE는 공개 저장소의 표준 GitHub-hosted runner를 공식 PR 검증 권위로 사용한다.

PR #85 bootstrap 단계에서는 다음 네 lane을 실행한다.

- `windows-py311`: Python 3.11 contract
- `windows-py312`: Python 3.12 + Godot 4.7.1 + GUT/JUnit/protected hash
- `windows-py313`: Python 3.13 contract
- `ubuntu-py312`: Python 3.12 + Godot 4.7.1 + GUT/JUnit/protected hash

`GUT Validation Gate`는 네 lane이 모두 성공한 경우에만 성공한다.

## Cost boundaries

- `windows-latest`와 `ubuntu-latest`만 사용한다.
- larger runner와 self-hosted runner를 사용하지 않는다.
- Actions cache와 artifact upload를 사용하지 않는다.
- 로컬 Windows+WSL2 matrix manifest는 필수 병합 증거가 아니다.

## Bootstrap

GitHub의 `pull_request` workflow는 기본 브랜치에 먼저 존재해야 한다. 따라서 PR #85 검증 전에 workflow-only bootstrap PR을 먼저 병합한다. Bootstrap workflow는 PR #85에만 적용하며, PR #85가 병합될 때 일반화된 workflow로 대체될 수 있다.

## Fail-closed

workflow 구성, queued, skipped, 미실행 상태를 PASS로 표시하지 않는다. PR #85는 네 lane, GUT vendor integrity, Godot 4.7.1, GUT discovery, JUnit, protected hash, review, Sheet gate가 모두 통과하기 전에는 병합할 수 없다.
