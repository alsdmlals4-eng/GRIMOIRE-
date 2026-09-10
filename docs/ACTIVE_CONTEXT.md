# GRIMOIRE Active Context

## 후속 캐릭터 그림체 재검토

사용자는 이번 프로젝트에서 Aseprite/도트 방향을 사용하지 않고 다른 비도트 스타일을 요청했다. 주인공1명의 잉크 선·매트한 색면 동화책풍 후보를 이미지 모델로 제작 중이며 이전 비교/블루프린트 캐릭터는 최종 채택하지 않는다. [학생 외형 owner](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)의 최신 후보 절을 확인한다. 카드 세로형 일러스트/손패 겹치기 조합/단독 시전 방향은 유지. 기존58쪽 PDF는 발행 당시 검토본이고 새 캐릭터의 최종 승인을 뜻하지 않는다.

## 2026-09-11 사람용 블루프린트 제작

최신 사용자 위임으로 [사람용 본책](superpowers/specs/2026-09-11-human-blueprint.md)과 `output/pdf/GRIMOIRE_HUMAN_BLUEPRINT_20260911.pdf` 58쪽을 발행했다. 구조 참고 PDF92쪽의 아틀라스→경험→시스템→데이터→구현지도만 차용한다. 새 인게임 레이어 후보/상세 SWOT/첫 학교생활 장을 포함, 기존 공통 주문 규칙·10작품 비교는 부록으로 합성 발행한다. 최종 사용자 검토 전이며 게임 구현은 보류. 58쪽 렌더 검토, 13개 소비 자산 해시, 16개 atlas region 검사와 한계는 [발행 검증](validation/HUMAN_BLUEPRINT_20260911.md)을 확인한다. 생성/알파/아틀라스 검사는 runtime·Human PASS가 아니다. 아래9/10의 이미지 보류는 이 새 제작 범위에서 해제됐다.

## 2026-09-10 재기획 진입

공통 규칙 17절의 제한 산술 진단 9사례를 실행했다. 모으기→불씨는 방패3→0에서 불씨2회보다 피해1 우세, 방패0→0에서는 피해2 열세다(손패/생존/순환 제외). 열 장막은 열5부터 막기와 차이가 나며 차회 억제는 차회 방패0에서 이득0이다. 수치 잠금은 유지 보류. [진단 구현 계획](superpowers/plans/2026-09-10-spell-balance-diagnostic.md)에 재현 테스트와 손패 포함 비교 범위를 정했다. 제품 코드·이미지·Godot runtime 변경 없음. 다음 실행 단위는 계획의 독립 진단 검사이며 전체 매치 구현이 아니다.

공통 규칙 v0.4 16절에 재미·차별화 검토를 통합했다. 공식4자료 재조회 결과 '조합 주문을 전투/환경에 사용' 자체는 독창성 근거가 아니며, 학교생활에서의 응용/기록/인물 반응을 차별화 가설로 둔다. 현재 결투 전문 방어·차회 방패 억제는 기존 패턴에서 가치가 약해 BALANCE_REWORK_REQUIRED. 온실은 학습 예시이지 복수 선택 재미 증거가 아니다. 다음은 기획 축 추가보다 해당 반례를 다룰 검산/시뮬레이션과 구현 계획. 이미지/코드/Human 검증은 미실행.

공통 규칙 v0.3 15절에 조사 기반 세부 기획을 통합했다. 초기 손패70 조합 중 직접 공격 글자 없는 경우1을 확인(패배 확률 아님), 정돈 행동·학습용 초기 손패·보상/성장·공통 입력 상태·단계 힌트를 권장 기준으로 정의했다. 기존10작품 비교와 공식4자료 재조회. 이미지/코드/전체 결투 시뮬레이션은 미실행. 다음은 이 명세 기반 구현 계획과 시뮬레이션/검증 범위 정리다.

공통 규칙 v0.2의 11~14절에 10종 대상 반응, 결투 성질별 시험 효과/해소 순서, 수업·온실·축제의 목표·실패·마력고갈 경로를 추가했다. 문서 명세/수치 검산까지이며 새 실행 데이터·코드·균형 시뮬레이션은 NOT_RUN. 다음은 이 명세 검토 후 입력 와이어프레임·상태 흐름과 구현 계획이다. 이미지 보류 유지.

