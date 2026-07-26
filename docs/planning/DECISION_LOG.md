# 스펠 기획 결정 원장

## 문서 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 상태: `PLANNING_IN_PROGRESS`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- v6 Gate 1 기준선: `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
- 현재 상태: `docs/ACTIVE_CONTEXT.md`
- 기존 통합 기획 참조: `docs/planning/SPELL_GAME_DESIGN.md`
- 전투 코어 참조: `docs/planning/COMBAT_CORE_SYSTEM.md`
- 세계관 참조: `docs/planning/WORLD_SETTING_CONCEPT.md`
- 선택형 상세 서사 참조: `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27F.md`

기존 시스템 문서는 `REFERENCE_CANDIDATE`다. 최신 v6 재기획 결정은 Gate 1 기준선, 최신 Addendum, Active Context 순으로 확인한다.

---

## 결정 기록

| 질문 ID | 결정 주제 | 사용자 답변 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
| GM-CORE-01 | 최상위 플레이 경험 | 조합·발견을 주 경험, 직접 작성·자동화는 보조 | `PRIMARY_EXPERIENCE_DIRECTION_CONFIRMED` | 모든 시스템을 지적 마법 판타지에 정렬 |
| GM-AUDIENCE-01 | 목표 플레이어·플레이 상황 | 10~15분 집중형 모바일 RPG | `AUDIENCE_AND_PLAY_CONTEXT_CONFIRMED` | 한 세션에 문제 해결·발견 완결 |
| GM-NARRATIVE-03 | 서사 깊이 | 기본은 짧게, 대화 선택 시 다양하고 깊게 | `OPTIONAL_NARRATIVE_DEPTH_CONFIRMED` | 필수 핵심층·선택형 상세층 분리 |
| GM-00-01 | 자동화 이후 직접 그리기 | 기초는 자동화하고 상위·조합 글자는 직접 작성 | `CONFIRMED` | 새 글자·상위 조합 집중 |
| GM-00-02 | 작성 중 시간 | 전투 지속, 시간 감속 | `CONFIRMED` | 터치 편의와 압박 유지 |
| GM-00-03-A | 동료 역할 | 고정 타입 폐기, 능력치·스탠스 기반 | `TRANSFERRED_TO_SUMMON` | 소환수로 승계 |
| GM-00-03-B | 동료 자동작성 | 동료가 회로 구간 작성 | `SUPERSEDED` | 하위 글자 스톡으로 통합 |
| GM-00-04 | 주문 발견 | 직접 실험 후 설계도 등록 | `CONFIRMED` | 발견→등록→숙련→스톡화 |
| GM-00-05 | 스탠스 변경 | 전투 중 변경, 전환 제약 | `CONFIRMED` | 연속 전환 억제 |
| GM-00-06 | 부정확 판정 | 널럴한 성공·낮은 패널티·정확 보상 | `CONFIRMED` | 성공 중심 입력 |
| GM-00-07 | 마나 | 자동 회복+행동 보너스+회복·절감 글자 | `CONFIRMED` | 직접 시전 자원 |
| GM-00-08 | 회로 상위 분류 | 메인·형상·전달·보조 | `SUPERSEDED_IN_PART_BY_GM-CIRCUIT-01` | 메인/보조 글자로 재정리 |
| GM-00-09 | 초반 최소 문법 | 메인+형상·전달 필수 | `SUPERSEDED_IN_PART_BY_GM-CIRCUIT-01` | 메인 단독 주문으로 변경 |
| GM-CIRCUIT-01 | 마법 글자 문법 | 메인 하나로 주문 성립, 보조로 강화 | `DIRECTION_CONFIRMED` | 글자→회로→주문 문장 |
| GM-CIRCUIT-02 | 메인 글자 계열 | 현상·물질·개념 중심 | `DIRECTION_CONFIRMED` | 한 글자의 다목적 활용 |
| GM-CIRCUIT-06 | 메인 글자 성장 | 글자별 독립 Lv, 공부·실습으로 성장 | `REFERENCE_CANDIDATE` | 기능 변화 중심으로 재검토 |
| GM-CIRCUIT-07 | Lv.4~Lv.5 성장 | Lv.1~3 공통, Lv.4~5 전문 활용 분기 | `REFERENCE_CANDIDATE` | 연구실·실습·진로 후보 |
| GM-CIRCUIT-08 | 보조 글자 운용량 | 1학년 2개, 학년마다 +2, 우수 성적 추가 | `BALANCE_TUNING_BACKLOG` | CORE_POC 이후 재검증 |
| GM-CIRCUIT-09 | 보조 글자 성장 | 미숙→숙련→달인 3단계 | `DIRECTION_CONFIRMED` | 반복 입력 감소와 숙련 관리 |
| GM-00-10 | 동료 정체성 | 소환수 같은 마법적 존재 | `DIRECTION_CONFIRMED` | 전투 협력자 |
| GM-00-11 | 자동스펠 | 반복 입력 완화 | `SUPERSEDED_BY_STOCK` | 스톡으로 통합 |
| GM-00-12 | 완성 주문 스톡 | 등록 주문을 저장해 터치 사용 | `SUPPORT_WITH_RISK` | 긴급 대응, 버튼 전투화 검증 필요 |
| GM-00-13 | 기본 소환수 | 1체 사전 전개 | `REFERENCE_CANDIDATE` | CORE_POC에서 필요성 검증 |
| GM-00-14 | 스톡 보충 | 지정 대상 자동 충전+행동·소환수 보너스 | `UNPROVEN` | 실질적 판단인지 검증 |
| GM-00-15 | 스톡 귀속 | 주문·글자별 스톡, 대상 지정 | `REFERENCE_CANDIDATE` | 준비 전략 후보 |
| GM-00-16 | 마나 예약 | 주문 비용 50% 최대 마나 예약 | `SUPERSEDED_BY_GM-00-21` | 예약 폐기 |
| GM-00-17 | 조건부 자동발동 | 폐기, 터치 스톡으로 통합 | `LATEST_OVERRIDE` | 발동 판단 유지 |
| GM-00-18 | 하위 글자 스톡 | 숙련 글자 자동 배치·연결 | `SUPPORT_DIRECTION_CONFIRMED` | 반복 드로잉 감소 |
| GM-00-19-A | 소환수 회로 작성 | 제거, 스톡 생산 지원으로 통합 | `LATEST_OVERRIDE_CONFIRMED` | 소환수는 글자를 직접 쓰지 않음 |
| GM-SUMMON-01 | 소환수 주문 보조 경계 | 회로 보조는 스톡 충전만 담당 | `LATEST_OVERRIDE_CONFIRMED` | 직접 연결안 폐기, 생산·동조로 제한 |
| GM-COMBAT-01 | 기본 전투 간결화 | 1학년부터 직접 작성+스톡+소환수 충전 지원 | `REFERENCE_CANDIDATE` | Loop·CORE_POC에서 재검증 |
| GM-00-20 | 스톡 한도 | 기능 글자 수 기반 공용 용량 | `BALANCE_TUNING_BACKLOG` | 상위 Loop 확정 후 수치화 |
| GM-00-21 | 스톡 자원 제약 | 공용 준비 용량만 사용 | `REFERENCE_CANDIDATE` | 스톡과 마나 분리 후보 |
| GM-00-22 | 충전시간 | 1글자 1.0, 추가 글자당 +0.5 | `BALANCE_TUNING_BACKLOG` | CORE_POC 이후 튜닝 |
| GM-00-23 | 충전 대상 전환 | 진행도 보존+전환 지연 | `REFERENCE_CANDIDATE` | 대응성과 비용 후보 |
| GM-00-24 | 직접 피해 | 진행도 보존+일시정지+자동 재개 | `REFERENCE_CANDIDATE` | 손실 스트레스 완화 후보 |
| GM-00-25 | 완전 방어 | 실제 체력 피해가 있을 때만 정지 | `REFERENCE_CANDIDATE` | 방어 보상 후보 |
| GM-00-26 | 고정 정지 | 피해량 무관 고정 시간 | `SUPERSEDED_BY_GM-00-28` | 비율식으로 교체 |
| GM-00-27 | 타격당 0.5초 | 타격별 갱신 | `SUPERSEDED_BY_GM-00-28` | 타격 수 기준 폐기 |
| GM-00-28 | 정지 산정 | 최대 체력 대비 손실 비율 | `BALANCE_TUNING_BACKLOG` | 전투 PoC 이후 검토 |
| GM-00-29 | 정지 수치 | B안 | `BALANCE_TUNING_BACKLOG` | 수치 미확정 |
| GM-00-30 | 지속 피해 | 정지 없음, 별도 상태이상이 스톡 영향 | `REFERENCE_CANDIDATE` | 피해와 방해 분리 후보 |
| GM-00-31 | 스톡 방해 상태 | 마력 교란·주문 봉인, 회로 혼선 삭제 | `DEFERRED_STATUS_DESIGN` | 상태이상 단계에서 재검토 |
| GM-00-32 | 마력 교란 | 충전 30% 감속 기본값, 중첩 없음 | `BALANCE_TUNING_BACKLOG` | 수치 미확정 |
| GM-00-33 | 주문 봉인 단계 | 일반 봉인과 상위 마력 봉쇄 분리 | `DEFERRED_STATUS_DESIGN` | 보스급 완전 차단 후보 |
| GM-WORLD-01 | 세계관 틀 | 마법학교+현장실습+성장 모험 | `DIRECTION_CONFIRMED` | 학교와 외부 모험 연결 |
| GM-WORLD-02 | 비밀학과 | 핵심에서 제외 | `CONFIRMED` | 학습·활용 중심 |
| GM-WORLD-03 | 확장 방식 | 기존 회로·글자의 활용으로 추가 | `DIRECTION_CONFIRMED` | 응용 중심 콘텐츠 |
| GM-WORLD-04 | 학교 규모 | 단일 명문학교+인근 지역 | `REFERENCE_CANDIDATE` | 범위 검증 필요 |
| GM-WORLD-05 | 학년 성장 | 승급에 따라 자연스럽게 성장 | `REFERENCE_CANDIDATE` | 책임·문법·지역 확대 후보 |
| GM-WORLD-06 | 육성 구조 | 프린세스 메이커식 일정 육성 결합 | `REFERENCE_CANDIDATE` | 장기 Loop에서 재검토 |
| GM-WORLD-07 | 입학 형태 | 정식 신입생 | `REFERENCE_CANDIDATE` | 기초부터 학습 |
| GM-WORLD-08 | 출신 | 일반 가정 출신 장학생 | `REFERENCE_CANDIDATE` | 활용 잠재력으로 입학 |
| GM-WORLD-09 | 교육 기간 | 3년제·학년당 2학기 | `NEUTRAL_SCOPE_RISK` | 총 6학기 범위 검증 |
| GM-WORLD-10 | 학기 일정 | 자유 10회+고정 사건 4회 | `REFERENCE_CANDIDATE` | Semester Loop에서 재검토 |
| GM-WORLD-11 | 현장실습 | 배정→선택→제안형 혼합 | `REFERENCE_CANDIDATE` | 학년별 자율성 후보 |
| GM-WORLD-12 | 수업 구성 | 메인 글자 계열별 메인·보조 학습 | `SUPPORT_DIRECTION_CONFIRMED` | 수업과 주문 발견 연결 |
| GM-WORLD-BM-01 | 장르 벤치마킹 | 유사 작품의 구조적 장점 참고 | `BENCHMARK_DIRECTION_CONFIRMED` | 학교생활·관계 강화 |
| GM-NARRATIVE-01 | 스토리 깊이 | 핵심은 짧게, 재대화로 상세 | `REAFFIRMED_BY_GM-NARRATIVE-03` | 선택형 상세 서사 |
| GM-NARRATIVE-02 | 필수 표현 | 상황별 혼합형 | `REAFFIRMED_BY_GM-NARRATIVE-03` | 목표·감정·설정 채널 분리 |
| OPS-00-01 | GitHub 기록 | 지속 갱신 | `CONFIRMED` | 책임 원본 동기화 |

