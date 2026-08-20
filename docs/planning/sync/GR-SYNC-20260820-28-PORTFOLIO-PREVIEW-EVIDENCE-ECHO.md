# GR-SYNC-20260820-28-PORTFOLIO-PREVIEW-EVIDENCE-ECHO

```yaml
sync_id: GR-SYNC-20260820-28-PORTFOLIO-PREVIEW-EVIDENCE-ECHO
decision_id: GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01
approval: USER_APPROVED_RECOMMENDED_OPTION_A
work_mode: PLAN
project_main_parent: 7d760559f218dcd6513748a2fc8123f174e699b9
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
red_head: bb049c2d472337ec4ab77fdb21dd2fbd735e70c9
pr: 145
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## User approval

사용자는 2026-08-20 KST에 `44~46 Portfolio / Preview`의 권장 A안 **Evidence Echo + One Open Question**을 승인하고 진행을 요청했다.

## TDD RED

PR #145의 첫 head `bb049c2d472337ec4ab77fdb21dd2fbd735e70c9`에서 planning CI를 실행했다.

기존 W6/W7/Result-Grimoire 및 다른 planning/runtime contract는 통과했고, 새 Portfolio/Preview 산출물이 아직 없어서 다음 두 테스트가 의도대로 실패했다.

```text
test_required_planning_artifacts_exist
test_portfolio_preview_evidence_echo_refinement
```

직접 원인은 다음 정본 파일의 부재였다.

`docs/planning/FROSTBLOOM_PORTFOLIO_PREVIEW_EVIDENCE_ECHO_01_APPROVAL_2026-08-20.md`

따라서 RED는 기존 회귀가 아니라 새 승인 계약의 미구현을 정확히 증명했다.

## Fresh benchmark / Existing Solution First

Research receipt:

`docs/planning/research/2026-08-20-portfolio-preview-evidence-echo-research-receipt.md`

Fresh research는 승인 직전 같은 work unit에서 수행됐고 승인 후 scope/product decision/key assumptions가 바뀌지 않아 동일 receipt를 사용한다.

Pattern-level synthesis:

- Hades → 실제 플레이 상황을 기억하고 반응하는 acknowledgement.
- Outer Wilds → 열린 질문/curiosity를 다음 진행 동력으로 사용.
- Heaven's Vault → 선택과 경로를 기억하고 반응하며 불확실성을 보존.
- Pentiment → 선택 결과가 이후에도 남는 consequence continuity.

기존 저장소 권위인 BEAT_08, Portfolio evidence, Festival `PREVIEW_ONLY`, 39~44 Result/Grimoire receipt를 재사용한다. 새 grade/quest/Festival gameplay authority는 만들지 않는다.

## Approved contract

```text
44:00~44:40  MAREN_EVIDENCE_ECHO
44:40~45:10  PORTFOLIO_RECEIPT
45:10~46:00  ONE_OPEN_QUESTION + FESTIVAL_GLIMPSE
```

Hard invariants:

```text
EVIDENCE_ECHO_ONE_OPEN_QUESTION
MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT
PORTFOLIO_RECEIPT
OPEN_QUESTION_NOT_OBJECTIVE
FESTIVAL_PREVIEW_ONLY
NO_MENTOR_GRADE
NO_RESULT_RESCORING
NO_HIDDEN_PORTFOLIO_SCORE
NO_HIDDEN_BEST_ANSWER
NO_NEXT_QUEST_CHOICE
NO_SECOND_INCIDENT
NO_NEW_TUTORIAL
NO_LORE_DUMP
NO_NEW_GAMEPLAY_DECISION
```

Maren은 실제 receipt 중 최대 3개 요소만 되받아준다. Portfolio는 `principle_saved / causal_evidence_linked / unresolved_tension_carried` 저장 상태만 확인한다. 마지막 열린 질문은 실제 Discovery/Remaining Uncertainty에서 1개만 파생하며 objective가 아니다. Festival은 한 개의 비플레이형 glimpse만 허용한다.

## 5-pass adversarial review

### Pass 1 — mentor grading
- 공격: Maren의 피드백이 Result 위의 최종 점수가 되는가?
- 가드: `MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT`, `NO_MENTOR_GRADE`.
- 판정: PASS.

### Pass 2 — result rescoring
- 공격: Portfolio가 5축 결과를 다시 합산/등급화하는가?
- 가드: `NO_RESULT_RESCORING`; 저장 상태 3필드만 확인.
- 판정: PASS.

### Pass 3 — questification
- 공격: open question이 사실상 next quest가 되는가?
- 가드: `OPEN_QUESTION_NOT_OBJECTIVE`; marker/reward/tracking/branch/mandatory followup 금지.
- 판정: PASS.

### Pass 4 — Festival scope creep
- 공격: glimpse가 두 번째 사건/튜토리얼/긴 lore intro로 확장되는가?
- 가드: `FESTIVAL_PREVIEW_ONLY`, `NO_SECOND_INCIDENT`, `NO_NEW_TUTORIAL`, `NO_LORE_DUMP`.
- 판정: PASS.

### Pass 5 — two-minute overload
- 공격: mentor + portfolio + hook + festival + 선택지를 모두 요구해 46분 종료가 깨지는가?
- 가드: max 3 echo elements + 3 receipt fields + one question + one glimpse + `NO_NEW_GAMEPLAY_DECISION`.
- 판정: STRUCTURAL_PASS; 실제 2분 달성은 NOT_RUN.

## Files / projection

Created:

- `data/testing/frostbloom_portfolio_preview_v1.json`
- `docs/planning/FROSTBLOOM_PORTFOLIO_PREVIEW_EVIDENCE_ECHO_01_APPROVAL_2026-08-20.md`
- `docs/planning/research/2026-08-20-portfolio-preview-evidence-echo-research-receipt.md`
- `docs/planning/sync/GR-SYNC-20260820-28-PORTFOLIO-PREVIEW-EVIDENCE-ECHO.md`

Updated:

- `tests/test_frostbloom_internal_vertical_slice_contract.py`
- `docs/testing/frostbloom_graybox/README.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`

The existing parent `BEAT_08 — 44–46 PORTFOLIO_AND_PREVIEW` remains semantically compatible and is not duplicated into a second full walkthrough authority. The child fixture/canon owns the detailed timing and guards.

## Scope boundary

No product `src`, Scene, Resource, addon, asset, `project.godot`, Task8, balance, or runtime behavior mutation is authorized or performed by this planning refinement.

## Next gate

Before merge:

1. exact-head planning/graybox/JSON/NFC CI GREEN;
2. applicable runtime regression gates terminal GREEN;
3. unresolved review threads = 0;
4. same-goal open PR uniqueness;
5. project main still equals approved parent or concurrency is classified.

After merge, GitHub main SHA and the four Notion consumer surfaces must be read back. The next planning axis is `FROSTBLOOM_FIRST_SESSION_END_TO_END_REVIEW`; planning completion still requires explicit user declaration.
