# GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01 — 1학년 성장·경제 TEST_VALUE 승인

## 1. 상태

```yaml
decision_id: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01
status: USER_APPROVED_TEST_VALUES_ACTIVE
approved_at: 2026-08-11T09:12+09:00
sync_id: GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: 2ac0205586329ac8d38a0bd8c17ae83660c5aa7b
parent_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
  - GM-FULL-GAME-REWARD-ECONOMY-01
  - GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
  - GM-YEAR-ONE-CHAPTER-CURRICULUM-01
  - GM-WORLD-CHARACTER-THREE-YEAR-STORY-01
test_value_not_final_balance: true
persistent_godot_source_mutation: NONE
runtime_validation: NOT_RUN
human_playtest_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
```

이 결정은 이미 승인된 1학년 7 Chapter 구조와 성장·평가·보상·제작 방향을 **플레이테스트 가능한 초기 수치 묶음**으로 구체화한다. 여기서 확정되는 숫자는 출시 최종 밸런스가 아니라 `USER_APPROVED_TEST_VALUES_ACTIVE`다. 실제 인간 플레이테스트·완주 데이터가 생기면 새 튜닝 Decision으로 변경할 수 있다.

## 2. 승인 요약 — Lean Evidence Economy

```yaml
year_one_free_schedule_windows: 6
free_schedule_distribution: CH1_TO_CH6_ONE_EACH_CH7_NONE
free_schedule_axes:
  - 휴식
  - 준비
  - 교류
  - 선택형_현장실습
course_focus:
  term_1: COMMON_FOUNDATION_NO_FOCUS_CHOICE
  term_2: PICK_2_DISTINCT_OF_3
  term_3: PICK_2_DISTINCT_OF_3_FREE_RESELECT_NO_PENALTY
schools:
  - FLOW
  - HEAT
  - PROTECT
specialization_readiness:
  valid_school_evidence_min: 3
  distinct_context_categories_min: 2
  responsibility_or_reflection_evidence_min: 1
  repeated_casting_alone: INVALID
  year_two_bridge_assignment_if_short: 1
portfolio:
  principle_understanding: 25
  context_application: 25
  responsibility_recovery: 25
  reflection_explanation: 25
  mid_term_numeric_visibility: HIDDEN
hidden_responsibility_deduction:
  per_incident_max: -2
  per_semester_max: -6
  ordinary_failure_or_partial_success_alone: NO_SEPARATE_NUMERIC_DEDUCTION
grade_bands_internal:
  A: 85_TO_100
  B: 70_TO_84
  C: 55_TO_69
  D: BELOW_55
crafting:
  material_groups: 6
  core_recipes: 8
  max_material_inputs_per_craft: 3
  inventory_cap_per_material_group: 12
  required_story_material_guarantee: CEIL_1_5_X_REQUIRED
practicum_repeat_material_reward_percent:
  first_unique_completion: 100
  new_condition_or_meaningfully_different_solution: 50
  first_same_condition_same_solution_repeat: 25
  further_identical_repeat: 0
next_planning_axis: D_VERTICAL_SLICE_DETAIL
```

기억용 축약은 다음과 같다.

```text
6 / 2-of-3 / 3·2·1 / 4×25 / 6·8·3·12 / 100·50·25·0
```

## 3. 자유일정 — 1학년 총 6개 창

1학년의 일반 자유일정 창은 총 `6`개다.

- Chapter 1~6에 각각 큰 자유일정 창 `1`개를 둔다.
- Chapter 7에는 일반 자유일정 창을 두지 않는다.
- Chapter 7의 `선택·준비` 기능은 첫 세계 개정을 위한 집중 준비로 충족한다.
- 각 자유일정 창에서는 `휴식 / 준비 / 교류 / 선택형 현장실습` 중 중심행동 정확히 `1`개를 고른다.
- 현장실습을 선택하면 그 창 전체를 소비한다.
- 어떤 자유일정 축도 메인 진행·필수 정보·필수 제작 재료를 독점할 수 없다.

### 3.1 의도

