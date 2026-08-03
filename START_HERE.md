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
| main 권위 | `CURRENT_DEFAULT_BRANCH_HEAD` |
| 현재 Main Sync | `GR-SYNC-20260803-04` |
| 최근 병합 PR | `#51 / merge 81852a76` |
| 최근 승인 Decision | `GM-STOCK-SYSTEM-01 / GM-SUMMON-SYSTEM-01 / GM-STOCK-SUMMON-STATE-INTERFACE-01 / GM-GRILL-WORK-QUALITY-GATE-01 / GM-MOBILE-SUMMON-HUD-WIREFRAME-01 / GM-INGAME-ART-CHECKPOINT-01` |
| Grill Batch | `0/10 / pending 0` |
| 최근 체크포인트 | `MERGED_AT_6_OF_10 / DIFF_SIZE_AND_CANON_DRIFT / COUNTER_RESET` |
| 다음 Approval Bundle | `GM-MOBILE-SUMMON-HUD-WIREFRAME-01 사용자 명세 검토` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED_AFTER_SPEC_REVIEW_AND_WRITING_PLANS` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`
5. `docs/planning/GRILL_WORK_BENCHMARK_TEXT_INTEGRITY_01_APPROVAL_2026-08-03.md`
6. `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
7. `docs/planning/STOCK_SYSTEM.md`
8. `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`
9. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
10. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
11. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`
12. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`
13. `docs/planning/INGAME_ART_CHECKPOINT_01_APPROVAL_2026-08-03.md`
14. `docs/planning/visual/INGAME_ART_CHECKPOINT_01_APPROVED_MANIFEST.json`
15. `docs/planning/benchmarks/SUMMON_ACTIVE_3_AND_WORK_QUALITY_QUICK_BENCHMARK_2026-08-03.md`
16. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
17. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
18. `docs/planning/sync/GR-SYNC-20260803-04-MAIN.md`
19. `docs/planning/sync/GR-SYNC-20260803-03-WORKING.md`

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

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n의 Stock 충전시간
= 10 + 5 × (n - 1)초
```

소환수 `[스톡] N`은 5초마다 현재 지정 Stock 남은 시간을 `N초` 감소시키며 초과분은 이월하지 않는다.

## 소환수 최신 계약

```text
메인 소환수 1체 = 상시 활성
보조 소환수 = [소환 주문] Commit 후 활성
보조 슬롯 = S1 / S2 / S3
보조 동시 활성 상한 = 3체
총 활성 상한 = 4체
지속시간·Cooldown = 없음
```

Prototype 기본값:

```yaml
summon_spell_mana_cost: 2
support_cycle_seconds: 5
secondary_role_duplicate_cap_in_slice: 1
main_stock_stat: 1
production_stock_stat: 2
guardian_defense_stat: 2
assault_attack_stat: 2
recovery_heal_stat: 2
```

보조 역할:

- `PRODUCTION`.
- `GUARDIAN`.
- `ASSAULT`.
- `RECOVERY`.

Slice에서는 네 역할 중 최대 세 역할을 선택하며 보조 사이 같은 역할 중복을 금지한다. 메인 `[스톡] 1`은 보조 역할 중복 판정에서 제외한다.

```text
최종 직접 피해 = max(1, 원피해 - 총 방어도)
```

자동 공격은 불안정도를 `1` 아래로 낮추거나 마지막 해결 Event가 될 수 없다.

## State/Ledger/Save

- 보조 상태는 단일 객체가 아니라 `secondary_summon_states` 최대 3개 배열이다.
- 각 슬롯·역할은 유일해야 한다.
- `[소환 주문]`은 마나 차감·교체·활성화를 한 Transaction으로 처리한다.
- Stock 소비와 주문 효과 적용도 한 Transaction이다.
- 소환수 행동은 고유 `summon_event_id`로 정확히 한 번만 적용한다.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3` 순서다.
- Background·Offline 경과로 행동·충전 지원을 실행하지 않는다.

## 작업 품질 Gate

앞으로 모든 GrillMe 질문과 실질 작업은 다음을 따른다.

```text
프로젝트 근거
→ 벤치마킹
→ 현업·공식·표준 비교
→ ADOPT / ADAPT / REJECT
→ 중립 권장안
→ 적대적 검토
→ UTF-8·NFC·Text Integrity
→ GitHub·Sheet Readback
```

설계 의미가 없는 단순 동기화는 `N/A_NO_DESIGN_CHANGE`를 기록할 수 있지만 Text Integrity와 Readback은 생략하지 않는다.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## Mobile HUD 권장 구조

```text
메인 소환수 배지
+ 보조 S1 / S2 / S3 압축 Rail
+ 선택 슬롯 상세 Panel
```

압축 슬롯은 역할·대표 정수 스탯·다음 행동 초·상태만 표시한다. 세 보조의 모든 상세 문구를 동시에 상시 노출하지 않는다.

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

## 최근 완료 체크포인트

PR #51은 사용자 명시 승인에 따라 `6/10`에서 병합됐다.

```yaml
working_sync: GR-SYNC-20260803-03
main_sync: GR-SYNC-20260803-04
decision_merge_pull_request: 51
decision_merge_commit: 81852a767d60eb2aa835ac3e36309f1dc43c861d
checkpoint_reason:
  - DIFF_SIZE
  - CANON_DRIFT
new_decision_count_from_checkpoint_operation: 0
batch_counter_after_merge: 0/10
pending_decisions_after_merge: 0
```

병합된 범위는 Stock·소환수·State/Ledger/Save·작업 품질 Gate·Mobile HUD 명세·승인 Board A/B 및 정본 드리프트 교정이다. 제품 코드·Scene·Resource·Asset은 변경하지 않았다.

## 남은 P1

1. 보조 3슬롯 Mobile HUD 사용자 명세 검토.
2. State/Ledger/Save TDD Plan·Test Matrix.
3. Godot Toolchain preflight.
4. Base v9.4.3 Plan 재검증·Execution Readiness.

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
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
