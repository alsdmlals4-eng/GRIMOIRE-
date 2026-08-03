# Godot 개발환경 자동 설치·검증 보고서

## 결론

`Stage 0`은 게임 콘텐츠 단계가 아니라 Godot 개발환경 준비를 뜻하던 내부 명칭이었다. 사용자 지시에 따라 별도 승인 차단을 제거하고, Godot이 없으면 자동으로 공식 배포본을 내려받도록 변경했다.

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
user_clarification: MISSING_GODOT_MUST_TRIGGER_DOWNLOAD_NOT_BLOCK
terminology: GODOT_DEVELOPMENT_ENVIRONMENT_SETUP
engine_pin: 4.7.1-stable
official_release_date: 2026-07-14
implementation_status: IMPLEMENTED_AND_CI_VERIFIED
foundation_poc_gameplay_implementation: NOT_STARTED
```

## 실제 변경

다음 파일을 추가·수정했다.

- `tools/setup_godot_toolchain.py`: Windows x86_64·Linux x86_64에서 Godot 4.7.1 stable과 matching Export Template을 공식 다운로드한다.
- `tests/test_godot_toolchain_setup.py`: 플랫폼·URL·정확한 버전·안전한 압축 해제 계약을 검증한다.
- `.github/workflows/validate-godot-toolchain.yml`: PR마다 실제 다운로드와 실행 검증을 수행한다.
- `.gitignore`: 다운로드 결과가 커밋되지 않도록 `.tooling/`을 제외한다.
- `docs/superpowers/plans/2026-08-03-godot-toolchain-setup-implementation-plan.md`: 구현·검증 절차를 기록한다.

## 공식 버전 확인

2026-08-03 기준 Godot 공식 Archive의 최신 안정판은 `4.7.1-stable`이며 `4.8-dev2`는 개발판이다.

사용한 공식 다운로드 Endpoint:

```text
https://downloads.godotengine.org/?flavor=stable&platform=linux.64&slug=linux.x86_64.zip&version=4.7.1
https://downloads.godotengine.org/?flavor=stable&platform=windows.64&slug=win64.exe.zip&version=4.7.1
https://downloads.godotengine.org/?flavor=stable&platform=templates&slug=export_templates.tpz&version=4.7.1
```

## TDD 증거

RED:

```yaml
workflow_run: 30823560427
result: FAILURE_EXPECTED
failure: ModuleNotFoundError tools.setup_godot_toolchain
```

GREEN:

```yaml
workflow_run: 30823725209
result: SUCCESS
contract_tests: PASS
download_engine: PASS
version_check: PASS
headless_probe: PASS
export_templates: PASS
report_artifact: PASS
```

## 실제 실행 증거

```yaml
host: Linux x86_64
requested: 4.7.1-stable
actual_version: 4.7.1.stable.official.a13da4feb
headless_probe: PASS
export_templates: PASS
product_project_created: false
verdict: PASS
artifact_id: 8859959117
artifact_digest: sha256:5d571aa88a02d5559d69525cf0a67ccc4577ad5611c146d406ef35f17fc232d5
```

검증용 `project.godot`은 운영체제 임시 폴더에만 생성되고 실행 종료 후 삭제된다. 저장소 제품 프로젝트는 아직 생성하지 않았다.

## Windows 로컬 실행

Windows x86_64 환경에서 Codex 또는 사용자가 저장소 루트에서 다음 명령을 실행하면 Godot이 없을 때 자동 다운로드된다.

```powershell
python tools/setup_godot_toolchain.py --install-dir .tooling/godot --with-templates --json-report godot-toolchain-report.json
```

설치 위치는 저장소의 `.tooling/godot/`이며 Git에는 포함되지 않는다.

## 기획·디자인과의 관계

Godot 설치 여부는 게임 기획 승인 문제가 아니다. 개발환경 준비는 자동화하며, 기획·디자인의 미확정 항목은 별도 우선순위로 관리한다.

Foundation POC 시작에 필요한 핵심 기획·시스템 구조와 Mobile HUD 명세는 이미 충분하다. 남은 P2 기획은 Vertical Slice 제작 전 병행 확정할 항목이며 Godot 설치나 초기 POC를 막지 않는다.
