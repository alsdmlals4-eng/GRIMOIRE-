# Frostbloom W6 Decision Loop Vertical Slice — Feature Design Spec

> 사용자에게 승인된 W6 범위를 플레이어 경험 계약으로 정리한 L2 설계 정본이다. 사용자는 2026-08-29에 Issue #242의 Godot 구현을 명시 승인했다. 이 문서는 runtime image 사용·production asset batch를 승인하지 않으며, Human/Device/Performance/Export/Full Slice PASS도 주장하지 않는다.

## 0. Identity & authority

```yaml
feature_id: FTR-FROSTBLOOM-W6-DECISION-LOOP-01
feature_name: Frostbloom W6 보존 의사결정 루프
work_level: L2
status: USER_APPROVED_L2__L3_IMPLEMENTATION_CONTRACT_READY
scope_decision: USER_APPROVED_OPTION_A
scope_decision_source: 2026-08-28 user message "권장안대로 진행"
issue: 236
successor_l3_issue: 242
user_spec_approval_source: 2026-08-28 user message "진행해" after the explicit L2 review gate
owner: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
source_main_commit: 7019174adeece3d1f8bcd7e8e249856389b1aa5d
created_at_kst: 2026-08-28
related_decision_ids:
  - GM-SPELL-WORKFLOW-UI-V2-01
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
  - GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01
  - GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
  - GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01
  - GM-FROSTBLOOM-W6-KEY-DECISION-VISUAL-01
related_visual_reference: PROJECT_CORE_SCENE_KEY_DECISION_FROSTBLOOM_W6_02
adversarial_review: FIVE_PASS_STRUCTURAL_PASS__L3_PLAN_REVIEWED
implementation_authority: USER_APPROVED_2026-08-29__IMPLEMENTED_AUTOMATED_RUNTIME_SMOKE_PASS__PR_PENDING
implementation_receipt: docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md
```

| 이 Spec의 책임 | 다른 정본의 책임 |
| --- | --- |
| W6에서 플레이어가 무엇을 보고, 고르고, 시전하고, 어떻게 복기하는가 | FIVE_POINT_STAR 계산·typed stock·atomic transaction: `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`과 runtime source |
| 두 보존 target의 동등한 가치·forecast·receipt 의미 | W6의 전체 23~30분 story/W7 연결: `GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01` |
| 첫 implementation contract에 필요한 data/UI/test 경계 | 구현 파일, Task/PR 상태, 실제 test/runtime evidence: 후속 L3 traceability |

현재 Product Root의 `WARD`/`FLOWER`와 difficulty/Mana 차이, 짧은 receipt는 **Frostbloom 정본이 아닌 generic technical prototype**이다. 이 Spec은 그 값을 W6로 승격하지 않는다.

## 1. Player problem & experience intent

```yaml
player_problem: >-
  현재 Product Root는 글자 작성→회로→대상→시전 transaction은 보이지만,
  두 대상이 무엇을 지키고 무엇을 남기는지와 결과의 인과를 읽을 수 없다.
undesired_outcome: 선택이 장식 또는 더 싸고 쉬운 답을 고르는 최적화처럼 읽힌다.
desired_change: >-
  플레이어가 지금 먼저 지킬 가치를 이유와 함께 고르고, 시전 전 확인된 효과와
  미확인을 구분하며, 시전 후 실제 개선과 남은 위험을 자기 선택으로 설명한다.
evidence: W6 preflight, approved preservation priority, current Product Root target payload
evidence_ceiling: DESIGN_EVIDENCE_AND_AUTOMATED_FOUNDATION_ONLY
```

```text
온실의 두 귀중한 것을 본다
→ 직접 쓴 글자로 주문을 완성한다
→ 지금 우선 보존할 대상을 고른다
→ 확인된 개선 / 남는 위험 / 미확인을 읽는다
→ 명시 시전한다
→ 실제로 지킨 것과 남은 것을 기록에서 확인한다
→ 다음 문맥에서 무엇을 더 알아야 할지 궁금해한다
```

