# GRIMOIRE 정본 상태 색인 — 2026-08-05 체크포인트

> 파일명에 `DRAFT`, `WORKING`, 과거 날짜, `CURRENT`, `proposal`이 남아 있어도 이 문서가 현재 참조 가능 여부를 판정한다.

## 표기

| 표기 | 의미 |
|---|---|
| `[활성]` | main 현재 정본 |
| `[승인·병합 대기]` | 사용자가 승인했으나 Draft PR 병합 전 |
| `[활성 연결 콘텐츠]` | 과거/DRAFT 이름이지만 승인 래퍼가 승격 |
| `[부분 대체됨]` | 명시 범위만 유효 |
| `[대체됨]` | 현재 참조 금지, Git 이력만 보존 |
| `[보류]` | 현재 실행 지시 아님 |
| `[구현 계획]` | 승인 범위를 구현하는 TDD 계획, 실행 전 |
| `[구현완료 보관]` | 완료 이력, 재실행 지시 아님 |
| `[폐기]` | 현재 설계에서 사용하지 않음 |
| `[이력]` | 당시 상태 증거, 현재 권위 아님 |

## 현재 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
draft_sync: GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS
working_pull_request: 61
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
pending_decisions: 3
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
current_gate: IMPLEMENTATION_PLANS_READY
merge_authorized: false
```

## 복원 순서

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → DOCUMENTATION_MAP → Planning README → 이 색인 → CURRENT_CONFIRMED_DECISIONS → 자원 승인·Spec → 운영 승인·Spec → Vocabulary 승인·Spec → 구현 계획 2종 → 3×3/Frostbloom → Batch → Sync 02 → PR #61`.

## 승인·병합 대기

### `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`

- 승인: `GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`.
- 상세 설계: `2026-08-05-glyph-vault-universal-stock-design.md`.
- 책임 원본: `STOCK_SYSTEM.md`, `STOCK_CAPACITY_SYSTEM.md`, `STOCK_CHARGE_TIME_SYSTEM.md`, `STOCK_HIT_PAUSE_SYSTEM.md`, `MANA_SYSTEM.md`, `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 구현 계획: `2026-08-05-glyph-resource-foundation-poc-implementation-plan.md` `[구현 계획]`.
- 상태: `[승인·병합 대기 / Spec 검토 완료]`.

### `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01`

- 승인: `WORKFLOW_BENCHMARK_TDD_CHECKPOINT_01_APPROVAL_2026-08-05.md`.
- 상세 설계: `2026-08-05-benchmark-tdd-checkpoint-governance-design.md`.
- 상태: `[승인·병합 대기 / Spec 검토 완료]`.

### `GM-GLYPH-VOCABULARY-V1-01`

- 승인: `GLYPH_VOCABULARY_V1_01_APPROVAL_2026-08-05.md`.
- 상세 설계: `2026-08-05-glyph-vocabulary-v1-proposal.md` — 파일명은 proposal이지만 승인 래퍼에 의해 `[승인·병합 대기]`로 승격.
- 구현 계획: `2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md` `[구현 계획]`.
- 의미 범위: 핵심 10·보조 10.
- Runtime Slice: `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST`.
- 확대 Gate: `HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION`.

## 활성 main

### 주문·회로

- 3×3 인접 방향 회로 문법.
- 주문 Commit 마나 사용.
- 대상·연결선 자원 비용 0.
- 완성 주문 원터치 Stock 금지.

### Frostbloom

- Heat·Flow 승인.
- 복수 해결 Spec·Route Guidance·내부 패턴.
- 학교 위기 교육 승인.
- 대사 승인과 연결 콘텐츠.

### 운영

- main 완료 Batch와 Sync 12.
- Google Sheet workbook·sync policy.

## 부분 대체됨

- `GM-3X3-CIRCUIT-STOCK-FOCUS-01` `[부분 대체됨]`: 3×3 회로·대상·마나·시간 압박은 유지. Typed Glyph Stock, 특정 글자 자연충전, 필사 결과가 같은 글자 Stock, 공용 자원 용량은 새 자원 Decision이 대체한다.
- `THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md` `[부분 대체됨]`.
- `2026-08-04-3x3-circuit-stock-focus-scribing-design.md` `[부분 대체됨]`.
- `STOCK_SYSTEM_01_APPROVAL_2026-08-02.md` `[부분 대체됨]`: Active Pressure 충전·Offline 금지·Transaction 원칙만 계승.
- Narrative multi-solution design: 복수 해결 코어만 유지.
- `SPELL_GAME_DESIGN.md`: 마법학교·학습·응용·복기 코어 입력만 유지.
- `GRIMOIRE_PLANNING_CANON_2026-07-31.md`: 최신 Decision이 변경한 항목 사용 금지.
- `PROJECT_BASE_ADAPTER.json`: Base pin·routing·protected paths·generated outputs만 활성, 상태 Snapshot 비권위.

## 대체됨·폐기

- Heat·Flow Draft, Frostbloom Cast Planning Draft, 과거 Flow-main Scene Spec, 과거 FAIL_CLOSED Review, Legacy `CIRCUIT_SYSTEM.md`.
- `AUTO_SPELL_SYSTEM.md`, Stage 0 Spec·Gate 명칭.
- 완성 주문 원터치 Stock과 Stock 주문 무마나 실행.
- 특정 글자별 자연충전 진행도와 `STOCK_TARGET_SWITCH_SYSTEM.md`.
- 공용 보관함·Stock 용량.
- 교수 회로 정답표·자동 복사.
- 집중 필사 완전 Pause.
- 그림 정확도 위력·마나·추가 자원 보너스.
- 보관함 글자 변환, 미습득 글자 범용 Stock 선택, 자동 자원 출처 소비.
- 낮은 인식 확신 자동 확정과 사람 검증 전 6종 초과 Runtime 확대.

## 보류

상태이상–새 보관함·범용 Stock 연동, 마나 비용 수치, 배포물 SHA-256 고정 검증, Base 공용 정책 승격.

## 구현완료 보관

Godot toolchain setup plan·approval·report·script·tests. 제품 Godot 프로젝트 완료를 뜻하지 않는다.

## Sync·PR

- Draft·Working·Premerge Sync `03-07`부터 `09B`: `[이력]`.
- `GR-SYNC-20260804-10-MAIN`: `[이력/Finalization]`.
- `GR-SYNC-20260804-11-MAIN-READBACK`: `[이력/Readback]`.
- `GR-SYNC-20260804-12-CLOSURE`: `[활성 완료 Sync]`.
- `GR-SYNC-20260805-01-GLYPH-VAULT-STOCK-GOVERNANCE`: `[이력/초기 Draft 체크포인트]`.
- `GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS`: `[승인·병합 대기/Sheet Readback PASS]`.
- PR #61: `[승인·병합 대기/고위험 정본 영향 조기 체크포인트]`.

## 미실행

제품 코드, 3×3 실제 Runtime, 실제 문양 인식률, 모바일 실기기, 성능, 접근성, 사람 의미 인지·피로 검증은 `NOT_RUN`이다. Prototype 수치는 `TEST_VALUE`다.
