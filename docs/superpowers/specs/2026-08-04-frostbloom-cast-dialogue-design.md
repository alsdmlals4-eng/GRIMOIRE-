# Frostbloom Cast, Dialogue, and Investigation-Based Faculty Demonstration Design

## 1. Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
related_draft_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
status: WRITTEN_SPEC_READY_FOR_USER_REVIEW
revised_at: 2026-08-04T08:03+09:00
parent_pedagogy: GM-SCHOOL-CRISIS-PEDAGOGY-01
parent_situation: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
implementation: NOT_STARTED
codex: DEFERRED
counter_increment: false
grill_counter: 3_of_10
```

---

## 2. Goal

교수가 말로 해결법을 가르치지 않으면서도, 플레이어가 이미 배운 `열 + 흐름` 회로를 **텍스트 노벨 조사로 확인**하고 실제 효과를 관찰해 사건 해결 방향을 스스로 추론하게 한다.

```text
교수의 안전 회로 시전
→ 감각적 관찰 결과
→ 플레이어가 회로 조사 선택
→ 이미 배운 열·흐름 형태 확인
→ 환경·상태 조사
→ 플레이어가 우선순위·경로·대가 선택
→ 자신의 회로 작성
```

---

## 3. Minimal Cast

| 인물 | 역할 | 정보 책임 | 금지 |
|---|---|---|---|
| 에일린 교수 | 안전선·비언어적 시연 | 외부 확산 차단, 생체·위험 감시 | 내부 목표 해결, 정답 조합 설명 |
| 카시안 | 같은 1학년 사고 촉발자·협력자 | 내부 밸브·압력·균열·통로 | 사고 은폐, 수동적 민폐 역할 |
| 모트 | 동반 정령 | 정령 감정·마력 방향·온도 감각 | 배관 수치·정답 번역 |

상급생은 이번 사건에 등장하지 않는다. 시설 정보는 도면·표식·계기와 주문 잔향으로 제공한다.

---

## 4. Learned Circuit Draft

```yaml
main_glyph: 열
connection_grammar: 흐름
optional_supports: [집중, 분산]
known_representative_circuit: 열 + 흐름
```

- `열`은 현상을 만드는 메인 글자다.
- `흐름`은 열이 이동할 대상·경로·순서를 구성한다.
- `집중·분산`은 열 전달의 강도와 범위를 조절한다.
- `흐름`을 두 번째 메인 글자로 취급하지 않는다.

이 항목은 기존 Slice의 `흐름 메인` 계약과 충돌하므로 사용자 승인 후 명시적으로 정본을 보정한다.

---

## 5. Same Circuit, Different Judgment

### Cassian failure

```text
열 발생
→ 닫힌 배관으로 흐름 전달
→ 출구 없음
→ 온도·압력 급상승
→ 균열과 냉기 누출
```

```yaml
input: VALID
circuit_grammar: VALID
situation_fit: INVALID
failure_type: SITUATION_DESIGN_FAILURE
```

### Faculty safety use

```text
열 발생
→ 열린 외곽 고리로 흐름 전달
→ 유리벽을 따라 열 이동
→ 결빙 완화
→ 외부 냉기 진행 방향 전환
→ 외부 확산만 차단
```

같은 키워드라도 경로·출구·목표가 다르면 결과가 달라진다는 것을 보여준다.

---

## 6. Faculty Demonstration Sequence

### Beat 1 — Threat

냉기 안개가 유리 틈을 지나 학교 회랑으로 퍼진다.

### Beat 2 — Silent casting

교수는 회로 이름을 말하지 않고 외벽에 회로를 전개한다.

### Beat 3 — Sensory observation

플레이어에게는 다음처럼 감각과 실제 변화만 표시한다.

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

이 단계에서는 `[인식: 열]`, `[인식: 흐름]` 같은 자동 판독 UI를 사용하지 않는다.

### Beat 4 — Minimal faculty line

허용:

- `외부 확산은 막았다.`
- `내부 문제는 그대로다.`

교수는 사용 회로·효과 원리·추천 목표를 말하지 않는다.

---

## 7. Text-Novel Circuit Investigation

회로를 조사하는 선택은 행동 횟수와 실시간 시간을 소모하지 않는다.

### Choices

```text
빛이 시작된 문양을 살핀다.
빛이 이동한 선을 따라간다.
회로 모서리의 문양을 살핀다.
조사하지 않고 온실 내부를 본다.
```

### Start glyph result

```text
수업에서 여러 번 그렸던 형태다.
문양 가까이에서 따뜻한 기운이 느껴진다.

[확인한 키워드: 열]
```

### Path result

```text
빛은 한곳에 머물지 않는다.
수업에서 익힌 연결선과 같은 방향으로 유리벽을 따라 이어진다.

