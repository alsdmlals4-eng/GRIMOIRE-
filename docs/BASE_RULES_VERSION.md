# Spell Base 규칙 버전

## 현재 채택 기준

| 항목 | 기준 |
|---|---|
| 프로젝트 | `alsdmlals4-eng/Spell` |
| 프로젝트명 | `스펠` (임시) |
| 적용 브랜치 | `gpt/planning-spell-20260725` |
| Base 저장소 | `alsdmlals4-eng/Base` |
| Base 전체 운영체계 채택 Commit | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |
| Base 공용 Skill route Commit | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` |
| 동기화 날짜 | 2026-07-27 |
| v6 계약 | `VERTICAL_SLICE_MASTER_REFERENCE 6.0` |
| 현재 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |

현재 전체 운영체계 채택 기준과 공용 Skill route 기준은 같다. 어느 한쪽만 갱신할 경우 범위·이유·검증 결과를 이 문서에 분리해서 기록한다.

## 저장소 계약 경로

- 축약 실행문: `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`
- 마스터 원본 Manifest: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`
- 원본 마스터 SHA-256: `005b330261e70a2f4f1f0a51c0729c21ee3bf55ca0a0be8178711691b35a6963`
- 프로젝트 최상위 규칙: `AGENTS.md`
- 프로젝트 시작점: `START_HERE.md`
- 문서 지도: `docs/DOCUMENTATION_MAP.md`
- 제품·작업 게이트: `docs/DEVELOPMENT_GATES.md`
- Design Registry: `docs/DESIGN_DOCUMENT_REGISTRY.json`
- Base Skill route: `skills/SKILL_REGISTRY.json`
- 프로젝트 어댑터: `skills/PROJECT_BASE_SKILL_ADAPTER.json`
- 전문 extension route: `skills/BASE_SHARED_SKILL_ROUTES.json`
- 운영체계 검증: `docs/OPERATING_SYSTEM_HEALTH_REPORT.md`

## 적용 우선순위

```text
최신 사용자 요청·승인
→ AGENTS.md
→ 이 BASE_RULES_VERSION.md와 v6 계약
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DOCUMENTATION_MAP.md·docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json의 책임 원본
→ skills/SKILL_REGISTRY.json과 프로젝트 어댑터
→ 현재 Issue·Goal·Plan·PR
→ 실제 파일·테스트
→ 고정된 Base 원격 Commit
→ 과거 대화·외부 AI 결과·추정
```

## Base 적용 방식

Base Skill 본문을 Spell 저장소에 복제하지 않는다.

```text
Base skills/SKILL_REGISTRY.json의 자동 Trigger 선택
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ skills/BASE_SHARED_SKILL_ROUTES.json
→ 필요한 전문 extension
→ Spell 고유 책임만 프로젝트 로컬 Skill
```

현재 필수 extension route:

- `governing-legacy-retention-and-archives`
- `evaluating-godot-assets-and-plugins-before-creation`

## 현재 적용된 Base 책임

| 책임 | Base Skill | 현재 상태 |
|---|---|---|
| 요청 접수·실행 계약 | `managing-project-intake-and-work-contract` | route·contract 적용 |
| 운영체계 | `managing-game-project-operating-system` | audit→승인→Governance foundation 설치→verify 완료, 일부 검사 `NOT_RUN` |
| 프로젝트 코어 조사 | `identifying-project-core` | 읽기 전용 기준선 확인 |
| 콘셉트·CORE_POC | `analyzing-and-refining-game-concepts` | 다음 기획 단계에서 순차 실행 |
| 코어 승인 | `establishing-project-core` | 사용자 승인 전 미실행 |
| 기획 문서 | `managing-design-documents` | Registry·정본 연결 적용 |
| 버티컬 슬라이스 | `designing-vertical-slices` | 코어 승인·CORE_POC 이후 실행 |
| 적대적 검토 | `running-adversarial-review-and-refinement` | 주요 Gate에서 실행 |
| 통합 검증 | `reviewing-and-validating-project-changes` | 문서 참조 검증 적용, 런타임은 `NOT_RUN` |
| 컨텍스트·인계 | `maintaining-project-context-and-handoff` | Active Context 갱신 적용 |

## 동기화 규칙

Base pin을 변경할 때 다음을 함께 확인한다.

1. Base `START_HERE.md`, `AGENTS.md`, `docs/OPERATING_MODEL.md`, `docs/DOCUMENTATION_MAP.md`
2. Base `skills/SKILL_REGISTRY.json`과 `skills/BASE_SHARED_SKILL_ROUTES.json`
3. Spell `AGENTS.md`, Documentation Map, Development Gates
4. Spell Skill Registry와 프로젝트 어댑터
5. v6 계약과 충돌 여부
6. 기존 프로젝트 결정·보호 경로·정상 동작 보존
7. 실행한 검증과 `NOT_RUN` 항목

Base commit 변경만으로 Godot 구현·CI·발행·Codex 인수를 자동 승인하지 않는다.

## 변경 기록

| 날짜 | 이전 기준 | 새 기준 | 범위 | 검증 | 결과 |
|---|---|---|---|---|---|
| 2026-07-27 | 없음 | `438f41afd510c827c3097341bd9e5f9c9b0e1dd0` | Governance foundation·v6 계약·Skill route | 원격 경로·정본·콜드 스타트·Git 비교 | `PASS_WITH_NOT_RUN` |
