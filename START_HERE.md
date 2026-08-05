# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base | `v9.4.3` |
| Main 정본 커밋 | `a27b75ea9aabcbb84159356b857e22b3acd30a43` |
| 이전 Main Sync | `GR-SYNC-20260804-12-CLOSURE` |
| 현재 Working Sync | `GR-SYNC-20260806-01` |
| 최신 Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| 정본 상태 | `WORKING_BRANCH_GITHUB_AND_SHEET_SYNC_IN_PROGRESS` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

새 결정은 3×3 회로의 위상·대상 노드·일반 보조 2개 상한·숫자 성공률 금지를 대체한다. Typed glyph Stock, 명시적 Commit, 자동 대상·자동 Commit 금지, 모든 주문 마나 소모는 유지한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
7. `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
8. `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
9. `docs/planning/MANA_SYSTEM.md`
10. `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`

## 핵심 재미

> 상황을 조사하고 의도를 정한 뒤, 글자·별형 회로·대상 키워드로 주문을 설계하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 별형 글자 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 변화 → 복기
```

## FIVE_POINT_STAR 주문

```yaml
layout: FIVE_POINT_STAR
main: exactly_1_center
auxiliaries: 0_to_5_vertices
target: selected_after_circuit_preview_by_keyword
numeric_success_preview: required
hidden_vertex_bonus: prohibited
```

보조 슬롯은 최대 용량이며 전부 채우지 않아도 된다. 대상은 회로 안에 배치하지 않는다.

## 숙련도·복잡도

- 각 메인·보조 글자는 `0~100` 독립 숙련도를 가진다.
- 직접 그리기·의미 있는 사용·수업·연습·과제·연구로 숙련한다.
- 학년은 성공률을 직접 더하지 않고 수업 접근과 숙련도 상한을 연다.
- 보조 0~5개의 성공률 패널티: `0,-10,-20,-30,-40,-50%p`.
- 보조 0~5개의 마나 가산: `0,+10,+20,+30,+40,+50%`.
- `PRECISION`: 마나 `+25%`, 성공률 `정밀 숙련도÷10%p`.
- `REDUCTION`: 마나 `10%+절감 숙련도÷10` 감소, 성공률 직접 보너스 없음.
- 1학년 집중 숙련 기준: 보조 1개 안정, 보조 2개 60% 안정권 경계.

## Stock·필사

- 특정 글자 Stock 1개는 같은 글자 1회 입력을 대체한다.
- 모든 주문 Commit은 마나를 사용한다.
- 완성 주문 원터치 Stock은 사용하지 않는다.
- 직접 그리기와 Stock은 같은 주문 결과·마나·성공 공식을 사용한다.
- 직접 그리기는 숙련도 근거이며 숨은 위력 보너스가 아니다.

## 다음 작업

1. 별형 회로 Mobile Landscape Wireframe.
2. 부분 성공·실패·역류 세부 규칙.
3. 집중 필사 Overlay.
4. Frostbloom UX Map.
5. 제품 프로젝트 생성 후 테스트 우선 구현 계획.

제품 구현과 Runtime 검증은 아직 시작하지 않는다.
