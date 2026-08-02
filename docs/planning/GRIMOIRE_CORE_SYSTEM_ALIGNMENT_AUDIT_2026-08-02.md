# GRIMOIRE 핵심·보조 시스템 정리 및 적대적 정합성 감사 — 2026-08-02

## 1. 상태

```yaml
audit_id: GR-AUD-CORE-SYSTEM-ALIGNMENT-20260802-01
status: USER_APPROVED_CORRECTIONS_IN_PROGRESS
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_option: A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS
approved_at: 2026-08-02T21:49:00+09:00
clarified_at: 2026-08-02T21:57:00+09:00
scope: PLANNING_CLASSIFICATION_AND_CANON_CONSISTENCY
grill_counter_change: 1
implementation: NOT_STARTED
product_code_changed: false
google_sheet_changed: true
base_release_on_main: 9.4.3
main_at_audit_start: eaf05c24b90d233964d093b0e772e5e94b505f36
working_sync_id: GR-SYNC-20260802-23
pull_request: 47
```

이 감사는 기존 기획을 폐기하거나 재기획하지 않는다. 승인된 기획에서 핵심 재미·목표·핵심 시스템·보조 시스템을 복원하고, Stock과 소환수의 피로 완화 구조가 핵심 판단을 보존하는지 검토한다.

사용자 정정:

```text
메인 소환수 = 상시 활성
기타 소환수 = [소환] 주문으로 호출
활성 소환수 = 일정 시간마다 [주문] 사용 또는 [스톡] 충전
```

이 정의가 소환수 정본의 우선 근거다.

## 2. 플레이어 약속과 핵심 재미

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미와 상황의 조건을 배우고, 직접 작성·Stock·소환수의 주기 지원을 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

### 핵심 재미

> 정답 주문을 찾는 것이 아니라, 같은 글자 의미를 현재 상황에 맞게 설계하고 명시적으로 구현한 뒤, 설명 가능한 세계 변화와 포기한 대상을 받아들이는 재미.

핵심 판단:

1. 지금 상황에서 무엇을 바꿀 것인가.
2. 어떤 의미·범위·출력·위험을 선택할 것인가.
3. 직접 작성·Stock·소환수 중 어떤 수단을 언제 운용할 것인가.
4. 무엇을 지키고 무엇을 포기할 것인가.

직접 필기는 대표 입력 방식이다. 필기 속도와 반복량 자체는 최종 목적이 아니다. Stock은 확인된 요소의 반복 입력을 줄이고, 소환수는 상시 또는 소환 후 주기적으로 주문·Stock을 지원한다.

## 3. 목표 계층

### 순간 목표

```text
상황·대상·위험 관찰
→ 직접 작성·Stock·소환 운용 중 수단 선택
→ 글자 의미·보조 문법·대상 조합
→ 결과 경향·비용·위험 검토
→ 명시적 Commit 또는 [소환] Commit
→ 플레이어 주문·소환수 주기 행동 적용
→ 세계 변화·부작용 확인
```

### 세션 목표

- 수업·일상·축제·제작·전투에서 같은 원리를 다르게 응용한다.
- 직접 작성과 자동 지원의 비중을 상황에 따라 조절한다.
- 완전 성공·부분 성공·실패의 원인과 책임을 이해한다.
- 결과·부작용·소환수 기여·발견을 마도서에 남긴다.

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
- Stock 구성과 소환수 운용으로 자신의 해결 방식과 리듬을 만든다.
- 정답 복제 학생에서 결과를 설명하고 책임지는 설계자로 성장한다.
- 1학년 첫 독자적 원리와 본편 졸업·세계 재작성을 완성한다.

## 4. 시스템 계층

### A. 비타협 핵심 플레이