이 수치는 일일 달력 최적화가 아니라 한 학년 동안 기억할 만한 기회비용 선택을 만들기 위한 초기값이다. 플레이어가 모든 창을 현장실습에 쓰거나 모든 창을 교류에 써도 메인 스토리는 진행되어야 한다.

### 3.2 재조정 신호

다음이 인간 플레이테스트에서 반복되면 `6`은 후속 튜닝 대상이다.

- 선택이 너무 적어 자기 성장 경로가 느껴지지 않음
- 반대로 일정 선택 피로가 Chapter 핵심 문제보다 커짐
- 특정 축을 고르지 않으면 사실상 손해라는 지배전략 발생

## 4. 수강 Focus — 2-of-3

1학기의 세 계열 교육은 공통 기초다. 수강 Focus 선택은 없다.

2학기와 3학기는 각각 다음 규칙을 사용한다.

```text
유동학(FLOW) / 변성학(HEAT) / 결계학(PROTECT)
중 서로 다른 2개를 Focus로 선택
```

- 3학기에는 2학기 선택을 그대로 유지할 필요가 없다.
- 3학기 재선택·변경에는 수치 페널티가 없다.
- Focus하지 않은 계열도 기본 사용과 메인 진행이 가능하다.
- Focus는 교수 지도, 추가 포트폴리오 증거 기회, 연구·준비 선택지의 밀도를 높이는 장치다.
- Focus하지 않았다는 이유로 사건 해법·필수 서사·메인 진행을 잠그지 않는다.

이 구조는 `폭넓게 두 계열을 바꿔가며 볼 것인가 / 같은 두 계열을 연속으로 깊게 볼 것인가`의 선택을 만들되 1학년 초 영구 빌드 실패를 금지한다.

## 5. 2학년 전문화 준비 — 3·2·1 증거 규칙

특정 계열의 2학년 전문화 준비 완료 조건은 다음 `TEST_VALUE`다.

```yaml
valid_school_evidence: 3_or_more
distinct_context_categories: 2_or_more
responsibility_or_reflection_evidence: 1_or_more
```

유효 증거는 단순 횟수 카운트가 아니라 수업·비전투 응용·현장 책임·연구/제작·복기처럼 서로 다른 맥락에서 해당 계열을 이해하고 설명한 기록이다.

### 5.1 금지

- 같은 쉬운 주문 반복 시전만으로 전문화 준비 완료 금지
- 전투 승수만으로 전문화 준비 완료 금지
- 수업 출석만으로 전문화 준비 완료 금지
- 1학년 Focus를 선택하지 않았다는 이유로 2학년 전문화 영구 잠금 금지

### 5.2 Bridge 과제

1학년 종료 시 원하는 계열이 `3·2·1`을 충족하지 못해도 전문화를 영구 잠그지 않는다.

- 2학년 초 `Bridge 과제 1회`로 부족한 증거를 보충할 수 있다.
- Bridge는 이미 충족한 플레이어에게 추가 성장 이득을 주는 파밍 수단이 아니다.
- Bridge의 정확한 장면·시간·콘텐츠 구현은 후속 2학년 콘텐츠 설계가 소유한다.

## 6. 학기말 포트폴리오 — 4축 × 25

학기말 포트폴리오 내부 정규화는 `100`점이며 네 축을 동일하게 `25`점씩 둔다.

| 축 | TEST_VALUE | 해석 |
|---|---:|---|
| 원리 이해 | 25 | 왜 주문/계열 원리가 작동하는지 이해했는가 |
| 문맥 적용 | 25 | 장소·재료·정령·사람·위험 조건에 맞게 바꿨는가 |
| 책임·회복 | 25 | 결과와 대가를 책임지고 필요 시 회복 행동을 했는가 |
| 복기·설명 | 25 | 결과·실패·부분성공을 설명하고 다음 판단으로 연결했는가 |

- 학기 중 내부 점수·사건별 감점·예상 등급은 플레이어에게 공개하지 않는다.
- 학기말에는 대표 근거, 강점, 보완점, 다음 수강/연구 방향을 설명한다.
- 전투 한 종류가 평가를 독점할 수 없다.
- 별도 시험을 만들지 않는다.

## 7. 실패와 숨김 감점 — 책임 위반에만 -2 / -6

