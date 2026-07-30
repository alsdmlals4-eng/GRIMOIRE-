# GRIMOIRE Documentation Map

## 현재 기준

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning_complete: true
next_product_gate: ART-STYLE-01
canon_sync_policy: GM-CANON-SYNC-01
canon_sync_state: SYNCED_TO_WORKING_BRANCH
```

## 1. 시작 경로

```text
README.md
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 질문 주제의 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ docs/planning/CANON_SYNC_STATE.json
→ skills/PROJECT_BASE_ADAPTER.json
→ skills/PROJECT_SKILL_SNAPSHOT.json
```

## 2. 활성 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| 최상위 작업 규칙 | `AGENTS.md` | `ACTIVE_PROJECT_AUTHORITY` |
| 시작·다음 작업 | `START_HERE.md` | `ACTIVE_ENTRYPOINT` |
| 현재 상태·위험·다음 작업 | `docs/ACTIVE_CONTEXT.md` | `ACTIVE_CONTEXT_AUTHORITY` |
| 확정 결정 복원 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | `ACTIVE_FIRST_READ_AUTHORITY` |
| 최신 사용자 승인 | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md` | `ACTIVE_LATEST_USER_DECISION_AUTHORITY` |
| 기획 완결 정본 | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` | `ACTIVE_APPROVED_PLANNING_CANON` |
| 벤치마킹 원칙 | `docs/planning/PROJECT_BENCHMARKING_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 기획 정본 즉시 동기화 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` | `ACTIVE_PROJECT_WORK_PRINCIPLE` |
| 동기화 계획 데이터 | `docs/planning/CANON_SYNC_STATE.json` | `ACTIVE_MACHINE_READABLE_SYNC_STATE` |
| 최신 동기화 영수증 | `docs/planning/sync/GR-SYNC-20260731-04.md` | `SYNCED_TO_WORKING_BRANCH_READBACK_PASS` |
| 현재 벤치마킹 결과 | `docs/planning/benchmarks/GRIMOIRE_BENCHMARK_PASS_2026-07-31.md` | `COMPLETED_STANDARD_BENCHMARK` |
| 기획 적대적 검토 | `docs/planning/GRIMOIRE_PLANNING_ADVERSARIAL_REVIEW_2026-07-31.md` | `PASS_WITH_CORRECTIONS_APPLIED` |
| Gate 1 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| Vertical Slice 기본 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `ACTIVE_APPROVED_CONTRACT_WITH_LATEST_ADDENDA` |
| 시각·전투 표현 | `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 캐릭터 표현 | `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 소환수 코어 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED` |
| 소환수 성장·형상 | `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md` | `CONFIRMED_DIRECTION` |
| 마법 작성 UX | `docs/UX_UI_SYSTEM.md` | `ACTIVE_DOMAIN_SOURCE_WITH_PC_ADAPTATION_ADDENDUM` |
| 개발 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| 문서 라우터 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| Base 핀 | `docs/BASE_RULES_VERSION.md` | `ACTIVE_VERSION_AUTHORITY` |
| GDD Sheet 계약 | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | `USER_FACING_GDD_WORKSPACE_CONTRACT` |
| Base adapter | `skills/PROJECT_BASE_ADAPTER.json` | `ACTIVE_APPLICATION_BINDING_RECONCILIATION_PENDING` |
| Skill snapshot | `skills/PROJECT_SKILL_SNAPSHOT.json` | `GENERATED_ROUTE_VIEW_RECONCILIATION_PENDING` |

## 3. 기획 계보

```text
Gate 1 콘셉트·Slice 승인
→ 2026-07-31P 기획 우선 순서
→ 기획 완결 제안서
→ 벤치마킹 패스
→ 적대적 검토
→ 2026-07-31Q 사용자 승인
→ 기획 완결 정본
→ 2026-07-31R 즉시 정본·Sheet 동기화 원칙
→ GR-SYNC-20260731-04 working branch 동기화 검증
```

- 제안서: `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
- 승인 정본: `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
- 즉시 동기화 정책: `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- 동기화 영수증: `docs/planning/sync/GR-SYNC-20260731-04.md`

## 4. 벤치마킹 경로

```text
PROJECT_BENCHMARKING_POLICY
→ QUICK / STANDARD / DEEP 선택
→ benchmarks/ 산출물
→ ADOPT / ADAPT / REJECT
→ 프로젝트 설계 문서
→ 적대적 검토
→ 사용자 승인
→ PROJECT_CANON_SYNC_POLICY
```

## 5. 기획 정본 동기화 경로

```text
Decision ID 확정
→ Decision Addendum·분야 정본·Snapshot·Active Context
→ 계획 데이터·Registry·Documentation Map
→ authority commit
→ 연결된 Google Sheet 탭·행
→ 양쪽 재조회
→ 동기화 영수증
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합 후 main·Sheet 재검증
→ SYNCED_TO_MAIN
```

필수 Sheet 위치:

- `02_현재_확정결정`
- 해당 도메인 탭
- `04_누락_충돌_감사`
- `99_변경이력`

Gate·현재 단계 변경 시 추가:

- `00_프로젝트_허브`
- `01_작업순서`
- `05_GDD_요약`

## 6. 다음 제품 경로

```text
ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 구현
```

## 7. Legacy·참고 자료

| 자료 | 역할 |
|---|---|
| v6·v8 Vertical Slice 계약 | `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY` |
| `docs/planning/SPELL_GAME_DESIGN.md` | `LEGACY_REFERENCE_CANDIDATE` |
| Android 터치 연구 | `REFERENCE_CANDIDATE / NOT_PC_RUNTIME_VALIDATED` |
| 합성 입력 검증 Artifact | `RESEARCH_EVIDENCE / NOT_HUMAN_VALIDATION` |
| 생성 이미지 | 승인 상태별 참고, 자동 시스템·런타임 자산 아님 |

## 8. 질문 전 조회

```text
AGENTS
→ START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ 최신 Decision Addendum
→ GRIMOIRE_PLANNING_CANON
→ 주제별 책임 원본
→ CANON_SYNC_STATE
→ 최신 Sync Receipt
```
