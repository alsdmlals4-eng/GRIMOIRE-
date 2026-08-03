# GR-AUD-PLANNING-REMAINDER-20260802-01 — 보조 3체·작업 품질 Gate 이후 잔여 기획 감사

## 1. 감사 상태

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
baseline_main: 7fd2c137469120a9ccf942df5b9860af135acc87
status: COMPLETE_REVISED_AFTER_MOBILE_HUD_USER_SPEC_REVIEW
updated_at: 2026-08-03T21:11:00+09:00
working_sync: GR-SYNC-20260803-05
p0_open: 0
p1_open: 2
p1_closed_spec: 1
p1_closed_plan_only: 1
p2_open: 12
p3_deferred: 8
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 핵심 결론

GRIMOIRE의 핵심 재미·전체 구조·자연충전 Stock·정수 상주 소환수 방향은 유지 가능하다.

```text
메인 소환수 1체 상시
+ 보조 소환수 S1/S2/S3 최대 3체
= 총 활성 최대 4체
```

가드레일:

- 보조 역할 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`.
- Slice에서는 네 역할 중 최대 세 역할 선택.
- 보조 사이 같은 역할 중복 금지.
- 메인 `[스톡] 1`은 보조 역할 중복 검사에서 제외.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3`.
- Mobile은 좌측 보조 3슬롯 압축 Rail + 선택 슬롯 상세.

## 3. Mobile HUD 사용자 명세 검토 결과

Decision: `GM-MOBILE-SUMMON-HUD-WIREFRAME-01`.

상태:

```yaml
status: USER_APPROVED_HARDENED_SPEC_ACTIVE
selected_approach: B_TARGETED_HARDENING_WITH_LAYOUT_PRESERVED
counter_increment: false
counter_after: 0_of_10
```

확정 보강:

1. Drawer 열람은 Clock을 정지하지 않는다.
2. Active Stroke 종료와 Draft 안전 보존 뒤 `MANAGEMENT_CONFIRM`만 Clock을 정지한다.
3. 같은 시각 Event 계산·Ledger 적용은 `MAIN → S1 → S2 → S3`, 전체 HUD 표시 예산은 `1.2초 TEST_VALUE`다.
4. Text Scale Test는 `100%·130%·Android 최대 200%`다.
5. 타이머는 Focus 또는 의미 있는 변화만 발표하며 매초 자동 발표하지 않는다.
6. 빈 슬롯·오류 슬롯은 nullable ViewModel과 `timing_mode: NONE`을 사용한다.
7. Exactly-once는 ResultLedger가 소유하고 Active Stroke 입력은 Writing Canvas가 소유한다.

## 4. 이번에 닫힌 P1

### P1-01 — 보조 3슬롯 Mobile HUD Wireframe: `CLOSED_SPEC`

책임 원본:

- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
- `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.

닫힘 의미는 **명세 승인 완료**다. Runtime·실기기·접근성·사람 검증 완료를 뜻하지 않는다.

### P1-02 — TDD Plan·Test Matrix: `CLOSED_PLAN_ONLY`

책임 원본:

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

계획은 8개 TDD Task와 ViewModel·Clock·Event·Input·Layout·A11y·Save Matrix를 정의한다. 모든 실행 상태는 `NOT_RUN`이다.

## 5. 남은 P1 — 2개

### P1-03 — Godot Toolchain Preflight

- Godot binary·version.
- renderer.
- headless test 실행.
- Mobile export template.
- 프로젝트 생성 전 경로·권한.

### P1-04 — Base v9.4.3 Plan 재검증·Execution Readiness

- 최종 main 기준 Implementation Plan 재검증.
- 3슬롯 State Interface와 Foundation POC 범위 연결.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.
- P0=0·P1=0·별도 Scope 승인 때만 코드 실행.

## 6. 현재 닫힌 주요 구조

### 6.1 최상위·Cold-start 정본

- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.

### 6.2 소환수 활성·중첩

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slot_ids: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
```

### 6.3 State/Ledger/Save

- `secondary_summon_states` 배열 최대 3개.
- 슬롯·보조 역할 유일성.
- 네 번째 보조 활성 차단.
- 역할 중복 Transaction 롤백.
- `MAIN → S1 → S2 → S3` 결정적 Event 순서.
- Exactly-once 소유권은 ResultLedger.
- 보조 3체 Save/Resume.
- 손상 Snapshot 자동 덮어쓰기 금지.
- HUD nullable ViewModel·canonical presentation record.