[확인한 키워드: 흐름]
```

### Advanced corner result

```text
익숙한 선 사이에 아직 배우지 않은 복잡한 문양이 섞여 있다.
형태는 보이지만 작동 원리는 읽을 수 없다.
```

키워드 확인은 이미 배운 글자의 현장 재인식이며 신규 해금이 아니다.

---

## 8. Observation UX Contract

### Allowed

- 온도·촉감·빛·소리 같은 감각
- 서리가 녹거나 압력계가 움직이는 실제 변화
- 냉기 안개의 방향 변화
- 해결되지 않은 위험을 보여주는 현재 상태

### Prohibited

```text
열이 흐름 경로를 따라 이동했습니다.
열+흐름 회로를 확인했습니다.
열을 배관에 적용하면 해결할 수 있습니다.
열을 열린 순환 경로에 보내십시오.
```

시스템은 `왜`와 `어떻게 써야 하는가`를 설명하지 않는다.

---

## 9. Information Redundancy

| 정보 | 기본 경로 | 보조 경로 |
|---|---|---|
| 닫힌 회수 밸브 | 상태 문양·도면 | 카시안 고백 |
| 주 배관 과압 | 압력계 | 교수 L2 경고 |
| 기존 열원 | 환기·관개 표식 | 예상 효과 카드 |
| 사용된 `열` | 시작 문양 조사 | 카시안 고백 |
| 사용된 `흐름` | 이동 경로 조사 | 카시안 고백 |
| 냉기 방향 변화 | 실제 안개 연출 | 짧은 관찰 결과 |
| 정령 과부하 | 정령 밝기·행동 | 모트 감각 |
| 카시안 생명 상태 | 교수 모니터 | 카시안 통신 |
| 철수 가능 | 브리핑 | 비상 규정판 |

필수 정보는 관계 선택 하나에 독점시키지 않는다.

---

## 10. Dialogue Budget

교수:

- 브리핑에서 교육 원칙 2~3문장
- 외곽 회로 뒤 상태 선언 2문장
- L1 질문 1문장
- L2 안전 경고 1~2문장
- L3 구조 뒤 복기 1~2문장

카시안:

- 사고 고백
- 내부 관찰
- 밸브·격벽 협력
- 결과 책임

모트:

- 정령 감정
- 온도와 냉기 방향의 감각
- 기계 구조를 모르는 한계

대사와 시스템이 같은 관찰을 반복 설명하지 않는다.

---

## 11. Adversarial Review

### Risk A — Investigation becomes a disguised tutorial prompt

- 조사 선택은 회로를 살피는 행동으로 표현한다.
- 조사 결과는 익숙한 형태를 알아보는 데서 멈춘다.
- 내부 사건에 사용할 목표·경로·출구는 알려주지 않는다.

### Risk B — Observation copy explains too much

- 감각과 변화만 표시한다.
- 인과 해설과 추천 조합을 금지한다.
- 2~4줄을 넘기지 않는다.

### Risk C — Faculty demonstration becomes the answer

- 교수는 외부 확산만 막는다.
- 내부 핵·압력·카시안·정령·묘목 문제는 남는다.
- 고급 안전 부품 때문에 전체 회로 복제가 불가능하다.

### Risk D — Heat becomes universal solution

- 열팽창·화상·묘목 손상·정령 적대 위험을 유지한다.
- 열린 출구 없는 가열은 사고를 반복한다.
- 구조·복구·교섭·봉쇄는 목표와 대가가 다르다.

### Risk E — Canon conflict is silently ignored

- `GM-SLICE-HEAT-FLOW-OBSERVATION-01`을 Draft로 기록한다.
- 승인 전 기존 `흐름 메인` 확정 문서를 덮어쓰지 않는다.
- 승인 시 관련 Route·Slice·Curriculum 정본을 같은 결정 ID로 보정한다.

---

## 12. Acceptance Checklist

```text
[ ] 상급생이 이번 사건에 등장하지 않는다.
[ ] 교수는 열+흐름을 실제 안전조치로 보여준다.
[ ] 교수는 사용 회로를 말로 설명하지 않는다.
[ ] 자동 글자 판독 오버레이가 없다.
[ ] 키워드 확인은 텍스트 노벨 조사로 진행된다.
[ ] 관찰 결과는 감각과 변화만 2~4줄로 표시된다.
[ ] 내부 핵심 문제는 플레이어에게 남는다.
[ ] 회로 복사·추천 조합·성공률이 없다.
[ ] 제품 Godot 구현을 시작하지 않는다.
```

---

## 13. Canonical Drafts

- Glyph observation draft: `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`
- Cast draft: `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- Dialogue manuscript: `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`

다음 Gate는 `열 메인 + 흐름 경로 문법`, 조사형 키워드 확인, 감각 중심 관찰 결과에 대한 사용자 검토다.
