# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 규칙이다. 승인된 코어와 기획 정본을 보호하고, 벤치마킹·기획 정본 동기화·검수·아트 프리프로덕션·기술 계획·구현 순서를 지킨다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
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
next_blocker: ART-STYLE-01
canon_sync_policy: GM-CANON-SYNC-01
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
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`과 계획 데이터
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
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 질문 주제의 단일 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ Registry·계획 데이터·Adapter·Snapshot
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

## 4. 벤치마킹 선행 원칙

결정 ID: `GM-BENCHMARK-FIRST-01`

새 시스템, 핵심 규칙, 콘텐츠 구조 또는 UX 흐름을 설계하거나 의미 있게 변경할 때는 반드시 벤치마킹을 먼저 수행한다.

- 매번 대규모 조사를 반복하지 않는다.
- 결정 범위에 맞춰 `QUICK / STANDARD / DEEP`를 선택한다.
- 최근 동일 결정 질문의 유효한 벤치마킹이 있으면 재사용한다.
- 공식·1차 자료를 우선한다.
- 다른 작품의 고유 명칭·서사·아트·UI를 복제하지 않고 설계 원리만 추출한다.
- `ADOPT / ADAPT / REJECT`와 프로젝트 적용 계약을 기록한다.
- 벤치마킹 완료 전 설계 후보를 정본으로 확정하지 않는다.

비발동:

- 오탈자·문장 교정
- 상태·SHA·날짜·링크 동기화
- 승인 구조의 단순 데이터 입력
- 설계를 바꾸지 않는 명백한 버그 수정

책임 원본: `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 5. 기획 정본 즉시 동기화

결정 ID: `GM-CANON-SYNC-01`

주요 변경사항과 사용자 승인 결정은 같은 작업 단위에서 GitHub 권위 문서·계획 데이터와 연결된 Google Sheet 위치를 찾아 **같은 Decision ID**로 반영한다.

```text
승인
→ Decision ID 확정
→ GitHub 권위 문서·계획 데이터 갱신
→ authority commit 생성
→ 연결된 Sheet 탭·행 갱신
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main SHA·Sheet 재검증
→ SYNCED_TO_MAIN
```

필수 규칙:

- 작업 브랜치 반영과 main 병합 상태를 혼합하지 않는다.
- `SYNCED_TO_WORKING_BRANCH`는 main 확정 상태가 아니다.
- Sheet 단독 편집은 `PROPOSED_SHEET_CHANGE`다.
- 한쪽 쓰기 실패 시 `GITHUB_ONLY` 또는 `SHEET_ONLY`로 남기고 완료로 표시하지 않는다.
- 주요 변경 보고에 Decision ID, GitHub 경로, authority commit, Sheet 범위, 동기화 상태를 남긴다.
- 이전의 “PR 병합 전 Sheet 쓰기 금지” 규칙은 `SUPERSEDED`다.

책임 원본:

- `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- `docs/planning/CANON_SYNC_STATE.json`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`

## 6. Base와 실행 계약

- Base: `alsdmlals4-eng/Base`
- release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- 적용 원본: `skills/PROJECT_BASE_ADAPTER.json`
- 생성 뷰: `skills/PROJECT_SKILL_SNAPSHOT.json`
- 라우터: `.agents/skills/grimoire-workflow-router/SKILL.md`

v6·v8은 `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`다. 삭제하지 않지만 현재 실행 권한이 아니다. Base Skill 본문을 프로젝트에 복제하지 않는다.

## 7. 승인된 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 입력 실패와 주문 설계 실패 분리
7. 학습→증명→표현→응용→발견·기록 순환

## 8. 승인된 Vertical Slice

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
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 CORE_POC 재도입 금지

