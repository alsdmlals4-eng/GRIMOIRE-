# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 최신 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| Main 기준 | `9632b203 / GR-SYNC-20260803-06` |
| Working Branch | `agent/foundation-poc-readiness-review` |
| Draft PR | `#57` |
| Working Sync | `GR-SYNC-20260803-07` |
| Grill Batch | `1/10 / pending 1` |
| 현재 Decision | `GM-FOUNDATION-POC-EXECUTION-READINESS-01` |
| 로컬 Godot | `USER_CONFIRMED_INSTALLED` |
| CI Godot | `4.7.1.stable.official.a13da4feb / PASS` |
| Foundation POC 기획 | `SUFFICIENT_TO_START` |
| Codex 실행 계획 | `WRITTEN_READY` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Codex 실행 | `AUTHORIZED_FOR_LATER_CODEX_SESSION / NOT_RUN` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 핵심 결론

- 사용자 PC에는 Godot이 설치되어 있다고 사용자가 확인했다.
- Godot 설치 여부는 더 이상 기획 승인 Gate가 아니다.
- 채팅에서는 제품 구현을 하지 않는다.
- 실제 `project.godot`, GDScript, Scene, Headless 테스트는 이후 Codex에서 수행한다.
- Foundation POC 시작을 막는 필수 기획·디자인은 없다.
- 남은 P2 기획은 Vertical Slice 개발과 병행한다.

## 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
4. `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
5. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
6. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.
7. `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.
8. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
9. `docs/DEVELOPMENT_GATES.md`.
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

## Codex 시작 규칙

```text
최신 main 확인
→ 격리 Worktree와 codex/foundation-poc 브랜치 생성
→ 기존 로컬 Godot 실행 파일 찾기
→ --version 실행
→ Headless baseline 확인
→ TDD로 Foundation POC 구현
→ Validation Report와 Stop Gate
→ Draft PR
```

- 기존 Godot이 사용 가능하면 재설치하지 않는다.
- PATH에 없으면 기존 설치 경로만 확인한다.
- 기존 설치를 찾을 수 없거나 실행 불가능할 때만 `tools/setup_godot_toolchain.py`를 복구 수단으로 사용한다.
- Godot 설치 승인을 다시 묻지 않는다.

## Foundation POC 허용 범위

```text
project.godot
src/core/**
src/input/**
src/persistence/**
src/platform/**
src/ui/**
src/app/**
tests/test_case.gd
tests/test_runner.gd
tests/unit/**
tests/integration/**
tools/check_foundation_poc_scope.py
.github/workflows/validate-foundation-poc.yml
artifacts/foundation-poc/**
docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md
docs/planning/FOUNDATION_POC_STOP_GATE_01_<date>.md
```

## Foundation POC 금지 범위

```text
실제 Glyph Recognition ML
training-data/**
final Art·Audio
Boss
전체 Main·Grimoire 제작 UI
전체 Chapter 콘텐츠
최종 경제·밸런스
Foundation POC 밖의 대규모 리팩터링
```

모든 POC 화면에는 `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`를 표시한다.

## 기존 확정 계약 유지

- Stock: 용량 `8`, 지정 대상 1종 자연충전, `10 + 5 × (n-1)초`, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 보조 역할 중복 금지, 같은 시각 `MAIN → S1 → S2 → S3`.
- Mobile Summon HUD: 좌측 Rail, Contextual Drawer, 안전 Draft 뒤 관리 Pause, ResultLedger exactly-once, Writing Canvas active-stroke 소유.
- Mobile HUD TDD Plan과 Test Matrix는 작성됐지만 실행되지 않았다.

## 남은 기획·디자인

Foundation POC와 병행할 P2 항목:

1. 전투 수치와 난이도.
2. 결과 평가·등급과 기여도.
3. 대표 제작 미니게임.
4. Main·Grimoire 화면 최종 정보구조.
5. Audio 방향.
6. 접근성 옵션.
7. 1학년 Chapter Map.
8. 글자 Catalog.
9. 성장·평가·경제.
10. Slice 시간 예산.
11. 추가 현장실습 Preview.
12. 실제 사람 검증을 포함한 Vertical Slice 조립.

이 항목은 초기 Foundation POC 구현을 막지 않는다.

## 현재 검증 경계

```text
LOCAL_GODOT_INSTALLATION = USER_CONFIRMED
LOCAL_GODOT_BINARY_AND_VERSION = TO_BE_VERIFIED_BY_CODEX
CI_GODOT_4_7_1 = PASS
FOUNDATION_POC_PLAN = READY
GODOT_PRODUCT_PROJECT = NOT_CREATED
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = AUTHORIZED_NOT_RUN
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## 다음 순서

1. PR #57의 계획·인계·상태 동기화를 검증한다.
2. 사용자 병합 정책에 따라 PR #57을 처리한다.
3. 이후 Codex에서 `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`를 사용한다.
4. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md` Task 0부터 구현한다.
5. Foundation POC Stop Gate와 Draft PR까지 완료한다.