최신 사용자 확정: 결투 외 실습·온실·축제에서도 같은 글자를 조합해 주문을 쓴다. 사건에서는 무작위 손패 없이 배운 글자를 선택한다. `세부규칙은 네가 권장안대로 잡아줘`에 따라 [공통 주문·사건·결투 규칙](superpowers/specs/2026-09-10-shared-spell-rules-design.md)을 설계 기준으로 작성했다. 상태 SPECIFIED_RECOMMENDED_BASELINE, 새 구현/Human NOT_RUN. 이미지·알파 분리·모션 제작은 보류한다. 아래 아트 우선 순서와 기존 공격/방어 수치를 공통 규칙으로 해석하지 않는다. 다음 작업은 주문 반응표·결투 수치 정합화와 사건 명세이며, 기존 코드/저장/이미지는 보존한다.

최신 사용자 지시로 이전 승인 캐릭터 시안을 재확인했다. 첫 학생 기준은 역사 manifest의 **Y1-IMG-WALK-PLAYER-008 USER_APPROVED_VISUAL_MASTER**이며, 현재 참조 파일은 `assets/reference/visual/GRIMOIRE_student_008_approved_appearance_reference.png`다. 사용자 제공 전신 그림은 003과 해시가 같으며 학생 비율 참고, 007/009는 거부·수정 대상으로 유지. 직전 신규 얼굴 후보는 대체 기준에서 제외한다. [학생 owner의 최신 교정 절](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)을 먼저 읽는다. 새 008 기반 검토본은 불투명/사용자 검토 전이고 runtime·모션 미완료다. 아래 '얼굴 사용자 확인 전'은 직전 후보에 대한 역사 상태다.

분리 배경 `output/imagegen/card-duel/duel-background-candidate-01.png`는 사용자 `확정할게 진행해`로 USER_APPROVED다. 1672×941, 원본 해시 유지. [화면 후보 기록](planning/visual/CARD_DUEL_SURFACE_CANDIDATE_01_2026-09-10.md)이 승인 owner다. [첫 학생 기본 포즈 후보](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)를 생성했으나 생성본/배경제거 보정본 모두 RGB로 실제 알파가 없어 TECHNICAL_REVISION_REQUIRED다. 얼굴/의상/포즈도 사용자 확인 전이며 runtime에는 넣지 않았다. 새 화면·모션·카드 자산 연결은 미완료다.

후속 `권장안대로 계속 진행해`로 학생 비율·따뜻한 연습실·남색/금색 방향을 채택하며 중앙 별 장식은 제외한다. [도메인 구현 계획](superpowers/plans/2026-09-10-card-duel-domain-implementation.md)의 규칙/동시 판정/매치·저장 재개가 작업 브랜치에 구현됐다. Godot headless 54 suites / 2153 assertions / 0 failures, stderr empty. [검증 기록](validation/CARD_DUEL_DOMAIN_2026-09-10.md)을 읽는다. 시험 수치는 조정 가능하며 PDF는 발행 당시 DESIGN_REVIEW 상태를 보존한다. 다음은 분리 아트·카드 선택/명시 시전 UI·스토리 handoff 패키지다. 새 UI/runtime 화면·Human·Device는 NOT_RUN, main 병합도 미완료다.

제한 조합 A 및 대표 결투 상세 규칙은 후속 사용자 승인으로 구현 기준이 됐다. [대표 결투 블루프린트](superpowers/specs/2026-09-10-card-duel-blueprint.md)와 `output/pdf/GRIMOIRE_CARD_DUEL_BLUEPRINT_2026-09-10.pdf`를 검토한다. PDF의 DESIGN_REVIEW는 발행 당시 상태다. [첫 화면 후보](planning/visual/CARD_DUEL_SURFACE_CANDIDATE_01_2026-09-10.md)는 분리 제작 참고 자료이며 새 런타임 자산이 아니다.

현재 조사 산출물은 [카드 결투 재기획 검토](planning/CARD_DUEL_REPLANNING_RESEARCH_2026-09-10.md)다. 카드 조합 중심·마법사 종류 카드 제외는 최신 사용자 방향이며, 상세 규칙 승인과 도메인 검증은 위 최신 상태를 따른다. 새 카드 화면 Runtime/Human 검증은 NOT_RUN이다.

