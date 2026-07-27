# 스펠 Documentation Map

- 책임: 프로젝트 허브·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- Base 기준 Commit: `438f41afd510c827c3097341bd9e5f9c9b0e1dd0`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- Gate 2: `ENTERED_PLANNING_ONLY_VISUAL_PREPRODUCTION`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 구현: `NOT_STARTED`
- 다음 차단 결정: `GM-VISUAL-PRESENTATION-01`

## 1. 시작 경로

```text
README.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/GATE_1_FINAL_APPROVAL.md
→ docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md
→ docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ docs/ASSET_LICENSE_LEDGER.md
→ skills/SKILL_REGISTRY.json
```

## 2. 활성 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| Gate 1 최종 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| 승인된 Vertical Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `APPROVED_AT_GATE_1` |
| Gate 2 적대적 검토 루프 | `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md` | `PASS_WITH_FOLLOWUP` |
| 통합 기준선 | `docs/planning/V6_CONCEPT_REBASE_BASELINE.md` | `APPROVED_GATE_1_BASELINE` |
| 게임플레이 Loop | `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 경험 곡선 | `docs/planning/GATE_1_EXPERIENCE_CURVE_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 프로젝트 코어 경계 | `docs/planning/GATE_1_PROJECT_CORE_BOUNDARY_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 세일즈포인트 | `docs/planning/GATE_1_SALES_POINTS_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 벤치마킹·SWOT·VRIO | `docs/planning/GATE_1_BENCHMARK_SWOT_VRIO_FEASIBILITY.md` | `ACTIVE_RESEARCH_EVIDENCE` |
| 소환수·동반자 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `APPROVED_GATE_1_SOURCE` |
| 직접 Slice 경로 | `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md` | `ACTIVE_ROUTE_SOURCE` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27Q.md` | `LATEST_DECISION_RECORD` |
| 자산 출처·라이선스 | `docs/ASSET_LICENSE_LEDGER.md` | `ACTIVE_ASSET_PROVENANCE_AUTHORITY` |
| Skill 라우팅 | `skills/SKILL_REGISTRY.json` | `ACTIVE_PROJECT_SKILL_ROUTER` |

## 3. 승인된 Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 공통 `Situation Challenge`
- 첫 완주 목표 `45~50분`, 상한 `60분`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- M0~M4 Validation-First 순서

## 4. 적대적 검토 루프

```text
요구·정체성·정본
→ 논리·Core Loop·판정
→ 데이터·저장·자산 추적
→ 모바일 UX·접근성·제작성
→ 아트·사운드·시장·GitHub 회귀
```

판정:

- Gate 1 코어·Slice 범위: `NO_CHANGE`
- 문서 상태 회귀: `FIXED`
- 아트·사운드 대량 제작: `BLOCKED_BY_VISUAL_PRESENTATION_DECISIONS`
- 최종: `PASS_WITH_FOLLOWUP`

## 5. 시각·사운드 프리프로덕션 경로

```text
GM-VISUAL-PRESENTATION-01
→ GM-CHARACTER-PRESENTATION-01
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 사용자 승인 후 캐릭터·배경·효과·사운드 작업
→ GM-VS-PROFILE-01 재검토
```

그림체보다 화면 방향·카메라·게임 표현 구조를 먼저 결정한다.

## 6. 기존 시스템 참조

다음은 `REFERENCE_CANDIDATE`다.

- `docs/planning/SPELL_GAME_DESIGN.md`
- 전투·글자·회로·스톡·마나·소환수 세부 문서
- 학교·학년·학기·수업·현장실습 세부 문서
- 내러티브·기존 벤치마크 문서

규칙:

- 최신 승인 원본과 충돌하면 최신 원본 우선
- 수치는 `UNVERIFIED` 또는 `BALANCE_TUNING_BACKLOG`
- 폐기·대체 결정은 이력으로 보존

## 7. 구현·검증 상태

| 항목 | 상태 |
|---|---|
| Godot 구현 계획 | `NOT_AUTHORED` |
| Save Schema v1 | `NOT_AUTHORED` |
| Situation Challenge 데이터 계약 | `CONCEPT_ONLY` |
| Android 검증 매트릭스 | `NOT_AUTHORED` |
| Balance Tuning Backlog | `NOT_AUTHORED` |
| 이미지·사운드 자산 | `NOT_STARTED` |
| 외부 자산 라이선스 조사 | `NOT_RUN` |
| 런타임·접근성·성능 | `NOT_RUN` |

## 8. 현재 금지

- `main` 직접 수정
- 사용자 승인 없는 PR 병합
- 화면 구조 결정 전 대량 이미지·사운드 제작
- 별도 CORE_POC 재도입
- `VERTICAL_SLICE_FULL_PROFILE` 자동 전환
- Codex 실행
- Godot 구현
- 런타임 증거 없는 완료 선언

## 9. 다음 라우팅

`GM-VISUAL-PRESENTATION-01`

Vertical Slice의 화면 방향, 카메라, 탐색·대화·마법 작성의 시각 표현 구조를 결정한다.
