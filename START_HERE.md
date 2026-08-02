# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 상세 기획은 링크된 책임 원본에서 읽고, 이 문서는 현재 Gate와 작업 순서만 관리한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile` |
| 후속 플랫폼 | `PC` |
| 방향 | `LANDSCAPE_FIXED` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| Core Alignment 병합 | `PR #47 / 1f814a16f3a523379a8ffe4b2a87a02d0c97e287` |
| 마지막 Working Sync | `GR-SYNC-20260802-23 / SHEET_READBACK_PASS` |
| 현재 main Finalization Sync | `GR-SYNC-20260802-24` |
| 완료 Decision | `GM-CORE-SYSTEM-ALIGNMENT-01` |
| 승인안 | `A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS` |
| Grill Batch | `0/10 / pending 0` |
| 구현 진입 | `APPROVED_CONDITIONAL_FOUNDATION_POC` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 반드시 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`
3. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_SUMMON_CLARIFICATION_ADVERSARIAL_REVIEW_2026-08-02.md`
4. `docs/planning/GRIMOIRE_CORE_SYSTEM_ALIGNMENT_AUDIT_2026-08-02.md`
5. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
7. `docs/planning/sync/GR-SYNC-20260802-24-MAIN.md`
8. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
9. 질문 주제의 세부 승인 책임 원본
10. 과거 `ACTIVE_CONTEXT`, `DEVELOPMENT_GATES`, `DESIGN_DOCUMENT_REGISTRY`는 Core Alignment Override와 충돌하지 않는 범위에서만 사용하며 다음 정합성 작업에서 직접 교정한다.

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미와 상황의 조건을 배우고, 직접 작성·Stock·소환수의 주기 지원을 상황에 맞게 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

> 정답 주문을 찾는 것이 아니라, 같은 글자 의미를 현재 상황에 맞게 설계하고 명시적으로 구현한 뒤, 설명 가능한 세계 변화와 포기한 대상을 받아들이는 재미.

핵심 판단:

1. 지금 상황에서 무엇을 바꿀 것인가.
2. 어떤 의미·범위·출력·위험을 선택할 것인가.
3. 직접 작성·Stock·소환수 중 어떤 수단을 언제 운용할 것인가.
4. 무엇을 지키고 무엇을 포기할 것인가.

## 승인된 시스템 계층

```text
비타협 핵심 플레이
→ 핵심 진행
→ 핵심을 시험하는 적용 모드
→ 보조·운용 시스템
→ 전달·안전·기술 인프라
```

### 비타협 핵심 플레이

