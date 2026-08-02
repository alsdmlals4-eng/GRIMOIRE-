# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- Vertical Slice·Macro Loop·Chapter Rhythm·다계열 커리큘럼·성장·보상 정본.
- Google Sheet `00·01·02·03·04·05·10·12·30·40·41·50·52·80·99`.
- 승인된 Battle·Mobile·Art 계약.

## 2. 현재 결론

```yaml
verdict: PASS_FOR_VERTICAL_SLICE / FULL_GAME_STRUCTURE_IN_PROGRESS
p0_open: 0
p1_open: 0
p2_closed: 5
p2_open: 2
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
  - GM-FULL-GAME-REWARD-ECONOMY-01
current_question: GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
emergent_risks:
  - OPTIONAL_PRACTICUM_DOMINATES_FREE_SCHEDULE
  - MULTI_SCHOOL_PARALLEL_CONTENT_EXPLOSION
  - OPTIMAL_SPECIALIZATION_BUILD
  - FIELD_COMBAT_GRADE_DOMINATES_PORTFOLIO
  - MATERIAL_FARMING_REINTRODUCES_OPTIMAL_GRIND
  - MINIGAME_AND_CONTENT_SCOPE_EXPANSION
  - MOBILE_INVENTORY_AND_CRAFTING_COMPLEXITY
```

Macro Loop, Chapter 리듬, 다계열 커리큘럼, 성장·누적 평가, 보상·제작 경제가 닫혔다. 남은 전체 게임 공백은 `장기 실패·평가 영향`과 `본편 범위·종결 조건`이다.

## 3. 해결된 항목

### P1 — 작업 순서 충돌 / CLOSED

```text
FULL-GAME-STRUCTURE-01
→ Vertical Slice 대표성 재검증
→ Mobile UX·Wireframe
```

### P2-01 — Macro Loop / CLOSED

`GM-FULL-GAME-MACRO-LOOP-01 / A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM`.