### 6.4 작업 품질 Gate

- 모든 GrillMe·실질 작업 벤치마킹.
- 직접 사례 + 인접/현업/표준 비교.
- `ADOPT / ADAPT / REJECT`.
- 중립 권장안과 반대 대안.
- 적대적 검토.
- UTF-8·NFC·replacement·제어문자·mojibake 검증.
- GitHub·Sheet sentinel Readback.

## 7. P2 — Vertical Slice 제작 전에 남은 12개

1. Battle Tuning: HP·마나·적 불안정도·공격 간격·정수 스탯 스케일·보조 3체 기회비용.
2. Result Grading: 소환수별 기여 출처와 결과 품질.
3. 대표 제작 미니게임: `촉매 배합·안정화 1개` 권장.
4. 추가 현장실습 전투: 실제 Slice 제외·Preview 권장.
5. Grimoire Screen: 소환수 슬롯·역할·Event 기여 기록.
6. Main Screen.
7. Audio Direction: MAIN/S1/S2/S3 주기와 대상 구분.
8. 접근성·난이도: 다중 주기 시각·음향·진동 대체.
9. Year-One Chapter Map.
10. 커리큘럼·글자 Catalog.
11. 성장·평가·경제: 보조 슬롯 해금·개별 정수 성장.
12. Slice 시간 예산.

## 8. P3 — Slice 이후

1. Boss 다중 페이즈.
2. 보조 같은 역할 중복 허용 여부.
3. 보조 4체 이상 추가 슬롯.
4. 전체 소환수 Roster·장기 성장·탑승.
5. 2·3학년 Chapter·상급 연구.
6. Save Migration.
7. Store·사업화·PC Adaptation.
8. 최종 Art·Audio·Asset 대량 제작.

## 9. 적대적 위험과 가드

### 자동화 지배

- 역할 중복 금지.
- 공격 불안정도 하한 `1`.
- 마지막 해결 Event는 플레이어 담당.
- 소환수별 출처 기록.
- 실제 작성 비율·대기 플레이 사람 검증은 `NOT_RUN`.

### Stock 과가속

- 메인 `[스톡] 1` + 생산형 `[스톡] 2`.
- 활성 `[스톡]` 합계 상한 `3`.
- 초과 감소량 이월 없음.
- 최소 실제 충전시간 `3초`.

### Mobile HUD 과밀

- MAIN + S1/S2/S3 압축 Rail.
- 상세는 선택 슬롯 1개만 확장.
- Writing 중 읽기 전용 Micro Detail.
- 100%·130%·Android 최대 200% 검증.
- 같은 시각 Event 전체 `1.2초 TEST_VALUE` 표시 예산.

### 무료 Pause·필기 손실

- Drawer 읽기 중 Clock 진행.
- 안전한 Draft 보존 뒤 관리 Confirm만 정지.
- Active Stroke 입력 소유권은 Writing Canvas.

### 접근성 과잉 발표

- 타이머 매초 발표 금지.
- Focus·상태·Event·오류·중요 임계점만 발표.

### 제작·QA 비용

- 동시 모델·FX·오디오 식별.
- 슬롯별 상태·대상·Event 로그.
- 조합 Test·Save/Resume Fixture.
- Slice에서 동시 표시 보조 모델은 3체 상한.

## 10. 다음 순서

```text
1. GR-SYNC-20260803-05 Working Branch·Sheet·PR 검증
2. 사용자 병합 승인 Gate
3. Godot Toolchain preflight
4. Base v9.4.3 Plan 재검증
5. Execution Readiness
6. 별도 HUD/Foundation POC Scope 판단
```

## 11. 최종 판정

```yaml
core_concept: APPROVED_AND_COHERENT
stock_model: NATURAL_CHARGE_RESTORED
summon_model: PERSISTENT_MAIN_PLUS_THREE_UNIQUE_ROLE_SECONDARIES_APPROVED
state_interface: APPROVED_DESIGN_ONLY_HARDENED_FOR_HUD
mobile_summon_hud_spec: USER_APPROVED_HARDENED
mobile_summon_hud_plan: WRITTEN_NOT_EXECUTED
work_quality_gate: APPROVED_ACTIVE
planning_complete_for_full_vertical_slice: false
planning_sufficient_for_execution_readiness_review: true
execution_ready: false
```
