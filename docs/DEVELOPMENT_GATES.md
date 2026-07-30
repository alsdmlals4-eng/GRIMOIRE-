# GRIMOIRE 개발·기획 게이트

## 1. 현재 판정

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
product_stage: DEMO_FIRST_VERTICAL_SLICE
gate_1: APPROVED
project_core: CORE_CONFIRMED
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning_completion_pass: IN_PROGRESS
planning_complete: false
implementation_ready: false
codex: BLOCKED
next_greenlight: PLANNING-CONTENT-01
runtime_validation: NOT_RUN
human_playtest: NOT_RUN
```

현재 승인은 프로젝트 코어, Vertical Slice 구조, 화면·캐릭터·전투 표현, 소환수 장기 방향에 한정된다. 실제 글자 의미·문제·인물·PC 입력·시간·제작량은 기획 완료 게이트에서 검토한다.

## 2. 전체 경로

```text
Gate 1 콘셉트·Vertical Slice 구조 — APPROVED
→ 화면·캐릭터·별도 전술 전투 표현 — CONFIRMED
→ 소환수 장기 방향·Slice 감량 — CONFIRMED
→ 기획 정본 전수 감사 — COMPLETE_WITH_FINDINGS
→ PLANNING-CONTENT-01 — USER_REVIEW_REQUIRED
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
→ 실행 프로필 전환 검토
→ 마지막에 Godot 구현
→ QA·사람 플레이테스트
```

Codex·Godot 구현은 기획 및 검수보다 먼저 진행하지 않는다.

## 3. 보호된 Gate 1 결정

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

### Vertical Slice

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

보호:

- 목표 `45~50분`, 하드 상한 `60분`
- 공통 `Situation Challenge`
- 문제마다 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지
- 입력 실패와 주문 설계 실패 분리

### 표현과 소환수

- 고정 장면 기반 3/4 필드
- 3.5~4등신 SD
- 같은 장소 배경 위 반신 대화
- 별도 고정 3/4 전술 전투장
- 필드·전투 SD 기본 골격 재사용
- 현재 화면 감속·암전 + 작성 오버레이
- 메인 동반 정령 Slice 초기 형상 1개
- 수호 또는 견제형 보조 소환수 1체
- 장기 4단계 성장·이전 형상 선택·탑승은 후행

## 4. 기획 감사 게이트

상태: `COMPLETE_WITH_P0_FINDINGS`

책임 문서:

- `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
- `docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md`

확인된 P0:

1. PC 우선과 모바일 터치 중심 계약 충돌
2. 구간 최대 시간 합계와 60분 상한 충돌
3. 대표 글자의 의미·조합 규칙 누락
4. 다섯 Situation Challenge의 실제 문제·복수 해법 누락
5. 교수·핵심 동급생·주인공 성장선 누락
6. 자유일정 결과의 구체성·동등성 부족
7. 학교 문화·현장실습 이유·마도서 종료 보상 부족
8. Art Style보다 먼저 확정해야 할 콘텐츠 대상 누락

## 5. PLANNING-CONTENT-01

상태: `USER_REVIEW_REQUIRED`

검토 대상:

- 대표 글자 의미와 문법
- 다섯 Situation Challenge와 복수 해법
- 주인공·교수·핵심 동급생·메인 동반 정령 역할
- 자유일정 A/B/C의 휴식·준비·교류 결과
- 학교 교육 철학과 현장실습의 이유
- 귀환·마도서 기록의 기억 가능한 보상

권장 후보:

- 글자: `흐름 / 집중 / 분산`
- 주인공: 일반 가정 출신 장학생 신입생
- 성장선: 하나의 정답 집착 → 결과를 책임지는 설계자
- 축제: 빛실 장막 복구
- 현장: 외곽 생태 온실의 마력 관개 수로
- 보조 소환수: 수호형 우선

통과 조건:

- 사용자 승인 또는 수정 승인
- 문제별 관찰 정보·판단·유효 해법 2개 이상·실패 원인·후속 학습 명시
- 후보와 확정 상태 분리
- Slice 제외 범위 유지

## 6. PLANNING-PLATFORM-01

상태: `BLOCKED_BY_CONTENT_REVIEW`

검토 후보:

- 마우스 왼쪽 드래그 작성
- 펜 태블릿·스타일러스 보조
- `Ctrl+Z` Undo
- `Esc` 취소·이전
- `Enter` 후보 확정
- `Tab` 포커스 이동
- 자동 시전 금지
- Gamepad `DEFERRED / NOT_PROMISED`

통과 조건:

- PC 기본 입력·대체 입력·오류 복구 흐름 승인
- 입력 실패·문법 실패·상황 실패가 UI에서 분리
- 색 외 아이콘·형태·텍스트 피드백 계약
- 모바일 입력을 PC 런타임 증거와 분리

## 7. PLANNING-SCOPE-01

상태: `BLOCKED_BY_CONTENT_REVIEW`

시간 후보:

