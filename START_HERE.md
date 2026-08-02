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
| main 기준 | `eaf05c24b90d233964d093b0e772e5e94b505f36` |
| 마지막 main Sync | `GR-SYNC-20260802-22 / SHEET_READBACK_PASS` |
| 현재 Working Sync | `GR-SYNC-20260802-23` |
| 현재 Draft PR | `#47 / core system alignment` |
| 현재 Decision | `GM-CORE-SYSTEM-ALIGNMENT-01` |
| 승인안 | `A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS` |
| Grill Batch | `1/10 / pending 1` |
| 구현 진입 | `APPROVED_CONDITIONAL_FOUNDATION_POC` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 반드시 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_COLD_START_OVERRIDE_2026-08-02.md`
3. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`
4. `docs/planning/GRIMOIRE_CORE_SYSTEM_ALIGNMENT_AUDIT_2026-08-02.md`
5. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
7. `docs/planning/sync/GR-SYNC-20260802-23-WORKING.md`
8. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
9. `docs/planning/GRIMOIRE_FULL_GAME_STRUCTURE_COMPLETION_OVERRIDE_2026-08-02.md`
10. `docs/planning/MOBILE_UX_FLOW_01_APPROVAL_2026-08-02.md`
11. `docs/planning/MOBILE_WRITING_BATTLE_WIREFRAME_01_APPROVAL_2026-08-02.md`
12. 질문 주제의 세부 승인 책임 원본
13. 과거 `ACTIVE_CONTEXT`, `DEVELOPMENT_GATES`, `DESIGN_DOCUMENT_REGISTRY`는 새 Override와 충돌하지 않는 범위에서만 사용

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미와 상황의 조건을 배우고, 직접 작성·Stock·소환수의 도움을 상황에 맞게 선택해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

> 정답 주문을 찾는 것이 아니라, 같은 글자 의미를 현재 상황에 맞게 설계하고 명시적으로 구현한 뒤, 설명 가능한 세계 변화와 포기한 대상을 받아들이는 재미.

핵심 판단:

1. 지금 상황에서 무엇을 바꿀 것인가.
2. 어떤 의미·범위·출력·위험을 선택할 것인가.
3. 무엇을 지키고 무엇을 포기할 것인가.

## 승인된 시스템 계층

```text
비타협 핵심 플레이
→ 핵심 진행
→ 핵심을 시험하는 적용 모드
→ 보조 시스템
→ 전달·안전·기술 인프라
```

### 비타협 핵심 플레이

```text
상황·조건·위험 판독
→ 직접 작성 또는 승인된 피로 완화 수단
→ 의미 조합·상황 검증
→ 결과·비용·위험 검토
→ 명시적 Commit
→ 원자 결과 적용
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
- 신규·미숙·중요 글자는 직접 작성 또는 직접 작성한 요소의 명시적 조립 우선.
- Stock을 사용해도 현재 상황 검증과 명시적 Commit 필요.
- 자동 최적 추천·자동 시전 금지.
- 저장 단위·용량·비용·보존 범위는 `GM-STOCK-SYSTEM-01`에서 결정.

### 소환수

- 동반 정령은 위험·불안정 감지와 관계·발견·복기 연결.
- 수호형 소환수는 피해 완화·Draft 보호·작성 시간 확보.
- 현재 소환수의 글자 작성·조합·대상 선택·자동 시전 대행은 승인되지 않음.
- 직접 대행이 필요하면 `GM-SUMMON-FATIGUE-DELEGATION-01`에서 별도 승인.

## 전체 게임 목표

```text
새 마법 원리·상황 질문 학습
→ 휴식·준비·교류·현장실습 선택
→ 교내 일상 응용·축제·연구·제작에서 통제된 응용
→ 메인 현장 사건에서 전투·환경 해결과 책임 선택
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
→ 현장 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기말 평가·장기 Preview
```

- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 필수 성공 작성 7회, 복구 포함 목표 상한 10회는 사람 테스트 전 `TEST_VALUE` 성격을 가진다.
- 시간 초과 시 Preview·이동·중복 설명·제작 단계·자유일정 반복부터 줄인다.

## 승인된 Mobile UX 코어

```text
장면
→ Context Card
→ 하나의 Focus Task
→ 필요 시 확장형 우측 Writing Panel
→ 단일 원자 Commit
→ 결과·세계 변화
→ Grimoire
→ Hub 또는 다음 Anchor
```

작성 중에도 적·대상, 적 의도와 시간, 환경 위험과 보존 대상, HP·마나를 유지한다. Panel 축소·중단에는 Draft를 보존하고 명시적인 전체 취소에서만 폐기한다.

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
- Stock 상세 구현과 소환수 직접 대행.
- 최종 밸런스·성능·Touch 수치.
- Store·배포·사업화.

## 현재 작업 순서

```text
GM-CORE-SYSTEM-ALIGNMENT-01 GitHub·Sheet 동기화
→ Draft PR #47 최종 HEAD CI·적대 Gate·리뷰 검증
→ 사용자 명시 병합 승인
→ main·Sheet Readback 및 counter 최종화
→ Cold-start Override를 원본 문서에 직접 흡수
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
SUMMON_DIRECT_DELEGATION = NOT_APPROVED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