세부 기획 정본: `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

## 9. 승인된 글자·콘텐츠·입력

- 글자: `흐름 / 집중 / 분산`
- 수업: 불안정한 마력 수로
- 시험: 취약한 부유 수정구 이송
- 축제: 빛실 장막 복구
- 현장: 생태 온실·마력 관개 수로의 폭주 정령과 누출
- 주인공: 일반 가정 출신 장학생 신입생
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 보조 소환수: 수호형 1체 우선
- 정상 완주 필수 성공 작성: 7회
- 안내형 복구 포함 목표 상한: 10회
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용
- 명시적 시전 전 Undo·취소·재작성은 자원 미소모
- Gamepad: `DEFERRED / NOT_PROMISED`
- 마도서: 상황·의도·결과·부작용·발견 기록, 자동 주문 스톡 금지

정확한 인식 허용치·선 보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## 10. 승인된 표현·소환수

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
- 전투 보조 소환수는 Slice 수호형 1체 우선.
- 소환수는 글자 작성·조합 판단·정답을 대행하지 않는다.

## 11. 게이트와 작업 순서

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

Art Style·Art Bible·Asset Specification·Audio Direction과 통합 검수 전에 Codex 또는 Godot 구현을 시작하지 않는다.

## 12. 플랫폼 정책

- PC판을 먼저 설계·검증·출시한다.
- 모바일판은 공통 규칙·콘텐츠·데이터 계약을 재사용한다.
- 모바일 입력·레이아웃·접근성·성능·배터리·백그라운드 복귀는 별도 검증한다.
- 기존 Android 터치 연구는 `REFERENCE_CANDIDATE / NOT_RUNTIME_VALIDATED`다.
- PC 우선이 자유 이동형 대형 맵·복잡한 단축키·실시간 액션 전투를 자동 승인하지 않는다.

## 13. 현재 허용과 금지

`PLANNING_ONLY_PROFILE`에서 허용:

- `ART-STYLE-01` 비교 설계와 소수 기준 샷
- Art Bible·Asset Specification·Audio Direction 문서 설계
- 벤치마킹·기획·서사·UX 보완
- Decision Log·Registry·Issue·Draft PR 정리
- GitHub·Google Sheet 기획 정본 동기화
- 합성 관점·적대적 검토

금지:

- Codex 실행
- Godot 코드·Scene·Resource·게임 데이터 생성
- 구현·런타임·PC·모바일·사람 검증 완료 주장
- 승인 없는 코어·범위·프로필 전환
- 기본 브랜치 직접 수정
- 사용자 검토 없는 PR 병합
- Art Bible·Asset Specification 전 대량 이미지·사운드 제작

## 14. Google Sheets

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- 역할: `USER_FACING_GDD_WORKSPACE`
- GitHub에 없는 편집: `PROPOSED_SHEET_CHANGE`
- 승인된 주요 변경: 작업 브랜치와 즉시 동기화
- 병합 전 상태: `SYNCED_TO_WORKING_BRANCH`
- 병합 후 main 재검증 상태: `SYNCED_TO_MAIN`
- `SYNCED` 계열은 양쪽을 재조회한 뒤에만 사용

Sheet는 실제 구현·테스트 증거를 대체하지 않는다.

## 15. 변경·검증·종료

- 기획 변경은 책임 원본·Decision Addendum·Active Context·현재 확정 스냅샷·계획 데이터·Sheet를 같은 작업 단위에서 갱신한다.
- 확정·후보·미검증 상태를 혼합하지 않는다.
- 기획 PR과 구현 PR을 분리한다.
- 실행하지 않은 검증은 `NOT_RUN` 또는 `BLOCKED_UNVERIFIED`다.
- 제품 파일이 없는 현재 단계에서는 문서·JSON·라우팅·결정 추적성만 검증한다.

종료 전 확인:

1. 새 작업자가 저장소만으로 다음 게이트를 찾을 수 있는가
2. 벤치마킹 선행 조건을 판정했는가
3. 주요 승인 변경이 GitHub와 Sheet에 같은 Decision ID로 반영됐는가
4. 변경 경로·authority commit·Sheet 범위가 기록됐는가
5. 승인 코어와 Slice 구조가 보존됐는가
6. 후보·미검증 수치를 완료 증거로 사용하지 않았는가
7. 제품 파일·main·PR 병합을 권한 없이 변경하지 않았는가
