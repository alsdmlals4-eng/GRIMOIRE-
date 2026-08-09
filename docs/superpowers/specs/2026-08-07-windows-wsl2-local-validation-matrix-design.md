# Windows + WSL2 Local Validation Matrix Design

```yaml
decision_id: GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01
approval: USER_APPROVED_RECOMMENDED_OPTION_2026-08-07
scope: PR85_AND_SUBSEQUENT_EXACT_HEAD_RECEIPTS
base_main: 312e491c8e9b333cb585b4e0550f80e3aea5f3f7
github_actions: NOT_RUN_BUDGET_BLOCKED
```

## 1. 목적

GitHub Actions 예산이 없는 동안 GRIMOIRE의 기존 Python/Godot 검증을 Windows와 WSL2에서 로컬 재현한다. Actions 결과를 성공으로 가장하지 않고, 현재 PR exact HEAD에 묶인 기계 판독 manifest와 원본 로그를 병합 증거로 사용한다.

## 2. 고정 Matrix

| Lane | Host | Python | 범위 |
|---|---|---:|---|
| `windows-py311` | Windows | 3.11 | 전체 Python `unittest` discovery |
| `windows-py312` | Windows | 3.12 | 전체 Python suite + Godot 4.7.1 + GUT + JUnit + product hash |
| `windows-py313` | Windows | 3.13 | 전체 Python `unittest` discovery |
| `wsl-ubuntu-py312` | WSL2 Ubuntu | 3.12 | 전체 Python suite + Linux Godot 4.7.1 + GUT + JUnit + product hash |

Windows는 Python Launcher의 명시적 버전 선택을 사용한다. WSL은 `wsl.exe -d <distribution> -- bash`로 Ubuntu 명령을 실행한다. 배포판 기본값은 `Ubuntu`이며 매개변수로 변경할 수 있다.

## 3. 구성요소

### Per-lane executor

`tools/run_local_gut_validation.py`가 한 lane의 exact HEAD, clean tree, Python 버전, host, GUT vendor tree, Godot 버전, test exit code, JUnit, production hash를 기록한다. 어떤 단계가 실패해도 manifest는 남기고 non-zero로 종료한다.

### Matrix orchestrator

`tools/run_local_validation_matrix.ps1`가 네 lane을 순차 실행한다. 중간 실패가 있어도 나머지 lane을 실행해 전체 진단을 수집하되 최종 exit code는 실패다.

### WSL entrypoint

`tools/run_local_validation_matrix_wsl.sh`가 WSL 내부 Python 3.12와 Linux Godot 4.7.1을 고정하고 WSL lane manifest를 생성한다.

### Aggregator

`tools/local_validation_matrix.py`가 네 manifest를 읽어 lane ID, exact HEAD, Python major/minor, host, 결과를 검증하고 `matrix-manifest.json`을 만든다. 누락, 중복, SHA 불일치, 버전 불일치, `PASS` 외 결과가 하나라도 있으면 종합 결과는 `FAIL`이다.

## 4. Evidence Layout

```text
artifacts/local-validation/
  windows-py311/manifest.json
  windows-py312/manifest.json
  windows-py313/manifest.json
  wsl-ubuntu-py312/manifest.json
  matrix-manifest.json
```

각 runtime lane은 자신의 하위 폴더에 `gut-results.xml`, Godot/GUT 로그, toolchain report, pre/post product hash를 둔다. `artifacts/local-validation/`은 `.gitignore`로 제외하며 제품 파일은 수정하지 않는다.

## 5. Python Suite

모든 lane은 다음을 실행한다.

```text
python -m unittest discover -s tests -p test_*.py -v
```

Python version manifest는 실제 인터프리터의 `sys.version_info`에서 생성한다. Windows launcher 또는 WSL 명령이 다른 버전을 선택하면 해당 lane은 실패한다.

## 6. Godot·GUT Runtime

Windows/WSL 3.12 lane은 기존 `tools/setup_godot_toolchain.py`를 각 플랫폼에서 실행해 공식 Godot 4.7.1을 확인한다. GUT 실행 시 Windows는 격리된 `APPDATA`, WSL은 격리된 `HOME`·`XDG_*`를 사용한다. 실행 후 `gut-results.xml`을 evidence 폴더로 복사하고 XML 파싱, 발견 테스트 수 1 이상, 실패 0, pre/post product hash equality를 요구한다.

현재 project `addons/gut` subtree가 공식 v9.7.1 tree와 불일치하므로 full runtime lane은 vendor Gate가 해결될 때까지 fail-closed가 정상이다. 핵심 스크립트 일부가 동일하다는 사실만으로 PASS를 허용하지 않는다.

## 7. 오류 처리

다음 상태는 즉시 lane 실패다.

```text
HEAD_MISMATCH
DIRTY_WORKTREE_BEFORE_VALIDATION
PYTHON_VERSION_MISMATCH
WINDOWS_PYTHON_LANE_MISSING
WSL_DISTRIBUTION_MISSING
WSL_PYTHON_3_12_MISSING
OFFICIAL_GUT_TREE_MISMATCH
GODOT_VERSION_MISMATCH
PYTHON_TEST_FAILURE
GUT_DISCOVERY_ZERO
GUT_TEST_FAILURE
JUNIT_MISSING_OR_INVALID
PRODUCTION_HASH_CHANGED
MATRIX_LANE_MISSING_OR_DUPLICATED
```

## 8. 승인·병합 의미

- GitHub Actions 상태는 계속 `NOT_RUN_BUDGET_BLOCKED`다.
- 로컬 matrix가 PASS해도 독립된 diff review와 Sheet readback은 별도 요구다.
- PR #85에 actual evidence가 붙기 전 `gut_formally_adopted=false`, `merge_authorized=false`다.
- PR #82 Task 2는 계속 차단한다.
