# GRIMOIRE Documentation Map

## 1. 현재 문서 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
baseline_branch: main
working_branch: agent/grimoire-v93-canon
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning_complete: false
next_blocker: PLANNING-CONTENT-01
codex: BLOCKED
```

## 2. 시작 경로

```text
README.md
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md
→ docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md
→ 질문 주제의 단일 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
→ skills/PROJECT_SKILL_SNAPSHOT.json
```

## 3. 활성 운영·상태 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| 최상위 작업 규칙 | `AGENTS.md` | `ACTIVE_PROJECT_AUTHORITY` |
| 시작·콜드 스타트 | `START_HERE.md` | `ACTIVE_ENTRYPOINT` |
| 현재 상태·위험·다음 작업 | `docs/ACTIVE_CONTEXT.md` | `ACTIVE_CONTEXT_AUTHORITY` |
| 확정 결정 복원 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | `ACTIVE_FIRST_READ_AUTHORITY` |
| 최신 사용자 작업 순서 | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md` | `ACTIVE_LATEST_USER_DECISION_AUTHORITY` |
| 전체 결정 이력 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_ADDENDA` |
| 기획·개발 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| 문서 라우터 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| Base 버전 | `docs/BASE_RULES_VERSION.md` | `ACTIVE_VERSION_AUTHORITY` |
| GDD Sheet 계약 | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | `USER_FACING_GDD_WORKSPACE` |

## 4. 승인된 제품 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| Gate 1 최종 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| Vertical Slice 구조·문제 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `ACTIVE_APPROVED_CONTRACT_WITH_PLATFORM_ADAPTATION_PENDING` |
| 화면·전투 표현 | `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 캐릭터 표현 | `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 소환수 2계층 코어 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED` |
| 소환수 성장·형상·탑승 | `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md` | `CONFIRMED_LONG_TERM_DIRECTION` |
| 마법 작성·복구 UX | `docs/UX_UI_SYSTEM.md` | `ACTIVE_DOMAIN_SOURCE_WITH_PC_ADAPTATION_PENDING` |
| 에셋 출처·승인 | `docs/ASSET_LICENSE_LEDGER.md` | `ACTIVE_LEDGER` |

## 5. 현재 사용자 검토 문서

| 책임 | 문서 | 상태 |
|---|---|---|
| 기획 누락·충돌 감사 | `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md` | `DESIGN_SPEC_FOR_USER_REVIEW` |
| 대표 글자 후보 | 같은 문서 §4~5 | `RECOMMENDED_CANDIDATE` |
| 주인공·교수·동급생·동반자 | 같은 문서 §6 | `RECOMMENDED_CANDIDATE` |
| 학교·세계 최소 설정 | 같은 문서 §7 | `RECOMMENDED_CANDIDATE` |
| 다섯 Situation Challenge | 같은 문서 §8~9 | `RECOMMENDED_CANDIDATE` |
| 자유일정 A/B/C 효과 | 같은 문서 §10 | `RECOMMENDED_CANDIDATE` |
| PC 입력·모바일 분리 | 같은 문서 §11 | `RECOMMENDED_CANDIDATE` |
| 시간·제작량 예산 | 같은 문서 §12~13 | `RECOMMENDED_CANDIDATE` |

검토 문서는 승인 전 정본 제품 데이터나 구현 요구사항이 아니다.

## 6. 현재 기획 완료 게이트

```text
PLANNING-CONTENT-01
→ PLANNING-PLATFORM-01
→ PLANNING-SCOPE-01
→ PLANNING-REVIEW-01
→ USER_PLANNING_APPROVAL
```

| 게이트 | 상태 | 다음 승격 |
|---|---|---|
| `PLANNING-CONTENT-01` | `USER_REVIEW_REQUIRED` | 콘텐츠 후보 승인·수정 |
| `PLANNING-PLATFORM-01` | `BLOCKED_BY_CONTENT_REVIEW` | PC 입력 계약 |
| `PLANNING-SCOPE-01` | `BLOCKED_BY_CONTENT_REVIEW` | 시간·자산 예산 |
| `PLANNING-REVIEW-01` | `NOT_STARTED` | 합성·적대적·추적성 검수 |
| 사용자 기획 완료 승인 | `NOT_GRANTED` | Art Style 진입 |

## 7. 플랫폼 문서 경계

### PC 우선