| 시스템 | 역할 | 제거 시 변질 |
|---|---|---|
| 상황·조건·위험 판독 | 주문 설계의 질문 생성 | 필기가 정답 맞히기로 축소 |
| 글자 직접 작성·후보 확인 | 의미를 플레이어가 직접 구현 | 촉각적 정체성 약화 |
| 의미 조합·상황 검증 | 복수 해법과 대가 생성 | 속성 공격 게임화 |
| 수단 운용 | 직접 작성·Stock·소환을 상황에 맞게 선택 | 반복 피로 또는 자동전투 편중 |
| 명시적 Commit·원자 적용 | 책임과 결과 단일 소유권 | 오시전·중복 결과·저장 불신 |
| 설명 가능한 세계 변화 | 의도와 결과의 인과 표현 | 숫자 증감만 남음 |
| 마도서 기록·복기 | 결과를 성장과 다음 질문으로 환류 | 장면 단절 |

### B. 핵심 진행

- 학습 나선 Chapter.
- 다계열 수강·전문화.
- 수강 슬롯·맥락 포트폴리오 성장.
- 결과 태그·숨김 소폭 학기 평가·학기말 종합 평가.

### C. 핵심을 시험하는 적용 모드

- 비전투 Situation.
- 상황 해결형 전투.
- 제작·미니게임.
- 선택형 현장실습.

전투와 제작은 핵심을 시험하는 대표 모드지만 상황 판독·의미 설계보다 상위 핵심이 아니다.

### D. 보조·운용 시스템

- 자유일정의 휴식·준비·교류·현장실습.
- Stock과 확인 글자·주문 요소 재사용.
- 메인 소환수의 상시 주기 지원.
- 기타 소환수의 `[소환]` 주문 호출과 주기적 주문·Stock 지원.
- 교수·동급생·동반 정령·소환수 관계와 반응.
- 재료·촉매·도구·보호 장치·의식 소모품.
- 접근 권한·발견 기록·단기 준비 상태.
- 아트·오디오·연출·명명.

### E. 전달·안전·기술 인프라

- Scene-first Focus Task UX.
- 확장형 Writing Panel.
- Save/Resume Anchor·Session Snapshot.
- Atomic Result Ledger.
- Recognition 생명주기·stale 요청 폐기.
- Summon Tick·자동 주문·Stock 충전 중복 방지.
- Mobile Safe Area·Touch·Text Scale·성능·접근성.
- 단계별 Production Gate·저장 승계.

## 5. Stock·소환수 보완 감사

### Stock

확인된 최소 근거:

- 같은 문제에서 이미 확인한 글자는 Token으로 재선택 가능.
- 신규·미숙·중요 글자는 직접 작성 또는 직접 작성 요소의 명시적 조립 우선.
- 활성 소환수는 일정 시간마다 Stock을 충전할 수 있다.

정렬 판정:

```yaml
fatigue_relief: PASS
core_choice_preservation: PASS_WITH_GUARDS
current_situation_validation_for_player_use: REQUIRED
summon_stock_generation: APPROVED_CONCEPT
automatic_optimal_recommendation: PROHIBITED
player_stock_selection_auto_cast: PROHIBITED
detailed_rules: DESIGN_REQUIRED
```

플레이어가 Stock을 사용하는 경우 현재 대상·환경·위험·비용 검증과 명시적 Commit을 생략하지 않는다. 소환수가 Stock을 충전하는 것은 승인됐지만 충전량·주기·상한·우선순위는 미확정이다.

### 소환수

승인된 구조:

```text
메인 소환수 상시 활성
+ 기타 소환수는 [소환] 주문으로 호출
→ 활성 상태 동안 일정 시간마다 지정 [주문] 사용 또는 [스톡] 충전
```

정렬 판정:

```yaml
fatigue_relief: PASS
main_summon_always_active: APPROVED_CONCEPT
other_summons_require_summon_spell: APPROVED_CONCEPT
periodic_spell_use: APPROVED_CONCEPT
periodic_stock_generation: APPROVED_CONCEPT
summon_detailed_rules: DESIGN_REQUIRED
autoplay_risk: OPEN_WITH_GUARDS
```

이제 “자동 시전 금지”는 플레이어가 Stock을 선택했을 때의 무승인 자동시전을 금지한다. 소환수 고유 주기 행동으로 지정 주문이 자동 사용되는 것은 승인된 예외다.