---

## 최신 핵심 구조

### 최상위 경험

```text
마법 글자의 의미를 이해한다
→ 상황에 맞는 주문을 설계한다
→ 직접 작성과 숙련 스톡을 선택한다
→ 결과를 관찰한다
→ 새로운 활용을 발견하거나 실패 원인을 이해한다
→ 더 영리한 주문으로 재설계한다
```

### 목표 플레이 상황

- 1차 대상은 10~15분의 집중 플레이가 가능한 모바일 RPG 사용자다.
- 기본 세션은 하나의 수업·현장실습·마법 발견 단위를 완주한다.
- Micro 상황은 약 30초~2분, 전투·문제 묶음은 약 3~5분을 목표로 한다.
- 정확한 시간은 `PLAYTEST_TUNING_REQUIRED`다.

### 마법 글자와 주문

```text
마법 글자
→ 마법적 의미를 가진 기능 단위

회로
→ 글자의 위치·연결·적용 순서

주문
→ 메인 글자 1개 + 보조 글자 0개 이상
```

- 메인 글자 하나로 기본 주문이 성립한다.
- 복수 메인 글자는 허용하지 않는다.
- 보조 글자는 형상·전달·출력·규모·시간·행동·효율·안정·조건·순서를 담당한다.

### 직접 작성·스톡·소환수 책임