상위 결정의 `작은 숨김 감점`은 이 Decision에서 더 좁게 정의한다.

### 7.1 일반 실패·부분성공

일반적인 실패나 부분성공 **그 자체**에는 별도의 숨은 숫자 감점을 추가하지 않는다.

이유:

- 이미 결과 품질·손실·부작용·세계 상태·관계 반응·포트폴리오 증거로 결과가 남는다.
- 같은 실패를 결과 태그와 숫자 감점으로 이중 처벌하지 않는다.
- 실패를 설명하고 책임 있게 복기하면 오히려 `책임·회복`, `복기·설명` 증거가 될 수 있다.

### 7.2 숫자 감점 대상

숨은 숫자 감점은 다음처럼 **피할 수 있었고 알고도 선택한 무책임**을 보정하기 위한 장치다.

- 이미 확인한 안전 근거를 이유 없이 의도적으로 무시
- 기록 위조 또는 중요한 사실 은폐
- 선택한 결과에 대한 명시적 책임·회복 행동 방기

초기 TEST_VALUE:

```yaml
per_incident_hidden_deduction_cap: -2
per_semester_hidden_deduction_cap: -6
```

이 `-6`은 시설·생명·관계·세계 손실의 상한이 아니다. **학업 평가 내부의 숨은 책임 보정치 상한**일 뿐이다. 실제 사건 결과 태그와 세계 상태는 별도로 유지된다.

### 7.3 Parent refinement

`GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01`의 `결과 태그 + 작은 숨김 감점` 방향을 폐기하지 않는다. 이 Decision은 그 감점의 발동 조건을 `모든 실패`가 아니라 `회피 가능한 책임 위반`으로 좁힌다.

```yaml
parent_direction: PRESERVED
child_refinement: HIDDEN_DEDUCTION_ONLY_FOR_AVOIDABLE_IRRESPONSIBILITY
conflict: NONE
```

## 8. 내부 평가 Band — A/B/C/D TEST_VALUE

```text
A = 85~100
B = 70~84
C = 55~69
D = 54 이하
```

이 Band는 초기 플레이테스트용 내부 분류다.

- 학기 중 예상 등급은 노출하지 않는다.
- `D`는 게임오버가 아니다.
- `D` 하나로 장학 즉시 박탈·관계 즉시 단절·메인 콘텐츠 폐쇄를 만들지 않는다.
- 낮은 평가 결과는 보충 지도, Bridge/회복 기회, 다음 학기 교수 피드백으로 연결한다.

`85 / 70 / 55`, `-2 / -6`은 인간 플레이테스트 후 가장 먼저 재검토할 튜닝 민감 값이다.

## 9. 1학년 제작 경제 — 6·8·3·12

```yaml
general_material_groups: 6
reusable_core_recipes: 8
max_material_inputs_per_craft: 3
inventory_cap_per_material_group: 12
```

제작의 의미 흐름은 기존 정본을 유지한다.

```text
식별 → 정제 → 배합 → 안정화
→ 촉매 / 도구 / 보호장치 / 의식 소모품
```

### 9.1 경계

- 새 범용 화폐를 추가하지 않는다.
- 기존 Gold, Mana, Typed Glyph Stock의 소유권과 수치를 변경하지 않는다.
- 재료군을 FLOW/HEAT/PROTECT에 1:1 귀속시키지 않는다.
- 특정 계열 Focus가 특정 재료 경제를 독점하지 않는다.
- 유일 재료 한 종류만이 메인 사건의 정답이 되지 않는다.

### 9.2 재조정 신호

`6 / 8 / 3 / 12`는 다음 문제를 관찰하기 위한 시작값이다.

- 인벤토리 탐색이 제작 판단보다 오래 걸림
- 재료 이름을 기억하지 못해 의미 선택이 사라짐
- 8개 레시피 중 소수만 상위호환으로 고정됨
- 보유 상한 12 때문에 정상 스토리 진행이 불필요하게 막힘
- 반대로 상한이 사실상 무의미해 자원 선택이 사라짐

## 10. 필수 스토리 제작 재료 보장 — ceil(1.5 × M)

