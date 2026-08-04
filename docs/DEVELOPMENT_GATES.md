# GRIMOIRE 개발·기획 게이트 — 현재 체크포인트

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
draft_sync: GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS
working_pull_request: 61
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
pending_decisions: 3
merge_authorized: false
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## Gate 0 — 정본 복원

main 정본과 PR #61 승인·병합 대기 상태를 구분하고, 세 승인 Decision·두 구현 계획·Batch·Sheet를 같은 경로로 복원한다.

현재: `PASS_ON_DRAFT / SHEET_READBACK_PASS`.

## Gate 1 — 핵심 재미

```text
조사 → 의도 선택 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

보관함과 범용 Stock은 입력 준비 방식만 바꾸며 회로 판단을 우회하지 않는다.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — 3×3 회로

메인 1, 인접 8방향 연결, 교차·건너뛰기 금지, 모든 노드 도달 가능, Slice 대상 끝점, 숨은 위치 보너스 금지.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — 보관함·Stock·마나·필사

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_pool: LEARNED_MAIN_OR_SUPPORT
source_selection: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
focus_scribe: EXACT_GLYPH_VAULT_PLUS_1
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

현재: `USER_APPROVED_SPEC_REVIEW_COMPLETE / IMPLEMENTATION_PLAN_READY / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — Vocabulary·문양 인식

```yaml
vocabulary: MAIN_10_SUPPORT_10
slice_runtime: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
input_strokes: 1_to_3
advanced_candidate_max_strokes: 4
ornament_is_recognition_input: false
low_confidence: RETRY_NOT_AUTO_CONFIRM
expansion_gate: HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

검증 항목:

- 의미와 핵심/보조 역할 인지.
- `confusion_matrix`, false accept/reject, retry count.
- 손가락·스타일러스·왼손/오른손 변형.
- 낮은 확신·stale revision·selected-glyph mismatch 안전 처리.
- 장식형이 입력 실루엣을 훼손하지 않는가.

현재: `USER_APPROVED_SPEC / RECOGNITION_PLAN_READY / RUNTIME_DEVICE_HUMAN_NOT_RUN`.

## Gate 5 — 모바일 UX·접근성

검증 항목:

- 핵심/보조 Tray·보관함·Stock의 별도 표시.
- 명시적 자원 출처 선택.
- iOS 44pt·Android 48dp 수준 터치 목표와 Safe Area.
- 필사 중 HP·마나·적 의도·위험 노출.
- 색 외 모양·라벨·아이콘 구분.
- 100%·130%·Android 200% 텍스트 배율.

현재: `BENCHMARK_COMPLETE / PLAN_READY / WIREFRAME_DEVICE_A11Y_NOT_RUN`.

## Gate 6 — 콘텐츠·서사

Frostbloom 복수 해결, 선택지=의도, 교수 예시 비정답, 조사·관찰의 성공률·결말 비공개.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 7 — TDD·작업 운영

```yaml
benchmark: BENCHMARK_AND_PRO_COMPARISON_REQUIRED
executable_work: STRICT_RED_GREEN_REFACTOR
non_executable_work: TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
max_batch_size: 10
early_checkpoint:
  - HIGH_RISK_CONFLICT
  - SESSION_END_OR_CONTEXT_LOSS
  - MAJOR_CANON_IMPACT
```

TDD 증거:

```yaml
initial_red: 30925666145
capacity_red: 30928418370
entrypoint_red: 30928799903
charge_lifecycle_red: 30929106014
spec_review_and_plan_red: 30958182618
planning_and_adversarial_green: 30958977292
godot_toolchain_green: 30958977145
```

현재: `DOCUMENT_CONTRACT_RED_GREEN_PASS / PRODUCT_TDD_NOT_STARTED`.

## Gate 8 — 개발환경

Godot `4.7.1.stable` 계약 테스트·실제 다운로드·headless probe·export template 검증은 CI에서 성공했다. 제품 프로젝트·Runtime 증거는 없다.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 9 — 구현 계획

```text
Resource Foundation POC
→ Resource Stop Gate
→ Vocabulary Recognition POC
→ Human·Device Gate
```

- Resource 계획은 자원·예약·Commit·저장·View Model을 순수 상태 계층으로 구현한다.
- Recognition 계획은 6종 데이터·`$1/$N`·후보/확신·혼동 보고서를 구현한다.
- 두 계획을 하나의 검토 없는 커밋 묶음으로 실행하지 않는다.

현재: `PLANS_COMPLETE / EXECUTION_NOT_STARTED`.

## Gate 10 — 정본 동기화·병합

```yaml
pull_request: 61
draft: true
decisions: 3_of_10
sheet_write: PASS
sheet_readback: PASS
exact_head_ci: RECHECK_AFTER_FINAL_AUTHORITY_UPDATE
unresolved_review_threads: CHECK_PENDING
merge_required: false
merge_authorized: false
```

PR #61은 Draft·미병합이다. 최신 exact-head CI, 적대적 P0/P1 0, Review Thread 확인과 별도 병합 승인 전에는 Ready 전환하거나 병합하지 않는다.

## 다음 작업

최종 권위 문서·Registry·Sync 02 고정 → exact-head CI·Review Thread 검증 → Codex Resource 계획 TDD 실행.
