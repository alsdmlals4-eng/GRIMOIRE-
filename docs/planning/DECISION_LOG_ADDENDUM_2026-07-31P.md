# GRIMOIRE Decision Log Addendum — 2026-07-31 Planning Completion

## 문서 상태

- 역할: 최신 사용자 결정과 기획 완결 패스의 상태 추적
- 상태: `ACTIVE_LATEST_ADDENDUM`
- 구현 권한: `NONE`
- Codex: `BLOCKED`
- 런타임·사람 검증: `NOT_RUN`

## GM-PLANNING-SEQUENCE-01

### 결정

Codex와 Godot 구현은 기획과 검수가 끝난 뒤 마지막 단계에서 진행한다.

```text
기획 정본 전수 감사
→ 누락·충돌·과잉 범위 보완
→ Vertical Slice 콘텐츠 상세 설계
→ 합성 관점·적대적 검토
→ 정본·Sheet 추적성 검수
→ 사용자 기획 완료 승인
→ Art Style·Art Bible·Asset Specification·Audio Direction
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 마지막에 구현
```

### 상태

`CONFIRMED_BY_LATEST_USER_DECISION`

### 영향

- 기존 `ART-STYLE-01` 즉시 진입 경로를 보류한다.
- 다음 제품 차단 게이트는 `PLANNING-CONTENT-01`이다.
- `VERTICAL_SLICE_FULL_PROFILE` 전환, Codex 실행, Godot 프로젝트 생성은 금지한다.
- 현재 브랜치는 기획 정본·감사·설계 문서만 다룬다.

## GM-PLATFORM-01

### 결정

- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 공통 유지: 코어, 콘텐츠 의미, 데이터 계약, 오류 분류
- 별도 검증: 입력, 레이아웃, 접근성, 성능, 배터리·발열, 백그라운드 복귀

### 상태

`CONFIRMED_DIRECTION`

### 후속

PC 세부 입력은 `PLANNING-PLATFORM-01`에서 검토한다. 기존 Android 터치 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`다.

## GM-PLANNING-AUDIT-01

### 감사 판정

`PLANNING_INCOMPLETE / CONTENT_DEFINITION_REQUIRED`

기존 Gate 1은 프로젝트 코어와 Vertical Slice 구조를 승인했지만 다음 제작 입력은 아직 완료되지 않았다.

1. 대표 메인·보조 글자의 실제 의미와 조합 규칙
2. 다섯 Situation Challenge의 복수 해법
3. 교수·핵심 동급생과 주인공 성장선
4. 자유일정의 동등한 효용과 후속 반영
5. PC 우선 입력·복구 계약
6. 60분 안의 구간별 시간 예산
7. 장소·인물·문제 제작량 예산
8. 귀환·마도서 기록의 기억 가능한 보상

## GM-PLANNING-CANDIDATE-01

### 검토 문서

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

### 문서 상태

`DESIGN_SPEC_FOR_USER_REVIEW`

### 권장 후보

- 글자: `흐름 / 집중 / 분산`
- 주인공: 일반 가정 출신 장학생 신입생, 정답 집착에서 책임 있는 설계자로 성장
- 핵심 동급생: 정석·속도 중심의 경쟁자이자 협력자
- 축제 문제: 빛실 장막 복구
- 현장 문제: 외곽 생태 온실의 마력 관개 수로
- 전투 보조 소환수: 수호형 우선
- PC 입력: 마우스 드래그·펜 보조·키보드 복구
- 시간: 목표 46분, 콘텐츠 상한 53분, 하드 상한 60분

### 상태 경계

위 항목은 `RECOMMENDED_CANDIDATE`다. 사용자 검토 전 다음으로 승격하지 않는다.

- 최종 세계관 고유명
- 최종 룬 문양
- 확정 런타임 데이터
- 구현 요구사항
- 플레이테스트 통과값

## 기획 완료 게이트

```text
PLANNING-CONTENT-01
→ PLANNING-PLATFORM-01
→ PLANNING-SCOPE-01
→ PLANNING-REVIEW-01
→ USER_PLANNING_APPROVAL
```

현재 상태:

```text
PLANNING-CONTENT-01 = USER_REVIEW_REQUIRED
PLANNING-PLATFORM-01 = BLOCKED_BY_CONTENT_REVIEW
PLANNING-SCOPE-01 = BLOCKED_BY_CONTENT_REVIEW
PLANNING-REVIEW-01 = NOT_STARTED
PLANNING_COMPLETE = false
ADVERSARIAL_REVIEW_COMPLETE = false
USER_APPROVED_FOR_CODEX_PLAN = false
CODEX = BLOCKED
```

## 변경하지 않은 승인 결정

- 프로젝트 코어
- 네 핵심 세션과 세 번의 자유일정 구조
- 45~50분 목표와 60분 상한
- 고정 장면 기반 3/4 필드
- 반신 대화 표현
- 별도 고정 3/4 전술 전투장
- 메인 동반 정령 초기 형상 1개
- 수호 또는 견제 보조 소환수 1체
- 장기 4단계 동반 정령 성장 방향
- 입력 실패와 주문 설계 실패 분리
- 별도 CORE_POC 재도입 금지

## 현재 금지

- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 생성
- 기획 완료 전 Art Style을 최종 확정
- 기획 후보를 승인 결정으로 표시
- Google Sheet 병합 전 쓰기
- 사용자 검토 없는 PR 병합