최신 사용자 방향·Aseprite 임시 경로 승인·확인된 main/PR 차이·후속 제작 순서는 [재기획 접수 기록](planning/REPLANNING_INTAKE_2026-09-10.md)이 소유한다. 아래 기존 기획 완료와 시각 잠금은 과거 작업의 상태이며 새 재기획의 완료 상태가 아니다.

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-26-r5.4-superset-final
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
current_governance_overlay: GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01
current_governance_overlay_owner: docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md
historical_contract_binding: GM-CONTRACT-V4-5-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr_predecessor: 158
current_authority_sync: GR-SYNC-20260826-37-SPELL-FLOW-PLAYER-FACING
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
task8_preservation_observation: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
task8_current_reconciliation_receipt: docs/planning/TASK8_CURRENT_MAIN_RECONCILIATION_2026-08-27.md
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION__W6_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
current_user_work_scope: FROSTBLOOM_W6_POSTMERGE_EVIDENCE_AND_HUMAN_VALIDATION
product_implementation_authorized_by_current_user_work_scope: true
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
visual_generation_state: FROSTBLOOM_W6_PLANNING_REFERENCE_LOCKED__L3_IMPLEMENTED__NO_RUNTIME_ASSET_BATCH
visual_candidate_generation_policy: USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY
visual_tone_overlay: GM-VISUAL-TONE-20260828-01
visual_tone_owner: docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
frostbloom_w6_preservation_priority_decision: GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01
frostbloom_w6_preservation_priority_status: USER_APPROVED_ACTIVE_PLANNING_ONLY
frostbloom_w6_preservation_priority_issue: 221
frostbloom_w6_preservation_priority_owner: docs/planning/FROSTBLOOM_W6_PRESERVATION_PRIORITY_01_APPROVAL_2026-08-28.md
frostbloom_w6_visual_brief: docs/planning/visual/FROSTBLOOM_W6_PRESERVATION_PRIORITY_VISUAL_BRIEF_2026-08-28.md
frostbloom_w6_visual_brief_state: SUPERSEDED_BY_USER_APPROVED_WARM_ACADEMY_TONE_LOCK
frostbloom_w6_visual_candidate_issue: 223
frostbloom_w6_visual_candidate_owner: docs/planning/visual/FROSTBLOOM_W6_PRESERVATION_PRIORITY_VISUAL_BRIEF_2026-08-28.md
frostbloom_w6_key_decision_visual_issue: 231
frostbloom_w6_key_decision_visual_owner: docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md
frostbloom_w6_key_decision_visual_state: USER_APPROVED_PLANNING_REFERENCE_ONLY
frostbloom_w6_key_decision_visual_age_read: YOUNG_ADULT_ACADEMY_RESEARCHER__USER_DIRECTED_REFINEMENT
w6_bundled_contract_preflight: docs/planning/audits/2026-08-28-frostbloom-w6-bundled-contract-preflight.md
w6_decision_loop_feature_spec: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
w6_decision_loop_feature_spec_issue: 236
w6_decision_loop_feature_spec_status: USER_APPROVED_L2__L3_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
w6_decision_loop_traceability_packet: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md
w6_decision_loop_implementation_plan: docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md
w6_decision_loop_l3_issue: 242
w6_decision_loop_implementation_authority: USER_APPROVED_2026-08-29__MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
w6_decision_loop_implementation_receipt: docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md
w6_decision_loop_pr: 245
w6_decision_loop_exact_head: b0f34b538680b5046705f36196eae71ed1b9b0a8
w6_decision_loop_merge_commit: 713bfbfc4c16b9ea469f2aa2c313a72bc50e1b67
post_visual_lock_next_gate: W6_HUMAN_PLAYER_DEVICE_PERFORMANCE_ACCESSIBILITY_EXPORT_FULL_SLICE
adversarial_research_feasibility_gate: docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md
adversarial_research_feasibility_gate_status: USER_APPROVED_ACTIVE__REQUIRED_ON_MATERIAL_WORK
visual_direction_decision: GM-VISUAL-DIRECTION-20260825-01
representative_screen_decision: GM-REPRESENTATIVE-SCREENS-20260825-01
art_style_lock: ART-STYLE-01
workspace_human_canon: REPOSITORY_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
notion_policy: RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
notion_retirement_owner: docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md
notion_migration_audit: docs/planning/NOTION_TO_REPOSITORY_MIGRATION_AUDIT_2026-08-28.md
notion_migration_state: MERGED_MAIN_READ_BACK__GR_NOTION_MIGRATION_20260828_01
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
product_decision_overlay: docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
product_decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
player_facing_spell_flow: GLYPH_TO_SPELL_TO_TARGET_TO_CAST
player_facing_ux_groups: SPELL_BUILD_AND_SPELL_CAST
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK9_USER_VERTICAL_SLICE_VALIDATION
next_product_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CURRENT_MAIN_LOCAL_VALIDATION_PASS
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_delta_existence: OBSERVED_PRESENT
task8_candidate_preservation: OBSERVED_PASS
task8_primary_recovery_branch: feat/task8-spell-use-screen-v2
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_branch: task8/spell-use-screen
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
task9_product_commit: db038a4fd964ca037bfe97f6aee5d0cc7d0daf93
task9_product_pr: 192
task9_status: MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY
task10_ui_hierarchy_issue: 196
task10_ui_hierarchy_pr: 197
task10_ui_hierarchy_merge_commit: 9eca31c52f06ce59afeacea9959075987ffb16ab
task10_ui_hierarchy_status: MERGED_MAIN_RUNTIME_UI_HIERARCHY_REPAIRED
pre_canon_audit_main_readback: 6377cbcf31958fc2b3215d7a9603dfa5f0199c04
task11_visual_surface_pr: 205
task11_visual_surface_status: MERGED_MAIN_BACKGROUND_AND_ACADEMY_THEME_BOUND
task12_direct_glyph_input_pr: 208
task12_direct_glyph_input_status: MERGED_MAIN_CLARIFICATION
task13_result_receipt_pr: 210
task13_result_receipt_status: MERGED_MAIN_RECEIPT_PAYLOAD_RENDERED
greenhouse_spirit_idle_seed_pr: 217
greenhouse_spirit_idle_seed_status: PROJECT_ASSET_APPROVED_IMPLEMENTATION_PENDING
canon_fun_visual_audit_pr: 219
canon_fun_visual_audit_merge_commit: 6ab3dd11a9bff9e5f3c3c9aebd87f63e613c5444
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_release: v3.2.0
higodot_tracked_vendor_release: v3.2.0
higodot_tracked_vendor_subtree: 66a9df59a92f0029efcd35c22fea355c93e8fe49
higodot_tracked_vendor_evidence: docs/validation/HIGODOT_V3_2_0_VENDOR_INTEGRITY.json
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_current_reconciliation_readback: LIVE_V3_2_0_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: TASK9_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE_READY
three_screen_runtime_historical: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