- 현재 제품 플랫폼 책임: `CURRENT_CONFIRMED_DECISIONS.md`
- 세부 입력 후보: `GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
- 아직 실행 증거 없음: PC 입력·성능·접근성·사람 검증 모두 `NOT_RUN`

### 후속 모바일

- 기존 Android 터치 연구는 삭제하지 않는다.
- 역할: `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`
- PC 런타임 증거로 사용하지 않는다.
- 모바일판은 공통 콘텐츠·데이터 계약이 안정된 뒤 별도 검증한다.

## 8. 연구·Evidence 문서

다음은 의사결정 근거 또는 검증 설계이며 제품 정본이 아니다.

| 범주 | 대표 경로 | 상태 |
|---|---|---|
| 마법 작성 Evidence Pack | `docs/planning/GATE_2_MAGIC_WRITING_INPUT_EVIDENCE_PACK_2026-07-29.md` | `PILOT_RECOMMENDATION` |
| 사람 검증 Artifact | `docs/superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md` | `HUMAN_VALIDATION_INPUT / NOT_RUN` |
| 합성 검토 계획·보고서 | `docs/superpowers/plans/` 관련 문서 | `T6_AI_INFERENCE` |
| UX 검증 계획 | `docs/superpowers/plans/2026-07-29-ux-ui-validation-plan.md` | `PLAN / NOT_RUN` |

연구 글자, simulated 후보, 합성 결과는 최종 룬·인식률·런타임 성능을 확정하지 않는다.

## 9. Legacy·호환 자료

| 자료 | 상태 | 사용 규칙 |
|---|---|---|
| `docs/planning/SPELL_GAME_DESIGN.md` | `LEGACY_REFERENCE_CANDIDATE` | 현재 확정 결정에 없는 아이디어만 참고 |
| v6 Vertical Slice 계약 | `LEGACY_REFERENCE_INPUT` | 활성 실행 권한 아님 |
| v8 통합 실행문 | `SUPERSEDED_COMPATIBILITY` | 활성 실행 권한 아님 |
| 저장소명 `Spell` | `LEGACY_IDENTITY_ALIAS` | 현재 저장소·프로젝트명 대체 금지 |
| 완성 주문 스톡·복잡한 충전 | `POST_SLICE_REFERENCE` | 초기 Slice 재도입 금지 |
| 소환수 4역할 이미지 | `REFERENCE_CANDIDATE` | 시스템 확정 증거 아님 |

과거 문서는 삭제하지 않되 새 정본보다 높은 권한으로 사용하지 않는다.

## 10. Base·Skill 라우팅

| 책임 | 경로 | 상태 |
|---|---|---|
| Base 적용 원본 | `skills/PROJECT_BASE_ADAPTER.json` | `V9_1_CURRENT / V9_3_MIGRATION_DEFERRED` |
| 생성 Skill 뷰 | `skills/PROJECT_SKILL_SNAPSHOT.json` | `GENERATED_CURRENT_VIEW` |
| 프로젝트 라우터 | `.agents/skills/grimoire-workflow-router/SKILL.md` | `ACTIVE_THIN_ROUTER` |
| 프로젝트 Skill Registry | `skills/SKILL_REGISTRY.json` | `ACTIVE_BUT_BASE_PIN_REFRESH_PENDING` |
| Art Style 결정 Skill | `.agents/skills/art-style-decision-gate/SKILL.md` | `BLOCKED_BY_PLANNING_COMPLETE` |
| 마법 작성 복구 Skill | `.agents/skills/magic-writing-recovery/SKILL.md` | `ACTIVE_PROJECT_LOCAL` |

Base v9.3 어댑터·CI 마이그레이션은 기획 검토를 방해하지 않도록 후속 운영 작업으로 분리한다.

## 11. Google Sheet 매핑

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 현재 쓰기: 금지
- 병합 후 동기화 후보 탭:
  - `00_프로젝트_허브`
  - `01_작업순서`
  - `02_현재_확정결정`
  - `04_누락_충돌_감사`
  - `05_GDD_요약`
  - 승인된 내용에 따라 `11`, `13`, `14`, `15`, `20`, `30`, `40`, `41`, `50`, `52`, `60`, `80`
  - `99_변경이력`

검토 중 후보를 Sheet의 확정 행으로 쓰지 않는다. 병합된 main과 Sheet를 모두 재조회한 뒤에만 `SYNCED`다.

## 12. Art·Codex 라우팅

```text
PLANNING_COMPLETE
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ USER_APPROVED_FOR_CODEX_PLAN
→ Codex read-only Plan
→ 기술 검수
→ 마지막에 구현
```

현재 상태:

```text
ART-STYLE-01 = BLOCKED_BY_PLANNING_COMPLETE
CODEX = BLOCKED
GODOT_PROJECT = NOT_STARTED
RUNTIME = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
