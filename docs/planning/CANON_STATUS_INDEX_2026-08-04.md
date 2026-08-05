# GRIMOIRE 정본 상태 색인 — 2026-08-04 / 2026-08-06 Main Addendum

> 파일명에 `DRAFT`, `WORKING`, 과거 날짜 또는 `CURRENT`가 남아 있어도 이 문서가 현재 참조 가능 여부를 판정한다.

## 표기

| 표기 | 의미 |
|---|---|
| `[활성]` | 현재 정본 |
| `[활성 연결 콘텐츠]` | 과거/DRAFT 이름이지만 승인 래퍼가 승격 |
| `[부분 대체됨]` | 명시 범위만 유효 |
| `[대체됨]` | 현재 참조 금지, Git 이력만 보존 |
| `[보류]` | 현재 실행 지시 아님 |
| `[구현완료 보관]` | 완료 이력, 재실행 지시 아님 |
| `[폐기]` | 현재 설계에서 사용하지 않음 |
| `[이력]` | 당시 상태 증거, 현재 권위 아님 |

## 현재 Main

```yaml
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
current_main_sync: GR-SYNC-20260806-01
merged_pull_request: 68
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
previous_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
canon_status: SYNCED_TO_MAIN
sheet_readback: PASS
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 복원 순서

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → 이 색인 → CURRENT_CONFIRMED_DECISIONS → 별형 회로 승인·Spec → 회로·마나·숙련 책임 원본 → Frostbloom 승인 → GR-SYNC-20260806-01-MAIN`.

## 활성

### 주문·자원

- `STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`.
- `2026-08-06-star-glyph-circuit-mastery-balance-design.md`.
- `MAGIC_LETTER_CIRCUIT_SYSTEM.md` — `FIVE_POINT_STAR` 최신 문법.
- `MANA_SYSTEM.md` — 보조 1개당 +10% 복잡도, 정밀·절감 기준.
- `SUPPORT_LETTER_MASTERY_SYSTEM.md` — 메인·보조 글자별 0~100 숙련도.
- `STOCK_SYSTEM.md`, `STOCK_CAPACITY_SYSTEM.md`, 충전·전환·피격 책임 원본 — 새 회로와 충돌하지 않는 범위.

### Frostbloom

- Heat·Flow 승인.
- 복수 해결 Spec·Route Guidance·내부 패턴.
- 학교 위기 교육 승인.
- 대사 승인.
- 실제 대사 Script와 Cast Design `[활성 연결 콘텐츠]`.

### 운영

- `GRILL_ME_BATCH_MERGE_STATE.json`.
- `PROJECT_CANON_SYNC_POLICY.md`.
- Google Sheet workbook.
- `GR-SYNC-20260806-01-MAIN.md` — `[활성 Main Sync / Readback PASS]`.

## 부분 대체됨

### GM-3X3-CIRCUIT-STOCK-FOCUS-01

상태 토큰:

```text
SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01
```

`THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`와 `2026-08-04-3x3-circuit-stock-focus-scribing-design.md`는 역사 증거로 보존한다.

유지 범위:

- Typed glyph Stock 방향.
- 명시적 Commit.
- 자동 대상·자동 Commit 금지.
- 모든 주문 Commit 마나 소모.
- 입력 방식에 따른 숨은 위력 차별 금지.

대체 범위:

- 3×3 셀 위상.
- 회로 내부 대상 노드.
- 인접 연결·교차·건너뛰기·대상 끝점 규칙.
- 일반 보조 2개 상한.
- 숫자 성공률 Preview 금지.

### 기타 부분 대체

- `STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`: 자연충전·공유 용량·소환수 단축·Offline 금지만 유지.
- Narrative multi-solution design: 복수 해결 코어만 유지.
- `SPELL_GAME_DESIGN.md`: 마법학교·학습·응용·복기 코어 입력만 유지.
- `GRIMOIRE_PLANNING_CANON_2026-07-31.md`: 최신 Decision이 변경한 항목 사용 금지.
- `PROJECT_BASE_ADAPTER.json`: Base pin·routing·protected paths·generated outputs만 활성, 상태 Snapshot 비권위.

## 대체됨

- Legacy `CIRCUIT_SYSTEM.md`.
- Heat·Flow Draft.
- Frostbloom Cast Planning Draft.
- 과거 Flow-main Scene Spec.
- 과거 FAIL_CLOSED Review.

## 보류

- 별형 회로 Mobile Landscape Wireframe.
- 부분 성공·실패·역류 세부 확률 분포.
- 제품 Codex Handoff·Overlay.
- 배포물 SHA-256 고정 검증.

## 구현완료 보관

Godot toolchain setup plan·approval·report·script·tests. 제품 Godot 프로젝트 완료를 뜻하지 않는다.

## 폐기

`AUTO_SPELL_SYSTEM.md`, Stage 0 Spec·Gate 명칭, 완성 주문 원터치 Stock, Stock 주문 무마나 실행, `흐름` Slice 메인 계약, 교수 회로 정답표·자동 복사, 집중 필사 완전 Pause, 그림 정확도 위력·마나·추가 Stock 보너스, 활성 3×3 회로 문법, 회로 내부 대상 노드, 숫자 성공률 Preview 금지.

## Sync

- Draft·Working·Premerge Sync `03-07`부터 `09B`: `[이력]`.
- `GR-SYNC-20260804-10-MAIN`: `[이력/Finalization]`.
- `GR-SYNC-20260804-11-MAIN-READBACK`: `[이력/Readback]`.
- `GR-SYNC-20260804-12-CLOSURE`: `[이력/이전 Main 완료 Sync]`.
- `GR-SYNC-20260806-01-WORKING`: `[이력/Working Branch Readback]`.
- `GR-SYNC-20260806-01-MAIN`: `[활성/Main Readback PASS]`.

## 미실행

별형 회로 Mobile Wireframe, 제품 Runtime, 모바일 실기기, 성능, 접근성, 사람 검증. 승인 수치는 `USER_APPROVED_PROTOTYPE_BASELINE / PLAYTEST_TUNING_REQUIRED`다.
