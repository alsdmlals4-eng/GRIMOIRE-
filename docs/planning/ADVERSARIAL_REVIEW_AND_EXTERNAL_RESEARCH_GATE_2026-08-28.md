# GRIMOIRE 적대적 검토·외부 조사·구현 가능성 게이트

```yaml
decision_id: GM-ADVERSARIAL-RESEARCH-FEASIBILITY-GATE-20260828-01
status: USER_APPROVED_ACTIVE
effective_date: 2026-08-28
github_issue: 240
approval_source: "사용자: 작업시 항상 적대적검토루프, 인터넷조사, 실제 구현가능성 재확인"
scope: ALL_MATERIAL_PROJECT_WORK
external_research: FRESH_EXTERNAL_RESEARCH_CHECK_REQUIRED
implementation_feasibility: IMPLEMENTATION_FEASIBILITY_RECHECK_REQUIRED
human_facing_canon: REPOSITORY_HUMAN_FACING_CANON
repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
notion_policy: RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
owner: docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md
base_shared_method: running-adversarial-review-and-refinement
base_promotion: NO_BASE_PROMOTION__BASE_ALREADY_OWNS_THE_REUSABLE_ADVERSARIAL_METHOD
```

## 1. 항상 적용하는 작업 전 게이트

모든 실질 작업은 권장안 제시나 write 전에 다음 순서를 남긴다.

```text
fresh repository/Base/main + current domain owner read
→ fresh external research check
→ actual project feasibility recheck
→ adversarial attack / validate / refine
→ affected regression and destination readback
→ implementation, recommendation, or one user-decision question
```

`external research check`는 생략하지 않는다. 현재 외부 사실이 결정을 바꿀 수 없으면 결과를 `NOT_MATERIAL`로 기록하고, 그 근거와 확인 범위를 남긴다. 시장·플랫폼·엔진·플러그인·권리·접근성·경쟁·UX 관행이 영향을 줄 수 있으면 최신 공식/1차 자료를 먼저 확인하고, 필요할 때 현업 또는 성공·실패·혼합 사례를 추가한다. 검색 결과가 기존 결론을 지지하는지만 확인하는 방식은 금지한다.

`implementation feasibility recheck`는 문서 존재가 아니라 실제 project.godot, code, Scene, Resource, data, consumer, test, toolchain, 권한 및 runtime evidence를 대조한다. 결론은 반드시 `VERIFIED`, `PARTIAL`, `BLOCKED_UNVERIFIED`, `NOT_RUN` 중 하나로 쓴다. 자동·정적 증거는 Human/Device/Performance/Full Slice PASS로 승격하지 않는다.

## 2. 적대적 검토 루프

- 모든 work unit은 최소 한 번의 전체 범위 공격·검증·결정 보고를 수행한다.
- L1 이상 기획, 새/변경 implementation, PR, 정본 교정은 `MINIMUM_FIVE_FULL_SCOPE_LOOPS_FOR_L1_PR_OR_IMPLEMENTATION`을 적용한다. 각 loop는 범위, player intent, 결정 정본, code/data/Scene/asset/test consumer, recovery/rollback, 권리·비용·장기 유지, 외부 근거, 검증 상한, 완료 주장을 함께 공격한다.
- 발견은 `MUST_FIX`, `SHOULD_FIX`, `USER_DECISION_REQUIRED`, `DEFER`, `REJECTED_CRITIQUE`, `BLOCKED_UNVERIFIED`, `ALLOWED_LEGACY`로 분류한다. 제품 의미를 바꾸는 발견은 임의로 바꾸지 않고 한 번에 하나의 Grill Me 질문으로 올린다.
- 수정이 있으면 영향을 받은 범위만 회귀 검증한 뒤 다시 공격한다. PR 병합 뒤에는 exact main과 destination을 다시 읽고 post-merge loop를 수행한다.

## 3. 외부 조사와 채택 결정

| 단계 | 반드시 남길 것 |
| --- | --- |
| source | URL, 발행자/권위, 조회일, 현재 결정과의 관련성 |
| finding | 관찰 사실과 프로젝트에 대한 추론을 분리 |
| disposition | `ADOPT` / `ADAPT` / `REJECT` / `NOT_MATERIAL` |
| limit | 그 근거가 증명하지 않는 것과 남은 검증 |