필수 스토리 제작물이 관련 재료 `M`개를 요구할 때, **피할 수 없는 메인 경로**에서 최소 다음 수량을 보장한다.

```text
guaranteed_relevant_materials >= ceil(1.5 × M)
```

예:

```text
필수 요구 M=4 → 메인 경로 최소 6개 보장
필수 요구 M=5 → 메인 경로 최소 8개 보장
```

의도는 실수·부분성공·다른 실험에 쓴 작은 여유를 허용하면서 선택형 현장실습 반복을 필수 파밍으로 만들지 않는 것이다.

금지:

- 선택형 현장실습 반복이 없으면 메인 제작 불가능
- 특정 관계 활동을 골라야 필수 제작 재료 충족
- 세이브/로드를 이용해야 합리적으로 충족되는 드랍 경제

## 11. 현장실습 반복 감쇠 — 100 / 50 / 25 / 0

같은 현장실습 Anchor의 재료 보상과 영구 증거는 다음으로 구분한다.

| 상태 | 새 영구 증거/발견 | 재료 보상 |
|---|---:|---:|
| 첫 고유 완료 | 100% | 100% |
| 새 조건 또는 의미 있게 다른 해법 | 새 증거/발견 100% | 50% |
| 같은 조건·같은 해법 첫 반복 | 0% | 25% |
| 그 이후 동일 반복 | 0% | 0% |

- 반복 플레이 자체를 막지는 않는다.
- `새 조건/다른 해법` 판정은 단순 주문 이름 변경이 아니라 의미 있게 다른 상황·원리·대가·보호 대상이 있어야 한다.
- 핵심 성장자원, 평가, 접근권한은 동일 반복으로 무한 축적되지 않는다.
- 첫 완료와 새 해법은 마도서 관찰·발견을 장려한다.

정확한 재료 수량과 실습 길이는 후속 콘텐츠/튜닝이 소유한다. 이 Decision은 **비율과 영구보상 소유권**만 고정한다.

## 12. 벤치마크 판정

### Persona 5 Royal — ADAPT

공식 사이트는 학교생활 중 방과후 활동을 선택하고 사람들과 신뢰를 쌓는 행동이 플레이 능력 확장과 연결되는 구조를 보여준다.

GRIMOIRE 적용:

- `ADAPT`: 제한된 시간 선택에 실제 기회비용과 관계/준비 의미를 부여한다.
- `REJECT`: 촘촘한 일일 달력 최적화와 놓친 날짜를 계산하는 플레이를 1학년 코어로 만들지 않는다.
- 결과: Year-One 전체를 `6`개의 큰 자유일정 창으로 압축한다.

Source: Persona 5 Royal Official Website — https://persona.atlus.com/p5r/

### Atelier Ryza / Ryza 2 — ADAPT

공식 매뉴얼은 레시피에 재료를 넣고, 재료의 성질·속성이 제작 결과와 효과에 영향을 주는 합성 구조를 설명한다.

GRIMOIRE 적용:

- `ADAPT`: 어떤 재료를 고르고 어떻게 배합했는지가 제작 결과에 의미를 갖는다.
- `REJECT`: 대규모 재료·레시피·Trait 조합 폭증을 1학년 데모의 핵심 목표로 삼지 않는다.
- 결과: `6 재료군 / 8 핵심 레시피 / 최대3 입력`의 Lean 범위를 시작값으로 둔다.

Sources:
- Atelier Ryza 2 Official Web Manual, The Basics of Synthesis — https://www.koeitecmoamerica.com/manual/ryza2/en/4100.html
- Atelier Ryza 2 Official Web Manual, Synthesis Flow — https://www.koeitecmoamerica.com/manual/ryza2/en/4200.html

## 13. 소유권 경계

### B가 이번 Decision에서 소유하는 것

- 1학년 자유일정 창 총수와 Ch1~6 분포
- 2/3학기 2-of-3 Focus 초기값
- 2학년 전문화 준비의 3·2·1 증거 조건과 Bridge 1회
- 학기말 4축 × 25 평가 가중치
- 책임 위반 숨김 감점 -2/-6
- 내부 A/B/C/D Band
- 1학년 제작 6·8·3·12 범위
- 필수 제작 재료 `ceil(1.5×M)` 보장
- 현장실습 반복 보상 100/50/25/0 감쇠

