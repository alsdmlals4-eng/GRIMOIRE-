# GRIMOIRE Decision Log Addendum — 2026-08-01E

## GM-BATTLE-TIME-FLOW-01

```yaml
decision_id: GM-BATTLE-TIME-FLOW-01
status: APPROVED_TIME_FLOW_DIRECTION
approved_by: USER
approved_at: 2026-08-01T09:15:00+09:00
```

사용자는 `BATTLE-TIME-FLOW-01` 권장안을 승인했다.

### 승인 내용

```text
플레이어가 전투를 보고 판단하고 마법을 작성하는 동안
= 적 공격 타이머 진행

마법 시전·적 공격·보스 페이즈 전환 등 시스템 해결 중
= 적 공격 타이머 정지

접근성
= 작성 중 적 공격 타이머 감속 옵션 제공
```

### 세부 계약

- 기본 작성 중 배율은 `1.0×`.
- 작성 보조 감속의 초기 프로토타입 목표값은 `0.5×`이며 최종 수치가 아니다.
- 감속 옵션 사용으로 보상·콘텐츠·기록을 제한하지 않는다.
- 시스템 처리·연출·입력 잠금 시간은 적 공격 타이머를 소모하지 않는다.
- `[구현]`과 공격 타이머 0이 경합하면 먼저 유효 승인된 이벤트를 먼저 해결한다.
- 적 공격이 먼저 확정돼도 작성 획·후보·조합은 전투가 계속되는 한 유지한다.
- 작성 패널을 열어 시간을 완전히 멈추는 기본 구조는 사용하지 않는다.

### 근거

- Benchmark: `docs/planning/benchmarks/BATTLE_TIME_FLOW_01_QUICK_BENCHMARK_2026-08-01.md`.
- Authority: `docs/planning/BATTLE_TIME_FLOW_01_APPROVAL_2026-08-01.md`.
- State: `docs/planning/BATTLE_TIME_FLOW_01_STATE.json`.

### 후행 결정

- `BATTLE-RULES-01`: 피해·방어·상태·승리·패배.
- 공격 간격·작성 감속 최종 배율·복귀 유예 시간은 프로토타입 튜닝.
- 보스 페이즈별 공격 패턴은 `BOSS-PHASE-01`.

### 검증 경계

```text
GODOT_IMPLEMENTATION = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
MAIN_SYNC = PENDING_PR_MERGE
```
