# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
sheet_readback_pull_request: 59
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 39da99fbc56ccdf90904b24b5725cb0d0779595a
current_main_sync: GR-SYNC-20260804-11-MAIN-READBACK
latest_approved_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

PR #57에서 Decision 5개와 3×3 정본을 병합했고 PR #58에서 main 포인터와 Batch `0/10`을 finalization했다. PR #59는 finalization SHA와 Sheet Readback을 기록하는 행정 단계다.

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
→ 3×3 승인·Spec
→ Frostbloom 승인 문서
→ Batch
→ GR-SYNC-20260804-11-MAIN-READBACK
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

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 현재 권위다. 과거 상태 Snapshot은 비권위다.

## 역할 분리

```text
GPT → 핵심 재미·콘텐츠·대사·UX·이미지·아트·적대적 검토·정본 동기화
Codex → 승인 범위의 Godot 코드·Scene·Resource·테스트·Runtime·실기기 검증
```

제품 구현은 3×3 Mobile Wireframe과 Frostbloom UX·Art 범위가 준비될 때까지 `[보류]`다.

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

주문명은 글자 이름과 별개다. 설계도는 `NON_BINDING_GHOST_REFERENCE`이며 자동 대상·자동 Stock 예약·자동 Commit을 하지 않는다.

## Slice 글자·대상

```yaml
main: HEAT
connection_support: FLOW
modifiers: [FOCUS, DISPERSE]
```

보이고 식별된 전투 참가자는 자동 대상이며 환경·장치·숨은 약점은 관찰·조사 후 열린다. 정답 대상 자동 추천은 금지한다.

## Stock·마나·집중 필사

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana_per_real_second: 1_TEST_VALUE
focus_success: SAME_GLYPH_STOCK_PLUS_1
focus_capacity_reservation: 1
full_pause: false
```

글자 배치 시 Stock을 예약하고 Commit 성공 때 Stock·마나·결과를 원자 처리한다. 필사는 선택적 보충 기능이며 위력 보너스가 없다. 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 보호 경계

교수 주문은 하나의 해결 예시이며 정답·필수 루트·최적해·채점키가 아니다. 선택지는 의도를 확인하고 주문은 플레이어가 3×3 회로로 구현한다. 합리적 미등록 해결을 허용한다.

```text
완성 주문 원터치 Stock
Stock 주문 무마나 실행
집중 필사 완전 Pause
그림 위력 보너스
교수 회로 정답화·자동 복사
설계도 자동 대상·자동 Commit
숨은 셀 위치 보너스
숫자 성공률·결말 Preview
= 금지
```

## 검증 경계

Godot 4.7.1 개발환경 CI는 통과했지만 제품 `project.godot`, Runtime, 모바일, 성능, 접근성, 사람 검증은 미실행이다. 모든 Prototype 수치는 `TEST_VALUE`다.

## 다음 우선순위

1. 3×3 Mobile Landscape Wireframe.
2. 집중 필사 Overlay.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.
