# GRIMOIRE — 최신 Base 적응 작업 계약

```yaml
decision_id: GM-BASE-CURRENT-ADAPTATION-20260901-01
status: USER_DIRECTED_L3_PROJECT_GOVERNANCE_UPDATE
approved_scope: "사용자 최신 지시: Base를 상세 fresh-read하고, Base를 따르되 GRIMOIRE에 맞게 작업순서·구조·계약을 갱신한다."
base_latest_completed_main: 19355b7ef065a21d0f2b685c7d9be64a4a3970f8
base_latest_completed_main_subject: "docs: record final active-surface verification (#823)"
adopted_base_release_lock: v9.4.3
adopted_base_release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
project_contract_owner: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
work_contract_receipt: docs/contracts/receipts/2026-09-01-base-current-adaptation-work-contract-receipt.json
current_product_decision: GM-CIRCLE-CLOCK-CARD-CORE-01
current_product_spec: docs/superpowers/specs/2026-08-31-circle-clock-card-core-replacement-design.md
current_product_gate: CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK
non_goal: "Base 자체 수정, 채택 pin 자동 교체, Card 세부 규칙 확정, Godot runtime 변경, legacy Star save migration"
```

## Direction Anchor

Base의 최신 검증·작업 수명주기 원칙을 GRIMOIRE의 실제 Circle/Clock/Card 정본과 Godot 구조에 맞게 적용한다. 기존 사용자 승인, repository-first 정본, legacy save 보존, 증거 상한을 유지하면서 다음 작업이 잘못된 역사 문서나 이전 PR을 현재 구현 지시로 오해하지 않게 한다.

## 작업 전 문제와 현재 사실

| 작업 전 상태 | 확인한 사실 | 이번 교정의 이유 | 기대 효과 |
| --- | --- | --- | --- |
| Base v9.4.3 채택 pin만 눈에 띄고 최신 Base main의 수명주기 개선이 프로젝트 entry에 없음 | Base `19355b7`은 L1+ receipt, benchmark/reuse, scoped legacy hygiene, exact-head PR gate, 5회 적대 검토와 post-merge readback을 강화했다 | pin을 자동 교체하지 않으면서 최신 Base에서 검증된 작업 방식을 흡수해야 한다 | fresh-read가 선언이 아닌 검사 가능한 시작 Gate가 된다 |
| Circle/Clock/Card가 현재 제품 코어인데 Star/Task8 설명 일부가 active 문장처럼 잔존 | 실제 main scene은 `story_front_door.tscn`; role-free Circle, declared-action Clock, card shell은 구현·자동 검증·editor 관찰을 마쳤다 | 역사 기록은 삭제 대상이 아니나 새로운 build route로 해석되면 안 된다 | 신규 작업은 story-led core를 기준으로 시작하고 legacy는 필요한 경우에만 읽는다 |
| 작업 구조가 문서마다 비슷하지만 다른 순서로 반복 | `AGENTS.md`, `START_HERE.md`, `ACTIVE_CONTEXT.md`, v4.8 binding, registry, test가 current entrypoint다 | 한 번의 current-entry order, one-source-per-fact, direct consumer 확인이 필요하다 | 계약·구현·테스트·증거의 중복 정본과 재작업이 줄어든다 |
| user-owned Star save는 실제 존재하지만 새 story에 consumer가 없음 | `grimoire_campaign_anchor.json`은 read-only 확인만 되었고 이동·변환·삭제는 수행하지 않았다 | 저장 호환성은 파일명이나 과거 runtime 삭제로 추측할 수 없다 | 현재 코어 교체와 legacy 보존을 함께 유지한다 |

이 문서는 계획·운영 정본이다. 문서가 Godot 런타임, human/device/accessibility/performance/export 또는 card balance의 PASS를 의미하지 않는다.

## Base를 따르는 방식: ADOPT / ADAPT / REJECT

