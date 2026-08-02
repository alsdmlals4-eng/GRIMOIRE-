# GRIMOIRE Implementation Entry Cold-Start Override — 2026-08-02

## 우선순위

```yaml
status: ACTIVE_WORKING_BRANCH_OVERRIDE
scope: IMPLEMENTATION_ENTRY_AND_CURRENT_WORK_STATE
supersedes_stale_status_fields_in:
  - START_HERE.md
  - docs/ACTIVE_CONTEXT.md
  - docs/DEVELOPMENT_GATES.md
  - docs/DESIGN_DOCUMENT_REGISTRY.json
preserves_detailed_design_content: true
```

이 문서는 위 파일의 상세 기획 내용을 삭제하거나 대체하지 않는다. 다만 현재 Gate, main/PR/Sync, 플랫폼, Base 정리 상태, 구현·Codex 상태가 충돌할 때 이 문서의 필드가 우선한다.

## 현재 정본 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
planning_contracts: APPROVED_AND_MERGED_TO_MAIN
last_finalized_main: b9e7a6ba3a029c45a59bd20213bc4b7a561609f4
last_completed_sync: GR-SYNC-20260802-20
last_sheet_readback: PASS
grill_counter_before_this_decision: 0_of_10
current_decision: GM-IMPLEMENTATION-ENTRY-01
current_approved_option: A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK
current_batch_counter: 1_of_10
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation: NOT_STARTED
codex_plan: ALLOWED
codex_execution: BLOCKED
next_gate: GM-FOUNDATION-POC-EXECUTION-READINESS-01
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## Base 상태

현재 open Draft PR:

- #38 — Base v9.4.2 planning-first adoption.
- #42 — Base v9.4.3 first-prompt adapter adoption.

두 PR이 같은 Adapter 계층을 다루므로 제품 코드 실행 전 반드시 병합·통합·supersede·close 중 하나로 정리한다.

```yaml
base_execution_identity: UNRESOLVED_MULTIPLE_OPEN_ADOPTION_PRS
product_code_execution: BLOCKED
```

## 구현 진입 의미

승인됨:

- Foundation POC 설계.
- TDD 구현 계획.
- Toolchain·상태 모델·저장·중단복귀·Layout Harness 검증 계약.

아직 승인되지 않음:

- Godot 제품 코드 실행.
- 전체 Vertical Slice 콘텐츠 제작.
- 실제 글자 인식.
- 최종 Art·Audio.
- Boss·완성 Grimoire/Main.

## 첫 읽기 순서

이 Branch 또는 이 결정이 main에 병합되기 전 작업자는 다음 순서로 읽는다.

```text
AGENTS.md
→ 이 Override
→ IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md
→ Mobile Foundation POC Design
→ Mobile Foundation POC Implementation Plan
→ IMPLEMENTATION_ENTRY_01_ADVERSARIAL_REVIEW_2026-08-02.md
→ 기존 START_HERE·ACTIVE_CONTEXT·DEVELOPMENT_GATES·DESIGN_DOCUMENT_REGISTRY
→ 질문 주제의 상세 승인 원본
```

## 직접 정본 갱신 조건

Base PR #38·#42가 정리된 후 다음 파일을 직접 최신화한다.

1. `START_HERE.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/DEVELOPMENT_GATES.md`.
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
5. `skills/PROJECT_BASE_ADAPTER.json`과 생성 View는 Base 채택 PR의 정본만 사용한다.

직접 갱신과 Readback이 끝나면 이 Override는 `ABSORBED_SUPERSEDED`로 전환할 수 있다.
