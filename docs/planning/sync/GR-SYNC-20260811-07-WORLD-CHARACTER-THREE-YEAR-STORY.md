# GR-SYNC-20260811-07-WORLD-CHARACTER-THREE-YEAR-STORY

```yaml
sync_id: GR-SYNC-20260811-07-WORLD-CHARACTER-THREE-YEAR-STORY
decision_id: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01
status: USER_APPROVED_BRANCH_AND_SHEET_READBACK_PASS
approved_at: 2026-08-11T08:51+09:00
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: 4098fea229aa64eedbf8ff35b133ce6567518f03
branch: planning/world-character-three-year-story
task8_pr: 116
task8_state: ON_HOLD_USER_REQUEST_COST_DEPENDENCY
persistent_godot_source_mutation: NONE
sheet_write_readback: PASS
```

## 승인 내용

- 세계의 핵심 구조를 `원문 / 정식 / 문맥 / 개정`으로 고정한다.
- 학교 정식은 절대진리가 아니라 검증된 안전 선례다.
- 1학년 세 교육 계열을 `유동학(FLOW) / 변성학(HEAT) / 결계학(PROTECT)`으로 고정한다.
- `FOCUS / DISPERSE`는 모든 계열이 쓰는 공통 조율 문법이다.
- 플레이어는 혈통·예언 기반 선택받은 자가 아니다.
- 주요인물은 마렌, 카시안, 네아, 에일린, 모트이며 기존 역할 정본을 구체화한다.
- 주요 세력은 마도학원 정식위원회, 현장복원단, 정령협약망, 개방서고 연합이다.
- 세력별 별도 메인 캠페인을 만들지 않고 공유 사건을 상충 관점으로 재해석한다.
- 3년 서사 질문은 `왜 맞는가? -> 누가 바꿀 권리가 있는가? -> 무엇을 바꾸지 않을 책임이 있는가?`로 상승한다.
- 성장·경제 수치와 Vertical Slice 세부 시간 설계는 각각 B/D의 별도 소유이며 C에서 확정하지 않는다.

## GitHub 변경

```text
docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md
docs/superpowers/specs/2026-08-11-world-character-three-year-story-design.md
docs/planning/CURRENT_CONFIRMED_DECISIONS.md
tests/test_world_character_three_year_story_contract.py
docs/planning/sync/GR-SYNC-20260811-07-WORLD-CHARACTER-THREE-YEAR-STORY.md
```

Superpowers spec은 process overlay용 thin spec이며 프로젝트 정본을 복제하거나 덮어쓰지 않는다.

## Google Sheet 동기화

명시적으로 쓴 뒤 재조회한 범위:

```text
00_프로젝트_허브 H2:K2
01_작업순서 A62:J62
02_현재_확정결정 A78:J78
04_누락_충돌_감사 A91:J91
11_세계관 A5:H8
13_주요인물 A3:J8
14_조연_세력_관계 A5:J8
52_글쓰기_서사 A17:I19
99_변경이력 A132:H132
```

Readback 결과:

```yaml
decision_id: MATCH
world_layers: MATCH
three_year_one_schools: MATCH
common_focus_disperse_grammar: MATCH
named_core_characters: MATCH
four_factions: MATCH
three_year_questions: MATCH
b_values_still_test_value: PRESERVED
no_godot_mutation: MATCH
sheet_status: SHEET_WRITE_READBACK_PASS
```

## 충돌 감사

### 고권위 충돌

`NONE`.

기존 `GM-YEAR-ONE-CHAPTER-CURRICULUM-01`은 Ch3 계열의 세계관 명칭과 세력 세부를 C에서 확정하도록 남겨 두었으므로 이번 결정은 그 예약 범위를 구체화한다.

### 보호되는 다른 권위

- `NO_SEPARATE_EXAM` 유지.
- `FIVE_POINT_STAR / GM-SPELL-WORKFLOW-UI-V2-01` 유지.
- Stock/Summon/Star runtime 수치 권위 변경 없음.
- B의 수강 슬롯·자유일정 창·평가 가중치·재료량·반복 감쇠는 `TEST_VALUE` 유지.
- D의 Internal Vertical Slice 시간·장면 밀도는 미변경.
- Task8 Draft #116 ON_HOLD 상태 미변경.

## 적대검토

- **학교 악역화:** 정식위원회와 카시안이 실제 안전·속도·재현성 가치를 갖는다.
- **숨은 진짜 정답:** 원문은 학생이 직접 편집하는 비밀 소스코드가 아니다.
- **오라클 동반자:** 네아는 감각 반응과 과거 흔적 증언만 하며 주문 해법을 말하지 않는다.
- **선택받은 자:** 플레이어의 저자성은 3년의 관찰·기록·책임에서 나온다.
- **세력 분기 폭증:** 세력별 메인 캠페인을 만들지 않는다.
- **개정 리셋:** 실패, 타인의 선택, 생명, 이미 발생한 역사를 임의 삭제하지 않는다.
- **3학년 파워 인플레이션:** 파괴력보다 보존 범위와 책임이 확장된다.
- **B/D 결합:** C 고유명사·세력 세부 변경이 B 수치나 D Slice 시간 검증을 깨지 않도록 소유권을 분리한다.

## 잔여 NOT_RUN

```text
RUNTIME_NOT_RUN
DEVICE_NOT_RUN
HUMAN_PLAYTEST_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
```

이 sync는 기획 정본 동기화이며 위 증거를 승격하지 않는다.

## 다음 축

```text
B: 성장·경제 TEST_VALUE
-> D: Vertical Slice 상세
```
