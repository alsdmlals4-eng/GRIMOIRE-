# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
finalization_branch: agent/finalize-3x3-canon-main-sync
finalization_pull_request: 58
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
latest_approved_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

PR #57에서 승인 Decision 5개와 3×3 주문 정본이 main에 병합됐다. PR #58은 main 포인터·Batch reset·Sheet 상태를 확정하는 finalization 단계다.

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
11. 과거 Draft·Working·Sync·대화·추정.

구형 파일은 상태 색인의 `[부분 대체됨]·[대체됨]·[보류]·[구현완료 보관]·[폐기]·[이력]` 분류를 따른다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md
→ docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md
→ Frostbloom 승인 문서
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
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

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 현재 권위다. 과거 상태 Snapshot은 비권위다. 생성 View는 직접 편집하지 않는다.

## 역할 분리

```text
GPT
→ 핵심 재미·콘텐츠·대사·UX·이미지·아트 설계
→ 적대적 검토와 GitHub·Sheet 정본 동기화
→ 선택 범위의 Codex 구현 명세 준비

Codex
→ 승인된 범위의 Godot 구현
→ GDScript·Scene·Resource·테스트·CI·실기기 검증
```

제품 구현은 3×3 Mobile Wireframe과 Frostbloom UX·Art 범위가 준비될 때까지 `[보류]`다.

## 필수 작업 루프

```text
현재 정본·실제 상태 조회
→ 사용자 의도 정의
→ 대안 비교·벤치마킹
→ 중립 권장안
→ 승인 확인
→ 같은 Decision ID로 GitHub·Sheet 반영
→ 적대적 검토
→ 구형 문서 상태 분류
→ UTF-8·NFC·Text Integrity
→ exact HEAD CI·Review·Sheet Readback
→ 승인된 경우 병합
→ main finalization·readback
```

## 프로젝트 코어

> 마법학교 학생이 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임져 마도서에 기록하는 마법 RPG.

```text
조사
→ 의도·우선순위 선택
→ 3×3 회로 설계
→ Preview
→ Commit
→ 세계 변화
→ 결과·대가·발견 복기
```

전투는 같은 주문 문법을 사용하는 여러 해결 방식 중 하나이며 항상 필수는 아니다.

## 3×3 주문 회로

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
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결
= 회로

유효 회로 Commit
= 주문
```

주문명은 글자 이름과 별개다. 등록 주문 설계도는 `NON_BINDING_GHOST_REFERENCE`이며 자동 대상·자동 Stock 예약·자동 Commit을 하지 않는다.

## Slice 글자·대상

```yaml
main: HEAT
connection_support: FLOW
modifiers: [FOCUS, DISPERSE]
```

- 보이고 식별된 전투 참가자는 자동 대상 후보다.
- 환경·장치·숨은 약점은 관찰·조사 후 열린다.
- 핵심 생명 안전 대상은 복수 경로로 확인 가능해야 한다.
- UI는 정답 대상을 추천하지 않는다.

## 글자 Stock·마나

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
```

글자 노드 배치 때 같은 글자 Stock을 예약하고 Commit 성공 시 Stock·주문 마나·결과를 원자 처리한다. 취소·실패 시 소비하지 않는다.

## 집중 필사

```yaml
state: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
success: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation_on_entry: 1
full_pause: false
```

- 진입 시 용량 한 칸을 예약한다.
- 적·환경은 느린 Active Pressure로 계속 진행한다.
- 자연충전·소환수 주기는 Active Pressure 기준이다.
- 직접 HP 피해·마나 0·제어 상태·Focus loss에서 중단한다.
- 그림 정확도는 위력·효율·지급량 보너스를 주지 않는다.
- 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 보호 경계

교수는 외부 확산만 막는 하나의 주문 예시를 보여준다. 교수 방식은 정답·필수 루트·최적해·채점키가 아니다. 선택지는 의도만 확인하고 주문은 플레이어가 3×3 회로로 구현한다. 합리적 미등록 해결을 허용한다.

```text
자동 글자 판독
교수 회로 복사
숫자 성공 확률
결말 미리보기
강제 전투
단일 진엔딩
= 금지
```

## 교육 개입

```yaml
L0: 정상 시행착오 관찰
L1: 놓친 조건 방향 제시
L2: 돌이킬 수 없는 위험 전 경고
L3: 즉각적 생명 위험만 직접 구조
```

## 검증 경계

Godot 4.7.1 개발환경 CI probe는 통과했지만 제품 `project.godot`, Runtime, 모바일 실기기, 성능, 접근성, 사람 검증은 미실행이다. TEST 값은 상용 확정값으로 주장하지 않는다.

## 다음 우선순위

1. 3×3 Mobile Landscape Wireframe.
2. 집중 필사 Overlay.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.
