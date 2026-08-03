# GR-SYNC-20260803-07 — Foundation POC Codex 실행 준비 Working Sync

## 현재 상태

```yaml
sync_id: GR-SYNC-20260803-07
status: LOCAL_GODOT_USER_CONFIRMED_CODEX_EXECUTION_PLAN_READY
repository: alsdmlals4-eng/GRIMOIRE-
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
user_clarification: LOCAL_GODOT_ALREADY_INSTALLED_ACTUAL_IMPLEMENTATION_WILL_RUN_IN_CODEX
engine_target: 4.7.1-stable
grill_counter: 1_of_10
pending_approved_decisions: 1
counter_increment: false
```

## 사용자 확인

사용자는 자신의 PC에 Godot이 이미 설치되어 있다고 확인했다.

따라서 작업 구조를 다음처럼 확정한다.

```text
채팅·기획 단계
→ 로컬 Godot 설치 완료로 취급
→ Foundation POC 계획과 Codex 작업 지시문 정본화
→ 제품 코드 실행은 하지 않음

이후 Codex 단계
→ 기존 로컬 Godot 실행 파일 확인
→ --version과 Headless 실행
→ 격리 Worktree에서 TDD 구현
→ Draft PR·검증 보고서 작성
```

Godot 설치 여부는 더 이상 기획 승인 Gate가 아니다. Codex에서 PATH에 실행 파일이 없으면 기존 설치 경로만 확인하며, 기존 설치를 찾을 수 없거나 실행할 수 없을 때만 자동 설치 도구를 복구 수단으로 사용한다.

## Godot 증거 구분

```yaml
user_pc_installation: USER_CONFIRMED_INSTALLED
user_pc_binary_path: TO_BE_RESOLVED_BY_CODEX
user_pc_exact_version: TO_BE_VERIFIED_BY_CODEX
chat_direct_local_execution: NOT_AVAILABLE
ci_actual_version: 4.7.1.stable.official.a13da4feb
ci_download: PASS
ci_headless: PASS
ci_export_templates: PASS
ci_run: 30823725209
artifact_id: 8859959117
```

사용자 확인은 로컬 설치 상태의 권위다. 다만 실제 로컬 버전·Headless 결과는 Codex가 명령을 실행한 뒤 기록한다.

## 새 책임 원본

- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- 기존 상세 계획: `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.
- Toolchain 보고: `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.

기존 계획의 Task 1 `Godot Toolchain 대기·차단`은 폐기한다. 기존 계획의 Tasks 2–12는 새 Overlay 아래에서 유지한다.

## Codex 구현 허용 상태

```yaml
foundation_poc_core_planning: SUFFICIENT_TO_START
foundation_poc_build_scope: AUTHORIZED_FOR_LATER_CODEX_SESSION
codex_execution: READY_NOT_RUN
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_evidence: NOT_RUN
```

Codex 허용 범위:

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

금지 범위:

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

## 기획·디자인 상태

Foundation POC 시작을 막는 필수 기획은 없다.

개발과 병행할 P2 항목:

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
12. Vertical Slice 콘텐츠 조립과 실제 사람 검증.

이 항목은 Foundation POC 기반 구현을 막지 않는다.

## 다음 작업

```text
1. PR #57의 계획·인계 문서·상태 동기화 검증
2. 사용자 병합 정책에 따라 PR #57 처리
3. 이후 Codex에서 최신 main 기반 Worktree 생성
4. 기존 로컬 Godot 확인
5. Codex Execution Overlay Task 0부터 TDD 구현
6. Foundation POC Stop Gate와 Draft PR
```

## 실행하지 않은 것

```text
제품용 project.godot 생성 = NOT_STARTED
GDScript 제품 코드 = NOT_STARTED
Godot Runtime 테스트 = NOT_RUN_IN_CHAT
모바일 실기기 = NOT_RUN
성능·배터리·발열 = NOT_RUN
접근성 보조기술 = NOT_RUN
사람 플레이테스트 = NOT_RUN
```
