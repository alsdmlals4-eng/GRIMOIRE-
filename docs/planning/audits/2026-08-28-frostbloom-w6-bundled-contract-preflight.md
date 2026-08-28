# Frostbloom W6 단일 구현계약 사전검토 — 2026-08-28

```yaml
status: HISTORICAL_PREFLIGHT__IMPLEMENTATION_RECHECK_RECORDED_2026-08-29
work_mode: PLAN_AND_REVIEW__THEN_IMPLEMENTATION_RECHECK
implementation_authority: USER_APPROVED_2026-08-29__ISSUE_242_IMPLEMENTED_PR_PENDING
github_issue: 242
project_main: 34e5d496139e774608993730fa7c9f4e80b8bd02
base_main: 7cfc75d607d1ed4d0f8323d4389e64da93df00c8
open_prs_read_only:
  - 187: codex/task8-spell-use-reconcile-20260827
  - 166: codex/grimoire-front-door-20260824
selected_visual_reference: PROJECT_CORE_SCENE_KEY_DECISION_FROSTBLOOM_W6_02
selected_visual_status: USER_APPROVED_PLANNING_REFERENCE_ONLY
```

## 2026-08-29 implementation recheck

The preflight findings were implemented only for Issue #242's W6 decision loop. The current evidence owner is `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`: custom Godot runner `48 suites / 2,051 assertions / 0 failures`, GUT `8 tests / 29 assertions / 0 failures`, editor readback, and a 1280×720 runtime smoke. This does not convert the planning image into an asset and does not prove Human comprehension, device touch/readability, performance, accessibility, export, or full-slice quality.

| Recheck attack | Observed implementation fact | Disposition |
| --- | --- | --- |
| Scenario data drifts from the live target/receipt copy. | One editor-owned W6 `Resource` holds both targets; `known_improvement` is derived from the same `actual` field used by the receipt. | `CORRECTED` |
| W6 semantics are dropped while adapting the target UI. | The first pass stripped semantic fields and kept English fallback copy; the chosen W6 target now retains protected value, actual/known improvement, remaining risk, and unknown through the consumer boundary. | `CORRECTED_AUTOMATED_PASS` |
| A scenario-specific validation breaks the reusable generic selector. | The initial strict selector guard regressed the existing generic component contract. The selector remains generic; W6 strictness is enforced in the W6 consumer. | `CORRECTED_AUTOMATED_PASS` |
| A launch is mistaken for usability evidence. | Runtime smoke had no task-related errors at 1280×720, but no target-resolution visual assessment, device capture, or Human observation was run. | `EVIDENCE_CEILING_PRESERVED` |
| Tool syntax is assumed instead of verified. | The old GUT invocation failed; the supported `-s addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json -gexit` form passed. | `CORRECTED` |
| A local run cannot resolve a tracked texture. | The source `.webp` was still tracked on `HEAD` and `origin/main`; only Godot's local generated import cache was absent. Reimport restored the runtime prerequisite without changing the source asset. | `RECOVERED__SOURCE_PROVENANCE_PRESERVED` |
| Two arbitrary target IDs could satisfy the first typed-Resource validator. | The validator now requires the exact W6 pair and a malformed-ID regression exercises the rejection path. | `CORRECTED_AUTOMATED_PASS` |

The next current gate is PR exact-head checks, safe merge, and post-merge main readback. Human/device/performance/accessibility/export/full-slice remain independent gates.

## 목적과 경계

이 문서는 한 번의 미래 구현계약을 위한 **사전검토**다. 새 Scene, GDScript, Resource, runtime asset, production image, audio, 또는 Godot binding을 승인하거나 구현하지 않는다.

고정된 계획 입력은 다음과 같다.

- `GM-SPELL-WORKFLOW-UI-V2-01`: **글자 → 주문 → 대상 → 시전**.
- `GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01`: **희귀 묘목 우선**과 **온실 구조 우선**은 동등하게 유효한 보존 선택이다.
- `GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01`: Target 뒤 Known Improvement / Uncertain Consequence / final success rationale / Mana를 보고 명시 시전한다.
- `GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01`: 실제 결과, 비용·포기한 가치, 발견, 남은 불확실성을 섞지 않는다.
- `GM-FROSTBLOOM-W6-KEY-DECISION-VISUAL-01`: 선택된 W6 이미지는 warm academy tone의 **planning reference only**다.