`authority_sync_local_observation` / `authority_sync_godot_observation`은 이전 authority sync 당시의 역사 관찰값이다. 현재 Task8 reconciliation의 local/Godot 실행 증거와 보존 상태는 별도 Task8 receipt가 소유한다.

## 현재 사용자 작업 범위

2026-08-26 사용자는 Visual 시안 검토 뒤 `GM-SPELL-WORKFLOW-UI-V2-01`의 플레이어 노출 흐름을 다음처럼 단순화하는 방향을 명시적으로 승인했다.

```text
글자
→ 주문
→ 대상
→ 시전
```

화면 경험은 다음 두 덩어리다.

```text
주문 만들기
= 글자 선택·작성 + FIVE_POINT_STAR 회로 조합 + 완성 주문 이름 확인

주문 쓰기
= 게임 장면의 대상 지정 + 필요한 최종 Preview + 명시 시전
```

이후 사용자는 Task8과 Task9 제품 구현을 명시적으로 승인했다. Task9 Product Root는 PR #192로 `db038a4` main에 병합됐고, 현재 범위는 `SPELL_WORKFLOW_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE`다.

- Task9/Godot 제품 구현: **MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY**
- Task10/UI hierarchy repair: **MERGED_MAIN_RUNTIME_UI_HIERARCHY_REPAIRED** — product root duplicate descendants were removed; glyph actions and circuit source-panel sizing were repaired. Component Sheet capture samples remain English-safe until the Korean font gate; the current product-facing W6 labels are Korean by approved player-flow direction, while Korean font rights/readability evidence remains `NOT_RUN`.
- Task11/Product Root visual surface: **MERGED_MAIN** — `bg_greenhouse_field_base.webp`와 Academy theme가 Product Root에 실제 연결됐다. 이는 첫 세션 Field/Dialogue/Battle Scene binding이나 Human visual validation이 아니다.
- Task12/direct glyph input: **MERGED_MAIN** — 직접 쓴 글자 입력의 player-facing 설명만 보완했다.
- Task13/result receipt: **MERGED_MAIN** — 실제 result payload의 대상·사용 마력·결과 문장을 Result Panel에 표시한다. 새 경제·전투·보상 authority는 추가하지 않았다.
- PR #217 greenhouse spirit idle seed: **PROJECT_ASSET_APPROVED_IMPLEMENTATION_PENDING** — 투명 PNG와 provenance는 존재하지만 battle Scene binding·Godot import·runtime evidence는 아직 없다.
- Frostbloom W6 preservation priority: **MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS** — `희귀 묘목 우선`과 `온실 구조 우선`은 같은 위협을 서로 다른 방식으로 보존하는 두 유효한 대상 우선순위다. Product Root는 W6 typed Resource의 `FROST_SEEDLINGS` / `GREENHOUSE_STRUCTURE`를 사용하고, 기존 Target/Preview/Explicit Cast/Result authority를 재사용한다. 역사 `WARD`/`FLOWER` prototype은 W6 Product Root 정본에서 superseded이며 generic selector 호환 입력으로만 남는다.
- Frostbloom W6 visual board: **SUPERSEDED_BY_USER_APPROVED_WARM_ACADEMY_TONE_LOCK** — 이전 생성 후보는 user-rejected historical exploration이다. 현재 시각 톤은 `GM-VISUAL-TONE-20260828-01`: 학습자 주도·따뜻한 마법학교 실습이며, 사용자 제공 이미지는 reference-only이고 runtime asset이 아니다.
- Frostbloom W6 key-decision scene: **USER_APPROVED_PLANNING_REFERENCE_ONLY** — 사용자는 이 한 장만 W6 계획용 시각 기준으로 확정했다. 묘목(좌)과 균열 구조물/등불(우)의 동등한 보존 가치와 얼굴을 숨긴 성인 초년 마법학교 연구생의 직접 필기를 보존한다. 다른 이미지·runtime asset·Godot 구현·character canon·Human/Device validation은 확정하지 않았다. full five-panel board는 생성 구조 QA에서 `PARTIAL`로 남고, 정확한 흐름/결과 계약은 구조화된 brief가 소유한다.
- W6 단일 구현계약: **USER_APPROVED_L2__L3_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS** — 역사 `WARD`/`FLOWER`와 difficulty/Mana 차이 prototype은 Frostbloom 정본이 아니며 Product Root의 W6 typed Resource로 대체됐다. 사용자는 L2 review gate에서 `진행해`로 승인했고, L3는 typed Godot Resource 한 개로 target 의미/forecast/receipt를 소유한다. PR #245 exact head `b0f34b5`의 적용 가능한 checks 통과 뒤 squash merge `713bfbf`가 main에 반영됐다. owner: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md`; traceability: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`; receipt: `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`; Issue #242 is closed.
- 다음 W6 evidence gate: **W6_HUMAN_PLAYER_DEVICE_PERFORMANCE_ACCESSIBILITY_EXPORT_FULL_SLICE** — 자동화와 1280×720 런타임 스모크는 main에 병합됐지만, 사람/플레이어·기기·성능·접근성·export·full slice 검증은 아직 `NOT_RUN`이다. 이 gate는 기존 제품 gate `TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING`를 대체하지 않는다.
- Notion: **RETIRED_AS_CURRENT_CANON_AND_WORK_SURFACE__MIGRATION_COMPLETE** — GitHub repository가 사람용·구조화된 정본을 모두 소유한다. `GR-NOTION-MIGRATION-20260828-01`은 PR #238 merged main `1a30b9e0715b1d19e56e24f256f695b869369ca2` readback으로 완료됐다. Notion은 historical discovery-only이며 routine read/write/delete/archive/export/destination readback은 금지한다. owner: `docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md`.
- 적대적·조사·구현가능성 게이트: **USER_APPROVED_ACTIVE** — 모든 material work는 fresh external research check, actual implementation-feasibility recheck, adversarial attack/validate를 거친다. L1 기획·implementation·PR·정본 교정은 최소 다섯 번의 full-scope loop와 post-merge readback을 요구한다. owner: `docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md`. W6의 현재 판정은 `PARTIAL_EVIDENCED__MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS`; 사용자 L2 review, changed-head execution과 main readback은 완료됐고 Human/Player evidence는 남아 있다.
- 다음 게이트: **TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING**
- 이미지 후보 생성: **USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY** — canon·consumer·rights preflight 후 후보는 재승인 없이 생성하며, final lock·runtime use·production batch만 사용자 확정이 필요하다.
- Google Sheet 신규 canon write: **FORBIDDEN / MIGRATION_ONLY**
- unrelated open PR: **READ_ONLY**

