# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
baseline_date: 2026-07-31
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
gate_1: APPROVED
project_core: CORE_CONFIRMED
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning_complete: true
benchmark_complete: true
adversarial_review_complete: true
implementation: NOT_STARTED
codex: BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
next_product_gate: ART-STYLE-01
canon_sync_policy: GM-CANON-SYNC-01
canon_sync_bundle: GR-SYNC-20260731-04
canon_sync_state: GITHUB_ONLY
```

현재 기획 완결 패스는 사용자 승인, 벤치마킹, 적대적 검토와 정본 승격까지 완료됐다. 제품 코드·Scene·Resource·게임 데이터·자산은 아직 없다.

## 질문 전 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 주제별 책임 원본
```

확정된 결정은 기억 확인 목적으로 다시 묻지 않는다.

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
- 문제마다 유효 해법 2개 이상
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- M0→M1→M2→M3→M4는 Slice 내부 체크포인트
- 별도 `CORE_POC` 재도입 금지

## 승인된 콘텐츠 정본

책임 문서:

- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

핵심:

- 글자: `흐름 / 집중 / 분산`
- 수업: 불안정한 마력 수로
- 시험: 취약한 부유 수정구 이송
- 축제: 빛실 장막 복구
- 현장: 생태 온실·마력 관개 수로의 폭주 정령과 누출
- 주인공: 일반 가정 출신 장학생 신입생
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 전투 보조 소환수: 수호형 1체 우선
- 마도서: 과정·대가·발견 기록, 완성 주문 자동 시전 금지

## PC 입력·UX

- 마우스 왼쪽 드래그와 펜 보조
- 오른쪽 버튼·Esc 취소
- `Ctrl+Z` Undo
- 클릭·Enter 후보 확정
- 자동 시전 금지
- 명시적 시전 전 자원 미소모
- 정상 완주 필수 성공 작성 7회
- 안내형 복구 포함 목표 상한 10회
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용
- Gamepad `DEFERRED / NOT_PROMISED`

정확한 허용 오차·선 보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## 승인된 화면·소환수

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

- 메인 동반 정령: 초기 형상 1개
- 장기 방향: 4단계 성장·이전 형상 선택·탑승
- 후행 범위: 메인 2~4단계 런타임·형상 선택 UI·탑승
- 전투 보조 소환수: 수호형 1체 우선
- 소환수의 글자·조합·정답 대행 금지

## 벤치마킹 선행 원칙

상태: `ACTIVE_PROJECT_WORK_PRINCIPLE`

새 시스템, 핵심 규칙, 콘텐츠 구조, UX 흐름을 설계하거나 의미 있게 변경할 때 벤치마킹을 먼저 수행한다.

- 매번 대규모 조사를 반복하지 않는다.
- `QUICK / STANDARD / DEEP` 중 범위에 맞는 규모를 사용한다.
- 최근 동일 질문의 유효한 결과는 재사용한다.
- `ADOPT / ADAPT / REJECT`와 프로젝트 적용 계약을 기록한다.

책임 원본: `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 기획 정본 즉시 동기화

결정 ID: `GM-CANON-SYNC-01`

주요 변경사항과 승인 결정은 같은 작업 단위에서 GitHub 권위 문서·계획 데이터와 Google Sheet에 같은 Decision ID로 반영한다.

```text
GitHub authority commit
→ Sheet 반영
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

현재 초기 동기화 번들:

- Sync ID: `GR-SYNC-20260731-04`
- GitHub 상태: 반영 중
- Sheet 상태: 반영 전
- main 상태: PR 병합 대기

책임 원본:

- `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- `docs/planning/CANON_SYNC_STATE.json`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`

## 현재 제품 경로

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
→ 마지막에 구현
```

현재 `ART-STYLE-01`만 다음 제품 게이트다. 그림체 비교용 소수 기준 샷은 허용하지만 대량 이미지·사운드 제작은 금지한다.

## Base v9.3 운영 정합화

상태: `IN_PROGRESS`

- Base release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`

Adapter·Snapshot·CI의 v9.3 정합화는 별도 운영 변경으로 완료해야 한다. 이는 게임 기획 완료나 런타임 구현을 의미하지 않는다.

## GDD Google Sheets

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 역할: `USER_FACING_GDD_WORKSPACE`
- GitHub에 없는 사용자 편집: `PROPOSED_SHEET_CHANGE`
- 승인된 주요 변경: 작업 브랜치와 즉시 동기화
- 병합 전: `SYNCED_TO_WORKING_BRANCH`
- 병합 후 main 재검증: `SYNCED_TO_MAIN`

## 현재 보호 결정

- 프로젝트 코어를 증거 없이 재개방하지 않음
- 입력 실패와 주문 설계 실패 분리
- 신규·미숙·중요 글자는 직접 작성
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 자유일정에 누적 최적 루트를 만들지 않음
- 첫 완주 하드 상한 60분
- 필드 SD + 대화 반신 + 별도 고정 3/4 전투장
- 메인 소환수 장기 방향이 초기 Slice를 팽창시키지 않음
- 마도서를 완성 주문 자동 시전 스톡으로 만들지 않음
- Art Bible·Asset Specification 전 대량 자산 제작 금지
- 기획·아트 통합 검수 전 Codex Build 금지
- 사용자 검토 없는 PR 병합 금지

## 현재 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
CODEX = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
