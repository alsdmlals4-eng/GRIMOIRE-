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
- 적대적 검토 루프 02: `PASS_WITH_CORRECTIONS`
- 다음 차단 결정: `ART-STYLE-01`

## 1. 시작 경로

```text
README.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md
→ 주제별 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
```

## 2. 활성 책임 원본

| 책임 | 문서 | 상태 |
|---|---|---|
| 빠른 결정 복원·재질문 방지 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` | `ACTIVE_FIRST_READ_AUTHORITY` |
| Gate 1 최종 승인 | `docs/planning/GATE_1_FINAL_APPROVAL.md` | `ACTIVE_APPROVAL_AUTHORITY` |
| Vertical Slice 계약 | `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md` | `APPROVED_AT_GATE_1` |
| 적대적 검토 루프 02 | `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md` | `PASS_WITH_CORRECTIONS` |
| 시각·전투 표현 | `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 캐릭터 표현 | `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md` | `CONFIRMED` |
| 소환수 2계층 코어 | `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md` | `CONFIRMED` |
| 소환수 성장·형상·탑승 | `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md` | `CONFIRMED_DIRECTION` |
| 결정 원장 | `docs/planning/DECISION_LOG.md` | `ACTIVE_WITH_LATEST_ADDENDUM` |
| 최신 Addendum | `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27S.md` | `LATEST_DECISION_RECORD` |
| 개발 게이트 | `docs/DEVELOPMENT_GATES.md` | `ACTIVE_GATE_AUTHORITY` |
| Registry | `docs/DESIGN_DOCUMENT_REGISTRY.json` | `ACTIVE_CANONICAL_ROUTER` |
| 자산 출처·라이선스 | `docs/ASSET_LICENSE_LEDGER.md` | `ACTIVE_ASSET_PROVENANCE_AUTHORITY` |
| Skill 라우팅 | `skills/SKILL_REGISTRY.json` | `ACTIVE_PROJECT_SKILL_ROUTER` |

## 3. 질문 전 조회 규칙

```text
START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG와 최신 Addendum
→ 주제별 책임 원본
```

질문 허용 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자 명시적 재개방

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정은 기억 확인 목적으로 재질문하지 않는다.

## 4. 승인된 Vertical Slice

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
- 목표 `45~50분`, 상한 `60분`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장

## 5. 승인된 시각·캐릭터·전투 구조

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

대화
= 기존 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율 재사용

작성
= 현재 화면 감속·암전 + 작성 오버레이

결과
= 필드 복귀 후 환경 변화 반영
```

기존 `같은 필드 화면에서 전투` 규칙은 최신 결정으로 대체됐다.

## 6. 승인된 소환수 방향

```text
메인 동반 소환수
= 원소·정령 중심
= 장기 4단계 성장
= 이전 형상 선택 가능
= 장기 탑승 기능

전투 보조 소환수
= 원소·정령 중심의 전술 지원
= Vertical Slice는 수호 또는 견제 1체
```

범위:

- Vertical Slice: 메인 초기 형상 1개
- 후행: 메인 2~4단계·형상 선택 UI·탑승
- 미확정: 전투 소환수 4역할 전체·성장·탑승

## 7. 적대적 검토 루프 02

```text
정본·결정 기억 공격
→ 화면·전투 연속성 공격
→ 캐릭터 자산 폭증 공격
→ 소환수 성장·형상·탑승 공격
→ 전투 소환수 과잉 확정 공격
→ 이미지 작업 운영 공격
→ 수정·회귀 재검사
```

판정:

- 프로젝트 코어 `NO_CHANGE`
- Vertical Slice 세션 `NO_CHANGE`
- 캐릭터 표현 `CONFIRMED_WITH_REUSE_GUARDRAIL`
- 전투 화면 `SEPARATE_FIXED_TACTICAL_SCENE`
- 메인 소환수 장기 성장 `CONFIRMED_DIRECTION`
- 전투 소환수 4역할 `REFERENCE_CANDIDATE`
- 결정 기억 운영 `MUST_FIX / FIXED`
- 최종 `PASS_WITH_CORRECTIONS`

## 8. 프리프로덕션 경로

```text
ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 사용자 승인 후 캐릭터·배경·효과·사운드 제작
→ GM-VS-PROFILE-01 재검토
```

그림체 비교는 승인된 동일 인게임 구성을 이미지로 제시한다.

## 9. 기존 시스템 참조

다음은 `REFERENCE_CANDIDATE`다.

- `docs/planning/SPELL_GAME_DESIGN.md`
- 전투·글자·회로·스톡·마나 세부 문서
- 학교·학년·학기·수업·현장실습 세부 문서
- 내러티브·기존 벤치마크 문서

규칙:

- 최신 승인 원본과 충돌하면 최신 원본 우선
- 수치는 `UNVERIFIED` 또는 `BALANCE_TUNING_BACKLOG`
- 폐기·대체 결정은 이력으로 보존

## 10. 구현·검증 상태

| 항목 | 상태 |
|---|---|
| Godot 구현 계획 | `NOT_AUTHORED` |
| Save Schema v1 | `NOT_AUTHORED` |
| Situation Challenge 데이터 계약 | `CONCEPT_ONLY` |
| 캐릭터 표현 구조 | `CONFIRMED` |
| 전투 화면 구조 | `CONFIRMED` |
| 소환수 장기 성장 방향 | `CONFIRMED_DIRECTION` |
| 그림체 | `NEXT_BLOCKING_DECISION` |
| Art Bible·Asset Specification | `NOT_AUTHORED` |
| Audio Direction | `NOT_AUTHORED` |
| Android 검증 매트릭스 | `NOT_AUTHORED` |
| 이미지·사운드 런타임 자산 | `NOT_STARTED` |
| 외부 자산 라이선스 조사 | `NOT_RUN` |
| 런타임·접근성·성능 | `NOT_RUN` |

## 11. 현재 금지

- `main` 직접 수정
- 사용자 승인 없는 PR 병합
- Art Bible·Asset Specification 전 대량 이미지·사운드 제작
- 메인 소환수 4단계 전체를 Vertical Slice에 추가
- 전투 소환수 4역할 전체를 승인 없이 확정
- 별도 CORE_POC 재도입
- `VERTICAL_SLICE_FULL_PROFILE` 자동 전환
- Codex 실행
- Godot 구현
- 런타임 증거 없는 완료 선언

## 12. 다음 라우팅

`ART-STYLE-01`

학교 필드 SD·대화 반신·별도 3/4 전술 전투장·메인 원소 정령수 초기 형상·수호 또는 견제 보조 소환수·마법 작성 오버레이를 같은 구성으로 유지한 채 그림체 후보를 이미지로 비교한다.

- Base v8 통합 실행문: `templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`
- 프로젝트 Sheet: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` (`NOT_CONFIGURED`)
- GPT 이미지·검수: `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md`
