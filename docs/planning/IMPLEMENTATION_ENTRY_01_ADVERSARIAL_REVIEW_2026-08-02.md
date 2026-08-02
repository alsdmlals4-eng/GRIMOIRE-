# GM-IMPLEMENTATION-ENTRY-01 — 적대적 검토

## 판정

```yaml
decision_id: GM-IMPLEMENTATION-ENTRY-01
review_status: PASS_FOR_CONDITIONAL_DESIGN_AND_PLAN
execution_status: BLOCKED
approved_scope: FOUNDATION_POC_ONLY
p0_open: 0
p1_open_for_execution: 3
p2_open: 4
implementation: NOT_STARTED
codex_plan: ALLOWED
codex_execution: BLOCKED
current_main_before_pr43_merge: c114343ac925d734caf0ac8011c8ee25fd6d29e8
base_release_on_main: 9.4.3
base_pr_38: MERGED
base_pr_42: CLOSED_SUPERSEDED
base_pr_44: MERGED
```

현재 상태에서 전체 Vertical Slice 구현을 시작하는 것은 승인하지 않는다. Foundation POC 설계와 TDD 계획은 진행할 수 있지만, 제품 코드 실행은 아래 P1이 닫힐 때까지 차단한다.

## 검토 근거

- main의 `skills/PROJECT_BASE_ADAPTER.json`은 Base v9.4.3을 단일 release identity로 채택한다.
- v9.4.3은 기존 planning-first 및 external-AI 경계를 보존하고 first-prompt governance를 추가한다.
- `docs/DEVELOPMENT_GATES.md`는 전체 구현 전 BOSS·Grimoire·Audio·통합 검수와 Base 정합화를 요구한다.
- `docs/ACTIVE_CONTEXT.md`는 제품용 project·Scene·Script·Resource가 없다고 선언한다.
- PR #42는 supersede 종료됐고 대체 PR #44가 병합되어 Base PR 중첩 문제는 해소됐다.

## 해소된 P1

### P1-BASE-IDENTITY-01 — RESOLVED

```yaml
pr_38: MERGED
pr_42: CLOSED_SUPERSEDED
pr_44: MERGED
base_release: 9.4.3
single_identity: true
```

Base identity 자체는 더 이상 코드 실행 차단 이유가 아니다. 다만 구현 계획은 v9.4.3 최종 main에 재대조해야 한다.

## P1 — 실행 차단 문제

### P1-COLD-START-STALE-01 — 시작 문서의 구형 상태

`docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/DESIGN_DOCUMENT_REGISTRY.json`의 일부 필드가 최신 main·플랫폼·Gate·Base·Sync 상태보다 오래됐다. `START_HERE.md`와 Implementation Entry Override는 이번 Branch에서 최신화했다.

위험:

- 콜드 스타트 작업자가 최신 승인과 상충하는 경로로 작업할 수 있다.

현재 완화:

- `START_HERE.md`와 `IMPLEMENTATION_ENTRY_01_COLD_START_OVERRIDE_2026-08-02.md`가 관련 상태 필드에 우선한다.

종료 조건:

- 세 핵심 문서를 직접 최신화하고 Override를 흡수한다.

### P1-TOOLCHAIN-01 — Godot 실행 환경 미검증

Engine candidate는 기록돼 있지만 실제 설치 Binary, Renderer, export template, Android/iOS toolchain 증거가 없다.

종료 조건:

- `tools/check_godot_toolchain.py`를 실행해 Binary와 version을 확인한다.
- Renderer와 export 환경은 별도 증거로 남기며 자동 확정하지 않는다.

### P1-PLAN-BASE-DRIFT-01 — 계획 작성 시점과 실행 main 차이

계획은 Base v9.4.2 및 PR #42 미정리 시점에 작성됐고 main은 이후 v9.4.3으로 전진했다.

종료 조건:

- 실행 직전 v9.4.3 최종 main에서 file path·interface·CI 계약을 다시 검토한다.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01`을 통과한다.

## P2 — POC 중 검증할 문제

### P2-RECOGNITION-01

실제 인식 알고리즘·허용치·Latency가 없다. POC는 결정적 Test Recognizer만 사용하며 실제 품질을 주장하지 않는다.

### P2-RENDERER-01

`gl_compatibility`는 POC 권장 시험값일 뿐 최종 Renderer 결정이 아니다.

### P2-MOBILE-EVIDENCE-01

Viewport Harness는 실기기·Cutout·System gesture·battery·thermal 증거를 대체하지 않는다.

### P2-TEST-FRAMEWORK-01

외부 Godot Test plugin은 평가되지 않았다. POC는 작은 custom Headless runner로 시작하고, 유지보수 비용이 커질 때 별도 Plugin 평가 Gate를 연다.

## 옵션 비교

### A — Foundation POC만 조건부 TDD — 채택

- 기술 위험을 콘텐츠보다 먼저 검증.
- 실제 인식·Asset·Balance를 뒤로 미룸.
- Cold-start·Toolchain·Plan 재검증이 끝날 때까지 실행 차단.

### B — 전체 Slice 즉시 구현 — 기각

- 제품 프로젝트와 후속 Gate가 없어 재작업 위험이 가장 큼.

### C — 모든 설계 완료까지 전면 대기 — 기각

- 안전하지만 입력·저장·중복 적용 위험을 늦게 발견함.

## 변경 금지 경계

Execution Readiness PASS 전:

```text
project.godot 생성 금지
src/** 생성 금지
tests/Godot 실행 코드 생성 금지
최종 Asset·Audio·Content 생성 금지
Adapter·Snapshot 병렬 수정 금지
```

Execution Readiness PASS 후에도 다음은 금지한다.

```text
assets/final/**
audio/final/**
content/chapters/**
content/dialogue/**
ml/**
training-data/**
Boss·완성 Grimoire·Main·Store 구현
```

## 최종 결론

사용자 권장안 승인은 **설계·계획을 통과**시켰고, 사용자 병합 승인은 해당 정본의 병합을 허용했다. 실행은 통과시키지 않는다.

```text
IMPLEMENTATION_ENTRY = APPROVED_CONDITIONAL_FOUNDATION_POC
DOCUMENT_MERGE = USER_AUTHORIZED_AFTER_FINAL_REVERIFY
CODE_EXECUTION = BLOCKED
NEXT_GATE = GM-FOUNDATION-POC-EXECUTION-READINESS-01
```
