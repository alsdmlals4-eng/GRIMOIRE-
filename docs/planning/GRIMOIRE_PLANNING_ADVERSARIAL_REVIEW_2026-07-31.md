# GRIMOIRE 기획 완결 적대적 검토 — 2026-07-31

## 1. 문서 상태

```yaml
status: PASS_WITH_CORRECTIONS_APPLIED
review_id: GR-PLANNING-REVIEW-01
scope:
  - approved-content-design
  - benchmark-derived-ux-contract
  - pc-input
  - free-schedule
  - time-and-production-budget
review_mode:
  - synthetic-player-perspectives
  - adversarial-design-review
  - scope-review
  - traceability-review
runtime_validation: NOT_RUN
human_playtest: NOT_RUN
implementation_authority: NONE
```

## 2. 검토 대상

- `docs/planning/GRIMOIRE_PLANNING_COMPLETION_PASS_2026-07-31.md`
- `docs/planning/benchmarks/GRIMOIRE_BENCHMARK_PASS_2026-07-31.md`
- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
- 기존 Gate 1 Vertical Slice 계약
- 현재 확정 결정과 개발 게이트

## 3. 합성 플레이어 관점

### 3.1 시스템 최적화형

질문:

- `집중`이 모든 문제에서 빠르고 강한 상위 선택이 되는가
- 자유일정의 `준비`가 사실상 정답인가
- 하나의 전역 점수로 모든 결과가 서열화되는가

판정:

- `집중`은 시험에서 효율, 축제에서 선명한 표현, 현장에서 빠른 해결을 제공하지만 손상·반격·구조 부담 위험을 가진다.
- `분산`은 안정·피해 감소·넓은 보호를 제공하지만 시간·자원·부분 포기를 요구한다.
- 자유일정 효과는 다음 핵심 세션에 한정하고 누적 최적 루트를 만들지 않는다.
- 전역 종합 점수는 사용하지 않고 상황 적합성·설계·안정성·책임 기록을 분리한다.

결론: `PASS_WITH_GUARDRAIL`.

### 3.2 학교생활·관계 중심형

질문:

- 자유일정이 단순 버프 선택 화면인가
- 장학생 설정과 가문 출신 동급생이 평면적인 계층 갈등인가
- 축제가 전투 사이의 장식 구간에 그치는가

판정:

- 각 자유일정은 짧은 인물·동반자 장면과 다음 세션의 해석 차이를 함께 가진다.
- 갈등은 혈통의 우열이 아니라 사전 교육, 자료 접근, 실패 허용 폭의 차이로 표현한다.
- 축제는 점수 경쟁이 아니라 `PRACTICAL / SPECTACULAR / ELEGANT` 표현 성향을 기록한다.

결론: `PASS_WITH_NARRATIVE_CONSTRAINT`.

### 3.3 마우스 작성 초보·저숙련형

질문:

- 마법 글자를 반복해서 그리는 행위가 피로와 진행 차단을 만드는가
- 오인식이 플레이어의 설계 실패로 잘못 평가되는가
- 잘못 그린 획을 되돌리기 어렵거나 자원을 잃는가

판정:

- 정상 완주 필수 성공 작성은 7회, 안내형 복구 포함 목표 상한은 10회다.
- 같은 문제 안에서 확인한 동일 글자는 토큰으로 재선택할 수 있다.
- 후보 확인 전 자동 시전이 없고 Undo·취소·재작성은 자원을 소모하지 않는다.
- 입력 실패, 문법 실패, 상황 부적합을 서로 다른 피드백과 로그로 구분한다.

결론: `PASS_WITH_ACCESSIBILITY_HYPOTHESES`. 정확한 허용 오차·선 보정·감속 비율은 사람·PC 입력 검증 전 확정하지 않는다.

### 3.4 복귀 플레이어

질문:

- 중단 후 현재 일정·목표·선택·보유 글자를 이해할 수 있는가
- 마도서가 기록 과밀 또는 자동 정답 목록이 되는가

판정:

- 세션 경계 저장을 유지한다.
- 복귀 요약은 현재 일정, 목표, 직전 자유일정, 학습 글자, 동반자·보조 소환수 상태를 10초 안에 보여 주는 계약을 유지한다.
- 마도서는 상황·의도·실제 결과·부작용·발견을 기록하며 자동 시전하지 않는다.

결론: `PASS`.

### 3.5 1인 개발 제작 관점

질문:

- 학교·축제·현장·전투가 별도 대형 콘텐츠 세트로 팽창하는가
- 인물·소환수·적·글자 수가 초기 데모 제작량을 초과하는가
- 문제마다 전용 미니게임·전용 코드가 필요한가

판정:

- 학교 장면 세트 1개와 축제 상태 변형 1개를 재사용한다.
- 현장 장면 1개와 동일 장소의 전술 전투장 1개를 사용한다.
- 핵심 인물은 주인공·교수·동급생, 존재는 메인 동반 정령·수호형 보조 소환수·폭주 정령으로 제한한다.
- 모든 문제는 공통 Situation Challenge와 동일 글자 문법을 사용한다.

결론: `PASS_WITH_SCOPE_LOCK`.

## 4. 적대적 발견과 처리