| 구간 | 목표 | 콘텐츠 상한 |
|---|---:|---:|
| 프롤로그·수업·연습 | 9분 | 10분 |
| 자유일정 A | 2분 | 3분 |
| 실기시험 | 7분 | 8분 |
| 자유일정 B | 2분 | 3분 |
| 학교축제 | 7분 | 8분 |
| 자유일정 C | 2분 | 3분 |
| 현장실습 | 13분 | 14분 |
| 귀환·기록 | 4분 | 4분 |
| 합계 | 46분 | 53분 |

- 재작성·읽기·접근성 여유: 7분
- 하드 상한: 60분

제작량 후보:

- 학교 공용 장면 세트 1개
- 축제 장식 상태 1개
- 생태 온실·관개 수로 1개
- 같은 현장 기반 전술 전투장 1개
- 작성 오버레이 1종
- 마도서 화면 1종
- 교수 1명·핵심 동급생 1명
- 메인 동반 정령 초기 형상 1체
- 수호형 보조 소환수 1체
- 폭주 수로 정령 1종
- 메인 글자 1·보조 글자 2
- Situation Challenge 5개

통과 조건:

- 시간표가 60분 상한 안에서 성립
- 장소·인물·문제 예산 승인
- 장기 성장과 Slice 런타임 범위 분리
- 완성 주문 스톡·소환수 4역할·추가 지역·별도 미니게임 제외 유지

## 8. PLANNING-REVIEW-01

상태: `NOT_STARTED`

필수 검수:

1. 합성 플레이어 관점
   - 마법 퍼즐 초심자
   - 시스템 탐구형 플레이어
   - 서사·관계 중심 플레이어
   - 직접 작성 피로에 민감한 플레이어
2. 적대적 검토
   - 정답 조합 고착
   - 자유일정 최적해
   - 소환수 자동 해결
   - 반복 작성 피로
   - 60분 초과
   - 자산 폭증
   - PC와 모바일 요구 혼합
3. 추적성 검수
   - 사용자 결정 → 정본 → Sheet → 향후 구현 요구
4. 독립 검수
   - 확정·후보·미검증 상태 혼합 여부
   - 누락·중복·상충 책임
5. 사용자 최종 승인

통과 전에는 `PLANNING_COMPLETE`를 true로 표시하지 않는다.

## 9. Art 프리프로덕션 게이트

### ART-STYLE-01

상태: `BLOCKED_BY_PLANNING_COMPLETE`

기획 완료 뒤 동일한 인게임 구성으로 그림체 후보를 비교한다. 콘텐츠 대상이 확정되기 전 대량 이미지 제작을 금지한다.

### ART-BIBLE-01

상태: `BLOCKED_BY_ART_STYLE`

색·선·명암·재질·실루엣·배경·FX·UI 가독성·접근성을 확정한다.

### ASSET-SPEC-01

상태: `BLOCKED_BY_ART_BIBLE`

자산 수량·상태·변형·내부 해상도·안전 영역·재사용·파일 규칙을 확정한다.

### AUDIO-DIRECTION-01

상태: `PENDING_AFTER_CONTENT_AND_ART_DIRECTION`

사운드 정체성·우선순위·무음 대체·제작 예산을 확정한다.

## 10. Codex·구현 진입 게이트

다음이 모두 충족돼야 한다.

```text
PLANNING_COMPLETE = true
PLANNING_REVIEW_01 = PASS
USER_PLANNING_APPROVAL = GRANTED
ART_STYLE_01 = APPROVED
ART_BIBLE_01 = APPROVED
ASSET_SPEC_01 = APPROVED
AUDIO_DIRECTION_01 = APPROVED_OR_EXPLICITLY_DEFERRED
INTEGRATED_PLANNING_ART_REVIEW = PASS
USER_APPROVED_FOR_CODEX_PLAN = true
```

그 후에도 순서는 다음과 같다.

```text
Codex read-only Plan
→ 기술 검수
→ 구현 범위·브랜치·검증 매트릭스 승인
→ 실행 프로필 전환
→ 구현
```

## 11. 구현 중단 조건

- 입력 실패와 설계 실패를 구분하지 못함
- 직접 작성 피로가 핵심 경험을 방해
- 두 번째 문제가 공통 Situation Challenge로 추가되지 않음
- 세션별 전용 프레임워크가 생김
- 첫 완주가 60분을 구조적으로 초과
- 자유일정·관계 제작량이 핵심 세션보다 커짐
- 보조 소환수 운용이 주문 설계보다 복잡
- 전술 전투장이 필드 사건과 단절됨
- 장기 소환수 성장·탑승이 초기 Slice보다 먼저 구현됨
- 최종 아트·FX가 글자 궤적·위험·대상을 가림

## 12. 현재 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
CODEX = NOT_RUN
PRODUCT_CODE = NONE
RUNTIME = NOT_RUN
PC_INPUT = NOT_RUN
MOBILE = NOT_RUN
ACCESSIBILITY = NOT_RUN
PERFORMANCE = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
ART_STYLE = NOT_APPROVED
```

현재 브랜치에서는 문서·결정·범위·추적성만 검증한다. PR 병합과 Google Sheet 쓰기는 사용자 검토 뒤 별도 수행한다.
