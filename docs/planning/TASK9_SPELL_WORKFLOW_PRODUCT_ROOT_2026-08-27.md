# Task9 Spell Workflow Product Root — Work Production Input Packet

```yaml
WORK_PRODUCTION_INPUT_PACKET:
  project_identity: "GRIMOIRE: 세계를 다시 쓰는 법"
  repository: "alsdmlals4-eng/GRIMOIRE-"
  slice_id: "TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27"
  exact_project_baseline: "e954b7fb863d31387d3383b654c60b52ea7b9d89"
  player_promise: "플레이어가 직접 쓴 글자를 주문으로 완성하고, 대상과 결과를 확인한 뒤 명시적으로 시전한다."
  starting_context: "마법 온실의 안전한 실습; 아직 풀 세션·서사 진행은 시작하지 않는다."
  player_action_or_choice: "HEAT를 쓰고 저장, Main에 배치, 주문을 확정, WARD 또는 FLOWER를 고른 뒤 Preview와 두 번의 시전 동작을 수행한다."
  meaningful_tradeoff: "두 대상은 서로 다른 키워드·표시·결과 payload를 가진 유효 선택지이며 어느 쪽도 최적 경로로 제시하지 않는다."
  expected_result: "정확히 한 번의 USED 결과와 비용/대상 영수증, 재시작 가능 상태."
  failure_and_learning: "빈/오인식 입력·잘못된 회로·미선택 대상·중복 확인은 실패 닫힘 상태로 남고 소비나 진행을 일으키지 않는다."
  reward_and_feedback: "결과·대상·마력 비용 영수증. 경제/성장 보상은 이번 범위에서 제외한다."
  approved_scope:
    - "기존 Task6/7/8 화면을 소비하는 Product Root"
    - "실제 pointer/touch 글자 입력 어댑터"
    - "기존 Coordinator와 세션을 통한 명시적 상태 전이"
    - "기존 승인 glyph PNG와 학교 배경의 실제 소비처 연결"
    - "결정적·런타임·Hera 검증"
  explicit_non_scope:
    - "Frostbloom 전체 세션·저장·진행·보상·조사·전투"
    - "새 이미지·사운드·VFX·유료/외부 권리 자산"
    - "자동 대상·자동 시전·새 권한/경제·기존 도메인 규칙 재작성"
    - "출시/배포와 사람·기기·성능 PASS 주장"
  protected_scope:
    - "글자 → 주문 → 대상 → 시전"
    - "FIVE_POINT_STAR: Main 1개, Aux 0~5개"
    - "Typed glyph only, explicit exactly-once commit"
    - "SpellWorkflowCoordinator와 ledger/inventory/result authority"
  planning_and_rules:
    - "docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md"
    - "docs/superpowers/specs/2026-08-27-task9-spell-workflow-product-root-design.md"
    - "AGENTS.md"
  ui_ux_flow: "글자 쓰기/인식/저장 → 회로 Main 배치/Preview/완성 주문 확정 → 대상 선택/최종 Preview/명시 시전 → 결과 영수증/재시작"
  data_and_state_contract: "Product Root는 기존 Coordinator의 공개 메서드와 각 화면의 intent signal만 연결하며, source of truth를 복제하지 않는다."
  visual_requirements:
    - "글자별 한국어 이름은 라이브 Label로 표시한다."
    - "기존 Soft Storybook Cel 2D Hybrid와 승인 glyph assets를 유지한다."
  approved_visual_assets:
    - "assets/art/ui/glyphs/glyph_heat.png"
    - "assets/art/ui/glyphs/glyph_protect.png"
    - "assets/art/ui/glyphs/glyph_flow.png"
    - "assets/art/ui/glyphs/glyph_focus.png"
    - "assets/art/ui/glyphs/glyph_disperse.png"
    - "assets/art/ui/glyphs/glyph_burst.png"
    - "assets/art/backgrounds/school/bg_school_common.webp"
  audio_requirements: []
  approved_audio_assets_or_procedural_specs: []
  vfx_and_feedback_requirements: ["기존 UI 상태/문구/Outline 피드백만 사용; 새 VFX는 생성하지 않는다."]
  localization_and_accessibility_requirements: ["한국어 라이브 UI 라벨", "mouse와 touchscreen stroke input", "기존 safe-root의 landscape 대응"]
  provenance_and_rights_records: ["assets/manifests/glyph_*.json", "Notion Asset Library의 승인 원본 attachment"]
  implementation_acceptance: ["설계 문서의 Acceptance criteria 1~8"]
  deterministic_test_requirements: ["기존 45-suite runner 회귀", "새 Product Root path 및 실패 경계", "GUT smoke"]
  runtime_qa_scenarios: ["headless import/run", "Hera UI/runtime tree inspection", "대표 landscape sizes"]
  build_or_export_checks: ["Godot import/parse/headless runtime; shipping export는 NOT_RUN"]
  required_canon_updates: ["Task8 merged-main reality", "Task9 status/evidence", "Notion Home readback"]
  rollback: "current-task branch/PR만 squash merge; 다른 open PR은 read-only; direct main/force push 금지"
  unresolved_nonblocking: ["Human/device/performance/export evidence"]
  blocking_missing_inputs: []
  evidence_ceiling: "AUTOMATED_VERTICAL_SLICE_READY only; HUMAN/PLAYER EXPERIENCE NOT_RUN"
  readiness: "READY_FOR_SINGLE_CODEX_WINDOW"
```

