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
planning_complete: true
benchmark_complete: true
adversarial_review_complete: true
implementation: NOT_STARTED
codex: BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
next_product_gate: ART-STYLE-01
```

이 문서는 이미 확정된 결정을 빠르게 복원하고, 새 항목이 확정·제안·미검증 중 어디에 속하는지 판정한다. 세부 책임 원본을 대체하지 않는다.

## 2. 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ 이 문서
→ docs/planning/DECISION_LOG.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31Q.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
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

## 3. 프로젝트 바인딩

- 프로젝트명: `GRIMOIRE: 세계를 다시 쓰는 법`
- 저장소: `alsdmlals4-eng/GRIMOIRE-`
- 1차 플랫폼: `PC`
- 후속 플랫폼: `Mobile`
- 엔진 기준 후보: `Godot 4.7.1 stable`
- Google Sheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`
- Godot 프로젝트: `NOT_STARTED`
- Codex: `NOT_AUTHORIZED`

첨부 Godot Linux 실행 파일은 엔진 버전 확인 자료이며 저장소 자산이 아니다.

## 4. 플레이어 약속과 비타협 코어

### 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

### 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

### 비타협

1. 의미를 가진 마법 글자
2. `메인 글자 1개 + 보조 글자 0개 이상`
3. 신규·미숙·중요 글자의 직접 작성
4. 상황·목표·위험에 따른 주문 변형 판단
5. 즉각적이고 설명 가능한 세계 변화
6. 입력 실패와 주문 설계 실패 분리
7. 학습→증명→표현→응용→발견·기록 순환

## 5. Vertical Slice

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

- 목표 중앙값 `45~50분`
- 콘텐츠 상한 `53분`
- 하드 상한 `60분`
- 모든 핵심 세션은 공통 `Situation Challenge` 계약 사용
- 문제마다 유효 해법 2개 이상
- 자유일정은 `휴식 / 준비 / 교류`
- 중요 일정 사이 자유일정 1회
- 세션 경계 중심 최소 저장
- 별도 `CORE_POC` 재도입 금지
- M0→M1→M2→M3→M4는 Slice 내부 검증 체크포인트
- 낮은 성적·부분 성공은 진행 영구 차단이 아님

## 6. 승인된 마법 문법

### 글자

- 메인: `흐름`
- 보조: `집중 / 분산`

### 결과

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

## 7. 승인된 콘텐츠

### 핵심 인물

- 주인공: 일반 가정 출신 장학생 신입생
- 성장: 정답 집착 → 결과를 설명하고 책임지는 설계자
- 교수: 의미·조건·책임을 가르치며 정답 조합을 직접 제시하지 않음
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 갈등: 혈통 우열이 아니라 교육 자원·사전 훈련·실패 허용 폭의 차이
- 최종 이름: `NAMING_PASS_REQUIRED`

### 핵심 문제

| 세션 | 문제 | 판단 |
|---|---|---|
| 수업 | 불안정한 마력 수로 | 메인과 보조의 역할 비교 |
| 시험 | 취약한 부유 수정구 이송 | 효율과 안정성 |
| 축제 | 빛실 장막 복구 | 실용·화려·우아한 표현 |
| 현장 전투 | 관개 압력으로 폭주한 정령 | 빠른 돌파와 안전한 진정 |
| 현장 환경 | 마력 관개관 누출 | 묘목과 구조물의 우선순위 |

### 소환수

- 메인 동반 정령: 작은 늑대형 원소 정령수 초기 형상
- 장기 방향: 4단계 성장·이전 형상 선택·탑승
- Slice 보조 소환수: 수호형 1체 우선
- 자동 공격 해결·글자 선택·자동 시전·정답 제시 금지

## 8. 자유일정

- 횟수: 정확히 3회
- 선택: 각 슬롯에서 휴식·준비·교류 중 1개
- `CALM`: 입력 복구·집중 안정
- `PREPARED`: 조건 관찰·결과 예측
- `CONNECTED`: 관계 반응·다른 관점
- 효과는 다음 핵심 세션을 주로 보조
- 장기 누적 최적 루트 금지
- 필수 정보·유일 해법 독점 금지
- 모든 선택에 짧은 장면과 동등 규모의 효용 제공

## 9. PC 작성 UX

### 입력

- 획 작성: 마우스 왼쪽 드래그, 펜 보조
- 현재 획 취소: 오른쪽 버튼 또는 `Esc`
- Undo: `Ctrl+Z`
- 전체 지우기: `R` 길게 또는 확인형 Clear
- 후보 이동: 클릭·휠·방향키·Tab
- 후보 확정: 클릭 또는 `Enter`
- Gamepad: `DEFERRED / NOT_PROMISED`

### 책임 흐름

```text
획 입력
→ 인식 후보
→ 사용자 확인·부분 수정
→ 글자 의미 확정
→ 조합
→ 상황 경향 미리보기
→ 명시적 시전
→ 세계 변화
→ 원인·대가 설명
```

- 명시적 시전 전 마나·횟수 미소모
- Undo·취소·재작성 자원 미소모
- 낮은 확신 후보 자동 선택 금지
- 입력 실패·문법 실패·상황 실패 분리

### 빈도

- 정상 완주 필수 성공 작성: 7회
- 안내형 복구 포함 목표 상한: 10회
- 같은 문제에서 확인한 동일 글자 토큰 재선택 허용

정확한 허용 오차·선 보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## 10. 마도서

마도서는 다음을 기록한다.

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

## 11. 표현·제작량

### 표현

- 기준 구도: `16:9`
- 학교·자유일정·탐색: 고정·장면 기반 3/4 필드
- 필드 캐릭터: 3.5~4등신 SD
- 대화: 같은 장소 배경 위 반신 일러스트
- 전투: 별도 고정 3/4 전술 전투장
- 작성: 현재 화면 감속·암전 + 오버레이
- 결과: 원래 필드 환경 변화로 복귀
- 같은 필드 화면 전투: `SUPERSEDED`

### 제작량 잠금

- 학교 공용 장면 세트 1
- 축제 상태 변형 1
- 현장 장면 1
- 동일 현장 전술 전투장 1
- 작성 오버레이 1
- 마도서 화면 1
- 주인공·교수·동급생
- 메인 동반 정령·수호형 보조 소환수·폭주 정령
- 글자 3개, Situation Challenge 5개

금지:

- 새 학교 지역·다수 축제 부스
- 적 2종 이상
- 메인 동반 정령 2~4단계 런타임
- 보조 소환수 4역할 편성
- 별도 미니게임 프레임워크
- 장문 관계 분기·연애 시스템

## 12. 벤치마킹 작업 원칙

결정 ID: `GM-BENCHMARK-FIRST-01`

새 시스템, 핵심 규칙, 콘텐츠 구조, UX 흐름을 설계하거나 의미 있게 변경할 때는 벤치마킹을 먼저 수행한다.

- 매번 대규모 조사를 반복하지 않는다.
- 범위에 따라 `QUICK / STANDARD / DEEP`를 선택한다.
- 최근 동일 질문의 유효한 조사를 재사용한다.
- 공식·1차 자료를 우선한다.
- `ADOPT / ADAPT / REJECT`와 GRIMOIRE 적용 계약을 남긴다.
- 다른 작품의 고유 표현은 복제하지 않는다.

책임 원본:

- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## 13. Base와 실행 계약

- Base release: `v9.3.0`
- release commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`
- evidence commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`
- 활성 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md`
- v6·v8: `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`

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

Google Sheet는 관련 PR 병합 전 수정하지 않는다. 생성 이미지와 연구 Artifact는 최종 시스템·자산·런타임 증거가 아니다.
