# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 승인 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 최신 책임 원본을 우선한다.

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
| 최신 Working Sync | `GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL` |
| 최신 승인 Decision | `GM-SLICE-HEAT-FLOW-OBSERVATION-01` |
| 상위 사건 Decision | `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01` |
| 학교 교육 Decision | `GM-SCHOOL-CRISIS-PEDAGOGY-01` |
| Grill Batch | `4/10 / pending approved 4` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

---

## 역할 분리

```text
GPT
= 핵심 재미·콘텐츠·대사·UX·이미지·아트 방향 설계
= 적대적 검토와 GitHub·Sheet 정본 동기화

Codex
= 승인된 설계를 Godot에서 구현
= project.godot·GDScript·Scene·테스트·CI·실기기 검증
```

현재는 창의 기획과 명세 단계이며 제품 구현을 시작하지 않는다.

---

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
4. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
5. `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
6. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
7. `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`
8. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL.md`

---

## 승인된 핵심 재미

> 상황을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자와 회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
사건·환경·인물 조사
→ 해결 의도와 우선순위 선택
→ 주문 설계·예상 효과 확인
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ 명시적 Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

전투는 여러 해결 방식 중 하나이며 필수가 아니다.

---

## Vertical Slice 글자 계약

`GM-SLICE-HEAT-FLOW-OBSERVATION-01`이 과거 `흐름 메인` 계약을 명시적으로 대체한다.

```yaml
main_glyph: 열
connection_grammar: 흐름
optional_support_glyphs: [집중, 분산]
representative_known_circuit: 열 + 흐름
safe_grammar: 메인 1 + 연결 문법 + 선택 보조 0~1
```

- `열`은 열을 발생시키거나 기존 열원을 중심 현상으로 지정한다.
- `흐름`은 열이 향할 대상·경로·순서·순환을 구성한다.
- `집중·분산`은 출력과 범위를 조절한다.

---

## 학교의 위기 교육 원칙

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 직전 명확한 안전 경고
L3: 치명 위험만 직접 차단·구조
```

교수는 핵심 목표를 대신 해결하지 않는다. 철수·봉쇄·지원 요청은 자동 실패가 아니다.

---

## 대표 사건 — 서리꽃 온실의 심장

1학년 실습에서 카시안이 닫힌 회수 밸브와 압력을 확인하지 않고 `열 + 흐름`을 성급하게 사용한다. 배관이 균열되고 냉기 마력이 누출되며 중심 핵이 정지한다. 카시안은 자동 격벽 안쪽에 고립되고 서리 정령은 과부하된다.

지속 등장 인물:

- 에일린 로스베르 교수
- 같은 1학년 카시안 렌
- 메인 동반 정령 모트

상급생은 이번 사건에 등장하지 않는다.

---

## 교수의 회로 — 한 가지 예시

교수는 학교 회랑으로 번지는 냉기만 외곽 `열 + 흐름` 회로로 막는다.

```text
호박색 빛이 외벽을 따라 이동
→ 따뜻한 기운이 퍼짐
→ 유리 서리가 녹음
→ 밖으로 나가던 냉기의 방향이 바뀜
→ 외부 확산만 차단
```

```yaml
role: ONE_VALID_EXAMPLE_NOT_CANONICAL_ANSWER
required_player_route: false
default_best_solution: false
used_as_grading_key: false
copy_action: false
```

교수의 방식은 정답·필수 루트·최적해가 아니다. 플레이어는 시설 복구·생존 확보·정령 안정화·봉쇄·제압 또는 준비된 패턴 밖의 합리적 방법을 선택할 수 있다.

---

## 조사형 키워드 확인과 관찰 결과

자동 글자 판독 오버레이를 사용하지 않는다.

```text
시작 문양 조사 → [확인한 키워드: 열]
이동 선 조사 → [확인한 키워드: 흐름]
모서리 문양 조사 → 미학습 고급 구조 / 해독 불가
```

관찰 결과는 감각과 실제 변화만 2~4줄로 표시한다.

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

---

## 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

20개 패턴과 교수의 예시는 내부 판정·QA 기준이다. 교수 방식과 일치하지 않아도 글자 의미·상황 조건·대가가 설명되면 유효하다.

---

## 기존 시스템 계약

- Stock: 공유 용량 `8`, 지정 대상 1종 충전, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 같은 시각 `MAIN → S1 → S2 → S3`.
- 소환수는 조사·수호·견제·운반을 보조하지만 주문 설계를 대신하지 않는다.
- State·Ledger·Save는 Transaction 원자성, exactly-once, 손상 Snapshot 보호를 유지한다.
- Mobile Summon HUD는 왼쪽 Safe Area 세로 레일과 단일 Context Drawer를 사용한다.

---

## 현재 우선순위

1. `서리꽃 온실의 심장` 전체 UX Map.
2. Mobile Landscape 텍스트 노벨·조사·주문 설계 Wireframe.
3. 온실·열 회로·서리 정령 Art Direction.
4. 장면별 배경·표정·VFX Asset Brief.
5. 선택된 범위만 Codex 구현 명세로 전환.

## 현재 하지 않는 것

```text
제품 project.godot 생성
GDScript·Scene 구현
검증하지 않은 Runtime·실기기·성능 PASS 주장
PR 병합
```