| 항목 | 계약 |
| --- | --- |
| 대표 행동 | 글자를 쓰고 FIVE_POINT_STAR로 주문을 완성한 뒤, 묘목 또는 구조를 직접 선택해 시전한다. |
| 의미 있는 판단 | 둘 중 “더 좋은 것”이 아니라 지금 “먼저 지킬 것”을 우선한다. |
| 즉시 피드백 | target을 바꾸면 forecast가 바뀌며, 시전 수용/오류/rollback이 분리되어 보인다. |
| 목표 감정 | 온화한 긴장, 책임 있는 돌봄, 주문의 저자성, 결과를 이해하는 성장감. |
| 다음 동기 | 남은 위험과 미확인이 W7/후속 조사의 다음 질문으로 남는다. |

### Core alignment

| 연결 대상 | 원본 | W6의 기여 | 위반 위험 |
| --- | --- | --- | --- |
| Player Promise | `GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01` | 위력 최적화가 아닌 보존 우선순위를 내가 정한다. | 한 target에 hidden reward/relationship/success 우열 부여 |
| Player-facing loop | `GM-SPELL-WORKFLOW-UI-V2-01` | `글자 → 주문 → 대상 → 시전`을 결과 인과까지 연결한다. | internal stage/raw English가 player copy를 대체 |
| System core | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` | 직접 작성·FIVE_POINT_STAR·명시 target/commit을 소비한다. | 새 target/use/Mana/result transaction 생성 |
| Result promise | `GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01` | actual / forgone / unknown receipt를 처음 경험한다. | score·별점·도덕 판정으로 압축 |
| Visual anchor | W6 core-scene visual brief | 따뜻한 academy와 동등한 stakes를 보조한다. | planning image를 runtime asset/rights proof로 승격 |

### Planned evidence & first-session contract

```yaml
planned_evidence_layers:
  TECH_EVIDENCE: target payload parity, forecast projection, exactly-once use, rollback, receipt fields
  UI_EVIDENCE: Korean player terms, equal target hierarchy, visible known/forgone/unknown sections
  HUMAN_USABILITY_EVIDENCE: two target values and remaining risks can be restated without help
  PLAYER_EXPERIENCE_EVIDENCE: neither target is read as a hidden correct answer
first_session_contract:
  representative_problem: frost-damaged rare seedlings and a strained greenhouse support share one incident
  representative_action: make one spell and select one preservation target
  first_meaningful_choice: rare seedlings first versus greenhouse structure first
  first_observable_result: actual improvement plus clearly named remaining risk
  next_question_created: what remains unobserved and should be investigated or revised next
