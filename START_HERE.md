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
| 기획 완료 | `TRUE` |
| 벤치마킹·적대적 검토 | `COMPLETE` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| 다음 제품 게이트 | `ART-STYLE-01` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31Q.md`
5. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
6. `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
7. `docs/DEVELOPMENT_GATES.md`
8. `docs/DOCUMENTATION_MAP.md`
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`
10. `skills/PROJECT_BASE_ADAPTER.json`
11. `skills/PROJECT_SKILL_SNAPSHOT.json`

질문 전에는 확정 결정 스냅샷과 주제별 책임 원본을 먼저 확인한다. 확정된 결정은 기억 확인 목적으로 다시 묻지 않는다.

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

- 목표 중앙값 `45~50분`
- 콘텐츠 상한 `53분`
- 하드 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 문제마다 유효 해법 2개 이상
- 별도 `CORE_POC` 재도입 금지

## 승인된 기획 핵심

- 글자: `흐름 / 집중 / 분산`
- 수업: 불안정한 마력 수로
- 시험: 취약한 부유 수정구 이송
- 축제: 빛실 장막 복구
- 현장: 생태 온실·마력 관개 수로
- 보조 소환수: 수호형 1체 우선
- 정상 완주 필수 성공 작성: 7회
- 안내형 복구 포함 목표 상한: 10회
- 마도서: 상황·의도·결과·부작용·발견 기록
- 완성 주문 자동 시전 스톡: 제외

세부 정본:

- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

## 벤치마킹 선행 원칙

새 시스템, 핵심 규칙, 콘텐츠 구조, UX 흐름을 설계하거나 의미 있게 변경할 때는 벤치마킹을 먼저 수행한다.

- 매번 대규모 조사를 반복하지 않는다.
- `QUICK / STANDARD / DEEP` 중 적절한 규모를 선택한다.
- 최근 동일 질문의 유효한 결과는 재사용한다.
- `ADOPT / ADAPT / REJECT`와 프로젝트 적용 계약을 기록한다.

책임 원본:

- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 화면과 전투

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

- PC 작성: 마우스 드래그·펜 보조·키보드 복구
- Gamepad: `DEFERRED / NOT_PROMISED`
- 기존 Android 연구: `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`

## 현재 작업 순서

```text
기획 완결·벤치마킹·적대적 검토 — 완료
→ ART-STYLE-01
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
- PC 또는 모바일 런타임 검증 없는 완료 선언
- v6·v8 계약을 활성 실행 권한으로 복구
- 메인 소환수 2~4단계·탑승을 초기 Slice에 추가
