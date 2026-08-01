# GRIMOIRE Documentation Map

## 현재 기준

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
parallel_design_gate: BOSS-PHASE-01
implementation: NOT_STARTED
canon_sync: SYNCED_TO_MAIN
authority_main_commit: a088252349bee94cecef94b216c8cc5e0b9162cb
```

## 1. 시작 경로

```text
README.md
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
→ docs/planning/sync/GR-SYNC-20260801-05-MAIN.md
```

## 2. 활성 권위

| 책임 | 문서 | 상태 |
|---|---|---|
| 최상위 작업 규칙 | `AGENTS.md` | `ACTIVE_PROJECT_AUTHORITY` |
| 시작·다음 작업 | `START_HERE.md` | `ACTIVE_ENTRYPOINT` |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` | `ACTIVE_CONTEXT_AUTHORITY` |
| 현재 확정 결정 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | `ACTIVE_FIRST_READ_AUTHORITY` |
| 최신 사용자 결정 | `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md` | `ACTIVE_LATEST_USER_DECISION_AUTHORITY` |
| 기획 정본 | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` | `ACTIVE_APPROVED_PLANNING_CANON` |
| Art Style | `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md` | `APPROVED_LOCKED_REFERENCE` |
| Art Bible | `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md` | `APPROVED_DUAL_STANDARD_ART_BIBLE` |
| Art Bible 전투 교정 | `docs/planning/ART_BIBLE_01_BATTLE_CORRECTION_ADDENDUM_2026-08-01.md` | `ACTIVE_BATTLE_OVERRIDE` |
| 전투 화면 | `docs/planning/BATTLE_SCREEN_LAYOUT_01_APPROVAL_2026-08-01.md` | `APPROVED_LAYOUT_DIRECTION` |
| 단일 강적 | `docs/planning/BATTLE_SINGLE_ENEMY_FOCUS_01_APPROVAL_2026-08-01.md` | `APPROVED_ENCOUNTER_DIRECTION` |
| 적 Timer·즉시시전 | `docs/planning/BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_APPROVAL_2026-08-01.md` | `APPROVED_CORE_BATTLE_FLOW` |
| 시간 흐름 | `docs/planning/BATTLE_TIME_FLOW_01_APPROVAL_2026-08-01.md` | `APPROVED_TIME_FLOW_DIRECTION` |
| 승패·피해·진정 | `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md` | `APPROVED_SITUATION_RESOLUTION_RULES` |
| 벤치마킹 정책 | `docs/planning/PROJECT_BENCHMARKING_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 정본 동기화 정책 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 전수 감사 | `docs/planning/PROJECT_WIDE_OPERATING_AND_DESIGN_AUDIT_2026-08-01.md` | `PASS_CORRECTIONS_VERIFIED` |
| main 동기화 영수증 | `docs/planning/sync/GR-SYNC-20260801-05-MAIN.md` | `SYNCED_TO_MAIN_RECEIPT` |
| 개발 Gate | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| Design Router | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| Google Sheet 계약 | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | `ACTIVE_WORKBOOK_CONTRACT` |
| Base Version | `docs/BASE_RULES_VERSION.md` | `CURRENT_V9_3` |
| Base Adapter | `skills/PROJECT_BASE_ADAPTER.json` | `CURRENT_CANONICAL_ADAPTER` |
| Skill Snapshot | `skills/PROJECT_SKILL_SNAPSHOT.json` | `CURRENT_GENERATED_VIEW` |

## 3. 기획·콘텐츠

