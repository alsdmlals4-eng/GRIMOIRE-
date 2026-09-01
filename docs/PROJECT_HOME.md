# GRIMOIRE · Project Home

> Repository-native human home. This page replaces the former Notion Home as the single entry point for the current project picture. It is not a runtime/evidence claim.

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
project_key: GRIMOIRE
repository: alsdmlals4-eng/GRIMOIRE-
human_canon: REPOSITORY_MARKDOWN
structured_runtime_canon: REPOSITORY_JSON_DATA_CODE_SCENE_RESOURCE_TEST
notion_role_during_2026_08_28_migration: READ_ONLY_SOURCE_ONLY
authoritative_bootstrap: AGENTS.md -> START_HERE.md -> docs/ACTIVE_CONTEXT.md -> active contract -> domain owner -> actual implementation
```

## 1. 프로젝트 한눈에 보기

| 항목 | 현재 정본 |
| --- | --- |
| 핵심 판타지 | 마법 글자의 의미를 배우고 공용 글자 서클을 겹쳐, 이해 가능한 현장 문제의 규칙을 바꾸는 마법학교 성장 경험. |
| Player Promise | 플레이어가 관찰한 근거를 바탕으로 글자 1~3개를 역할 없는 서클로 조합하고, 무엇을 먼저 지킬지 고른 뒤, 시계로 드러나는 결과·대가·미확인을 기록으로 이해한다. |
| 플레이어 노출 흐름 | **글자 → 서클 → 대상 → 시전 → 시계 결과**. Star Runtime 코드는 제거됐고 실제 legacy Star 저장은 자동 변환 없이 historical compatibility 자료로 보존한다. |
| 학습 루프 | 수업/관찰 → 글자·회로 설계 → Preview → 명시 대상/시전 → 실제 변화·대가 → Grimoire 기록 → 다음 질문. |
| 보호할 강점 | 직접 쓰는 글자, 명시 commit, 관찰 근거와 미확인의 분리, 선택의 실제 결과 보존, global success grade 금지. |
| 현재 제품 단계 | `PARTIAL_FOUNDATION`; Task9 Product Root는 merged main이지만 Human/Device/Performance/Full Slice는 `NOT_RUN`. |

## 2. 현재 대표 경험: Frostbloom W6

Frostbloom의 첫 major 해결에서 플레이어는 **희귀 서리 묘목** 또는 **균열 난 온실 구조/등불** 중 지금 먼저 보존할 가치를 고른다. 둘은 숨은 정답·보상·성공 우열이 없는 동등한 유효 선택이다.

```text
Known 2 / Unknown 2 / Lens 1
→ 직접 쓴 글자 + 역할 없는 1~3겹 서클로 완성 주문
→ 묘목 또는 구조 선택
→ 확인된 개선 / 남는 위험 / 미확인 / Mana를 읽음
→ 명시 시전
→ 실제 개선 / 포기한 가치 / 남은 미확인을 receipt로 확인
→ 사건 시계의 변화와 다음 이야기 질문
```

- 현재 W6 범위는 사용자가 고른 A안, **짧은 decision-loop vertical slice**다.
- 역사 `WARD`/`FLOWER`와 수치 차이는 Frostbloom 사실이 아닌 generic technical prototype이었다. 현재 Product Root는 W6 typed Resource의 `FROST_SEEDLINGS` / `GREENHOUSE_STRUCTURE`와 동등한 시작 비용·난도를 사용한다.
- L2 owner: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md` (`USER_APPROVED_L2`).
- L3 traceability/implementation plan: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`, `docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md` (Issue #242).
- W6 전체 23–30분 계약과 W7/결과 연결: `docs/planning/FROSTBLOOM_W6_BOUNDED_CONSEQUENCE_FORECAST_01_APPROVAL_2026-08-20.md`, `docs/planning/FROSTBLOOM_FIRST_SESSION_PERSISTENT_HANDOFF_ELASTIC_BUFFER_01_APPROVAL_2026-08-20.md`, `docs/planning/FROSTBLOOM_RESULT_GRIMOIRE_CAUSAL_DEBRIEF_01_APPROVAL_2026-08-20.md`.
- 사용자가 2026-08-29에 W6 Godot 구현을 승인했고, PR #245 exact head `b0f34b5`의 적용 가능한 checks 통과 뒤 squash merge `713bfbf`로 main에 반영됐다. Resource·Scene·코드·자동 검증·1280×720 런타임 스모크는 존재하지만 runtime asset 사용/production batch는 시작하지 않았고 Human/Device/Performance/Accessibility/Export/Full Slice는 여전히 `NOT_RUN`이다. 증거는 `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`가 소유한다.

## 3. 시각 방향과 Asset 경계

| 영역 | current owner | 상태 |
| --- | --- | --- |
| Art direction | `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md` | `ART-STYLE-01` Soft Storybook Cel 2D Hybrid |
| Visual tone | `docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md` | `USER_APPROVED_ACTIVE_VISUAL_TONE_OVERLAY` |
| W6 planning reference | `docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md` | `USER_APPROVED_PLANNING_REFERENCE_ONLY` |
| Visual/asset coverage | `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json` | current structured coverage |
| Runtime consumer boundary | `docs/planning/visual/GRIMOIRE_VISUAL_PRODUCTION_CHECKLIST_2026-08-26.json` | current runtime-only production rule |
| Representative reference files | `assets/reference/visual/` | reference-only, not runtime assets |

The player should first read a learner-led warm academy practicum: direct writing, breathable navy/blue space, restrained gold craft, and a solvable living problem. Avoid hidden-mastermind, ritual, hooded-watcher, grimdark corruption, generated pseudo-text, and a new 3D exploration family.

The visual candidate policy is user-preauthorized for a single candidate/refinement after canon, consumer, and rights preflight. Final lock, runtime use, or production-batch expansion still requires user confirmation.

## 4. Current implementation and evidence ceiling

| Layer | confirmed state | boundary |
| --- | --- | --- |
| Story Front Door | `res://src/ui/front_door/story_front_door.tscn` is the default story-led entry and binds the locked admissions environment | New Record starts admission; no class/practicum/duel/festival hub is exposed; Human/device proof remains separate |
| Core systems | direct glyph input, 1–3 role-free layered circles, explicit target/cast, event clocks, narrative-gated card shell | replacement is partial and automated/editor evidence is not Human/player/device/performance quality |
| Runtime visuals | common UI SVGs, six glyph PNGs, and greenhouse field base have consumers | visual completeness/readability is not proven |
| Automated evidence | automated/component evidence exists; fresh exact checks must be run per change | not Human/player/device/performance proof |
| Human usability / Player Experience | `NOT_RUN` | Circle/Clock precheck script is `PREPARED_NOT_RUN`; actual-person evidence remains required |
| Work quality gate | `docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md` | every material change requires fresh research, actual feasibility review, and adversarial review |

