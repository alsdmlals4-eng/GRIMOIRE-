# Frostbloom Cast and Dialogue Design

## 1. Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
status: WRITTEN_SPEC_READY_FOR_USER_REVIEW
written_at: 2026-08-04T07:05+09:00
parent_pedagogy: GM-SCHOOL-CRISIS-PEDAGOGY-01
parent_situation: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
implementation: NOT_STARTED
codex: DEFERRED
counter_increment: false
grill_counter: 3_of_10
```

이 문서는 `서리꽃 온실의 심장`의 고유 인물, 대화 정보 구조, 주문 전 힌트, 시전 후 반응, 교수 개입 대사를 정의한다. 사용자 승인 전까지 캐릭터 이름과 원고는 Draft다.

---

## 2. Goal

플레이어가 등장인물의 말을 정답 목록이 아니라 **서로 다른 관점의 증거**로 읽게 한다.

```text
환경 사실
→ 인물의 해석과 편향
→ 플레이어의 우선순위
→ 주문 초안
→ 예상 효과
→ 실제 결과
→ 관계 반응과 복기
```

성공 기준:

1. 같은 사실을 두 인물이 다르게 해석한다.
2. 플레이어가 한 인물의 의견을 따르지 않아도 유효한 해결이 가능하다.
3. 교수는 정답을 말하지 않고 판단 질문과 안전 경고만 제공한다.
4. 고립 학생이 물리 조작과 정보 제공으로 해결에 참여한다.
5. 동반 정령의 감각 힌트는 환경 조사로 검증 가능하다.
6. 한 번의 접근 선택이 결말과 인간관계를 잠그지 않는다.

---

## 3. Cast Contract

| 인물 | 정보 영역 | 핵심 가치 | 편향 | 절대 하지 않는 일 |
|---|---|---|---|---|
| 에일린 로스베르 | 안전·책임·원리 | 책임 있는 자립 | 근거 없는 자기희생을 강하게 경계 | 정확한 주문 조합·결말 지시 |
| 마렌 브리어 | 배관·관개·환기·온실 | 축적된 생명과 시설 | 복구를 서둘러 인명 시간을 과소평가 가능 | 시설만을 위해 생명을 희생하라고 명령 |
| 카시안 렌 | 속도·집중·제압 | 지연보다 행동 | 즉시 효과를 과대평가 | 무조건 공격만 주장 |
| 네아 솔렌 | 내부 통로·밸브·격벽 | 구조 대상의 행위성 | 자신의 위험을 축소 | 수동적 구조 보상으로 머묾 |
| 모트 | 정령 감정·마력 리듬 | 살아 있는 마력의 감각 | 기계 구조를 이해하지 못함 | 정답 번역·기계 수치 설명 |

---

## 4. Dialogue Unit

대사 한 묶음은 다음 구조를 권장한다.

```yaml
dialogue_hint:
  observed_fact: 화자가 알고 있는 사실 하나
  interpretation: 화자의 가치관에 따른 해석
  implied_tradeoff: 선택 시 얻는 것과 잃는 것
  exact_spell_instruction: null
```

예:

```text
마렌: “관개수는 아직 따뜻해. 배관 하나를 녹일 정도는 돼.”
마렌: “다만 그 물은 지금 서리꽃 뿌리를 지키고 있어.”
```

- 사실: 따뜻한 관개수가 존재한다.
- 해석: 시설 복구에 활용 가능하다.
- 대가: 묘목 보온을 포기할 수 있다.
- 정답 조합: 말하지 않는다.

---

## 5. Information Redundancy

필수 생존 정보는 최소 두 경로로 제공한다.

| 정보 | 경로 A | 경로 B |
|---|---|---|
| 주 배관 과압 | 압력계 조사 | 마렌 대사 |
| 네아 체온 저하 | 네아 통신 | 교수 생체 모니터 |
| 정령이 원인이 아닐 가능성 | 모트 감각 | 정령 행동 조사 |
| 외부 배기 피해 | 설비 조사 | 마렌 경고 |
| 철수 가능 | S0 교수 브리핑 | S9/S10 선택지 |

관계 수치나 특정 대화 선택 하나가 필수 정보를 독점하지 않는다.

---

## 6. Scene Dialogue Budget

```yaml
mobile_dialogue:
  recommended_sentences_per_bubble: 1_to_2
  maximum_sentences_per_bubble: 3
  optional_conversation_lines_per_scene: 2_to_6
  route_hint_visible_lines: 2_to_4
  timer_during_reading: PAUSED