| 책임 | 문서 |
|---|---|
| 전체 승인 Slice | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` |
| 현재 결정 Snapshot | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| 글자·작성 빈도 | Planning Canon + `GM-WRITING-FREQUENCY-01` |
| 마도서 기록 | Planning Canon + `GM-GRIMOIRE-RECORD-01` |
| 화면 시퀀스 기술 부록 | `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md` |
| P0 상세 부록 | `docs/superpowers/specs/grimoire-situations/` |

기존 P0 Scene·Node·Resource·Signal 명세는 `SUPPORTING_TECHNICAL_APPENDIX_ONLY`이며 구현 권한이 아니다.

## 4. 아트·화면

```text
ART-STYLE-01 — 승인
→ ART-BIBLE-01 — 승인
→ ASSET-SPEC-01 — 현재 Gate
→ Grimoire Board
→ Main Board
→ Battle Detail Wireframe
```

잠긴 원본:

- Library: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 편집·재생성 금지.

## 5. 전투 Router

| 결정 | Authority | Machine State | Benchmark |
|---|---|---|---|
| `GM-BATTLE-SCREEN-LAYOUT-01` | `BATTLE_SCREEN_LAYOUT_01_APPROVAL_2026-08-01.md` | `BATTLE_SCREEN_LAYOUT_01_STATE.json` | `BATTLE_SCREEN_LAYOUT_01_QUICK_BENCHMARK_2026-08-01.md` |
| `GM-BATTLE-SINGLE-ENEMY-FOCUS-01` | `BATTLE_SINGLE_ENEMY_FOCUS_01_APPROVAL_2026-08-01.md` | `BATTLE_SINGLE_ENEMY_FOCUS_01_STATE.json` | `BATTLE_SINGLE_ENEMY_FOCUS_01_QUICK_BENCHMARK_2026-08-01.md` |
| `GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01` | `BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_APPROVAL_2026-08-01.md` | `BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_STATE.json` | `BATTLE_ACTIVE_TIMER_INSTANT_CAST_PHASES_01_QUICK_BENCHMARK_2026-08-01.md` |
| `GM-BATTLE-TIME-FLOW-01` | `BATTLE_TIME_FLOW_01_APPROVAL_2026-08-01.md` | `BATTLE_TIME_FLOW_01_STATE.json` | `BATTLE_TIME_FLOW_01_QUICK_BENCHMARK_2026-08-01.md` |
| `GM-BATTLE-RULES-01` | `BATTLE_RULES_01_APPROVAL_2026-08-01.md` | `BATTLE_RULES_01_STATE.json` | `BATTLE_RULES_01_QUICK_BENCHMARK_2026-08-01.md` |

## 6. Base v9.3 Router

```text
skills/SKILL_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
→ tools/generate_project_operating_views.py
→ PROJECT_SKILL_SNAPSHOT.json
→ BASE_V9_ADAPTER.json
→ PROJECT_BASE_SKILL_ADAPTER.json
→ tests/test_base_v9_adoption.py
→ GitHub Actions
```

Generated View 직접 편집 금지.

## 7. Google Sheet

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.
- 27개 필수 탭.
- 역할: `USER_FACING_GDD_WORKSPACE`.
- Authority main Commit `a088252349bee94cecef94b216c8cc5e0b9162cb` 기록·Readback `PASS`.
- 상태: `GR-SYNC-20260801-05 / SYNCED_TO_MAIN`.

## 8. Legacy

| 자료 | 역할 |
|---|---|
| v6·v8 Vertical Slice 계약 | `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY` |
| `Spell` 저장소명 | `LEGACY_ALIAS` |
| 이전 generic dark fantasy·기술 Dashboard 이미지 | `REJECTED_NOT_AUTHORITY` |
| 기존 P0 Godot 기술 명세 | `SUPPORTING_TECHNICAL_APPENDIX_ONLY` |
| Android Touch 연구 | `REFERENCE_CANDIDATE / NOT_PC_RUNTIME_VALIDATED` |

## 9. 다음 Gate

```text
ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

## 10. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

## Base v9.4 운영 계약

- `docs/AI_WORKFLOW.md`: 모델 추천·지시 권위·Context 큐레이션·증거 상한.
- `docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md`: Base identity와 승인 정본 보호 감사.
