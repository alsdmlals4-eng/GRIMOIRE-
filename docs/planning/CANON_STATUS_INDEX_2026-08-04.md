# GRIMOIRE 정본 상태 색인 — 2026-08-04

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

## 현재 main

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
closure_pull_request: 60
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
canon_status: MERGED_AND_FINALIZED_SHEET_READBACK_PASS
```

## 복원 순서

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → 이 색인 → CURRENT_CONFIRMED_DECISIONS → Registry → 3×3 승인·Spec → Frostbloom 승인 → Batch → Sync 12`.

## 활성

### 주문·자원

- 3×3 승인·상세 Spec.
- `MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- `STOCK_SYSTEM.md`, `STOCK_CAPACITY_SYSTEM.md`, 충전·전환·피격 책임 원본.
- `MANA_SYSTEM.md` — 방향 활성, 수치 보류.

### Frostbloom

- Heat·Flow 승인.
- 복수 해결 Spec·Route Guidance·내부 패턴.
- 학교 위기 교육 승인.
- 대사 승인.
- 실제 대사 Script와 Cast Design `[활성 연결 콘텐츠]`.

### 운영

- `GRILL_ME_BATCH_MERGE_STATE.json`.
- `GR-SYNC-20260804-12-CLOSURE.md`.
- premerge adversarial review.
- Google Sheet workbook·sync policy.

## 부분 대체됨

- `STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`: 자연충전·공유 용량·소환수 단축·Offline 금지만 유지.
- Narrative multi-solution design: 복수 해결 코어만 유지.
- `SPELL_GAME_DESIGN.md`: 마법학교·학습·응용·복기 코어 입력만 유지.
- `GRIMOIRE_PLANNING_CANON_2026-07-31.md`: 최신 Decision이 변경한 항목 사용 금지.
- `PROJECT_BASE_ADAPTER.json`: Base pin·routing·protected paths·generated outputs만 활성, 상태 Snapshot 비권위.

## 대체됨

Heat·Flow Draft, Frostbloom Cast Planning Draft, 과거 Flow-main Scene Spec, 과거 FAIL_CLOSED Review, Legacy `CIRCUIT_SYSTEM.md`.

## 보류

상태이상–typed glyph Stock 재설계, Codex 제품 Handoff·Overlay, 마나 비용 수치, 배포물 SHA-256 고정 검증.

## 구현완료 보관

Godot toolchain setup plan·approval·report·script·tests. 제품 Godot 프로젝트 완료를 뜻하지 않는다.

## 폐기

`AUTO_SPELL_SYSTEM.md`, Stage 0 Spec·Gate 명칭, 완성 주문 원터치 Stock, Stock 주문 무마나 실행, `흐름` Slice 메인 계약, 교수 회로 정답표·자동 복사, 집중 필사 완전 Pause, 그림 정확도 위력·마나·추가 Stock 보너스.

## Sync

- Draft·Working·Premerge Sync `03-07`부터 `09B`: `[이력]`.
- `GR-SYNC-20260804-10-MAIN`: `[이력/Finalization]`.
- `GR-SYNC-20260804-11-MAIN-READBACK`: `[이력/Readback]`.
- `GR-SYNC-20260804-12-CLOSURE`: `[활성 완료 Sync]`.

## 미실행

3×3 Mobile Wireframe, 제품 Runtime, 모바일 실기기, 성능, 접근성, 사람 검증. Prototype 수치는 `TEST_VALUE`다.
