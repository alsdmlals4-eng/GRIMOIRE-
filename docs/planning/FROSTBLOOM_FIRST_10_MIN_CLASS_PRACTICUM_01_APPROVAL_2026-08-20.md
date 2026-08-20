# GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01 — 첫 10분 수업→현장실습 refinement

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260820-23-FIRST-10MIN-CLASS-PRACTICUM
approved_at_kst: 2026-08-20
approval: USER_APPROVED_CORE_INVARIANT
work_mode: PLAN
first_10_minute_contract: FIRST_10_MIN_CLASS_TO_GUIDED_PRACTICUM
first_10_minute_target_minutes: 10
class_target_minutes_test_value: 5
guided_field_practicum_target_minutes_test_value: 5
first_field_consequence_target: BEFORE_OR_AT_MINUTE_10
micro_five_point_star_application: REQUIRED
major_commit_count_effect: DOES_NOT_REPLACE_W6_W7
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

사용자가 승인한 핵심은 **게임 시작 후 10분을 목표로 수업을 진행하고, 배운 내용을 지도형 현장실습에서 실제로 사용해 보는 것까지 도달한다**는 것이다.

`5분 수업 + 5분 실습`은 최초 인간 플레이테스트용 `TEST_VALUE`다. 실제 사람이 10분 안에 이해·완료할 수 있다고 아직 증명하지 않았으며, 수업 4/실습 6 또는 수업 6/실습 4로 조정할 수 있다. 10분 상위 목표를 바꾸는 것은 별도 재검토 대상이다.

## 2. 왜 이 refinement가 필요한가

기존 46분 Graybox는 `00–06 수업 → 06–11 제작 → 11–14 자유일정 → 14–23 온실 조사` 순서였다. 구조적 기능은 분리되어 있었지만, 플레이어가 **배운 마법 문법을 실제 현장 문맥에 옮겨 적용하고 세계의 반응을 보는 순간**이 늦어질 위험이 있었다.

이번 refinement는 46분 `SINGLE_INCIDENT_SPIRAL`, W1–W7 작성 7회, W6/W7 주요 해결, 조사 2-of-4, 자유일정 1회, 5축 결과를 보존하면서 초반의 학습→전이만 압축한다.

## 3. Player Value Trace

```yaml
player_promise: "마법 수업에서 배운 의미를 외우는 데 그치지 않고 곧바로 실제 문맥에 적용하는 학생이 된다."
meaningful_choice: "같은 FLOW를 FOCUS 또는 DISPERSE로 어떻게 조율할지 선택하고 결과 차이를 본다."
expected_experience: "배웠다 → 내가 조합했다 → 현장이 실제로 반응했다 → 정답 하나가 아니라 문맥과 우선순위가 중요하다는 것을 느낀다."
research_question: "신규 플레이어가 10분 안에 수업→현장 적용의 연결을 이해하고 첫 세계 반응을 자기 선택의 결과로 인식하는가?"
observable_signal:
  - "W1~W3 의미 차이를 설명 없이 행동으로 구분한다."
  - "지도 실습에서 FOCUS/DISPERSE 중 하나를 이유를 갖고 선택한다."
  - "실습 결과 뒤 무엇이 좋아졌고 무엇이 남았는지 말할 수 있다."
  - "10분 안에 첫 현장 결과가 발생한다."
evidence_ceiling: "INTERNAL_DESIGN_HYPOTHESIS_UNTIL_HUMAN_PLAYTEST"
slice_acceptance: "Human test에서 시간·이해·선택 이유·결과 인과가 통과하면 유지, 아니면 첫 10분만 재작업한다."
```

## 4. 10분 플레이 흐름

### 00:00–05:00 — 수업 · 안전 선례

마렌은 통제된 안전 선례를 보여주되 정답 주문을 시범 답안처럼 제공하지 않는다. Frostbloom 본 사건의 Target·조합·결말은 노출하지 않는다.

