# GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01 승인

## 상태

```yaml
decision_id: GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01
status: APPROVED_CORE_BATTLE_FLOW
approved_at: 2026-08-01T05:26:00+09:00
approved_by: USER
project: "GRIMOIRE: 세계를 다시 쓰는 법"
refines:
  - GM-BATTLE-SCREEN-LAYOUT-01
  - GM-BATTLE-SINGLE-ENEMY-FOCUS-01
benchmark: GR-BM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01
implementation_authority: NONE
```

## 1. 적 행동 규칙

- 적은 일정 시간 간격으로 행동한다.
- 전투 화면에는 적의 다음 행동과 남은 시간을 우선 표시한다.
- 플레이어의 행동 순서를 기다리는 턴 교대형이 아니다.
- 적 행동은 공격뿐 아니라 방어, 충전, 상태 변화, 환경 압력일 수 있다.
- 정확한 간격과 행동별 시간은 밸런스 단계에서 확정한다.

## 2. 플레이어 마법 사용 규칙

```text
마법 작성
→ 인식·조합 유효 상태
→ [구현] 입력
→ 마나 검증
→ 즉시 시전
→ 적·환경·아군 상태 즉시 반영
```

- 유효한 마법이 구성되어 있고 마나가 충분하면 `[구현]` 버튼으로 즉시 사용한다.
- 별도 턴 대기, 시전 대기열, 추가 실행 버튼을 두지 않는다.
- 마나 외의 비용 자원은 이 결정에서 추가하지 않는다.
- 마나 부족 시 시전만 차단하고 작성 획·인식 결과·조합은 유지한다.
- `[구현]` 연속 입력으로 중복 시전되지 않도록 1회성 Commit token과 해결 중 입력 잠금을 사용한다.

## 3. 일반 전투 페이즈

- 일반 전투는 전투당 단일 페이즈다.
- 일반 적은 중간 체력 구간에서 새 페이즈로 전환하지 않는다.
- 상태 변화와 행동 패턴 변화는 허용하지만 이를 별도 페이즈로 취급하지 않는다.
- 전투 종료 조건이 충족되면 바로 결과 상태로 이동한다.

## 4. 보스 전투 페이즈

- 보스만 1페이즈, 2페이즈 등 다중 페이즈를 사용할 수 있다.
- 페이즈 전환은 동일 전투 세션 안에서 수행한다.
- 플레이어 HP·마나·상태·마도서 임시 기록·사용 이력은 기본적으로 유지한다.
- 보스의 행동 세트, 시각 상태, 위험 규칙, 환경 목표는 페이즈별로 교체할 수 있다.
- 페이즈 전환 때 보상 지급이나 전투 결과 확정은 하지 않는다.

## 5. 전투 상태 흐름

```text
BATTLE_INTRO
→ ENEMY_ACTION_TIMER
↔ SPELL_WRITE
→ CAST_COMMIT
→ CAST_RESOLVE
→ ENEMY_ACTION_TIMER
→ ENEMY_ACTION_RESOLVE
→ VICTORY_OR_DEFEAT_CHECK
├─ 일반 전투: RESULT
└─ 보스: BOSS_PHASE_TRANSITION 또는 RESULT
```

플레이어는 적 타이머가 진행되는 동안 마법을 작성할 수 있다. 다만 작성 중 시간의 `계속 진행 / 감속 / 일시정지` 최종 규칙은 별도 결정으로 남긴다.

## 6. 금지 사항

- 일반 적에게 반복적인 페이즈 전환을 붙여 전투를 늘리는 것.
- 마나가 충분한데 `[구현]` 후 추가 확인을 반복 요구하는 것.
- 마나 부족 시 작성 내용을 초기화하는 것.
- 적 행동 타이머를 숨긴 채 갑작스럽게 공격하는 것.
- 보스 페이즈 전환 때 플레이어 상태를 이유 없이 전부 초기화하는 것.
- 여러 `[구현]` 입력이 같은 마법을 중복 시전하는 것.

## 7. 후행 결정

- `BATTLE-TIME-FLOW-01`: 작성 중 적 시간의 계속 진행·감속·정지.
- `BATTLE-RULES-01`: 피해, 방어, 상태, 승리·패배 조건.
- `BOSS-PHASE-01`: 보스 페이즈 전환 규칙과 연출.
- 밸런스: 적 공격 간격, 마나 비용, 회복량, 행동 빈도.

## 8. 검증 경계

```text
CORE_BATTLE_FLOW = USER_APPROVED
EXACT_TIMING = NOT_APPROVED
BATTLE_NUMBERS = NOT_APPROVED
GODOT_IMPLEMENTATION = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