## 5. Repository domain map

This preserves the former Notion Home's useful navigation shape without making a second current canon.

| Former human domain | repository owner(s) |
| --- | --- |
| Direction · Planning | `docs/ACTIVE_CONTEXT.md`, `docs/planning/`, W6 L2 Spec, W6 L3 Packet, W6 implementation plan |
| Magic Systems · Learning | `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`, `docs/planning/AI_INDIE_PATTERN_ADOPTION_2026-08-24.md`, `src/core/`, `data/`, `tests/` |
| Visual · UX · Components | `docs/planning/visual/`, `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`, `assets/manifests/`, `assets/reference/visual/` |
| Production · Validation | `docs/ACTIVE_CONTEXT.md`, `docs/validation/`, `docs/testing/`, `tests/`, `tools/` |
| Reference · Benchmark | `docs/planning/benchmarks/`, `docs/planning/PROJECT_BENCHMARKING_POLICY.md` |

The detailed source/page ledger, classifications, and migration completion rules are in `docs/planning/NOTION_TO_REPOSITORY_MIGRATION_AUDIT_2026-08-28.md`.

## 6. Current gates

1. W6 L2 Spec과 L3 implementation은 사용자 승인 범위에서 구현됐고, Issue #242는 PR #245 merge `713bfbf`로 닫혔다. 현재 정확한 변경점 evidence는 `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`가 소유한다.
2. 다음 W6 evidence gate는 Human/Player, device, performance, accessibility, export, full-slice 검증이다. 사람 관찰은 `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_HUMAN_OBSERVATION_SCRIPT_2026-08-29.md`로 준비됐지만 아직 실행되지 않았다. W7, production asset batch, Task8 recovery는 범위 밖이다.
3. Before every material recommendation or change, run the adversarial/research/feasibility gate; W6 is automated/runtime-smoke verified but Human/player/device/performance is not verified.
4. `CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK`가 현재 다음 gate다. `docs/validation/CIRCLE_CLOCK_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK_2026-09-01.md`은 새 기록 → 입학식 → 첫 사건의 실제 runtime consumer와 physical device/accessibility 기록 항목을 묶은 `PREPARED_NOT_RUN` 스크립트다. Task8은 실제 legacy Star 저장을 자동 변환·이동·삭제하지 않고 보존한 채 historical Star Runtime code/scene/test consumer를 제거했다. 자동·editor 관찰을 Human/Player/Device validation으로 승격하지 않는다.

