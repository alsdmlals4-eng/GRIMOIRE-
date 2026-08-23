# GRIMOIRE · AI Indie Pattern Adoption — 2026-08-24

```yaml
status: USER_DIRECTED_ADAPTATION
work_mode: PLAN
runtime_mutation: NONE
runtime_ai: TEST_ONLY_NOT_IMPLEMENTED
source_base_merge: dff09d83c3892a70ba5fee86a59d36086889a6c5
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_product_state: PARTIAL_FOUNDATION
full_vertical_slice: NOT_RUN
human_validation: NOT_RUN
```

## 1. 목적

AI-assisted indie 개발 사례의 생산 패턴은 즉시 흡수하되, runtime generative AI는 GRIMOIRE의 `FIVE_POINT_STAR → spell preparation → explicit commit` 권위를 침범하지 않는 제한된 해석기 후보로만 보존한다.

현재 Star Circuit/Spell Workflow의 validator, prepared spell, inventory transaction, commit semantics가 authoritative하다. AI가 이 상태를 직접 소유하거나 우회하지 않는다.

## 2. 판정표

| Base pattern | 판정 | GRIMOIRE 적용 |
|---|---|---|
| HUMAN_DIRECTED_AI_BUILD_LOOP | ADOPT_HIGH | Task9+에서 bounded AI change → GUT/HiGodot/Hera → 사람 판단 |
| SILENT_OMISSION_GATE | ADOPT_HIGH | UI/validator/inventory/result/rollback consumer 누락 공격 |
| CONTEXT_SCOPE_AND_ARCHITECTURE_BUDGET | ADOPT_HIGH | 긴 채팅 대신 현재 정본·Task contract 재수화 |
| BREADTH_AFTER_CORE_IDENTITY_LOCK | ADOPT | Frostbloom first session/full slice 검증 전 주문·glyph breadth 폭증 금지 |
| PLAYER_FEEDBACK_REBUILD_LOOP | ADOPT | 학습 실패가 copy 문제인지 spell grammar 문제인지 분리 |
| AI_VISIBLE_OUTPUT_QUALITY_GATE | ADOPT | 생성 시각/텍스트는 Academy art/copy/rights/readability bar 적용 |
| RNG_AGENCY_AND_RECOVERY | REFERENCE_ONLY | 현재 핵심은 조합/commit이며 RNG를 억지로 추가하지 않음 |
| runtime generative AI | TEST_ONLY | `AI_INTERPRETER_ONLY` 후보 |

## 3. 생산 AI · HUMAN_DIRECTED_AI_BUILD_LOOP

GRIMOIRE의 후속 구현은 다음으로 고정한다.

```text
현재 Canon/Task owner 재수화
→ 사람 acceptance criteria
→ bounded AI change
→ changed-surface + omitted-consumer audit
→ deterministic tests
→ actual Godot interaction/capture where applicable
→ 사람의 학습/마법 감각 판단
→ accept | revise | revert
→ Active Context/evidence refresh
```

AI가 많은 파일을 한 번에 만들 수 있다는 이유로 Task owner를 합치거나 monolith를 만들지 않는다.

## 4. CONTEXT_SCOPE_AND_ARCHITECTURE_BUDGET

각 material change 전에 최소 다음 owner를 적는다.

```text
circuit topology owner
spell composition/validation owner
prepared spell owner
inventory owner
commit/rollback transaction owner
presentation owner
persistence owner
verification owner
```

모델이 과거 결정을 잃는 문제가 반복되면 채팅을 더 길게 유지하는 방식보다 `ACTIVE_CONTEXT + exact task docs + current code`를 재수화한다.

## 5. runtime AI 후보 · AI_INTERPRETER_ONLY

향후 자유 문장/의도 기반 마법 입력이 실제 Player Value로 검증될 경우에만 다음 구조를 시험할 수 있다.

```text
player natural-language intent
→ AI interpretation proposal
→ project-owned structured intent/schema
→ StarCircuit / Spell validator
→ legal prepared spell candidate
→ explicit player review/commit
→ existing deterministic transaction
```

### AI가 할 수 없는 것

- FIVE_POINT_STAR topology 무시.
- 없는 glyph/resource를 생성한 것으로 간주.
- mana/inventory를 직접 변경.
- validator 실패를 “창의적 마법”이라는 이유로 통과.
- explicit commit 생략.
- spell result/canon을 자유 텍스트만으로 authoritative하게 기록.

AI provider가 없거나 느리거나 실패해도 기존 authored/structured spell workflow가 계속 가능해야 한다.

## 6. Runtime AI 도입 전 필수 Gate

```text
PLAYER_VALUE_UNIQUE_TO_AI
CAPABILITY_CONTRACT
DETERMINISTIC_STATE_VALIDATION
MEMORY_CANON_BOUNDARY
LATENCY_OFFLINE_FALLBACK
PRIVACY_MODERATION_SECURITY
COST_SURFACE_APPROVED
REPLAY_DEBUG_EVIDENCE
```

현재는 전부 `NOT_RUN`이다. 따라서 runtime AI implementation은 `DEFER`다.

## 7. Breadth Gate

AI로 glyph/spell/lesson을 대량 생산하기 전에:

- Frostbloom 00~10분에서 Five Point Star의 의미를 이해하는가.
- 조합 → 검증 → commit의 차이를 플레이어가 설명할 수 있는가.
- 실패/invalid circuit이 단순 오류가 아니라 학습 피드백을 주는가.
- Component Sheets와 실제 runtime UI가 같은 의미를 전달하는가.
- full vertical slice Human evidence가 확보됐는가.

이 Gate 전에는 콘텐츠 수를 성과로 취급하지 않는다.

## 8. PLAYER_FEEDBACK_REBUILD_LOOP

Human evidence에서 실패를 다음으로 분류한다.

```text
COPY_OR_CUE
INTERACTION_FRICTION
RULE_COMPREHENSION
SPELL_GRAMMAR_FAILURE
CONTENT_PACING
```

copy/cue 문제를 core grammar 재설계로 과잉 반응하지 않고, 반대로 반복되는 rule comprehension 실패를 문구 수정만으로 덮지 않는다.

## 9. 다음 Codex 범위

1. Task9/Root integration 전 owner map + silent omission checklist 소비.
2. first-session flow에 invalid/valid spell feedback의 causal clarity test 추가.
3. Human QA에서 “왜 이 회로가 유효/무효인지” 설명 가능 여부 기록.
4. runtime AI는 별도 승인된 spike가 생기기 전 구현 금지.
5. AI-assisted content expansion은 full slice evidence 뒤에만 열기.

## 10. Implementation Reality Gate

현재 주장 가능:
- GRIMOIRE 생산 워크플로에 AI-assisted build/context/omission Gate를 적용할 계약이 생김.
- runtime AI가 도입되더라도 deterministic validator/commit 아래에 있어야 한다는 경계가 정의됨.

현재 주장 불가:
- runtime AI가 재미를 높임.
- runtime AI provider/cost/offline 경로가 준비됨.
- full vertical slice/Human/device/performance PASS.

## 11. 적대적 검토 5회

1. **AI novelty 공격** — AI 자체를 재미로 간주하지 않고 unique player value Gate 요구: PASS.
2. **authority 공격** — validator/inventory/commit은 기존 project owner 유지: PASS.
3. **context 공격** — chat history가 아니라 durable current state 재수화: PASS.
4. **breadth 공격** — full slice 전 콘텐츠 폭증 차단: PASS.
5. **evidence 공격** — runtime AI/Human 결과를 NOT_RUN으로 유지: PASS.

`CLEAN_REVIEW_EXIT`.
