# GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM

```yaml
sync_id: GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM
decision_id: GM-YEAR-ONE-CHAPTER-CURRICULUM-01
status: USER_APPROVED_BRANCH_AND_SHEET_READBACK_PASS
approved_at: 2026-08-11T08:28+09:00
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: bde0771f81066a4a774371edf08d922ca0759897
branch: planning/year-one-seven-chapter-curriculum
task8_pr: 116
task8_state: ON_HOLD_USER_REQUEST_COST_DEPENDENCY
persistent_godot_source_mutation: NONE
sheet_write_readback: PASS
```

## 승인 내용

- Year-One Demo Chapter 수를 기존 `6~8 / TEST_VALUE` 후보에서 `7`로 확정한다.
- 학기 분포는 `2 / 2 / 3`이다.
- 1학기: 정답을 배우는 학생.
- 2학기: 같은 문제를 다르게 보는 학생.
- 3학기: 결과에 책임지는 학생.
- 학년말: 마도서 증거를 근거로 자기 원리를 작성하고 작은 범위의 첫 세계 재작성을 수행한다.
- 모든 Chapter는 `발견·학습 / 선택·준비 / 통제 응용 / 실전·책임 / 복기·다음 질문` 기능을 보존하되 순서·시작 압력·형태·비중을 변주한다.
- 별도 시험은 필수 콘텐츠로 두지 않는다.
- 성장·경제 수치는 후속 B 단계까지 `TEST_VALUE`다.
- 현재 주문 권위 `FIVE_POINT_STAR / GM-SPELL-WORKFLOW-UI-V2-01`을 변경하지 않는다.

## GitHub 변경

```text
docs/planning/YEAR_ONE_CHAPTER_CURRICULUM_01_APPROVAL_2026-08-11.md
tests/test_year_one_chapter_curriculum_contract.py
docs/planning/sync/GR-SYNC-20260811-05-YEAR-ONE-CHAPTER-CURRICULUM.md
docs/planning/CURRENT_CONFIRMED_DECISIONS.md
```

Godot product/addon/config source는 수정하지 않는다.

## Google Sheet 동기화

다음 범위를 쓰고 명시적으로 재조회했다.

```text
00_프로젝트_허브 H2:K2
01_작업순서 A61:J61
02_현재_확정결정 A77:J77
04_누락_충돌_감사 A89:J89
10_제품방향 D14:F14, A19:F19
11_세계관 C2
13_주요인물 G2, G5:G6
30_데모범위_품질기준_제작기반 B2
50_메인콘텐츠 A14:J20
52_글쓰기_서사 A10:I16
99_변경이력 A130:H130
```

Readback 결과:

```yaml
decision_id: MATCH
chapter_rows: 7_OF_7_MATCH
story_rows: 7_OF_7_MATCH
term_distribution: 2_2_3_MATCH
no_separate_exam_current_consumers: MATCH_30_11_13
first_world_rewrite: MATCH
sheet_status: SHEET_WRITE_READBACK_PASS
```

## 충돌 감사

### 고권위 충돌

`NONE`.

기존 `GM-FULL-GAME-SCOPE-ENDING-01`은 1학년 Chapter 수를 `6~8 후보 / TEST_VALUE`로 두었으므로, 이번 하위 결정이 7로 구체화할 수 있다.

### stale consumer — 별도 시험

현행 고권위는 `NO_SEPARATE_EXAM`이다. 다음 current consumer에 남아 있던 오래된 시험 언어를 현재 의미로 교정했다.

- `30_데모범위_품질기준_제작기반`: 대표 플레이의 `시험`을 `교내 일상·제작`으로 교정.
- `11_세계관`: 마법학교의 `실기시험`을 `교내 응용·학기말 포트폴리오 평가`로 교정.
- `13_주요인물`: 플레이어/교수/핵심 동급생의 `시험` 중심 장면 표현을 `교내 응용·학기말 포트폴리오/학기평가`로 교정.

과거 결정의 거부 대안·역사 기록에 등장하는 시험 표현은 삭제하지 않는다.

### historical consumer — 3×3 회로

과거 3×3 회로 언어는 역사적 provenance로 보존한다. 현재 Chapter/Spell 권위로 승격하지 않으며 `FIVE_POINT_STAR`를 덮어쓰지 않는다.

## 적대검토

- **콘텐츠 과밀:** 7 Chapter를 7개의 별도 대형 지역으로 만들지 않는다. 학교·연구·축제·온실 공간의 상태 변형과 재사용을 우선한다.
- **공식 반복:** 다섯 기능은 고정하지만 시작점과 순서를 Chapter별로 바꾼다.
- **시험 제거=평가 제거 오인:** 학기말 포트폴리오 면담과 교수의 근거 설명을 유지한다.
- **계열 상위호환:** Ch3의 미선택 계열은 진행을 차단하지 않으며 계열 선택 자체에 평가 보너스를 주지 않는다.
- **실패 저장불러오기 최적화:** 실패를 삭제하지 않고 새 증거와 대체 해법으로 회복한다.
- **Slice와 Year-One 혼동:** `서리꽃 온실의 심장`은 Slice에서 압축 검증판, Year-One Ch6에서 확장판이다.
- **주문 정본 회귀:** historical 3×3 consumer를 신규 설계 근거로 사용하지 않는다.

## 잔여 NOT_RUN

```text
RUNTIME_NOT_RUN
DEVICE_NOT_RUN
HUMAN_PLAYTEST_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
```

이 sync는 기획 정본 동기화이며 위 증거 상태를 승격하지 않는다.

## 다음 축

연속작업 순서:

```text
C: 세계관·주요인물·세력·3년 서사
→ B: 성장·경제 TEST_VALUE
→ D: Vertical Slice 상세
```
