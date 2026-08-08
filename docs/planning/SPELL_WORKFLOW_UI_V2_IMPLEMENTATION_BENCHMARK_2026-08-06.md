# Spell Workflow UI v2 구현 벤치마크 경계

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
preserved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
implementation_task: 1
baseline_main: 917ead7499482801610ba95ce37efafd1662d994
status: IMPLEMENTATION_BOUNDARY_ACTIVE
```

## 목적

이 문서는 구현 중 외부 사례나 일반적인 전문 패턴을 참고하더라도 GRIMOIRE의 승인된 주문 흐름과 기존 Runtime 권위를 왜곡하지 않도록 허용·거부 경계를 고정한다.

## 기존 GRIMOIRE 기준선

다음은 저장소에서 이미 검증된 구현 패턴이며 우선 재사용한다.

- `RefCounted` 기반 도메인 서비스
- 명시적인 `create(...)` 검증과 실패 상태 반환
- 결정론적 커스텀 Godot headless 테스트 러너
- UI를 상태 표시와 사용자 의도 전달 어댑터로 제한
- `FIVE_POINT_STAR`, Typed Glyph Stock, Vault, reservation, exactly-once 결과 원장
- PR #77의 `GrimoireThemeFactory`, `StarCircuitBoard`, Navy/Gold/Cyan 시각 토큰

## 채택하는 전문 패턴

### 1. 준비 결과를 불변 값으로 전달

2단계가 글자를 소비해 만든 결과는 이후 화면이 임의 수정할 수 없는 `PreparedSpell` 값으로 전달한다. 대상·마나·실제 결과는 포함하지 않는다.

### 2. 준비와 사용을 별도 자원 트랜잭션으로 분리

- 주문 준비: 예약된 글자만 exactly-once 소비
- 주문 사용: 완성 주문·마나·대상 결과만 exactly-once 적용

두 단계의 rollback과 idempotency key를 분리해 한 단계의 재시도가 다른 자원을 중복 소비하지 않게 한다.

### 3. 외부 반복 가능 작업마다 idempotency key 사용

버튼 중복 입력, 재시도, Scene 재진입이 같은 요청을 두 번 적용하지 않도록 준비 요청과 사용 요청에 서로 다른 transaction ID를 둔다.

### 4. 다중 자원 변경 전 snapshot과 복구 경로 확보

예약·소비·원장 기록 중 하나가 실패하면 부분 적용을 남기지 않는다. 현재 Ledger와 Inventory의 책임 경계를 유지하면서 transaction 단위 release 또는 restore를 제공한다.

### 5. 모바일 화면은 질문 하나와 주행동 하나를 우선

- 글자 그리기: 어떤 글자를 획득할 것인가
- 회로 배치: 어떤 글자 조합으로 주문을 준비할 것인가
- 주문 사용: 어느 대상에 어떤 결과를 적용할 것인가

1280×720 Mobile Landscape에서 각 화면의 핵심 질문과 primary action이 경쟁하지 않게 한다.

## 거부하는 패턴

다음은 구현 편의가 있어도 채택하지 않는다.

- 하나의 coordinator 메서드가 글자와 마나를 동시에 소비
- 회로 배치 화면에서 대상 선택
- UI animation 완료 signal을 commit 권위로 사용
- PR #77 Theme 토큰을 새 파일에 복제
- `BURST`와 `AMPLIFY`를 별도 v2 글자 카드로 동시 노출
- UI Node가 Inventory, Mana 또는 결과의 책임 원본이 됨
- 기존 Star Runtime을 삭제하거나 테스트를 비활성화한 뒤 새 흐름으로 교체

## 사실·추론·권장안 구분

### SOURCE_FACT

- 승인 흐름은 `글자 그리기 → 회로 배치 → 주문 사용`이다.
- Stage 2는 글자만 소비하고 Stage 3는 마나와 결과만 적용한다.
- `BURST`는 v2에서 별도 카드가 아니라 `AMPLIFY` 과부하 별칭이다.
- 기존 `FIVE_POINT_STAR`와 exactly-once 계약은 보호 대상이다.

### MODEL_INFERENCE

- 준비와 사용을 별도 불변 객체와 transaction으로 나누면 모바일 재입력 및 재진입에서 중복 소비 위험을 낮출 수 있다.
- 화면별 책임을 한 질문으로 제한하면 작은 화면에서 상태 설명과 행동 선택의 충돌을 줄일 수 있다.

### PROJECT_RECOMMENDATION

- 기존 Runtime을 compatibility baseline으로 유지하고 새 Workflow Layer를 추가한다.
- 모든 신규 도메인 함수는 UI와 분리된 headless 테스트를 먼저 작성한다.
- Main Scene 변경은 전체 자동 테스트와 3화면 렌더 증거가 통과한 마지막 Task에서만 수행한다.

### DO_NOT_COPY

유사 게임의 주문 제작 UI, 자원 경제, 카드 체계, 애니메이션을 기능 단위로 그대로 복제하지 않는다. 참고 사례는 GRIMOIRE의 승인된 핵심 재미와 책임 경계를 검증하는 비교 자료로만 사용한다.
