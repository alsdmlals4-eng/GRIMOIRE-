# GR-SYNC-20260803-07 — GPT 창의 기획 Working Sync

## 현재 상태

```yaml
sync_id: GR-SYNC-20260803-07
status: NARRATIVE_MULTI_SOLUTION_SITUATION_DESIGN_USER_APPROVED_SPEC_READY_FOR_REVIEW
repository: alsdmlals4-eng/GRIMOIRE-
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
current_decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
grill_counter: 2_of_10
pending_approved_decisions: 2
counter_increment: true
implementation: NOT_STARTED
codex: DEFERRED
```

## 승인된 핵심 방향

사용자는 GRIMOIRE 사건 콘텐츠의 기본 구조로 다음을 승인했다.

```text
텍스트 노벨에서 사건·인물·환경을 조사한다
→ 무엇을 우선하고 어떤 방식으로 해결할지 선택한다
→ 선택한 의도에 맞는 주문을 플레이어가 설계한다
→ 직접 작성·Stock·소환수 중 실행 수단을 선택한다
→ 세계 변화와 대가를 확인한다
→ 결과를 마도서에 기록한다
```

핵심 경계:

```text
텍스트 선택 = 해결 의도·우선순위
주문 설계 = 실제 실행 방법
```

텍스트 선택지가 주문 조합을 자동 선택하거나 성공을 보장하지 않는다.

## 여러 정답·비전투 해결 계약

```yaml
minimum_approaches: 3
recommended_approaches: 5
minimum_noncombat_approaches: 2
recommended_noncombat_approaches: 4
minimum_valid_spell_plans_per_approach: 2
minimum_valid_endings: 3
combat_is_mandatory: false
single_true_ending: false
```

대표 접근:

1. 시설 복구
2. 생명 구조 우선
3. 정령 안정화·교섭
4. 현상 봉쇄
5. 전투·강제 제압

전투는 여러 해결 방식 중 하나이며 기본값이 아니다.

## 대표 사건

```yaml
situation: FROSTBLOOM_GREENHOUSE_HEART
ko_title: 서리꽃 온실의 심장
setting: 마법학교 온실
core_conflict:
  - 중심 마력 핵 정지
  - 마력 배관 결빙과 균열
  - 희귀 묘목 동사 위험
  - 서리 정령 불안정
  - 관리 학생 고립
hidden_truth: 정령은 원인이 아니라 냉기 누출의 피해자일 수 있음
```

대표 사건은 같은 장면에서 상태 레이어·인물 반응·접근별 주문 조건·결과 태그를 바꾸는 방식으로 제작량을 통제한다.

## 정본

- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`
- `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
- `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md`

## GPT 역할

```text
핵심 재미·콘텐츠·UX·이미지·아트 기획과 적대적 검토
```

다음 GPT 창의 작업:

1. 작성 명세 사용자 검토
2. `서리꽃 온실의 심장` 전체 텍스트 노벨 장면 흐름
3. 조사 정보·선택지·대사
4. 접근별 주문 계획·결과 태그
5. 사건 UX Wireframe
6. 온실·정령·마력 핵 Art Direction·Concept Art Brief
7. Vertical Slice 콘텐츠 조립

## Codex 보관 상태

```yaml
local_godot: USER_CONFIRMED_INSTALLED
ci_godot: PASS_4_7_1
codex_handoff: READY
product_project: NOT_CREATED
product_code: NOT_STARTED
codex_execution: DEFERRED_UNTIL_SELECTED_CREATIVE_SCOPE_IS_READY
```

제품용 `project.godot`, GDScript, Scene·Resource, Runtime·실기기 검증은 이후 Codex에서 수행한다.

## 보호 경계

```text
TEXT_CHOICE_AUTO_SELECTS_SPELL = PROHIBITED
TEXT_CHOICE_AUTO_GUARANTEES_SUCCESS = PROHIBITED
COMBAT_AS_MANDATORY_RESOLUTION = PROHIBITED
SINGLE_TRUE_ENDING_FOR_REPRESENTATIVE_SITUATION = PROHIBITED
PRODUCT_IMPLEMENTATION = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## GrillMe Batch

이번 승인은 기존 개발환경·역할 정정과 구분되는 신규 창의 결정이다.

```yaml
previous_counter: 1_of_10
current_counter: 2_of_10
pending_decision_ids:
  - GM-FOUNDATION-POC-EXECUTION-READINESS-01
  - GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
merge_trigger: NONE
merge_authorized: false
```
