# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base | `v9.4.3` |
| Main 정본 커밋 | `839129524ba14279141add809fb400383949d5ea` |
| Main Sync | `GR-SYNC-20260804-10-MAIN` |
| 최신 Decision | `GM-3X3-CIRCUIT-STOCK-FOCUS-01` |
| Finalization PR | `#58` |
| Grill Batch | `0/10 / pending 0` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

PR #57로 승인 Decision 5개와 3×3 주문 정본이 main에 병합됐다. PR #58은 main 포인터·Batch reset·Sheet 상태를 확정한다.

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
7. `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
8. Frostbloom 승인 문서
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-10-MAIN.md`

구형 `DRAFT`, `WORKING`, `Stage 0`, `FAIL_CLOSED`, 완성 주문 Stock 문서는 상태 색인의 분류를 우선한다.

## 핵심 재미

> 상황과 위험을 조사해 무엇을 지킬지 선택하고, 글자·대상·회로로 의도를 구현한 뒤 결과와 대가를 책임지는 마법학교 RPG.

```text
조사
→ 의도 선택
→ 3×3 회로
→ Preview
→ Commit
→ 세계 변화
→ 복기·발견
```

전투와 비전투는 같은 주문 문법을 사용한다.

## 주문 정본

```text
글자 노드 + 대상 노드 + 3×3 셀 위치 + 방향성 인접 연결
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
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

주문명은 글자 이름과 별개다. 설계도는 자동 시전이 아닌 참고 회로다.

## Slice 글자

```yaml
main: 열
connection_support: 흐름
modifiers: [집중, 분산]
```

보이고 식별된 전투 참가자는 자동 대상 후보이며 환경·장치·숨은 약점은 관찰·조사 후 열린다.

## 글자 Stock·집중 필사

```text
특정 글자 Stock 1
= 해당 글자 노드 1회 배치 대체
```

- 글자 노드만 Stock 소비.
- 대상·연결선 무료.
- Commit 시 Stock과 주문 마나 사용.
- 완성 주문 원터치 Stock 폐기.

```yaml
focus_scribe_time: 0.25_TEST_VALUE
focus_scribe_mana: 1_per_real_second_TEST_VALUE
success: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation: 1
full_pause: false
```

그리기는 선택적 보충 기능이며 위력 보너스가 없다. 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 사건

- 에일린 로스베르 교수.
- 카시안 렌.
- 모트.
- 상급생 없음.

교수 주문은 하나의 예시이며 정답·필수 루트·채점키가 아니다. 플레이어는 시설 복구·생명 구조·정령 안정화·봉쇄·제압 또는 합리적 미등록 해결을 선택할 수 있다.

## 다음 작업

1. 3×3 회로판 Mobile Landscape Wireframe.
2. 집중 필사 Overlay·시간·마나 UX.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.

제품 구현·Runtime 검증은 아직 시작하지 않는다.