핵심 재미 보호 조건:

- 기타 소환수의 호출 시점과 종류는 플레이어가 선택한다.
- `[소환]` 주문은 명시적 Commit과 비용 적용을 거친다.
- 주기 주문·Stock 충전의 출처, 예고, 주기, 대상 또는 적용 규칙이 판독 가능해야 한다.
- 자동 행동도 Atomic Result Ledger에서 한 번만 적용한다.
- Pause·Background·Save/Resume에서 중복 Tick·주문·충전이 없어야 한다.
- 메인 소환수와 다중 소환수의 중첩이 무한 Stock·무위험 방치 플레이를 만들지 않아야 한다.
- 결과 화면과 마도서가 플레이어 주문과 소환수 기여를 구분해 설명해야 한다.

미확정:

- 소환수별 주기 시간과 출력.
- 주기 주문의 출처와 장착 방식.
- 자동 대상 선택 규칙.
- Stock 충전 대상·상한·우선순위.
- 지속시간·해제·교체·재소환 대기시간.
- 동시 소환 수와 중첩 규칙.
- `[소환]` 주문의 문자 구성·마나·실패 규칙.
- Pause·Offline·Background 시간 진행 여부.

후속 책임 Decision:

- `GM-STOCK-SYSTEM-01`.
- `GM-SUMMON-SYSTEM-01`.

## 6. 적대적 검토 결과

### P1 — 정본·Sheet 충돌

#### P1-CANON-ROUTER-STALE

`docs/DESIGN_DOCUMENT_REGISTRY.json`은 PC 우선, Base v9.3, 과거 main·Sync, ASSET-SPEC 다음 Gate를 유지한다. 현재 Mobile 우선, Base v9.4.3, 구현 진입 병합 완료와 충돌한다.

조치: `CORE_SYSTEM_ALIGNMENT_01_COLD_START_OVERRIDE_2026-08-02.md`를 Working Branch 우선 정본으로 추가. 원본 직접 흡수는 후속 정리 단계에 유지.

#### P1-ACTIVE-CONTEXT-STALE

`docs/ACTIVE_CONTEXT.md`와 `docs/DEVELOPMENT_GATES.md`는 MOBILE-FOUNDATION 현재 Gate, 과거 PR·Sync, 실기시험 표현을 유지한다.

조치: Cold-start Override에서 과거 상태로 제한하고 Sheet의 활성 표현을 교정.

#### P1-SHEET-EXAM-CONFLICT

GDD 요약의 `수업→시험→축제`는 별도 시험 제거 결정과 충돌한다.

조치: `수업→교내 일상 응용·수업 후 실습→축제`로 교정.

#### P1-SYSTEM-TAXONOMY-MIXED

Sheet 핵심시스템 탭이 핵심 플레이·진행·모드·UX·기술·제작 Gate를 한 등급으로 혼합한다.

조치: 승인 문서에서 계층을 고정하고 누락 시스템·Stock·소환수 행에 분류를 명시.

#### P1-APPROVED-SYSTEM-ROWS-MISSING

누락:

- 다계열 수강·전문화.
- 수강 슬롯·맥락 포트폴리오.
- 결과 태그·숨김 학기 평가.
- Stock.
- 메인 상시·기타 `[소환]`·주기 행동 소환수 구조.

조치: Sheet 신규 행 추가·수정.

#### P1-PR-STATE-STALE

`GR-L-18`은 Pre-merge Gate를 IN_PROGRESS로 표시했다.

조치: 이전 Batch 완료·main 최종화 상태로 교정.

### P1 — 핵심 재미 정렬 위험

#### P1-CORE-HIERARCHY-IMPLICIT

작성·전투·학교생활·제작·다계열·평가가 모두 핵심처럼 표현된다.

조치: 비타협 핵심을 `상황 판독→의미 설계→수단 운용→Commit→설명 가능한 결과→복기`로 고정.

#### P1-VERTICAL-SLICE-OVERLOAD

46~53분에 작성·Stock·소환수·비전투·제작·자유일정·전투·마도서·평가·Preview가 모두 요구된다.