현재 revision/implementation owner:

`docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md` + `docs/planning/TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27.md`

## 현재 제품 현실

Frostbloom 00~46분 첫 세션 기획은 완료됐지만 제품 구현은 `PARTIAL_FOUNDATION`이다. 현재 `project.godot` 기본 실행점은 `res://src/ui/spell_workflow/spell_workflow_product_root.tscn`이며 역할은 `DEVELOPMENT_PRODUCT_ROOT_ENTRY`다. 기존 Star Harness는 삭제하지 않고 별도 POC 장면으로 보존한다. 이는 완성형 첫 세션 전체 승격을 뜻하지 않는다.

Star Circuit Runtime과 Component Sheets A–D에는 자동화/렌더 evidence가 있다. 이 component evidence와 전체 제품 상태를 혼동하지 않는다. `FULL_VERTICAL_SLICE_NOT_RUN`, `HUMAN_NOT_RUN`, `DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`은 유지한다.

## Workspace authority

```text
Repository
→ 사람이 읽는 Markdown 기획 / 결정 / Visual / Asset / Flow / Work
→ JSON / game data / code / Scene / Resource / Test / runtime evidence

Notion
→ HISTORICAL_DISCOVERY_ONLY
→ routine read/write / destination readback / delete / archive / export 금지

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
```

