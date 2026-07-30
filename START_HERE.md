# GRIMOIRE 시작 지점

> 새 사용자·GPT·Codex·작업자가 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 저장소 | `alsdmlals4-eng/GRIMOIRE-` |
| 1차 플랫폼 | `PC` |
| 후속 플랫폼 | `Mobile` |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 기획 완료 | `TRUE` |
| 벤치마킹·적대적 검토 | `COMPLETE` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES` |
| 다음 제품 Gate | `ART-STYLE-01` |
| 정본 동기화 | `SYNCED_TO_WORKING_BRANCH / GR-SYNC-20260731-04` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md`
5. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
6. `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
7. `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DOCUMENTATION_MAP.md`
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`
11. `docs/planning/CANON_SYNC_STATE.json`

확정된 결정은 기억 확인 목적으로 다시 묻지 않는다. GitHub와 Sheet로 확인 가능한 사실을 사용자에게 다시 요구하지 않는다.

## 승인된 Vertical Slice

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

- 글자: `흐름 / 집중 / 분산`
- 목표 중앙값 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`
- 공통 `Situation Challenge`, 문제마다 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류` 3회
- 정상 완주 필수 성공 작성 7회, 복구 포함 목표 상한 10회
- 마도서: 상황·의도·결과·부작용·발견 기록
- 별도 `CORE_POC`와 완성 주문 자동 시전 스톡 재도입 금지

세부 정본: `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

## 프로젝트 작업 원칙

### 벤치마킹 선행

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위에 맞는 `QUICK / STANDARD / DEEP` 벤치마킹 후 설계한다. 최근 유효한 결과는 재사용하고 `ADOPT / ADAPT / REJECT`를 기록한다.

### 승인 정본 즉시 동기화

```text
Decision ID
→ GitHub 권위 문서·계획 데이터
→ authority commit
→ 연결된 Google Sheet
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합 후 main·Sheet 재검증
→ SYNCED_TO_MAIN
```

현재 번들:

- Sync ID: `GR-SYNC-20260731-04`
- authority commit: `fa82c4c4cebe1232f0ff809ff4321ebacefb3731`
- receipt commit: `46141385621ff77ea728dc23c2cd912ca3f3b89d`
- Sheet: 18개 탭 반영·재조회 완료
- 상태: `SYNCED_TO_WORKING_BRANCH`
- main: Draft PR #22 병합 대기

## 플랫폼·표현

- PC 우선, Mobile 후속
- PC 작성: 마우스 드래그·펜 보조·키보드 복구
- Gamepad: `DEFERRED / NOT_PROMISED`
- 필드: 가로형 고정·장면 기반 3/4, 3.5~4등신 SD
- 대화: 같은 장소 배경 위 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 작성: 현재 화면 감속·암전 + 오버레이

## 다음 제품 경로

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

## 현재 금지

- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 구현
- Art Bible·Asset Specification 전 대량 자산 제작
- 작업 브랜치 동기화를 `SYNCED_TO_MAIN`으로 표시
