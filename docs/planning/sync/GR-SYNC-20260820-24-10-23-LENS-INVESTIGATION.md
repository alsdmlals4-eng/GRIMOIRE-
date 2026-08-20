# GR-SYNC-20260820-24 — 10~23 Lens-only 자유준비·순차 조사

```yaml
sync_id: GR-SYNC-20260820-24-10-23-LENS-INVESTIGATION
decision_id: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
predecessor_refinement: GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01
date_kst: 2026-08-20
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
project_main_at_entry: f00a290682f50b782c762f83ec90445556f0a8ae
same_goal_open_prs_at_entry: 0
product_behavior_change: NONE_IN_THIS_PLANNING_PR
persistent_godot_mutation: NONE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## Approval

사용자는 직전 제안의 A안을 승인했다.

```text
10~14 출동 전 자유 준비
= clue/resource unlock이 아니라 Lens/affordance

14~23 Frostbloom 조사
= 네 질문 모두 접근 가능
→ 첫 조사 결과 확인
→ 두 번째 질문을 순차 선택
→ Known 2 / Unknown 2
→ W6
```

## Existing Solution First

재사용한 기존 정본:

- `docs/testing/frostbloom_graybox/03_INVESTIGATION_2_OF_4_MATRIX.md` — 여섯 unordered pair 모두 W6 진행 가능.
- `docs/testing/frostbloom_graybox/04_FREE_SCHEDULE_4_CHOICE_AUDIT.md` — 네 자유일정 선택 모두 필수 진행/재료/정답 독점 없음.
- `GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01` — 첫 10분 학습→실습 전이.

새 조사 시스템이나 새 자원 시스템을 만들지 않고 위 구조의 정보 노출 순서와 의미를 refinement했다.

## TDD

RED first:

- `tests/test_frostbloom_internal_graybox_pack_contract.py`가 아직 존재하지 않는 `FROSTBLOOM_10_23_LENS_INVESTIGATION_01_APPROVAL_2026-08-20.md`를 요구.
- Lens-only fixture, sequential 2-of-4, Known2/Unknown2를 요구.

GREEN implementation target:

- child canon 추가.
- child fixture `data/testing/frostbloom_10_23_lens_v1.json` 추가.
- 46분 walkthrough / 03 matrix / 04 audit / pack README 갱신.
- `CURRENT_CONFIRMED_DECISIONS.md`에 active child refinement 승격.

## Benchmark receipt reuse

이 결정은 직전 10~23분 제안과 동일 work unit이며 scope/key assumptions가 변경되지 않았다. 따라서 이미 수행한 exploration/investigation benchmark receipt를 재사용한다.

```yaml
research_receipt_reuse: ALLOWED
reason: SAME_SCOPE_SAME_PRODUCT_DECISION_SAME_KEY_ASSUMPTIONS
adopted_principles:
  - PLAYER_QUESTION_DRIVES_NEXT_INVESTIGATION
  - DECISION_UNDER_INCOMPLETE_INFORMATION
copied_expression: NONE
```

## Five adversarial loops

1. Lens-only가 장식 선택으로 붕괴하는가? → 사건 중 관찰 가능한 affordance는 필요하지만 clue ownership은 금지.
2. PRACTICUM/PREPARE가 최적 루트가 되는가? → `owns_clue_unlock=false`, `owns_required_resource=false`.
3. 2-of-4가 무작위 클릭인가? → 결과 대신 질문 범주를 사전 표시, 첫 결과 뒤 두 번째 선택.
4. 정보 과부하가 생기는가? → W6 진입 요약 `Known 2 / Unknown 2 / Lens 1`로 제한.
5. 정답이 누출되는가? → spell/circuit/target/best intent/second-node best recommendation 금지.

현재 설계 판정은 `STRUCTURAL_PASS / HUMAN_NOT_RUN`이다.

## Protected invariants

- 46 / 53 / 60 minute contract.
- W1~W7 direct writing contract.
- W6/W7 major FIVE_POINT_STAR commits.
- six investigation pairs remain valid.
- four free-schedule choices remain available.
- Task8 implementation authority unchanged.
- no Human/Device/Performance/Full Slice PASS promotion.

## Notion targets

After repository merge/readback:

- Project Home — first-session flow summary.
- `03 · UI · 세계 재작성 Flow Map` — 10~23 Lens→sequential investigation flow.
- `GRIMOIRE::LOOP::VERTICAL_SLICE_SCHEDULE` — Revision increment + new main SHA.
- `TASK-2 Frostbloom 첫 세션 대표 경험 설계` — 10~23 refinement SYNCED; next axis W6 first major solution.

## Next planning axis

```text
23~30 W6 첫 주요 해결
→ 선택한 두 사실 + 두 불확실성 + Lens를
→ 실제 Target / FIVE_POINT_STAR / risk / mana / commitment로 바꾸는 경험
```
