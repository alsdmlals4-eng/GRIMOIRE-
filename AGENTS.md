# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다. 세부 시스템 수치와 콘텐츠 규칙은 연결된 최신 승인 책임 원본을 우선한다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
work_mode: GPT_CREATIVE_PLANNING_AND_CODEX_HANDOFF
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
current_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL
current_approved_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
grill_me_batch_counter: 4/10
pending_decisions: 4
local_godot: USER_CONFIRMED_INSTALLED
current_gpt_focus: FROSTBLOOM_UX_MAP_WIREFRAME_AND_ART_DIRECTION
foundation_poc_technical_plan: READY_FOR_LATER_CODEX_SESSION
foundation_poc_product_code: NOT_STARTED
codex_execution: DEFERRED_UNTIL_SELECTED_CREATIVE_SCOPE_IS_READY
runtime_validation: NOT_RUN
```

현재 브랜치·pending Decision·카운터의 기계 권위는 `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`이다.

## 2. 역할 분리

```text
GPT
→ 핵심 재미를 정의·검증한다.
→ 콘텐츠·스토리·대사·UX·이미지·아트를 설계한다.
→ 적대적 검토로 충돌·누락·제작 비용을 찾는다.
→ 승인된 결과를 GitHub·Sheet에 같은 Decision ID로 동기화한다.
→ 선택된 범위만 Codex 구현 명세로 넘긴다.

Codex
→ 승인된 명세를 Godot에서 실제 구현한다.
→ project.godot·GDScript·Scene·Resource·테스트·CI를 만든다.
→ Runtime·실기기·성능 증거를 실제 실행으로 남긴다.
```

GPT 대화에서 개발환경 설치·Godot 프로젝트 생성·GDScript 구현을 주 작업으로 삼지 않는다.

## 3. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. 최신 승인 Decision 책임 원본.
6. `docs/DEVELOPMENT_GATES.md`.
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
8. 실제 코드·Scene·Resource·데이터·자산·테스트.
9. 고정 Base Release·Evidence.
10. Legacy·과거 대화·외부 AI 결과·추정.

## 4. 복원 순서

GPT 기획 작업:

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md
→ 질문 주제의 최신 승인 책임 원본
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
→ docs/planning/sync/GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
```

Codex 구현 작업:

```text
공통 정본
→ docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md
→ docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md
→ docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다. 확정된 결정을 기억 확인 목적으로 재질문하지 않는다.

## 5. Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

- `skills/PROJECT_BASE_ADAPTER.json`만 편집 가능한 프로젝트 통합 권위다.
- 생성물은 직접 편집하지 않고 Generator로 갱신·검사한다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- Trigger에 맞는 최소 Skill을 사용하되 필수 품질 Gate를 생략하지 않는다.
- Codex Build는 승인된 구현 Scope 안에서만 실행한다.

## 6. 모든 실질 작업의 필수 루프

```text
현재 정본·실제 상태 조회
→ 사용자 의도와 결정 질문 정의
→ QUICK / STANDARD / DEEP 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT / ADAPT / REJECT
→ 중립 권장안
→ 사용자 승인 또는 위임 범위 확인
→ GitHub·Sheet 같은 Decision ID 동기화
→ 적대적 검토
→ UTF-8·NFC·Text Integrity Gate
→ 최신 HEAD CI·Review·Readback
```

사용자 의견에 자동 동의하지 않는다. 최소 두 대안을 비교하고 권장안에도 반대 질문을 적용한다.

## 7. GPT 창의 기획 범위

책임 원본: `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`.

### 핵심 재미

- 플레이어가 반복해서 하고 싶은 가장 뾰족한 행동을 정의한다.
- 직접 작성·Stock·소환수 선택이 상황에 따라 달라지는지 검증한다.
- 정답 맞히기가 아니라 해석·응용·책임의 재미를 유지한다.
- 입력 실패·문법 실패·상황 판단 실패를 구분한다.
- 마도서 복기가 다음 주문 발견과 성장으로 이어지게 한다.

### 콘텐츠·UX·아트

- Vertical Slice 대표 플레이 사이클과 1학년 콘텐츠.
- 사건·적·환경 퍼즐과 주문 결과·대가.
- Main·Grimoire·수업·제작·현장·전투 전체 UX.
- 작성 Canvas·후보·Commit·결과 설명.
- Mobile Safe Area·터치·텍스트 크기·접근성.
- 마법학교·마도서·글자·주문·소환수·환경 Art Direction.
- Concept Art·Moodboard·Key Art·UI Mockup·Asset Brief.

## 8. GPT 적대적 검토

- 핵심 재미를 강화하는가, 장식만 늘리는가.
- 기존 시스템과 중복·충돌하는가.
- 모바일 화면에서 읽히고 조작 가능한가.
- 콘텐츠 제작량과 QA 비용이 현실적인가.
- 이미지 시안이 UX와 플레이 공간을 방해하지 않는가.
- Vertical Slice에서 실제 검증 가능한가.
- 선택·Commit·결과·복기의 연결이 끊기지 않는가.
- 교수·NPC 예시가 정답표로 변하지 않는가.
- 대표 패턴 밖의 합리적 해결을 거부하지 않는가.

## 9. 승인된 프로젝트 코어

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 조합해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

비타협:

- 의미를 가진 글자와 `메인 글자 1개 + 연결·보조 문법`.
- 신규·미숙·중요 글자의 직접 작성.
- 상황·목표·위험에 따른 설계 판단.
- 명시적 Commit과 설명 가능한 세계 변화.
- 입력 실패·문법 실패·상황 설계 실패 분리.
- 학습→응용→책임→복기→발견 순환.

```text
상황·위험 판독
→ 직접 작성·Stock·소환수 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 예상과 실제 결과 비교
→ 마도서 기록·복기·발견
```

## 10. Vertical Slice 글자·사건 계약

책임 원본: `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`.

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs: [FOCUS, DISPERSE]
representative_known_circuit: HEAT_PLUS_FLOW
safe_grammar: MAIN_1_PLUS_CONNECTION_AND_OPTIONAL_SUPPORT
```