## 6.1 Human Blueprint review pair

`GRIMOIRE-HGB-20260830-01`은 장기 1학년 경험을 수업 → 지도 실습 → 통제 응용/축제 → 현장 전투/책임 → 마도서 복기 → 첫 세계 개정으로 연결해 사람이 검수할 수 있도록 만든 **R1 검수 대기 pair**다.

- 사람이 읽는 원본: `docs/planning/GRIMOIRE_HUMAN_GAME_BLUEPRINT_20260830.md`
- AI/개발/QA 인계 원본: `docs/planning/GRIMOIRE_AI_IMPLEMENTATION_SPEC_20260830.md`
- 파생 PDF: `output/pdf/grimoire_HUMAN_GAME_BLUEPRINT_20260830.pdf` (생성 후)
- 이 pair는 최신 사용자 방향에 따라 온실/묘목을 게임 전체가 아닌 **수업 직후 첫 지도 실습 사건**으로 설명한다. 기존 W6/C6 owner는 자동 변경하지 않으며, 최종 검수 뒤 별도 reconciliation unit에서만 조정한다. W6 사람 검증을 우회하거나 장기 Chapter, W7, runtime asset batch의 자동 구현 권한을 만들지 않는다.

`GR-STORY-ARC-BLUEPRINT-01`은 이 장기 방향의 당장 다음 5개 비트를 실행 가능한 첫 단위로 내렸다. [플로우·와이어프레임 설계](superpowers/specs/2026-09-01-story-arc-blueprint-design.md)와 [구현 계획](superpowers/plans/2026-09-01-story-arc-blueprint-implementation.md)은 입학식 → 수업 → 첫 실습 → 결투 연습 → 축제를 순서대로 연결한다. 결투 환경 후보 02는 `GENERATED_CANDIDATE`이며, manifest와 asset provenance는 존재하지만 runtime에는 아직 바인드되지 않았다. 후보 01은 UI 오인 위험을 발견해 provenance용으로만 보존했다. 카드 상세 규칙과 모든 Human/Device/Performance/Accessibility/Export 증거는 계속 별도 gate다.

## 7. Reading and update rules

- The repository owns current human and structured canon. No Notion current-canon write or destination readback is allowed.
- During the one-time 2026-08-28 migration only, named Notion sources are read-only sources; the audit decides whether their content is migrated, already covered, historical, superseded, or retired.
- Base/shared rules stay in Base; project docs link to them rather than copying shared process rules.
- Historic documents retain provenance but cannot overwrite the owners named above.
