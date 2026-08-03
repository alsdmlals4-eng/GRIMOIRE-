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
| Working Sync | `GR-SYNC-20260804-04-FROSTBLOOM-CAST-DIALOGUE-DRAFT` |
| 승인된 현재 Decision | `GM-SCHOOL-CRISIS-PEDAGOGY-01` |
| 검토 중 Draft | `GM-FROSTBLOOM-CAST-DIALOGUE-01` |
| 상위 사건 Decision | `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01` |
| Grill Batch | `3/10 / pending 3` |
| 현재 GPT 작업 | `서리꽃 온실 고유 인물·대사 원고 검토` |
| 대표 사건 | `서리꽃 온실의 심장` |
| 학교 위기 교육 원칙 | `USER_APPROVED` |
| 장면 흐름 | `WRITTEN_FOR_USER_REVIEW` |
| 캐릭터·대사 | `WRITTEN_FOR_USER_REVIEW / NOT_COUNTED` |
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
3. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
4. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`.
5. `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`.
6. `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`.
7. `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`.
8. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`.
9. `docs/planning/sync/GR-SYNC-20260804-04-FROSTBLOOM-CAST-DIALOGUE-DRAFT.md`.
10. 질문 주제의 최신 승인 책임 원본.
11. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

Codex 실행 시에만 다음을 추가로 읽는다.

- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

## 승인된 핵심 재미

> 상황을 읽고 자신이 중요하다고 판단한 해결 방향을 선택한 뒤, 의미를 가진 글자로 그 의도를 실제 주문으로 구현하고 결과와 대가를 책임지는 재미.

```text
사건·인물·환경 조사
→ 해결 의도와 우선순위 선택
→ 등장인물 관점과 예상 효과 확인
→ 주문 설계
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

## 학교 위기 교육 원칙

> 마법사는 위기에서 스스로 상황을 읽고 해결할 수 있어야 한다. 교수는 정답을 대신 실행하지 않고 방향성과 안전 기준만 제시한다. 직접 개입은 학생 또는 민간인의 생명이 즉시 위험한 수준에서만 허용한다.

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 판단 질문과 원리 방향 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 치명 위험만 직접 차단·구조
```

교수는 외곽 확산과 치명 위험을 통제하지만 사건의 핵심 목표를 대신 해결하지 않는다.

학생은 언제든 접근 변경·지원 요청·봉쇄 후 철수를 선택할 수 있다. 철수는 자동 실패가 아니라 위험 관리와 책임 판단으로 평가한다.

## 텍스트 노벨과 주문 설계의 경계

```text
텍스트 선택
= 무엇을 지키고 어떤 방식으로 해결할지 결정

대화 힌트
= 관찰 사실·인물의 편향·위험 방향

예상 효과
= 직접 변화·속도·범위·압력·위험·미해결 문제

주문 설계
= 그 의도를 실제로 어떻게 실행할지 결정
```

금지:

- 선택지가 주문 이름을 직접 제시
- 선택 직후 자동 성공
- 교수가 정확한 글자 조합을 지시
- 전투를 기본 또는 필수 해결법으로 사용
- 대표 사건에 단 하나의 진짜 결말 설정
- 생명 위험인데도 교육을 이유로 교수 방관

## 대표 사건 — 서리꽃 온실의 심장

마법학교 온실의 중심 마력 핵이 멈추고 배관이 얼어붙는다. 희귀 묘목이 위험에 빠지고 관리 학생이 고립되며 서리 정령이 불안정해진다. 정령은 원인처럼 보이지만 실제로는 냉기 누출의 피해자일 수 있다.

대표 접근:

1. 시설 복구
2. 생명 구조 우선
3. 정령 안정화·교섭
4. 현상 봉쇄
5. 전투·강제 제압

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
reasonable_unlisted_solution: MEANING_BASED_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

## 검토 중 캐릭터 초안

```yaml
cast:
  - 에일린 로스베르: 현장 대응·마력운용학 교수 / 책임과 안전
  - 마렌 브리어: 3학년 온실 관리 조교 / 시설과 축적된 생명
  - 카시안 렌: 동급 경쟁 학생 / 속도와 즉시 행동
  - 네아 솔렌: 고립된 2학년 온실 당번 / 내부 조작과 협력
  - 모트: 메인 동반 정령 / 정령 감정과 마력 리듬
status: WRITTEN_FOR_USER_REVIEW
```

누구도 정답 조합을 소유하지 않는다. 인물마다 유용한 정보와 위험한 편향을 함께 가진다. 네아는 밸브·격벽·이동으로 해결에 직접 참여하며, 모트의 감각 힌트는 환경 조사로 검증해야 한다.

## 대표 사건 장면 흐름

```text
현장실습 브리핑
→ 온실 외부 도착과 교수 안전선 선언
→ 최초 위기와 공통 관찰
→ 조사 4개 중 2개
→ 등장인물 관점 대화
→ 해결 접근 선택
→ 접근별 4개 힌트 패키지
→ 주문 초안·예상 효과
→ 첫 시전
→ 예상 밖 변수와 접근 수정
→ 최종 대응 또는 철수
→ 결과·교수 개입 여부
→ 마도서 기록
```

- 자유일정 C에서 현장 조사를 선택했다면 조사 3개까지 가능.
- 기본 관찰만으로도 안전 봉쇄·철수 접근이 가능하다.
- 대화·조사·예상 효과 확인 중 실시간 타이머는 흐르지 않는다.
- 첫 시전 뒤에도 접근을 바꿀 수 있다.
- L3 교수 개입은 `FACULTY_LIFESAVING_INTERVENTION`으로 기록하고 비징벌 복기를 진행한다.

## 기존 확정 계약 유지

- 마법 글자: `흐름` + 보조 `집중`, `분산`; 메인 1 + 보조 0~1.
- Stock: 용량 `8`, 지정 대상 1종 자연충전, `10 + 5 × (n-1)초`, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 같은 시각 `MAIN → S1 → S2 → S3`.
- 소환수는 전투뿐 아니라 조사·수호·견제·운반·안정화 보조에 사용하지만 주문 설계를 대신하지 않는다.
- State·Ledger·Save: Transaction 원자성, exactly-once, 손상 Snapshot 자동 덮어쓰기 금지.

## 현재 GPT 산출물 우선순위

1. 고유 인물 이름·성격·대사 원고 검토.
2. 검토 결과를 반영해 캐릭터·대사 확정.
3. 사건 UX Map과 Wireframe.
4. 온실·서리 정령·마력 핵 Art Direction과 Concept Art Brief.
5. Vertical Slice 전체 콘텐츠 조립.
6. 선택된 범위의 Codex 구현 명세.

## 현재 하지 않는 것

```text
GPT에서 project.godot 생성
GPT에서 GDScript 제품 구현
GPT에서 Godot Runtime을 실행했다고 주장
Codex 구현 작업을 핵심 기획보다 우선
실행하지 않은 실기기·성능·접근성·사람 검증을 PASS 처리
```

## 다음 순서

1. 캐릭터 이름과 역할 대비를 검토한다.
2. 실제 S0~S12 대사와 20개 힌트 패키지를 검토한다.
3. 승인된 수정사항을 반영해 확정 정본화한다.
4. 사건 UX Wireframe을 설계한다.
5. Art Direction과 첫 이미지 시안을 만든다.
6. 충분히 구체화된 범위만 Codex 구현 명세로 넘긴다.