| Base 관찰 | 판정 | GRIMOIRE 적용 |
| --- | --- | --- |
| 최신 사용자 지시 → Project authority → actual implementation → adopted Base → external/reference 순서, exact-head PR 검증, evidence ceiling | **ADOPT** | `AGENTS.md`와 Gate 0의 기본 순서로 사용한다. Human/Device/Performance/Full Slice가 실행되지 않으면 항상 `NOT_RUN`이다. |
| L1+ receipt, benchmark/reuse preflight, 3개 이상 실질 대안, scoped hygiene, 5회 full-scope adversarial review | **ADAPT** | `docs/contracts/receipts/`에 project-owned JSON receipt를 남기고 adapter 검증 후 pinned Base validator를 실행한다. 대안은 product 방향을 새로 만들 때만 3안 비교하고, 기계적 동일 검증에는 불필요하게 강제하지 않는다. |
| Base의 project profile/hand-off에 남은 `FIVE_POINT_STAR` project identity | **REJECT** | Base reference는 재사용 탐색 입력일 뿐 GRIMOIRE 제품 정본이 아니다. 현재 제품 코어는 `GM-CIRCLE-CLOCK-CARD-CORE-01`; Star record는 `HISTORICAL_COMPATIBILITY_ONLY`다. |
| Base 공용 Skill 본문 단일 소유, project adapter에는 경로·엔진·validator·보호 범위만 기록 | **ADOPT** | Base Skill을 프로젝트에 복사하지 않는다. `skills/PROJECT_BASE_ADAPTER.json`은 current Base 관찰과 GRIMOIRE path/engine/evidence만 기록한다. |
| Base 최신 main이 더 새로워도 project pin을 자동 교체하지 않음 | **ADOPT** | v9.4.3 release lock은 유지한다. 새 Base main은 매 material work에서 fresh-read한 뒤 **적용 결정**만 project canon에 남긴다. Base release 자체 갱신은 별도 equivalence·migration·validator Gate가 필요하다. |
| archive/delete는 이름·날짜가 아니라 consumer-zero와 rollback evidence로 판정 | **ADAPT** | `ACTIVE_OWNER / COMPATIBILITY / ARCHIVE / OBSOLETE_CANDIDATE / UNKNOWN_UNVERIFIED`을 project receipt에 기록한다. Star save와 historical contracts는 자동 삭제하지 않는다. |

## GRIMOIRE의 현재 작업 구조

### 1. 권위와 책임 분리

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ active product/operating contract
→ direct domain owner + actual code/data/Scene/Resource/Test
→ skills/PROJECT_BASE_ADAPTER.json + fresh Base owner
→ live GitHub branch/PR/rules/check readback
→ external sources and prior conversations as reference only
```

각 사실은 하나의 current owner만 가진다.

| 사실 | current owner | 직접 consumer / 확인 |
| --- | --- | --- |
| 제품 코어·범위·비목표 | Circle/Clock/Card replacement spec | `src/core/circle`, `src/core/events`, `src/core/cards`, story scenes, tests |
| 현 작업 상태·다음 Gate | `docs/ACTIVE_CONTEXT.md` | start entry, registry, development gates |
| 시작·검증 순서 | 이 adaptation + `docs/DEVELOPMENT_GATES.md` | task receipt, PR review, CI / local validation |
| Base 채택 pin과 fresh-current 관찰 | `skills/PROJECT_BASE_ADAPTER.json` | operating-contract validator, generated views, routing |
| 정본 문서 경로와 역사 분류 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | new worker restore order, static contract checks |
| actual product behavior | `project.godot`, Scene, GDScript, Resource, tests, runtime receipt | Godot run and exact-worktree observations |
| human-facing project explanation | repository Markdown and exact-source PDF only when a review Gate requires one | not an additional runtime canon |

Notion은 `RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE`, Google Sheets는 `MIGRATION_ONLY_UNTIL_REMOVAL`이다. 둘 다 normal start, active decision sync, or completion evidence의 요구사항이 아니다.

### 2. L1+ 작업 순서

```text
0. Read-only bootstrap
   user instruction + project entrypoints + current main + same-goal PR + actual consumer
