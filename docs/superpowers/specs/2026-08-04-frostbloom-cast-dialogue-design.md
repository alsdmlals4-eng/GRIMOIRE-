# Frostbloom Cast and Dialogue Design

## 1. Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
status: WRITTEN_SPEC_READY_FOR_USER_REVIEW
revised_at: 2026-08-04T07:27+09:00
parent_pedagogy: GM-SCHOOL-CRISIS-PEDAGOGY-01
parent_situation: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
implementation: NOT_STARTED
codex: DEFERRED
counter_increment: false
grill_counter: 3_of_10
```

이 문서는 1학년 중심 관계 구조에 맞춰 `서리꽃 온실의 심장`의 인물 수와 대사 책임을 축소한다.

---

## 2. Core Cast Model

```text
평소 관계와 사건 중심
= 플레이어 + 같은 1학년 카시안

안전·교육 경계
= 에일린 교수

가끔 등장하는 믿음직한 조언자
= 2학년 마렌 선배

비인간 감각 파트너
= 메인 동반 정령 모트
```

인간 핵심 인물은 교수·동급생·선배 카메오 세 명이다. 별도의 저학년 구조 대상이나 상시 상급생 파티원을 만들지 않는다.

---

## 3. Incident Logic

### Trigger

카시안은 1학년 온실 실습에서 닫힌 회수 밸브를 확인하지 않고 `흐름+집중`을 사용한다.

```text
성급한 냉기 마력 회수
→ 닫힌 출구에서 역압
→ 중심 핵 안전 정지
→ 냉기 누출과 정령 과부하
→ 자동 격벽 폐쇄
→ 카시안 고립
```

### Why it is plausible

- 1학년이 이미 배운 글자만 사용한다.
- 주문 입력 실패가 아니라 상황 조건을 놓친 설계 실패다.
- 빠른 성과를 원한 동급생의 성격과 연결된다.
- 플레이어가 같은 주문 지식을 더 책임 있게 응용할 기회를 만든다.
- 사고 원인이 특정 악당이나 외부 음모에 의존하지 않는다.

### Responsibility treatment

카시안은 사고를 냈지만 민폐 장치로만 쓰지 않는다.

- 사실을 즉시 인정한다.
- 내부 상태와 사고 원인을 전달한다.
- 수동 밸브·격벽을 조작한다.
- 구조 대상이면서 네 개 이상의 해결 패턴에 기여한다.
- 결말 뒤 재발 방지 학습과 책임 기록을 남긴다.

---

## 4. Cast Contract

| 인물 | 정보 영역 | 가치 | 편향 | 절대 하지 않는 일 |
|---|---|---|---|---|
| 에일린 로스베르 | 안전·책임·원리 | 책임 있는 자립 | 근거 없는 자기희생을 강하게 경계 | 정확한 조합·결말 지시, 핵심 목표 대행 |
| 카시안 렌 | 내부 밸브·사고 잔향·시간 압박 | 지연보다 행동 | 집중과 빠른 결과를 과대평가 | 사고 은폐, 끝까지 수동적 구조 대상 |
| 마렌 브리어 | 배관·관개·환기·온실 도면 | 믿을 만한 실무 지원 | 시설 보존을 중시 | 상시 동행, 사건 전체 해결 |
| 모트 | 정령 감정·마력 리듬 | 살아 있는 마력 감각 | 기계 구조를 이해하지 못함 | 정답 번역, 수치·배관 구조 설명 |

---

## 5. Upperclass Cameo Rule

상급생은 1학년 과정에서 일상적으로 함께 다니지 않는다.

마렌의 등장 허용 지점:

1. 실습 시작 전 시설 구조 안내
2. 사고 직후 인접 온실 확산 차단 선언
3. 조사한 도면·표식의 원격 해석
4. 사건 종료 후 후속 복구와 짧은 피드백

금지:

- 플레이어와 함께 모든 조사를 수행
- 주문 조합 추천
- 내부로 들어가 핵·정령·카시안을 직접 해결
- 동급생 관계 콘텐츠를 대체
- 모든 사건에서 반복 등장

마렌이 직접 해결하지 않는 이유는 인접 시설의 확산 차단이라는 별도 필수 임무와 학교의 자립 교육 원칙으로 이중 설명한다.

---

## 6. Dialogue Information Model

대사 한 묶음은 다음 구조를 사용한다.

```yaml
dialogue_hint:
  observed_fact: 확인 가능한 사실
  interpretation: 화자의 관점
  implied_tradeoff: 얻는 것과 잃는 것
  exact_spell_instruction: null
```

예:

```text
마렌: “저압 회수관은 압력을 받을 수 있어.”
카시안: “네가 보내기 전에 말해 줘. 내가 밸브를 열게.”
```

- 시설 사실과 협력 가능성을 알려준다.
- 어떤 글자와 보조 글자를 쓸지는 말하지 않는다.

---

## 7. Information Redundancy After Cast Reduction

| 필수 정보 | 경로 A | 경로 B |
|---|---|---|
| 주 배관 과압 | 압력계 | 카시안 통신 |
| 저압 회수관 | 온실 도면 | 마렌 조언 |
| 카시안 체온 저하 | 교수 모니터 | 카시안 대사 |
| 정령이 피해자일 가능성 | 행동 관찰 | 모트 감각 |
| 외부 배기 피해 | 설비 표식 | 마렌 경고 |
| 사고 원인 | 카시안 고백 | 주문 잔향 |
| 철수 가능 | 교수 브리핑 | 비상 규정판 |

인물 감소로 사라진 정보는 환경 UI와 조사 단서로 옮긴다. 관계 수치나 특정 대화 선택이 필수 정보를 독점하지 않는다.

---

## 8. Branching Model

```yaml
conditions:
  investigations: [PIPE, VENT_IRRIGATION, SPIRIT_RESIDUE, CASSIAN_COMMS]
  selected_approach: [FACILITY, RESCUE, SPIRIT, CONTAINMENT, SUPPRESSION]
  first_cast_result: [VALID, PARTIAL, DESIGN_MISMATCH, INPUT_FAILURE]
  cassian_cooperation: AVAILABLE
  upperclass_hint: OPTIONAL
  faculty_level: [L0, L1, L2, L3]
  final_result: [RESTORE, EVACUATE, RECONCILE, CONTAIN, SUPPRESS, PARTIAL]