현 프로젝트의 외부 표현·UI·자산은 출처와 권리 경계를 별도 asset/right owner에 기록한다. 벤치마크는 기능적 패턴만 채택하며, 타 게임의 정체성·고유 표현·UI를 복제하지 않는다.

## 4. 현재 W6 구현 가능성 재확인

```yaml
status: PARTIAL_TECHNICAL_SEAMS_EXIST__W6_RUNTIME_NOT_IMPLEMENTED
checked_on: 2026-08-28
actual_project_evidence:
  - project.godot: Godot 4.7 / GL Compatibility / Product Root main scene
  - coordinator: target preview → explicit confirmation → confirm use seam exists
  - transaction: AtomicSpellUseService and AtomicResultLedger protect exactly-once result/Mana mutation and rollback
  - UI: ContextTargetSelector and CommitBar are reusable seams; current English/internal player copy is not W6-ready
  - tests: Product Root and unit tests cover target selection, confirmation, duplicate commit failure, insufficient Mana, and atomic rollback
toolchain_evidence:
  - addons/gut/plugin.cfg: GUT 9.7.1
  - tracked formal-adoption evidence: Godot 4.7.1 / GUT 9.7.1 historical exact-head validation
external_research:
  - Godot Control and container UI supports the planned mobile-landscape target/forecast/receipt layout and focus/input behavior
  - GUT documents a Godot 4.7-specific branch; the project already pins that adoption lineage
remaining_before_W6_code:
  - user review of the L2 W6 feature spec
  - one L3 data/schema/traceability implementation contract
  - fresh exact-project Godot/GUT execution for the changed W6 head
  - target-resolution Godot inspection and Human usability evidence
```

Disposition: `ADAPT` existing coordinator, atomic use service, result ledger, target selector, and Product Root test seams. `REJECT` a `WARD`/`FLOWER` cosmetic reskin, hidden target asymmetry, automatic target/cast, or a planning image as runtime evidence. W6 code, runtime art, and production asset batch remain out of scope until its current user-review gate is passed.

## 5. 2026-08-28 adoption adversarial record

| loop | full-scope attack | finding | disposition / correction | result |
| --- | --- | --- | --- | --- |
| 1 | repository-only canon could regress to Base's Notion default | Base generic guidance conflicts with the user's retired-Notion decision when copied blindly | `MUST_FIX`: explicit project override in this owner and front doors | corrected |
| 2 | external research might be decorative rather than decision-relevant | engine/UI and test-framework claims needed primary sources and actual vendor evidence | `MUST_FIX`: source/limit record plus local project evidence requirement | corrected |
| 3 | W6 could be declared feasible from docs alone | existing seams prove only partial technical readiness, not changed-head runtime or player readability | `MUST_FIX`: `PARTIAL` ceiling and fresh W6 execution/human gate | corrected |
| 4 | a five-loop policy could be bypassed by document-only or PR wording | material work/PR threshold was not an explicit project invariant | `MUST_FIX`: five-loop minimum, finding classes, post-merge loop, regression test | corrected |
| 5 | the gate could create fake external certainty or scope creep | no research source can substitute for current player evidence or authorize production assets | `SHOULD_FIX`: `NOT_MATERIAL` outcome, evidence ceilings, and W6 scope boundary | corrected |

No user-facing product rule changed in this work unit. The unresolved W6 L2 user review remains `USER_DECISION_REQUIRED`; Human/Device/Performance/Full Slice evidence remains `NOT_RUN`.

## 6. Current external sources

| source | checked | project use | limit |
| --- | --- | --- | --- |
| https://docs.godotengine.org/en/stable/tutorials/ui/index.html | 2026-08-28 | `Control`/Container-based layout is a supported fit for W6 information panels | does not prove this scene is readable at target resolution |
| https://docs.godotengine.org/en/stable/classes/class_control.html | 2026-08-28 | anchors, containers, focus, and GUI input are available for target/forecast controls | does not prove touch ergonomics or accessibility PASS |
| https://github.com/bitwes/Gut | 2026-08-28 | Godot 4.7 branch guidance matches the project's pinned GUT 9.7.1 lineage | does not replace fresh changed-head GUT execution |
