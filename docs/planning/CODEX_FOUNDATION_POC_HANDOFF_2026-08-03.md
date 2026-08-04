# Codex Foundation POC 실행 인계서

## 현재 상태

```yaml
project: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
base_release: v9.4.3
engine_target: Godot 4.7.1 stable
local_godot: USER_CONFIRMED_INSTALLED
chat_local_verification: NOT_AVAILABLE
ci_toolchain: VERIFIED
ci_actual_version: 4.7.1.stable.official.a13da4feb
foundation_poc_product_code: NOT_STARTED
codex_implementation: AUTHORIZED_FOR_LATER_CODEX_SESSION
```

사용자는 자신의 PC에 Godot이 설치되어 있다고 확인했다. 따라서 Codex에서는 Godot 설치 승인을 다시 묻지 않는다. 실행 파일이 PATH에 없으면 기존 설치 경로만 확인한다. 기존 설치를 찾을 수 없거나 실행할 수 없을 때만 `tools/setup_godot_toolchain.py`를 복구 수단으로 사용한다.

## Codex 시작 순서

1. `AGENTS.md`를 읽는다.
2. `START_HERE.md`를 읽는다.
3. `docs/ACTIVE_CONTEXT.md`를 읽는다.
4. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`를 읽는다.
5. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`를 읽는다.
6. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`를 호환성 제약으로 읽는다.
7. 별도 Git worktree와 `codex/foundation-poc` 브랜치를 만든다.
8. 기존 Godot 실행 파일과 버전을 확인한다.
9. TDD로 Foundation POC를 구현한다.
10. Draft PR과 검증 보고서를 만든다.

## Codex에 전달할 작업 지시문

```text
alsdmlals4-eng/GRIMOIRE- 저장소의 최신 main을 기준으로 Foundation POC를 실제 구현하라.

먼저 저장소의 AGENTS.md, START_HERE.md, docs/ACTIVE_CONTEXT.md와 아래 두 구현 계획을 읽어라.

1) docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md
2) docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md

사용자 PC에는 Godot이 이미 설치되어 있다. Godot 설치 여부를 승인 Gate로 사용하거나 사용자에게 설치 승인을 다시 묻지 마라. 먼저 기존 실행 파일을 찾고 --version을 실행하라. PATH에 없으면 설치 경로만 확인하라. 기존 설치를 찾을 수 없거나 실행 불가능한 경우에만 tools/setup_godot_toolchain.py를 복구 수단으로 사용하라.

Godot 목표 버전은 4.7.1 stable이다. CI에서 4.7.1.stable.official.a13da4feb 다운로드, headless 실행, Export Template 검증이 완료되어 있다.

superpowers:using-git-worktrees를 사용해 격리된 worktree와 codex/foundation-poc 브랜치를 만들고 작업하라. 구현은 반드시 TDD로 진행한다. 각 기능마다 실패 테스트를 먼저 실행하고, 최소 구현으로 통과시킨 뒤 전체 회귀 테스트를 실행하고 작은 커밋을 남겨라.

구현 범위:
- 최소 project.godot
- Headless GDScript 테스트 Runner
- Focus Task Reducer
- Atomic Result Ledger와 exactly-once
- Stroke ownership
- Deterministic test recognizer
- Writing Session의 stale result와 confidence guard
- Snapshot schema v1
- Atomic save와 backup recovery
- Pause/resume와 draft 복구
- Mobile Landscape POC Harness
- Safe area와 layout matrix
- Scope guard
- GitHub Actions 검증
- Validation Report와 Stop Gate

금지 범위:
- 실제 글자 인식 ML
- training data
- final art/audio
- Boss
- 전체 Main/Grimoire 제작 UI
- 전체 Chapter 콘텐츠
- 최종 밸런스와 경제
- Foundation POC 밖의 리팩터링

모든 POC 화면에 POC / TEST_VALUE / NOT_CONTENT_COMPLETE를 표시하라. 승인된 Mobile Summon HUD의 좌측 MAIN/S1/S2/S3 compact rail을 나중에 붙일 수 없게 만드는 고정 레이아웃을 만들지 마라.

완료 전 다음을 검증하라.
- Python Base/Toolchain/Scope 테스트
- Godot headless unit/integration 전체
- duplicate transaction apply count = 1
- pause/resume completed draft loss = 0
- active stroke persistence = 0
- layout matrix required context visibility = PASS
- final-content forbidden path = 0

실기기, 성능, 배터리, 발열, 접근성 보조기술, 사람 플레이테스트를 실제로 하지 않았다면 NOT_RUN으로 남겨라. PASS로 추정하지 마라.

작업 완료 후 Draft PR을 만들고 exact HEAD, 실행 명령, 테스트 결과, 생성한 증거 파일, 남은 NOT_RUN 항목을 보고하라. 자동 병합하지 마라.
```

## 제품 구현 전에 더 필요한 기획

Foundation POC 구현을 막는 필수 기획은 없다. 다음 항목은 Vertical Slice를 완성하기 전에 개발과 병행해서 구체화한다.

- 전투 수치와 난이도
- 결과 평가·등급
- 대표 제작 미니게임
- Main·Grimoire 화면의 최종 정보구조
- Audio 방향
- 접근성 옵션
- 1학년 Chapter Map
- 글자 Catalog
- 성장·평가·경제
- Slice 시간 예산

## 완료 경계

이 인계서 작성은 제품 코드 구현 완료를 뜻하지 않는다. 실제 `project.godot`, `src/**`, Scene, 테스트 실행과 Runtime 증거는 Codex 세션에서 생성한다.