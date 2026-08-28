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
| 핵심 판타지 | 마법 글자의 의미를 배우고 직접 주문을 설계해, 이해 가능한 현장 문제의 규칙을 바꾸는 마법학교 성장 경험. |
| Player Promise | 플레이어가 관찰한 근거를 바탕으로 글자와 FIVE_POINT_STAR 회로를 작성하고, 무엇을 먼저 지킬지 고른 뒤, 결과·대가·미확인을 기록으로 이해한다. |
| 플레이어 노출 흐름 | **글자 → 주문 → 대상 → 시전**. 내부는 typed Glyph Stock, PreparedSpell, Stage 2/3, atomic transaction을 유지한다. |
| 학습 루프 | 수업/관찰 → 글자·회로 설계 → Preview → 명시 대상/시전 → 실제 변화·대가 → Grimoire 기록 → 다음 질문. |
| 보호할 강점 | 직접 쓰는 글자, 명시 commit, 관찰 근거와 미확인의 분리, 선택의 실제 결과 보존, global success grade 금지. |
| 현재 제품 단계 | `PARTIAL_FOUNDATION`; Task9 Product Root는 merged main이지만 Human/Device/Performance/Full Slice는 `NOT_RUN`. |

## 2. 현재 대표 경험: Frostbloom W6

Frostbloom의 첫 major 해결에서 플레이어는 **희귀 서리 묘목** 또는 **균열 난 온실 구조/등불** 중 지금 먼저 보존할 가치를 고른다. 둘은 숨은 정답·보상·성공 우열이 없는 동등한 유효 선택이다.

```text
Known 2 / Unknown 2 / Lens 1
→ 직접 쓴 글자 + FIVE_POINT_STAR로 완성 주문
→ 묘목 또는 구조 선택
→ 확인된 개선 / 남는 위험 / 미확인 / Mana를 읽음
→ 명시 시전
→ 실제 개선 / 포기한 가치 / 남은 미확인을 receipt로 확인
→ W7 및 후속 조사의 다음 질문
```

- 현재 W6 범위는 사용자가 고른 A안, **짧은 decision-loop vertical slice**다.
- 현재 Product Root의 `WARD`/`FLOWER`와 수치 차이는 Frostbloom 사실이 아닌 generic technical prototype이다.
- L2 owner: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md` (`USER_APPROVED_L2`).
- L3 traceability/implementation plan: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`, `docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md` (Issue #242).
- W6 전체 23–30분 계약과 W7/결과 연결: `docs/planning/FROSTBLOOM_W6_BOUNDED_CONSEQUENCE_FORECAST_01_APPROVAL_2026-08-20.md`, `docs/planning/FROSTBLOOM_FIRST_SESSION_PERSISTENT_HANDOFF_ELASTIC_BUFFER_01_APPROVAL_2026-08-20.md`, `docs/planning/FROSTBLOOM_RESULT_GRIMOIRE_CAUSAL_DEBRIEF_01_APPROVAL_2026-08-20.md`.
- 사용자가 2026-08-29에 W6 Godot 구현을 승인했다. 현재 Resource·Scene·코드·자동 검증·1280×720 런타임 스모크는 구현됐지만, runtime asset 사용/production batch는 시작하지 않았고 Human/Device/Performance/Export/Full Slice는 여전히 `NOT_RUN`이다. 증거는 `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`가 소유한다.

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
| Product Root | `res://src/ui/spell_workflow/spell_workflow_product_root.tscn` is the main development entry | foundation flow only; generic WARD/FLOWER is not W6 canon |
| Core systems | direct glyph input, FIVE_POINT_STAR circuit, explicit target/cast, atomic result receipt, W6 typed context Resource | W6 automated and runtime-smoke evidence exists; it does not prove Human/player/device/performance quality |
| Runtime visuals | common UI SVGs, six glyph PNGs, and greenhouse field base have consumers | visual completeness/readability is not proven |
| Automated evidence | automated/component evidence exists; fresh exact checks must be run per change | not Human/player/device/performance proof |
| Human usability / Player Experience | `NOT_RUN` | user validation remains required |
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

1. W6 L2 Spec과 L3 implementation은 사용자 승인 범위에서 구현됐고, Issue는 #242다. 현재 정확한 변경점 evidence는 `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`가 소유한다.
2. 다음 구현 게이트는 PR exact-head checks와 safe merge다. W7, production asset batch, Task8 recovery는 범위 밖이다.
3. Before every material recommendation or change, run the adversarial/research/feasibility gate; W6 is automated/runtime-smoke verified but Human/player/device/performance is not verified.
4. Keep `TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING` separate; do not treat documentation or automated evidence as Human/Player validation.

## 7. Reading and update rules

- The repository owns current human and structured canon. No Notion current-canon write or destination readback is allowed.
- During the one-time 2026-08-28 migration only, named Notion sources are read-only sources; the audit decides whether their content is migrated, already covered, historical, superseded, or retired.
- Base/shared rules stay in Base; project docs link to them rather than copying shared process rules.
- Historic documents retain provenance but cannot overwrite the owners named above.
