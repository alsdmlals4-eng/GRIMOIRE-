# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- 현재 working branch `chatgpt/grimoire-full-game-structure-20260802`.
- `GRIMOIRE_PLANNING_CANON_2026-07-31.md`.
- `CIRCUIT_SYSTEM.md`, `WORLD_MAGIC_CURRICULUM_SYSTEM.md`와 연계 구형 장기 문서.
- `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`.
- Google Sheet `05·10·11·12·13·14·40·41·50·52`.
- 승인된 Battle·Mobile·Art 계약.
- 사용자 승인 `GM-FULL-GAME-MACRO-LOOP-01`.
- 사용자 승인 `GM-FULL-GAME-CHAPTER-RHYTHM-01`.

## 2. 현재 결론

```yaml
verdict: PASS_FOR_VERTICAL_SLICE / FULL_GAME_STRUCTURE_IN_PROGRESS
p0_open: 0
p1_open: 0
p2_closed: 2
p2_open: 5
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
current_question: GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
emergent_risks:
  - OPTIONAL_PRACTICUM_DOMINATES_FREE_SCHEDULE
  - OPTIONAL_COMBAT_ASSET_AND_FATIGUE_EXPANSION
  - LEGACY_MAGIC_CURRICULUM_SCOPE_EXPLOSION
  - GLYPH_COMBINATION_QA_EXPLOSION
```

전체 게임의 Macro Loop와 Chapter 리듬은 닫혔다. 남은 공백은 글자 커리큘럼·성장·경제·장기 실패·본편 범위다.

## 3. 유지할 강점

- `학습→선택→응용→책임→복기`의 학습 나선.
- 같은 글자 문법을 시험·축제·전투·환경에 다르게 적용.
- 완전한 정답 대신 결과와 대가를 설명하는 상황 해결.
- 자유일정이 다음 핵심 세션을 보조하고 필수 정보는 독점하지 않는 계약.
- 선택형 현장실습으로 자발적 전투·관찰 경로를 제공.
- 마도서가 결과뿐 아니라 의도·부작용·발견을 기록.
- 동반 정령이 정답을 알려주지 않고 감정·불안정을 반응.

## 4. 해결된 항목

### P1 — 작업 순서 충돌 / CLOSED

```text
FULL-GAME-STRUCTURE-01
→ Vertical Slice 대표성 재검증
→ Mobile UX·Wireframe
```

### P2-01 — Macro Loop 없음 / CLOSED

결정:

`GM-FULL-GAME-MACRO-LOOP-01 / A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM`

```text
새 원리 학습
→ 자유일정 선택
→ 통제된 응용
→ 메인 현장 적용
→ 마도서 복기·평가
→ 다음 원리 개방
```

### P2-05 — Chapter 변주·콘텐츠 확장 단위 불완전 / CLOSED

결정:

`GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`

필수 기능:

```text
발견·학습
선택·준비
통제된 응용
실전·책임 선택
복기·다음 질문
```

- 기능은 고정하되 순서·형태·비중은 변주한다.
- 인접 Chapter의 완전히 동일한 장면 순서 복제를 금지한다.
- 각 Chapter 기획 카드에 다섯 기능의 담당 장면을 명시한다.
- 자유일정 창 수와 기능별 시간은 `TEST_VALUE`다.

## 5. 현재 공백

### P2-02 — 글자 확장 규칙 없음 / CURRENT

최신 승인 정본은 `흐름 + 집중/분산`, 메인 1 + 보조 0~1을 사용한다.

구형 장기 문서는 다음을 후보로 둔다.

- 다수 메인 계열.
- 3개 학년.
- 메인 Lv.0~5.
- 보조 역할 10종.
- 학년별 보조 2/4/6개.
- 전문화·스톡·독립 연구.

구형 문서는 다수 항목을 `PROVISIONAL / PLANNING_DEFAULT`로 명시하지만, 이를 자동으로 본편 범위로 오인하면 조합·직접 작성·QA·Asset 범위가 폭증한다.