```text
직접 작성
→ 새 글자·미숙 글자·핵심 판단·즉석 변형

하위 글자 스톡
→ 숙련 글자 하나 자동 배치·연결

완성 주문 스톡
→ 등록 주문 전체 즉시 기동

소환수
→ 전투·수호·지정 스톡 충전·생산·동조 지원
```

- 소환수는 회로판에 글자·선·연결을 직접 작성하지 않는다.
- 소환수의 회로 보조는 스톡 충전으로만 작동한다.
- 소환수에게 보조 묶음을 장착해 자동 연결하는 안은 폐기한다.
- 스톡이 없어도 직접 시전할 수 있다.

### 학교·서사

- 학교는 새로운 글자·활용 문제·관계·전문화를 공급하는 장기 프레임이다.
- 필수 핵심층은 상황·목표·위험·중요 결과를 짧게 전달한다.
- 선택형 상세층은 대화 선택·재대화·조사·기록으로 인물·세계관·마법 원리를 확장한다.
- 필수 정보는 선택형 상세 대화에만 숨기지 않는다.
- C형 장시간 감상은 강제 모드가 아니라 선택 대화·조사·연속 세션으로 허용한다.

---

## 운영 규칙

1. 사용자의 최신 지시가 이전 결정에 우선한다.
2. v6가 기획 순서·Gate·검증·상태 표현의 원본 계약이다.
3. 기존 Spell 문서는 참조 자료이며 새 Gate 1 결정으로 자동 승계하지 않는다.
4. 변경 결정은 `SUPERSEDED`, `LATEST_OVERRIDE`, `TRANSFERRED`, `REMOVED`, `REJECTED`로 추적한다.
5. 핵심 변경 시 재기획 기준선·결정 원장·Active Context를 함께 갱신한다.
6. 방향 확정과 세부 수치 확정을 구분한다.
7. 외부 작품은 고유 설정을 복제하지 않고 구조만 참고한다.
8. 구현 파일은 기획 브랜치에 포함하지 않는다.
9. 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
10. 현재 단계에서는 Codex를 실행하지 않는다.

