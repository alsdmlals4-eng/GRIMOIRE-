# GRIMOIRE 현재 확정 결정 스냅샷

## 1. 문서 역할

- 상태: `ACTIVE_CANONICAL_DECISION_SNAPSHOT`
- 프로젝트: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 기준 날짜: 2026-07-31
- 제품 단계: `DEMO_FIRST_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`

이 문서는 세부 책임 원본을 대체하지 않는다. 이미 승인된 결정을 빠르게 복원하고 새 질문이 실제 미확정 사항인지 판정한다.

## 2. 질문 전 규칙

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG.md와 최신 Addendum
→ 질문 주제의 단일 책임 원본
```

질문 가능:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자의 명시적 재개방

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED`를 기억 확인 목적으로 다시 묻지 않는다.

## 3. 제품 코어

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

### 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

### 비타협 코어

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 수업→연습→평가·표현→현장실습→발견·기록→다음 학습 순환

## 4. Vertical Slice

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

보호 결정:

- 첫 완주 목표 `45~50분`, 상한 `60분`
- 모든 핵심 세션은 공통 `Situation Challenge` 계약 사용
- 자유일정은 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 `CORE_POC` 재도입 금지
- M0→M1→M2→M3→M4는 Slice 내부 검증 체크포인트

## 5. 화면·캐릭터·전투 표현

- 가로형 기준 구도 `16:9`
- 학교·자유일정·비전투 탐색은 고정·장면 기반 3/4 필드
- 필드 캐릭터는 3.5~4등신 SD
- 대화는 같은 장소 배경 위 반신 일러스트
- 전투는 별도 고정 3/4 전술 전투장
- 전투 캐릭터는 필드 SD 비율·기본 골격 재사용
- 작성 시 현재 화면을 감속·암전하고 전용 오버레이 표시
- 결과는 원래 필드 장면의 환경 변화로 반영
- `같은 필드 화면에서 전투`는 `SUPERSEDED`

## 6. 소환수

### 메인 동반 소환수

- 원소·정령 중심
- 같은 개체가 학습·관계·일상·현장·기록에 동행
- Vertical Slice 런타임 필수는 초기 형상 1개
- 장기 방향은 4단계 성장
- 해금된 현재 단계 이하 이전 형상 선택
- 실제 성장 단계와 표시 형상 분리
- 장기 탑승
- 2~4단계 런타임·형상 선택 UI·탑승은 Slice 후행

### 전투 보조 소환수

- 원소·정령 시각 언어
- Vertical Slice는 수호 또는 견제 1체
- 4역할 전체·성장·탑승·획득·경제는 `UNRESOLVED_REFERENCE_CANDIDATE`

공통 금지:

- 글자·회로 작성 대행
- 메인·보조 글자 자동 선택
- 자동 주문 설계·정답 제시
- 소환수만으로 전투 자동 해결

## 7. 플랫폼

결정 ID: `GM-PLATFORM-01`

- 상태: `CONFIRMED_DIRECTION`
- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 공통 유지: 프로젝트 코어, 게임 규칙, 콘텐츠 의미, 데이터 계약
- 별도 검증: 입력, 레이아웃, 접근성, 성능, 배터리·발열, 백그라운드 복귀
- PC 입력 세부: `PLATFORM-INPUT-01 / USER_DECISION_REQUIRED`
- 기존 모바일 터치 연구: `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`

## 8. Base와 실행 계약

- Base release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`
- 현재 마이그레이션: `APPROVED_IN_PROGRESS`

## 9. 현재 게이트

| 항목 | 상태 |
|---|---|
| Gate 1 콘셉트 | `APPROVED` |
| Gate 2 시각 프리프로덕션 | `ENTERED_PLANNING_ONLY` |
| `ART-STYLE-01` | `NEXT_PRODUCT_BLOCKER` |
| `ART-BIBLE-01` | `BLOCKED_BY_ART_STYLE` |
| `ASSET-SPEC-01` | `BLOCKED_BY_ART_BIBLE` |
| `AUDIO-DIRECTION-01` | `PENDING` |
| `PLATFORM-INPUT-01` | `REQUIRED_BEFORE_IMPLEMENTATION` |
| Godot 프로젝트 | `NOT_STARTED` |
| Codex Build | `NOT_AUTHORIZED` |
| 런타임·사람 검증 | `NOT_RUN` |

## 10. 이미지·에셋 규칙

- 비교가 필요한 시각 결정은 가능한 경우 동일한 인게임 구성 이미지로 제시
- 생성 이미지는 자동 시스템 승인·최종 자산이 아님
- 현재 승인 참고 이미지는 `USER_APPROVED_VISUAL_REFERENCE`
- 실제 그림체·색·선·명암·재질·UI 세부는 `ART-STYLE-01`과 `ART-BIBLE-01` 대상
- Art Bible·Asset Specification·Audio Direction 전 대량 제작 금지
