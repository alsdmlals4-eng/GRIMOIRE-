# GRIMOIRE 현재 확정 결정 스냅샷

## 1. 문서 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
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
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

이 문서는 승인된 현재 결정과 Gate를 빠르게 복원한다. 세부 규칙과 근거는 주제별 책임 원본이 담당한다.

## 2. 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
```

`CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED` 결정은 기억 확인 목적으로 다시 묻지 않는다.

## 3. 프로젝트 바인딩

- 프로젝트명: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- Google Sheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- Godot 프로젝트: `NOT_STARTED`
- Codex: `NOT_AUTHORIZED`

첨부 Godot 실행 파일은 엔진 버전 확인 자료이며 저장소 자산이 아니다.

## 4. 플레이어 약속과 비타협 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 입력 실패와 주문 설계 실패 분리
7. 학습→증명→표현→응용→발견·기록 순환

## 5. 승인된 Vertical Slice

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
- 별도 `CORE_POC` 재도입 금지

## 6. 승인된 마법 문법

- 메인 글자: `흐름`
- 보조 글자: `집중 / 분산`

| 조합 | 결과 | 대표 대가 |
|---|---|---|
| 흐름 | 경로·방향 변경 | 힘 부족·경로 불안정 |
| 흐름 + 집중 | 좁고 강한 정밀 흐름 | 과압·손상·반격 |
| 흐름 + 분산 | 넓고 완만한 안정 흐름 | 출력 부족·시간 지연 |

Slice 제외:

- 다중 보조 동시 사용
- 순서 의존 문법
- 완성 주문 자동 시전 스톡
- 대규모 주문·수정자 풀

## 7. 승인된 인물·콘텐츠

- 주인공: 일반 가정 출신 장학생 신입생
- 성장선: 정답 집착 → 결과를 설명하고 책임지는 설계자
- 교수: 의미·조건·책임을 가르치며 정답 조합을 직접 제시하지 않음
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 메인 동반 정령: 작은 늑대형 원소 정령수 초기 형상
- 전투 보조 소환수: 수호형 1체 우선
- 교수·동급생·정령의 최종 이름: `NAMING_PASS_REQUIRED`

| 세션 | 문제 | 핵심 판단 |
|---|---|---|
| 수업 | 불안정한 마력 수로 | 메인·보조 역할 비교 |
| 시험 | 취약한 부유 수정구 이송 | 효율과 안정성 |
| 축제 | 빛실 장막 복구 | 실용·화려·우아한 표현 |
| 현장 전투 | 관개 압력으로 폭주한 정령 | 빠른 돌파와 안전한 진정 |
| 현장 환경 | 마력 관개관 누출 | 묘목과 구조물 우선순위 |

## 8. 자유일정

- 정확히 3회
- 각 슬롯에서 `휴식 / 준비 / 교류` 중 1개
- `CALM`: 입력 복구·집중 안정
- `PREPARED`: 조건 관찰·결과 예측
- `CONNECTED`: 관계 반응·다른 관점
- 다음 핵심 세션 중심의 동등 규모 효용
- 누적 최적 루트·필수 정보 독점·유일 해법 독점 금지

## 9. PC 작성 UX

- 획 작성: 마우스 왼쪽 드래그, 펜 보조
- 취소: 오른쪽 버튼 또는 `Esc`
- Undo: `Ctrl+Z`
- 전체 지우기: `R` 길게 또는 확인형 Clear
- 후보 이동: 클릭·휠·방향키·Tab
- 후보 확정: 클릭 또는 `Enter`
- Gamepad: `DEFERRED / NOT_PROMISED`
- 명시적 시전 전 마나·횟수 미소모
- Undo·취소·재작성 자원 미소모
- 낮은 확신 후보 자동 선택 금지
- 입력 실패·문법 실패·상황 실패 분리
- 정상 완주 필수 성공 작성: `7회`
- 안내형 복구 포함 목표 상한: `10회`
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용

정확한 허용 오차·선 보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## 10. 마도서

```text
상황
→ 글자·조합
→ 의도
→ 실제 결과
→ 부작용·포기
→ 발견
→ 플레이어 명명
```

- 자동 최적 조합 추천 금지
- 기록 클릭 자동 시전 금지
- 재사용 시 현재 상황 검증 재실행
- 귀환 시 `정밀 / 안정 / 표현 / 책임` 성향을 문장으로 요약

## 11. 표현·제작량 잠금

- 기준 구도 `16:9`
- 고정·장면 기반 3/4 필드
- 필드 3.5~4등신 SD, 대화 반신 일러스트
- 별도 고정 3/4 전술 전투장
- 현재 화면 감속·암전 + 작성 오버레이
- 결과를 원래 필드 환경 변화로 반영

Slice 제작량:

- 학교 공용 장면 세트 1, 축제 상태 변형 1
- 현장 장면 1, 동일 현장 전술 전투장 1
- 작성 오버레이 1, 마도서 화면 1
- 주인공·교수·동급생
- 메인 동반 정령·수호형 보조 소환수·폭주 정령
- 글자 3개, Situation Challenge 5개

새 학교 지역, 적 2종 이상, 메인 정령 2~4단계 런타임, 보조 소환수 4역할, 별도 미니게임 프레임워크, 장문 관계·연애 분기는 Slice에서 금지한다.

## 12. 벤치마킹 선행 원칙

결정 ID: `GM-BENCHMARK-FIRST-01`

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름을 설계하거나 의미 있게 변경할 때는 범위에 맞는 `QUICK / STANDARD / DEEP` 벤치마킹을 먼저 수행한다. 최근 유효한 결과는 재사용하고 `ADOPT / ADAPT / REJECT`와 GRIMOIRE 적용 계약을 기록한다.

책임 원본: `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 13. 기획 정본 즉시 동기화

