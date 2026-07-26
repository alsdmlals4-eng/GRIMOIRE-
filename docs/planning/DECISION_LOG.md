# 스펠 기획 결정 원장

## 문서 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 상태: `PLANNING_IN_PROGRESS`
- 기준 날짜: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 상위 책임 원본: `docs/planning/SPELL_GAME_DESIGN.md`
- 전투 코어: `docs/planning/COMBAT_CORE_SYSTEM.md`
- 세계관 책임 원본: `docs/planning/WORLD_SETTING_CONCEPT.md`
- 학교 육성: `docs/planning/WORLD_SCHOOL_GROWTH_SYSTEM.md`
- 학년 구조: `docs/planning/WORLD_ACADEMIC_YEAR_STRUCTURE.md`
- 학기 일정: `docs/planning/WORLD_SEMESTER_SCHEDULE_SYSTEM.md`
- 현장실습: `docs/planning/WORLD_FIELD_PRACTICUM_SYSTEM.md`
- 마법 수업: `docs/planning/WORLD_MAGIC_CURRICULUM_SYSTEM.md`
- 마법 글자 문법: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- 메인 글자 레벨: `docs/planning/MAIN_LETTER_LEVEL_SYSTEM.md`
- 메인 글자 전문화: `docs/planning/MAIN_LETTER_SPECIALIZATION_SYSTEM.md`
- 보조 글자 운용량: `docs/planning/SUPPORT_LETTER_OPERATION_CAPACITY_SYSTEM.md`
- 보조 글자 숙련: `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- 소환수: `docs/planning/SUMMON_SYSTEM.md`
- 스톡: `docs/planning/STOCK_SYSTEM.md`
- 마나: `docs/planning/MANA_SYSTEM.md`
- 선택형 상세 서사: `docs/planning/NARRATIVE_PROGRESSIVE_DISCLOSURE_SYSTEM.md`
- 최신 결정 추가 기록: `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27D.md`

최신 세부 결정은 결정 추가 기록과 각 책임 원본이 우선한다.

---

## 결정 기록

| 질문 ID | 결정 주제 | 사용자 답변 | 최종 상태 | 설계 영향 |
|---|---|---|---|---|
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
| GM-CIRCUIT-06 | 메인 글자 성장 | 글자별 독립 Lv, 공부·실습으로 성장 | `DIRECTION_CONFIRMED_WITH_PLANNING_DEFAULT` | 계열별 폭·깊이 육성 |
| GM-CIRCUIT-07 | Lv.4~Lv.5 성장 | Lv.1~3 공통, Lv.4~5 전문 활용 분기 | `DIRECTION_CONFIRMED` | 연구실·실습·진로 차별화 |
| GM-CIRCUIT-08 | 보조 글자 운용량 | 1학년 2개, 학년마다 +2, 우수 성적 추가 | `DIRECTION_CONFIRMED_WITH_PLANNING_DEFAULT` | 초반 조합 재미와 학업 보상 |
| GM-CIRCUIT-09 | 보조 글자 성장 | 미숙→숙련→달인 3단계 | `DIRECTION_CONFIRMED` | 반복 입력 감소와 단순한 숙련 관리 |
| GM-00-10 | 동료 정체성 | 소환수 같은 마법적 존재 | `DIRECTION_CONFIRMED` | 전투 협력자 |
| GM-00-11 | 자동스펠 | 반복 입력 완화 | `SUPERSEDED_BY_STOCK` | 스톡으로 통합 |
| GM-00-12 | 완성 주문 스톡 | 등록 주문을 저장해 터치 사용 | `CONFIRMED` | 준비형 전술 자원 |
| GM-00-13 | 기본 소환수 | 1체 사전 전개 | `CONFIRMED` | 반복 소환 입력 제거 |
| GM-00-14 | 스톡 보충 | 지정 대상 자동 충전+행동·소환수 보너스 | `LATEST_OVERRIDE` | 자동·능동 충전 결합 |
| GM-00-15 | 스톡 귀속 | 주문·글자별 스톡, 대상 지정 | `CONFIRMED` | 우선 충전 전략 |
| GM-00-16 | 마나 예약 | 주문 비용 50% 최대 마나 예약 | `SUPERSEDED_BY_GM-00-21` | 예약 폐기 |
| GM-00-17 | 조건부 자동발동 | 폐기, 터치 스톡으로 통합 | `LATEST_OVERRIDE` | 발동 판단 유지 |
| GM-00-18 | 하위 글자 스톡 | 숙련 글자 자동 배치·연결 | `CONFIRMED_DIRECTION` | 반복 드로잉 감소 |
| GM-00-19-A | 소환수 회로 작성 | 제거, 스톡 생산 지원으로 통합 | `LATEST_OVERRIDE_CONFIRMED` | 소환수는 글자를 직접 쓰지 않음 |
| GM-SUMMON-01 | 소환수 주문 보조 경계 | 회로 보조는 스톡 충전만 담당 | `LATEST_OVERRIDE_CONFIRMED` | 직접 연결안 폐기, 생산·동조로 제한 |
| GM-COMBAT-01 | 기본 전투 간결화 | 1학년부터 직접 작성+스톡+소환수 충전 지원 | `DIRECTION_CONFIRMED` | 핵심 판단 유지·반복 입력 감소 |
| GM-00-20 | 스톡 한도 | 기능 글자 수 기반 공용 용량 | `CONFIRMED_WITH_REINTERPRETATION` | 복잡한 주문이 더 무거움 |
| GM-00-21 | 스톡 자원 제약 | 공용 준비 용량만 사용 | `LATEST_OVERRIDE_CONFIRMED` | 스톡과 마나 분리 |
| GM-00-22 | 충전시간 | 1글자 1.0, 추가 글자당 +0.5 | `CONFIRMED_WITH_REINTERPRETATION` | 완만한 복잡도 비용 |
| GM-00-23 | 충전 대상 전환 | 진행도 보존+전환 지연 | `CONFIRMED` | 대응성과 비용 병행 |
| GM-00-24 | 직접 피해 | 진행도 보존+일시정지+자동 재개 | `CONFIRMED` | 손실 스트레스 제거 |
| GM-00-25 | 완전 방어 | 실제 체력 피해가 있을 때만 정지 | `CONFIRMED` | 방어 보상 |
| GM-00-26 | 고정 정지 | 피해량 무관 고정 시간 | `SUPERSEDED_BY_GM-00-28` | 비율식으로 교체 |
| GM-00-27 | 타격당 0.5초 | 타격별 갱신 | `SUPERSEDED_BY_GM-00-28` | 타격 수 기준 폐기 |
| GM-00-28 | 정지 산정 | 최대 체력 대비 손실 비율 | `CONFIRMED` | 단발·다단 공정 처리 |
| GM-00-29 | 정지 수치 | B안 | `CONFIRMED` | `r×3.0`, 0.10~0.80초 |
| GM-00-30 | 지속 피해 | 정지 없음, 별도 상태이상이 스톡 영향 | `CONFIRMED` | 피해와 방해 분리 |
| GM-00-31 | 스톡 방해 상태 | 마력 교란·주문 봉인, 회로 혼선 삭제 | `CONFIRMED` | 감속과 사용 차단 분리 |
| GM-00-32 | 마력 교란 | 충전 30% 감속 기본값, 중첩 없음 | `CONFIRMED_DIRECTION_WITH_PLANNING_DEFAULT` | 수치는 추후 조정 |
| GM-00-33 | 주문 봉인 단계 | 일반 봉인과 상위 마력 봉쇄 분리 | `CONFIRMED_DIRECTION` | 보스급 완전 차단 분리 |
| GM-WORLD-01 | 세계관 틀 | 마법학교+현장실습+성장 모험 | `DIRECTION_CONFIRMED` | 학교와 외부 모험 연결 |
| GM-WORLD-02 | 비밀학과 | 핵심에서 제외 | `CONFIRMED` | 학습·활용 중심 |
| GM-WORLD-03 | 확장 방식 | 기존 회로·글자의 활용으로 추가 | `DIRECTION_CONFIRMED` | 응용 중심 콘텐츠 |
| GM-WORLD-04 | 학교 규모 | 단일 명문학교+인근 지역 | `CONFIRMED` | 중심 허브 집중 |
| GM-WORLD-05 | 학년 성장 | 승급에 따라 자연스럽게 성장 | `DIRECTION_CONFIRMED` | 책임·문법·지역 확대 |
| GM-WORLD-06 | 육성 구조 | 프린세스 메이커식 일정 육성 결합 | `DIRECTION_CONFIRMED` | 선택 누적 성장 |
| GM-WORLD-07 | 입학 형태 | 정식 신입생 | `CONFIRMED` | 기초부터 학습 |
| GM-WORLD-08 | 출신 | 일반 가정 출신 장학생 | `DIRECTION_CONFIRMED` | 활용 잠재력으로 입학 |
| GM-WORLD-09 | 교육 기간 | 3년제·학년당 2학기 | `DIRECTION_CONFIRMED` | 총 6학기 |
| GM-WORLD-10 | 학기 일정 | 자유 10회+고정 사건 4회 | `DIRECTION_CONFIRMED` | 학기당 14구간 |
| GM-WORLD-11 | 현장실습 | 배정→선택→제안형 혼합 | `DIRECTION_CONFIRMED` | 학년별 자율성 증가 |
| GM-WORLD-12 | 수업 구성 | 메인 글자 계열별 메인·보조 학습 | `DIRECTION_CONFIRMED` | 수업과 주문 발견 연결 |
| GM-WORLD-BM-01 | 장르 벤치마킹 | 유사 작품의 구조적 장점 참고 | `BENCHMARK_DIRECTION_CONFIRMED` | 학교생활·관계 강화 |
| GM-NARRATIVE-01 | 스토리 깊이 | 핵심은 짧게, 재대화로 상세 | `DIRECTION_CONFIRMED` | 선택형 상세 서사 |
| GM-NARRATIVE-02 | 필수 표현 | 상황별 혼합형 | `DIRECTION_CONFIRMED` | 목표·감정·설정 채널 분리 |
| OPS-00-01 | GitHub 기록 | 지속 갱신 | `CONFIRMED` | 책임 원본 동기화 |

---

## 최신 핵심 구조

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
- 보조가 늘수록 기능이 확대되지만 작성 시간·마나·스톡 비용도 증가한다.

### 메인 글자·보조 글자 성장

- 메인 계열은 현상·물질·개념 중심이다.
- 각 메인 글자는 `Lv.0~Lv.5` 독립 레벨과 Lv.4~5 전문 분기를 가진다.
- 보조 글자는 `미숙→숙련→달인` 3단계다.
- `숙련` 이상인 보조 글자만 하위 글자 스톡 후보가 된다.
- 학년별 표준 보조 운용량은 1학년 2개, 2학년 4개, 3학년 6개다.
- 성적·연구 성과가 좋으면 관련 계열의 운용량을 추가로 인증받을 수 있다.

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
- 소환수가 없어도 직접 시전과 이미 준비된 스톡은 사용할 수 있다.

### 1학년 전투

```text
메인 글자 단독 발동
→ 보조 글자 2개 직접 조합
→ 핵심 보조 글자 숙련
→ 하위 글자 스톡 사용
→ 소환수로 지정 스톡 충전
→ 완성 주문 스톡 사용
```

첫 학기 안에 직접 작성·스톡·소환수 생산 지원을 모두 경험한다.

### 스톡

- 두 스톡은 공용 준비 용량을 사용한다.
- 준비 용량과 충전시간은 기능 글자 수 기준이다.
- 충전 공식은 `1.0 + 0.5 × (기능 글자 수 - 1)`이다.
- 스톡은 마나를 소비·예약하지 않는다.
- 자동 충전 대상은 한 번에 1종이며 소환수가 생산을 지원한다.

### 학교·서사

- 단일 명문학교, 3년제·6학기다.
- 한 학기는 자유 일정 10회와 고정 사건 4회다.
- 수업은 메인 글자 계열별로 진행하며 관련 메인·보조 글자를 학습한다.
- 현장실습은 학년이 오를수록 배정형에서 제안형으로 자율성이 증가한다.
- 필수 스토리는 목표·이유·위험만 짧게 전달한다.
- 상세 세계관과 인물 이야기는 NPC 재대화·조사·기록으로 제공한다.

---

## 운영 규칙

1. 사용자의 최신 지시가 이전 결정에 우선한다.
2. 변경 결정은 `SUPERSEDED`, `LATEST_OVERRIDE`, `TRANSFERRED`, `REMOVED`, `REJECTED`로 추적한다.
3. 핵심 변경 시 책임 원본·결정 원장·Active Context를 함께 갱신한다.
4. 방향 확정과 세부 수치 확정을 구분한다.
5. 외부 작품은 고유 설정을 복제하지 않고 구조만 참고한다.
6. 구현 파일은 기획 브랜치에 포함하지 않는다.
7. 사용자 승인 전 `CORE_CONFIRMED`를 사용하지 않는다.
8. 현재 단계에서는 Codex를 실행하지 않는다.

---

## 미해결 기획 결정

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
| GM-NARRATIVE-03 | 선택 대화·기록·관계 UI는 어떻게 구성하는가 | `UNRESOLVED` |
| GM-00-35 | 전환 지연 중 재선택을 어떻게 처리하는가 | `UNRESOLVED` |
| GM-00-36 | 플레이어·소환수 생산 계산식은 무엇인가 | `UNRESOLVED` |
| GM-00-37 | 연결·분기·합류를 독립 기능 글자로 계산하는가 | `UNRESOLVED` |
| GM-00-38 | 전체 준비 용량 초기값과 성장량은 얼마인가 | `UNRESOLVED` |
| GM-00-40 | 소환수 추가 편성·교체·동시 전개 방식은 무엇인가 | `UNRESOLVED` |
| GM-STOCK-01 | 1학년 스톡 초기 준비 용량과 기본 편성은 무엇인가 | `UNRESOLVED` |
| GM-POC-01 | CORE_POC 대표 주문·적·전투 구간은 무엇인가 | `UNRESOLVED` |

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
