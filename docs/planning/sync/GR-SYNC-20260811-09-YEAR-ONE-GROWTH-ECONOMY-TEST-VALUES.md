# GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES

```yaml
sync_id: GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES
decision_id: GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01
status: USER_APPROVED_BRANCH_AND_SHEET_READBACK_PASS
approved_at: 2026-08-11T09:12+09:00
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: 2ac0205586329ac8d38a0bd8c17ae83660c5aa7b
branch: planning/year-one-growth-economy-test-values
task8_pr: 116
task8_state: ON_HOLD_USER_REQUEST_COST_DEPENDENCY
persistent_godot_source_mutation: NONE
sheet_write_readback: PASS
runtime_validation: NOT_RUN
human_playtest_validation: NOT_RUN
final_balance: NOT_PROVEN
```

## 승인 TEST_VALUE

```text
Year-One 자유일정: 6개, Ch1~6 각1 / Ch7 일반창0
2·3학기 Focus: FLOW/HEAT/PROTECT 중 서로 다른 2개, 3학기 재선택 무페널티
2학년 전문화 준비: 계열증거 3 / 서로 다른 맥락 2 / 책임·복기 1 / 부족 시 Bridge 1회
학기말 평가: 원리이해25 / 문맥적용25 / 책임회복25 / 복기설명25
일반 실패·부분성공 별도 숫자감점 없음
회피 가능한 책임위반: 사건 최대 -2 / 학기 최대 -6
내부 Band: A85+ / B70~84 / C55~69 / D<55
제작: 6 재료군 / 8 핵심레시피 / 최대3 입력 / 재료군별 상한12
필수 제작 재료: 메인 경로에서 ceil(1.5 × M) 이상 보장
현장실습 반복 재료보상: 100 / 50 / 25 / 0
```

모든 숫자는 `USER_APPROVED_TEST_VALUES_ACTIVE`이며 최종 출시 밸런스가 아니다.

## Parent refinement

`GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01`의 `결과 태그 + 작은 숨김 감점` 방향은 보존한다. 이번 Decision은 숫자 감점의 발동 조건을 모든 실패가 아니라 **회피 가능한 책임 위반**으로 좁힌다.

```yaml
parent_direction: PRESERVED
child_refinement: HIDDEN_DEDUCTION_ONLY_FOR_AVOIDABLE_IRRESPONSIBILITY
ordinary_failure_numeric_double_penalty: FORBIDDEN
high_authority_conflict: NONE
```

## GitHub 변경

```text
docs/planning/YEAR_ONE_GROWTH_ECONOMY_TEST_VALUES_01_APPROVAL_2026-08-11.md
docs/superpowers/specs/2026-08-11-year-one-growth-economy-test-values-design.md
docs/planning/CURRENT_CONFIRMED_DECISIONS.md
tests/test_year_one_growth_economy_test_values_contract.py
.github/workflows/validate-base-v9-adoption.yml
docs/planning/sync/GR-SYNC-20260811-09-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES.md
```

Superpowers spec은 process overlay용 thin spec이며 프로젝트 정본을 복제하거나 덮어쓰지 않는다. Planning CI에는 B 계약을 명시 실행하는 unittest step을 추가한다.

## Google Sheet 동기화

명시적으로 쓴 뒤 재조회한 범위:

```text
00_프로젝트_허브 H2:K2
01_작업순서 A63:J63
02_현재_확정결정 A79:J79
04_누락_충돌_감사 A93:J93
10_제품방향 D8:F13
41_성장_경제 E2:I8
99_변경이력 A134:H134
```

Readback:

```yaml
decision_id: MATCH
free_schedule_6: MATCH
focus_2_of_3: MATCH
specialization_3_2_1_bridge_1: MATCH
portfolio_4_x_25: MATCH
responsibility_only_deduction_minus_2_minus_6: MATCH
grade_bands: MATCH
crafting_6_8_3_12: MATCH
mandatory_material_ceil_1_5_x_m: MATCH
practicum_repeat_100_50_25_0: MATCH
stock_values: PRESERVED
summon_values: PRESERVED
star_values: PRESERVED
spell_workflow_values: PRESERVED
d_vertical_slice_values: NOT_CHANGED
sheet_status: SHEET_WRITE_READBACK_PASS
```

## Benchmark 판정

- Persona 5 Royal official: 방과후 활동·관계가 능력 확장과 연결되는 제한된 시간 선택은 `ADAPT`; 촘촘한 일일 최적화는 `REJECT`.
- Atelier Ryza / Ryza 2 official manuals: 재료 선택이 합성 결과·효과에 영향을 주는 의미는 `ADAPT`; 대규모 재료·레시피 폭증은 1학년 범위에서 `REJECT`.

적용 결과는 `6`개의 큰 자유일정 창과 `6재료군 / 8핵심레시피 / 최대3입력`의 Lean Evidence Economy다.

## 보호되는 다른 권위

- `GM-STOCK-SYSTEM-01`: 용량·자연충전·Stock 소비 수치 변경 없음.
- `GM-SUMMON-SYSTEM-01`: 보조3슬롯·마나·역할 수치 변경 없음.
- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`: 성공률·숙련 계수 변경 없음.
- `GM-SPELL-WORKFLOW-UI-V2-01`: Stage·소비·Exactly-once 의미 변경 없음.
- `GM-WORLD-CHARACTER-THREE-YEAR-STORY-01`: 세계·인물·세력 의미 변경 없음.
- D의 Internal Vertical Slice 46/53/60분 예산과 장면별 시간·작성 횟수·Mock 수는 변경 없음.
- Task8 Draft PR #116 ON_HOLD 상태 변경 없음.

## 적대검토

- **일정 최적화 지배:** 어떤 자유일정 축도 필수 진행·정보·필수 재료를 독점하지 않는다.
- **전투 파밍:** 동일 실습은 영구 보상 0, 재료 25→0으로 감쇠한다.
- **초기 수강 함정:** 3학기 재선택 무페널티 + 2학년 Bridge 1회.
- **실패 이중처벌:** 일반 실패 자체의 추가 숫자 감점을 금지한다.
- **제작 과밀:** 1학년 시작 범위를 6·8·3·12로 제한한다.
- **필수 파밍:** 필수 제작은 메인 경로에서 ceil(1.5×M)를 보장한다.
- **범위 침범:** Stock/Summon/Star/Spell/D 수치에는 delta가 없어야 한다.

## 잔여 NOT_RUN

```text
RUNTIME_NOT_RUN
DEVICE_NOT_RUN
HUMAN_PLAYTEST_NOT_RUN
PERFORMANCE_NOT_RUN
FINAL_BALANCE_NOT_PROVEN
FULL_VERTICAL_SLICE_NOT_RUN
```

이 sync는 사용자 승인된 기획 TEST_VALUE 정본화이며 위 증거를 승격하지 않는다.

## 다음 축

```text
D: 서리꽃 온실의 심장 Internal Vertical Slice 상세
```

D는 별도 brainstorming/design approval이 필요하며 이 B 결정만으로 자동 승인되지 않는다.
