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
| Decision 병합 | `PR #54 / bf964063` |
| Main Finalization | `PR #55 / f693089a` |
| Sheet Readback | `PASS / PR #56 receipt` |
| 현재 Main Sync | `GR-SYNC-20260803-06` |
| Working Branch | `NONE` |
| Grill Batch | `0/10 / pending distinct decisions 0` |
| Mobile HUD 사용자 명세 | `USER_APPROVED_HARDENED_SPEC_ACTIVE` |
| TDD Plan·Test Matrix | `WRITTEN_NOT_EXECUTED` |
| 남은 P1 | `2 — Toolchain preflight / Base v9.4.3 Plan 재검증·Execution Readiness` |
| 제품·Godot 구현 | `NOT_STARTED / NOT_AUTHORIZED` |
| Codex 실행 | `BLOCKED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/DEVELOPMENT_GATES.md`.
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
5. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
6. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
7. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
8. `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
9. `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
10. `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.
11. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
12. `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.
13. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`.
14. `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

## 확정된 Mobile Summon HUD 계약

- 좌측 Safe Area `MAIN → S1 → S2 → S3` 압축 Rail.
- 선택 슬롯 하나만 Contextual Detail Drawer로 확장.
- Drawer 열람 중 Active Pressure Clock 진행.
- Active Stroke 종료와 Draft 안전 보존 뒤 `MANAGEMENT_CONFIRM`만 Pause.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3` 순서로 원자 처리.
- 전체 HUD 표시 예산 `1.2초 TEST_VALUE`, 슬롯별 누적 금지.
- Text Scale `100%`, `130%`, Android 최대 `200%` 필수 검증.
- 타이머는 Focus 또는 의미 있는 변화 때만 접근성 발표.
- 빈·오류 슬롯은 nullable ViewModel과 `timing_mode: NONE`.
- Exactly-once는 ResultLedger, Active Stroke는 Writing Canvas가 소유.

## 현재 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_PROJECT = NOT_STARTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = WRITTEN_NOT_EXECUTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## 다음 순서

1. Godot Toolchain preflight.
2. Base v9.4.3 최종 main 기준 Implementation Plan 재검증.
3. `GM-FOUNDATION-POC-EXECUTION-READINESS-01` 판정.

Execution Readiness PASS 전에는 코드·Scene·Resource·Asset 제작을 시작하지 않는다.