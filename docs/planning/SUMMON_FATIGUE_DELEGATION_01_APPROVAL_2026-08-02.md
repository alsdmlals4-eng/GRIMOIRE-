# GM-SUMMON-FATIGUE-DELEGATION-01 — 소환수 주기 주문·Stock 지원 승인

## 1. 승인 상태

```yaml
decision_id: GM-SUMMON-FATIGUE-DELEGATION-01
status: USER_APPROVED_ACTIVE
approved_option: A_MAIN_ALWAYS_ACTIVE_PLUS_SUMMON_SPELL_ACTIVATED_PERIODIC_SUPPORT
approved_at: 2026-08-02T21:57:00+09:00
parent_decision: GM-CORE-SYSTEM-ALIGNMENT-01
grill_me_batch: 2_of_10
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

사용자는 소환수가 단순 보호 보조가 아니라 일정 시간마다 `[주문]`을 사용하거나 `[Stock]`을 채우는 시스템이며, 메인 소환수는 상시 적용되고 다른 소환수는 플레이어가 `[소환]` 주문을 사용한 뒤에만 적용된다고 확정했다.

## 2. 시스템 계약

### 메인 소환수

- 메인 소환수는 장착·동행 상태에서 상시 활성이다.
- 전투 진입 때마다 별도 `[소환]` 주문을 요구하지 않는다.
- 정해진 주기와 조건에 따라 소환수 고유 주문을 사용하거나 Stock을 보충한다.
- 관계·성장·장비 또는 선택에 따라 역할이 달라질 수 있으나 상세 성장 구조는 후속 설계다.

### 기타 소환수

- 기본 상태에서는 비활성이다.
- 플레이어가 직접 `[소환]` 주문을 설계하고 명시적으로 구현해야 활성화된다.
- 소환 성공 뒤 정해진 지속·해제 조건 동안 주기 지원을 수행한다.
- 소환 주문 자체는 마나·시간·Stock·기회비용 중 하나 이상의 비용을 가져야 하며 정확한 수치는 TEST_VALUE다.

### 주기 지원

소환수는 활성 상태에서 다음 중 승인된 역할을 가진다.

1. **주기 주문 사용**: 소환수 고유 또는 사전 지정된 주문을 일정 시간마다 사용한다.
2. **Stock 보충**: 정해진 규칙과 상한 안에서 Stock을 보충한다.

한 소환수가 두 역할을 동시에 가지는지, 역할을 전환하는지, 어떤 주문을 사용하는지는 후속 상세 설계 대상으로 남긴다.

## 3. 핵심 재미 보호 계약

소환수의 자동 행동은 반복 입력과 시간 압박을 줄이는 보조 자동화다. 다음 핵심 판단을 대체해서는 안 된다.

- 현재 Situation의 주요 목표와 보존 대상을 정하는 판단.
- 주요 주문의 의미 조합과 대가 선택.
- 사건을 종결하는 결정적 Commit.
- 숨겨진 정답이나 항상 최적인 해법 추천.

따라서 주기 주문은 다음 계약을 따른다.

- 주문 또는 효과 종류가 플레이어에게 사전에 공개된다.
- 발동 주기·남은 시간·대상 규칙·Stock 보충량을 UI에서 확인할 수 있다.
- 결과는 Atomic Result Ledger에 한 번만 기록된다.
- 자동 행동 때문에 플레이어 Draft가 폐기되거나 대상이 임의 변경되지 않는다.
- 사건의 핵심 책임 선택과 최종 해결은 플레이어에게 남긴다.

## 4. 적대적 보호선

### 무한 자동화 방지

- Stock은 상한을 초과해 누적되지 않는다.
- 소환수가 채운 Stock으로 소환 주문을 무한 반복하는 자기증식 루프를 금지한다.
- 소환수가 다른 소환수를 자동 소환하지 않는다.
- 재소환·교체·중첩·동시 활성 수는 별도 제한을 가진다.

### 오인과 블랙박스 방지

- 소환수 발동 전에 짧은 예고를 제공한다.
- 어떤 주문·효과가 어떤 대상에 적용됐는지 결과 로그에 표시한다.
- 소환수 행동과 플레이어 Commit의 비용·결과 소유권을 분리한다.
- 자동 주문의 실패·무효·대상 부재도 설명한다.

### 핵심 재미 침식 방지

- 소환수만으로 주요 Situation이 자동 종료되지 않는다.
- 자동 주문이 항상 최적 해법이 되지 않는다.
- 직접 작성과 Stock 선택의 의미가 사라질 정도로 발동 빈도·효율을 높이지 않는다.
- 신규 글자 학습과 중요한 첫 구현은 플레이어 직접 작성 우선 원칙을 유지한다.

## 5. 현재 미확정

다음은 이번 승인으로 확정하지 않는다.

- 주기 시간과 첫 발동 지연.
- 소환 지속 시간·해제·사망·교체 규칙.
- 동시 활성 수와 소환 슬롯.
- 각 소환수의 주문 목록·대상 우선순위.
- Stock의 저장 단위·상한·보충량.
- 주기 주문의 자원 소모 여부.
- 비전투 Situation에서의 소환수 자동 행동.
- 메인 소환수 교체 가능 여부와 성장 구조.

이 값들은 Prototype과 후속 소환수·Stock 상세 Decision에서 검증한다.

## 6. Foundation POC 영향

기존 Foundation POC 구현 범위에는 소환수 주기 자동 행동과 실제 Stock 경제가 포함되지 않는다. 다만 향후 확장을 위해 다음 인터페이스 요구를 계획 재검증 시 고려한다.

- 주기 효과를 결정론적으로 처리하는 tick/event 계약.
- 플레이어 Commit과 소환수 자동 행동의 원자 Ledger 소유권 분리.
- pause/resume 후 남은 주기 복원.
- 중복 발동·재개 직후 이중 발동 방지.

실제 기능 구현은 별도 Execution Readiness와 구현 범위 승인이 필요하다.

## 7. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
SUMMON_PERIODIC_RUNTIME = DESIGN_APPROVED_IMPLEMENTATION_BLOCKED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_NUMERIC_TUNING = TEST_VALUE
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```