보호 순서:

1. 상황 판독·의미 조합·Commit·세계 변화.
2. 직접 작성·Stock·소환수 상호작용.
3. 비전투·전투의 다른 응용.
4. 마도서 복기·결과 설명.
5. 자유일정 조건 변화.
6. 제작 대표 사례 1개.
7. 장기 Preview.

#### P1-TIMER-VS-MEANING

타이머가 의미 판단보다 손속도와 필기 능력을 시험할 위험이 있다.

조치: Recognition·Animation·Save·시스템 지연을 조작 시간에서 제외하고, 소환수 선택·호출 시점이 의미 있는 시간 판단이 되게 한다.

#### P1-STOCK-TRIVIALIZATION

Stock이 직접 작성과 상황 설계를 모두 생략하는 완성 주문 버튼으로 변질될 위험이 있다.

조치: 플레이어 사용은 상황 재검증·명시적 Commit 유지. 소환수 충전에는 상한·중복 방지·출처 표시 필요.

#### P1-SUMMON-AUTOPLAY

상시 메인 소환수와 호출 소환수의 주기 주문이 플레이어 주문보다 강해지면 방치형 자동전투로 변질될 위험이 있다.

조치:

- 기타 소환수는 `[소환]` 주문을 통한 플레이어 선택 필요.
- 자동 행동은 예고·규칙·기여도를 표시.
- 무한 Stock·무한 자동시전·위험 완전 무효화 방지.
- 주기 Tick을 원자적으로 적용하고 중단복귀 중복 방지.
- 소환수 출력과 플레이어 직접 주문의 비율은 사람 테스트 대상.

#### P1-MAIN-SUMMON-DOMINANCE

상시 메인 소환수가 모든 상황의 기본 최적해가 될 위험이 있다.

조치: 메인 소환수의 역할·출력·주기·Stock 충전 상한과 기타 소환수 선택의 의미를 `GM-SUMMON-SYSTEM-01`에서 검증한다.

#### P1-HIDDEN-EVALUATION-TRUST

학기말 평가가 블랙박스로 느껴질 위험이 있다.

조치: 정확한 점수는 숨기되 기초 이해·비전투 응용·현장 책임·연구/제작·복기/설명의 대표 증거를 공개한다.

#### P1-CRAFTING-PARALLEL-GAME

제작이 별도 파밍·인벤토리 게임으로 분리될 위험이 있다.

조치: 글자 의미 적용, Situation 해법·위험 변화, 실패 발견·기록 중 하나 이상을 필수로 한다.

## 7. 승인된 R1~R7

- R1 Core Fun Contract.
- R2 직접 작성·Stock·소환수 주기 지원의 역할 분담.
- R3 전투 압박을 필기 속도가 아닌 책임 선택과 소환 타이밍에 배치.
- R4 제작 시스템의 코어 종속.
- R5 숨김 평가의 공개 증거.
- R6 Vertical Slice 감량 우선순위.
- R7 모든 시스템의 책임 계층 명시.

세부 계약은 `CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`를 따른다.

## 8. 최종 판정

```yaml
core_fun_alignment: PASS
core_system_hierarchy: APPROVED
support_system_alignment: PASS_WITH_GUARDS
stock_fatigue_relief: APPROVED_AT_CONCEPTUAL_BOUNDARY
summon_always_active_main: APPROVED_CONCEPT
summon_requires_spell_for_others: APPROVED_CONCEPT
summon_periodic_spell_or_stock_support: APPROVED_CONCEPT
summon_detailed_rules: DESIGN_REQUIRED
canon_consistency: PASS_WITH_ACTIVE_OVERRIDE_AND_DIRECT_RECONCILIATION_REMAINING
sheet_consistency: PASS
product_implementation_ready: false
```

## 9. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
GODOT_PROJECT = NOT_STARTED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_DETAILED_RULES = DESIGN_REQUIRED
RUNTIME·DEVICE·PERFORMANCE·ACCESSIBILITY·HUMAN = NOT_RUN
```
