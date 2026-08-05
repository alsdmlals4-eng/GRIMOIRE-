# Spell 마법 글자·별형 회로 문법 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE_WORKING_BRANCH
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
supersedes: GM-3X3-CIRCUIT-STOCK-FOCUS-01
supersession_scope: CIRCUIT_TOPOLOGY_TARGET_PLACEMENT_SUCCESS_PREVIEW_SUPPORT_CAP
updated_at: 2026-08-06T01:44+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_validation: NOT_RUN
human_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

## 핵심 정의

```text
마법 글자
= 마법적 의미를 가진 최소 기능 단위

별형 회로
= 중앙 메인 글자 1개와 별 꼭짓점 보조 글자 0~5개로 구성한 주문 문법

주문
= 회로 Preview와 대상 키워드 선택을 거쳐 명시적으로 Commit한 실행 단위
```

주문명은 글자 이름과 별개다. 같은 글자도 보조 조합·대상 키워드·상황에 따라 다른 주문이 된다.

## FIVE_POINT_STAR 회로

```yaml
layout: FIVE_POINT_STAR
main_glyph:
  position: CENTER
  count: exactly_1
auxiliary_glyphs:
  position: FIVE_VERTICES
  count: 0_to_5
target_nodes_inside_circuit: prohibited
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
duplicate_same_auxiliary: prohibited_initially
hidden_slot_bonus: prohibited
slot_order_effect: deferred_until_separately_approved
edge_drawing: VISUAL_CONNECTION_ONLY_INITIAL_VERSION
```

- 메인 글자는 주문의 중심 현상·변화를 정의한다.
- 보조 글자는 위력·형상·지속·전달·안정·효율 등 주문 운용 방식을 바꾼다.
- 외곽 다섯 슬롯은 초기 버전에서 기능적으로 동등하다.
- 꼭짓점 위치·선 길이·회전 방향에는 숨은 성공률·마나·위력 보너스가 없다.
- 대상은 회로 안에 배치하지 않는다. 회로의 성질을 먼저 확정한 뒤 열린 대상 키워드 중 하나를 선택한다.
- 보조 슬롯은 최대 용량이지 필수 채움 수가 아니다. 메인 단독 주문도 유효하다.

## 주문 작성 흐름

```text
상황 조사
→ 의도·우선순위 결정
→ 중앙 메인 글자 배치
→ 외곽 보조 글자 0~5개 배치
→ 회로 Preview
→ 대상 키워드 선택
→ 최종 Preview
→ 명시적 Commit
→ 마나·Stock·결과 원자 적용
→ 세계 변화·마도서 복기
```

## 대상 키워드

```yaml
visible_identified_combatants: AUTO_LIST
observed_environment_or_device: LIST_AFTER_OBSERVATION
hidden_part_or_weakness: LIST_AFTER_INVESTIGATION
critical_safety_target: MULTI_ROUTE_DISCOVERABLE
auto_best_target: prohibited
auto_commit: prohibited
```

대상 후보는 Situation/Combat Snapshot이 제공한다. UI는 존재하지 않는 대상을 만들거나 정답 대상을 추천하지 않는다.

## 두 단계 Preview

### 1차 회로 Preview

- 생성 주문명.
- 메인·보조 글자 구성.
- 각 사용 글자의 숙련도.
- 대상 선택 전 예상 효과.
- 대상 선택 전 예상 마나·성공률.
- 상충·불안정·미해결 조건.

### 2차 최종 Preview

- 선택 대상 키워드와 범위.
- 최종 마나 소모.
- 숫자 성공률.
- 성공률 상태 라벨.
- 예상 효과 범위.
- 부분 성공 결과.
- 실패·불안정 위험.
- Commit 후 잔여 마나.

```yaml
numeric_success_probability: required
ending_reveal: prohibited
auto_best_route: prohibited
auto_target: prohibited
auto_commit: prohibited
```

## 글자별 숙련도와 회로 숙련도

모든 메인·보조 글자는 각각 `0~100` 숙련도를 가진다. 숙련도는 해당 글자를 직접 그리고 의미 있게 사용하거나, 수업·연습·과제·연구를 통해 얻는다.

```yaml
glyph_mastery: 0_to_100
year_direct_success_bonus: prohibited
education_role: COURSE_ACCESS_AND_MASTERY_CEILING
direct_drawing_role: MASTERY_EVIDENCE_NOT_HIDDEN_POWER_BONUS
trivial_repeat_gain: DIMINISHING_RETURNS
```