Google Sheet와 Notion의 과거 문구는 current authority가 아니다. `GR-NOTION-MIGRATION-20260828-01`은 main readback까지 완료됐고, Notion은 사용자가 명시적으로 허용한 historical discovery에만 읽는다. 신규 정본은 GitHub repository Markdown/JSON이며 external canon write는 하지 않는다.

## 현재 Player-facing Spell Workflow

```yaml
player_flow:
  - 글자
  - 주문
  - 대상
  - 시전
ux_group_1:
  name: 주문 만들기
  includes:
    - 글자 선택·작성
    - FIVE_POINT_STAR 회로 조합
    - 완성 주문 이름 확인
ux_group_2:
  name: 주문 쓰기
  includes:
    - 게임 장면에서 대상 지정
    - 필요한 최종 Preview
    - 명시 시전
```

플레이어 UI 기본 용어에서는 `Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`를 먼저 가르치지 않는다. 내부 구현·데이터·테스트 정본에서는 이 용어와 authority를 그대로 유지한다.

플레이어 용어 매핑:

```text
Stock / Vault source → 글자 / 보관 글자
Stage2 placement → 주문 회로
PreparedSpell → 완성 주문 / 완성 주문 이름
Stage3 target selection → 대상
Stage3 explicit commit/use → 시전
```

회로 조합 결과는 숫자 목록보다 **완성 주문 이름**을 먼저 읽게 한다. 단, 실제 이름 생성 문법·조사·로컬라이징·중복 처리·효과 수치와의 대응 규칙은 이번 결정에서 새로 발명하지 않으며 별도 설계 대상이다.

