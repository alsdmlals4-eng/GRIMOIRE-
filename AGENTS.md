# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 운영 규칙이다. 승인된 코어를 보호하면서 기획을 완결하고 검수한 뒤, 아트 프리프로덕션과 Codex 구현으로 이동한다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
gate_1: APPROVED
project_core: CORE_CONFIRMED
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning_complete: false
implementation: NOT_STARTED
codex: BLOCKED
next_blocker: PLANNING-CONTENT-01
```

첨부 Godot Linux 실행 파일은 버전 확인 자료다. 저장소 프로젝트·배포 자산으로 간주하거나 커밋하지 않는다.

## 2. 권한 우선순위

1. 사용자의 최신 명시적 결정
2. 이 `AGENTS.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `START_HERE.md`
5. `docs/ACTIVE_CONTEXT.md`
6. `docs/planning/DECISION_LOG.md`와 최신 Addendum
7. 주제별 단일 책임 원본
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`
10. `docs/DOCUMENTATION_MAP.md`
11. 프로젝트 Base Adapter·Skill Snapshot
12. 실제 코드·Scene·Resource·데이터·자산·테스트
13. 프로젝트가 고정한 Base release/evidence commit
14. legacy 계약·과거 대화·외부 AI 결과·추정

충돌 시 최신 사용자 결정과 최신 책임 원본이 우선한다. Sheet 단독 값, 생성 이미지, 연구 Artifact는 승인 상태가 없으면 정본이 아니다.

## 3. 필수 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31P.md
→ docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md
→ 질문 주제의 단일 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ Registry·Adapter·Snapshot
```

질문 가능한 상태:

- `USER_DECISION_REQUIRED`
- `USER_REVIEW_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자의 명시적 재개방

확정된 결정을 기억 확인 목적으로 다시 묻지 않는다. 저장소·Sheet 조회로 해결되는 사실을 사용자에게 전가하지 않는다.

## 4. Base와 실행 계약

- Base: `alsdmlals4-eng/Base`
- release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- 적용 원본: `skills/PROJECT_BASE_ADAPTER.json`
- 생성 뷰: `skills/PROJECT_SKILL_SNAPSHOT.json`
- 라우터: `.agents/skills/grimoire-workflow-router/SKILL.md`

v6·v8은 `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`다. 삭제하지 않지만 현재 실행 권한이 아니다. Base Skill 본문을 프로젝트에 복제하지 않는다.

## 5. 승인된 코어

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

### 비타협

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 입력 실패와 주문 설계 실패 분리
7. 학습→증명→표현→응용→발견·기록 순환

## 6. 승인된 Vertical Slice

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

- 목표 `45~50분`, 하드 상한 `60분`
- 공통 `Situation Challenge`
- 문제마다 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지

## 7. 승인된 표현·소환수

```text
필드 = 가로형 고정·장면 기반 3/4 + 3.5~4등신 SD
대화 = 같은 장소 배경 위 반신 일러스트
전투 = 별도 고정 3/4 전술 전투장 + 필드 SD 골격 재사용
작성 = 현재 화면 감속·암전 + 작성 오버레이
결과 = 원래 필드 환경 변화로 복귀
```

- 같은 필드 화면 전투는 `SUPERSEDED`.
- 메인 동반 정령은 Slice 초기 형상 1개.
- 장기 4단계 성장·이전 형상 선택·탑승은 후행.
- 전투 보조 소환수는 Slice 수호 또는 견제 1체.
- 소환수는 글자 작성·조합 판단·정답을 대행하지 않는다.

## 8. 현재 기획 완결 패스

책임 문서:

`docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`

상태: `DESIGN_SPEC_FOR_USER_REVIEW / NOT_YET_CANON`

현재 게이트:

```text
PLANNING-CONTENT-01 = USER_REVIEW_REQUIRED
PLANNING-PLATFORM-01 = BLOCKED_BY_CONTENT_REVIEW
PLANNING-SCOPE-01 = BLOCKED_BY_CONTENT_REVIEW
PLANNING-REVIEW-01 = NOT_STARTED
PLANNING_COMPLETE = false
```

권장 후보는 검토 전 확정으로 표시하지 않는다.

- `흐름 / 집중 / 분산`
- 장학생 신입생의 정답 집착→책임 설계 성장선
- 정석 중심 동급생과 경쟁·협력 관계
- 빛실 장막 축제 문제
- 생태 온실·마력 관개 수로 현장 문제
- 수호형 보조 소환수
- PC 마우스·펜·키보드 복구 입력
- 46분 목표·53분 콘텐츠 상한·60분 하드 상한

## 9. 확정된 작업 순서

```text
기획 감사·상세 설계
→ PLANNING-CONTENT-01
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

Art Style과 Codex를 기획 완료보다 앞당기지 않는다.

## 10. 플랫폼 정책

- PC판을 먼저 설계·검증·출시한다.
- 모바일판은 공통 규칙·콘텐츠·데이터 계약을 재사용한다.
- 모바일 입력·레이아웃·접근성·성능·배터리·백그라운드 복귀는 별도 검증한다.
- 기존 Android 터치 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`다.
- Gamepad는 현재 `DEFERRED / NOT_PROMISED` 후보 상태다.
- PC 우선이 자유 이동형 대형 맵·복잡한 단축키·실시간 액션 전투를 자동 승인하지 않는다.

## 11. 현재 허용과 금지

`PLANNING_ONLY_PROFILE`에서 허용:

- 기획·벤치마킹·시스템·데이터·서사·UX 설계
- 누락·충돌·과잉 범위 감사
- Decision Log·Registry·Issue·Draft PR 문서 정리
- 합성 관점·적대적 검토
- Art Style 비교용 소수 자료와 프리프로덕션 설계

금지:

- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 생성
- 구현·런타임·PC·모바일·사람 검증 완료 주장
- 사용자 승인 없는 후보 확정·제품 범위 변경·프로필 전환
- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- 기획 완료 전 대량 이미지·사운드 제작

## 12. Google Sheets

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 역할: `USER_FACING_GDD_WORKSPACE`
- GitHub에 없는 편집: `PROPOSED_SHEET_CHANGE`
- 현재 쓰기: 금지
- 관련 PR 병합 후 계약된 탭·범위만 동기화
- main과 Sheet를 모두 재조회한 뒤에만 `SYNCED`

Sheet는 실제 구현·테스트 증거를 대체하지 않는다.

## 13. 변경·검증·종료

- 기획 변경은 책임 원본·Decision Addendum·Active Context·현재 확정 스냅샷을 함께 갱신한다.
- 확정·후보·미검증 상태를 혼합하지 않는다.
- 기획 PR과 구현 PR을 분리한다.
- 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`다.
- 제품 파일이 없는 현재 단계에서는 문서·JSON·라우팅·결정 추적성만 검증한다.

종료 전 확인:

1. 새 작업자가 저장소만으로 다음 게이트를 찾을 수 있는가
2. 후보가 확정처럼 표시되지 않았는가
3. 승인 코어와 Slice 구조가 유지됐는가
4. PC 우선·모바일 후속이 모든 활성 문서에서 일치하는가
5. Codex·Godot·Sheet 쓰기가 차단됐는가
6. 제품 코드·자산 diff가 0인가