```

자산 구조:

```text
공통 실습 도입
+ 카시안 사고 장면
+ 조사 4종
+ 교수·카시안·마렌·모트 관점 힌트
+ 접근 5종 × 대표 패턴 4종
+ 첫 시전 결과
+ 두 번째 균열
+ 결말 6종과 L3 구조
+ 마도서 복기
```

---

## 9. Relationship Design

관계는 루트 자체보다 행동 이유와 책임 처리로 변한다.

### 카시안

긍정:

- 사고 책임을 인정하게 하되 현장 협력을 활용한다.
- 그의 생명 상태를 무시하지 않는다.
- 결말 뒤 재발 방지 조건을 함께 기록한다.

부정:

- 모든 책임을 떠넘기고 정보까지 무시한다.
- 실수를 조롱하기 위해 구조를 지연한다.
- 반대로 책임을 묻지 않고 무모함을 칭찬한다.

### 마렌

긍정:

- 조언을 참고하되 독립적으로 판단한다.
- 시설을 포기할 때도 이유와 대가를 설명한다.

부정:

- 선배가 해결해 주기만 기다린다.
- 시설 정보와 외부 피해를 확인하지 않는다.

---

## 10. Professor Intervention

카시안이 사고 원인이라는 사실은 교수의 개입 기준을 바꾸지 않는다.

- L0: 비치명적 실수와 시설 손실 관찰
- L1: 놓친 출발점·도착점·우선순위 질문
- L2: 역류·체온 저하·파열 임박을 명확히 경고
- L3: 카시안 또는 플레이어의 생명이 즉시 위험할 때만 구조

L3 뒤에도 핵·정령·시설 문제는 남는다.

---

## 11. Adversarial Review

### Risk A — 카시안이 독자에게 미움받기 위한 민폐 캐릭터가 됨

대응:

- 실수는 배운 주문의 이해 가능한 오판에서 발생한다.
- 즉시 인정하고 유용한 정보를 제공한다.
- 수동 조작으로 해결에 기여한다.
- 사고 결과와 관계 변화가 장기적으로 남는다.

### Risk B — 선배가 믿음직하면 플레이어보다 잘 해결해야 함

대응:

- 마렌은 인접 온실 확산 차단을 담당한다.
- 내부 실시간 정보는 플레이어와 카시안이 더 많이 갖는다.
- 선배의 능력은 정답 제공이 아니라 정확한 실무 정보와 후속 지원으로 표현한다.

### Risk C — 같은 학년만 만나면 세계가 좁아짐

대응:

- 1학년 과정의 주 관계는 동급생으로 집중한다.
- 교수·선배·교직원은 수업과 사건의 필요에 따라 짧게 등장한다.
- 선배는 반복 파티원이 아니라 학교가 이어지는 느낌을 주는 카메오로 사용한다.

### Risk D — 사고 원인이 너무 튜토리얼스럽게 보임

대응:

- 시설·정령·생명·관계가 동시에 얽힌 실제 결과를 만든다.
- 첫 주문 뒤 새 균열로 단순 복구를 넘어 재판단을 요구한다.
- 동일 주문도 목표와 경로에 따라 다른 결과를 만든다.

### Risk E — 모든 향후 사건이 동급생 실수로 시작함

대응:

- 이 사건 전용 발단으로 제한한다.
- 후속 사건은 시설 노후·마력 생태·외부 의뢰·플레이어 선택 등 다른 원인을 사용한다.

---

## 12. Acceptance Checklist

```text
[ ] 인간 핵심 인물이 교수·동급생·선배 카메오 세 명으로 제한된다.
[ ] 1학년 과정의 지속 관계는 동급생 중심이다.
[ ] 카시안은 사고 원인과 협력자 역할을 모두 수행한다.
[ ] 카시안이 최소 네 개 대표 해결 패턴에 물리적으로 기여한다.
[ ] 마렌은 가끔 등장하는 믿음직한 조언자이며 상시 파티원이 아니다.
[ ] 마렌이 사건 전체를 해결하지 않는 실무적 이유가 있다.
[ ] 제거된 인물의 필수 정보가 환경·기록·통신으로 이전됐다.
[ ] 교수는 정답 조합을 말하지 않는다.
[ ] 참고작 고유 인물·문장·사건을 복제하지 않는다.
[ ] 제품 Godot 구현을 시작하지 않는다.
```

---

## 13. Canonical Drafts

- Character draft: `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- Dialogue manuscript: `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- Scene flow: `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`
- Route patterns: `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`

다음 Gate는 축소된 인물 구조와 대사 원고에 대한 사용자 검토다. 승인 전 이름·대사·관계 반응은 확정 정본이 아니다.
