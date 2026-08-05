# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT_MAIN
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
current_main_sync: GR-SYNC-20260806-01
merged_pull_request: 68
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
previous_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
canon_status: SYNCED_TO_MAIN
sheet_readback: PASS
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

## 최신 승인 결정

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`은 다음을 승인한다.

1. 중앙 메인 글자 1개와 별 꼭짓점 보조 글자 0~5개의 `FIVE_POINT_STAR` 회로.
2. 회로 Preview 이후 대상 키워드 선택.
3. 대상 선택 후 최종 마나·숫자 성공률 Preview.
4. 메인·보조 글자별 `0~100` 독립 숙련도.
5. 직접 그리기·의미 있는 사용·수업·과제·연구를 통한 숙련.
6. 학년 직접 성공률 보너스 금지, 수업 접근·숙련도 상한 방식.
7. 보조 개수별 성공률 `0,-10,-20,-30,-40,-50%p`.
8. 보조 개수별 마나 `0,+10,+20,+30,+40,+50%`.
9. `PRECISION`: 마나 +25%, 성공률 `숙련도÷10%p`.
10. `REDUCTION`: 마나 `10%+숙련도÷10` 감소, 성공률 직접 보너스 없음.
11. 1학년 집중 숙련 목표: 보조 1개 안정, 보조 2개 60% 안정권 경계.

## 핵심 재미

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·별형 회로·대상 키워드로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 변화·대가 → 복기
```

## 회로·성공률

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
numeric_success_preview: required
main_base_success: 75_PERCENT_TEST_VALUE
success_complexity: [0, -10, -20, -30, -40, -50]
final_success_clamp: 5_to_98_percent
```

보조가 있을 때 회로 숙련도는 `메인×0.45 + 보조평균×0.35 + 최저보조×0.20`이며, 성공률 보정은 `clamp((회로숙련도-50)×0.5,-25,+25)%p`다.

## 마나·특수 보조

```yaml
mana_complexity: [0, +10%, +20%, +30%, +40%, +50%]
precision_mana: +25%
precision_success: MASTERY_DIV_10_PERCENTAGE_POINTS
reduction_mana: MINUS_10_PLUS_MASTERY_DIV_10_PERCENT
reduction_success: 0_PERCENTAGE_POINTS
minimum_final_mana: MAIN_GLYPH_BASE_MANA
```

모든 비율은 초기 버전에서 합연산하고 최종 마나는 올림 처리한다.

## 숙련도·학년

- 모든 메인·보조 글자는 독립 숙련도 `0~100`을 가진다.
- 직접 그리기와 의미 있는 사용은 숙련 근거다.
- 수업·연습·과제·연구는 새 글자와 상위 숙련 구간을 연다.
- 초기 교육 상한: 기초 70, 중급 80, 고급 90, 완전 이해 100.
- 같은 쉬운 행동 반복에는 숙련 획득 체감 감소가 적용된다.
- 학년 자체는 성공률을 직접 높이지 않는다.

## 이전 결정 대체 경계

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 역사로 보존한다.

대체됨:

- 3×3 셀 회로.
- 회로 내부 대상 노드.
- 인접 연결·교차·건너뛰기·대상 끝점 문법.
- 일반 회로 보조 2개 상한.
- 숫자 성공률 Preview 금지.

유지됨:

- Typed glyph Stock.
- 명시적 Commit.
- 자동 대상·자동 Commit 금지.
- 모든 주문 Commit 마나 소모.
- 접근성 입력과 직접 작성의 동일한 주문 의미.

## Frostbloom

에일린 교수, 카시안, 모트가 등장한다. 교수 주문은 하나의 예시일 뿐 정답·필수 루트·채점키가 아니다. 시설 복구·생명 구조·정령 안정화·봉쇄·제압·합리적 미등록 해결을 허용한다.

## 보류·미검증

- 별형 회로 Mobile Landscape Wireframe.
- 부분 성공·실패·역류의 세부 분포.
- 글자별 실제 마나·위력·지속 수치.
- 제품 Godot 프로젝트와 Runtime 구현.
- 모바일 실기기·성능·접근성·사람 검증.

모든 Prototype 수치는 `PLAYTEST_TUNING_REQUIRED`다.
