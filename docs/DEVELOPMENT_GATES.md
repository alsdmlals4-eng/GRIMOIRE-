# GRIMOIRE 개발·기획 게이트 — 현재 체크포인트

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_pull_request: 61
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
grill_counter: 2_of_10
pending_decisions: 2
merge_authorized: false
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## Gate 0 — 정본 복원

main 정본과 PR #61 승인·병합 대기 상태를 구분하고, 구형 Typed Glyph Stock 계약은 `[부분 대체됨]`으로 표시한다.

현재: `PASS_ON_DRAFT / SHEET_READBACK_PENDING`.

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
natural_charge: UNIVERSAL_STOCK_PLUS_1
focus_scribe: EXACT_GLYPH_VAULT_PLUS_1
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

현재: `USER_APPROVED_SPEC_REVIEW_PENDING / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — 문양·모바일 UX·접근성

검증 항목:

- 입력 문양 1~3획 후보의 의미 인지와 혼동 행렬.
- 장식형이 입력형 실루엣을 훼손하지 않는가.
- 핵심/보조 글자 Tray 전환과 이름·역할 표기.
- 보관함과 범용 Stock의 출처 선택이 직관적인가.
- iOS 44pt·Android 48dp 수준 터치 목표와 Safe Area.
- 필사 중 HP·마나·적 의도·위험 노출.
- 색 외 모양·라벨·아이콘 구분.

현재: `BENCHMARK_COMPLETE / WIREFRAME_AND_DEVICE_NOT_RUN`.

## Gate 5 — 콘텐츠·서사

Frostbloom 복수 해결, 선택지=의도, 교수 예시 비정답, 조사·관찰의 성공률·결말 비공개.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 6 — TDD·작업 운영

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

- Contract test가 먼저 작성됐다.
- 최초 CI가 새 테스트를 실행하지 않는 문제를 조사했다.
- 실행 경로 연결 후 workflow `30925666145`에서 `6 tests / 3 failures / 3 errors` 예상 RED를 확인했다.
- GREEN과 전체 회귀 검증은 진행 중이다.

현재: `RED_PASS / GREEN_PENDING`.

## Gate 7 — 개발환경

Godot `4.7.1.stable` 계약 테스트·실제 다운로드·headless probe는 기존 CI에서 성공했다. 제품 프로젝트·Runtime 증거는 없다. SHA-256 고정 검증은 `[보류/비차단]`이다.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 8 — 정본 동기화·병합

```yaml
pull_request: 61
draft: true
decisions: 2_of_10
sheet_write: PENDING
sheet_readback: PENDING
exact_head_ci: GREEN_PENDING
unresolved_review_threads: CHECK_PENDING
merge_authorized: false
```

사용자 Spec 검토, exact-head CI, 적대적 P0/P1 0, Sheet Readback 전에는 병합하지 않는다.

## 다음 작업

정본·Registry·Sheet 최소 GREEN → exact-head 검증 → 사용자 Spec 검토 → 구현 계획.
