# GRIMOIRE Base 규칙 버전

## 현재 채택 기준

| 항목 | 기준 |
|---|---|
| 프로젝트 | `alsdmlals4-eng/GRIMOIRE-` |
| 프로젝트명 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 적용 브랜치 | `main` |
| Base 저장소 | `alsdmlals4-eng/Base` |
| GDD·운영체계 기준 Commit | `c987647d01ad2baa028a16e03d85ddfc1572a727` |
| 동기화 날짜 | 2026-07-29 |
| 통합 실행문 | `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md` |
| v6 계약 | 역사·호환 참고 자료 |
| 현재 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| Google Sheet | `PROJECT_SHEET_CONFIGURED` |
| Workbook 역할 | `USER_FACING_GDD_WORKSPACE` |

이 Commit은 5개 프로젝트에 동일한 GDD Google Sheets 의미 구조를 설치하기 위한 기준선이다. 이후 Base의 UX/UI·합성 테스터 추가 Commit은 프로젝트별 별도 채택·검증 대상으로 두며 자동 덮어쓰지 않는다.

## 저장소 계약 경로

- 프로젝트 최상위 규칙: `AGENTS.md`
- 프로젝트 시작점: `START_HERE.md`
- 현재 결정: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- 문서 지도: `docs/DOCUMENTATION_MAP.md`
- 제품·작업 게이트: `docs/DEVELOPMENT_GATES.md`
- Design Registry: `docs/DESIGN_DOCUMENT_REGISTRY.json`
- Base Skill route: `skills/SKILL_REGISTRY.json`
- 프로젝트 어댑터: `skills/PROJECT_BASE_SKILL_ADAPTER.json`
- 전문 extension route: `skills/BASE_SHARED_SKILL_ROUTES.json`
- GDD Workbook 계약: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- 이미지 생성·검수: `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md`
- v6 축약 실행문: `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- v6 마스터 Manifest: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`

## 적용 우선순위

```text
최신 사용자 요청·승인
→ AGENTS.md
→ CURRENT_CONFIRMED_DECISIONS.md
→ ACTIVE_CONTEXT.md
→ 주제별 책임 원본
→ DEVELOPMENT_GATES.md·DESIGN_DOCUMENT_REGISTRY.json
→ SKILL_REGISTRY.json·프로젝트 어댑터
→ PROJECT_GOOGLE_SHEET_WORKBOOK.md와 실제 Sheet
→ 실제 코드·Scene·Resource·데이터·자산·테스트
→ 고정된 Base Commit
→ 과거 대화·외부 AI 결과·추정
```

## Base 적용 방식

Base Skill 본문을 GRIMOIRE 저장소에 복제하거나 전부 기본 로드하지 않는다.

```text
Base skills/SKILL_REGISTRY.json 자동 Trigger 선택
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ skills/BASE_SHARED_SKILL_ROUTES.json
→ 필요한 전문 extension
→ GRIMOIRE 고유 책임
→ GitHub 정본·Google Sheet·실제 구현 대조
```

현재 필수 extension route:

- `governing-legacy-retention-and-archives`
- `evaluating-godot-assets-and-plugins-before-creation`

## 현재 적용된 Base 책임

| 책임 | Base Skill | 현재 상태 |
|---|---|---|
| 요청 접수·실행 계약 | `managing-project-intake-and-work-contract` | route·contract 적용 |
| 운영체계 | `managing-game-project-operating-system` | 프로젝트 정본·Sheet·Registry 연결 |
| 프로젝트 코어 조사 | `identifying-project-core` | `CORE_CONFIRMED` 보호 |
| 콘셉트·방향 | `analyzing-and-refining-game-concepts` | Gate 1 승인, 명시적 근거 없이 재개방 금지 |
| 기획 문서 | `managing-design-documents` | 정본·결정 원장·Sheet 동기화 책임 |
| Vertical Slice | `designing-vertical-slices` | `DEMO_FIRST_VERTICAL_SLICE`, 구현 전 계획 단계 |
| 적대적 검토 | `running-adversarial-review-and-refinement` | `repository-wide-audit` 포함 |
| 통합 검증 | `reviewing-and-validating-project-changes` | 문서·Sheet 정적 검증, 런타임 `NOT_RUN` |
| 컨텍스트·인계 | `maintaining-project-context-and-handoff` | 승인 결정 후 Active Context 갱신 |
| 이미지 계획·검수 | `designing-art-prompts-and-technique-cards` | 생성 후보와 최종 자산 상태 분리 |

## Sheet 동기화 규칙

1. Sheet는 독립 정본이 아니라 `USER_FACING_GDD_WORKSPACE`다.
2. GitHub에 없는 편집은 `PROPOSED_SHEET_CHANGE`로 보존한다.
3. 승인된 변경은 GitHub 책임 원본·Registry·Sheet에 반영한다.
4. 양쪽을 재조회해 값·상태·책임 경로가 일치할 때만 `SYNCED`로 판정한다.
5. 구현·런타임·사람 검증을 실행하지 않았다면 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`로 남긴다.

## 변경 기록

| 날짜 | 이전 기준 | 새 기준 | 범위 | 검증 | 결과 |
|---|---|---|---|---|---|
| 2026-07-27 | 없음 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` | Governance foundation·v6 계약·Skill route | 원격 경로·정본·콜드 스타트·Git 비교 | `PASS_WITH_NOT_RUN` |
| 2026-07-29 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` | `c987647d01ad2baa028a16e03d85ddfc1572a727` | GDD Sheet 의미 구조·Demo-First·이미지 검수·Registry 연결 | Sheet 재조회·JSON 정적 검증·책임 경로 비교 | `PASS_WITH_RUNTIME_NOT_RUN` |
