# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- `GRIMOIRE_PLANNING_CANON_2026-07-31.md`.
- `CIRCUIT_SYSTEM.md`, `WORLD_MAGIC_CURRICULUM_SYSTEM.md`와 연계 장기 문서.
- Google Sheet `05·10·11·12·13·14·40·41·50·52`.
- 승인된 Battle·Mobile·Art 계약.
- 사용자 승인:
  - `GM-FULL-GAME-MACRO-LOOP-01`.
  - `GM-FULL-GAME-CHAPTER-RHYTHM-01`.
  - `GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01`.
  - `GM-FULL-GAME-GROWTH-CHOICE-COST-01`.

## 2. 현재 결론

```yaml
verdict: PASS_FOR_VERTICAL_SLICE / FULL_GAME_STRUCTURE_IN_PROGRESS
p0_open: 0
p1_open: 0
p2_closed: 4
p2_open: 3
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
current_question: GM-FULL-GAME-REWARD-ECONOMY-01
emergent_risks:
  - OPTIONAL_PRACTICUM_DOMINATES_FREE_SCHEDULE
  - MULTI_SCHOOL_PARALLEL_CONTENT_EXPLOSION
  - OPTIMAL_SPECIALIZATION_BUILD
  - FIELD_COMBAT_GRADE_DOMINATES_PORTFOLIO
  - REWARD_CURRENCY_REINTRODUCES_FARMING
```

Macro Loop, Chapter 리듬, 다계열 커리큘럼, 성장·누적 평가 구조는 닫혔다. 남은 공백은 보상 경제·장기 실패/평가 영향·본편 범위다.

## 3. 유지할 강점

- `학습→선택→응용→책임→복기`의 학습 나선.
- 자유일정의 휴식·준비·교류·현장실습 네 축.
- 수업에서 문자를 배우고 안전하게 가볍게 작성하는 구조.
- 축제·일상 이벤트의 비전투 응용.
- 현장실습의 전투·환경 해결과 책임 선택.
- 별도 시험 없이 마도서·교수 피드백으로 누적 평가하는 포트폴리오.
- 다계열 수강과 전문화가 학교 RPG 정체성을 강화.

## 4. 해결된 항목

### P1 — 작업 순서 충돌 / CLOSED

```text
FULL-GAME-STRUCTURE-01
→ Vertical Slice 대표성 재검증
→ Mobile UX·Wireframe
```

### P2-01 — Macro Loop 없음 / CLOSED

`GM-FULL-GAME-MACRO-LOOP-01 / A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM`.

### P2-05 — Chapter 변주 단위 불완전 / CLOSED

`GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`.

