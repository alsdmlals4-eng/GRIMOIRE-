# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_branch: agent/glyph-vault-stock-governance-design
working_pull_request: 61
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
related_approved_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
grill_counter: 2_of_10
pending_decisions: 2
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
merge_authorized: false
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

PR #57~#60의 main 정본은 유지된다. PR #61은 사용자가 승인한 자원 의미 변경과 작업 운영 규칙을 기록한 조기 Draft 체크포인트이며 아직 main에 병합되지 않았다.

## 권위 우선순위

1. 사용자의 최신 명시 결정.
2. 이 파일.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. `docs/DEVELOPMENT_GATES.md`.
6. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.
7. 최신 승인 Decision 책임 원본.
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
9. 실제 제품 코드·테스트·Runtime 증거.
10. Base pin·공유 Skill 계약.
11. 과거 Draft·Working·Sync·추정.

구형 파일은 상태 색인의 `[부분 대체됨]·[대체됨]·[보류]·[구현완료 보관]·[폐기]·[이력]` 분류를 따른다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ 새 보관함·Stock 승인과 Spec
→ 새 운영 승인과 Spec
→ 3×3 회로 승인·Spec [자원 범위 부분 대체됨]
→ Frostbloom 승인 문서
→ Batch
→ PR #61
```

## Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

Base 공용 승격은 프로젝트 증거가 생긴 뒤 검토한다. 현재 Base의 병행 PR #134·#136·#137과 충돌 가능성이 있으므로 이번 작업에서 Base 파일을 변경하지 않는다.

## 역할 분리

```text
GPT → 핵심 재미·콘텐츠·대사·UX·이미지·아트·벤치마킹·적대적 검토·정본 동기화
Codex → 승인 범위의 Godot 구현·TDD·Runtime·실기기 검증
```

제품 구현은 사용자 Spec 검토와 구현 계획 승인 전 `[보류]`다.

## 프로젝트 코어

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도·우선순위 → 3×3 회로 → Preview → Commit → 세계 변화 → 복기·발견
```

전투와 비전투는 같은 주문 문법을 쓴다.

## 3×3 회로

```yaml
grid: 3x3
main_glyph: exactly_1
support_glyphs_slice: 0_to_2
targets_slice: 1_to_4
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
skip_connection: prohibited
all_nodes_reachable: required
slice_target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Commit = 주문
```

주문명은 글자 이름과 별개다. 설계도는 `NON_BINDING_GHOST_REFERENCE`이며 자동 대상·자동 자원 예약·자동 Commit을 하지 않는다.

## Slice·대상

```yaml
main: HEAT
connection_support: FLOW
modifiers: [FOCUS, DISPERSE]
```

보이고 식별된 전투 참가자는 자동 대상이며 환경·장치·숨은 약점은 관찰·조사 후 열린다. 정답 대상 자동 추천은 금지한다.

## 보관함·Stock·마나·필사

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
resource_source: EXPLICIT_SOURCE_SELECTION
natural_charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana_per_real_second: 1_TEST_VALUE
full_pause: false
```

- 보관함은 직접 그려 저장한 특정 `glyph_id`에만 사용한다.
- Stock 1개는 사용 시점에 습득한 핵심·보조 글자 중 하나를 선택한다.
- 둘 다 사용 가능하면 출처를 직접 고른다.
- 자연충전은 범용 Stock을, 집중 필사는 특정 글자 보관함을 증가시킨다.
- 직접 그리기는 위력 보너스가 없고 기본 전투의 필수 입력이 아니다.

## 문양 원칙

```yaml
input_glyph:
  preferred_strokes: 1_to_3
  advanced_max_strokes: 4
  contract: SIMPLE_DISTINCT_SEMANTIC_SILHOUETTE
ornamented_display_glyph:
  preserves_input_silhouette: true
  recognition_input: false
```

핵심 단어는 현상을, 보조 단어는 방향·작동 방식을 단순한 실루엣으로 보여준다. 실제 입력형과 장식 표시형은 같은 기본 형태를 공유한다.

## 벤치마크·현업 비교 규칙

```text
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
SOURCE_VERSION_LIMIT_REQUIRED
```

의미 있는 질문과 작업은 프로젝트 사실을 먼저 복원하고 공식 자료·연구·현업 사례를 비교한다. 각 사례에는 출처 시점, 관찰 메커니즘, `transferable_principle`, `project_mismatch_or_limit`, 채택 결론이 있어야 한다. 유명 사례의 외형을 그대로 복제하지 않는다.

## TDD 규칙

```text
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
```

- 실행 가능한 기능·수정은 테스트를 먼저 쓰고 예상 이유의 RED를 실제 실행 경로에서 확인한다.
- 최소 GREEN 후 회귀 테스트를 확인하고 GREEN 상태에서만 Refactor한다.
- 기획·문서·아트는 제작 전에 수용 사례·거부 사례·적대적 실패·증거 한계를 선언한다.
- 자동 판정할 수 없는 재미·직관성·피로도는 실제 검증 전 `HUMAN_NOT_RUN`으로 유지한다.

## 승인 Batch·조기 체크포인트

```text
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

승인 Batch의 최대 크기는 10건이다. 활성 정본 충돌, 세션 종료/컨텍스트 손실 위험, 핵심 루프·자원·작업 규칙 등 큰 정본 영향이 있으면 10건 전에도 Draft 체크포인트를 만든다. 체크포인트는 자동 병합 승인이나 Batch 초기화가 아니다.

## Frostbloom 보호 경계

교수 주문은 하나의 해결 예시이며 정답·필수 루트·최적해·채점키가 아니다. 선택지는 의도를 확인하고 주문은 플레이어가 3×3 회로로 구현한다. 합리적 미등록 해결을 허용한다.

```text
완성 주문 원터치 Stock
Stock 주문 무마나 실행
집중 필사 완전 Pause
그림 위력 보너스
보관함 글자 변환
미습득 글자 Stock 선택
자동 자원 출처 소비
교수 회로 정답화·자동 복사
설계도 자동 대상·자동 Commit
숨은 셀 위치 보너스
숫자 성공률·결말 Preview
= 금지
```

## 검증 경계

Godot 4.7.1 개발환경 CI는 통과했지만 제품 `project.godot`, Runtime, 모바일, 성능, 접근성, 사람 검증은 미실행이다. Prototype 수치는 `TEST_VALUE`다.

## 다음 우선순위

1. 사용자에게 PR #61의 두 Spec 검토 요청.
2. 승인 후 `writing-plans`로 구현 계획 작성.
3. 문양 1차 세트와 3×3 Mobile Landscape Wireframe 수용 테스트 설계.
4. 집중 필사 Overlay.
5. Frostbloom UX Map.