## fresh-read 분류

| 항목 | 분류 | 현재 근거 | 계약상 처리 |
| --- | --- | --- | --- |
| Product Root의 글자 작성 → 회로 Preview → 명시 Target → 두 번의 시전 확인 → receipt | CURRENT | `spell_workflow_product_root.gd/.tscn`, integration tests | 재사용한다. 거래/rollback/정확히 한 번 시전 권위는 복제하지 않는다. |
| `WARD` / `FLOWER`와 난이도 4/2, Mana 3/2, 단문 receipt | CURRENT_PROTOTYPE | `target_choices()`와 Product Root integration test | Frostbloom target 사실이 아니다. W6에는 그대로 연결하지 않는다. |
| W6의 묘목/구조 동등 보존 선택, Known/Unknown, 혼합 결과 | CURRENT_PLAN | W6 승인 Decision들 | 구현 전 data·live UI·test contract로 옮긴다. |
| W6 젊은 성인 학습자/따뜻한 온실 key decision image | CURRENT_PLANNING_REFERENCE_ONLY | W6 visual brief의 SHA-256 receipt | 향후 화면의 tone/composition 기준으로만 사용한다. runtime asset·캐릭터 정본·권리 승인으로 승격하지 않는다. |
| 46분 Frostbloom 전체 흐름 | APPROVED_PLANNING_SCOPE | graybox walkthrough | 전체 구현 완료나 현재 첫 계약 범위로 추정하지 않는다. |
| Task8 보존 handoff 및 v4.5 machine snapshots | HISTORICAL | AGENTS.md의 compatibility locators | provenance만 유지한다. accepted frontier나 구현 지시로 사용하지 않는다. |
| Draft PR #187, #166 | CURRENT_EXTERNAL_READ_ONLY | 2026-08-28 GitHub readback | 병합/수정/흡수하지 않는다. |
| Human, player, mobile, performance, export, full-slice proof | UNKNOWN_UNVERIFIED | current evidence ceiling | 완료/통과로 주장하지 않는다. |

## 실제 Product Root와 W6의 정합성

### 재사용 가능한 사실

```text
accepted glyph input
→ Circuit preview
→ prepared spell
→ explicit target
→ final preview
→ explicit confirmation
→ exactly-once result receipt
```

현재 Coordinator는 target payload 전체를 exactly-once Result Ledger까지 전달할 수 있고, `AtomicSpellUseService`는 Mana/PreparedSpell/result rollback을 한 거래로 보존한다. 이 경계는 W6가 새로 만들면 안 되는 안정된 foundation이다.

### 구현 전에 고쳐야 하는 충돌

1. **선택의 의미가 다르다.** Product Root는 `흔들리는 보호막`/`시든 온실 꽃`의 generic target이며, W6는 `희귀 묘목`/`온실 구조`의 상호 포기 가치를 읽어야 한다.
2. **현재 수치가 순위를 암시한다.** generic target은 difficulty와 Mana가 4/3 대 2/2로 다르지만, UI는 차이의 보존 가치를 설명하지 않는다. 그대로 쓰면 낮은 비용/난도가 숨은 최적 답처럼 읽힐 수 있다.
3. **Forecast가 표현되지 않는다.** `SpellUseScreen`은 현재 status, target keyword, Mana와 commit만 렌더한다. Known Improvement, Uncertain Consequence, final-success rationale은 live UI에 없다.
4. **Receipt가 너무 얇다.** ResultPanel은 outcome 한 줄, 대상, Mana만 보여준다. W6의 실제 보존/남은 위험/미확인을 구분할 수 없다.
5. **플레이어 용어가 drift했다.** `COMPLETED SPELL`, `SELECT A TARGET`, `TARGET`, `MANA`, `COMMIT` 같은 raw English 및 internal status는 승인된 한국어 중심 `완성 주문 → 대상 → 시전` 계층과 다르다.

위 다섯 항목은 Product Root가 실패했다는 뜻이 아니다. **기초 slice의 validated transaction contract**와 **W6의 아직 미구현된 player-meaning contract**를 구분한 것이다.

## 플레이어 경험 검토

