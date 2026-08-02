# GM-FULL-GAME-SCOPE-ENDING-01 — 3학년 본편 + 1학년 데모 승인

## 승인 상태

```yaml
decision_id: GM-FULL-GAME-SCOPE-ENDING-01
status: USER_APPROVED_ACTIVE
approved_option: B_THREE_SCHOOL_YEAR_FULL_GAME_WITH_A_YEAR_ONE_DEMO_BOUNDARY
approved_at: 2026-08-02T18:39+09:00
grill_me_batch: 7_of_10
gate: FULL-GAME-STRUCTURE-01
implementation: NOT_STARTED
codex: BLOCKED
```

## 승인 문장

> 정식 본편은 3학년 전체 학교 대서사로 설계한다. 데모는 1학년 3학기 완결형 범위까지만 제작한다. 내부 Vertical Slice는 데모 전체와 구분해 먼저 검증한다.

## 제품 단계

```text
46–53분 Internal Vertical Slice
→ 1학년 3학기 Year-One Demo Build
→ 3학년 전체 Full Game
```

### Internal Vertical Slice

- 기존 46분 목표·53분 콘텐츠 상한.
- 수업·비전투 응용·제작 미니게임·현장·마도서·학기말 평가를 압축 검증.
- Year-One Demo를 만들기 전 시스템·Mobile·작성 피로·평가 설명력을 검증하는 내부 Gate.

### Year-One Demo Build

- 1학년 3학기.
- 핵심 Chapter 6~8개 후보.
- 메인 계열 3개 내외와 공통 보조 문법.
- 재사용 가능한 미니게임 가족 4~6개 후보.
- 학교 Hub 1개와 현장 권역 2~3개 후보.
- 첫 독자적 마법 원리와 책임 있는 세계 변화를 증명하는 학년말 완결.

일반적인 짧은 체험판이 아니라 `1학년 완결형 데모/프롤로그 에디션`에 가까우며, 배포·가격·저장 승계 방식은 후속 출시 Gate에서 확정한다.

### Full Game

- 3개 학년·6~9학기 후보.
- 핵심 Chapter 12~18개 이상 후보.
- 메인 계열 5개 이상과 복수 전문화 후보.
- 장기 관계·연구·현장·세계 상태 변화.
- 졸업과 독자적 마법 원리의 대규모 세계 재작성 엔딩.

## 연결 규칙

- Year-One Demo는 본편의 1학년 정본이며 별도 평행 캠페인이 아니다.
- Demo의 마도서·수강·전문화 후보·관계·결과 태그는 Full Game 승계를 고려한 데이터 구조를 사용한다.
- Demo 완성·사람 테스트·Mobile 검증 전에는 2·3학년 전용 대형 콘텐츠를 본제작하지 않는다.
- 학년이 바뀔 때마다 새 시스템을 무한 추가하지 않고, 기존 문자·재료·제작·미니게임·관계·장소의 복합성과 책임을 높인다.
- 계열별 완전 별도 캠페인은 만들지 않고 공통 사건을 계열별 해법과 대가로 변주한다.

## 위험과 보호

- 위험: Year-One Demo가 일반 데모보다 매우 커서 사실상 별도 출시 분량이 된다.
- 보호: Vertical Slice와 Year-One Demo를 별도 Gate로 관리하며, Demo 배포 모델은 후속 결정으로 분리한다.
- 위험: 3년 전체 조합 QA와 Asset 제작량 폭증.
- 보호: 학년별 제작 승인, 공통 사건·장소·미니게임 재사용, Demo 검증 후 후반 분량 잠금.
- 위험: 1학년과 후반부 경험 격차.
- 보호: Vertical Slice 대표성 Gate에서 3년 전체까지 이어질 핵심 경험과 확장 규칙을 명시한다.

## 아직 잠기지 않은 수치

다음은 모두 `TEST_VALUE`다.

- 정확한 학기 수와 Chapter 수.
- 계열·전문화 수.
- 미니게임·재료·레시피·장소 수.
- 총 플레이 시간.
- Demo 배포·가격·저장 승계 방식.
- 학년별 신규 Asset 예산과 재사용률.

## 다음 결정

`GM-VERTICAL-SLICE-REPRESENTATIVENESS-01` — Internal Vertical Slice가 Year-One Demo와 Three-Year Full Game을 대표하기 위한 실제 구현·Mock·검증 경계.
