# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base | `v9.4.3` |
| Main 정본 커밋 | `39da99fbc56ccdf90904b24b5725cb0d0779595a` |
| Main Sync | `GR-SYNC-20260804-11-MAIN-READBACK` |
| 최신 Decision | `GM-3X3-CIRCUIT-STOCK-FOCUS-01` |
| Readback PR | `#59` |
| Grill Batch | `0/10 / pending 0` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

PR #57에서 정본 Decision을 병합했고 PR #58에서 main 포인터와 Batch를 finalization했다. PR #59는 finalization SHA·Sheet Readback을 기록한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
7. `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
8. Frostbloom 승인 문서
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-11-MAIN-READBACK.md`

## 핵심 재미

> 상황을 조사하고 의도를 정한 뒤, 글자·대상·3×3 회로로 주문을 설계하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화 → 복기
```

## 주문

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Commit = 주문
```

```yaml
main: exactly_1
supports: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

Slice는 `열` 메인, `흐름` 연결 보조, `집중·분산` 수정 보조를 사용한다.

## Stock·필사

- 특정 글자 Stock 1개는 같은 글자 노드 1회 배치를 대체한다.
- 대상·연결선은 Stock 무료다.
- 모든 주문 Commit은 마나를 사용한다.
- 완성 주문 원터치 Stock은 폐기됐다.
- `[집중 필사]`: `0.25배 TEST`, 실제 시간 `마나 1/초 TEST`, 같은 글자 Stock `+1`, 진입 시 용량 `1` 예약.
- 그리기는 선택 기능이며 위력 보너스가 없다.

## Frostbloom

에일린 교수, 카시안, 모트가 등장한다. 교수 주문은 하나의 예시일 뿐 정답·필수 루트·채점키가 아니다. 시설 복구·생명 구조·정령 안정화·봉쇄·제압·합리적 미등록 해결을 허용한다.

## 다음 작업

1. 3×3 Mobile Landscape Wireframe.
2. 집중 필사 Overlay.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.

제품 구현과 Runtime 검증은 아직 시작하지 않는다.
