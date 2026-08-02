# GRIMOIRE 전체 게임 구조·대표성·Mobile UX·Wireframe 완료 상태 Override

```yaml
status: ACTIVE_CANON_OVERRIDE
approved_by:
  - GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
  - GM-MOBILE-UX-FLOW-01
  - GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
effective_at: 2026-08-02T19:42+09:00
supersedes_conflicting_status_in:
  - docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
  - docs/planning/FULL_GAME_STRUCTURE_GATE_01_2026-08-02.md
vertical_slice_content_planning_complete: true
full_game_structure_planning_complete: true
vertical_slice_representativeness_planning_complete: true
mobile_ux_flow_planning_complete: true
mobile_writing_battle_wireframe_planning_complete: true
current_design_gate: PREMERGE-ADVERSARIAL-01
implementation_entry_gate: NOT_APPROVED
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. 목적

기존 정본과 중간 Gate 문서에 남아 있는 전체 게임 구조·대표성·Mobile UX Flow·Writing/Battle Wireframe 진행 중 표현을 역사적 상태로 제한한다. 사용자가 다음 열 개의 Grill Me 결정을 승인했다.

1. `GM-FULL-GAME-MACRO-LOOP-01`.
2. `GM-FULL-GAME-CHAPTER-RHYTHM-01`.
3. `GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01`.
4. `GM-FULL-GAME-GROWTH-CHOICE-COST-01`.
5. `GM-FULL-GAME-REWARD-ECONOMY-01`.
6. `GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01`.
7. `GM-FULL-GAME-SCOPE-ENDING-01`.
8. `GM-VERTICAL-SLICE-REPRESENTATIVENESS-01`.
9. `GM-MOBILE-UX-FLOW-01`.
10. `GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`.

## 2. 현재 활성 상태

```text
FULL-GAME-STRUCTURE-01 = APPROVED
VERTICAL-SLICE-REPRESENTATIVENESS-01 = APPROVED
MOBILE-UX-FLOW-01 = APPROVED
MOBILE-WRITING-BATTLE-WIREFRAME-01 = APPROVED
GM-PREMERGE-ADVERSARIAL-GATE-01 = CURRENT
```

이 완료는 기획 계약 완료이며 다음을 의미하지 않는다.

- Godot 제품 구현 시작 또는 완료.
- 픽셀·비율·Touch target 최종값 승인.
- Mobile 실기기·접근성·사람 플레이 검증 완료.
- Internal Vertical Slice 구현 승인.
- Year-One Demo 또는 Full Game 콘텐츠 제작 승인.
- Draft PR #36 자동 병합 승인.

## 3. 승인된 Mobile Writing·Battle 계약

```text
기본 적·환경 중심 관찰
→ 우측 Writing Panel 확장
→ 적 의도·타이머·대상·환경 위험 유지
→ 큰 캔버스와 분리된 후보·비용·문법·복구·[구현]
→ 단일 원자 Commit
→ 결과·Grimoire·상황 복귀
```

- Panel 축소·일시 닫기에는 Draft를 보존한다.
- 전체 취소에서만 Draft를 폐기한다.
- 낮은 확신 후보를 자동 확정하지 않는다.
- 캔버스와 위험 행동 버튼을 겹치지 않는다.
- 비전투·제작·전투는 같은 Panel 생명주기를 공유하되 입력 판단은 독립적으로 유지한다.
- 모든 상세 비율·크기·후보 수·시간은 `TEST_VALUE`다.

## 4. 다음 순서

```text
GM-PREMERGE-ADVERSARIAL-GATE-01
→ Draft PR #36 병합 가능 여부 보고
→ 사용자 명시 병합 승인
→ 병합 후 정본·Sheet main Readback
→ 구현 진입 Gate 별도 결정
```

사전 적대 검토가 통과해도 사용자 명시 승인 없이 병합하거나 구현을 시작하지 않는다.
