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
| 구현 | `NOT_STARTED` |
| 다음 제품 결정 | `ART-STYLE-01` |
| 구현 전 플랫폼 계약 | `PLATFORM-INPUT-01` |

저장소에는 아직 실행 가능한 Godot 프로젝트가 없습니다. 첨부 또는 외부의 Godot 실행 파일은 개발 도구이며 프로젝트 소스나 배포 자산이 아닙니다.

## 시작 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/DECISION_LOG.md`
6. `docs/DOCUMENTATION_MAP.md`
7. `docs/DEVELOPMENT_GATES.md`
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`
9. `skills/PROJECT_BASE_ADAPTER.json`
10. `skills/PROJECT_SKILL_SNAPSHOT.json`

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

첫 완주 목표는 `45~50분`, 상한은 `60분`입니다. 공통 문제 계약은 `Situation Challenge`, 자유일정은 `휴식 / 준비 / 교류`입니다.

## 화면과 전투

- 학교·자유일정·탐색: 가로형 고정·장면 기반 3/4 필드
- 캐릭터: 필드 3.5~4등신 SD, 대화 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 마법 작성: 현재 화면 감속·암전 + 작성 오버레이
- 결과: 환경 변화를 반영해 원래 필드 장면으로 복귀

## 플랫폼 방향

PC판을 먼저 설계·검증·출시하고, 모바일판은 후속 적응 단계에서 입력·레이아웃·성능을 별도로 검증합니다. 기존 모바일 터치 연구는 참고 근거로 보존하지만 PC 런타임 검증으로 간주하지 않습니다.

## Base와 실행 계약

- Base: `v9.3.0`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8 계약: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`
- Google Sheet: `USER_FACING_GDD_WORKSPACE`

현재는 게임 코드·Scene·Resource·게임 데이터·대량 자산을 구현하지 않습니다.