보조가 없으면:

```text
회로 숙련도 = 메인 숙련도
```

보조가 있으면:

```text
회로 숙련도
= 메인 숙련도 × 0.45
+ 사용 보조 평균 숙련도 × 0.35
+ 가장 낮은 보조 숙련도 × 0.20
```

```text
숙련도 성공률 보정
= clamp((회로 숙련도 - 50) × 0.5, -25, +25) %p
```

가장 미숙한 보조를 별도로 반영해, 익숙하지 않은 글자 하나를 복잡한 회로에 숨길 수 없게 한다.

## 성공률

```text
최종 성공률
= 메인 기본 성공률
+ 숙련도 보정
- 보조 복잡도 패널티
+ 특수 보조 성공률 보정
- 대상 난이도
- 상충 패널티
+ 임시 상황 보정
```

최종 성공률은 `5~98%`로 제한한다. 일반 메인 글자의 초기 기준 성공률은 `75% TEST_VALUE`다.

| 보조 글자 수 | 복잡도 성공률 패널티 |
|---:|---:|
| 0 | 0%p |
| 1 | -10%p |
| 2 | -20%p |
| 3 | -30%p |
| 4 | -40%p |
| 5 | -50%p |

`정밀`과 `절감`도 보조 슬롯을 차지하므로 위 복잡도에 포함된다.

### 1학년 초기 목표

메인 기본 `75%`, 회로 숙련도 `70`의 `+10%p`, 일반 대상 난이도 `-5%p`를 가정한다.

| 보조 수 | 최종 성공률 | 의도 |
|---:|---:|---|
| 0 | 80% | 매우 안정 |
| 1 | 70% | 안정 |
| 2 | 60% | 안정권 경계 |
| 3 | 50% | 위험 |
| 4 | 40% | 매우 위험 |
| 5 | 30% | 일반 1학년 실전 부적합 |

학년 자체가 성공률을 더하지 않는다. 상위 학년은 더 높은 수업·숙련도 상한에 접근해 복잡한 주문을 자연스럽게 안정화한다.

## 특수 보조 글자

### PRECISION / 정밀

```text
성공률 보너스 = 정밀 숙련도 ÷ 10 %p
마나 비율 보정 = +25%
```

- 최대 성공률 보너스는 숙련도 100에서 `+10%p`다.
- 위력 직접 보너스는 없다.
- 마나와 슬롯을 희생해 안정성을 구입한다.

### REDUCTION / 절감

```text
마나 감소율 = 10% + 절감 숙련도 ÷ 10
성공률 직접 보너스 = 0%p
```

- 숙련도 0~100에서 `10~20%`를 줄인다.
- 슬롯과 성공률 복잡도를 감수해 마나 효율을 얻는다.
- 최종 마나는 메인 글자 기본 마나 아래로 내려가지 않는다.

## 성공률 상태 표시

| 최종 성공률 | Preview 상태 |
|---:|---|
| 80~98% | STABLE |
| 60~79% | SAFE_RANGE |
| 40~59% | RISKY |
| 20~39% | UNSTABLE |
| 5~19% | COLLAPSE_RISK |

부분 성공·실패·역류의 세부 확률 분배는 별도 승인 전 `PLAYTEST_TUNING_REQUIRED`다.

## Stock·Commit 경계

- Typed glyph Stock은 반복 글자 입력을 대체할 뿐 주문 실행 자원이 아니다.
- Stock과 직접 작성은 같은 주문 의미·성공률·마나 공식을 사용한다.
- 모든 주문 Commit은 마나를 사용한다.
- 대상 취소·유효성 실패·시스템 오류에서 마나와 예약 Stock을 소비하지 않는다.
- 자동 대상·자동 Commit·완성 주문 정답화는 금지한다.

## 책임 경계

- 마나 공식: `docs/planning/MANA_SYSTEM.md`.
- 글자 숙련도: `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`.
- 승인: `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`.
- 상세 Spec: `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`.
- 과거 3×3 승인: 역사 보존, 활성 문법은 이 문서가 대체.

## 금지

```text
3×3 셀을 활성 회로 문법으로 사용
회로 내부 대상 노드
숨은 꼭짓점 위치 보너스
설계도 자동 대상·자동 Commit
학년의 직접 성공률 보너스
접근성 입력에 위력·마나 차별
정밀·절감 중복으로 무비용 무한 효율 생성
Runtime 검증 없는 밸런스 완료 주장
```