time_window: W6_TARGET_7_MINUTES_TEST_VALUE
evidence_ceiling: HUMAN_DEVICE_PERFORMANCE_FULL_SLICE_NOT_RUN
```

## 2. Scope / non-goals

### In scope

- 현재 W6 observation handoff `Known 2 / Unknown 2 / Lens 1`을 persistent summary로 보여 주는 한 상황.
- 현재 `글자 → 주문 → 대상 → 시전` foundation을 지나, 두 W6 target·forecast·receipt에 의미를 부여하는 한 decision loop.
- **희귀 묘목 우선**과 **온실 구조 우선**의 동등한 target card, bounded forecast, explicit cast, causal receipt.
- `SpellWorkflowCoordinator`, `AtomicSpellUseService`, `AtomicResultLedger`, cancellation/rollback을 재사용하는 thin consumer.
- 후속 automated parity/receipt tests, target-resolution Godot inspection, human comprehension observation에 필요한 contract.

### Out of scope

- 46분 Frostbloom 전체 세션, W7, full Result/Grimoire, 경제·관계·보상·저장 시스템 확장.
- 새 glyph repertoire, 주문 이름 문법, named-intent route, two-draft optimizer, best route/recommendation.
- 새 target/use/Mana/result engine, auto target/cast, pre-commit 소비, duplicate consume.
- runtime asset binding, production image/audio/VFX batch, character identity/voice/rights clearance.
- Human, device, performance, export, full vertical-slice PASS.

### Minimum viable behavior

플레이어는 전달받은 두 확인 사실·두 미확인 범주·하나의 Lens를 보면서, 기존 glyph/circuit foundation으로 한 완성 주문을 만든다. 그 뒤 동등한 두 보존 target 사이를 전환하며 **확인된 개선 / 남는 위험 / 미확인 / 최종 성공 근거 / Mana**를 읽고, 확인 뒤 정확히 한 번 시전한다. receipt는 “실제로 개선된 것 / 선택으로 남은 것 / 아직 모르는 것”을 분리한다. 이 흐름은 full W6 story가 아니라 차별적 판단을 검증하는 최소 단위다.

## 3. Player verbs & decisions

| id | 플레이어 동사 | 입력 | 판단 | 비용·위험 | 피드백 |
| --- | --- | --- | --- | --- | --- |
| W6-V01 | 관찰한다 | summary pin 확인 | 확인/미확인을 구분 | 숨김 정보를 정답처럼 추정하지 않음 | `확인 2 / 미확인 2 / Lens 1` |
| W6-V02 | 쓴다 | 직접 glyph 입력 | 어떤 글자를 쓸지 | 유효하지 않으면 주문 불가 | 획 수용/오류, live label |
| W6-V03 | 조합한다 | Main 1 + optional Auxiliary | 어떤 완성 주문을 만들지 | Preview 전 target/cast 불가 | 완성 주문 이름, base preview |
| W6-V04 | 우선한다 | 묘목/구조 target 선택 | 무엇을 먼저 보존할지 | 반대 가치의 위험이 남음 | target forecast |
| W6-V05 | 시전한다 | confirmation 후 시전 | 지금 확정할지 | Mana는 수용 시 한 번만 소비 | accepted/invalid/rollback |
| W6-V06 | 복기한다 | receipt 확인 | actual과 남은 것을 구분 | global grade 없음 | actual/forgone/unknown sections |

## 4. Entry / exit / cancel / re-entry

| 구분 | 조건 | 시스템 처리 | 피드백 | 다음 상태 |
| --- | --- | --- | --- | --- |
| Entry | valid W6 observation context | summary pin + current glyph flow 시작 | 현재 상황과 첫 행동 | `W6_SPELL_DRAFT` |
| Spell edit | valid context | current preparation authority가 reservation 처리 | preview 갱신/오류 | `W6_SPELL_DRAFT` |
| Target preview | selected completed spell | target payload로 final preview 갱신, 소비 없음 | forecast | `W6_TARGET_FORECAST` |
| Confirmation | valid forecast | confirmation만 요청, 소비 없음 | “이 주문을 [대상]에 시전” | `W6_CAST_CONFIRM` |
| Cancel | accepted cast 전 | existing cancellation/rollback | “아직 시전하지 않았습니다” | draft/forecast |
| Exit | accepted receipt 확인 후 | W7 handoff anchor 준비 | actual/remaining/unknown | `W6_EXIT_READY` |
| Re-entry | interruption before cast | existing recovery 경계에 따름; 새 result 발명 금지 | 복구 또는 안전한 재시작 | draft/forecast |

**Persistence boundary:** 이 첫 contract는 W6 first accepted result의 session-level causal truth를 보존한다. save/load와 cross-session Grimoire persistence는 `NOT_IMPLEMENTED_BY_THIS_SPEC`다.

## 5. Player flow, state & rules

```text
W6 observation handoff
→ summary pin
→ direct glyph writing + FIVE_POINT_STAR composition
→ completed spell base preview
→ seedlings first OR structure first
→ bounded final forecast
→ explicit confirmation
→ exactly-once cast transaction
→ actual / forgone / unknown receipt
→ W7-ready result anchor
```

| state_id | 의미 | 진입 | 종료 | persistence |
| --- | --- | --- | --- | --- |
| `W6_CONTEXT_PINNED` | observation handoff가 보임 | valid context | glyph writing | session |
| `W6_SPELL_DRAFT` | 글자/회로 편집 | context | completed spell | existing preparation authority |
| `W6_TARGET_FORECAST` | target/final preview 읽기 | selected spell | confirmation/edit/cancel | session |
| `W6_CAST_CONFIRM` | 명시 시전 확인 | valid forecast | confirm/back | session |
| `W6_RESOLVING` | transaction 진행 | confirmed cast | used/rollback | runtime transaction |
| `W6_RECEIPT` | causal result 읽기 | accepted transaction | next | session causal anchor |
| `W6_EXIT_READY` | W7/후속 연결 | receipt acknowledged | handoff | session causal anchor |

| rule_id | 규칙 | 결과 | priority |
| --- | --- | --- | --- |
| W6-R01 | W6 target은 정확히 2개며 label, protected value, known improvement, forgone risk, unknown, valid payload를 모두 가진다. | 누락 시 fail closed; generic fallback 금지 | highest |
| W6-R02 | 첫 slice에서 두 target의 numeric cost/difficulty는 같은 기준이다. | 차이가 필요하면 visible symmetric trade-off + 별도 승인 필요 | high |
| W6-R03 | `Unknown`은 category-level uncertainty다. | success/Mana hidden modifier·사후 벌점 금지 | high |
| W6-R04 | target 변경은 preview만 바꾼다. | reserve/consume/result mutation 없음 | high |
| W6-R05 | `EXPLICIT_EXACTLY_ONCE`를 유지한다. | confirmation 후 accepted cast에서만 Mana/spell/result가 함께 변화 | highest |
| W6-R06 | receipt는 actual, forgone_or_remaining, unknown을 나눈다. | global score/star/moral judgement 금지 | high |
| W6-R07 | first accepted W6 actual은 이후 W7에서도 true다. | reveal은 context delta만 추가 | high |
| W6-R08 | player-facing copy는 `글자 / 주문 / 완성 주문 이름 / 대상 / 시전`을 우선한다. | internal status/raw English가 기본 copy를 대체하지 않음 | medium |
| W6-R09 | visual cue는 text를 보조한다. | 색·이미지 text만으로 의미 전달 금지 | medium |

## 6. Input → processing → output

| id | Input | validation | processing | Output | side effect | failure |
| --- | --- | --- | --- | --- | --- | --- |
| W6-IO01 | observation context | known=2, unknown=2, lens=1 | summary pin model | context summary | none | entry block |
| W6-IO02 | glyph/circuit | existing validation | current coordinator preparation | completed spell/base preview | existing reservation | edit error |
| W6-IO03 | target id | one of two W6 ids | `prepare_target_preview` consumer | final forecast | none | invalid target |
| W6-IO04 | confirmation | target/preview/Mana valid | AtomicSpellUse transaction | result payload + receipt | exactly-once mutation | atomic rollback |
| W6-IO05 | receipt acknowledgement | result exists | W7 anchor projection | next handoff | session anchor | no fabricated follow-up |

```yaml
W6DecisionContext:
  id: W6_FROSTBLOOM_PRESERVATION
  observations:
    known_fact_ids: exactly_2
    unknown_categories: exactly_2
    lens_id: exactly_1
  spell_scenario:
    uses_existing_direct_glyph_and_five_point_star_foundation: true
    new_glyph_repertoire_required: false
  targets: exactly_2