### P2-02 — 글자 확장 / CLOSED

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 / B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE`.

### P2-03 — 성장·평가 / CLOSED

`GM-FULL-GAME-GROWTH-CHOICE-COST-01 / A_COURSE_SLOTS_PLUS_CONTEXTUAL_PORTFOLIO_EVIDENCE_NO_SEPARATE_EXAM`.

```text
수업의 문자 학습·가벼운 작성
→ 축제·일상 비전투 응용
→ 현장실습 전투·환경 해결
→ 마도서·교수 누적 평가
→ 심화·전문화 후보
```

### P2-04 — 보상 경제·소모처 / CLOSED

`GM-FULL-GAME-REWARD-ECONOMY-01 / A_PRIMARY_PLUS_C_MATERIAL_CRAFTING_MINIGAME_CONTENT`.

```text
누적 평가·접근 권한·발견 기록
+
학교·축제·탐사·현장 재료 획득
→ 식별·정제·배합·안정화 미니게임
→ 촉매·도구·보호 장치·의식 소모품 제작
→ Chapter 준비와 상황 해결
```

보상 역할:

- 누적 평가는 소비 불가.
- 접근 권한은 새 수강·연구·현장·관계 콘텐츠 개방.
- Chapter 준비 자원은 단기 선택과 소모처.
- 발견 기록은 마도서·연구·대화 개방.
- 재료·제작은 준비 자원과 발견 기록을 플레이 가능한 콘텐츠로 표현.

### P2-05 — Chapter 변주 / CLOSED

`GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`.

## 4. 미니게임·추가 콘텐츠 범위 변경

사용자는 미니게임과 추가 콘텐츠를 실제 제작하도록 명시했다.

활성 범위:

- 문자 획·마력 보정.
- 재료 식별·분류.
- 촉매 배합·안정화.
- 축제·일상 응용.
- 현장 채집·안전 회수.
- 연구실 공동 제작.

과거의 전면 금지는 `GRIMOIRE_VERTICAL_SLICE_MINIGAME_CRAFTING_SCOPE_OVERRIDE_2026-08-02.md`가 대체한다.

Vertical Slice에는 대표 미니게임 최소 1개를 포함한다. 현재 우선안은 교내 일상 응용 또는 축제 장면 안의 촉매 안정화·장치 조율·재료 식별이다.

## 5. 유지되는 보호 규칙

- 별도 시험 Chapter·시험장·시험 전용 미니게임은 없음.
- 평가·허가·전문화를 재료·화폐로 구매하지 않음.
- 특정 희귀 재료·제작물이 필수 진행의 유일 해법이 되지 않음.
- 현장 반복은 새 조건·새 해법·새 발견 이후 핵심 보상 감소.
- 제작물은 상황별 선택과 대가를 만들며 모든 상황의 상위 호환 장비가 되지 않음.
- 수업·교류·일상·축제·연구에도 재료·레시피·제작 기회 제공.
- 미니게임은 Chapter 질문과 연결하며 장식성 일일 과제로 만들지 않음.
- 정확한 미니게임·재료·레시피·인벤토리 수는 `TEST_VALUE`.

## 6. 현재 공백

### P2-06 — 실패와 평가의 장기 영향 / CURRENT

미정:

- 부분 성공·실패·부작용·포기한 대상의 장기 상태.
- 장학 경고·보완·회복 규칙.
- 관계·장소·연구·다음 일정 변화.
- 제작·미니게임을 이용한 회복 콘텐츠.
- 저장 불러오기 최적화와 영구 진행 차단 방지.

현재 질문:

`GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01`.

권장 후보:

`A_RESULT_TAGS_PLUS_RECOVERY_OPPORTUNITY_SPIRAL`.

### P2-07 — 본편 범위와 종결 조건 / OPEN

미정:

- Chapter 수와 전체 플레이 시간.
- 본편 메인 계열·전문화 수.
- 미니게임 형식·재료·레시피·신규 장소 수.
- 추가 콘텐츠의 필수·선택 비율.
- 최종 연구·졸업·세계 변화의 종결 조건.
- Solo·Mobile 콘텐츠 예산과 재사용률.

## 7. 적대적 위험

### RISK-EC-01 — C가 A를 잠식

공격:
- 재료 파밍으로 평가·허가·전문화를 구매하면 A의 포트폴리오 구조가 무너진다.

보호:
- 재료·제작은 준비·발견 중심이며 평가·접근·전문화를 구매하지 못한다.

### RISK-EC-02 — 전투 파밍 우월

보호:
- 비전투 활동과 연구·교류에도 재료·레시피·제작 기회를 배분한다.
- 동일 전투 반복 보상은 감쇠한다.

### RISK-EC-03 — 미니게임이 핵심 코어를 분산

보호:
- 모든 미니게임은 문자 의미·상황 관찰·위험·재료 성질·해법 표현 중 하나를 검증한다.
- Chapter 질문과 무관한 미니게임은 추가하지 않는다.

### RISK-EC-04 — Solo·Mobile 범위 증가

판정:
- 사용자가 의도적으로 범위 확장을 승인했다.
- 따라서 미니게임을 제거하지 않고, 후속 `FULL-GAME-SCOPE-01`에서 수·재사용률·신규 Asset 예산을 잠근다.

### RISK-EC-05 — Vertical Slice 시간 초과

보호:
- 대표 미니게임을 기존 7분 교내 일상 응용 또는 축제 슬롯에 먼저 통합한다.
- 53분 초과 시 단순 추가가 아니라 전체 시간 예산을 재승인한다.

## 8. 완료 기준

남은 각 공백마다 다음을 남긴다.

- Decision ID와 사용자 승인안.
- 플레이어 행동·선택·피드백·보상·실패.
- 미니게임·추가 콘텐츠·제작량·Mobile·QA 경계.
- GitHub·Sheet 동일 값 Readback.

Runtime·실기기·접근성·사람 검증은 계속 `NOT_RUN`이며 구현은 `NOT_STARTED`다.
