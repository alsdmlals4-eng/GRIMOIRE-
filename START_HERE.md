# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 최신 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| Main 기준 | `9632b203 / GR-SYNC-20260803-06` |
| Working Branch | `agent/foundation-poc-readiness-review` |
| Draft PR | `#57` |
| 최신 Working Sync | `GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT` |
| 승인된 현재 Decision | `GM-SCHOOL-CRISIS-PEDAGOGY-01` |
| 승인된 사건 Decision | `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01` |
| 검토 중 Draft | `GM-SLICE-HEAT-FLOW-OBSERVATION-01` |
| 캐릭터·대사 Draft | `GM-FROSTBLOOM-CAST-DIALOGUE-01` |
| Grill Batch | `3/10 / pending approved 3` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

Draft 수정은 아직 새 승인 Decision으로 계산하지 않는다.

---

## 역할 분리

```text
GPT
= 핵심 재미·콘텐츠·대사·UX·이미지·아트 방향 설계
= 적대적 검토와 정본 동기화

Codex
= 승인된 설계를 Godot에서 구현
= project.godot·GDScript·Scene·테스트·CI·실기기 검증
```

현재 작업은 창의 기획과 명세 단계이며 제품 구현을 시작하지 않는다.

---

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`
4. `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
5. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
6. `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`
7. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
8. `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`
9. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
10. `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
11. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
12. `docs/planning/sync/GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT.md`

Codex 실행 시에만 기술 계획과 구현 명세를 추가로 읽는다.

---

## 승인된 핵심 재미

> 상황을 읽고 자신이 중요하다고 판단한 해결 방향을 선택한 뒤, 의미를 가진 글자와 회로로 의도를 실제 주문으로 구현하고 결과와 대가를 책임지는 재미.

```text
사건·인물·환경 조사
→ 해결 의도와 우선순위 선택
→ 관찰·대화·예상 효과 확인
→ 주문 설계
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

전투는 여러 해결 방식 중 하나이며 필수가 아니다.

---

## 승인된 학교 위기 교육 원칙

> 마법사는 위기에서 스스로 상황을 읽고 해결할 수 있어야 한다. 교수는 핵심 목표를 대신 해결하지 않고 방향성과 안전 기준만 제공한다. 직접 개입은 학생이나 민간인의 생명이 즉시 위험할 때만 허용한다.

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 직전 명확한 안전 경고
L3: 치명 위험만 직접 차단·구조
```

철수·봉쇄·지원 요청은 자동 실패가 아니다.

---

## 대표 사건 — 서리꽃 온실의 심장

1학년 온실 실습에서 동급생 카시안이 회수 밸브와 압력을 확인하지 않고 배운 회로를 성급하게 사용한다. 배관이 균열되고 냉기 마력이 누출되며 중심 핵이 정지한다. 카시안은 자동 격벽 안쪽에 고립되고 서리 정령들은 냉기를 지나치게 흡수한다.

지속 등장 인물:

- 에일린 로스베르 교수
- 같은 1학년 카시안 렌
- 메인 동반 정령 모트

이번 사건에는 상급생이 등장하지 않는다. 시설 정보는 도면·표식·압력계·주문 잔향으로 전달한다.

대표 접근:

1. 시설 복구
2. 생존 우선
3. 정령 안정화·원인 처리
4. 현상 봉쇄
5. 제압·시간 확보

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
reasonable_unlisted_solution: MEANING_BASED_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

---

## 검토 중인 열·흐름 문법 Draft

기존 승인 문서는 Slice 대표 메인을 `흐름`으로 기록한다. 사용자 수정 방향은 다음이다.

```yaml
status: DRAFT_REQUIRES_EXPLICIT_SUPERSESSION
main_glyph: 열
connection_grammar: 흐름
optional_supports: [집중, 분산]
known_representative_circuit: 열 + 흐름
```

- `열`은 현상을 만드는 메인 글자다.
- `흐름`은 열을 대상·경로·순서에 따라 이동시키는 연결 문법이다.
- `집중·분산`은 열 전달의 강도와 범위를 조절한다.
- 승인 전에는 기존 `흐름 메인` 정본을 폐기하지 않는다.

---

## 교수의 비언어적 회로 힌트 Draft

교수는 해결법을 말로 설명하지 않는다. 사고 뒤 학교 회랑으로 번지는 냉기만 외곽 회로로 막는다.

```text
호박색 빛이 외벽을 따라 이동
→ 따뜻한 기운이 퍼짐
→ 지나간 유리의 서리가 녹음
→ 밖으로 나가려던 냉기의 방향이 바뀜
→ 외부 확산만 차단
→ 내부 압력·핵·카시안·정령 문제는 유지
```

플레이어에게는 자동 글자 판독 결과를 띄우지 않는다.

### 키워드 확인

```text
텍스트 노벨 조사
→ 빛이 시작된 문양 조사
→ 이미 배운 `열` 확인