```

- 설명문보다 인물의 반응을 우선한다.
- 같은 정보를 세 인물이 반복하지 않는다.
- 길어진 원리 설명은 예상 효과 카드로 옮긴다.
- 교수 질문이 연속 세 번 이상 이어지지 않게 한다.

---

## 7. Branching Model

대사는 독립 분기 맵을 만들지 않고 공통 장면에 조건부 레이어를 얹는다.

```yaml
conditions:
  investigations: [PIPE, VENT_IRRIGATION, SPIRIT, NEA_COMMS]
  selected_approach: [FACILITY, RESCUE, SPIRIT, CONTAINMENT, SUPPRESSION]
  first_cast_result: [VALID, PARTIAL, DESIGN_MISMATCH, INPUT_FAILURE]
  second_crisis: true
  faculty_level: [L0, L1, L2, L3]
  final_result: [RESTORE, EVACUATE, RECONCILE, CONTAIN, SUPPRESS, PARTIAL]
```

대사 자산은 다음 단위로 관리한다.

```text
공통 도입
+ 조사별 대사
+ 인물 의견
+ 접근별 4개 힌트 패키지
+ 시전 결과 패키지
+ 두 번째 위기 패키지
+ 결말별 반응
+ 교수 복기
```

---

## 8. Professor Intervention Dialogue

### L1 Direction

- 질문은 놓친 조건을 가리킨다.
- 정확한 대상·보조 글자를 말하지 않는다.
- 반복 사용 시 더 직접적인 관찰 문장으로 전환한다.

### L2 Warning

- 위험의 원인과 임박한 결과를 명확히 말한다.
- 수정·계속·철수 선택을 보장한다.
- 모호한 수수께끼 표현을 금지한다.

### L3 Lifesaving

- 치명 위험만 제거한다.
- 사건의 핵·정령·시설 문제는 남겨 둔다.
- 개입 후 조롱이나 강제 게임 오버를 금지한다.
- `FACULTY_LIFESAVING_INTERVENTION` 태그와 복기를 생성한다.

---

## 9. Relationship Reactions

관계 반응은 선택한 접근이 아니라 **선택 이유와 책임 설명**으로 결정한다.

예:

- 시설 복구를 선택했더라도 네아의 생명 상태를 확인하고 위험선을 관리했다면 네아 관계가 자동 하락하지 않는다.
- 구조를 선택했더라도 시설을 무관심하게 파괴하면 마렌이 반발한다.
- 제압을 선택했더라도 정령을 처치하지 않고 시간을 벌었다면 모트의 반응은 중립 또는 복합적이다.
- 철수를 선택했더라도 피해 확산을 막고 적시에 지원을 요청했다면 교수는 위험 관리를 인정한다.

---

## 10. Adversarial Review

### Risk A — 교수의 질문이 답답한 수수께끼가 됨

대응:

- L1은 관찰 범주를 좁힌다.
- L2는 위험 원인과 결과를 직접 말한다.
- 안전 정보는 질문이 아니라 명시 문장으로 전달한다.

### Risk B — 마렌과 카시안이 틀린 답을 주는 장치로 보임

대응:

- 시간 부족 상황에서는 카시안의 신속 대응이 최적일 수 있다.
- 시설 연쇄 피해가 큰 상황에서는 마렌의 복구 판단이 최적일 수 있다.
- 두 인물 모두 다른 루트의 성공을 인정하고 학습한다.

### Risk C — 네아가 구조를 거부해 플레이어를 방해함

대응:

- 자신의 위험을 축소하지만 교수 모니터가 객관 정보를 제공한다.
- 위험선이 가까워지면 “괜찮다”는 말을 스스로 정정한다.
- 최종 결정권은 플레이어에게 남긴다.

### Risk D — 모트가 정답 탐지기가 됨

대응:

- 감정·진동·방향만 말한다.
- 기계 구조·수치·정확한 목표는 말하지 못한다.
- 모트의 해석도 환경 조사로 검증해야 한다.

### Risk E — 대사량이 주문 플레이를 압도함

대응:

- 필수 장면은 짧게 유지한다.
- 상세 의견은 선택 대화로 분리한다.
- 이미 확인한 정보는 요약 카드로 대체한다.
- 반복 플레이에서는 조사·브리핑 단축 옵션을 제공한다.

---

## 11. Acceptance Checklist

```text
[ ] 다섯 인물의 말투를 이름 없이도 구분할 수 있다.
[ ] 각 인물에게 실제로 유효한 관점과 위험한 편향이 모두 있다.
[ ] 20개 힌트 패키지가 정확한 주문 조합을 지시하지 않는다.
[ ] 네아가 최소 네 개 해결 패턴에 물리적으로 기여한다.
[ ] 교수 L3가 발생해도 사건 전체가 자동 해결되지 않는다.
[ ] 철수 결말이 실패 화면이 아니라 결과·복기 장면으로 이어진다.
[ ] 필수 생존 정보가 두 경로 이상에서 제공된다.
[ ] 대화 중 실시간 타이머가 흐르지 않는다.
[ ] 참고작 고유 인물·문장·사건을 복제하지 않는다.
[ ] 제품 Godot 구현을 시작하지 않는다.
```

---

## 12. Canonical Drafts

- Character draft: `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- Dialogue manuscript: `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- Scene flow: `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`
- Route patterns: `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`

다음 Gate는 사용자 검토다. 승인 전 이름·대사·관계 반응은 확정 정본이 아니다.
