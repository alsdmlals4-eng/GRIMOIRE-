# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- Vertical Slice·Macro Loop·Chapter Rhythm·다계열 커리큘럼·성장·보상·실패 평가 정본.
- Google Sheet `00·01·02·03·04·05·10·12·30·40·41·50·51·52·80·90·99`.
- 승인된 Battle·Mobile·Art 계약.

## 2. 현재 결론

```yaml
verdict: PASS_FOR_VERTICAL_SLICE / FULL_GAME_STRUCTURE_IN_PROGRESS
p0_open: 0
p1_open: 0
p2_closed: 6
p2_open: 1
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
  - GM-FULL-GAME-GROWTH-CHOICE-COST-01
  - GM-FULL-GAME-REWARD-ECONOMY-01
  - GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
current_question: GM-FULL-GAME-SCOPE-ENDING-01
emergent_risks:
  - OPTIONAL_PRACTICUM_DOMINATES_FREE_SCHEDULE
  - MULTI_SCHOOL_PARALLEL_CONTENT_EXPLOSION
  - OPTIMAL_SPECIALIZATION_BUILD
  - MATERIAL_FARMING_REINTRODUCES_OPTIMAL_GRIND
  - MINIGAME_AND_CONTENT_SCOPE_EXPANSION
  - MOBILE_INVENTORY_AND_CRAFTING_COMPLEXITY
  - HIDDEN_EVALUATION_BECOMES_BLACK_BOX
  - SEMESTER_END_SAVE_SCUMMING
```

Macro Loop, Chapter 리듬, 다계열 커리큘럼, 성장·누적 평가, 보상·제작 경제, 실패·학기말 평가 구조가 닫혔다. 남은 전체 게임 구조 공백은 `본편 범위·종결 조건` 하나다.

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

### P2-04 — 보상 경제·소모처 / CLOSED

`GM-FULL-GAME-REWARD-ECONOMY-01 / A_PRIMARY_PLUS_C_MATERIAL_CRAFTING_MINIGAME_CONTENT`.

```text
누적 평가·접근 권한·발견 기록
+
재료 획득→식별·정제·배합·안정화→제작→상황 활용
```

### P2-05 — Chapter 변주 / CLOSED

`GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`.

### P2-06 — 실패와 평가의 장기 영향 / CLOSED

`GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01 / A_RESULT_TAG_RECOVERY_SPIRAL_WITH_HIDDEN_MINOR_SEMESTER_EVALUATION`.

```text
사건 결과·부작용·발견은 즉시 세계와 마도서에 기록
→ 성적·감점·예상등급은 학기 중 비공개
→ 부분 성공·실패는 내부 평가에 작은 상한형 감점만 반영
→ 이후 활동에서 긍정 증거·발견·대체 해법 축적
→ 학기 종료 시 전체 포트폴리오와 함께 종합 평가
```

승인 규칙:

- 사건별·학기 총감점은 작고 상한이 있다.
- 한 번의 실패로 장학 박탈·관계 단절·수강 폐쇄·메인 진행 차단이 발생하지 않는다.
- 회복 콘텐츠는 감점을 직접 지우는 벌점 퀘스트가 아니라 긍정 증거와 새 발견을 만든다.
- 학기말에는 평가 결과와 영향을 준 대표 사건을 문장으로 설명한다.
- 내부 원점수와 사건별 감점표는 공개하지 않는다.
- 정확한 감점·상한·가중치·등급 경계는 `TEST_VALUE`다.

## 4. 미니게임·추가 콘텐츠 활성 범위

- 문자 획·마력 보정.
- 재료 식별·분류.
- 촉매 배합·안정화.
- 축제·일상 응용.
- 현장 채집·안전 회수.
- 연구실 공동 제작.

Vertical Slice에는 대표 미니게임 최소 1개를 포함한다. 과거의 미니게임 전면 금지는 `GRIMOIRE_VERTICAL_SLICE_MINIGAME_CRAFTING_SCOPE_OVERRIDE_2026-08-02.md`가 대체한다.