텍스트 노벨 조사
→ 빛이 이동한 선 추적
→ 이미 배운 `흐름` 확인
```

모서리의 고급 문양은 해독할 수 없다.

### 관찰 결과

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

관찰 결과는 감각과 실제 변화만 보여주며 원리·해결법·추천 조합을 설명하지 않는다.

교수의 허용 대사:

- `외부 확산은 막았다.`
- `내부 문제는 그대로다.`
- L2·L3 안전 경고

금지:

- `열과 흐름을 사용해라.`
- 자동 `[인식: 열]`, `[인식: 흐름]` 오버레이
- 교수 회로 복사 버튼
- 추천 주문·성공률·최종 결말 표시
- 미학습 고급 글자 자동 습득

---

## 카시안의 사고와 교수 시연의 대비

```text
카시안
= 닫힌 출구·미확인 압력에 열을 흘림
= 회로 입력은 맞았지만 상황 설계 실패

교수
= 열린 외곽 고리와 고급 안전 부품으로 열을 순환
= 외부 확산만 차단

플레이어
= 조사로 익숙한 키워드를 확인하고 관찰한 변화에서 응용 방향을 추론
```

카시안은 사고를 숨기지 않고 내부 밸브·격벽·압력 정보를 제공하며 해결에 협력한다.

---

## 장면 흐름

```text
1학년 실습 브리핑
→ 카시안의 열·흐름 오용과 사고
→ 교수의 외곽 안전 회로
→ 감각 중심 관찰 결과
→ 선택형 회로 조사로 열·흐름 확인
→ 환경 조사 4개 중 2개
→ 교수·카시안·모트 관점 확인
→ 해결 접근 선택
→ 주문 초안·예상 효과
→ 첫 시전
→ 두 번째 균열과 재설계
→ 최종 대응 또는 철수
→ 결과·교수 개입 여부
→ 마도서 기록
```

대화·조사·예상 효과를 읽는 동안 실시간 타이머는 흐르지 않는다.

---

## 기존 시스템 계약

- Stock: 공유 용량 `8`, 지정 대상 1종 충전, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 같은 시각 `MAIN → S1 → S2 → S3`.
- 소환수는 조사·수호·견제·운반을 보조하지만 주문 설계를 대신하지 않는다.
- State·Ledger·Save는 Transaction 원자성, exactly-once, 손상 Snapshot 보호를 유지한다.
- Mobile Summon HUD는 왼쪽 Safe Area 세로 레일과 단일 Context Drawer를 사용한다.

---

## 현재 우선순위

1. 조사형 `열·흐름` 키워드 확인과 감각 중심 관찰 문구 검토
2. `열 메인 + 흐름 경로` Draft 검토
3. 승인 시 20개 Route Pattern을 새 문법으로 정본 보정
4. 사건 UX Map·Wireframe
5. 온실·정령·회로 Art Direction
6. 선택된 범위만 Codex 구현 명세로 전환

## 현재 하지 않는 것

```text
제품 project.godot 생성
GDScript·Scene 구현
Runtime·실기기·성능 검증을 실행했다고 주장
Draft 문법을 승인 없이 확정 정본으로 덮어쓰기
PR 병합
```
