# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조·대표성 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- Vertical Slice·Macro Loop·Chapter Rhythm·다계열 커리큘럼·성장·보상·실패 평가·본편 범위·대표성 정본.
- Google Sheet `00·01·02·03·04·05·10·12·20·30·40·41·50·51·52·60·80·90·99`.
- 승인된 Battle·Mobile·Art·Save/Resume 계약.

## 2. 현재 결론

```yaml
verdict: FULL_GAME_STRUCTURE_AND_REPRESENTATIVENESS_APPROVED / MOBILE_UX_FLOW_CURRENT
p0_open: 0
p1_open: 0
p2_closed: 8
p2_open: 0
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
  - GM-FULL-GAME-REWARD-ECONOMY-01
  - GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
  - GM-FULL-GAME-SCOPE-ENDING-01
  - GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
completed_gates:
  - FULL-GAME-STRUCTURE-01
  - VERTICAL-SLICE-REPRESENTATIVENESS-01
current_gate: MOBILE-UX-FLOW-01
current_question: GM-MOBILE-UX-FLOW-01
```

전체 게임 구조와 Internal Vertical Slice 대표성 계약이 닫혔다. 다음 작업은 픽셀 Wireframe보다 먼저 Mobile Landscape의 상태 전환·정보 우선순위·중단복귀 흐름을 결정하는 것이다.

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

### P2-08 — Vertical Slice 대표성 / CLOSED

`GM-VERTICAL-SLICE-REPRESENTATIVENESS-01 / A_CORE_SYSTEMS_PLAYABLE_PLUS_LONG_TERM_STRUCTURE_COMPRESSED_MOCK`.

실제 구현 대상:

- 문자 학습·직접 작성.
- 비전투 응용.
- 대표 제작 미니게임 최소 1개.
- 최소 2축의 자유일정 선택.
- 단일 강적 현장 전투와 환경 책임.
- 마도서 기록.
- 실제 결과 로그에 연결된 학기말 평가 축약 출력.

압축 Mock 대상:

- 2·3학기 다계열 수강.
- 2·3학년 전문화·상급 연구·세계 책임 확장.
- 장기 Curriculum Map·마도서 연구 방향·후속 질문.

Mock은 `PREVIEW / FUTURE TERM / NOT PLAYABLE IN SLICE`를 명시한다.

## 4. 제품·제작 경계

- Year-One Demo는 본편의 1학년 정본이며 평행 캠페인이 아니다.
- Demo의 저장·마도서·수강·관계·결과 태그는 Full Game 승계를 고려한다.
- Vertical Slice 대표성 승인만으로 구현 준비가 완료된 것은 아니다.
- Mobile UX Flow와 Writing/Battle Wireframe 승인 전 Godot 제품 구현을 시작하지 않는다.
- Vertical Slice Runtime·실기기·접근성·사람 검증 PASS 전 Year-One Demo 6~8 Chapter 본제작을 시작하지 않는다.
- Year-One Demo 검증 전 2·3학년 전용 대형 콘텐츠를 본제작하지 않는다.
- 모든 학기·Chapter·계열·미니게임·Mock·통과 수치는 `TEST_VALUE`다.

## 5. 현재 Gate

### MOBILE-UX-FLOW-01 / CURRENT

현재 질문:

`GM-MOBILE-UX-FLOW-01`.

검증 대상:

- 학교 Hub·자유일정·수업·비전투·제작·전투·작성·마도서의 상태 전환.
- 한 번에 보여줄 정보와 안전 장면의 전역 진입점.
- Writing Panel의 진입·확정·취소·복귀 흐름.
- Focus Task 전·결과 적용 후 Save/Resume Anchor.
- 시간 압박 전투 중 Pause·접근성·안전 종료.
- 다음 Writing/Battle Wireframe이 게임 규칙을 대신 결정하지 않게 하는 선행 계약.

권장 후보:

`A_SCENE_FIRST_CONTEXTUAL_FOCUS_FLOW`.

## 6. 적대적 위험

### RISK-REP-01 — Mock이 구현 완료처럼 오인됨

보호:

- Mock 상태를 명시하고 실제 조작·누적 성장 검증과 구분한다.
- 장기 만족감과 실제 1년 평가 감정선은 Year-One Demo 검증 항목으로 남긴다.

### RISK-REP-02 — 핵심 시스템 과밀로 53분 초과

보호:

- 새 콘텐츠를 덧붙이기보다 기존 일상·축제 슬롯 안에 제작 미니게임을 통합한다.
- 53분 초과 시 반복 입력·이동·중복 설명을 먼저 제거한다.
- 핵심 약속을 제거해야만 통과한다면 대표성 계약을 재검토한다.

### RISK-UX-01 — 상시 Dashboard가 장면·작성 공간을 침범

보호:

- 권장안은 장면 중심 Contextual Focus Flow다.
- 전역 메뉴는 안전 장면에서만 얇게 제공한다.
- 전투·작성 중에는 현재 행동과 위험 정보를 우선한다.

### RISK-UX-02 — 독립 앱형 화면으로 인과가 분절

보호:

- 비전투·제작·전투·작성은 공통 Focus Task 진입/결과/복귀 계약을 사용한다.
- 결과는 장면 변화와 마도서 기록으로 이어진다.

### RISK-SCOPE-01 — Year-One Demo와 3년 전체 범위 폭증

보호:

- 단계별 Gate를 유지한다.
- 공통 사건·장소·미니게임·Asset 변주를 우선한다.
- 계열별 완전 별도 캠페인을 만들지 않는다.

## 7. 보호된 경계

- `PLANNING_ONLY_PROFILE` 유지.
- 구현 `NOT_STARTED`.
- Codex `BLOCKED`.
- Runtime·실기기·접근성·사람 검증 `NOT_RUN`.
- Mobile UX Flow 승인 전 Writing/Battle Wireframe 최종화 금지.
- Writing/Battle Wireframe 및 구현 Gate 승인 전 제품 구현 금지.
- Full Game의 2·3학년 본제작은 Year-One Demo 검증 이후.