## 5. 유지되는 보호 규칙

- 별도 시험 Chapter·시험장·시험 전용 미니게임은 없음.
- 평가·허가·전문화를 재료·화폐로 구매하지 않음.
- 특정 희귀 재료·제작물이 필수 진행의 유일 해법이 되지 않음.
- 반복 전투·채집·미니게임으로 영구 성장이나 숨은 평가를 무한 최적화하지 않음.
- 제작물은 모든 상황의 상위 호환 장비가 아님.
- 미니게임은 Chapter 질문·문자 의미·재료 성질·상황 판단과 연결.
- 학기 중 실시간 점수·예상 등급·장학 게이지를 표시하지 않음.
- 학기말 결과는 블랙박스가 아니라 근거 사건과 평가 문장으로 설명.

## 6. 현재 공백

### P2-07 — 본편 범위와 종결 조건 / CURRENT

미정:

- 학기·Chapter 수와 전체 플레이 시간.
- 출시 본편 메인 계열·전문화 수.
- 미니게임 형식·재료·레시피·신규 장소 수.
- 추가 콘텐츠의 필수·선택 비율.
- 학기말 평가와 최종 연구·세계 변화의 종결 조건.
- Solo·Mobile 콘텐츠 예산과 재사용률.

현재 질문:

`GM-FULL-GAME-SCOPE-ENDING-01`.

권장 후보:

`A_ONE_SCHOOL_YEAR_THREE_TERM_COMPLETE_ARC`.

후보 기본 범위:

- 1학년 3학기 완결형.
- 핵심 Chapter 6~8개.
- 메인 계열 3개 내외.
- 미니게임 가족 4~6개 재사용·변주.
- 첫 독자적 마법 원리와 책임 있는 세계 변화 증명을 엔딩으로 사용.

모든 수치는 `TEST_VALUE`다.

## 7. 적대적 위험

### RISK-FL-01 — 숨김 평가가 불공정한 블랙박스가 됨

보호:

- 평가 반영은 승인된 평가 축과 실제 사건 로그에서만 계산한다.
- 학기말에 대표 사건·강점·보완점을 문장으로 설명한다.
- 숨은 난수·미고지 조건·재료 보유량만으로 등급을 바꾸지 않는다.

### RISK-FL-02 — 학기말 직전 저장 불러오기

보호:

- 단일 사건의 감점 상한을 낮게 둔다.
- 학기 평가를 여러 맥락의 포트폴리오 증거로 구성한다.
- 낮은 평가도 본편 진행 차단이 아니라 다음 학기 보완 경로로 연결한다.

### RISK-FL-03 — 결과 태그와 회복 콘텐츠 분기 폭증

보호:

- 고유 결과는 주요 사건에 집중한다.
- 나머지는 공통 대화·연구·제작·현장 콘텐츠를 태그에 따라 변주한다.
- 관계·장소·연구·평가 축을 제한된 상태 집합으로 관리한다.

### RISK-SCOPE-01 — 추가 콘텐츠로 Solo·Mobile 범위 초과

판정:

- 사용자가 미니게임·추가 콘텐츠 제작을 승인했다.
- 제거가 아니라 `FULL-GAME-SCOPE-01`에서 총량·재사용률·신규 Asset 예산을 잠근다.

## 8. 완료 기준

남은 범위 결정은 다음을 포함해야 한다.

- Decision ID와 사용자 승인안.
- 학기·Chapter·계열·미니게임·추가 콘텐츠 범위.
- 필수/선택 콘텐츠와 엔딩 조건.
- Solo·Mobile·QA·Asset 경계.
- Vertical Slice 대표성 재검증 진입 조건.
- GitHub·Sheet 동일 값 Readback.

Runtime·실기기·접근성·사람 검증은 계속 `NOT_RUN`이며 구현은 `NOT_STARTED`다.
