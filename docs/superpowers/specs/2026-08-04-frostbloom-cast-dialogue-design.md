# Frostbloom Cast, Dialogue, and Faculty Demonstration Design

## 1. Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
related_draft_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
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

---

## 2. Goal

교수가 말로 해결법을 가르치지 않으면서도, 플레이어가 이미 배운 `열 + 흐름` 회로의 실제 효과를 보고 사건 해결 방향을 추론하게 한다.

```text
알고 있는 회로 판독
→ 실제 효과가 순서대로 발생
→ 해결된 상태와 남은 상태 비교
→ 플레이어가 우선순위·경로·대가 선택
→ 자신의 회로 작성
```

---

## 3. Minimal Cast

| 인물 | 역할 | 정보 책임 | 금지 |
|---|---|---|---|
| 에일린 교수 | 안전선·비언어적 고급 시연 | 외부 확산 차단, 생체·위험 감시 | 내부 목표 해결, 정답 조합 설명 |
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

판정:

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

같은 원리라도 경로·출구·목표가 다르면 결과가 달라진다는 것을 보여준다.

---

## 6. Nonverbal Teaching Sequence

### Beat 1 — Threat

냉기 안개가 유리 틈을 지나 학교 회랑으로 퍼진다.

### Beat 2 — Circuit recognition

교수 회로가 펼쳐질 때 플레이어가 아는 부분만 짧게 강조된다.

```text
[인식: 열]
[인식: 흐름 경로]
[미해독: 고정·자동 보정]
```

### Beat 3 — Causal movement

- 호박색 열 광점이 회로를 따라 이동한다.
- 열이 도착한 유리부터 서리가 녹는다.
- 효과가 회로 전체에 동시에 생기지 않고 이동 순서대로 나타난다.
- 냉기 안개가 따뜻한 경계에 닿아 안쪽으로 휘어진다.

### Beat 4 — State comparison

```yaml
external_spread: RISING -> CONTAINED
internal_pressure: CRITICAL -> CRITICAL
greenhouse_core: STOPPED -> STOPPED
cassian_status: TRAPPED -> TRAPPED
spirit_overload: RISING -> RISING
```

### Beat 5 — Minimal faculty line

허용:

- `외부 확산은 막았다.`
- `내부 문제는 그대로다.`

교수는 회로 이름·사용법·추천 목표를 말하지 않는다.

---

## 7. Observation UX

회로를 다시 살피는 선택은 시간과 행동 횟수를 소모하지 않는다.

### Observation card

```text
관찰한 사실
- 열은 시작점에서 발생했다.
- 발생한 열은 흐름 경로를 따라 이동했다.
- 열이 지나간 유리부터 서리가 녹았다.
- 외부로 나가던 냉기 진행 방향이 바뀌었다.

남은 문제
- 내부 압력
- 카시안 고립
- 정령 과부하
- 묘목 동결

알 수 없는 부분
- 고급 고정 글자
- 자동 온도·압력 보정
```

금지:

- 교수 회로 복사
- 추천 주문 버튼
- 성공 확률
- 최종 결말 예고
- 미학습 고급 글자 자동 습득

---

## 8. Environmental Hint Redistribution

인물을 줄인 뒤 시설 정보는 다음처럼 전달한다.

| 정보 | 기본 경로 | 보조 경로 |
|---|---|---|
| 닫힌 회수 밸브 | 상태 문양·도면 | 카시안 고백 |
| 주 배관 과압 | 압력계 | 교수 L2 경고 |
| 기존 열원 | 환기·관개 표식 | 예상 효과 카드 |
| 열 이동 가능 | 교수 회로 연출 | 관찰 카드 |
| 정령 과부하 | 정령 밝기·행동 | 모트 감각 |
| 카시안 생명 상태 | 교수 모니터 | 카시안 통신 |
| 철수 가능 | 브리핑 | 비상 규정판 |

필수 정보는 관계 선택 하나에 독점시키지 않는다.

---

## 9. Dialogue Budget

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
- 열과 냉기의 이동 감각
- 기계 구조를 모르는 한계

정보 설명을 대사로 반복하지 않고 연출과 상태 UI로 옮긴다.

---

## 10. Adversarial Review

### Risk A — Faculty demonstration becomes the answer

- 교수는 외부 확산만 막는다.
- 플레이어는 내부에서 무엇을 먼저 다룰지 정해야 한다.
- 고급 안전 부품 때문에 전체 회로 복제가 불가능하다.
- 알려진 원리를 어떤 대상·경로에 적용할지는 플레이어가 결정한다.

### Risk B — System UI explains too much

- 관찰 카드는 발생한 사실만 기록한다.
- 추천 조합과 최적 경로를 표시하지 않는다.
- `열이 이동했다`는 보여주되 `배관에 열+흐름을 써라`는 지시는 금지한다.

### Risk C — Heat becomes universal solution

- 열팽창·화상·묘목 손상·정령 적대 위험을 유지한다.
- 열린 출구 없는 가열은 사고를 반복한다.
- 구조·복구·교섭·봉쇄는 목표와 대가가 다르다.

### Risk D — Cassian exists only to cause trouble

- 즉시 사고를 인정한다.
- 내부 정보와 수동 조작으로 여러 해법에 기여한다.
- 결과 기록과 재발 방지 학습을 남긴다.

### Risk E — Canon conflict is silently ignored

- `GM-SLICE-HEAT-FLOW-OBSERVATION-01`을 Draft로 기록한다.
- 승인 전 기존 `흐름 메인` 확정 문서를 덮어쓰지 않는다.
- 승인 시 관련 Route·Slice·Curriculum 정본을 같은 결정 ID로 보정한다.

---

## 11. Acceptance Checklist

```text
[ ] 상급생이 이번 사건에 등장하지 않는다.
[ ] 교수는 열+흐름을 실제 안전조치로 보여준다.
[ ] 교수는 사용 회로를 말로 설명하지 않는다.
[ ] 플레이어는 알려진 글자만 판독한다.
[ ] 효과가 이동 순서대로 보인다.
[ ] 상태 UI가 외부만 해결됐음을 보여준다.
[ ] 내부 핵심 문제는 플레이어에게 남는다.
[ ] 카시안의 실패와 교수의 성공이 같은 회로의 상황 차이로 설명된다.
[ ] 회로 복사·추천 조합·성공률이 없다.
[ ] 제품 Godot 구현을 시작하지 않는다.
```

---

## 12. Canonical Drafts

- Glyph observation draft: `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`
- Cast draft: `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- Dialogue manuscript: `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`

다음 Gate는 `열 메인 + 흐름 경로 문법`과 교수의 비언어적 시연에 대한 사용자 검토다.
