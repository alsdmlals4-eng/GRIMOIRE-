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
| Working Sync | `GR-SYNC-20260803-07` |
| 현재 Decision | `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01` |
| Grill Batch | `2/10 / pending 2` |
| 현재 GPT 작업 | `복수 해결 사건·텍스트 노벨·주문 설계·UX·Art` |
| 대표 사건 | `서리꽃 온실의 심장` |
| 작성 명세 | `WRITTEN_READY_FOR_USER_REVIEW` |
| 로컬 Godot | `USER_CONFIRMED_INSTALLED` |
| Codex 기술 계획 | `READY_FOR_LATER_SESSION` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| 제품 코드 | `NOT_STARTED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 작업 역할 분리

```text
GPT
= 무엇을 만들지, 왜 재미있는지, 어떤 콘텐츠와 화면으로 보여줄지 설계
= 핵심 재미·콘텐츠·UX·이미지·아트 기획과 적대적 검토

Codex
= 승인된 설계를 Godot에서 실제로 구현
= project.godot·GDScript·Scene·테스트·CI·실기기 검증
```

사용자 PC에는 Godot이 설치되어 있다고 확인됐다. 실제 경로·버전·Runtime은 이후 Codex가 확인하며 GPT의 창의 기획을 막지 않는다.

## 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_APPROVAL_2026-08-04.md`.
4. `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`.
5. `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`.
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
7. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
8. 질문 주제의 최신 승인 책임 원본.
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

Codex 실행 시에만 다음을 추가로 읽는다.

- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

## 승인된 핵심 재미

> 상황을 읽고 자신이 중요하다고 판단한 해결 방향을 선택한 뒤, 의미를 가진 글자로 그 의도를 실제 주문으로 구현하고 결과와 대가를 책임지는 재미.

```text
사건·인물·환경 조사
→ 해결 의도와 우선순위 선택
→ 주문 설계
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

## 텍스트 노벨과 주문 설계의 경계

```text
텍스트 선택
= 무엇을 지키고 어떤 방식으로 해결할지 결정

주문 설계
= 그 의도를 실제로 어떻게 실행할지 결정
```

금지:

- 선택지가 주문 이름을 직접 제시
- 선택 직후 자동 성공
- 전투를 기본 또는 필수 해결법으로 사용
- 대표 사건에 단 하나의 진짜 결말 설정

## 대표 사건 — 서리꽃 온실의 심장

마법학교 온실의 중심 마력 핵이 멈추고 배관이 얼어붙는다. 희귀 묘목이 위험에 빠지고 관리 학생이 고립되며 서리 정령이 불안정해진다. 정령은 원인처럼 보이지만 실제로는 냉기 누출의 피해자일 수 있다.

대표 접근:

1. 시설 복구
2. 생명 구조 우선
3. 정령 안정화·교섭
4. 현상 봉쇄
5. 전투·강제 제압

```yaml
minimum_approaches: 3
recommended_approaches: 5
minimum_noncombat_approaches: 2
recommended_noncombat_approaches: 4
minimum_valid_spell_plans_per_approach: 2
minimum_valid_endings: 3
combat_is_mandatory: false
single_true_ending: false
```

## 텍스트 노벨 UX 흐름

```text
상황 서술
→ 핵심 인물 반응
→ 조사 가능한 요소
→ 해결 접근 선택
→ 접근별 조건·위험 요약
→ 주문 설계 화면
→ 결과 연출
→ 추가 변수·후속 선택
→ 마도서 기록
```

- 한 화면의 접근 선택지는 3~5개다.
- 선택지는 주문이 아니라 행동 목적을 표현한다.
- 예상 결과의 경향과 위험만 보여준다.
- 후속 정보에 따라 접근을 수정할 수 있다.

## 기존 확정 계약 유지

- 마법 글자: 메인 1개 + 보조 0개 이상.
- Stock: 용량 `8`, 지정 대상 1종 자연충전, `10 + 5 × (n-1)초`, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 같은 시각 `MAIN → S1 → S2 → S3`.
- 소환수는 전투뿐 아니라 조사·수호·견제·운반·안정화 보조에 사용하지만 주문 설계를 대신하지 않는다.
- State·Ledger·Save: Transaction 원자성, exactly-once, 손상 Snapshot 자동 덮어쓰기 금지.

## 현재 GPT 산출물 우선순위

1. 작성된 복수 해결 상황 명세 사용자 검토.
2. `서리꽃 온실의 심장` 전체 장면 흐름.
3. 조사 정보·선택지·인물 대사.
4. 접근별 주문 계획·결과 태그.
5. 사건 UX Map과 Wireframe.
6. 온실·서리 정령·마력 핵 Art Direction과 Concept Art Brief.
7. Vertical Slice 전체 콘텐츠 조립.
8. 선택된 범위의 Codex 구현 명세.

## 현재 하지 않는 것

```text
GPT에서 project.godot 생성
GPT에서 GDScript 제품 구현
GPT에서 Godot Runtime을 실행했다고 주장
Codex 구현 작업을 핵심 기획보다 우선
실행하지 않은 실기기·성능·접근성·사람 검증을 PASS 처리
```

## 다음 순서

1. 사용자가 작성된 명세를 검토한다.
2. 승인 후 대표 사건의 전체 텍스트 노벨 장면을 작성한다.
3. 사건 UX Wireframe을 설계한다.
4. Art Direction과 첫 이미지 시안을 만든다.
5. 충분히 구체화된 범위만 Codex 구현 명세로 넘긴다.