```text
상황·조건·위험 판독
→ 직접 작성·Stock·소환 운용 중 수단 선택
→ 의미 조합·상황 검증
→ 결과·비용·위험 검토
→ 명시적 Commit 또는 [소환] Commit
→ 플레이어 주문·소환수 주기 행동 원자 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

### 핵심 진행

- 학습 나선 Chapter.
- 다계열 수강·전문화.
- 수강 슬롯·맥락 포트폴리오 성장.
- 결과 태그·숨김 소폭 학기 평가·학기말 종합 평가.

### 적용 모드

- 비전투 Situation.
- 상황 해결형 전투.
- 제작·미니게임.
- 선택형 현장실습.

전투와 제작은 핵심을 시험하는 모드이며 상황 판독·의미 설계보다 상위 핵심이 아니다.

## 작성 피로 완화 계약

### Stock

- 직접 작성 반복 피로를 줄이는 보조 시스템.
- 같은 문제에서 이미 확인한 글자는 Token으로 재선택 가능.
- 신규·미숙·중요 글자는 직접 작성 또는 직접 작성 요소의 명시적 조립 우선.
- 플레이어 Stock 사용은 현재 상황 검증과 명시적 Commit 필요.
- 소환수는 주기 행동으로 Stock을 충전할 수 있음.
- 자동 최적 추천 금지.
- 저장 단위·용량·비용·보존 범위는 `GM-STOCK-SYSTEM-01`에서 결정.

### 소환수

```text
메인 소환수 = 상시 활성
기타 소환수 = [소환] 주문으로 호출
활성 소환수 = 일정 시간마다 [주문] 사용 또는 [Stock] 충전
```

- 메인 소환수는 별도 소환 주문 없이 상시 효과·주기 행동 적용.
- 기타 소환수는 플레이어가 `[소환]` 주문을 작성하거나 승인된 Stock으로 호출한 뒤 활성.
- `[소환]`에는 상황 검토·비용·명시적 Commit이 필요.
- 소환 후 지정 주문 사용 또는 Stock 충전은 승인된 자동화.
- 자동 행동은 예고·주기·대상 또는 적용 규칙과 기여도를 표시.
- Pause·Save/Resume에서 중복 Tick·주문·Stock 충전 금지.
- 주기·주문 출처·대상 규칙·지속시간·동시 소환·중첩·Pause 진행은 `GM-SUMMON-SYSTEM-01`에서 결정.

## 전체 게임 목표

```text
새 마법 원리·상황 질문 학습
→ 휴식·준비·교류·현장실습 선택
→ 교내 일상 응용·축제·연구·제작에서 통제된 응용
→ 메인 현장 사건에서 직접 작성·Stock·소환수 운용과 책임 선택
→ 마도서 복기·교수 누적 평가
→ 다음 원리·심화·전문화 개방
```

별도 시험 Chapter와 시험 전용 미니게임은 없다. 평가 증거는 수업 학습, 비전투 응용, 현장 수행, 연구·제작, 복기·설명을 합산한다.

## Vertical Slice 대표 범위

```text
수업·교내 연습
→ 자유일정
→ 교내 일상 응용 또는 수업 후 실습
→ 축제·비전투 응용
→ 대표 제작 사례
→ 직접 작성·Stock·소환수를 사용하는 현장 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기말 평가·장기 Preview
```

- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 작성 횟수와 Stock·소환수 지원 비율은 사람 테스트 전 `TEST_VALUE`.
- 시간 초과 시 Preview·이동·중복 설명·제작 단계·자유일정 반복부터 줄인다.

## 승인된 Mobile UX 코어

```text
장면
→ Context Card
→ 하나의 Focus Task
→ 필요 시 확장형 우측 Writing Panel
→ 직접 주문 또는 [소환] Commit
→ 플레이어·소환수 결과 원자 적용
→ 결과·세계 변화
→ Grimoire
→ Hub 또는 다음 Anchor
```

작성 중에도 적·대상, 적 의도와 시간, 환경 위험과 보존 대상, HP·마나, 활성 소환수와 다음 주기 행동을 판독할 수 있어야 한다.

## 구현 진입 승인 범위

전체 Vertical Slice 본제작 승인이 아니다.

Execution Readiness PASS 뒤 허용 후보:

- 최소 Godot 프로젝트와 Headless 테스트.
- Focus Task 순수 상태 전이.
- Atomic Result Ledger.
- Stroke Buffer·Draft·Candidate 상태.
- Deterministic Test Recognizer.
- pause/resume·focus loss Snapshot.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

계속 금지:

- 전체 46~53분 콘텐츠.
- 실제 글자 인식·ML·훈련 데이터.
- 최종 Art·Audio·Asset Import.
- Boss 다중 페이즈.
- 완성 Grimoire/Main.
- Stock·소환수 상세 구현.
- 최종 밸런스·성능·Touch 수치.
- Store·배포·사업화.

## 현재 작업 순서

```text
Core Alignment main·Sheet Readback 최종화
→ Cold-start Override를 ACTIVE_CONTEXT·DEVELOPMENT_GATES·DESIGN_DOCUMENT_REGISTRY에 직접 흡수
→ GM-STOCK-SYSTEM-01
→ GM-SUMMON-SYSTEM-01
→ Godot Toolchain preflight
→ Base v9.4.3 최종 main에서 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0일 때만 Foundation POC 코드 실행
```

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODE_EXECUTION = BLOCKED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_PERIODIC_SUPPORT = APPROVED_CONCEPT
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