---

## 현재 차단 결정

| 후보 ID | 질문 | 상태 |
|---|---|---|
| GM-PROMISE-01 | 최상위 경험과 목표 플레이어를 어떤 한 문장 약속으로 표현할 것인가 | `CURRENT_BLOCKER` |
| GM-LOOP-01 | 10~15분 기본 세션을 어떤 Micro·Combat·Session Loop로 구성할 것인가 | `BLOCKED_BY_GM-PROMISE-01` |
| GM-RESUME-01 | 모바일 중단·복귀 지점을 어디에 둘 것인가 | `BLOCKED_BY_GM-LOOP-01` |
| GM-POC-01 | CORE_POC 대표 주문·적·문제 구간은 무엇인가 | `BLOCKED_BY_GATE_1_CONCEPT` |
| GM-STOCK-01 | 1학년 스톡 초기 준비 용량과 기본 편성은 무엇인가 | `DEFERRED_BY_HIGHER_LEVEL_CONCEPT_WORK` |

## 미해결 참조 후보

| 후보 ID | 질문 | 상태 |
|---|---|---|
| GM-CIRCUIT-03 | 각 메인 글자의 기본 발현과 레벨별 변화는 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-04 | 공통 보조와 계열 전용 보조의 비율은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-05 | 보조 글자의 반복·중복·상충·감쇠 규칙은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-10 | Lv.4 전문 분기를 변경할 수 있는가 | `UNRESOLVED` |
| GM-CIRCUIT-11 | 성적 등급별 추가 운용량과 과부하 규칙은 무엇인가 | `UNRESOLVED` |
| GM-CIRCUIT-12 | 보조 글자 달인의 정확한 전투·스톡 보상은 무엇인가 | `UNRESOLVED` |
| GM-WORLD-13 | 필수·선택 수업은 자유 일정에서 어떤 비용을 사용하는가 | `UNRESOLVED` |
| GM-WORLD-14 | 컨디션은 단일 피로도인가, 집중·스트레스 분리인가 | `UNRESOLVED` |
| GM-WORLD-15 | 졸업·진로를 다중 엔딩으로 운영하는가 | `UNRESOLVED` |
| GM-WORLD-16 | 세계의 장기 갈등은 무엇인가 | `UNRESOLVED` |
| GM-00-35 | 전환 지연 중 재선택을 어떻게 처리하는가 | `UNRESOLVED` |
| GM-00-36 | 플레이어·소환수 생산 계산식은 무엇인가 | `UNRESOLVED` |
| GM-00-37 | 연결·분기·합류를 독립 기능 글자로 계산하는가 | `UNRESOLVED` |
| GM-00-38 | 전체 준비 용량 초기값과 성장량은 얼마인가 | `DEFERRED` |
| GM-00-40 | 소환수 추가 편성·교체·동시 전개 방식은 무엇인가 | `UNRESOLVED` |

## 보류된 세부 설계

### 상태이상

상태: `DEFERRED_STATUS_DESIGN`

- 실제 지속시간·확률·저항·해제·중첩 공식
- 마력 봉쇄 중 자동 충전과 회로 UI
- 소환수 수호·동조 상호작용

### 콘텐츠·데이터

상태: `DEFERRED_CONTENT_DATA`

- 실제 메인·보조 글자 목록과 수치
- 메인 레벨별 정확한 기본 발현·효율
- 계열별 Lv.4~Lv.5 전문 분기명과 효과
- 보조 글자 숙련 등급의 정확한 요구량·보너스
- 성적 등급별 추가 보조 운용량과 과부하 수치
- 자유 일정의 세계관상 시간과 활동 수치
- 학기별 수업·실습 개수와 예상 플레이 시간
- 선택 대화 분량·보상·기록 UI