```text
Player Promise
→ 내가 직접 쓴 글자로 지금 지킬 대상을 정한다
→ 묘목 회복과 온실 안전 사이에서 남길 위험을 비교한다
→ 시전 전 확인된 개선 / 미확인을 구분해 읽는다
→ 명시 시전 뒤 실제로 지킨 것과 남은 위험을 receipt에서 본다
→ 결과를 다음 판단을 위한 Grimoire 지식으로 기억한다
```

| 질문 | 판정 | 근거와 영향 |
| --- | --- | --- |
| 핵심 재미가 기능 목록이 아니라 책임 있는 보존 판단으로 읽히는가? | PARTIAL | W6 계획은 그렇지만 runtime은 generic two-target demo다. |
| 플레이어가 무엇을 보고 판단하는가? | PARTIAL | W6에는 관찰 근거/known/unknown 계약이 있으나 runtime UI에는 없다. |
| 이득과 손해가 동시에 보이는가? | CONFLICT_IF_BOUND_NOW | W6 문서는 명시하지만 current target hint와 receipt는 대칭 trade-off를 보이지 않는다. |
| 결과가 선택과 인과로 연결되는가? | PARTIAL | exactly-once receipt는 있으나 W6의 actual / forgone / unknown 분리가 없다. |
| 실패가 다음 시도의 학습이 되는가? | UNKNOWN_UNVERIFIED | invalid input/commit failure는 닫히지만 human learning loop와 W6 record는 아직 검증되지 않았다. |
| 첫 세션의 판매 포인트가 보이는가? | PARTIAL | direct writing + casting은 보이지만 care decision + retained knowledge까지는 아직 보이지 않는다. |

## 구현계약에 들어갈 최소 화면·데이터·검증 경계

이 표는 아직 구현 지시가 아니라 scope 비교를 위한 최소 contract seam이다.

| 레이어 | 기존 재사용 | W6에 필요한 project adaptation | 금지 / 보류 |
| --- | --- | --- | --- |
| 흐름 | Product Root와 Coordinator의 순서/transaction | W6 decision brief → Frostbloom target choice → forecast → receipt/record로 정보 의미를 연결 | 자동 target/cast, best-route, 별도 route menu |
| Target data | target choice dictionary와 payload handoff | 양쪽 대상의 보존 가치, known improvement, forgone risk, unknown, result receipt를 structured data로 정의 | visual text에 state truth를 굽기, hidden penalty |
| UI | Academy theme, semantic panels, target selector, commit bar | live Korean labels, 동등한 정보량/위계, success rationale 및 Mana, confirmation copy | raw internal status 노출, 색상만으로 상태 전달 |
| 결과 | Atomic Result Ledger, exactly-once receipt | Actual / Forgone / Unknown을 분리해 render; follow-up Grimoire entry boundary 정의 | global grade, star rating, moral judgement, unobserved cause |
| 시각 | approved greenhouse base, theme, W6 planning reference | live UI safe area에서 새 데이터 계층을 검증 | W6 image를 runtime texture로 복사, 캐릭터/asset canon 승격 |
| audio/VFX | existing UI-state feedback | 시전/결과 cue는 나중에 consumer·provenance가 생길 때만 별도 설계 | 이번 contract에 새 batch를 묶거나 PASS 주장 |
| QA | current integration tests, GUT/custom runner, scene inspection path | target symmetry, forecast visibility, no pre-commit consumption, receipt causality, Korean live labels, restart/idempotency | human/device/performance 결과를 automated test로 대체 |

## Evidence-based SWOT update

| statement | class | evidence | confidence | player impact | production impact | disposition | next validation |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Direct writing and exactly-once explicit cast already give visible authorship rather than a one-click spell list. | STRENGTH | Product Root, Coordinator, integration tests | VERIFIED for mechanics; PARTIAL for appeal | high ownership potential | low reimplementation cost | PROTECT | observe whether players understand why confirmation exists |
| Current generic target payloads make one option cheaper/easier without explaining an equal-value trade-off. | WEAKNESS | `target_choices()` current main | VERIFIED | choice can read as cosmetic or optimal-play bait | contained data/UI/test adaptation | IMPROVE | player can state what each option protects and leaves behind |
| W6 can make care for a place—not damage optimisation—the memorable spell decision. | OPPORTUNITY | approved W6 decisions and visual reference | PARTIAL | differentiation through responsibility and explainability | requires disciplined content/data, not a larger combat system | TEST | compare target explanations in human mobile observation |
| The current result UI ends at a short receipt, before the learning/Grimoire promise is perceptible. | THREAT | Product Root result renderer; Result/Grimoire decision | VERIFIED | selling loop can feel incomplete | requires a bounded result-record seam | MITIGATE | player links their decision to actual/forgone/unknown without a helper |
| W6 visual reference sets tone well, but it has no runtime consumer or rights/device evidence. | WEAKNESS | W6 brief and asset coverage | VERIFIED | visual cohesion is not gameplay clarity | no asset work may be inferred | MONITOR | target-resolution UI composition and rights review before asset promotion |

