# GRIMOIRE Documentation Map

- 프로젝트: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 기준 브랜치: `main`
- 기준 날짜: 2026-07-31
- 제품 단계: `DEMO_FIRST_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 다음 제품 차단 결정: `ART-STYLE-01`

## 1. 시작 경로

```text
README.md
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md
→ 주제별 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
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
| 결정 이력·대체 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_ADDENDA` |
| Gate 1 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| Vertical Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `ACTIVE_APPROVED_CONTRACT` |
| 시각·전투 표현 | `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 캐릭터 표현 | `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 소환수 코어 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED` |
| 소환수 성장·형상 | `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md` | `CONFIRMED_DIRECTION` |
| 마법 작성 UX | `docs/UX_UI_SYSTEM.md` | `ACTIVE_DOMAIN_SOURCE_WITH_PLATFORM_ADAPTATION_PENDING` |
| 개발 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| 문서 라우터 | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| Base 핀 | `docs/BASE_RULES_VERSION.md` | `ACTIVE_VERSION_AUTHORITY` |
| GDD Sheet | `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` | `USER_FACING_GDD_WORKSPACE` |
| Base adapter | `skills/PROJECT_BASE_ADAPTER.json` | `ACTIVE_APPLICATION_BINDING` |
| Skill snapshot | `skills/PROJECT_SKILL_SNAPSHOT.json` | `GENERATED_ROUTE_VIEW` |

## 3. 질문 전 조회

```text
AGENTS
→ START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG와 최신 Addendum
→ 주제별 책임 원본
```

확정 상태를 기억 확인 목적으로 다시 묻지 않는다.

## 4. Base·Vertical Slice 계약

```text
Base v9.3 release/evidence pin
→ PROJECT_BASE_ADAPTER
→ PROJECT_SKILL_SNAPSHOT
→ grimoire-workflow-router
→ 필요한 최소 Base shared Skill
→ 프로젝트 전용 Skill
```

- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6 문서: `LEGACY_REFERENCE_INPUT`
- v8 실행문 참조: `SUPERSEDED_COMPATIBILITY`
- 기존 `Spell` 저장소명·브랜치명: `LEGACY_IDENTITY_ALIAS`
- 기존 `spell-*` 문서 ID: 경로 안정성을 위한 `STABLE_LEGACY_ID`

## 5. 제품 결정 요약

- 코어: `CORE_CONFIRMED`
- Vertical Slice: 4개 핵심 세션 + 자유일정 3회
- 완주: 목표 45~50분, 상한 60분
- 화면: 가로형 장면 기반 3/4 필드
- 대화: 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 소환수: 메인 초기 형상 1개 + 수호/견제 보조 1체
- 1차 플랫폼: PC
- 후속 플랫폼: Mobile
- 다음 제품 결정: `ART-STYLE-01`
- 구현 전 플랫폼 결정: `PLATFORM-INPUT-01`

## 6. 검증·근거 경계

- 저장소에 Godot 프로젝트 파일 없음
- 코드·Scene·Resource·게임 데이터 없음
- 실제 recognizer 미선택
- PC 런타임 `NOT_RUN`
- 모바일 실기기 `NOT_RUN`
- 접근성·성능·사람 플레이테스트 `NOT_RUN`
- 합성 페르소나·simulated 후보는 실제 성능 증거가 아님
- 첨부 Godot 실행 파일은 도구 확인 자료이며 프로젝트 자산이 아님

## 7. 프리프로덕션 순서

```text
Base v9.3 운영 정합화
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ PLATFORM-INPUT-01
→ GM-VS-PROFILE-01 재검토
→ Codex read-only Plan
→ Validation-First 구현
```

## 8. 현재 금지

- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- 실행 프로필 전환 전 Godot 구현
- Art Bible·Asset Specification 전 대량 이미지·사운드 제작
- v6·v8을 활성 실행 권한으로 사용
- 런타임 증거 없는 완료 선언
