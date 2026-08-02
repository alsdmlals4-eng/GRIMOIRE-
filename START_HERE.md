# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile / Landscape Fixed` |
| 후속 플랫폼 | `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| 기준 main | `50a00f9f4ec992338a93e3dc75726b5bc6075a8b` |
| 현재 Working Sync | `GR-SYNC-20260802-25` |
| Draft PR | `#51` |
| 현재 Decision | `GM-STOCK-SYSTEM-01 / GM-SUMMON-SYSTEM-01 / GM-STOCK-SUMMON-STATE-INTERFACE-01` |
| Grill Batch | `3/10 / pending 3` |
| 구현 진입 | `APPROVED_CONDITIONAL_FOUNDATION_POC` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`
5. `docs/planning/STOCK_SYSTEM.md`
6. `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
7. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
8. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
9. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`
10. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
11. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
12. `docs/planning/sync/GR-SYNC-20260802-25-WORKING.md`

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 조합해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

```text
상황·위험 판독
→ 직접 작성·준비 Stock·[소환 주문] 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

## Stock 최신 계약

PR #51 초기의 `확인 글자 Token Rack 4칸` 해석은 폐기됐다.

최신 Stock:

```text
완성 주문·하위 글자를 전투 전에 공용 용량 안에서 준비
→ 지정 대상 1종 자연 충전
→ 플레이어가 필요한 순간에 사용
```

Prototype 기본값:

```yaml
shared_capacity: 8
one_glyph_charge: 10초
additional_glyph_charge: +5초
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

충전시간:

```text
기능 글자 수 n
→ 10 + 5 × (n - 1)초
```

## 소환수 최신 계약

```text
메인 소환수 1체 = 상시 활성
기타 소환수 = [소환 주문] Commit 후 활성
Slice 추가 활성 상한 = 1체
지속시간·Cooldown = 없음
```

- 다른 소환수는 수동 귀환·교체·강제 귀환 전까지 유지한다.
- 소환 주문 비용은 고정 `마나 2`다.
- 일반 장면 전환·Save/Resume 뒤에도 소환 상태를 유지한다.
- 시간 압박이 없는 장면에서는 주기 행동만 정지한다.

### 정수 스탯

| 스탯 | 효과 |
|---|---|
| `[스톡] N` | 5초마다 현재 자연충전 남은 시간을 `N초` 감소 |
| `[방어도] N` | 활성 중 직접 피해에서 `N`을 차감 |
| `[공격] N` | 5초마다 유효 대상 불안정도를 `N` 감소 |
| `[치유] N` | 5초마다 플레이어 HP를 `N` 회복 |

```text
최종 직접 피해 = max(1, 원피해 - 총 방어도)
```

Slice 기본 소환수:

- 메인 동반 정령 `[스톡] 1`.
- 생산형 `[스톡] 2`.
- 수호형 `[방어도] 2`.
- 공격형 `[공격] 2`.
- 치유형 `[치유] 2`.

자동 공격은 불안정도를 `1` 아래로 낮추거나 마지막 해결 Event가 될 수 없다.

## State/Ledger/Save

책임 원본: `GM-STOCK-SUMMON-STATE-INTERFACE-01`.

핵심 원칙:

- 준비 Stock·충전 진행·소환 상태·전투 상태·Result Ledger의 소유자를 분리한다.
- `[소환 주문]`은 마나 차감·기존 보조 귀환·새 보조 활성화를 한 Transaction으로 처리한다.
- Stock 소비와 주문 효과 적용도 한 Transaction으로 처리한다.
- 소환수 행동은 고유 `summon_event_id`로 정확히 한 번만 적용한다.
- Background·Offline 경과로 공격·치유·충전 지원을 실행하지 않는다.

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정
→ 교내 일상 응용·대표 제작 미니게임
→ 학교축제 비전투 응용
→ 첫 현장실습 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기 평가·장기 Preview
```

- 별도 시험 Chapter 없음.
- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 권장: `촉매 배합·안정화 1개`.

## 남은 기획

### P1 — 구현 준비 전

- 정수 스탯·자연충전 State Interface의 TDD Plan 연결.
- Stock·소환수 Mobile HUD Wireframe.
- 전용 자동화·Save/Resume Test.
- Godot Toolchain preflight.
- Base v9.4.3 Implementation Plan 재검증.
- Execution Readiness P0=0·P1=0.

### P2 — Vertical Slice 제작 전

- Battle Tuning·Result Grading.
- 대표 제작 미니게임 확정.
- Grimoire·Main·Audio.
- 접근성·난이도.
- Year-One Chapter Map·글자 Catalog.
- 성장·평가·경제 수치.
- Slice 장면별 시간 예산.

## 구현 경계

계속 금지:

- 전체 Vertical Slice 제품 구현.
- 실제 글자 인식·ML.
- 최종 Art·Audio·Asset.
- Stock·소환수 Runtime의 무단 추가.
- 최종 밸런스·Store·사업화.

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