1. Pin and fresh-current Base check
   project adapter validator → relevant Base owner → current Base main SHA record
2. Reuse / benchmark / hygiene receipt
   current project → approved references/assets → Base reuse input → targeted external source
   → ADOPT / ADAPT / REJECT → exact Base receipt validator PASS
3. Direction and contract
   goal / player outcome / non-goal / protected scope / acceptance / rollback / evidence ceiling
   → user approval or exact reused approval reference
4. Sequenced work packet
   canonical/interface boundary → highest-risk feasibility → product consumer → validation → canon readback
5. BUILD by actual owner
   repository/contract/doc work or Godot product work; do not cross ownership by file extension
6. REVIEW and correction
   attack → validate finding → smallest safe in-scope correction → regression recheck
7. Exact-head delivery
   fetch/reconcile → commit → push → current PR checks/review/rules → merge only when authorized
8. Post-merge readback
   new main, direct consumer, registry/derived view, remaining-work recalculation, same-final-state review
```

`CONTINUOUS_WORK_ACTIVE`는 이미 승인된 동일 범위의 ready task에만 적용한다. Card detail, story meaning, balance, visual final lock, save migration, new paid tool, public release, or deletion that changes recovery options remains a separate decision boundary.

### 3. Work packet minimum

L1+ work packet은 새 정본을 하나 더 만들지 않는다. 해당 feature/spec/contract의 기존 owner에 아래 연결만 남긴다.

```yaml
direction_anchor:
sources_and_exact_sha: []
approved_scope: []
non_scope_and_protected_scope: []
reuse_preflight_receipt:
actual_consumer_and_interface:
steps:
  - outcome:
    owner:
    dependencies:
    acceptance:
    validation:
    rollback:
evidence_ceiling:
remaining_unknowns: []
```

### 4. Legacy and removal rules

| Classification | GRIMOIRE rule |
| --- | --- |
| `ACTIVE_OWNER` | Current entry, decision, runtime contract, asset manifest, test, or evidence owner. Update only in the approved change unit. |
| `COMPATIBILITY` | Historical Star decision, Task8 locator, legacy save, or older adapter view needed for discovery/rollback. Do not execute as current gameplay or migration instruction. |
| `ARCHIVE` | Immutable retained proof with source/provenance and a current replacement pointer. |
| `OBSOLETE_CANDIDATE` | Never delete merely by age/name. First prove direct references and consumers are zero, then use a recoverable commit and readback. |
| `UNKNOWN_UNVERIFIED` | Preserve and narrow the active entrypoint instead of guessing or deleting. |

The preserved file at `C:/Users/user/AppData/Roaming/Godot/app_userdata/GRIMOIRE Star Circuit Runtime POC/grimoire_campaign_anchor.json` stays outside this repository change. It is `COMPATIBILITY` evidence only: no move, write, delete, or automatic Circle-story conversion.

## Current project-specific work order

| Priority | Outcome | Why now | Owner | Acceptance and evidence |
| --- | --- | --- | --- | --- |
| P0 | Base-current operating contract and entrypoint reconciliation | Removes the risk that active work starts from stale Star/Task8 instructions | Repository contract / documentation | this receipt PASS, static contract, generated-view check, exact PR head |
| P1 | `CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK` | The current story route is machine/editor observed but not player/device proven | Product validation | Human, mobile/touch, accessibility, performance, export evidence remain separately measured |
| P2 | Story continuation after Frostbloom: class / practicum / duel / festival | User’s product direction is story-led rather than a mode hub | Product spec then Godot implementation | Consumer, save/rollback, visual/audio and runtime test contracts are approved before build |
| P3 | Card duel detailed rules | User explicitly deferred its details; `[7,7,6] / 20` is illustrative only | User decision → card spec | `RULESET_PENDING` is replaced only by an approved rules owner and tests |

P1–P3 are not completed by this governance update. P0 alone changes only the operational contract.

## Before/after validation and rollback

```yaml
before:
  current_product_runtime: "Circle/Clock/Card partial implementation; Star runtime removed; legacy save preserved"
  current_human_device_performance: NOT_RUN
  current_base_release_lock: v9.4.3
