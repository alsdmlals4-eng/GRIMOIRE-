# BATTLE-RULES-01 QUICK Benchmark — 2026-08-01

## 1. 질문

> 강한 적 1개체와 싸우는 GRIMOIRE 전투의 기본 승리·패배·피해·방어 규칙을 무엇으로 구성해야 직접 작성·상황 해결·책임 설계가 한 시스템으로 연결되는가?

```yaml
benchmark_id: GR-BM-BATTLE-RULES-01
scale: QUICK
status: COMPLETE
project: "GRIMOIRE: 세계를 다시 쓰는 법"
source_priority: OFFICIAL_PRIMARY
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 2. 비교 기준

1. 프로젝트의 `정령 파괴보다 원인 차단·진정` 방향과 맞는가.
2. 적 1체 전투가 HP 스펀지로 보이지 않는가.
3. `흐름 / 집중 / 분산`의 상황 판단이 승리 조건에 직접 연결되는가.
4. 플레이어가 왜 성공·부분 성공·실패했는지 설명 가능한가.
5. 1인 제작 Vertical Slice 범위를 지키는가.
6. 적 주기공격·즉시시전·작성 중 시간 진행 계약과 양립하는가.

## 3. 사례

### 사례 A — Pokémon Legends: Arceus의 폭주 진정

공식 사이트는 폭주한 Noble Pokémon을 진정시키기 위해 전용 Balm을 맞히며, 일반 전투 승리는 일시적으로 상대를 무방비 상태로 만들어 진정 행동을 돕는 구조라고 설명한다.

- Source: https://legends.arceus.pokemon.com/en-ca/story/
- 관찰: 공격·전투 자체가 최종 목적이 아니라 `폭주 진정`이라는 상위 목표를 보조한다.
- 장점: 서사 목표와 전투 목표가 일치한다.
- 위험: 전투와 진정 게이지가 분리되면 같은 적에게 두 번의 체력을 깎는 느낌이 생길 수 있다.
- 판정: `ADAPT`.

### 사례 B — Monster Hunter의 Quest Objective 분리

Capcom 공식 매뉴얼은 토벌·격퇴·포획처럼 Quest의 Main Objective가 다르며, 포획 임무에서는 대상을 죽이면 실패할 수 있음을 명시한다.

- Source: https://game.capcom.com/manual/MH_Gen/en/page-43.html
- Source: https://game.capcom.com/manual/MH4U/en/page-42.html
- 관찰: 적 HP와 전투 종료 조건이 항상 동일하지 않다.
- 장점: 같은 전투 자원을 사용하면서 목표에 따라 성공 판정이 달라진다.
- 위험: 포획 조건을 별도 암기 규칙으로 만들면 진입 장벽이 생긴다.
- 판정: `ADAPT`.

### 사례 C — UNDERTALE의 비살상 종료

공식 소개는 모든 적을 죽이지 않고도 비폭력적으로 `defeat`할 수 있다고 명시한다.

- Source: https://undertale.com/about/
- 관찰: 적을 쓰러뜨린다는 개념을 HP 0과 분리하고, 상호작용 결과를 전투 종료 조건으로 사용할 수 있다.
- 장점: 플레이어의 행위 방식이 캐릭터·서사·결과에 직접 연결된다.
- 위험: 적마다 전용 정답 상호작용을 만들면 콘텐츠 제작량이 폭증한다.
- 판정: `ADAPT_WITH_SHARED_GRAMMAR`.

### 사례 D — Final Fantasy XVI의 Will/Stagger Gauge

Square Enix 공식 업데이트 설명은 공격이 적의 Will Gauge를 줄이고 Stagger 상태를 만드는 구조를 다룬다.

- Source: https://www.square-enix-games.com/en_US/documents/update-final-fantasy-xvi
- 관찰: HP 이외의 상태 게이지가 전술적 중간 목표를 제공한다.
- 장점: 적 상태 변화와 공격 기회를 명확히 표시할 수 있다.
- 위험: 최종 승리가 다시 HP 0이면 GRIMOIRE의 진정·상황 해결 정체성이 약해진다.
- 판정: `ADAPT_GAUGE_LANGUAGE_ONLY`.

## 4. 대안 비교

| 안 | 승리 조건 | 장점 | 치명적 위험 | 판정 |
|---|---|---|---|---|
| A. 적 HP 0 | 일반 피해로 체력 소진 | 익숙하고 설명이 짧음 | 글자 의미보다 DPS·최적 조합이 우선, 정령 파괴 인상 | `REJECT_AS_DEFAULT` |
| B. HP 0 후 포획·진정 | 체력 소진 뒤 별도 마무리 | 전투와 진정 모두 표현 | 이중 게이지·이중 마무리·반복 피로 | `REJECT_FOR_SLICE` |
| C. 불안정도 0 | 상황에 맞는 주문으로 폭주·압력 해소 | 프로젝트 코어와 직접 연결, 적 1체 깊이 확보 | 단순 게이지 깎기로 변질 가능 | `ADOPT_WITH_CAUSAL_RULES` |
| D. 상황 목표 체크리스트만 | 환경 장치·조건 해결 | 인과가 강함 | 적과 전투하는 감각이 약하고 매 상황 전용 로직 증가 | `ADAPT_AS_RESULT_LAYER` |

## 5. 권장 결론

```text
기본 승리
= 상황에 맞는 주문으로 적·현상의 불안정도를 0으로 만들고 진정 상태에 도달

플레이어 압박
= 적 주기공격이 플레이어 HP를 감소

부분 성공·결과 차이
= 환경 보존도·부작용·남은 HP·선택한 해결 방식으로 판정
```

### 핵심 설계

- 적에게 일반 HP를 두지 않고 `불안정도 / 폭주도`를 사용한다.
- 주문은 단순 Damage가 아니라 현재 원인과 맞을 때 불안정도를 낮춘다.
- 상황과 맞지 않는 유효 주문은 공격을 늦추거나 일부 위험을 줄일 수 있지만, 불안정도 감소가 작거나 부작용을 만든다.
- 불안정도 0은 별도 Finish 입력 없이 마지막 유효 시전 결과로 진정·해결된다.
- 환경 목표는 별도 승리 체크리스트가 아니라 결과 품질과 부분 성공을 만든다.
- 일반 전투에 적 전용 퍼즐 정답을 만들지 않고 공통 글자 문법·상태·환경 태그를 사용한다.

## 6. 프로젝트 적용 판정

```yaml
ADOPT:
  - enemy_instability_as_primary_resolution
  - player_hp_as_failure_pressure
  - situation_objective_as_result_quality
  - explainable_success_partial_success_failure
ADAPT:
  - stagger_language_for_readable_state_changes
  - quest_objective_distinction_without_separate_capture_minigame
REJECT:
  - enemy_hp_zero_as_default_victory
  - hp_zero_then_second_capture_gauge
  - per_enemy_unique_answer_puzzle
  - generic_damage_per_second_optimization
```

## 7. 후속 검증

- 적 공격 간격과 플레이어 HP 수치.
- 주문별 불안정도 변화량.
- 수호 소환수의 피해 완화율·횟수.
- 환경 보존도와 결과 등급 임계값.
- 실제 작성 시간과 감속 보조의 공정성.

정확한 수치는 Godot PC Prototype과 사람 검증 전에는 최종값으로 확정하지 않는다.
