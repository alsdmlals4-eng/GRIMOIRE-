# GRIMOIRE 현재 확정 결정 스냅샷

## 1. 문서 역할

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
implementation: NOT_STARTED
codex: BLOCKED
planning_complete: false
```

이 문서는 이미 확정된 결정을 빠르게 복원하고, 새 항목이 확정·제안·미검증 중 어디에 속하는지 판정한다. 세부 책임 원본을 대체하지 않는다.

## 2. 읽기 순서와 결정 우선순위

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md
→ 주제별 단일 책임 원본
```

질문 가능한 상태:

- `USER_DECISION_REQUIRED`
- `USER_REVIEW_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자의 명시적 재개방

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정은 기억 확인 목적으로 다시 묻지 않는다.

## 3. 확정된 프로젝트 바인딩

- 프로젝트명: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- Google Sheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- Godot 프로젝트: `NOT_STARTED`
- Codex: `NOT_AUTHORIZED`

첨부 Godot Linux 실행 파일은 엔진 버전 확인 자료이며 저장소 자산이 아니다.

## 4. 확정된 플레이어 약속과 코어

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
7. 입력 실패와 주문 설계 실패의 분리

## 5. 확정된 Vertical Slice 구조

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

- 첫 완주 목표 `45~50분`, 하드 상한 `60분`
- 모든 핵심 세션은 공통 `Situation Challenge` 계약 사용
- 자유일정은 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 `CORE_POC` 재도입 금지
- M0→M1→M2→M3→M4는 Slice 내부 검증 체크포인트
- 문제마다 유효 해법 2개 이상
- 낮은 성적·부분 성공은 진행 영구 차단이 아님

## 6. 확정된 표현 구조

- 기준 구도: 가로형 `16:9`
- 학교·자유일정·비전투 탐색: 고정·장면 기반 3/4 필드
- 필드 캐릭터: 3.5~4등신 SD
- 대화: 같은 장소 배경 위 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 전투 캐릭터: 필드 SD 비율·기본 골격 재사용
- 마법 작성: 현재 화면 감속·암전 + 전용 오버레이
- 결과: 원래 필드의 환경 변화로 반영
- `같은 필드 화면에서 전투`: `SUPERSEDED`

## 7. 확정된 소환수 방향

### 메인 동반 정령

- 원소·정령 중심
- 같은 개체가 학습·관계·일상·현장·기록에 동행
- Vertical Slice 런타임 필수는 초기 형상 1개
- 장기 방향은 4단계 성장
- 해금된 현재 단계 이하의 이전 형상 선택
- 실제 성장 단계와 표시 형상 분리
- 장기 탑승
- 2~4단계·형상 선택 UI·탑승은 Slice 후행

### 전투 보조 소환수

- 원소·정령 시각 언어
- Slice는 수호 또는 견제 1체
- 4역할 전체·성장·탑승·획득·경제는 `UNRESOLVED_REFERENCE_CANDIDATE`

공통 금지:

- 글자 작성 대행
- 메인·보조 글자 자동 선택
- 자동 주문 설계·정답 제시
- 소환수만으로 전투 자동 해결

## 8. 확정된 작업 순서

결정 ID: `GM-PLANNING-SEQUENCE-01`

```text
기획 정본 전수 감사
→ 누락·충돌·과잉 범위 보완
→ 콘텐츠 상세 설계
→ 합성 관점·적대적 검토
→ 정본·Sheet 추적성 검수
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

Codex와 Godot 구현은 기획·검수보다 먼저 진행하지 않는다.

## 9. 현재 기획 완료 게이트

| 게이트 | 상태 | 책임 |
|---|---|---|
| `PLANNING-CONTENT-01` | `USER_REVIEW_REQUIRED` | 글자·문제·인물·자유일정·귀환 보상 |
| `PLANNING-PLATFORM-01` | `BLOCKED_BY_CONTENT_REVIEW` | PC 입력·오류 복구·모바일 분리 |
| `PLANNING-SCOPE-01` | `BLOCKED_BY_CONTENT_REVIEW` | 시간·장면·인물·문제 제작량 |
| `PLANNING-REVIEW-01` | `NOT_STARTED` | 합성·적대적·추적성 검수 |
| 사용자 기획 완료 승인 | `NOT_GRANTED` | 기획 종료와 아트 진입 승인 |

현재 다음 차단 게이트: `PLANNING-CONTENT-01`

## 10. 검토 중인 기획 후보

책임 문서:

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

상태: `DESIGN_SPEC_FOR_USER_REVIEW / NOT_YET_CANON`

권장 후보:

- 대표 글자: `흐름 / 집중 / 분산`
- 주인공: 일반 가정 출신 장학생 신입생의 정답 집착→책임 설계 성장선
- 핵심 동급생: 정석·속도 중심 경쟁자이자 협력자
- 축제 문제: 빛실 장막 복구
- 현장 문제: 외곽 생태 온실의 마력 관개 수로
- 보조 소환수: 수호형 우선
- PC 입력: 마우스 드래그·펜 보조·키보드 복구
- 시간 후보: 목표 46분·콘텐츠 상한 53분·하드 상한 60분

이 항목은 사용자 검토 전 최종 룬·세계관 고유명·런타임 데이터·구현 요구사항으로 승격하지 않는다.

## 11. 플랫폼 정책

- PC판을 먼저 설계·검증·출시한다.
- 모바일판은 공통 데이터·게임 규칙·콘텐츠 의미를 재사용한다.
- 모바일 입력·레이아웃·접근성·성능·배터리·백그라운드 복귀는 별도 검증한다.
- 기존 Android 터치 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`다.
- Gamepad는 직접 작성 코어를 대체할 검증된 방식이 없으므로 현재 `DEFERRED / NOT_PROMISED` 후보 상태다.

## 12. Base와 실행 계약

- Base release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`
- Base v9.3 운영 정합화: `IN_PROGRESS / IMPLEMENTATION_ADAPTER_DEFERRED_UNTIL_PLANNING_REVIEW`

## 13. 현재 검증 경계

```text
PLANNING_COMPLETE = false
ADVERSARIAL_REVIEW_COMPLETE = false
USER_APPROVED_FOR_CODEX_PLAN = false
CODEX = BLOCKED
GODOT_PROJECT = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

Google Sheet는 병합 전 수정하지 않는다. 생성 이미지와 연구 Artifact는 최종 시스템·자산·런타임 증거가 아니다.