이 계약은 과거 `FLOW main` 계약을 명시적으로 대체한다.

교수의 외곽 회로:

```yaml
role: ONE_VALID_EXAMPLE_NOT_CANONICAL_ANSWER
required_player_route: false
default_best_solution: false
used_as_grading_key: false
copy_action: false
```

- 교수의 방식은 “이렇게도 해결할 수 있다”는 한 가지 예시다.
- 플레이어는 시설 복구·생존 확보·정령 안정화·봉쇄·제압 또는 대표 패턴 밖의 방법을 선택할 수 있다.
- 판정은 교수 방식과의 일치가 아니라 글자 의미·경로·목표·대가·상태 변화로 수행한다.
- 자동 글자 판독 오버레이를 사용하지 않는다.
- 키워드는 텍스트 노벨 조사로 확인한다.
- 관찰 결과는 감각과 실제 변화만 표시한다.

## 11. 학교 위기 교육 계약

```yaml
L0: OBSERVE_NORMAL_NONLETHAL_FAILURE
L1: NARROW_MISSED_CONDITION_WITHOUT_NAMING_SOLUTION
L2: CLEAR_SAFETY_WARNING_BEFORE_IRREVERSIBLE_DANGER
L3: DIRECT_LIFESAVING_INTERVENTION_ONLY
```

교수는 핵심 목표를 대신 해결하지 않는다. 철수·봉쇄·지원 요청은 자동 실패가 아니다.

## 12. 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

## 13. Stock 계약

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n의 충전시간 = 10 + 5 × (n - 1)초
```

## 14. Summon 계약

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slots: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
summon_duration_limit: NONE
resummon_cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
same_time_event_order: [MAIN, S1, S2, S3]
```

- 보조 역할은 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`다.
- 같은 보조 역할 중복은 Slice에서 금지한다.
- 자동 공격은 불안정도 `1` 아래 또는 마지막 해결 Event를 만들 수 없다.

## 15. State·Ledger·Save 계약

- 보조 `slot_id`와 `primary_role`은 Slice에서 각각 유일하다.
- 소환·교체·마나·활성은 한 Transaction이다.
- Stock 소비와 결과 적용은 한 Transaction이다.
- Exactly-once 소유자는 `ResultLedger`다.
- 손상 Snapshot은 자동 덮어쓰지 않는다.
- Background·Offline 경과로 공격·치유·Stock 지원을 생성하지 않는다.

## 16. Mobile Summon HUD 계약

```yaml
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_tests: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
hud_mutates_gameplay_state: false
```

## 17. Godot·Codex 보관 상태

```yaml
user_pc_godot: USER_CONFIRMED_INSTALLED
local_binary_path: TO_BE_RESOLVED_BY_CODEX
local_exact_version: TO_BE_VERIFIED_BY_CODEX
ci_actual_version: 4.7.1.stable.official.a13da4feb
ci_headless: PASS
ci_export_templates: PASS
product_project: NOT_CREATED
product_code: NOT_STARTED
codex_handoff: READY
codex_execution: DEFERRED_UNTIL_SELECTED_CREATIVE_SCOPE_IS_READY
```

실제 구현 시 기존 로컬 설치를 우선 사용한다. `tools/setup_godot_toolchain.py`는 기존 설치를 사용할 수 없을 때만 복구 수단으로 사용한다.

## 18. Text Integrity Gate

```yaml
encoding: UTF-8_NO_BOM
unicode_normalization: NFC
replacement_character_u_fffd: PROHIBITED
invalid_control_characters: PROHIBITED
known_mojibake_patterns: PROHIBITED
json_parse: REQUIRED_FOR_JSON
```

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## 19. 현재 허용·금지

GPT에서 허용:

```text
핵심 재미·콘텐츠·UX·이미지·아트 기획
벤치마킹·브레인스토밍·적대적 검토
Wireframe·Concept Art·Moodboard·UI Mockup
이미지 생성 Prompt·Asset Brief
Codex 구현 명세·Acceptance Criteria
GitHub·Sheet 정본 동기화
```

GPT에서 현재 금지:

```text
제품 project.godot·GDScript·Scene 구현을 주 작업으로 진행
로컬 Godot Runtime을 실행했다고 주장
검증하지 않은 Runtime·Device·Performance·Accessibility·Human PASS 주장
교수 예시를 유일·필수·최적 정답으로 취급
대표 패턴 밖의 합리적 해결을 자동 거부
```

Codex에서 이후 허용:

```text
승인된 Foundation POC Scope의 project.godot·GDScript·Scene·테스트·CI
실제 로컬 Godot 버전·Headless·Runtime 검증
Validation Report·Stop Gate·Draft PR
```

## 20. 다음 작업

1. `서리꽃 온실의 심장` 사건 UX Map.
2. Mobile Landscape 텍스트 노벨·조사·주문 설계 Wireframe.
3. 온실·열 회로·서리 정령 Art Direction.
4. 장면별 배경·표정·VFX Asset Brief.
5. 선택된 기획 범위만 Codex 구현 명세로 넘긴다.
6. 실제 Godot 구현은 이후 Codex 세션에서 진행한다.
