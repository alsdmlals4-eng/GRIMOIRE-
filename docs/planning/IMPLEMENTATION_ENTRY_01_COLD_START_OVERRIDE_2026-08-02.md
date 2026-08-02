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
current_main_before_pr43_merge: c114343ac925d734caf0ac8011c8ee25fd6d29e8
base_release_on_main: 9.4.3
base_adoption_pr_38: MERGED
base_adoption_pr_42: CLOSED_SUPERSEDED
base_adoption_pr_44: MERGED
open_base_adoption_prs: []
last_completed_sync: GR-SYNC-20260802-20
current_working_sync: GR-SYNC-20260802-21
last_sheet_readback: PASS_REVERIFY_REQUIRED_ON_FINAL_HEAD
grill_counter_before_this_decision: 0_of_10
current_decision: GM-IMPLEMENTATION-ENTRY-01
current_approved_option: A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK
current_batch_counter: 1_of_10
current_draft_pr: 43
merge_authorized: true
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

- PR #38은 Base v9.4.2 planning-first 계약을 도입했다.
- 기존 PR #42는 supersede 종료됐다.
- 대체 PR #44가 병합되어 main은 Base v9.4.3 first-prompt governance 정본을 가진다.
- v9.4.3은 planning-first와 external-AI 경계를 보존한다.

```yaml
base_execution_identity: MAIN_V9_4_3_SINGLE_CANONICAL_RELEASE
base_pr_overlap_blocker: RESOLVED
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

## 남은 실행 차단

1. `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/DESIGN_DOCUMENT_REGISTRY.json`을 Base v9.4.3 및 Implementation Entry 상태에 직접 맞춘다.
2. Godot Binary·Version·Renderer·Export 환경을 preflight한다.
3. 구현 계획과 Interface·CI 경계를 최종 main에 재대조한다.
4. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`을 P0=0·P1=0으로 통과한다.

## 첫 읽기 순서

```text
AGENTS.md
→ 이 Override
→ IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md
→ IMPLEMENTATION_ENTRY_01_PREMERGE_GATE_2026-08-02.md
→ Mobile Foundation POC Design
→ Mobile Foundation POC Implementation Plan
→ IMPLEMENTATION_ENTRY_01_ADVERSARIAL_REVIEW_2026-08-02.md
→ 기존 START_HERE·ACTIVE_CONTEXT·DEVELOPMENT_GATES·DESIGN_DOCUMENT_REGISTRY
→ 질문 주제의 상세 승인 원본
```

## 직접 정본 갱신 조건

PR #43 병합과 main·Sheet 최종화 후 다음 파일을 직접 최신화한다.

1. `START_HERE.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/DEVELOPMENT_GATES.md`.
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
5. `skills/PROJECT_BASE_ADAPTER.json`과 생성 View는 PR #44의 Base v9.4.3 정본을 사용한다.

직접 갱신과 Readback이 끝나면 이 Override는 `ABSORBED_SUPERSEDED`로 전환할 수 있다.