완성 주문 선택 뒤 별도의 복잡한 대상 선택 전용 화면을 필수 가정하지 않는다. 권장 UX는 **게임 장면 유지/복귀 → 대상 직접 선택 → 필요한 Preview → 시전**이다.

## 현재 Visual authority

```yaml
base_style_lock:
  decision: ART-STYLE-01
  name: Soft Storybook Cel 2D Hybrid
  source_edit_regenerate_recompose: PROHIBITED_WITHOUT_EXPLICIT_USER_OVERRIDE
current_overlay:
  decision: GM-VISUAL-DIRECTION-20260825-01
  logo: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
  style: MAGIC_ANIME_EMPHASIS_OVER_STORYBOOK_ENVIRONMENT
representative_screen_boundary:
  decision: GM-REPRESENTATIVE-SCREENS-20260825-01
  dialogue: APPROVED_REFERENCE
  battle_spell_mood_and_composition: APPROVED_REFERENCE
  battle_spell_system_ui: REWORK_REQUIRED_AGAINST_CURRENT_CANON
movement:
  previous_3d_like_presentation: USER_REJECTED
  current_direction: SIMPLE_2D_MOVEMENT_OR_SCENE_TRANSITION
```

Current coverage summary:

```text
REUSE
- Logo 01 / approved style
- Component Sheets A–D / semantic UI family

ADAPT
- dialogue
- glyph drawing
- typed glyph Vault/Stock presentation
- spell name/result presentation
- feedback/VFX
- Result/Grimoire
- simple 2D movement/scene transition
- initial companion
- font/icon support

CREATE
- Frostbloom environment candidates
- first-session character half-body set
- Frostbloom focal threat/entity

DEFER
- Task8 implementation-bound final use visual until product implementation is authorized/reconciled
- store/key art
- long-term companion growth forms

CUT
- new 3D exploration asset family
- current Slice multi-enemy wave asset family
- baked functional text/numbers/state truth
```

## 최근 Spell Visual 검토 결과

Stage2 시안은 FIVE_POINT_STAR 흐름을 읽는 데는 유효했지만, 처음 생성본의 글자가 세로 패찰/부적처럼 보이는 문제가 있었다. 후속 수정에서 사용자는 이전 글자 작성 시안의 **간략한 직접 필기형 마법 문자**를 재사용하는 방향을 승인했다.

현재 시각 규칙:

- 글자는 부적·패찰·카드보다 획/필기감이 있는 직접 쓰인 문자로 보인다.
- 회로 슬롯에는 패찰을 꽂기보다 글자를 직접 놓거나 쓰는 느낌을 우선한다.
- `준비 주문`보다 **완성 주문 / 완성 주문 이름**을 플레이어 결과 라벨로 우선한다.
- `대상 / 시전`은 게임 장면과 연결된 두 번째 UX 덩어리로 취급한다.
- 사용자 메시지는 새 이미지 생성 요청이 아니므로 이 work unit에서 추가 이미지를 만들지 않는다.

## Spell Workflow 내부 authority

```yaml
task3:
  pr: 104
  scope: IMMUTABLE_PREPARED_SPELL_AND_EXACTLY_ONCE_INVENTORY
task4:
  pr: 105
  scope: STAGE2_ATOMIC_GLYPH_PREPARATION
task5:
  pr: 106
  scope: STAGE3_TARGET_USE_ATOMIC_TRANSACTION
task6:
  pr: 108
  scope: GLYPH_DRAWING_WORKFLOW_SCREEN
  player_group: 주문 만들기
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
  player_group: 주문 만들기
next_product_task: TASK8_SPELL_USE_SCREEN
next_product_player_group: 주문 쓰기
```

이번 간략화는 내부 transaction authority를 변경하지 않는다. Task8은 기존 Task5 Stage3 authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다. 자동 target·자동 commit·회로 자동 최적화도 금지한다.

역사 compatibility locator:

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
```

현재 continuation state:

```yaml
product_status_historical: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
resume_gate: TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
historical_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
current_execution_subgate: TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
```

`8c611f...`는 당시 local Git baseline이지 Task8 product commit이 아니다. 과거 `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 그때 관찰한 uncommitted worktree의 역사 evidence다.

