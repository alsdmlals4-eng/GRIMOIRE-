# GM-FOUNDATION-POC-EXECUTION-READINESS-01 — Godot 개발환경 준비 결정

## 사용자 의도 정정

기존 `Stage 0 Preflight Bootstrap`이라는 표현은 게임 단계처럼 오해될 수 있었고, 개발환경 준비 자체를 불필요한 승인 Gate로 만들었다.

사용자 지시:

> Godot이 없으면 Godot을 다운로드한다. 엔진 부재를 이유로 작업을 막지 않는다.

따라서 이 결정은 다음처럼 수정한다.

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
previous_label: B_STAGE_0_PREFLIGHT_BOOTSTRAP
current_label: GODOT_DEVELOPMENT_ENVIRONMENT_SETUP
user_clarification: MISSING_GODOT_MUST_TRIGGER_DOWNLOAD_NOT_BLOCK
engine_pin: 4.7.1-stable
status: IMPLEMENTED_AND_CI_VERIFIED
counter_increment: false
counter_reason: SAME_DECISION_CLARIFICATION
foundation_poc_product_implementation: NOT_STARTED
```

## 변경된 동작

```text
Godot 존재
→ 정확한 4.7.1 stable인지 검사
→ Headless·Export Template 검사

Godot 부재
→ 공식 Godot 다운로드 Endpoint에서 4.7.1 stable 자동 다운로드
→ matching Export Template 자동 다운로드
→ 정확한 버전·Headless 실행 검사
→ 결과 JSON 보고
```

개발환경 설치·검증에는 추가 사용자 승인이 필요하지 않다.

## 구현

- `tools/setup_godot_toolchain.py`.
- `tests/test_godot_toolchain_setup.py`.
- `.github/workflows/validate-godot-toolchain.yml`.
- `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.

Windows x86_64과 Linux x86_64을 지원한다.

## 검증

```yaml
red_run: 30823560427
red: EXPECTED_FAILURE_BEFORE_IMPLEMENTATION
green_run: 30823725209
green: SUCCESS
actual_version: 4.7.1.stable.official.a13da4feb
headless_probe: PASS
export_templates: PASS
product_project_created: false
```

## 기획·디자인 경계

Foundation POC를 시작하기 위한 핵심 게임 기획과 시스템 명세는 이미 충분하다. 남은 P2 기획은 Vertical Slice 제작 전 병행 확정하며 Godot 설치 또는 초기 POC 기반 작업을 막지 않는다.

이 결정은 아직 게임 제품 프로젝트나 Foundation POC 코드 생성 승인을 뜻하지 않는다. 다음 기술 작업은 Godot 4.7.1 기준 기존 Foundation POC 구현 계획 재검증이다.