| ID | 심각도 | 발견 | 처리 | 상태 |
|---|---|---|---|---|
| GR-AR-01 | P0 | 직접 작성 반복이 핵심 재미보다 피로를 키울 수 있음 | 필수 7회·목표 상한 10회, 동일 문제 내 확인 글자 토큰 재선택 | `FIXED_IN_CONTRACT` |
| GR-AR-02 | P0 | 오인식 복구가 마나·시전 횟수를 소비하면 입력 실패와 설계 실패가 다시 혼합됨 | 명시적 시전 전 자원 미소모 | `FIXED_IN_CONTRACT` |
| GR-AR-03 | P1 | `흐름` 하나가 모든 문제를 위해 만들어진 만능 열쇠처럼 보일 수 있음 | 생성·본질 변경·영구 고정 불가, 문제마다 대상·제약·대가 변경 | `MITIGATED` |
| GR-AR-04 | P1 | `집중`이 빠른 해법이라 항상 우세할 위험 | 국소 손상·반격·구조 부담을 실제 결과에 반영하고 전역 점수 금지 | `MITIGATED` |
| GR-AR-05 | P1 | 자유일정 `준비`가 공략상 정답으로 고착될 위험 | 효과를 다음 세션 중심으로 제한, 휴식·교류도 동등 규모의 편의와 장면 제공 | `MITIGATED` |
| GR-AR-06 | P1 | 수업·축제·현장이 모두 흐름 복구 문제로 반복될 위험 | 수업=원리 비교, 시험=제약 효율, 축제=표현, 현장 전투=진정, 환경=우선순위로 성공 기준 분리 | `FIXED_BY_MATRIX` |
| GR-AR-07 | P1 | 장학생 대 가문 학생이 혈통 우열 서사로 읽힐 위험 | 교육 자원·사전 훈련·실패 허용 폭의 차이로 제한 | `FIXED_IN_NARRATIVE_CONTRACT` |
| GR-AR-08 | P1 | 마도서가 완성 주문 스톡이 되어 직접 설계를 약화할 위험 | 과정·대가·발견 기록만 저장, 현재 상황 검증 재실행 | `FIXED_IN_CONTRACT` |
| GR-AR-09 | P1 | 53분 콘텐츠 상한이 대사·재시도에 의해 60분을 넘을 위험 | 7분 여유 유지, 반복 입력·이동·중복 설명부터 감량 | `MITIGATED` |
| GR-AR-10 | P1 | 플랫폼 요구가 다시 Android 중심으로 회귀할 위험 | PC 마우스·펜을 1차 계약, 모바일은 후속 적응·실기기 검증 | `FIXED` |
| GR-AR-11 | P2 | 게임패드 지원 약속이 직접 작성 코어와 충돌 | `DEFERRED / NOT_PROMISED` | `ACCEPTED` |
| GR-AR-12 | P2 | 정확한 입력 허용 오차·감속 비율을 문서에서 조기 고정할 위험 | `PLAYTEST_TUNING_REQUIRED`로 보존 | `ACCEPTED` |

## 5. 문제 차별화 재검증

| 세션 | 성공의 의미 | 주요 압박 | 플레이어가 포기할 수 있는 것 | 기록 |
|---|---|---|---|---|
| 수업 | 원인을 이해하고 설명 | 거의 없음 | 없음, 안전한 재시도 | 이해한 원리 |
| 시험 | 제한 안에서 설계 증명 | 횟수·충격·마나 | 효율 또는 안정 여유 | 평가 축별 결과 |
| 축제 | 원하는 표현 완성 | 공연 시간·재료 반응 | 화려함·안정·범위 중 일부 | 표현 성향 |
| 현장 전투 | 파괴 대신 진정 | 적 공격·작성 안전 시간 | 속도 또는 피해 최소화 | 책임 있는 대응 |
| 현장 환경 | 우선순위 선택 | 누출·시간·동시 위험 | 묘목 또는 구조 일부 | 보호 우선순위 |

판정: 같은 글자 문법을 사용하지만 판단과 결과가 구분된다.

## 6. 시간·제작량 재검증

### 시간

- 목표 중앙값: 46분
- 콘텐츠 상한: 53분
- 접근성·읽기·재작성 여유: 7분
- 하드 상한: 60분
- 필수 성공 작성: 7회
- 목표 재시도 포함 상한: 10회

### 제작량

- 학교 공용 장면 세트: 1
- 축제 상태 변형: 1
- 현장 장면: 1
- 전술 전투장: 1
- 작성 오버레이: 1
- 마도서 화면: 1
- 핵심 인물: 주인공·교수·동급생
- 핵심 존재: 메인 동반 정령·수호형 보조 소환수·폭주 정령
- 글자: 메인 1·보조 2
- Situation Challenge: 5

판정: `CONDITIONAL_PASS_FOR_SOLO_PRODUCTION`. 실제 제작 시간은 Codex·Godot 구현 전 산정할 수 없으며 완료 증거가 아니다.

## 7. 추적성 검수

필수 연결:

```text
PROJECT_BENCHMARKING_POLICY
→ BENCHMARK_PASS
→ PLANNING_COMPLETION_PASS
→ 이 적대적 검토
→ CURRENT_CONFIRMED_DECISIONS
→ DEVELOPMENT_GATES
→ DESIGN_DOCUMENT_REGISTRY
→ 병합 후 GDD Sheet
```

- 후보와 확정 상태를 분리한다.
- 이전 v6·v8 문서는 역사·호환 참고로 보존한다.
- 제품 코드·Scene·Resource·게임 데이터·자산은 생성하지 않는다.
- Sheet 쓰기는 관련 PR 병합 뒤에만 수행한다.

## 8. 최종 판정

```text
PLANNING-CONTENT-01 = PASS
PLANNING-PLATFORM-01 = PASS_WITH_PLAYTEST_TUNING_PENDING
PLANNING-SCOPE-01 = PASS_WITH_SOLO_PRODUCTION_CONDITION
PLANNING-REVIEW-01 = PASS_WITH_CORRECTIONS_APPLIED
HUMAN_PLAYTEST = NOT_RUN
RUNTIME_VALIDATION = NOT_RUN
CODEX = BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
```

기획 문서 단계의 차단 발견은 처리됐다. 다음 제품 게이트는 `ART-STYLE-01`이다.