2026-08-24 사용자 PC read-only recovery probe로 두 로컬 Task8 후보가 실제 존재함을 확인했고, 이어 병합된 preservation tool을 실행해 외부 snapshot으로 보존했다. 직접 반환된 receipt는 `TASK8_CANDIDATES_PRESERVED`, `source_unchanged=true`, `source_content_unchanged=true`이며 primary 11 files, secondary 33 files가 snapshot에 기록됐다.

따라서 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`와 candidate-preservation gate는 닫혔다. compatibility consumer 검색을 위해 locator 문자열은 보존하지만 current gate로 재해석하지 않는다. 2026-08-27 current-main reconciliation은 새 clean worktree와 live Godot AI v3.2.0 세션에서 `6821106`으로 재작성·검증됐으며, exact-head CI·review·merge는 아직 남아 있다. 상세 증거는 `docs/planning/TASK8_CURRENT_MAIN_RECONCILIATION_2026-08-27.md`가 소유한다.

제품 구현이 다시 명시적으로 승인되면 역사 worktree에 pull/rebase/clean을 하지 않고 fresh `origin/main`에서 별도 clean reconciliation worktree를 만든다. 이후 exact-project HiGodot readback을 거쳐 primary v2를 우선 복구하고 secondary는 parity evidence로만 비교한다.

## Sync21 continuation / executor boundary — historical compatibility anchors

아래 문자열은 과거 handoff 탐색과 machine consumer compatibility를 위해 보존한다. r5.4의 current GPT→local Codex 운영 방식으로 재승격하지 않는다.

```text
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

Remote authority readback은 local worktree/HEAD/HiGodot evidence를 대체하지 않는다. 현재 r5.4의 local Codex policy는 retired이며, 위 문자열은 current orchestration instruction이 아니라 historical locator다.

## Base proposal / learning closure provenance

```yaml
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
```

이 값들은 Sync21 handoff가 닫은 역사 provenance이며 r5.4 전환이 새로운 Base implementation authority를 부여하지 않는다.

## Tool authority

- Current tracked project vendor: HiGodot/Godot AI `v3.2.0`, exact plugin subtree `66a9df59a92f0029efcd35c22fea355c93e8fe49`; see `docs/validation/HIGODOT_V3_2_0_VENDOR_INTEGRITY.json`.
- Historical project tool provenance: HiGodot/Godot AI `v3.1.2`–`v3.1.4`, GUT `v9.7.1`, Hera `v1.0.0`. Historical live receipts do not prove a current v3.2.0 session.
- r5.4는 project-specific local Codex home/binary/port를 current invariant로 사용하지 않는다.
- 실제 shared Godot/Godot AI runtime/session readiness는 fresh local executor/session readback 없이 주장하지 않는다.
- historical live receipts는 현재 local readiness를 자동 증명하지 않는다.

## PR #151 / current open PR boundary

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 **병합 완료**된 current-main 역사다. Component Sheet A–D와 semantic UI pack은 병합된 사실로 읽되, 이것이 Task8 또는 Human/Device/Performance/Full Slice PASS를 의미하지 않는다.

2026-08-26 이번 work unit 시작 시 live open PR은 PR #166 하나이며 `README.md`만 변경하는 Draft other-workstream이다. `OPEN_PR_READ_ONLY_BY_DEFAULT`로 유지하고 이번 current-task branch에 흡수하지 않는다.

## v4.8 migration / legacy snapshot boundary

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`는 v4.5 시기의 장기 machine snapshot을 보존한다. v4.8 thin-adapter 전환 후에는 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 사용하고 새 current decision/gate를 기록하지 않는다.

현재 authority chain:

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
→ docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
→ task/domain-specific current owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

## 제품 구현을 다시 시작할 때의 순서

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. 새 player-facing overlay를 Task8 UI 용어·동선에 매핑하고 기존 Stage3 authority와 충돌 없는지 확인
4. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
5. Task8 product PR / exact-head CI / merge / merged-main readback
6. Task9 Product Root + responsive/E2E integration
7. 대표 00~10분 Human Slice
8. 10~23 → 46분 증거 확장
```

## 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
TASK8_CURRENT_MAIN_LOCAL_VALIDATION_PASS_PR_PENDING
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
RUNTIME_VISUAL_COMPLETE_NOT_PROVEN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```
