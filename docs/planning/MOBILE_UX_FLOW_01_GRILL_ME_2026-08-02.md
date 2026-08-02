# GM-MOBILE-UX-FLOW-01 — Mobile Landscape 상태 전환·정보 흐름 Grill Me

## 1. 상태

```yaml
decision_id: GM-MOBILE-UX-FLOW-01
status: USER_DECISION_REQUIRED
parent_decision: GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
current_grill_me_batch_if_approved: 9_of_10
gate: MOBILE-UX-FLOW-01
implementation: NOT_STARTED
codex: BLOCKED
```

## 2. 결정 질문

Mobile Landscape에서 학교 Hub·자유일정·수업·비전투 응용·제작 미니게임·전투·직접 작성·마도서·중단복귀를 어떤 흐름으로 연결해야, 작은 화면에서도 현재 목표와 다음 행동이 명확하고 몰입과 조작 안정성을 함께 유지할 수 있는가?

이 결정은 화면의 픽셀 배치가 아니라 **상태 전환·정보 우선순위·복귀 규칙**을 잠근다. 구체 Wireframe은 다음 결정에서 작성한다.

## 3. A안 — 장면 중심 Contextual Focus Flow / 권장

```text
학교·현장 장면
→ 현재 목표가 있는 Context Card
→ 한 번에 하나의 Focus Task
→ 결과·변화 확인
→ 마도서/다음 일정
```

### 전역 규칙

- 안전 장면에서만 `현재 목표 / 일정 / 마도서 / 설정`의 얇은 전역 진입점을 제공한다.
- 수업·비전투·제작·전투는 각각 별도 장르 화면이 아니라 같은 `Focus Task` 계약을 사용한다.
- 직접 작성 패널은 필요한 순간에만 열리며, 후보 확인·수정·구현 후 장면 결과로 돌아간다.
- 시간 압박 전투 중에는 전역 메뉴를 감추거나 제한하고 Pause·접근성·안전 종료만 보장한다.
- 장면 전환점·Focus Task 진입 전·결과 적용 후를 Save/Resume Anchor로 사용한다.
- 중단복귀 시 `무엇을 하던 중이었는지 / 무엇이 아직 적용되지 않았는지 / 다음 안전 행동`을 표시한다.

### 대표 흐름

```text
학교 Hub
→ 자유일정 또는 필수 장면 선택
→ 상황 관찰
→ 비전투/제작/전투 Focus Task
→ 필요 시 Writing Panel
→ 결과·부작용·보존 대상 확인
→ Grimoire 기록
→ Hub 또는 다음 Chapter Anchor
```

장점:

- 장면 몰입을 유지하면서 한 번에 하나의 행동에 집중할 수 있다.
- Writing·Battle·Crafting이 공통 상태 계약을 공유해 Save·Resume·QA를 통제하기 쉽다.
- 작은 화면에서 상시 메뉴와 정보 과밀을 줄인다.
- 현재 승인된 `적 중심 전투 + 우측 작성 패널`과 연결하기 쉽다.

위험:

- 전역 기능이 숨겨져 플레이어가 마도서·일정 위치를 잊을 수 있다.
- Context Card와 전환 애니메이션이 많으면 흐름이 느려질 수 있다.

보정:

- 안전 장면의 전역 진입 위치와 아이콘 의미를 일관되게 유지한다.
- 같은 결과를 여러 중간 화면에서 반복 설명하지 않는다.
- Reduced Motion에서는 전환을 즉시화한다.

## 4. B안 — 상시 Dashboard·다중 패널형

학교·현장·전투 모든 화면에 일정·관계·재료·마도서·목표·작성 진입점을 상시 표시한다.

장점:

- 언제든 모든 정보에 접근하기 쉽다.
- 장기 RPG의 관리 감각과 수치 비교가 강하다.

위험:

- Mobile Landscape에서 전장·캐릭터·작성 공간을 침범한다.
- 플레이어가 현재 문제보다 메뉴·수치 최적화에 집중할 수 있다.
- Touch target과 Safe Area를 만족시키면서 정보 과밀을 피하기 어렵다.

## 5. C안 — 앱형 독립 화면·메뉴 중심

```text
학교 메뉴
→ 수업 앱
→ 일정 앱
→ 제작 앱
→ 전투 앱
→ 마도서 앱
```

장점:

- 기능별 구현·테스트·탐색 구조가 단순하다.
- 각 화면의 정보량을 독립적으로 통제하기 쉽다.

위험:

- 학교와 현장이 기능 선택 메뉴처럼 느껴진다.
- 장면의 원인·작성·세계 변화·기록이 분절된다.
- 화면 왕복과 로딩·중단복귀 지점이 늘어난다.

## 6. 권장 판정

`A — 장면 중심 Contextual Focus Flow`를 권장한다.

핵심 이유:

- GRIMOIRE의 핵심은 메뉴 관리보다 상황을 관찰하고 직접 글자를 써서 세계 변화의 인과를 확인하는 것이다.
- 수업·비전투·제작·전투를 공통 Focus Task 상태기로 연결하면 Mobile Save/Resume와 결과 원자 적용을 함께 검증할 수 있다.
- 구체적인 Writing/Battle 화면 배치는 흐름 계약이 잠긴 뒤 결정해야 화면이 게임 규칙을 대신 만들지 않는다.

## 7. A안 승인 시 확정되는 것

- 장면 중심 + 한 번에 하나의 Focus Task를 기본 UX 흐름으로 사용한다.
- 안전 장면에서만 일정·마도서·설정의 일관된 전역 진입점을 제공한다.
- Writing Panel은 상황 내부의 임시 Focus Layer로 사용한다.
- Battle·Crafting·Noncombat은 공통 진입/결과/복귀 계약을 공유한다.
- Save/Resume Anchor는 Focus Task 전·결과 적용 후를 우선한다.
- 다음 결정은 `GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`이다.
- Grill Me counter는 `9/10`이 된다.