### B가 소유하지 않는 것

```text
GM-STOCK-SYSTEM-01 수치
GM-SUMMON-SYSTEM-01 수치
GM-STAR-CIRCUIT-MASTERY-BALANCE-01 계수·숙련 계산
GM-SPELL-WORKFLOW-UI-V2-01 Stage/소비/Exactly-once 의미
D Vertical Slice 장면별 시간·밀도·작성 횟수·Mock 수
2·3학년 전체 콘텐츠 수량
최종 출시 경제·등급·재료 밸런스
```

이 Decision 때문에 기존 Stock 용량, 자연충전 시간, 소환 마나/슬롯, Star 성공률/숙련 계수, Gold/Mana/Typed Stock 소비 규칙을 수정해서는 안 된다.

## 14. D Vertical Slice로 넘기는 계약

D는 B의 숫자를 모두 실제 Slice에 그대로 구현해야 한다는 뜻이 아니다. D는 46/53/60분 예산 안에서 **무엇을 실제 플레이하고 무엇을 명시적 Preview/Mock으로 보여줄지** 결정한다.

D가 반드시 보존해야 할 B 의미:

- 자유일정은 중심행동 1개를 고르는 기회비용이다.
- 포트폴리오는 수업/비전투/현장/복기 중 한 종류만으로 독점되지 않는다.
- 실패는 일반 숫자 벌점 파밍 게임이 아니다.
- 제작은 재료 선택의 의미를 보여주되 인벤토리 폭증이 목적이 아니다.
- 선택형 현장실습 반복은 필수 성장 파밍이 아니다.

D의 정확한 자유일정 포함 횟수, 제작 재료 수, 평가 Mock 형태, 장면별 시간은 별도 Decision에서 다룬다.

## 15. 적대검토

### P0 — 일정 최적화 게임화

공격: 6개 창 중 특정 순서가 사실상 정답이 되어 다른 선택이 손해가 된다.

방어: 네 축 모두 필수 진행/필수 정보/필수 재료를 독점할 수 없다. 관찰 지표에서 선택 편중을 추적한다.

### P0 — 전투 파밍 지배

공격: 현장실습을 반복해 재료와 평가를 무한 획득한다.

방어: 영구 보상은 첫 고유/새 해법에 집중하고 동일 반복은 `25 → 0`; 평가·접근권한의 동일 반복 축적을 금지한다.

### P1 — 초반 수강 실수로 2학년 잠금

공격: 플레이어가 1학년 Focus를 잘못 골라 원하는 전문화에 못 간다.

방어: Focus는 기본 사용을 잠그지 않으며 3학기 재선택 무페널티, 2학년 Bridge 1회가 있다.

### P1 — 실패 이중 처벌

공격: 세계 손실 + 관계 손실 + 평가 숫자 감점이 겹쳐 실패를 복기할 이유가 사라진다.

방어: 일반 실패/부분성공 자체에는 별도 숨은 숫자 감점을 주지 않는다. 감점은 회피 가능한 책임 위반에만 사용한다.

### P1 — 제작 과밀

공격: 제작 시스템이 주문 작성보다 더 많은 재료·레시피 기억을 요구한다.

방어: 1학년은 `6·8·3·12`로 시작하고 이후 플레이테스트 근거 없이 확대하지 않는다.

### P1 — 필수 파밍

공격: 필수 제작에 재료가 모자라 선택형 실습 반복이 강제가 된다.

방어: 메인 경로에서 `ceil(1.5×M)`를 보장한다.

## 16. 검증 한계

현재 이 Decision이 증명하는 것은 **사용자 승인된 기획 TEST_VALUE 정본**뿐이다.

```text
DESIGN_USER_APPROVED = TRUE
GITHUB_SHEET_CANON_SYNC = PENDING_UNTIL_THIS_SYNC_COMPLETES
RUNTIME_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
FINAL_BALANCE = NOT_PROVEN
```

수치를 `BALANCED`, `FUN_VERIFIED`, `FINAL`로 승격하지 않는다.