W6TargetDefinition:
  id: FROST_SEEDLINGS | GREENHOUSE_STRUCTURE
  player_label: Korean live UI string
  protected_value: Korean live UI string
  known_improvement: Korean live UI string
  forgone_or_remaining_risk: Korean live UI string
  uncertain_consequence: Korean live UI string
  target_keyword: existing transaction-compatible keyword
  runtime_target_payload: valid structured payload
  result_receipt:
    actual: Korean live UI string
    forgone_or_remaining: Korean live UI string
    unknown: Korean live UI string
```

### L3 data owner default

```yaml
content_resource: res://data/frostbloom/w6/w6_decision_context_01.tres
content_scripts:
  - res://src/core/content/frostbloom_w6_decision_context.gd
  - res://src/core/content/frostbloom_w6_target_definition.gd
runtime_binding: SpellWorkflowProductRoot.w6_context
authoring: GODOT_HIGODOT_ONLY_FOR_PERSISTENT_RESOURCE_AND_SCENE_CHANGES
owner_rule: Resource → Product Root adapter → existing selector/forecast/receipt; no duplicated target dictionaries
initial_target_difficulty: 3
initial_target_mana_cost: 3
numeric_status: PLAYTEST_TUNING_REQUIRED
```

The L3 contract selects a typed Godot `Resource`, not direct `FileAccess` JSON loading: Godot’s export documentation requires explicit inclusion handling for non-resource file reads, while the W6 context needs one scene-bound data owner. This does not create a new transaction engine or approve actual authoring before a separate user authorization.

## 7. Feedback, outcomes & edge cases

| event | required player feedback | optional presentation | fallback |
| --- | --- | --- | --- |
| summary pin | `확인 2 / 미확인 2 / Lens 1` | no new production cue | readable text + icon |
| glyph/circuit accepted | direct-written glyph, completed spell label, base preview | existing feedback only | text status |
| target changed | equal cards and refreshed known/remaining/unknown/Mana | selection highlight | text + outline |
| confirmation | explicit target/cost summary before cast | no new cue | confirmation copy |
| cast accepted/error | distinct accepted/invalid/rollback states | existing transaction feedback | text/retry state |
| receipt | three separate sections | no score fanfare | section headings + copy |

| outcome | player sees | data result | recovery |
| --- | --- | --- | --- |
| accepted/partial resolution | actual improvement plus remaining risk | one accepted transaction | first result remains true |
| invalid before cast | reason and edit affordance | Mana/result unchanged | current surface edit |
| insufficient Mana | cost shortage + edit/cancel | no pre-consume | current forecast retained |
| transaction error | failure without invented receipt | snapshots restored | retry after valid state |
| duplicate press | original accepted receipt | no second consumption | duplicate blocked |

| edge_id | situation | expected rule | verification |
| --- | --- | --- | --- |
| W6-E01 | target field missing | fail closed; no WARD/FLOWER fallback | malformed-data test |
| W6-E02 | repeated target switching | preview only changes | integration test |
| W6-E03 | cancel before commit | no Mana/result consumption | integration test |
| W6-E04 | confirmation spam | only one transaction | unit + integration test |
| W6-E05 | insufficient Mana | cast blocked, selection retained | service test |
| W6-E06 | payload error | atomic rollback, no receipt | regression test |
| W6-E07 | raw English/internal text | player-copy regression | scene/UI assertion |
| W6-E08 | unknown hidden penalty | preview/result parity | data + preview test |

## 8. Data, UX, art & platform constraints

```yaml
runtime_authority: Existing SpellWorkflowCoordinator + AtomicSpellUseService + AtomicResultLedger
w6_content_authority: one typed Godot Resource assigned to Product Root at res://data/frostbloom/w6/w6_decision_context_01.tres
persistent_authority: NOT_IMPLEMENTED_BY_THIS_SPEC
authoring_source: repository structured data/text, never baked image text
numeric_status: PLAYTEST_TUNING_REQUIRED
```

| data_id | meaning | recommended default | rule / retune trigger |
| --- | --- | --- | --- |
| W6-B01 | target count | `2` | exactly two until player reasoning is verified |
| W6-B02 | observation summary | `Known 2 / Unknown 2 / Lens 1` | no named route/answer |
| W6-B03 | target Mana/difficulty | `MATCHED_FIRST_TEST_VALUE` | hidden asymmetry forbidden |
| W6-B04 | loop duration | `7 minutes TEST_VALUE` | not a full 46-minute claim |
| W6-B05 | receipt layers | actual + forgone/remaining + unknown | no global grade |

### UX and accessibility

- **Primary surface:** Mobile landscape; W6 summary pin + spell flow + target forecast + receipt.
- **Primary action:** target을 고르고 읽을 수 있는 한 문장 confirmation으로 `시전`한다.
- **Secondary action:** target 전환, 회로 편집, 취소. 어느 action도 Mana를 소비하지 않는다.
- **Live copy:** `글자`, `주문`, `완성 주문 이름`, `대상`, `시전`, `확인된 개선`, `남는 위험`, `아직 미확인`.
- **Accessibility:** known/remaining/unknown은 heading+body로 전달하고 색/아이콘만으로 구분하지 않는다. target-resolution font, focus, motion, touch readability는 `NOT_RUN`이다.

### Visual/audio boundary

`PROJECT_CORE_SCENE_KEY_DECISION_FROSTBLOOM_W6_02` is `USER_APPROVED_PLANNING_REFERENCE_ONLY`. 이 Spec은 warm academy tone, equal stakes, live-text reserve만 소비한다. binary를 repository/runtime에 복사하거나 asset/character canon/rights evidence로 승격하지 않는다. 새 audio/VFX/animation asset은 이 feature의 runtime dependency가 아니다.

### Existing seams to reuse

```text
res://src/ui/spell_workflow/spell_workflow_product_root.tscn
res://src/ui/spell_workflow/spell_workflow_product_root.gd
res://src/ui/components/context_target_selector.gd
res://src/ui/components/commit_bar.gd
res://src/core/workflow/spell_workflow_coordinator.gd
res://src/core/spells/atomic_spell_use_service.gd
res://src/core/atomic_result_ledger.gd
res://tests/integration/test_spell_workflow_product_root.gd
res://tests/unit/test_spell_workflow_coordinator.gd
res://tests/unit/test_atomic_spell_use_service.gd
res://tests/unit/test_atomic_result_ledger.gd
```

These are existing seams only. Exact new data/Scene/test paths belong to the next approved implementation contract.

## 9. Benchmark decision, risk & validation plan

No new external benchmark is needed to choose this scope: the approved W6 forecast and Result/Grimoire decisions already contain the relevant research. The feature adopts the pattern without copying a game's identity, content, or UI.

| evidence | observation | disposition | application |
| --- | --- | --- | --- |
| W6 forecast decision + research receipt | uncertainty helps judgment only when it is not a hidden penalty | ADOPT | known/unknown boundary, explicit forecast |
| Result/Grimoire research receipt | a record can organize observed causality without solving it | ADAPT | actual/forgone/unknown receipt, no grade |
| current Product Root | unequal generic targets imply a cheaper/easier answer | REJECT | no `WARD`/`FLOWER` reskin or 4/3 vs 2/2 asymmetry |

```yaml
highest_risk_hypothesis:
  id: W6-H01
  claim: players read the two targets as values to prioritize, not combat targets or a hidden correct answer.
  cheapest_test: target-resolution human mobile observation with pre-cast and post-receipt restatement.
  success_signal: player states chosen value, remaining risk, and actual result without help.
  stop_signal: player repeatedly calls one target safer/correct or treats unknown as a penalty.
  result: RETEST