### P2-02 — 글자 확장 규칙 없음 / CLOSED

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 / B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE`.

### P2-03 — 성장축과 선택 비용 불완전 / CLOSED

`GM-FULL-GAME-GROWTH-CHOICE-COST-01 / A_COURSE_SLOTS_PLUS_CONTEXTUAL_PORTFOLIO_EVIDENCE_NO_SEPARATE_EXAM`.

승인 흐름:

```text
수강 계열 선택
→ 수업에서 문자 학습·가벼운 작성 연습
→ 축제·일상 이벤트에서 비전투 응용
→ 현장실습에서 전투·환경 해결
→ 마도서 복기·교수 누적 평가
→ 심화·전문화 후보
```

성장 증거:

- 기초 학습 기록.
- 비전투 응용 기록.
- 현장 수행 기록.
- 복기·설명 기록.

보호 규칙:

- 별도 시험 Chapter·시험장·시험 전용 미니게임 없음.
- 현장실습의 처치 속도·피해량·반복 횟수만으로 평가 독점 금지.
- 축제·일상 이벤트의 비전투 응용도 실질적 성장 증거.
- 동일 실습 반복은 다양한 활용 기록을 대체하지 못함.
- 부분 성공·실패도 원인과 책임을 설명하면 유효한 기록.
- 수강 슬롯 수·평가 가중치·전문화 시점은 `TEST_VALUE`.

## 5. 현재 공백

### P2-04 — 보상 경제·소모처 불완전 / CURRENT

다음이 미정이다.

- 수업·축제/일상·현장실습·교류가 각각 제공하는 보상.
- 영구 성장과 Chapter 한정 준비 자원의 분리.
- 수강·연구·전문화에 필요한 자원과 소모처.
- 현장실습 반복 파밍·화폐 인플레이션 방지.
- 보상이 평가와 동일한 하나의 숫자로 축소되는 문제.

현재 질문:

`GM-FULL-GAME-REWARD-ECONOMY-01`.

### P2-06 — 실패와 평가의 장기 영향 없음

부분 성공·피해·책임 선택이 장학 평가·관계·다음 일정에 미치는 장기 영향이 미정이다.

### P2-07 — 본편 범위와 종결 조건 없음

Chapter 수, 본편 계열 수, 메인 현장·종결 지점이 미정이다.

## 6. 누적 평가의 적대적 위험

### RISK-GR-01 — 현장 전투 성적 독점

공격:
- 현장실습이 가장 눈에 띄는 콘텐츠라 평가와 성장도 전투 중심으로 수렴할 수 있다.

보호:
- 비전투 응용·복기 기록을 별도 유효 증거로 유지한다.
- 처치 속도보다 보존·부작용·책임·설명을 평가한다.
- 현장실습만으로 모든 전문화 조건을 충족할 수 없다.

### RISK-GR-02 — 평가 체크리스트화

공격:
- 네 증거가 UI 게이지와 반복 과제로 노출되면 학교생활이 체크리스트가 된다.

보호:
- 마도서 기록과 교수 문장 평가를 우선한다.
- 같은 행동 반복이 아니라 Chapter의 실제 사건에서 자연스럽게 증거를 얻는다.

### RISK-GR-03 — 별도 시험 제거로 학교 평가 약화

보호:
- 교수는 수업 관찰·축제/일상 응용·현장 수행·복기를 종합한다.
- 학교는 수강 허가·현장 배치·연구 기회·전문화 추천으로 평가 결과를 표현한다.

### RISK-GR-04 — 초기 수강 후회

보호:
- 전문화 전에는 Chapter·학기 경계에서 방향 변경 가능.
- 전문화 후에도 연구 전환·부전공 같은 제한적 회복 경로 후보 유지.

## 7. 다계열·현장실습의 기존 위험

- 계열마다 별도 콘텐츠 전체 세트를 만들면 Solo 범위 초과.
- 특정 계열이 전투·비전투·평가에서 모두 상위 호환이 될 위험.
- 미선택 계열로 인한 진행 차단 위험.
- 자유일정 현장실습이 다른 선택을 압도할 위험.
- 계열 수 증가로 직접 작성 피로가 증가할 위험.

기존 공유 Asset·복수 해법·파밍 금지·직접 작성 상한 보호 규칙을 유지한다.

## 8. 적대적 공격 질문

1. 보상 경제가 다시 하나의 범용 학점·경험치 파밍으로 수렴하지 않는가?
2. 전투 보상이 비전투 응용·교류·휴식 보상을 압도하지 않는가?
3. 평가와 소비 화폐를 같은 숫자로 사용해 성적을 구매하게 만들지 않는가?
4. 수강 슬롯이 자유로운 학교생활보다 체크리스트가 되지 않는가?
5. 특정 계열이 대부분 상황의 상위 호환이 되지 않는가?
6. 부분 성공이 실질적 결과 없이 좋은 평가로만 포장되지 않는가?
7. 관계·책임 선택이 계열 보너스에 종속되지 않는가?
8. Vertical Slice가 별도 시험 없는 포트폴리오 구조를 대표하는가?
9. Mobile 화면에서 성장 기록을 과도한 게이지 없이 설명할 수 있는가?
10. Solo 제작 범위에서 계열별 차이를 충분히 표현할 수 있는가?

## 9. 완료 기준

남은 공백마다 다음을 남긴다.

- Decision ID.
- 선택 구조와 거부 대안.
- 플레이어 행동·선택·피드백·보상·실패.
- 제작량·Mobile·QA 경계.
- GitHub·Sheet 동일 값 Readback.

Runtime·실기기·접근성·사람 검증은 계속 `NOT_RUN`이다.