결정 ID: `GM-CANON-SYNC-01`

```text
Decision ID 확정
→ GitHub 권위 문서·계획 데이터
→ authority commit
→ 연결된 Google Sheet 탭·행
→ 양쪽 재조회
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

현재 번들 `GR-SYNC-20260731-04`:

- 포함 결정: `GM-PLANNING-APPROVAL-01`, `GM-BENCHMARK-FIRST-01`, `GM-WRITING-FREQUENCY-01`, `GM-GRIMOIRE-RECORD-01`, `GM-PLANNING-GATES-01`, `GM-CANON-SYNC-01`
- authority commit: `fa82c4c4cebe1232f0ff809ff4321ebacefb3731`
- Google Sheet: 18개 탭 반영·재조회 완료
- 상태: `SYNCED_TO_WORKING_BRANCH`
- main 상태: PR #22 병합 대기

작업 브랜치 상태를 main 동기화로 표시하지 않는다. 한쪽 쓰기 실패는 `GITHUB_ONLY` 또는 `SHEET_ONLY`로 남긴다.

책임 원본:

- `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- `docs/planning/CANON_SYNC_STATE.json`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`

## 14. 게이트 상태

| 게이트 | 상태 |
|---|---|
| Gate 1 콘셉트 | `APPROVED` |
| `PLANNING-CONTENT-01` | `APPROVED` |
| `PLANNING-PLATFORM-01` | `APPROVED_WITH_PLAYTEST_TUNING_PENDING` |
| `PLANNING-SCOPE-01` | `APPROVED_WITH_SOLO_PRODUCTION_CONDITION` |
| `PLANNING-REVIEW-01` | `PASS_WITH_CORRECTIONS_APPLIED` |
| 기획 완료 | `TRUE` |
| `ART-STYLE-01` | `NEXT_PRODUCT_GATE` |
| `ART-BIBLE-01` | `BLOCKED_BY_ART_STYLE` |
| `ASSET-SPEC-01` | `BLOCKED_BY_ART_BIBLE` |
| `AUDIO-DIRECTION-01` | `PENDING` |
| Codex Plan | `BLOCKED_BY_ART_AND_INTEGRATED_REVIEW` |
| Godot 구현 | `NOT_STARTED` |

## 15. 검증 경계

```text
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
