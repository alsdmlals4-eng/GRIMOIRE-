# GRIMOIRE UX/UI Validation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** GRIMOIRE의 마법 글자 작성·인식·주문 설계 UX를 구현 전 단계에서 검증 가능한 fixture, 오류 분류, 프로토타입 과제와 사람 테스트 계약으로 고정한다.

**Architecture:** 현재 저장소는 `PLANNING_ONLY_PROFILE`이고 Godot 제품 구현이 시작되지 않았다. 따라서 먼저 화면 흐름·입력 fixture·판정 기준을 문서로 확정하고, 시각 방향과 실행 프로필이 승인된 뒤 별도 Codex Goal에서 최소 작성 오버레이를 구현·검증한다.

**Tech Stack:** GitHub Markdown/Issues, 모바일 가로형 UI 계약, Godot·GDScript는 후속 승인 단계에서만 사용.

## Global Constraints

- `docs/ACTIVE_CONTEXT.md`의 `PLANNING_ONLY_PROFILE`, `Work Mode: PLAN`, 구현 `NOT_STARTED`를 유지한다.
- 현재 차단 결정 `ART-STYLE-01`과 Art Bible Gate를 건너뛰지 않는다.
- 입력 인식 실패와 주문 문법·설계 실패를 합치지 않는다.
- UI는 인식 점수·주문 문법·마나·피해를 자체 계산하지 않는다.
- 제품 Scene·script·data·asset과 HTML 기획 대시보드는 변경하지 않는다.
- 미실행 런타임·실기기·사람 검증은 `NOT_RUN` 또는 `HUMAN_NOT_RUN`으로 유지한다.

---

### Task 1: 현행 Gate와 UX 책임 원본 고정

**Files:**
- Read: `AGENTS.md`
- Read: `docs/ACTIVE_CONTEXT.md`
- Read: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Read: `docs/UX_UI_SYSTEM.md`
- Read: `docs/BASE_UX_UI_ADOPTION.md`

**Interfaces:**
- Consumes: 승인된 플레이어 약속·화면 표현·직접 작성 규칙.
- Produces: 구현 전 검증 범위와 금지 범위.

- [ ] **Step 1:** 제품 단계, Gate, 실행 프로필, 현재 차단 결정을 검증 Issue에 기록한다.
- [ ] **Step 2:** `직접 작성`, `입력 실패와 설계 실패 분리`, `자동 정답 제시 금지`를 보호 조건으로 고정한다.
- [ ] **Step 3:** Base main SHA와 프로젝트 UX 정본 경로를 기록한다.
- [ ] **Step 4:** 실행 프로필 전환 전 Codex·Godot 변경을 금지한다.

### Task 2: 입력·오류 fixture 세트 정의

**Files:**
- Create after UX approval: `docs/validation/GRIMOIRE_UX_UI_FIXTURE_CATALOG.md`
- Read: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- Read: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`

**Interfaces:**
- Consumes: 마법 글자·회로·주문 설계 규칙.
- Produces: 프로토타입과 사람 테스트가 공유하는 최소 fixture.

- [ ] **Step 1:** 정상 인식 입력 2개를 정의한다.
- [ ] **Step 2:** 두 후보가 비슷한 애매한 입력 2개를 정의한다.
- [ ] **Step 3:** 의도와 다른 글자로 읽히는 오인식 입력 1개를 정의한다.
- [ ] **Step 4:** 인식은 성공하지만 주문 문법이 충돌하는 조합 2개를 정의한다.
- [ ] **Step 5:** 문법은 유효하지만 비용이 부족한 주문 1개를 정의한다.
- [ ] **Step 6:** 발동은 성공했지만 대상 저항으로 효과가 제한되는 사례 1개를 정의한다.
- [ ] **Step 7:** 각 fixture에 예상 UI 상태, 허용 수정 행동, 금지 오인 메시지를 기록한다.

### Task 3: 작성 오버레이 UX 흐름 정의

**Files:**
- Create after UX approval: `docs/validation/GRIMOIRE_UX_UI_VALIDATION_PACKET.md`
- Read: `docs/UX_UI_SYSTEM.md`
- Read: `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

