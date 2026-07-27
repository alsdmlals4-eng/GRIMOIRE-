# 스펠 프로젝트 운영체계 설치 계획

- 프로젝트: `스펠` (임시)
- 저장소: `alsdmlals4-eng/Spell`
- 작성일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 커밋: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 프로젝트 유형: 운영 중인 기획 프로젝트
- 설치 수준: `Governance foundation`
- Work Mode: `PLAN`
- Skill Mode: `audit → approved migration → verify`
- 사용자 승인: 2026-07-27 직접 요청 `좋아 작업해`

## 1. 목적

v6 버티컬 슬라이스 계약과 Base의 프로젝트 운영 구조를 Spell 저장소 안에서 지속적으로 사용할 수 있게 한다. 새 GPT·Codex·작업자가 과거 대화 없이도 현재 코어, 보호 결정, 책임 원본, 다음 결정, Skill route와 제품 게이트를 찾을 수 있어야 한다.

## 2. 보호 범위

- 기존 `docs/planning/` 문서는 이동·삭제·강제 통합하지 않는다.
- `docs/ACTIVE_CONTEXT.md`와 `docs/planning/DECISION_LOG.md`의 현재 결정을 유지한다.
- 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
- 현재 프로필에서 Godot 코드·Scene·Resource·게임 데이터를 생성하지 않는다.
- 소환수의 회로·글자 직접 작성과 보조 묶음 자동 연결을 재도입하지 않는다.
- 복수 메인 글자 주문을 허용하지 않는다.
- Draft PR을 유지하며 `main`에 직접 반영하거나 PR을 병합하지 않는다.

## 3. 감사 결과

| 영역 | 현재 상태 | 판정 |
|---|---|---|
| README | 프로젝트·플랫폼·단계 존재 | 보존 후 진입점 연결 |
| Active Context | 최신 결정 D와 다음 결정 `GM-STOCK-01` 반영 | 현행 유지·운영 경로 추가 |
| Planning documents | 프로젝트 고유 기획 46개 존재 | 이동 없이 Registry에 연결 |
| AGENTS | 없음 | 생성 |
| START_HERE | 없음 | 생성 |
| Documentation Map | 없음 | 생성 |
| Development Gates | 없음 | 생성 |
| Design Document Registry | 없음 | 생성 |
| Base version record | 없음 | 생성 |
| Project Skill route·adapter | 없음 | 생성 |
| Godot 구현·테스트 | 미착수 | 이번 범위 제외·`NOT_RUN` |
| PDF·DOCX·Manifest | 없음 | 이번 범위 제외·`NOT_RUN` |
| GitHub Actions·Branch protection | 미검증 | 이번 범위 제외·`NOT_RUN` |

## 4. 설치 구조

```text
AGENTS.md
START_HERE.md
docs/
├─ ACTIVE_CONTEXT.md                         # 기존 정본 유지·운영 경로 보강
├─ BASE_RULES_VERSION.md
├─ DOCUMENTATION_MAP.md
├─ DEVELOPMENT_GATES.md
├─ DESIGN_DOCUMENT_REGISTRY.json
├─ PROJECT_OPERATING_SYSTEM_INSTALLATION_PLAN.md
├─ OPERATING_SYSTEM_HEALTH_REPORT.md
├─ ASSET_LICENSE_LEDGER.md
├─ contracts/
│  ├─ VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md
│  └─ VERTICAL_SLICE_MASTER_REFERENCE_v6.md
└─ planning/                                 # 기존 기획 책임 원본 보존
skills/
├─ SKILL_REGISTRY.json
├─ PROJECT_BASE_SKILL_ADAPTER.json
├─ BASE_SHARED_SKILL_ROUTES.json
└─ PROJECT_ARCHIVE_RETENTION_ADAPTER.json
```

## 5. 책임 경계

- `AGENTS.md`: 프로젝트 최상위 작업 규칙과 금지 범위
- `START_HERE.md`: 콜드 스타트용 프로젝트 대시보드
- `ACTIVE_CONTEXT.md`: 현재 사실·다음 작업·미검증
- `DOCUMENTATION_MAP.md`: 질문별 책임 원본 라우팅
- `DEVELOPMENT_GATES.md`: 작업 게이트와 v6 4단계 제품 게이트
- `DESIGN_DOCUMENT_REGISTRY.json`: 활성 기획 정본·보조 근거 등록
- `BASE_RULES_VERSION.md`: Base commit과 v6 계약 고정
- `SKILL_REGISTRY.json`: Base 자동 Trigger route와 현재 프로필
- `PROJECT_BASE_SKILL_ADAPTER.json`: Spell 고유 경로·보호 결정·Godot 상태
- `BASE_SHARED_SKILL_ROUTES.json`: 필수 전문 extension route

## 6. 설치하지 않는 범위

- Godot 프로젝트 생성
- Codex 구현
- 자동화 Checker·GitHub Actions 설치
- 브랜치 보호 변경
- PDF·DOCX·대시보드 발행
- 자산 구매·생성
- 기존 기획 파일의 이름 변경·이동·삭제
- Concept Gate 승인 또는 제품 단계 전환

## 7. 검증

1. 모든 생성 파일이 기획 브랜치에 존재하는지 확인한다.
2. Markdown 내부 경로와 JSON 경로가 실제 파일을 가리키는지 확인한다.
3. Base commit, v6 계약 버전, 제품 단계, 실행 프로필이 일치하는지 확인한다.
4. `docs/planning/` 기존 파일이 삭제·이동되지 않았는지 PR 파일 목록과 비교한다.
5. 새 작업자가 `AGENTS → START_HERE → ACTIVE_CONTEXT → DOCUMENTATION_MAP → DEVELOPMENT_GATES → Registry` 순서로 현재 상태와 다음 작업을 찾을 수 있는지 확인한다.
6. 실행하지 않은 Godot·PDF·자동화·런타임 검증을 `NOT_RUN`으로 기록한다.

## 8. 롤백

이번 작업은 신규 허브 파일과 기존 문서의 링크 보강만 수행한다. 문제가 발생하면 이 설치 작업의 신규 Commit을 revert하고, 기존 `docs/planning/`와 `docs/ACTIVE_CONTEXT.md`를 이전 Commit 기준으로 복원한다.

## 9. 완료 기준

- 프로젝트 진입점·문서 지도·게이트·Registry가 연결된다.
- v6 계약과 Base commit이 저장소 안에서 추적된다.
- Base Skill 본문을 프로젝트에 복제하지 않고 route·adapter 방식으로 사용한다.
- 기존 기획 정본과 최신 사용자 결정을 훼손하지 않는다.
- 다음 기획 작업이 `GM-STOCK-01`과 Concept Gate 준비로 명확히 이어진다.
