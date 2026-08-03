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
| Grill Batch | `1/10 / pending 1` |
| 로컬 Godot | `USER_CONFIRMED_INSTALLED` |
| 기술 구현 계획 | `READY_FOR_LATER_CODEX_SESSION` |
| 현재 GPT 작업 | `CORE_FUN / CONTENT / UX / IMAGE / ART` |
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

Godot 설치 여부와 구현 계획은 더 이상 GPT 대화의 중심 작업이 아니다. 사용자 PC에는 Godot이 설치되어 있다고 확인됐으며, 실제 경로·버전·Runtime은 이후 Codex가 확인한다.

## GPT에서 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`.
4. 핵심 재미·콘텐츠 주제의 최신 승인 책임 원본.
5. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
6. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

Codex 실행 시에만 다음을 추가로 읽는다.

- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

## 현재 GPT 우선순위

### 1. 핵심 재미 재검증

```text
상황 판독
→ 직접 작성·Stock·소환수 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 예상과 실제 결과 비교
→ 마도서 복기·발견
```

이 루프에서 반복 플레이를 만드는 가장 뾰족한 재미가 무엇인지 확정한다.

### 2. Vertical Slice 대표 콘텐츠

- 첫 수업과 글자 학습.
- 첫 제작 또는 실습.
- 대표 현장 사건.
- 작성·Stock·소환수를 모두 선택지로 쓰는 전투/상황.
- 실패·대가·마도서 복기를 경험하는 한 사이클.

### 3. 전체 UX 구조

- Main Screen.
- Grimoire Screen.
- 수업·제작·현장·전투 진입 흐름.
- 작성 Canvas와 후보·Commit·결과 화면.
- Stock·소환수·전투 HUD의 관계.

### 4. 이미지·아트

- 전체 Art Direction.
- 마법학교·마도서·글자·주문·소환수·전투 공간의 시각 규칙.
- 캐릭터·환경·UI·아이콘·이펙트 Style Guide.
- Concept Art·Moodboard·Key Art·UI Mockup.
- Godot 제작으로 넘길 Asset Breakdown.

### 5. 콘텐츠 확장

- 1학년 Chapter Map.
- 글자 Catalog와 학습 순서.
- 사건·적·환경 퍼즐.
- 성장·평가·경제.
- 전투 수치·난이도·Slice 시간 예산.

## 기존 확정 계약 유지

- Stock: 용량 `8`, 지정 대상 1종 자연충전, `10 + 5 × (n-1)초`, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 보조 역할 중복 금지, 같은 시각 `MAIN → S1 → S2 → S3`.
- State·Ledger·Save: Transaction 원자성, exactly-once, 손상 Snapshot 자동 덮어쓰기 금지.
- Mobile Summon HUD: 좌측 Rail, Contextual Drawer, 안전 Draft 뒤 관리 Pause, Writing Canvas active-stroke 소유.

## GPT 작업 산출물

```text
핵심 재미 정의·검증
Vertical Slice 콘텐츠 조립안
Chapter·글자·사건·적·소환수 기획
화면 정보구조·Wireframe
Art Bible·Style Guide
Concept Art·Moodboard·UI Mockup
이미지 생성 Prompt·Asset Brief
Codex 구현용 명세·Acceptance Criteria
```

## 현재 하지 않는 것

```text
GPT에서 project.godot 생성
GPT에서 GDScript 제품 구현
GPT에서 Godot Runtime을 실행했다고 주장
Codex 구현 작업을 핵심 기획보다 우선
실행하지 않은 실기기·성능·접근성·사람 검증을 PASS 처리
```

## 다음 순서

1. 핵심 재미를 플레이 단위로 재검증한다.
2. Vertical Slice 대표 콘텐츠를 선정한다.
3. 전체 UX 지도를 정리한다.
4. Art Direction과 첫 이미지 시안을 만든다.
5. 그 결과를 Codex 구현 명세에 반영한다.
6. 실제 구현은 이후 Codex 세션에서 진행한다.