1. **W1 FLOW** — 이동/흐름의 의미를 직접 작성하고 작은 현상에 적용한다.
2. **W2 FOCUS** — 같은 에너지를 좁혀 정밀하게 보내는 차이를 직접 작성한다.
3. **W3 DISPERSE** — 넓게 퍼뜨려 국소 강도를 낮추는 차이를 직접 작성한다.
4. 세 글자를 별개의 암기 카드로 끝내지 않고, 같은 입력에 FOCUS/DISPERSE가 다른 결과 형태를 만든다는 비교만 확인한다.

목표는 필기 인식 시험이 아니라 `meaning → context → consequence`를 이해하는 것이다. 긴 텍스트 강의, 세계관 연표, 모든 UI 설명, 전체 Mana/Inventory/성장 시스템 설명은 이 5분에서 제외한다.

### 05:00–10:00 — 지도 현장실습

수업 직후 별도 장시간 컷신 없이 가까운 교내 유지보수/실습 현장으로 이동한다. 이곳은 본편 `서리꽃 온실의 심장`의 정답을 미리 보여주는 축소 복제가 아니라 **낮은 위험의 독립 문맥**이다.

플레이어가 보는 현장 사실은 최소 두 개다.

- 한 지점의 흐름/압력이 비정상적이다.
- 인접한 보호 대상 때문에 단순 최대 출력이 좋은 답이 아니다.

플레이어 행동:

1. 관찰 가능한 두 사실을 확인한다.
2. 한 개의 bounded contextual tool 목적을 고르고 **W4**로 의미를 표식한다.
3. 이미 배운 `FLOW`를 Main으로 두고 `FOCUS` 또는 `DISPERSE` 중 하나를 Auxiliary로 선택해 **소형 FIVE_POINT_STAR**를 만든다.
4. Stage 2 Preview에서 범위·정밀도·예상 비용/위험의 차이를 본다.
5. 실제 training target을 명시적으로 선택한다.
6. Stage 3 final preview 후 명시적으로 사용한다.
7. **first observable field consequence occurs by minute 10**을 목표로, 선택에 따른 환경 반응을 즉시 확인한다.

이 실습은 별도 training transaction authority를 만들지 않는다. 구현 시 기존 Spell Workflow의 Stage 2/3와 exactly-once 의미를 재사용한다.

## 5. 실습 결과의 설계 원칙

`FOCUS`와 `DISPERSE` 어느 쪽도 UI에서 정답으로 표시하지 않는다.

예시적인 결과 형태:

- FOCUS: 좁은 대상에 더 정확하게 흐름을 바꾸지만 주변 압력/문제는 더 남을 수 있다.
- DISPERSE: 넓은 영역의 국소 압력을 낮추지만 특정 목표에 전달되는 효과는 약할 수 있다.

이는 **결과 형식의 예시**이지 Frostbloom 본 사건의 정답 조합이 아니다. 플레이어가 “내 선택이 무엇을 보호했고 무엇을 남겼는가”를 읽을 수 있어야 한다.

실습 직후 1줄 수준의 자동/간단 복기만 제공한다. 긴 수동 마도서 정리는 39–44분 Result/Grimoire 구간의 역할을 침범하지 않는다.

## 6. 기존 W1–W7과의 관계

```yaml
W1: CLASS_FLOW
W2: CLASS_FOCUS
W3: CLASS_DISPERSE
W4: GUIDED_PRACTICUM_CONTEXT_TOOL_MARK
W5: FROSTBLOOM_INVESTIGATION_NONCOMBAT_APPLICATION
W6: FIRST_MAJOR_FROSTBLOOM_SOLUTION
W7: OLD_REVISION_CONTEXT_REDESIGN
successful_direct_writing_events: 7
recovery_inclusive_cap: 10
major_five_point_star_commits_min: 2
micro_practicum_commit_role: NON_MAJOR_TRANSFER_PROOF
major_commit_count_effect: DOES_NOT_REPLACE_W6_W7
```