## Reuse-first disposition

| Candidate | Disposition | Why |
| --- | --- | --- |
| Current Product Root / Coordinator / AtomicSpellUseService / result ledger | ADOPT | Existing project-owned transaction and rollback contract directly supports W6. |
| Academy theme and semantic UI family | ADAPT | Reuse visual grammar, but add W6 meaning/readability rather than preserving raw generic labels. |
| Base shared reference modules | VENDOR_VERIFIED_BASE_REFERENCE | Base contributes workflow, test, and semantic-UI discipline only; no Base runtime module is required now. |
| Full 46-minute Frostbloom sequence | DEFER_AS_SCOPE_DECISION | Approved planning has much larger content/validation implications than the current W6 target decision. |
| New production image/audio/VFX batch | REJECT_FOR_THIS_GATE | No approved runtime consumer contract or evidence need exists yet. |

No Base promotion candidate is created: the discovered mismatch is GRIMOIRE's W6 meaning/data boundary, while Base already owns reuse-first and evidence-bound implementation discipline.

## Adversarial findings

| Failure assumption | Result | Guard for the future contract |
| --- | --- | --- |
| AI read the game as a generic spell UI. | FINDING | contract must express preservation value → trade-off → receipt before listing Nodes. |
| Product Root placeholder values are silently canonised as W6 balance. | BLOCKED | target IDs, labels, costs, difficulty, forecast and receipt must become W6-owned structured data. |
| One target is an easier hidden answer. | BLOCKED | equal target card hierarchy and explicit value/forgone information; any numeric difference must be justified as a visible trade-off or removed. |
| Unknown is displayed as a hidden penalty. | BLOCKED | unknown stays category-level and cannot change visible Mana/success as an unobserved modifier. |
| Result becomes a moral grade or global score. | BLOCKED | actual, forgone, discovery, and uncertainty stay separate. |
| Planning image becomes an asset or proof. | BLOCKED | preserve W6 image status and require separate consumer/rights/UI-composite review. |
| Human evidence is inferred from automated tests. | BLOCKED | contract includes an explicit human/device validation checklist with NOT_RUN initial state. |

## Scope decision required before one bundled implementation contract

All three choices preserve the already approved W6 mechanics and visual reference. They differ only in how much of the first-session plan the single contract tries to implement.

| Option | Player value | Production cost / risk | Reversibility |
| --- | --- | --- | --- |
| **A. W6 decision-loop vertical slice** | Makes the distinctive preservation choice, bounded forecast, explicit cast, and causal receipt playable in one short greenhouse practicum. | Moderate. Reuses Product Root but needs W6 data/UI/result tests. Does not claim the 46-minute session. | High; later beats can wrap around the same W6 seams. |
| **B. Full 46-minute Frostbloom first session** | Shows the whole class → investigation → W6 → W7 → Grimoire promise at once. | Very high content, narrative, state, mobile QA, asset, and pacing risk; evidence would be spread thin. | Low; expensive to unwind if comprehension fails. |
| **C. Frostbloom reskin of Product Root only** | Quickly gives the existing demo Frostbloom names and background. | Low, but leaves the meaningful choice and learning loop unproven; risks decorative compliance. | High, but likely rework. |

**GPT recommendation: A.** It is the smallest slice that tests the differentiated fun while protecting the already verified transaction foundation. B is the destination planning map, not the next proof; C would make the selected image look connected without validating the player promise.

## Required next evidence after scope approval

1. Exact data/UI/Scene/test contract on a current-task branch, with no production-image batch.
2. Automated proof of target fairness and receipt causality, plus existing transaction regressions.
3. Godot runtime inspection at target landscape resolutions.
4. Human script: player explains each target's protected value, remaining risk, observed vs unknown information, and result causality.
5. Device/performance/export remain separately `NOT_RUN` unless actually performed.
