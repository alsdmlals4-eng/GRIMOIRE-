# Spell 마법 글자·3×3 회로 문법 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
previous_decision: GM-CIRCUIT-01
updated_at: 2026-08-04T09:37+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 핵심 정의

```text
마법 글자
= 마법적 의미를 가진 최소 기능 단위

회로
= 3×3 셀에 글자·대상 노드를 배치하고 방향성 연결로 구성한 문법

주문
= 유효한 회로를 명시적으로 Commit한 실행 단위
```

주문명은 글자 이름과 별개다. 같은 글자도 위상·순서·대상 형식에 따라 다른 주문이 된다.

## 노드 종류

```yaml
MAIN_GLYPH:
  count: exactly_1
  role: 중심 현상·변화

SUPPORT_GLYPH:
  count_slice: 0_to_2
  subtypes:
    - CONNECTION_SUPPORT
    - MODIFIER
    - SHAPE
    - TIMING
    - STABILITY

TARGET_KEYWORD:
  count_slice: 1_to_4
  role: 효과가 도달하는 인물·적·시설·지형·구역
```

Vertical Slice의 `열`은 메인 글자, `흐름`은 `CONNECTION_SUPPORT`, `집중·분산`은 보조 글자다.

## 3×3 위상 규칙

```yaml
grid: 3x3
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
edge_direction: required
skip_connection: prohibited
crossing_edges: prohibited
all_nodes_reachable_from_main: required
slice_target_nodes: TERMINAL_LEAF
multiple_main_glyphs: prohibited
hidden_position_bonus: prohibited
```

- 가로·세로·대각선으로 한 칸 인접한 노드만 연결한다.
- 노드나 빈 셀을 건너뛰는 연결은 만들 수 없다.
- 위치는 연결 가능성과 분기 형태를 결정한다.
- 중앙·모서리·거리·선 길이에는 숨은 위력·마나·성공률 보너스가 없다.
- Slice의 대상 노드는 회로의 끝점이다.
- 고학년의 매개체 통과·복수 분기·하위 회로는 별도 승인 전 도입하지 않는다.

## 대상 제공

```yaml
visible_identified_combatants: AUTO_LIST
observed_environment_or_device: LIST_AFTER_OBSERVATION
hidden_part_or_weakness: LIST_AFTER_INVESTIGATION
critical_safety_target: MULTI_ROUTE_DISCOVERABLE
```

대상 후보는 Situation/Combat Snapshot이 제공한다. UI가 임의 대상을 생성하거나 정답 대상을 추천하지 않는다.

## 연결 의미

```text
직접 연결
→ 앞 글자의 결과를 다음 글자·대상에 전달

분기
→ 허용된 보조 글자 뒤에서 여러 대상에 효과 분배

순서
→ 화살표 방향으로 보조 효과 적용
```

예:

```text
보호 → 집중 → 아군 A
= 단일 강보호

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 다중 분산 보호
```

## 검증 순서

1. 메인 글자 정확히 1개.
2. 모든 사용 노드가 메인에서 도달 가능.
3. 모든 연결이 인접 셀 사이.
4. 교차·건너뛰기·고립·금지 순환 없음.
5. 보조 글자와 대상 수 호환.
6. 현재 Snapshot에서 대상 유효.
7. Stock 예약과 마나 충족.
8. 예상 효과·위험·미해결 문제 표시.
9. 명시적 Commit.

## 알려진 주문

```yaml
blueprint_mode: NON_BINDING_GHOST_REFERENCE
auto_reserve_stock: false
auto_target: false
auto_commit: false
auto_best_route: false
```

등록 주문은 참고 위상을 보여줄 수 있지만 자동 시전·자동 정답·자동 대상 선택이 아니다.

## Preview

`confidence`는 성공 확률이 아니라 조사 정보의 충분도다.

```yaml
confidence: [정보_충분, 정보_부분, 정보_부족]
numeric_success_probability: prohibited
ending_reveal: prohibited
```

## 책임 경계

- 글자 Stock·집중 필사: `docs/planning/STOCK_SYSTEM.md`.
- 상세 승인: `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`.
- 상세 Spec: `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`.
- 파일 상태: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.

## 금지

```text
완성 주문 원터치 Stock
복수 메인 글자
연결선 교차·건너뛰기
숨은 셀 위치 보너스
설계도 자동 대상·자동 Commit
성공 확률 숫자 Preview
```