```

| risk | impact | mitigation | status |
| --- | --- | --- | --- |
| target parity is only cosmetic | high | matched initial values + equal hierarchy + data/UI test | OPEN |
| forecast is an information wall | high | one question per section; human think-aloud | NOT_RUN |
| unknown becomes hidden penalty | high | preview/result parity and no modifier rule | OPEN |
| result reads as moral score | medium | three receipt layers, no grade | OPEN |
| planning image is mistaken for runtime evidence | medium | planning-only label, no copy | CONTROLLED |
| full-session content creeps into this contract | high | single-scenario cut line | OPEN |

## 10. Acceptance criteria & observation

| id | Given / When | Then | failure evidence |
| --- | --- | --- | --- |
| W6-AC01 | valid W6 context → entry | `Known 2 / Unknown 2 / Lens 1` appears as live text and leads directly to spell flow without repeated lore modal. | missing/mismatched context |
| W6-AC02 | completed spell → switch targets | equal card hierarchy shows each protected value and different remaining risk. | recommendation or asymmetric information |
| W6-AC03 | target selected → read forecast | known improvement, remaining/forgone risk, unknown, observed-info rationale, Mana are visible; unknown is no hidden modifier. | missing field/hidden modifier |
| W6-AC04 | valid forecast → confirm cast | no auto target/cast; one accepted transaction only; no pre-commit or duplicate mutation. | duplicate consumption/receipt |
| W6-AC05 | accepted result → read receipt | actual, forgone/remaining, unknown are separate live sections; no score/grade. | generic one-line receipt/grade |
| W6-AC06 | invalid/Mana insufficient/error → cast/edit | reason is visible and atomic rollback/unchanged state is preserved. | fabricated result/lost state |
| W6-AC07 | Korean player surface → full loop | raw `TARGET`, `MANA`, `COMMIT`, Stage/PreparedSpell status does not replace player copy. | copy regression |
| W6-AC08 | target landscape build → inspect | approved visual **grammar** and editable UI read together; the planning-board binary is not used as runtime art, and state does not depend on image text or color alone. | collision/readability failure |

| question | observation | success signal | rethink signal | status |
| --- | --- | --- | --- | --- |
| W6-O01 | pre-cast restatement | names both protected values and remaining risks | calls one route objectively correct | NOT_RUN |
| W6-O02 | selection rationale | treats unknown as unknown | treats it as secret penalty | NOT_RUN |
| W6-O03 | post-receipt restatement | connects actual and remaining state to decision | calls outcome random/score | NOT_RUN |
| W6-O04 | time/hesitation | progresses near 7-minute test value | stops repeatedly at summary/forecast | NOT_RUN |
| W6-O05 | target-resolution read | discovers card→forecast→confirmation sequence | small text/overlap obscures information | NOT_RUN |

## 11. Cut-down, open decisions & handoff

| cut order | remove first | core preserved | never cut |
| --- | --- | --- | --- |
| 1 | optional motion/ornament | target choice → forecast → explicit cast → causal receipt | — |
| 2 | circuit variation breadth, not direct-writing route | one valid composed spell reaches W6 choice | — |
| 3 | receipt detail density, not three-layer distinction | actual / remaining / unknown | — |
| prohibited | — | — | one target, auto target/cast, generic reskin only |

Rollback returns to the current Product Root generic technical vertical slice without changing transaction authority. No save migration is introduced by this planning work.

| decision | status | recommended default | blocking |
| --- | --- | --- | --- |
| W6-OD01: scope A | CONFIRMED | user selected W6 decision-loop slice | no |
| W6-OD02: detailed spec approval | USER_APPROVED | 2026-08-28 user message `진행해` after review gate | no |
| W6-OD03: exact first composition scenario | APPROVED_DEFAULT_FOR_L3 | existing minimal glyph/circuit foundation; no new repertoire/naming grammar | no |
| W6-OD04: exact W6 data path/schema validation | APPROVED_DEFAULT_FOR_L3 | one typed Godot Resource at `res://data/frostbloom/w6/w6_decision_context_01.tres`; no duplication | no |
| W6-OD05: exact Mana/difficulty values | APPROVED_RECOMMENDED_DEFAULT | matched `difficulty: 3`, `mana_cost: 3` until human tuning | no |
| W6-OD06: runtime art/audio/VFX consumer | NOT_APPLICABLE_TO_L3_CONTRACT | none in this slice contract | no |