after_intended:
  base_current_read: "19355b7 recorded as project-adapted, not silently adopted as a new release pin"
  entry_order: "One current route, explicit direct consumers, live PR readback"
  legacy_interpretation: "HISTORICAL_COMPATIBILITY_ONLY rather than active gameplay direction"
  new_product_or_save_behavior: NONE
rollback:
  method: "Revert the dedicated governance commit; no user data, Godot runtime source, asset binary, or save file is part of this work unit"
```

## Required review and learning exit

This L3 contract update is complete only after:

1. the project operating-contract validator and Base receipt validator pass;
2. the targeted static contract and generated-view checks pass;
3. five full-scope adversarial loops classify every finding and correct only in-scope, evidence-backed defects;
4. PR #253’s new exact head has successful required checks and live readback; and
5. the direct current documents and their generated views agree.

This update identifies no repeatable, cross-project implementation with stronger evidence than the current Base owners. Its reuse handoff result is **`NO_NEW_REUSE_LEARNING`**. A Base change proposal is therefore not created.

## Five full-scope adversarial review loops

| Loop | Attack question | Finding | In-scope correction / outcome |
| --- | --- | --- | --- |
| 1 — authority | Can a new worker begin from an old Star/Task8 sentence and treat it as a current build instruction? | Yes. The entry documents carried historical recovery prose beside the current Circle/Clock decision. | Marked historical sections `HISTORICAL_COMPATIBILITY_ONLY`; the current chain now enters through this adaptation, the L1+ receipt, v4.8 binding, and Circle/Clock/Card owner. |
| 2 — Base drift | Does recording fresh Base main silently upgrade GRIMOIRE from its adopted v9.4.3 pin? | It could be misread that way without an explicit decision boundary. | Recorded Base `19355b7` as `READ_AND_PROJECT_ADAPTED`; retained v9.4.3 and required a separate equivalence/migration gate for a pin change. |
| 3 — product/save scope | Could contract cleanup mutate Card rules, the main-scene namespace, Star assets, or the user-owned legacy save? | `project.godot` still has a historical product name, which may affect the `user://` namespace if changed. | No runtime, asset, card, or save change was made. Deferred project-name/save namespace work to a dedicated compatibility decision. |
| 4 — derived-view integrity | Can adapter metadata and generated dashboard/skill views diverge after the new Base observation is added? | Yes if generated outputs are hand-edited or left stale. | Updated only `skills/PROJECT_BASE_ADAPTER.json`, regenerated all four derived views, ran generator `--check`, and passed the project operating-contract validator. |
| 5 — evidence/PR closure | Do passing documents or local automation imply player, device, accessibility, or release approval? | No; the governance update has no new product behavior and unverified evidence must not be promoted. | Kept Human/Device/Performance/Accessibility/Export/Full Slice as `NOT_RUN`; re-ran static contracts and the existing headless Circle/Clock regression only as machine evidence. Exact new PR-head checks remain the delivery gate. |

## Evidence limits and deferred decisions

- Base/document/receipt validation is not proof of Godot runtime, player fun, touch ergonomics, accessibility, performance, exports, or release readiness.
- `project.godot` still uses the historical product name `GRIMOIRE Star Circuit Runtime POC`. Changing it can alter the `user://` save namespace, so it is not an automatic cleanup in this contract update. It needs a separate save-compatibility decision and migration plan.
- Existing card shell code contains structural round metadata, but detailed mana distribution, draw/mulligan/pass/field/combat/score rules remain `RULESET_PENDING` until the user provides the card rules.
