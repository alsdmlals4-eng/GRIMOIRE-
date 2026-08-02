# GRIMOIRE 핵심·보조 시스템 정리 및 적대적 정합성 감사 — 2026-08-02

## 1. 상태

```yaml
audit_id: GR-AUD-CORE-SYSTEM-ALIGNMENT-20260802-01
status: DRAFT_REVIEW_REQUIRED
scope: PLANNING_CLASSIFICATION_AND_CANON_CONSISTENCY
new_design_decision: false
grill_counter_change: 0
implementation: NOT_STARTED
product_code_changed: false
google_sheet_changed: false
base_release_on_main: 9.4.3
main_at_audit_start: eaf05c24b90d233964d093b0e772e5e94b505f36
```

이 문서는 승인된 기획을 폐기하거나 재기획하지 않는다. 기존 정본에서 핵심 재미·목표·핵심 시스템·보조 시스템을 복원하고, 서로의 역할과 우선순위가 맞는지 적대적으로 검토한다. 개선 제안은 사용자 승인 전까지 정본을 변경하지 않는다.

## 2. 근거 정본

- `START_HERE.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
- `docs/planning/FULL_GAME_MACRO_LOOP_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_CHAPTER_RHYTHM_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_GROWTH_CHOICE_COST_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_REWARD_ECONOMY_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_FAILURE_LONG_TERM_IMPACT_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_SCOPE_ENDING_01_APPROVAL_2026-08-02.md`
- `docs/planning/VERTICAL_SLICE_REPRESENTATIVENESS_01_APPROVAL_2026-08-02.md`
- `docs/planning/MOBILE_UX_FLOW_01_APPROVAL_2026-08-02.md`
- `docs/planning/MOBILE_WRITING_BATTLE_WIREFRAME_01_APPROVAL_2026-08-02.md`
- Google Sheet `05_GDD_요약`, `12_핵심루프`, `40_핵심시스템_메인콘텐츠`

## 3. 플레이어 약속과 핵심 재미

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 상황의 조건과 위험을 읽은 뒤 주문을 직접 설계해, 내가 선택한 결과와 대가로 세계를 바꾸는 마법 RPG.

### 핵심 재미 한 문장

> **정답 주문을 찾는 것이 아니라, 같은 글자 의미를 현재 상황에 맞게 설계하고 명시적으로 구현한 뒤, 설명 가능한 세계 변화와 포기한 대상을 받아들이는 재미.**

직접 필기는 이 재미를 몸으로 느끼게 하는 대표 입력 방식이다. 그러나 필기 정확도나 속도 자체가 최종 목적은 아니다. 핵심 판단은 다음 세 가지다.

1. 지금 상황에서 무엇을 바꿀 것인가.
2. 어떤 의미·범위·출력·위험을 선택할 것인가.
3. 무엇을 지키고 무엇을 포기할 것인가.

## 4. 목표 계층

### 순간 목표

```text
상황·대상·위험 관찰
→ 글자 의미와 보조 문법 선택
→ 직접 작성·후보 확인
→ 결과 경향과 비용 검토
→ 명시적 구현
→ 세계 변화·부작용 확인
```

### 세션 목표

- 수업·일상·축제·제작·전투처럼 다른 맥락에서 같은 마법 원리를 응용한다.
- 완전 성공만이 아니라 부분 성공·실패의 원인과 책임을 이해한다.
- 결과·부작용·발견을 마도서에 남긴다.

### Chapter 목표

```text
새 원리·상황 질문 학습
→ 선택·준비
→ 통제된 응용
→ 실전·책임 선택
→ 복기·다음 질문
```

### 장기 목표

- 복수 계열을 배우고 포트폴리오 증거를 축적한다.
- 일부 계열을 심화·전문화한다.
- 정답을 복제하는 학생에서 결과를 설명하고 책임지는 설계자로 성장한다.
- 1학년에는 첫 독자적 원리를 증명하고, 본편 종결에서는 졸업과 대규모 세계 재작성을 완성한다.

## 5. 시스템 계층 재분류

기존 Sheet는 게임플레이·진행·콘텐츠 모드·UX·기술 인프라·제작 Gate를 모두 `핵심시스템`으로 나열한다. 아래처럼 책임을 분리해야 우선순위를 판단할 수 있다.

### A. 비타협 핵심 플레이 시스템

| 시스템 | 역할 | 빠지면 발생하는 문제 |
|---|---|---|
| 상황·조건·위험 판독 | 주문 설계의 질문을 만든다 | 필기가 정답 맞히기 입력으로 축소됨 |
| 글자 직접 작성·후보 확인 | 의미를 플레이어가 직접 구현한다 | 프로젝트의 촉각적 정체성 약화 |
| 의미 조합·상황 검증 | 같은 글자로 복수 해법과 대가를 만든다 | 속성 공격 게임으로 변질 |
| 명시적 Commit·원자 결과 적용 | 선택 책임과 중복 적용 방지 | 오시전·결과 불신·저장 오류 발생 |
| 설명 가능한 세계 변화 | 의도와 결과의 인과를 보여준다 | 선택이 숫자 증감으로만 느껴짐 |
| 마도서 기록·복기 | 결과를 학습·성장·정체성으로 환류 | 장면들이 단절되고 장기 의미가 사라짐 |

### B. 핵심 진행 시스템

| 시스템 | 역할 | 핵심 플레이와 연결 |
|---|---|---|
| 학습 나선 Chapter | 새 질문을 배우고 다른 맥락에서 재사용 | 상황과 글자 조합의 난도를 확장 |
| 다계열 커리큘럼 | 플레이어의 해법 정체성과 폭을 만든다 | 다루는 현상·위험·관계가 달라짐 |
| 수강 슬롯·포트폴리오 성장 | 폭넓은 학습과 심화 사이 기회비용 | 반복 전투가 아닌 맥락별 응용을 요구 |
| 결과 태그·학기말 평가 | 선택의 장기 영향을 설명 | 부분 성공·실패도 학습 증거로 환류 |

### C. 핵심을 시험하는 적용 모드

| 시스템 | 역할 | 판정 |
|---|---|---|
| 비전투 Situation | 전투 없이 의미·범위·표현·관계를 검증 | 핵심 대표 모드 |
| 상황 해결형 전투 | 시간·피해·환경 위험 아래 설계를 검증 | 핵심 대표 모드이지만 핵심 그 자체는 아님 |
| 제작·미니게임 | 준비와 재료 변환에서 의미 설계를 검증 | 조건부 보조 모드 |
| 자유일정 현장실습 | 배운 원리를 자발적으로 시험 | 선택형 보조 모드 |

### D. 보조 시스템

- 휴식·준비·교류·현장실습 선택.
- 교수·동급생·동반 정령·수호 소환수 관계와 반응.
- 재료·촉매·도구·보호 장치·의식 소모품.
- 접근 권한·발견 기록·단기 준비 상태.
- 아트·오디오·연출·명명.

보조 시스템은 독립적인 성장 게임이 아니라 핵심 플레이 전후의 조건·관점·대가·기억을 바꾸어야 한다.

### E. 전달·안전·기술 인프라

- Scene-first Focus Task UX.
- 확장형 Writing Panel.
- Save/Resume Anchor와 Session Snapshot.
- Atomic Result Ledger.
- Recognition 요청 생명주기와 stale 요청 폐기.
- Mobile Safe Area·Touch·Text Scale·성능·접근성.
- 단계별 Production Gate와 저장 승계.

이들은 재미를 직접 생산하기보다 핵심 재미가 손실·중복·오시전·정보 가림 없이 전달되도록 한다.

## 6. 적대적 검토 결과

### P1 — 정본·Sheet 충돌

#### P1-CANON-ROUTER-STALE

`docs/DESIGN_DOCUMENT_REGISTRY.json`이 다음 과거 상태를 유지한다.

- `primary_platform: PC`, `follow_up_platform: Mobile`.
- Base `v9.3.0`.
- 과거 main SHA와 Sync Receipt.
- `ASSET-SPEC-01`을 다음 Gate로 표시.

현재 `START_HERE.md`와 main 상태는 Mobile 우선, Base v9.4.3, `GR-SYNC-20260802-22`, 구현 진입 정본 병합 완료다. Cold-start 라우터가 서로 충돌한다.

#### P1-ACTIVE-CONTEXT-STALE

`docs/ACTIVE_CONTEXT.md`와 `docs/DEVELOPMENT_GATES.md`가 다음 과거 상태를 유지한다.

- `MOBILE-FOUNDATION-01`을 현재 Gate로 표시.
- 과거 PR·main·Sync 포인터.
- Vertical Slice에 `실기시험` 표현 유지.
- 전체 게임 구조·구현 진입 승인·Base v9.4.3 최종화 미반영.

#### P1-SHEET-EXAM-CONFLICT

Sheet `05_GDD_요약`의 스토리 흐름이 `수업→시험→축제→현장→귀환`으로 남아 있다. 승인된 구조는 별도 시험을 제거하고 `교내 일상 응용·수업 후 실습`과 활동 포트폴리오 평가로 대체했다.

#### P1-SYSTEM-TAXONOMY-MIXED

Sheet `40_핵심시스템_메인콘텐츠`가 다음을 한 등급으로 혼합한다.

- 핵심 플레이.
- Chapter·성장·평가.
- 전투·제작 콘텐츠 모드.
- Mobile UX와 기술 구조.
- 단계별 제작 Gate.

이 구조에서는 무엇을 먼저 검증하고, 무엇을 잘라도 핵심이 보존되는지 판단하기 어렵다.

#### P1-APPROVED-SYSTEM-ROWS-MISSING

Sheet `40_핵심시스템_메인콘텐츠`에 승인된 다음 시스템이 독립적으로 정리되지 않았다.

- 다계열 수강·전문화.
- 수강 슬롯·맥락 포트폴리오 성장.
- 결과 태그·숨김 소폭 학기 평가·학기말 종합 평가.

`12_핵심루프`에는 `GR-L-12` 다음 `GR-L-14`가 존재해 평가·회복 루프에 해당하는 `GR-L-13` 공백도 확인된다.

#### P1-PR-STATE-STALE

Sheet `12_핵심루프`의 `GR-L-18`은 사전 병합 Gate를 `IN_PROGRESS`로 표시하지만, 관련 결정과 후속 최종화 PR은 이미 main에 병합됐다.

### P1 — 핵심 재미 정렬 위험

#### P1-CORE-HIERARCHY-IMPLICIT

직접 작성, 전술 전투, 학교생활, 제작, 다계열 성장, 숨김 평가가 모두 핵심처럼 표현된다. 실제 우선순위는 `상황 판독→의미 설계→Commit→설명 가능한 결과→복기`이며, 다른 시스템은 이 흐름을 시험하거나 보조한다. 이 계층을 명시하지 않으면 제작량이 늘어날수록 코어가 희석된다.

#### P1-VERTICAL-SLICE-OVERLOAD

46~53분 Internal Slice에 다음이 모두 필수 실제 플레이로 잡혀 있다.

- 작성.
- 비전투 응용.
- 제작 미니게임.
- 자유일정 최소 2축.
- 단일 강적 전투와 환경 책임.
- 마도서 기록.
- 숨김 Ledger 기반 학기말 평가.
- 장기 구조 Preview.

대표성은 높지만 각 시스템이 튜토리얼 수준으로만 지나가 핵심 설계 재미를 충분히 증명하지 못할 위험이 있다.

#### P1-TIMER-VS-MEANING

전투의 실시간 압박이 강해지면 `상황을 읽고 의미를 설계하는 판단`보다 필기 속도와 운동 능력이 성패를 지배할 수 있다. 압박의 대상은 의사결정이어야 하며 인식 지연·시스템 지연·접근성 차이를 처벌해서는 안 된다.

#### P1-CRAFTING-PARALLEL-GAME

제작 미니게임이 글자 의미·상황 준비와 분리되면 별도 수집·인벤토리·레시피 게임이 된다. 이 경우 핵심 재미를 보강하기보다 콘텐츠 제작량과 반복 노동을 증가시킨다.

#### P1-HIDDEN-EVALUATION-TRUST

사건별 점수를 숨기는 방향은 최적화 플레이를 줄이지만, 플레이어가 학기말 결과를 예측하지 못하면 평가가 블랙박스로 느껴질 수 있다. 숫자 가중치는 숨기더라도 어떤 종류의 증거가 쌓였는지는 질적으로 보여줘야 한다.

## 7. 권장 개선안 — 승인 전 제안

### R1. Core Fun Contract를 단일 정본으로 승격

모든 신규 시스템·콘텐츠·미니게임을 다음 질문으로 심사한다.

```text
상황을 읽게 하는가?
→ 의미 있는 선택을 만드는가?
→ 명시적 Commit 전 검토 가능한가?
→ 결과와 대가가 설명되는가?
→ 마도서·성장·다음 상황에 환류하는가?
```

두 항목 이하만 만족하면 핵심 시스템이 아니라 장식 또는 범위 삭제 후보로 판정한다.

### R2. Core Dominance Budget 도입

Internal Slice에서 플레이어의 주요 판단 시간 대부분이 다음에 쓰여야 한다.

- 상황·목표·위험 읽기.
- 글자 의미·범위·대가 설계.
- 결과 비교·책임 판단.
- 결과 복기.

정확한 비율은 `TEST_VALUE`로 두되, 이동·설명·인벤토리·단순 채집·반복 필기가 핵심 판단 시간을 앞지르면 REWORK한다.

### R3. 직접 작성의 역할 명확화

- 신규·미숙·서사적으로 중요한 글자는 직접 쓴다.
- 이미 증명한 글자를 반복해서 쓰게 할 때는 새 상황 판단이 있어야 한다.
- 같은 의미를 기계적으로 반복하는 입력은 Token 재선택·조립·부분 작성으로 피로를 줄이는 후보로 검증한다.
- 직접 작성 완화가 자동 주문 추천이나 자동 시전으로 이어져서는 안 된다.

### R4. 전투 압박 원칙

> **필기 속도가 아니라 불완전한 정보와 시간 안에서 어떤 결과를 감수할지 결정하는 압박을 만든다.**

- Recognition·Animation·저장·시스템 지연은 적 타이머에서 제외한다.
- 작성 감속·접근성 모드에 성장·보상 불이익을 주지 않는다.
- 적 의도·환경 위험·보존 대상은 작성 중에도 유지한다.
- 빨리 쓴 잘못된 주문보다 늦지만 책임 있는 주문이 유효한 상황을 포함한다.

### R5. 제작 시스템 종속 규칙

모든 제작 콘텐츠는 최소 하나를 만족해야 한다.

1. 글자 의미를 재료·촉매 조건에 적용한다.
2. 다음 Situation의 해법·위험·부작용을 바꾼다.
3. 실패 결과가 대체 활용·발견·마도서 기록으로 남는다.

단순 채집량·희귀도·공격력 상승만 제공하면 제거하거나 자동 처리한다.

### R6. 평가 신뢰 규칙

- 내부 가중치와 사건별 감점 수치는 숨긴다.
- 마도서에는 `기초 이해 / 비전투 응용 / 현장 책임 / 연구·제작 / 복기` 증거 범주와 대표 사례를 보여준다.
- 학기말 평가는 처음 등장한 근거가 아니라 이미 플레이어가 본 증거를 요약해야 한다.

### R7. Vertical Slice 우선순위

필수 체험의 우선순위를 다음처럼 둔다.

```text
1. 상황 판독·의미 조합·Commit·세계 변화
2. 비전투와 전투의 다른 응용
3. 마도서 복기와 결과 설명
4. 자유일정의 조건 변화
5. 제작의 대표 통합 사례
6. 장기 Curriculum·평가 Preview
```

시간 초과 시 핵심 작성·상황·결과를 줄이지 않고, Preview 수·설명·이동·제작 단계·자유일정 반복을 먼저 감량한다.

## 8. PR·운영 점검

```yaml
open_pull_requests_at_audit_start: 0
latest_merged_pull_request: 46
latest_main: eaf05c24b90d233964d093b0e772e5e94b505f36
latest_sync: GR-SYNC-20260802-22
sheet_readback: PASS
implementation: NOT_STARTED
codex_execution: BLOCKED
```

- PR #43: 조건부 Foundation POC 구현 진입 정본 병합.
- PR #45: main 최종화와 Grill counter `0/10` 초기화.
- PR #46: Sheet Readback `PASS` 최종화.
- 현재 열린 PR은 없다.
- 본 감사 PR은 문서만 추가하며 승인된 게임 규칙·Sheet·제품 파일을 변경하지 않는다.

## 9. 후속 작업 권장 순서

```text
이 감사 검토
→ 유지할 개선안 사용자 승인
→ 승인 항목에 새 Decision ID 부여
→ GitHub 권위 문서·Sheet 같은 ID 동기화
→ ACTIVE_CONTEXT·DEVELOPMENT_GATES·DESIGN_DOCUMENT_REGISTRY 직접 최신화
→ Sheet 시스템 분류·누락 행·시험 표현·stale PR 상태 교정
→ 적대적 Readback
→ 별도 Execution Readiness 준비
```

## 10. 현재 결론

```yaml
core_fun_alignment: PASS_WITH_HIGH_PRIORITY_CLARIFICATION
core_system_integrity: PASS_WITH_TAXONOMY_REWORK
support_system_alignment: PASS_WITH_SCOPE_GUARDS
canon_consistency: REWORK_REQUIRED
sheet_consistency: REWORK_REQUIRED
product_implementation_ready: false
```

현행 기획의 방향은 핵심 재미와 대체로 맞는다. 가장 큰 문제는 코어가 잘못된 것이 아니라, **코어·적용 모드·보조·인프라가 같은 층위로 기록되어 우선순위가 흐려지고, 최신 승인 이후 기본 정본과 Sheet 일부가 따라오지 못한 것**이다.