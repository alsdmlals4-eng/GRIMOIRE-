# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base | `v9.4.3` |
| Main 기준 | `9632b203 / GR-SYNC-20260803-06` |
| Working Branch | `agent/foundation-poc-readiness-review` |
| PR | `#57 / merge authorized` |
| Working Sync | `GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS` |
| 최신 Decision | `GM-3X3-CIRCUIT-STOCK-FOCUS-01` |
| Grill Batch | `5/10 / pending 5 / user-authorized early flush` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
6. `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
7. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
8. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
9. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
10. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

과거 `DRAFT`, `WORKING`, `Stage 0`, `FAIL_CLOSED`, 완성 주문 Stock 문서는 상태 색인의 분류를 우선한다.

## 핵심 재미

> 상황과 위험을 조사해 무엇을 지킬지 선택하고, 글자·대상·회로로 의도를 구현한 뒤 결과와 대가를 책임지는 마법학교 RPG.

```text
조사
→ 의도 선택
→ 3×3 회로 설계
→ Preview
→ Commit
→ 세계 변화
→ 복기·발견
```

전투와 비전투는 같은 주문 문법을 사용한다.

## 주문

```text
글자 노드
+ 대상 키워드 노드
+ 3×3 셀 위치
+ 방향성 인접 연결
= 회로

유효 회로 Commit
= 주문
```

```yaml
main_glyph: exactly_1
support_glyphs_slice: 0_to_2
targets_slice: 1_to_4
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
skip_connection: prohibited
slice_target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

주문명은 글자 이름과 별개다. 알려진 주문 설계도는 자동 시전이 아닌 반투명 참고 회로다.

## Slice 글자

```yaml
main: 열
connection_support: 흐름
modifiers: [집중, 분산]
```

- `보호 → 집중 → 아군 A`: 단일 강보호.
- `보호 → 분산 → 아군 A/아군 B`: 다중 분산 보호.

보이고 식별된 전투 참가자는 자동 대상 후보가 된다. 환경·장치·숨은 약점은 관찰·조사 후 열린다.

## 글자 Stock

```text
특정 글자 Stock 1
= 그 글자 노드 1회를 직접 그리지 않고 배치
```

- 글자 노드만 Stock 소비.
- 대상 노드·연결선 무료.
- 글자 배치 시 예약, Commit 성공 시 마나·결과와 원자 소비.
- 완성 주문 원터치 Stock 폐기.
- 자연충전은 특정 글자 1종씩 Active Pressure 기준.

## 집중 필사

```yaml
active_pressure_scale: 0.25_TEST_VALUE
mana_drain: 1_per_real_second_TEST_VALUE
success: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation: 1
full_pause: false
```

집중 필사 시작 시 용량 한 칸을 예약한다. 적·환경은 느리게 계속 진행하며, 자연충전·소환수 주기는 실제 시간이 아니라 Active Pressure 기준이다. 직접 HP 피해·마나 0·제어 상태·Focus loss에서 중단한다.

그리기는 위력 보너스를 주지 않으며 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 사건

등장:

- 에일린 로스베르 교수.
- 카시안 렌.
- 모트.

교수는 외부 냉기 확산만 막는 하나의 주문 예시를 보여준다. 그 회로는 정답·필수 루트·채점키가 아니다.

플레이어는 시설 복구, 카시안·묘목 구조, 정령 안정화, 봉쇄, 제압 또는 합리적 미등록 해결을 선택할 수 있다. 선택지는 의도를 확인할 뿐 주문을 자동 선택하지 않는다.

## 현재 병합 절차

```text
구형 문서 상태 분류
→ 정본·Sheet 동기화
→ PR #57 최신 HEAD CI·Review 확인
→ PR #57 병합
→ 별도 finalization PR
→ main 포인터·Batch 0/10·Sheet Readback 확정
```

## 병합 후 다음 작업

1. 3×3 회로판 Mobile Landscape Wireframe.
2. 집중 필사 Overlay·시간·마나 UX.
3. 서리꽃 온실 전체 UX Map 적용.
4. 온실·회로·서리 정령 Art Direction.
5. Asset Brief.
6. 선택 범위 Codex 구현 계획.

## 현재 하지 않는 것

- 제품 `project.godot` 생성.
- GDScript·Scene 구현.
- 실제 검증 없는 Runtime·실기기·성능 PASS 주장.
- 완성 주문 원터치 Stock 재도입.
