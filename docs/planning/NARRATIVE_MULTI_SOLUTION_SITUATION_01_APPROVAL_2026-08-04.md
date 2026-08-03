# Narrative Multi-Solution Situation 01 Approval

## 승인 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_DESIGN_SCOPE
approved_at: 2026-08-04T00:27+09:00
selected_approach: NARRATIVE_INTENT_CHOICE_THEN_SPELL_DESIGN
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
implementation: NOT_STARTED
codex: DEFERRED
```

## 사용자 승인 내용

사용자는 다음 방향을 승인했다.

1. 한 사건에 여러 정답·유효 해결 방식을 둔다.
2. 텍스트 노벨 방식으로 플레이어가 무엇을 우선하고 어떤 방식으로 해결할지 선택한다.
3. 선택 후 그 의도에 맞는 주문을 플레이어가 직접 설계·사용한다.
4. 전투는 기본 진행이 아니라 여러 해결 방식 중 하나다.
5. 구조·복구·안정화·교섭·봉쇄·조사 등 비전투 마법 활용도 동등한 해결 방식으로 취급한다.

## 핵심 계약

```text
텍스트 선택
= 해결 의도·우선순위

주문 설계
= 실행 방법

세계 변화
= 주문 의미 × 상황 조건 × 자원·대가
```

선택지가 주문 이름을 직접 제시하거나 자동 성공을 결정하지 않는다.

## 대표 접근

- 시설 복구
- 생명 구조 우선
- 정령 안정화·교섭
- 현상 봉쇄
- 전투·강제 제압

각 접근은 최소 두 가지 유효 주문 계획을 가져야 하며, 대표 사건은 최소 세 가지 유효 결말을 제공한다.

## GrillMe Batch

이번 승인은 기존 Toolchain·역할 정정과 다른 신규 창의 기획 결정이다.

```yaml
previous_counter: 1_of_10
new_counter: 2_of_10
pending_decision_ids:
  - GM-FOUNDATION-POC-EXECUTION-READINESS-01
  - GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
merge_trigger: NONE
merge_authorized: false
```

## 책임 원본

- `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
- `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`
- `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`

## 다음 단계

작성 명세 사용자 검토 후 다음 창의 기획을 진행한다.

1. 대표 사건 전체 장면 흐름
2. 조사 정보와 텍스트 선택지
3. 접근별 주문 계획과 결과 태그
4. 사건 UX Wireframe
5. 온실·정령·마력 핵 Art Direction과 Concept Art Brief

제품 코드·Scene·Runtime 구현은 Codex 단계로 남긴다.
