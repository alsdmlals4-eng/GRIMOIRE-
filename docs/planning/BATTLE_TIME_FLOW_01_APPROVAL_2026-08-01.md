# GM-BATTLE-TIME-FLOW-01 승인

## 상태

```yaml
decision_id: GM-BATTLE-TIME-FLOW-01
status: APPROVED_TIME_FLOW_DIRECTION
approved_at: 2026-08-01T09:15:00+09:00
approved_by: USER
project: "GRIMOIRE: 세계를 다시 쓰는 법"
refines:
  - GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01
  - GM-BATTLE-SCREEN-LAYOUT-01
benchmark: GR-BM-BATTLE-TIME-FLOW-01
implementation_authority: NONE
```

## 1. 핵심 계약

```text
플레이어가 판단·작성·후보 선택 중
= 적 공격 타이머 진행

마법 시전·적 공격·보스 전환 등 시스템 해결 중
= 적 공격 타이머 정지

접근성 보조
= 작성 중 적 공격 타이머 감속 옵션 제공
```

이 규칙은 직접 작성의 시간 압박을 유지하면서 시스템 연출·인식 지연·상태 전환 때문에 추가 공격을 받는 불공정을 막는다.

## 2. 타이머가 진행되는 상태

- `BATTLE_OVERVIEW`
- `SPELL_PANEL_EXPANDED`
- `SPELL_DRAWING`
- `SPELL_RECOGNITION_REVIEW`
- `SPELL_COMBINATION_REVIEW`
- 마나 부족으로 `[구현]`이 차단됐지만 플레이어가 계속 조작 가능한 상태

작성 패널을 열거나 후보를 검토하는 것만으로 시간을 멈출 수 없다.

## 3. 타이머가 정지되는 상태

- `[구현]` 요청이 승인되고 입력이 잠긴 순간부터 `CAST_RESOLVE` 종료까지.
- 적 공격이 확정되고 `ENEMY_ATTACK_RESOLVE`가 끝날 때까지.
- 보스 페이즈 전환 연출과 데이터 교체 중.
- 승리·패배 판정 후 결과 화면으로 전환 중.
- 일시정지 메뉴.
- 강제 튜토리얼 안내.
- 창 포커스 상실.
- 인식·로딩·전환 시스템이 플레이어 입력을 강제로 막는 구간.

시스템 처리 시간은 적 공격 타이머를 소모하지 않는다.

## 4. 작성 보조 감속

- 접근성 설정으로 `작성 보조 감속`을 제공한다.
- 초기 프로토타입 목표값은 작성 패널 확장 중 `0.5×`다.
- 이 값은 `PLAYTEST_TUNING_REQUIRED`이며 최종 수치가 아니다.
- 감속 사용으로 보상, 콘텐츠, 엔딩, 기록을 제한하지 않는다.
- 감속 중에는 숫자·아이콘·게이지 속도 변화를 함께 표시한다.
- 기본 설정은 `OFF`, 사용자가 설정 또는 일시정지 메뉴에서 켤 수 있다.

## 5. 동시 입력과 판정 순서

### `[구현]`과 적 공격 타이머 0이 경합할 때

- `[구현]` 요청이 먼저 유효 승인되면 마법을 먼저 해결한다.
- 적 공격 타이머가 먼저 0에 도달하면 적 공격을 먼저 해결한다.
- 같은 렌더 프레임이어도 내부 승인 시각·이벤트 순번으로 순서를 고정한다.
- 두 결과를 동시에 적용하지 않는다.

### 적 공격이 작성 중 발생할 때

- 새 획 입력과 `[구현]` 입력을 잠시 막는다.
- 적 공격을 해결한다.
- 플레이어가 생존하고 전투가 계속되면 작성 획·인식 후보·조합을 유지한 채 복귀한다.
- 공격 때문에 현재 조합이 무효가 됐다면 사유를 표시하고 자동 시전하지 않는다.

## 6. 인식 처리 공정성

- 인식이 비동기로 처리되고 플레이어 입력이 가능하면 타이머는 계속 진행한다.
- 인식 엔진이 입력을 강제로 막거나 결과 대기 화면만 보여주면 그 구간은 정지한다.
- 기기 성능 차이로 시스템 대기 시간이 적 공격 위험으로 전환되지 않게 한다.
- 오래된 인식 응답은 요청 토큰으로 폐기한다.

## 7. 상태 흐름

```text
BATTLE_OVERVIEW                 [RUN]
↔ SPELL_PANEL_EXPANDED          [RUN]
↔ SPELL_DRAWING                 [RUN 또는 ASSIST 0.5×]
↔ SPELL_RECOGNITION_REVIEW      [RUN 또는 ASSIST 0.5×]
↔ SPELL_COMBINATION_REVIEW      [RUN 또는 ASSIST 0.5×]
→ CAST_COMMIT_LOCK              [PAUSE]
→ CAST_RESOLVE                  [PAUSE]
→ BATTLE_OVERVIEW               [RUN]

ENEMY_ATTACK_TIMER_ZERO
→ ENEMY_ATTACK_RESOLVE          [PAUSE]
→ BATTLE_END_CHECK              [PAUSE]
→ BATTLE_OVERVIEW               [RUN]

보스 페이즈 종료
→ BOSS_PHASE_TRANSITION         [PAUSE]
→ 새 페이즈 준비 완료
→ BATTLE_OVERVIEW               [RUN]
```

## 8. UI 요구사항

항상 확인 가능:

1. 다음 적 공격까지 남은 시간.
2. 공격 위험 또는 대상.
3. 현재 시간 배율 `1.0× / 0.5× / 정지` 상태.
4. 작성 중에도 적 공격 타이머와 위험 정보.
5. 시스템 해결 중에는 타이머 정지 이유.

색상만으로 시간 상태를 구분하지 않고 숫자·아이콘·문구를 함께 사용한다.

## 9. 금지 사항

- 작성 패널을 열기만 하면 기본 타이머가 완전 정지되는 구조.
- 마법 연출이나 적 피격 연출 중 타이머가 흘러 추가 공격이 누적되는 구조.
- 인식 처리 속도가 느린 기기에서 더 자주 공격받는 구조.
- 감속 옵션 사용자를 보상·기록에서 불이익 처리하는 것.
- 적 공격과 플레이어 마법을 같은 시각에 임의 순서로 처리하는 것.
- 적 공격 후 작성 내용을 이유 없이 초기화하는 것.

## 10. 후행 결정

- 적 공격 간격과 난이도별 변화.
- 작성 보조 감속 최종 배율.
- 일시정지·포커스 복귀 시 준비 유예 시간.
- 공격 피해·방어·상태 이상·승패 규칙.
- 보스 페이즈별 공격 패턴.

## 11. 검증 경계

```text
TIME_FLOW_DIRECTION = USER_APPROVED
DEFAULT_WRITING_TIME = RUNNING
SYSTEM_RESOLUTION_TIME = PAUSED
WRITING_ASSIST_SLOWDOWN = APPROVED_OPTION
INITIAL_ASSIST_MULTIPLIER = 0.5_PLAYTEST_TARGET
EXACT_ATTACK_INTERVAL = NOT_APPROVED
GODOT_IMPLEMENTATION = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
