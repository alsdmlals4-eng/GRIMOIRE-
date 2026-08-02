# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- Vertical Slice·Macro Loop·Chapter Rhythm·다계열 커리큘럼·성장·보상·실패 평가·본편 범위 정본.
- Google Sheet `00·01·02·03·04·05·10·12·30·40·41·50·51·52·80·90·99`.
- 승인된 Battle·Mobile·Art 계약.

## 2. 현재 결론

```yaml
verdict: FULL_GAME_STRUCTURE_APPROVED / VERTICAL_SLICE_REPRESENTATIVENESS_CURRENT
p0_open: 0
p1_open: 0
p2_closed: 7
p2_open: 0
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
  - GM-FULL-GAME-REWARD-ECONOMY-01
  - GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
  - GM-FULL-GAME-SCOPE-ENDING-01
current_gate: VERTICAL-SLICE-REPRESENTATIVENESS-01
current_question: GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
```

전체 게임 구조의 핵심 공백은 닫혔다. 정식 본편은 3학년 전체, 데모는 1학년 3학기, 내부 Vertical Slice는 46–53분 대표 세션으로 분리한다.

## 3. 승인된 전체 구조

### P2-01 — Macro Loop / CLOSED

`GM-FULL-GAME-MACRO-LOOP-01 / A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM`.

### P2-02 — 마법 커리큘럼 / CLOSED

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 / B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE`.

### P2-03 — 성장·평가 / CLOSED

`GM-FULL-GAME-GROWTH-CHOICE-COST-01 / A_COURSE_SLOTS_PLUS_CONTEXTUAL_PORTFOLIO_EVIDENCE_NO_SEPARATE_EXAM`.

### P2-04 — 보상·제작·미니게임 / CLOSED

`GM-FULL-GAME-REWARD-ECONOMY-01 / A_PRIMARY_PLUS_C_MATERIAL_CRAFTING_MINIGAME_CONTENT`.

### P2-05 — Chapter 변주 / CLOSED

`GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`.

### P2-06 — 실패·학기말 평가 / CLOSED

`GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01 / A_RESULT_TAG_RECOVERY_SPIRAL_WITH_HIDDEN_MINOR_SEMESTER_EVALUATION`.

### P2-07 — 본편 범위·종결 / CLOSED

`GM-FULL-GAME-SCOPE-ENDING-01 / B_THREE_SCHOOL_YEAR_FULL_GAME_WITH_A_YEAR_ONE_DEMO_BOUNDARY`.

```text
46–53분 Internal Vertical Slice
→ 1학년 3학기 Year-One Demo Build
→ 3학년 전체 Full Game
```

#### Internal Vertical Slice

- 46분 목표·53분 콘텐츠 상한.
- 핵심 시스템과 위험을 먼저 검증.
- 정식 데모 전체와 구분.

#### Year-One Demo Build

- 1학년 3학기.
- 핵심 Chapter 6~8개 후보.
- 메인 계열 3개 내외 후보.
- 미니게임 가족 4~6개 후보.
- 첫 독자적 마법 원리와 책임 있는 세계 변화의 학년말 완결.

#### Three-School-Year Full Game

- 3개 학년·6~9학기 후보.
- 핵심 Chapter 12~18개 이상 후보.
- 메인 계열 5개 이상과 복수 전문화 후보.
- 졸업과 대규모 세계 재작성 엔딩.

모든 수치는 `TEST_VALUE`다.

## 4. 범위 경계

- Year-One Demo는 본편의 1학년 정본이며 평행 캠페인이 아니다.
- Demo의 저장·마도서·수강·관계·결과 태그는 Full Game 승계를 고려한다.
- Demo 검증 전 2·3학년 전용 대형 콘텐츠를 본제작하지 않는다.
- 학년별 신규 시스템 폭증보다 기존 문자·재료·제작·미니게임·관계·장소의 복합성을 높인다.
- 계열별 별도 캠페인은 의무화하지 않고 공통 사건을 계열별 해법과 대가로 변주한다.
- Demo의 배포·가격·저장 승계 방식은 후속 출시 Gate에서 결정한다.

## 5. 현재 Gate

### VERTICAL-SLICE-REPRESENTATIVENESS-01 / CURRENT

현재 질문:

`GM-VERTICAL-SLICE-REPRESENTATIVENESS-01`.

검증 대상:

- 실제 구현할 핵심 시스템과 장기 구조 Mock의 경계.
- 비전투 응용·제작 미니게임·현장 전투·마도서·숨김 학기말 평가의 결합.
- 1학년 Demo와 3학년 Full Game의 확장 규칙.
- 53분 상한·모바일 작성 피로·중단복귀·평가 설명력.
- Slice 통과 후 Year-One Demo 본제작 진입 조건.

권장 후보:

`A_CORE_SYSTEMS_PLAYABLE_PLUS_LONG_TERM_STRUCTURE_COMPRESSED_MOCK`.

## 6. 적대적 위험

### RISK-SCOPE-01 — Year-One Demo가 일반 데모보다 큼

판정:

- 1학년 3학기·6~8 Chapter는 일반 체험판보다 사실상 프롤로그 에디션 또는 별도 출시 분량에 가깝다.

보호:

- Internal Vertical Slice와 Year-One Demo를 별도 Gate로 관리한다.
- 배포·가격·저장 승계는 후속 출시 결정으로 분리한다.

### RISK-SCOPE-02 — 3년 전체 콘텐츠·QA 폭증

보호:

- Year-One Demo 검증 전 2·3학년 본제작 차단.
- 공통 사건·장소·미니게임·Asset 재사용과 상태 변주 우선.
- 계열별 완전 별도 캠페인 금지.
- 학년별 Production Gate를 통과해야 다음 학년 제작.

### RISK-SCOPE-03 — Vertical Slice와 후반 경험 괴리

보호:

- Slice에서 장기 수강·전문화 자체를 모두 만들지 않더라도, 핵심 시스템과 확장 가능한 데이터·상태 규칙을 검증한다.
- 2·3학년은 신규 시스템보다 상황 복합성·책임 규모·전문화 조합을 확장한다.

### RISK-SCOPE-04 — Demo가 Full Game에서 반복됨

보호:

- Demo는 본편의 정본 1학년으로 승계한다.
- Full Game 구매 시 동일 1학년을 강제 재시작하지 않는 저장 승계 가능성을 설계한다.
- 실제 플랫폼 승계 방식은 후속 Gate의 `TEST_VALUE`다.

## 7. 보호된 경계

- `PLANNING_ONLY_PROFILE` 유지.
- 구현 `NOT_STARTED`.
- Codex `BLOCKED`.
- Runtime·실기기·접근성·사람 검증 `NOT_RUN`.
- Vertical Slice 대표성 승인 전 Year-One Demo 6~8 Chapter 본제작 금지.
- Full Game의 2·3학년 본제작은 Year-One Demo 검증 이후.