**Interfaces:**
- Consumes: Task 2 fixture.
- Produces: 첫 글자→첫 유효 주문→첫 실패 복기의 검증 과제.

- [ ] **Step 1:** 작성 영역과 화면 이동·스크롤 제스처 경계를 명시한다.
- [ ] **Step 2:** stroke 접수, 인식 중, 후보 확인, 문법 판정, 비용 확인, 발동 결과 상태를 분리한다.
- [ ] **Step 3:** `마지막 stroke 실행 취소`, `글자 삭제`, `전체 초기화`를 서로 다른 행동으로 정의한다.
- [ ] **Step 4:** 후보 선택 시 원본 stroke와 후보 형태·이름·순위·확신 문구를 비교하게 한다.
- [ ] **Step 5:** 문법 오류는 문제 글자·관계·수정 방향을 표시하고 인식기를 다시 실행하지 않게 한다.
- [ ] **Step 6:** 결과 화면은 입력→인식→문법→비용→효과 순서의 인과를 보존한다.

### Task 4: 사람 테스트 계약과 통과 기준 정의

**Files:**
- Create after UX approval: `docs/validation/GRIMOIRE_UX_UI_VALIDATION_PACKET.md`
- Update after execution: `docs/UX_UI_SYSTEM.md`

**Interfaces:**
- Consumes: Task 2~3.
- Produces: 시각·입력·오류 이해도 판정.

- [ ] **Step 1:** 신규 플레이어 5명에게 튜토리얼 도움 없이 정상 주문 1개를 작성하게 한다.
- [ ] **Step 2:** 애매한 입력에서 후보를 비교·수정하게 한다.
- [ ] **Step 3:** 문법 오류와 비용 부족을 각각 만나게 하고 원인·수정 행동을 설명하게 한다.
- [ ] **Step 4:** 5명 중 4명 이상이 인식 실패와 설계 실패를 혼동하지 않아야 통과하도록 정한다.
- [ ] **Step 5:** 5명 중 4명 이상이 undo·삭제·초기화 차이를 도움 없이 사용해야 통과하도록 정한다.
- [ ] **Step 6:** 손가락 가림·오입력·입력 지연은 실기기 단계에서 별도 기록한다.

### Task 5: 구현 진입 Gate와 Codex Goal 경계

**Files:**
- Update after approval: `docs/DEVELOPMENT_GATES.md`
- Update after approval: `docs/ACTIVE_CONTEXT.md`
- Create after approval: 별도 Codex Goal Issue

**Interfaces:**
- Consumes: Art Bible 승인, 실행 프로필 전환, Task 2~4 계약.
- Produces: 최소 작성 오버레이 구현 범위.

- [ ] **Step 1:** `ART-STYLE-01`과 Art Bible 승인 전 UI 자산·제품 Scene 구현을 금지한다.
- [ ] **Step 2:** 실행 프로필 전환 후 실제 입력·인식·주문 판정 소유자를 읽기 전용으로 조사한다.
- [ ] **Step 3:** 최소 구현은 작성 오버레이, 후보 선택, 문법 상태, 비용 상태, 결과 복기만 포함한다.
- [ ] **Step 4:** 인식 알고리즘·주문 문법·전투 수치 변경은 별도 변경 제안으로 분리한다.
- [ ] **Step 5:** 자동 검사, 모바일 실기기, 사람 이해, 접근성 사용자 증거를 독립 상태로 보고한다.

## Verification Commands

현재 계획 PR은 문서·JSON 구조만 검토한다. Godot 프로젝트가 없으므로 런타임 성공을 주장하지 않는다.

```text
- Markdown 링크와 책임 원본 경로 확인
- docs/BASE_UX_UI_ADOPTION.md의 Base main SHA 확인
- 제품 Scene·script·data·asset diff 없음 확인
```
