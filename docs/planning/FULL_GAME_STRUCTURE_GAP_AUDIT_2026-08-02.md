# GR-AUD-FULL-GAME-STRUCTURE-20260802-01 — 전체 게임 구조·대표성·Mobile UX·Wireframe 누락 감사

## 1. 감사 대상

- 최신 GitHub `main`과 working branch `chatgpt/grimoire-full-game-structure-20260802`.
- 전체 게임 Macro Loop·Chapter Rhythm·커리큘럼·성장·보상·실패 평가·제품 범위.
- Internal Vertical Slice 대표성·Mobile UX Flow·Writing/Battle Wireframe 정본.
- Google Sheet `00·01·02·03·04·05·10·12·20·30·40·41·50·51·52·60·80·90·99`.
- Battle·Mobile·Art·Save/Resume 계약과 Draft PR #36 전체 diff·CI·리뷰.

## 2. 현재 결론

```yaml
verdict: TEN_PLANNING_DECISIONS_APPROVED / PREMERGE_ADVERSARIAL_GATE_CURRENT
p0_open: 0
p1_open: 0
p2_closed: 10
p2_open: 0
grill_counter: 10_of_10
completed_gates:
  - FULL-GAME-STRUCTURE-01
  - VERTICAL-SLICE-REPRESENTATIVENESS-01
  - MOBILE-UX-FLOW-01
  - MOBILE-WRITING-BATTLE-WIREFRAME-01
current_gate: PREMERGE-ADVERSARIAL-01
current_question: GM-PREMERGE-ADVERSARIAL-GATE-01
implementation: NOT_STARTED
codex: BLOCKED
```

## 3. 승인된 결정

1. `GM-FULL-GAME-MACRO-LOOP-01 / A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM`.
2. `GM-FULL-GAME-CHAPTER-RHYTHM-01 / A_FIXED_FUNCTIONS_VARIABLE_ORDER`.
3. `GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 / B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE`.
4. `GM-FULL-GAME-GROWTH-CHOICE-COST-01 / A_COURSE_SLOTS_PLUS_CONTEXTUAL_PORTFOLIO_EVIDENCE_NO_SEPARATE_EXAM`.
5. `GM-FULL-GAME-REWARD-ECONOMY-01 / A_PRIMARY_PLUS_C_MATERIAL_CRAFTING_MINIGAME_CONTENT`.
6. `GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01 / A_RESULT_TAG_RECOVERY_SPIRAL_WITH_HIDDEN_MINOR_SEMESTER_EVALUATION`.
7. `GM-FULL-GAME-SCOPE-ENDING-01 / B_THREE_SCHOOL_YEAR_FULL_GAME_WITH_A_YEAR_ONE_DEMO_BOUNDARY`.
8. `GM-VERTICAL-SLICE-REPRESENTATIVENESS-01 / A_CORE_SYSTEMS_PLAYABLE_PLUS_LONG_TERM_STRUCTURE_COMPRESSED_MOCK`.
9. `GM-MOBILE-UX-FLOW-01 / A_SCENE_FIRST_CONTEXTUAL_FOCUS_FLOW`.
10. `GM-MOBILE-WRITING-BATTLE-WIREFRAME-01 / A_CONTEXT_PRESERVING_EXPANDABLE_RIGHT_WRITING_FOCUS_PANEL`.

## 4. 최종 기획 계약

### 제품 단계

```text
46–53분 Internal Vertical Slice
→ 1학년 3학기 Year-One Demo Build
→ 3학년 전체 Full Game
```

### 핵심 UX

```text
장면·현재 목표
→ 하나의 Focus Task
→ 필요 시 확장 우측 Writing Panel
→ 단일 원자 Commit
→ 결과·세계 변화
→ Grimoire 기록
→ Hub 또는 다음 Anchor
```

### Writing·Battle 영역

- 기본 상태는 적·환경 중심이다.
- 작성 시 우측 Panel을 확장하고 상황 영역을 압축하되 제거하지 않는다.
- 적 의도·타이머·대상·환경 위험·핵심 HP/마나는 작성 중 필수 잔존 정보다.
- 캔버스는 Panel의 최대 단일 입력 영역이다.
- 후보·의미·신뢰·비용·문법·Undo·삭제·취소·`[구현]`은 캔버스와 분리한다.
- 낮은 확신 자동 확정은 금지한다.
- Panel 축소·중단복귀에는 Draft를 유지하고 명시적 전체 취소에서만 폐기한다.
- 비전투·제작·전투가 같은 Panel 생명주기를 공유하되 입력 판단과 결과는 독립적이다.

## 5. 적대적 위험과 보호

### RISK-01 — 상황 보존 명목의 정보 과밀

- 작성 중 적 의도·타이머·대상·환경 위험·핵심 상태만 남기고 부가 정보는 접는다.
- 캔버스 위 버튼·툴팁·후보를 금지한다.

### RISK-02 — Panel 확장이 사실상 전체 화면 Takeover

- 적·대상·환경·타이머의 지속 가시성을 필수 통과 조건으로 둔다.
- 상황 인과가 소실되면 Wireframe을 재작업한다.

### RISK-03 — 작은 캔버스가 핵심 난도가 됨

- Touch·Stylus·접근성 확대 상태에서 캔버스 면적과 판독 실패를 검증한다.
- Panel 비율·캔버스 크기·후보 수는 `TEST_VALUE`다.

### RISK-04 — 오시전·Draft 손실·중복 결과

- 낮은 확신 자동 확정 금지.
- 취소와 `[구현]`을 위치·형태·문구로 분리.
- Commit 단일 소유권과 Result/Grimoire 공통 Ledger 유지.
- Panel 축소·App 중단복귀 시 Draft 보존.

### RISK-05 — 3년 본편 범위 폭증

- Internal Slice 통과 전 Year-One Demo 대량 제작 금지.
- Year-One Demo 검증 전 2·3학년 전용 대형 콘텐츠 제작 금지.
- 공통 사건·장소·미니게임·Asset 변주를 우선한다.

## 6. 사전 병합 Gate 검증 항목

`GM-PREMERGE-ADVERSARIAL-GATE-01`은 다음을 새로 확인한다.

1. 최신 main SHA와 PR base 일치·mergeability.
2. PR 전체 changed files가 계획 문서·검증 도구 범위인지.
3. Godot Scene·Script·Resource·게임 데이터·잠금 Asset 변경이 없는지.
4. 열 개 Decision ID와 승인 옵션이 GitHub·Sheet에 동일한지.
5. Sheet `10/10`, pending 10개, Readback PASS, 행 덮어쓰기 없음.
6. CI와 adversarial-gate가 최종 HEAD에서 성공했는지.
7. 미해결 review thread와 blocking review가 없는지.
8. 구현·Runtime·Device·Accessibility·Human 상태가 과장되지 않았는지.
9. `TEST_VALUE`가 확정 수치로 오인되지 않는지.
10. PR 병합 후 main·Sheet 최종화 절차가 정의됐는지.

## 7. 보호된 경계

- `PLANNING_ONLY_PROFILE` 유지.
- 구현 `NOT_STARTED`.
- Codex `BLOCKED`.
- Runtime·실기기·접근성·사람 검증 `NOT_RUN`.
- 사전 적대 검토 통과 전 PR 병합 금지.
- Gate 통과 후에도 사용자 명시 승인 없이 자동 병합 금지.
- 병합 후 별도 구현 진입 Gate 승인 전 Godot 제품 구현 금지.
