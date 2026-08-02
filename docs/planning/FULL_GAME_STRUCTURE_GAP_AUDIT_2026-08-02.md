# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조·대표성·Mobile UX 누락 감사

## 1. 감사 대상

- GitHub main `385b17d84608b6871c7453cdeacc43268c5cea91`.
- Working branch `chatgpt/grimoire-full-game-structure-20260802`.
- Vertical Slice·Macro Loop·Chapter Rhythm·다계열 커리큘럼·성장·보상·실패 평가·본편 범위·대표성·Mobile UX Flow 정본.
- Google Sheet `00·01·02·03·04·05·10·12·20·30·40·41·50·51·52·60·80·90·99`.
- 승인된 Battle·Mobile·Art·Save/Resume 계약.

## 2. 현재 결론

```yaml
verdict: FULL_GAME_STRUCTURE_REPRESENTATIVENESS_AND_MOBILE_UX_FLOW_APPROVED / MOBILE_WRITING_BATTLE_WIREFRAME_CURRENT
p0_open: 0
p1_open: 0
p2_closed: 9
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
  - GM-MOBILE-UX-FLOW-01
completed_gates:
  - FULL-GAME-STRUCTURE-01
  - VERTICAL-SLICE-REPRESENTATIVENESS-01
  - MOBILE-UX-FLOW-01
current_gate: MOBILE-WRITING-BATTLE-WIREFRAME-01
current_question: GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
```

전체 게임 구조·Internal Vertical Slice 대표성·Mobile Landscape 상태 전환 계약이 닫혔다. 다음 작업은 승인된 Scene-first Focus Flow를 실제 화면 영역 관계로 변환하는 Writing/Battle Wireframe 결정이다.

## 3. 승인된 구조

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

실제 작성·비전투·제작 미니게임·최소 2축 자유일정·단일 강적 현장 전투·마도서·학기말 평가를 플레이로 검증하고, 이후 학기·학년·전문화는 상태를 명시한 Preview Mock으로 제한한다.

### P2-09 — Mobile UX Flow / CLOSED

`GM-MOBILE-UX-FLOW-01 / A_SCENE_FIRST_CONTEXTUAL_FOCUS_FLOW`.

```text
장면·현재 목표
→ 한 번에 하나의 Focus Task
→ 필요 시 Writing Panel
→ 결과 원자 적용
→ Grimoire 기록
→ Hub 또는 다음 Anchor
```

확정 규칙:

- 안전 장면에서만 일정·마도서·설정의 일관된 얇은 전역 진입점을 제공한다.
- 수업·비전투·제작·전투는 공통 Focus Task 진입·취소·Commit·결과·복귀 계약을 공유한다.
- Writing Panel은 상황 내부의 임시 Focus Layer다.
- 시간 압박 전투 중 전역 메뉴는 제한하고 Pause·접근성·안전 종료만 보장한다.
- Focus Task 전·결과 원자 적용 후를 우선 Save/Resume Anchor로 사용한다.
- 중단복귀 시 중단 상태·Draft·미적용/적용 결과·다음 안전 행동을 설명한다.

## 4. 제품·제작 경계

- Year-One Demo는 본편의 1학년 정본이며 평행 캠페인이 아니다.
- Vertical Slice 대표성·Mobile UX Flow 승인만으로 구현 준비가 완료된 것은 아니다.
- Writing/Battle Wireframe과 구현 진입 Gate 승인 전 Godot 제품 구현을 시작하지 않는다.
- Vertical Slice Runtime·실기기·접근성·사람 검증 PASS 전 Year-One Demo 6~8 Chapter 본제작을 시작하지 않는다.
- Year-One Demo 검증 전 2·3학년 전용 대형 콘텐츠를 본제작하지 않는다.
- 모든 Panel 비율·Touch target·Anchor 수·전환 시간·통과 수치는 `TEST_VALUE`다.

## 5. 현재 Gate

### MOBILE-WRITING-BATTLE-WIREFRAME-01 / CURRENT

현재 질문:

`GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`.

검증 대상:

- 적·행동 예고·타이머·환경 위험과 작성 캔버스의 동시 가시성.
- 기본 관찰 상태와 Writing Focus 상태의 영역 확장·축소 관계.
- 인식 후보·의미·비용·문법·Undo·삭제·취소·`[구현]`의 분리.
- Writing Panel 축소·복귀 시 Draft 보존.
- 비전투·제작·전투의 공통 Panel 계약.
- Mobile Safe Area·Touch·Stylus·접근성 확대에서 핵심 정보 가림 여부.

권장 후보:

`A_CONTEXT_PRESERVING_EXPANDABLE_RIGHT_WRITING_FOCUS_PANEL`.

## 6. 적대적 위험

### RISK-UX-01 — 전역 기능 은닉

보호:

- 안전 장면에서 일정·마도서·설정의 위치와 아이콘 의미를 고정한다.
- 첫 노출과 중단복귀 후 Context Card에서 위치를 재확인한다.

### RISK-UX-02 — Focus Task의 획일화

보호:

- 공통 상태 계약은 공유하되 수업·비전투·제작·전투의 입력 방식과 상황 판단은 유지한다.
- 모든 콘텐츠를 같은 미니게임으로 치환하지 않는다.

### RISK-WIRE-01 — 작성 Panel과 상황 보존 영역의 동시 과밀

보호:

- 작성 중 상황 영역은 적 의도·타이머·대상·환경 위험·핵심 상태만 남긴다.
- 캔버스 위 버튼·툴팁·후보 겹침을 금지한다.
- Panel 비율은 기기 종횡비별 `TEST_VALUE`로 검증한다.

### RISK-WIRE-02 — 전체 화면 작성으로 상황 인과 소실

보호:

- 권장안은 적·대상·환경을 제거하지 않는 확장 우측 Panel이다.
- 작성은 별도 앱이 아니라 상황 내부 Focus Layer로 유지한다.

### RISK-SCOPE-01 — Year-One Demo와 3년 전체 범위 폭증

보호:

- 단계별 Gate와 공통 사건·장소·미니게임·Asset 변주 원칙을 유지한다.
- 계열별 완전 별도 캠페인을 만들지 않는다.

## 7. 보호된 경계

- `PLANNING_ONLY_PROFILE` 유지.
- 구현 `NOT_STARTED`.
- Codex `BLOCKED`.
- Runtime·실기기·접근성·사람 검증 `NOT_RUN`.
- Writing/Battle Wireframe 승인 전 구체 화면 제작·제품 구현 금지.
- Wireframe 승인 후에도 구현 진입 Gate 전 Godot 제품 코드·Scene·Resource 작성 금지.
- Full Game의 2·3학년 본제작은 Year-One Demo 검증 이후.
