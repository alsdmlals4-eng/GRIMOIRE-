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
| 기획 완료 | `TRUE` |
| 벤치마킹·적대적 검토 | `COMPLETE` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| 다음 제품 게이트 | `ART-STYLE-01` |

저장소에는 아직 실행 가능한 Godot 프로젝트가 없습니다. 첨부 또는 외부의 Godot 실행 파일은 개발 도구이며 프로젝트 소스나 배포 자산이 아닙니다.

## 시작 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31Q.md`
6. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
7. `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DOCUMENTATION_MAP.md`
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

- 목표 중앙값 `45~50분`
- 콘텐츠 상한 `53분`
- 하드 상한 `60분`
- 공통 문제 계약: `Situation Challenge`
- 자유일정: `휴식 / 준비 / 교류`
- 문제마다 유효 해법 2개 이상

## 승인된 기획 핵심

- 글자: `흐름 / 집중 / 분산`
- 주인공: 일반 가정 출신 장학생 신입생
- 수업: 불안정한 마력 수로
- 시험: 취약한 부유 수정구 이송
- 축제: 빛실 장막 복구
- 현장: 생태 온실·마력 관개 수로
- 전투 보조 소환수: 수호형 1체 우선
- 정상 완주 필수 성공 작성: 7회
- 안내형 복구 포함 목표 상한: 10회
- 마도서: 상황·의도·결과·부작용·발견 기록
- 완성 주문 자동 시전 스톡: 제외

상세 정본:

- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

## 화면과 전투

- 학교·자유일정·탐색: 가로형 고정·장면 기반 3/4 필드
- 캐릭터: 필드 3.5~4등신 SD, 대화 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 마법 작성: 현재 화면 감속·암전 + 작성 오버레이
- 결과: 환경 변화를 반영해 원래 필드 장면으로 복귀

## PC 입력과 모바일 후속

- PC: 마우스 드래그·펜 보조·키보드 Undo·취소·확정
- Gamepad: `DEFERRED / NOT_PROMISED`
- 모바일: 공통 게임 규칙을 유지하고 터치·레이아웃·성능을 별도 검증
- 기존 Android 연구: `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`

## 벤치마킹 선행 원칙

새 시스템, 핵심 규칙, 콘텐츠 구조 또는 UX 흐름을 설계하거나 의미 있게 변경할 때는 관련 사례를 먼저 벤치마킹합니다.

- 매번 대규모 조사를 반복하지 않습니다.
- 범위에 따라 `QUICK / STANDARD / DEEP`를 선택합니다.
- 최근 동일 결정 질문의 유효한 조사는 재사용합니다.
- 적용·변형·배제 근거를 `ADOPT / ADAPT / REJECT`로 기록합니다.

책임 원본:

- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 현재 제품 경로

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

## Base와 실행 계약

- Base: `v9.3.0`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8 계약: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`
- Google Sheet: `USER_FACING_GDD_WORKSPACE`

현재는 제품 코드·Scene·Resource·게임 데이터·대량 자산을 구현하지 않습니다.
