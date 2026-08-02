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

## 2. 현재 결론

```yaml
verdict: PASS_FOR_VERTICAL_SLICE / FULL_GAME_STRUCTURE_IN_PROGRESS
p0_open: 0
p1_open: 0
p2_closed: 3
p2_open: 4
approved_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
current_question: GM-FULL-GAME-GROWTH-CHOICE-COST-01
emergent_risks:
  - OPTIONAL_PRACTICUM_DOMINATES_FREE_SCHEDULE
  - MULTI_SCHOOL_PARALLEL_CONTENT_EXPLOSION
  - OPTIMAL_SPECIALIZATION_BUILD
  - DIRECT_WRITING_FATIGUE_FROM_SCHOOL_COUNT
```

전체 게임의 Macro Loop, Chapter 리듬, 마법 커리큘럼 방향은 닫혔다. 남은 공백은 성장 선택 비용·경제·장기 실패·본편 범위다.

## 3. 유지할 강점

- `학습→선택→응용→책임→복기`의 학습 나선.
- 자유일정의 휴식·준비·교류·현장실습 네 축.
- 같은 글자 문법을 시험·축제·전투·환경에 다르게 적용.
- 결과와 대가를 설명하는 상황 해결.
- 마도서가 의도·부작용·발견을 기록.
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

필수 기능:

```text
발견·학습
선택·준비
통제된 응용
실전·책임 선택
복기·다음 질문
```

### P2-02 — 글자 확장 규칙 없음 / CLOSED

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 / B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE`.

승인 내용:

```text
공통 문법·기초 계열 체험
→ 복수 메인 계열 수강
→ 계열별 이해·숙련·활용·인증
→ 일부 계열 심화
→ 전문화·연구 방향 선택
```

보호 규칙:

- 미선택 계열은 메인 진행을 봉쇄하지 않는다.
- 주요 사건은 최소 두 계열 또는 공통 문법 해법을 수용한다.
- 계열별 별도 캠페인·맵·적·UI·VFX 전체 세트를 의무 제작하지 않는다.
- 공통 사건·장소·적·보조 문법을 계열별 결과와 대가로 재사용한다.
- 반복 시전만으로 전문화하지 않는다.
- 초기 선택은 즉시 영구 잠금하지 않는다.
- 정확한 계열 수·레벨·전문화 시점은 `TEST_VALUE`다.

## 5. 현재 공백

### P2-03 — 성장축과 선택 비용 불완전 / CURRENT

B안은 다계열 수강과 전문화를 승인했지만 다음이 미정이다.

- 한 구간에서 수강 가능한 계열 수.
- 폭넓은 수강과 한 계열 심화의 기회비용.
- 이해·숙련·활용·인증의 관계.
- 전문화 진입·재선택·전환 비용.
- 반복 전투 파밍 방지.

현재 질문:

`GM-FULL-GAME-GROWTH-CHOICE-COST-01`.

권장 후보:

`A_COURSE_SLOTS_PLUS_EVIDENCE_CERTIFICATION`.

### P2-04 — 경제·소모처 불완전

마나 외 장기 자원, 보상 사용처, 반복 플레이의 인플레이션 방지 원칙이 미정이다.

### P2-06 — 실패와 평가의 장기 영향 없음

부분 성공·피해·책임 선택이 장학 평가·관계·다음 일정에 미치는 장기 영향이 미정이다.

### P2-07 — 본편 범위와 종결 조건 없음

Chapter 수, 본편 계열 수, 메인 현장·종결 지점이 미정이다.

## 6. 다계열 커리큘럼의 적대적 위험

### RISK-MG-01 — 병렬 콘텐츠 제작량 폭증

공격:
- 계열마다 수업·교수·맵·적·VFX·사건을 별도 제작하면 Solo 범위를 초과한다.

보호:
- 공통 사건과 장소를 계열별 해법·대가로 재해석한다.
- 계열 전용 Asset 수는 본편 범위 Gate에서 제한한다.

### RISK-MG-02 — 최적 계열·전문화 수렴

공격:
- 특정 계열이 전투·환경·평가에서 모두 우월하면 선택이 사라진다.

보호:
- 전문화는 출력보다 대상·조건·안전·책임을 변화시킨다.
- 하나의 계열로 모든 결과를 최대화하지 못하도록 대가를 둔다.

### RISK-MG-03 — 미선택 계열 때문에 진행 차단

보호:
- 공통 문법·동료 협력·복수 계열 해법을 유지한다.
- 필수 정보와 유일 해법을 특정 계열에 독점시키지 않는다.

### RISK-MG-04 — 반복 시전 파밍

보호 후보:
- 이해·숙련·다양한 활용·인증의 복합 증거를 성장 조건으로 사용한다.
- 같은 실습 반복은 새로운 활용 증거를 대체하지 못한다.

### RISK-MG-05 — 직접 작성 피로

보호:
- 계열 수와 한 주문의 글자 수를 동시에 무제한 확대하지 않는다.
- 신규·미숙련 글자 직접 작성과 숙련 글자 재사용 보조의 경계는 후속 Mobile·스톡 Decision에서 검증한다.

## 7. 현장실습 관련 열린 위험

- 전투가 자유일정의 지배적 선택이 되는 문제.
- 동일 실습 반복 파밍.
- 메인 현장 사건의 긴장 약화.
- 추가 전투로 인한 작성 피로와 제작량 증가.

기존 보호 규칙은 유지한다.

## 8. 적대적 공격 질문

1. 다계열 선택이 실제 해법 차이인가, 색상·속성 피해 차이인가?
2. 미선택 계열 콘텐츠 제작 비용이 소비되지 않는 낭비가 되지 않는가?
3. 특정 계열이 대부분의 상황에서 상위 호환이 되지 않는가?
4. 수강 슬롯이 자유로운 학교생활보다 체크리스트가 되지 않는가?
5. 동일 실습 반복이 가장 빠른 성장법이 되지 않는가?
6. 전문화 후 초기 선택 후회가 회복 불가능하지 않은가?
7. 계열 수 증가로 직접 작성 피로가 폭증하지 않는가?
8. Vertical Slice의 흐름 계열이 전체 구조를 대표하는가?
9. 관계·책임 선택이 계열 보너스에 종속되지 않는가?
10. Solo 제작 범위에서 계열별 차이를 충분히 표현할 수 있는가?

## 9. 완료 기준

남은 공백마다 다음을 남긴다.

- Decision ID.
- 선택 구조와 거부 대안.
- 플레이어 행동·선택·피드백·보상·실패.
- 제작량·Mobile·QA 경계.
- GitHub·Sheet 동일 값 Readback.

Runtime·실기기·접근성·사람 검증은 계속 `NOT_RUN`이다.