## Reuse decision

| Order | Candidate | Decision | Rationale |
| --- | --- | --- | --- |
| 1 | Existing `SpellWorkflowCoordinator`, Task6/7/8 screens, resolver and component sheets | Adopt | They already embody the approved state semantics and visual vocabulary. |
| 2 | Base shared semantic UI/module contracts | Adapt | Use their contract discipline; import no new Base runtime because the project already owns compatible implementations. |
| 3 | Existing `star_circuit_harness` as main | Reject | It is a POC and does not consume the three approved workflow surfaces. |
| 4 | Full Frostbloom session or new art/audio | Defer | No current-slice consumer or approval need; would exceed the smallest vertical slice. |

No additional image, sound, or VFX input blocks this slice. Existing approved assets have a concrete Product Root consumer; no asset is represented as runtime-bound until that consumer is implemented and verified.

## Merged-main implementation ledger

- GitHub Issue: #191
- Merged main: `db038a4fd964ca037bfe97f6aee5d0cc7d0daf93` via PR #192 (squash merge, 2026-08-27 KST)
- Implemented: `SpellWorkflowProductRoot`, real mouse/touch stroke collection, explicit recognised-candidate selection, existing Task6/7/8 surface orchestration, two non-ranked target choices, result receipt hand-off, and root-flow deterministic coverage.
- Exact automated evidence on this branch: custom runner `47 suites / 1,968 assertions / 0 failures`; GUT `8 passing tests`.
- Runtime evidence: Godot AI v3.2 ran `spell_workflow_product_root.tscn`; the authority path produced `VAULT_GLYPH_CREATED → CIRCUIT_PREVIEW_READY → PREPARED → FINAL_PREVIEW_READY → USED → RESULT` with no task-related launch error.
- Entry-point status: `application/run/main_scene` was set through the live Godot editor UI to `res://src/ui/spell_workflow/spell_workflow_product_root.tscn` (stored as `uid://dj14w6clxafqv`). A `project_run(mode="main")` readback loaded `SpellWorkflowProductRoot` with a live helper and no task-related launch error. The existing Star Harness remains a separate POC scene.
- Evidence ceiling remains machine-only. Human usability, player experience, device, performance, and shipping-export validation are not run.

## Completion readback

```yaml
status: MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY
next_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
remote_ci: 13_REQUIRED_AND_APPLICABLE_CHECKS_SUCCESS_ON_EXACT_PR_HEAD
human_usability: NOT_RUN
player_experience: NOT_RUN
device_performance_export: NOT_RUN_OR_NOT_CONFIGURED
```

## Fresh automated recheck — 2026-08-27

```yaml
exact_main: 6f2719e52c6f9dfd95769e73fbd0ae6f8e493ea4
scope: TASK9_MACHINE_EVIDENCE_RECHECK_ONLY
custom_runner: 47_suites_1976_assertions_0_failures_NO_EXIT_LEAK_WARNING
gut: 8_tests_29_asserts_0_failures
python_contracts: 46_tests_0_failures
hera_live_observation: NOT_RUN_NO_LIVE_EDITOR
human_device_performance_export: NOT_RUN
```

### Incident → solution → lesson

1. `IMG-02` 후보·WebP 내보내기 병합 뒤 Image Goal Queue만 새 상태를 기록했고, coverage/checklist와 current-authority 검증은 이전 상태 문자열을 유지했다. 세 human/runtime 정본과 계약 테스트를 같은 **runtime 미연결** 상태로 동기화했다. 이 변경은 후보가 runtime Scene에 바인딩됐다는 뜻이 아니다.
2. Task9 integration tests가 scene-tree 밖의 `Control` 노드를 지연 해제로 남겨 custom runner 종료 시 leak warning을 만들었다. 테스트가 만든 노드는 즉시 `free()`하도록 바꾸고 runner clean exit를 확인했다.

재사용 판정은 `PROJECT_ONLY`: 두 원인은 이 프로젝트의 IMG-02 상태 owner와 Godot test fixture에 한정된 단일 발생이다. Base 승격은 독립 재발·negative case·기존 owner promotion evidence가 없어 `REJECT_OVERGENERALIZATION`으로 닫는다.
