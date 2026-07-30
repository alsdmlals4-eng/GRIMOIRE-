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
| Gate 1 | `APPROVED` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| Vertical Slice 계약 | `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT` |
| 구현 | `NOT_STARTED` |
| Codex | `NOT_RUN` |
| 다음 제품 차단 결정 | `ART-STYLE-01` |
| 구현 전 플랫폼 계약 | `PLATFORM-INPUT-01` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG.md`
5. `docs/DOCUMENTATION_MAP.md`
6. `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
9. `skills/PROJECT_BASE_ADAPTER.json`
10. `skills/PROJECT_SKILL_SNAPSHOT.json`

질문 전에는 확정 결정 스냅샷과 주제별 책임 원본을 먼저 확인한다. `CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED`는 기억 확인 목적으로 다시 묻지 않는다.

## 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

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

- 목표 `45~50분`, 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 별도 `CORE_POC` 재도입 금지

## 승인된 화면·캐릭터·전투

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

결과
= 환경 변화를 반영한 필드 복귀
```

## 플랫폼 방향

```text
PC Vertical Slice·출시
→ 공통 데이터·콘텐츠 계약 안정화
→ 모바일 입력·레이아웃·성능 적응
→ 모바일 실기기 검증
```

PC 입력 방식은 `PLATFORM-INPUT-01`에서 확정한다. 기존 모바일 터치 연구는 보존하지만 실제 PC·모바일 런타임 증거가 아니다.

## 현재 작업 순서

```text
Base v9.3·Vertical Slice v9 운영 정합화
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ PLATFORM-INPUT-01
→ 실행 프로필 전환 재검토
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
```

## 현재 금지

- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- Godot 코드·Scene·Resource·게임 데이터 구현
- Art Bible·Asset Specification 전 대량 자산 제작
- PC 또는 모바일 런타임 검증 없는 완료 선언
- v6·v8 계약을 활성 실행 권한으로 복구
- 메인 소환수 2~4단계·탑승을 초기 Slice에 추가