초기 지도 실습의 Micro-Star 사용은 **학습 전이 증명**이다. W6/W7의 본 사건 주요 Commit 최소 2회를 줄이지 않는다.

## 7. 46분 전체 흐름에 미치는 영향

```text
00–05 수업 W1~W3
→ 05–10 지도 현장실습 + W4 + Micro-Star 실제 적용
→ 10–14 대표 자유일정 1회
→ 14–23 Frostbloom 조사 2-of-4 + W5
→ 23–30 W6 첫 주요 해결
→ 30–39 옛 개정 Reveal + W7 재설계
→ 39–44 5축 Result + Grimoire
→ 44–46 Portfolio + 장기 Preview
```

독립 `06–11 CAMPUS_MICRO_CRAFTING` Beat는 제거한다. 제작의 의미는 W4의 bounded contextual tool 선택/표식에 흡수하되, 장기 제작 시스템 자체를 삭제하거나 Year-One 제작 정본을 바꾸지 않는다.

자유일정의 `PRACTICUM` 선택은 초기 필수 지도 실습과 구분한다. 초기 실습은 **첫 학습 전이용 필수 지도 실습**, 자유일정의 PRACTICUM은 선택형 추가 경험이며 메인 진행·필수 정보·필수 재료를 독점할 수 없다.

## 8. 최소 3개 실행 대안과 판정

### A — 5분 수업 + 5분 지도 실습 — TEST 우선안

- 장점: 학습과 전이에 동등한 시간을 주고 W1~W4를 기존 10분 안에 보존한다.
- 위험: 모바일 필기 입력이 느리면 수업이 5분을 넘길 수 있다.
- 판정: 첫 Human Slice에서 우선 TEST.

### B — 4분 수업 + 6분 지도 실습 — fallback

- 장점: 현장 선택·결과 시간을 더 확보한다.
- 위험: W1~W3가 단순 tracing rush가 될 수 있다.
- 재검토: 수업 이해는 빠르지만 현장 선택 시간이 부족할 때.

### C — 6분 수업 + 4분 지도 실습 — fallback

- 장점: 필기·의미 학습 부담을 낮춘다.
- 위험: 현장 적용이 안내 클릭 수준으로 축소될 수 있다.
- 재검토: 필기/접근성 때문에 5분 수업이 반복적으로 실패할 때.

10분 상위 목표 안에서 A/B/C 비율은 TEST_VALUE이며 사람 증거로 조정한다.

## 9. Fresh research / benchmark disposition

2026-08-20 fresh research:

- Apple `Onboarding for Games` — **ADAPT**: 핵심 루프를 짧은 단계로 가르치고, 한 번에 한 단계씩 능동적으로 수행하게 한 뒤 가능한 빨리 자기 주도 플레이로 넘긴다.
  - https://developer.apple.com/app-store/onboarding-for-games/
- Apple HIG `Onboarding` / `Designing for games` — **ADAPT**: 설명을 보는 것보다 실제 수행으로 배우게 하고, 게임 세계 안의 playable tutorial로 빠르게 성공 경험을 만든다.
  - https://developer.apple.com/design/human-interface-guidelines/onboarding
  - https://developer.apple.com/design/human-interface-guidelines/designing-for-games/
- Roblox Creator Hub `Onboarding techniques` — **ADAPT**: 실제 기능을 처음 사용하는 문맥에서 contextual tutorial을 제공해 학습 유지와 빠른 진입, 낮은 인지부하를 노린다.
  - https://create.roblox.com/docs/production/game-design/onboarding-techniques
- Chants of Sennaar — **REFERENCE_ONLY / ADAPT principle**: glyph 의미를 관찰·문맥·대화에서 추론하고 notebook으로 지식을 축적한다. 정답 번역 퍼즐 구조는 복제하지 않는다.
  - https://www.focus-entmt.com/en/news/chants-of-sennaar-shows-its-details-in-a-gameplay-overview-and-offers-a-free-demo-to-all-players
