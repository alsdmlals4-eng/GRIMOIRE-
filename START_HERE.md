# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 승인 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 최신 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| Main 기준 | `9632b203 / GR-SYNC-20260803-06` |
| Working Branch | `agent/foundation-poc-readiness-review` |
| Draft PR | `#57` |
| 최신 Working Sync | `GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS` |
| 최신 승인 Decision | `GM-3X3-CIRCUIT-STOCK-FOCUS-01` |
| 상위 Slice Decision | `GM-SLICE-HEAT-FLOW-OBSERVATION-01` |
| Grill Batch | `5/10 / pending approved 5` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 역할 분리

```text
GPT
= 핵심 재미·콘텐츠·대사·UX·이미지·아트 설계
= 적대적 검토와 GitHub·Sheet 정본 동기화

Codex
= 승인된 설계를 Godot에서 구현
= project.godot·GDScript·Scene·테스트·CI·실기기 검증
```

현재는 창의 기획과 UX 명세 단계이며 제품 구현을 시작하지 않는다.

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
4. `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
5. `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
6. `docs/planning/STOCK_SYSTEM.md`
7. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
8. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS.md`

## 승인된 핵심 재미

> 상황을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자와 대상을 3×3 회로에 배치·연결해 주문을 만들고 결과와 대가를 책임지는 마법학교 RPG.

```text
상황·인물·환경 조사
→ 해결 의도 선택
→ 글자·대상 키워드 확보
→ 3×3 노드 배치·연결
→ 예상 효과·위험 확인
→ 명시적 Commit
→ 세계 변화
→ 복기·마도서 기록
```

## 3×3 주문 회로

```text
글자 노드
+ 대상 키워드 노드
+ 셀 배치
+ 방향성 연결선
= 회로
= 주문 설계
```

```yaml
grid: 3x3
main_glyph_nodes: exactly_1
support_glyph_nodes_slice_max: 2
target_keyword_nodes_slice_max: 4
total_nodes_slice_max: 7
branches_slice_max: 1
crossing_edges: prohibited
```

대상 키워드는 사건 조사 결과 또는 현재 전투 참가자·지형·장치에서 제공한다.

```text
보호 → 집중 → 아군 A
= 단일 강보호

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 다중 분산 보호
```

## 주문명과 글자 조합

주문명은 글자 이름과 별개다.

```text
열 + 폭발 + 투사·충돌 배치
→ 「파이어볼」
```

같은 글자도 배치·연결·대상 형식이 다르면 다른 주문이 된다. 등록 설계도와 일치하지 않는 유효 회로는 미등록 주문으로 시전하고, 복기 뒤 이름을 붙일 수 있다.

## 글자 Stock

```yaml
stock_scope: 특정_글자별
stock_unit: 글자_노드_1회_배치
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
completed_spell_stock: 금지
target_node_cost: 0
connection_cost: 0
```

- 특정 글자 Stock 1개는 해당 글자를 직접 그리지 않고 노드 1개로 배치한다.
- 글자 노드 배치 시 Stock을 예약하고 주문 Commit 성공 때 마나와 함께 원자 소비한다.
- 완성 주문을 원터치로 발동하는 Stock은 사용하지 않는다.
- 알려진 주문도 3×3 배치·연결·대상 선택을 거친다.

## 집중 필사

직접 그리기는 주문 제작의 필수 입력이 아니라 부족한 글자 Stock을 보충하는 보조 기능이다.

```yaml
state: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
full_pause: false
mana_drain_per_real_second: 1_TEST_VALUE
successful_result: 같은_글자_Stock_+1
```

```text
필사할 숙련 글자 선택
→ 시간이 느려지지만 적·환경은 계속 진행
→ 실제 시간 기준 마나 소모
→ 글자 직접 작성
→ 인식 성공
→ 해당 글자 Stock +1
```

- 자연충전과 소환수 `[스톡]`은 Active Pressure 기준이라 집중 중 실제 시간으로 가속되지 않는다.
- 직접 피해로 실제 HP가 감소하면 필사가 중단되고 미완성 획이 사라진다.
- 직접 그리기에 위력 보너스는 없다.
- 자연충전만으로도 기본 전투가 가능해야 한다.

## Vertical Slice 글자 계약

```yaml
main_glyph: 열
connection_grammar: 흐름
optional_support_glyphs: [집중, 분산]
representative_known_circuit: 열 + 흐름
```

교수의 외곽 주문은 하나의 유효 예시일 뿐 정답·필수·최적·평가기준이 아니다. 자동 판독 없이 텍스트 노벨 조사로 구성 글자를 추론한다.

## 대표 사건 — 서리꽃 온실의 심장

카시안이 닫힌 회수 밸브와 압력을 확인하지 않고 `열 + 흐름`을 사용해 배관 균열과 냉기 누출을 일으킨다. 교수는 외부 확산만 고유 주문으로 막고, 내부 핵·압력·카시안·정령 문제는 플레이어의 3×3 주문 설계에 남긴다.

지속 등장 인물:

- 에일린 로스베르 교수
- 같은 1학년 카시안 렌
- 메인 동반 정령 모트

## 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

## 현재 우선순위

1. 3×3 회로판 Mobile Landscape Wireframe.
2. 집중 필사 캔버스·감속·마나 UX.
3. 서리꽃 온실 사건 UX Map에 회로판 적용.
4. 온실·교수 주문·서리 정령 Art Direction.
5. 선택된 범위의 Codex 구현 명세.

## 현재 하지 않는 것

```text
제품 project.godot 생성
GDScript·Scene 구현
검증하지 않은 Runtime·실기기·성능 PASS 주장
PR 병합
```
