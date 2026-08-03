# GR-SYNC-20260803-07 — Godot 개발환경 자동 설치 Working Sync

## 현재 상태

```yaml
sync_id: GR-SYNC-20260803-07
status: GODOT_TOOLCHAIN_AUTOMATION_IMPLEMENTED_AND_CI_VERIFIED
repository: alsdmlals4-eng/GRIMOIRE-
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
user_clarification: MISSING_GODOT_MUST_TRIGGER_DOWNLOAD_NOT_BLOCK
terminology: GODOT_DEVELOPMENT_ENVIRONMENT_SETUP
engine_pin: 4.7.1-stable
grill_counter: 1_of_10
pending_approved_decisions: 1
```

## 사용자 의도 정정

`Stage 0`은 게임의 스테이지가 아니다. Godot 개발환경 설치·검증을 의미하던 내부 명칭이었다.

사용자는 Godot이 없다는 이유로 작업을 막지 말고 공식 배포본을 다운로드하라고 지시했다. 따라서 다음처럼 변경했다.

```text
이전: Godot 없음 → 증거 없음 → 추가 승인 대기 → 실행 차단
현재: Godot 없음 → 공식 안정판 자동 다운로드 → 버전·Headless·Template 검증 → 결과 보고
```

개발환경 준비는 더 이상 별도 사용자 승인 Gate가 아니다.

## 공식 버전

2026-08-03 기준 공식 최신 안정판:

```yaml
godot: 4.7.1-stable
release_date: 2026-07-14
4_8_status: dev2_not_stable
```

## 구현 파일

- `tools/setup_godot_toolchain.py` — Windows x86_64·Linux x86_64 자동 다운로드·설치·검증.
- `tests/test_godot_toolchain_setup.py` — 플랫폼·공식 URL·정확한 버전·압축 경로 안전성 검사.
- `.github/workflows/validate-godot-toolchain.yml` — PR에서 실제 Godot과 Export Template 다운로드 및 실행.
- `.gitignore` — `.tooling/` 제외.
- `docs/superpowers/plans/2026-08-03-godot-toolchain-setup-implementation-plan.md`.
- `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.

## TDD·실행 증거

```yaml
red_run: 30823560427
red_result: EXPECTED_FAILURE_MODULE_NOT_FOUND
green_run: 30823725209
green_result: SUCCESS
contract_tests: PASS
download_engine: PASS
actual_version: 4.7.1.stable.official.a13da4feb
headless_probe: PASS
export_templates: PASS
artifact_id: 8859959117
artifact_digest: sha256:5d571aa88a02d5559d69525cf0a67ccc4577ad5611c146d406ef35f17fc232d5
product_project_created: false
```

## 기획·디자인 상태

Foundation POC 시작에 필요한 핵심 기획은 이미 충분하다.

완료:

- 핵심 재미와 전체 게임 구조.
- 글자 기반 주문 설계·Commit·결과·마도서 복기.
- Stock 시스템.
- 메인 1 + 보조 S1/S2/S3 소환수 구조.
- State·Ledger·Save 계약.
- Mobile Summon HUD 명세와 TDD 계획.

남은 P2 기획·디자인은 Vertical Slice 제작 전 병행 확정한다.

1. 전투 수치 조정.
2. 결과 등급·기여도 표시.
3. 대표 제작 미니게임.
4. Grimoire Screen.
5. Main Screen.
6. Audio 방향.
7. 접근성·난이도.
8. 1학년 Chapter Map.
9. 글자 Catalog.
10. 성장·평가·경제 수치.
11. Slice 시간 예산.
12. 추가 현장실습 Preview 범위.

이 항목들은 Godot 설치와 Foundation POC 기반 구현을 막지 않는다.

## 남은 기술 작업

1. 현재 공식 Godot 4.7.1 기준 Foundation POC Implementation Plan 재검증.
2. 저장소 정본·Adapter의 오래된 상태 포인터 정리.
3. Foundation POC 제품 구현 범위 확정 후 Godot 프로젝트와 기반 코드 생성.
4. 이후 Runtime·실기기·성능·접근성·사람 검증.

## 경계

```text
GODOT_CI_TOOLCHAIN = INSTALLED_AND_VERIFIED
WINDOWS_LOCAL_INSTALLER = AVAILABLE_NOT_EXECUTED_ON_USER_PC
FOUNDATION_POC_GAMEPLAY = NOT_STARTED
GODOT_PRODUCT_PROJECT = NOT_CREATED
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

ChatGPT가 사용자의 Windows PC에 직접 프로그램을 설치할 수는 없지만, 저장소의 설치 명령은 Windows x86_64를 지원하며 Codex 로컬 환경에서 실행할 수 있다.