현재 질문:

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01`.

권장 후보:

`A_BOUNDED_SEMANTIC_SPIRAL`.

### P2-03 — 성장축과 선택 비용 불완전

`정밀 / 안정 / 표현 / 책임`, 관계, 동반자 4단계 방향은 있으나 실제 획득·선택·잠금·상충 규칙이 없다.

### P2-04 — 경제·소모처 불완전

마나 외 장기 자원, 보상 사용처, 반복 플레이의 인플레이션 방지 원칙이 미정이다.

### P2-06 — 실패와 평가의 장기 영향 없음

개별 상황의 부분 성공·피해 결과가 장학 평가·관계·다음 일정에 미치는 장기 영향이 미정이다.

### P2-07 — 본편 범위와 종결 조건 없음

Chapter 수, 핵심 글자 수, 메인 현장·보스 수, 완결 지점이 미정이다.

## 6. 현장실습 관련 열린 위험

### RISK-FP-01 — 전투가 자유일정의 지배적 선택

보호:
- 독점 영구 성장·핵심 글자·필수 정보 제공 금지.
- 일정 슬롯 1개 소비.
- 고유 첫 완료·새 해법 발견 중심.

### RISK-FP-02 — 무한 파밍

보호:
- 동일 실습 반복만으로 핵심 성장 자원 무한 획득 금지.
- 반복 보상·감쇠 값은 `TEST_VALUE`.

### RISK-FP-03 — 메인 현장 사건 약화

보호:
- 실습은 통제된 위험·관찰·준비 중심.
- 세계 상태 변화·서사 결과·장기 평가는 메인 사건 담당.

### RISK-FP-04 — 제작량·필기 피로 증가

보호:
- 기존 공간 변형·강한 적 1개체 규칙 재사용.
- 고유 상황 질문이 없는 전투 추가 금지.

## 7. 마법 커리큘럼 관련 새 적대적 위험

### RISK-MG-01 — 구형 장기 문서의 자동 승격

공격:
- 3개 학년·다수 계열·Lv.0~5·보조 2/4/6을 이미 확정된 본편 약속으로 오해할 수 있다.

보정 후보:
- 구형 문서는 장기 가능성 라이브러리로 보존한다.
- 실제 본편 글자·학년·복잡도는 새 Decision으로 재승인한다.

### RISK-MG-02 — 조합 검수 폭증

공격:
- 메인 수 × 보조 수 × 상황 수 × 순서 수가 증가한다.

보정 후보:
- Chapter별 새 학습 부담 하나.
- 소수 기존 글자와의 인증 조합 범위.
- 다중 보조·순서 문법 자동 활성화 금지.

### RISK-MG-03 — 새 글자가 상위 호환

공격:
- 새 글자가 더 강한 정답이면 이전 글자와 복수 해법이 사라진다.

보정 후보:
- 새 글자는 다른 대상·조건·대가를 연다.
- 이전 글자를 최소 한 상황에서 재해석한다.

### RISK-MG-04 — 반복 숙련 파밍

공격:
- 같은 글자를 반복 시전하는 것이 가장 빠른 성장법이 될 수 있다.

보정 후보:
- 상황 다양성·활용 기록·부작용 설명·평가를 숙련 근거로 사용한다.

## 8. 적대적 공격 질문

1. 학교생활이 전투 전 버프 메뉴가 되지 않는가?
2. 현장실습 전투가 휴식·준비·교류보다 항상 효율적이지 않은가?
3. 새 글자가 이전 글자의 상위 호환이 되지 않는가?
4. 글자 수보다 조합 경우의 수가 더 빠르게 폭증하지 않는가?
5. 인증 조합 범위가 자유 조합을 위장한 고정 정답 목록이 되지 않는가?
6. 직접 작성이 새 글자마다 반복 노동으로 증가하지 않는가?
7. 관계 선택이 단순 호감도 보너스로 축소되지 않는가?
8. 부분 성공이 실질적 차이 없이 문구만 달라지지 않는가?
9. 장기 성장 때문에 복수 해법이 하나의 최적 빌드로 수렴하지 않는가?
10. Vertical Slice가 전체 게임의 글자 확장 방식을 실제로 대표하는가?

## 9. 완료 기준

남은 공백마다 다음을 남긴다.

- Decision ID.
- 선택한 구조와 거부한 대안.
- 플레이어 행동·선택·피드백·보상·실패.
- 기존 승인과의 영향.
- 제작량과 검증 경계.
- GitHub·Sheet 동일 값 Readback.

Runtime·실기기·성능·접근성·사람 검증은 계속 `NOT_RUN`이다.