The L3 packet and plan are now `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md` and `docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md`. They remain one W6 contract and do not absorb Task8 recovery, the 46-minute session, or a production asset batch. The user granted implementation authorization on 2026-08-29; current changed-worktree evidence is recorded in `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md` and still awaits PR exact-head checks.

## Final adversarial checklist

- [x] Generic Product Root data is not mistaken for W6 canon.
- [x] The promise is action → priority → forecast → receipt, not a feature list.
- [x] The two targets are meaningful alternatives, not color variants or a cheaper hidden answer.
- [x] Unknown is neither invented nor a hidden numeric penalty.
- [x] No auto target/cast, global grade, moral score, best route, or named-intent route is added.
- [x] Existing coordinator, atomic use, and ledger remain the only transaction authority.
- [x] Planning visual stays planning-only; no asset/right/evidence promotion is implied.
- [x] Human/device/performance/full-slice claims remain `NOT_RUN`.
- [x] User review approved the L2 Spec before the L3 plan was written.
- [x] User authorized the L3 Godot implementation contract on 2026-08-29; PR exact-head, Human, device, performance, export, and full-slice gates remain separate.

## Five-pass adversarial review

| pass | full-scope attack | finding | correction / guard | result |
| --- | --- | --- | --- | --- |
| 1 | 이 문서가 generic Product Root를 배경만 바꾼 reskin으로 축소하는가 | `WARD`/`FLOWER`의 unequal payload가 W6로 유입될 위험 | `W6-R01/R02`, W6-owned structured target requirement, `W6-AC02`로 generic fallback을 차단 | PASS |
| 2 | 두 카드가 실제로 하나의 hidden answer를 만들거나 target 변경이 비용을 소비하는가 | target hierarchy와 transaction boundary가 서로 다른 layer에 있어 drift 가능 | equal information/value rule, target-switch no-mutation rule, explicit exactly-once regression requirement | PASS |
| 3 | `Unknown`이 숨은 Mana/success penalty 또는 receipt의 사후 훈계가 되는가 | forecast의 수치와 narrative boundary가 혼동될 위험 | `W6-R03`, preview/result parity test, global grade/moral score ban | PASS |
| 4 | planning visual을 runtime art·character canon·rights/runtime evidence로 오해하는가 | target-resolution acceptance wording이 binary 사용으로 읽힐 여지 | `W6-AC08`을 visual **grammar**로 한정하고 planning-board binary non-use를 명시 | PASS |
| 5 | scope가 full 46-minute session/Task8 recovery/asset batch로 퍼지거나 Notion workflow가 재유입하는가 | 과거 문서와 attached master-GDD instruction이 범위를 넓힐 수 있음 | one-scenario cut line, L3 plan before code, repository-only retirement owner, attachment reference-only classification | PASS |

## L3 incident / solution / lesson

```yaml
incident: Product Root duplicates generic target dictionaries, and a direct JSON/FileAccess proposal would require export inclusion handling that the W6 slice does not otherwise need.
solution: Bind one typed W6 Resource to Product Root and derive target cards, forecast copy, and receipt payload from it while preserving the existing transaction authorities.
lesson: Runtime scenario meaning should have one export-safe structured owner; scene-local duplicate dictionaries make player-facing content drift likely.
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: The general Godot Resource/FileAccess trade-off is already covered by official engine guidance and has only one GRIMOIRE consumer here.
```

이 5회 검토는 설계 구조의 `PASS`다. 사람의 이해·재미·기기 가독성·성능 evidence는 계속 `NOT_RUN`이며, L3 문서는 code/runtime pass를 대체하지 않는다.