- Hogwarts Legacy — **REFERENCE_ONLY**: 학생 판타지에서 수업·주문 학습·현장 세계 탐험을 연결하는 시장 언어를 참고한다. 전투·콘텐츠 구조는 복제하지 않는다.
  - https://www.hogwartslegacy.com/en-us/faq

## 10. 5회 전체 적대적 검토

### Loop 1 — 정보 과부하 공격

공격: 10분 안에 W1~W4, 회로, Target, Preview를 모두 보여주면 너무 많은 시스템을 한 번에 가르칠 수 있다.

대응: 첫 실습의 FIVE_POINT_STAR는 Main 1 + Auxiliary 1만 사용한다. Vault/Stock 최적화, 복수 주문, 장기 경제, 전체 결과축은 설명하지 않는다. 필요한 기능을 처음 쓸 때만 안내한다.

### Loop 2 — 가짜 선택 공격

공격: FOCUS/DISPERSE 중 사실상 정답 하나가 있으면 “문맥과 책임”이라는 핵심이 튜토리얼 정답 찾기로 퇴행한다.

대응: 두 선택 모두 실습 목표를 부분적으로 충족하되 보호 대상·잔여 문제의 형태가 달라야 한다. 최적/추천/정답 아이콘을 금지한다.

### Loop 3 — 본 사건 스포일러 공격

공격: 실습이 Frostbloom의 관개/압력 문제를 그대로 축소하면 W6 판단을 미리 가르친다.

대응: 독립적인 교내 유지보수 문맥을 사용하고 Frostbloom의 조사 노드, 옛 개정 Reveal, W6 target/circuit을 노출하지 않는다.

### Loop 4 — 작성 피로 공격

공격: 10분 안에 네 번 직접 작성하면 특히 터치 입력에서 피로·시간 초과가 발생할 수 있다.

대응: W4는 짧은 contextual mark 역할을 유지하고, 실패 복구는 새 design event로 세지 않는다. Human/device test 전까지 5+5는 TEST_VALUE다. 반복 초과 시 콘텐츠를 추가하지 않고 전환·설명·연출 시간을 먼저 줄인다.

### Loop 5 — 기존 정본 회귀 공격

공격: Micro-Star를 넣으며 W6/W7 major commit, exactly-once, Task8 authority, 46분 시간 구조를 약화할 수 있다.

대응: Micro-Star는 `NON_MAJOR_TRANSFER_PROOF`; W6/W7 major commit 최소 2회는 그대로다. 별도 transaction/Mana/result authority를 만들지 않고 기존 Stage 2/3를 재사용한다. Human/Device/Performance/Full Slice 증거도 승격하지 않는다.

## 11. 완료 기준과 재검토 조건

설계 단계 완료:

- 10분 상위 목표가 canonical child refinement로 기록된다.
- 46분 walkthrough의 0–14분이 `수업 5 → 지도실습 5 → 자유일정 4`로 정렬된다.
- W1~W7/major W6/W7/2-of-4/5축 결과가 회귀하지 않는다.
- Notion Project Home/Flow/작업계획이 같은 의미를 읽을 수 있다.

Human Slice 이후 재검토:

- 10분 이전에 첫 현장 결과를 못 보는 비율이 높다.
- W1~W3 의미를 구분하지 못한 채 실습으로 넘어간다.
- FOCUS/DISPERSE 선택 이유를 설명하지 못한다.
- 실습이 정답 퍼즐처럼 보인다.
- 필기 피로 또는 작은 화면 조작 때문에 10분 목표가 구조적으로 불가능하다.

그 경우 A/B/C 시간 배분을 먼저 재조정하고, 46분 전체 구조 확장은 마지막 수단으로 둔다.
