# GRIMOIRE 전체 게임 구조·대표성·Mobile UX 완료 상태 Override

```yaml
status: ACTIVE_CANON_OVERRIDE
approved_by:
  - GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
  - GM-MOBILE-UX-FLOW-01
effective_at: 2026-08-02T19:27+09:00
supersedes_conflicting_status_in:
  - docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
  - docs/planning/FULL_GAME_STRUCTURE_GATE_01_2026-08-02.md
vertical_slice_content_planning_complete: true
full_game_structure_planning_complete: true
vertical_slice_representativeness_planning_complete: true
mobile_ux_flow_planning_complete: true
current_design_gate: MOBILE-WRITING-BATTLE-WIREFRAME-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. 목적

기존 Vertical Slice 정본과 중간 Gate 문서에는 전체 게임 구조·대표성·Mobile UX Flow가 진행 중이라는 역사적 상태가 남아 있다. 사용자가 다음 아홉 개 Grill Me 결정을 승인했으므로 해당 표현은 활성 정본이 아니다.

- `GM-FULL-GAME-MACRO-LOOP-01`.
- `GM-FULL-GAME-CHAPTER-RHYTHM-01`.
- `GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01`.
- `GM-FULL-GAME-GROWTH-CHOICE-COST-01`.
- `GM-FULL-GAME-REWARD-ECONOMY-01`.
- `GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01`.
- `GM-FULL-GAME-SCOPE-ENDING-01`.
- `GM-VERTICAL-SLICE-REPRESENTATIVENESS-01`.
- `GM-MOBILE-UX-FLOW-01`.

따라서 `full_game_structure_planning_complete: false`, `VERTICAL_SLICE_REPRESENTATIVENESS = CURRENT`, `MOBILE_UX_FLOW = USER_DECISION_REQUIRED` 표현은 역사적 상태로만 보존한다.

## 2. 현재 활성 상태

```text
FULL-GAME-STRUCTURE-01 = APPROVED
VERTICAL-SLICE-REPRESENTATIVENESS-01 = APPROVED
MOBILE-UX-FLOW-01 = APPROVED
MOBILE-WRITING-BATTLE-WIREFRAME-01 = CURRENT
```

이 완료는 **기획 구조·대표성·상태 흐름 계약의 완료**이며 다음을 의미하지 않는다.

- Godot 제품 구현 완료 또는 구현 시작 승인.
- 픽셀 단위 Writing/Battle Wireframe 승인.
- Mobile 실기기 검증 완료.
- 접근성 검증 완료.
- 사람 플레이테스트 완료.
- Year-One Demo 또는 Full Game 콘텐츠 제작 승인.

## 3. 승인된 Mobile UX Flow

```text
장면·현재 목표
→ 한 번에 하나의 Focus Task
→ 필요 시 Writing Panel
→ 결과 원자 적용
→ Grimoire 기록
→ Hub 또는 다음 Anchor
```

- 안전 장면에서 일정·마도서·설정의 얇고 일관된 전역 진입점을 제공한다.
- 수업·비전투·제작·전투는 공통 Focus Task 상태 계약을 공유한다.
- 시간 압박 전투 중 전역 메뉴를 제한한다.
- Focus Task 전·결과 적용 후를 우선 Save/Resume Anchor로 사용한다.
- 중단복귀 시 Draft·결과 적용 여부·다음 안전 행동을 설명한다.

## 4. 다음 순서

```text
Writing/Battle Wireframe 계약
→ 구현 진입 Gate
→ Internal Vertical Slice 구현·Runtime·Mobile·접근성·사람 검증
→ Year-One Demo 제작 Gate
```

Wireframe 승인 후에도 구현 진입 Gate가 별도로 닫히기 전까지 제품 구현을 시작하지 않는다.
