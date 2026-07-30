# GRIMOIRE: 세계를 다시 쓰는 법

마법 글자의 의미를 배우고 직접 주문을 설계해 상황의 규칙을 바꾸는 마법학교 성장 RPG입니다.

## 프로젝트 상태

| 항목 | 현재 기준 |
|---|---|
| 저장소 | `alsdmlals4-eng/GRIMOIRE-` |
| 1차 플랫폼 | `PC` |
| 후속 플랫폼 | `Mobile` |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Gate 1 | `APPROVED` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| 기획 완료 | `false` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| 다음 제품 게이트 | `PLANNING-CONTENT-01` |
| Art Style | `BLOCKED_BY_PLANNING_COMPLETE` |

저장소에는 아직 실행 가능한 Godot 프로젝트가 없습니다. 첨부 또는 외부의 Godot 실행 파일은 개발 도구이며 프로젝트 소스나 배포 자산이 아닙니다.

## 시작 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md`
6. `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
7. `docs/planning/DECISION_LOG.md`
8. `docs/DOCUMENTATION_MAP.md`
9. `docs/DEVELOPMENT_GATES.md`
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`
11. `skills/PROJECT_BASE_ADAPTER.json`
12. `skills/PROJECT_SKILL_SNAPSHOT.json`

## Vertical Slice

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

첫 완주 목표는 `45~50분`, 하드 상한은 `60분`입니다. 공통 문제 계약은 `Situation Challenge`, 자유일정은 `휴식 / 준비 / 교류`입니다.

## 화면과 전투

- 학교·자유일정·탐색: 가로형 고정·장면 기반 3/4 필드
- 캐릭터: 필드 3.5~4등신 SD, 대화 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 마법 작성: 현재 화면 감속·암전 + 작성 오버레이
- 결과: 환경 변화를 반영해 원래 필드 장면으로 복귀

## 현재 기획 완결 패스

기존 코어와 Slice 구조는 유지하면서 다음 제작 입력을 상세화합니다.

- 대표 글자의 실제 의미·조합 규칙
- 다섯 Situation Challenge의 복수 해법
- 주인공·교수·핵심 동급생·동반자 관계
- 자유일정의 구체 효과
- PC 우선 입력과 오류 복구
- 60분 안의 시간·제작량 예산
- 귀환·마도서 기록 보상

책임 문서:

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

현재 상태는 `DESIGN_SPEC_FOR_USER_REVIEW`이며, 문서의 후보는 사용자 검토 전 정본·런타임 데이터·구현 요구사항이 아닙니다.

## 플랫폼 방향

PC판을 먼저 설계·검증·출시하고, 모바일판은 후속 적응 단계에서 입력·레이아웃·접근성·성능을 별도로 검증합니다. 기존 모바일 터치 연구는 참고 근거로 보존하지만 PC 런타임 검증으로 간주하지 않습니다.

## 현재 작업 순서

```text
PLANNING-CONTENT-01
→ PLANNING-PLATFORM-01
→ PLANNING-SCOPE-01
→ PLANNING-REVIEW-01
→ 사용자 기획 완료 승인
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 마지막에 구현
```

## Base와 실행 계약

- Base: `v9.3.0`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8 계약: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`
- Google Sheet: `USER_FACING_GDD_WORKSPACE`

현재는 Codex, Godot 코드·Scene·Resource·게임 데이터, 대량 자산, Google Sheet 쓰기를 진행하지 않습니다.
