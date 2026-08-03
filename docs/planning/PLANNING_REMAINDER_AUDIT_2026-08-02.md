# GR-AUD-PLANNING-REMAINDER-20260802-01 — 보조 3체·작업 품질 Gate 이후 잔여 기획 감사

## 1. 감사 상태

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
status: COMPLETE_REVISED_FOR_THREE_SECONDARIES
updated_at: 2026-08-03T00:04:00+09:00
p0_open: 0
p1_open: 4
p2_open: 12
p3_deferred: 8
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 핵심 결론

GRIMOIRE의 핵심 재미·전체 구조·자연충전 Stock·정수 상주 소환수 방향은 유지 가능하다.

이번 변경:

```text
메인 소환수 1체 상시
+ 보조 소환수 S1/S2/S3 최대 3체
= 총 활성 최대 4체
```

단순 활성 수 상향은 자동화 지배·스탯 몰아넣기·Mobile HUD 과밀을 만들 수 있으므로 다음 권장 가드레일을 함께 승인했다.

- 보조 역할 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`.
- Slice에서는 네 역할 중 최대 세 역할 선택.
- 보조 사이 같은 역할 중복 금지.
- 메인 `[스톡] 1`은 보조 역할 중복 검사에서 제외.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3`.
- Mobile은 보조 3슬롯 압축 Rail + 선택 슬롯 상세.

## 3. 벤치마킹·현업 비교 결론

Benchmark: `GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01`.

- 다중 소환 분류 사례에서 세 역할 범주가 편성 정체성을 만드는 원리를 `ADAPT`했다.
- 단일 동반체 사례에서 메인 소환수의 별도 상시 정체성을 `ADOPT`했다.
- 현재 활성 상태만 강조하거나 Unit 상세를 선택 조회하는 HUD 패턴을 Mobile 압축 Rail에 `ADAPT`했다.
- Unicode NFC·UTF-8 strict decode를 Text Integrity Gate에 `ADOPT`했다.

자유 중복 3체는 생산·방어·공격 특화가 핵심 플레이를 대체할 위험이 커 `REJECT_FOR_PROTOTYPE`했다.

## 4. 이번에 닫힌 항목

### 4.1 최상위·Cold-start 정본

교정:

- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.

### 4.2 소환수 활성·중첩

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slot_ids: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
```

### 4.3 State/Ledger/Save

- `secondary_summon_states` 배열 최대 3개.
- 슬롯·보조 역할 유일성.
- 네 번째 보조 활성 차단.
- 역할 중복 소환 Transaction 롤백.
- `MAIN → S1 → S2 → S3` 결정적 Event 순서.
- 보조 3체 Save/Resume.
- 손상 Snapshot 자동 덮어쓰기 금지.

### 4.4 작업 품질 Gate

Decision: `GM-GRILL-WORK-QUALITY-GATE-01`.

- 모든 GrillMe·실질 작업 벤치마킹.
- 직접 사례 + 인접/현업/표준 비교.
- `ADOPT / ADAPT / REJECT`.
- 중립 권장안과 반대 대안.
- 적대적 검토.
- UTF-8·NFC·replacement·제어문자·mojibake 검증.
- GitHub·Sheet sentinel Readback.

### 4.5 CI Text Integrity

PR CI에 다음 검사를 추가했다.

- UTF-8 strict decode.
- UTF-8 BOM 금지.
- Unicode NFC.
- replacement character `U+FFFD` 금지.
- 허용되지 않은 제어문자 금지.
- mojibake 휴리스틱.
- JSON parse.

최종 HEAD CI 실행 전에는 `PASS`로 간주하지 않는다.

## 5. P0 — 즉시 중단 수준

```yaml
p0_open: 0
```

제품 코드 실행은 별도 Execution Readiness가 계속 차단한다.

## 6. P1 — 구현 준비 전에 남은 4개

### P1-01 — 보조 3슬롯 Mobile HUD Wireframe

동시에 보여야 하는 정보:

- Stock 준비 용량 `현재/8`.
- 지정 충전 대상·현재/최대·남은 초.
- 활성 `[스톡]` 합계.
- 메인 소환수 배지.
- S1/S2/S3 역할·대표 정수·다음 행동 초·상태.
- 선택 슬롯 대상·예상 적용값·귀환·교체.
- 적 의도·불안정도·환경·HP·마나·Writing Panel.

Phone Landscape와 Text Scale 130에서 정보가림이 없어야 한다.

### P1-02 — TDD Plan·Test Matrix

필수:

- S1/S2/S3 소환·귀환·교체.
- 네 번째 보조 차단.
- 같은 보조 역할 중복 롤백.
- 교체 Transaction 실패 시 마나·기존 소환 상태 복구.
- 같은 시각 MAIN/S1/S2/S3 Event 순서 결정성.
- 중복 `summon_event_id` 0.
- Background Clock 0 진행.
- Save/Resume 뒤 보조 3체 유지.
- 손상 Snapshot 자동 덮어쓰기 0.
- Text Integrity 정상·실패 Fixture.

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
- P0=0·P1=0일 때만 코드 실행.

## 7. P2 — Vertical Slice 제작 전에 남은 12개

1. Battle Tuning: 플레이어 HP·마나·적 불안정도·공격 간격·정수 스탯 스케일·보조 3체 기회비용.
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

## 9. 적대적 위험

### 9.1 자동화 지배

세 보조가 5초 주기로 행동하면 플레이어의 직접 작성보다 소환수 Event가 더 자주 보일 수 있다.

가드:

- 역할 중복 금지.
- 공격 불안정도 하한 `1`.
- 마지막 해결 Event는 플레이어 담당.
- 소환수별 출처 기록.
- 실제 작성 비율·대기 플레이 사람 검증.

### 9.2 Stock 과가속

- 메인 `[스톡] 1` + 생산형 `[스톡] 2`만 허용.
- 활성 `[스톡]` 합계 상한 `3` 유지.
- 보조 생산형 중복 금지.
- 초과 감소량 이월 없음.
- 최소 실제 충전시간 `3초`.

### 9.3 상시 무적·과회복

```text
최종 직접 피해 = max(1, 원피해 - 총 방어도)
```

- 수호형 중복 금지.
- 치유형 중복 금지.
- 초과 회복 저장 없음.

### 9.4 Mobile HUD 과밀

- 메인 배지 + S1/S2/S3 압축 Rail.
- 상세는 선택 슬롯 1개만 확장.
- 세 소환수의 모든 문구를 동시에 상시 표시하지 않음.
- Text Scale 130·Safe Area 검증 전 완료 주장 금지.

### 9.5 제작·QA 비용

보조 3체는 다음 비용을 증가시킨다.

- 동시 모델·FX·오디오 식별.
- 슬롯별 상태·대상·Event 로그.
- 조합 Test 수.
- Save/Resume Fixture.

Slice에서는 동시 표시 보조 모델 3체를 상한으로 하며, 추가 Roster는 Preview·합성 데이터로 제한한다.

### 9.6 깨진 글자·인코딩

- UTF-8 strict decode·NFC·BOM·U+FFFD·제어문자·mojibake Gate.
- GitHub·Sheet sentinel Readback.
- 오류 발견 시 추측 자동 복원 금지.

## 10. 다음 순서

```text
1. 보조 3슬롯 Mobile HUD Wireframe
2. TDD Plan·Test Matrix
3. Godot Toolchain preflight
4. Base v9.4.3 Plan 재검증
5. Execution Readiness
6. Foundation POC 여부 판단
```

## 11. 최종 판정

```yaml
core_concept: APPROVED_AND_COHERENT
stock_model: NATURAL_CHARGE_RESTORED
summon_model: PERSISTENT_MAIN_PLUS_THREE_UNIQUE_ROLE_SECONDARIES_APPROVED
state_interface: APPROVED_DESIGN_ONLY_REVISED
work_quality_gate: APPROVED_ACTIVE
text_integrity_ci: ADDED_PENDING_FINAL_HEAD_VALIDATION
planning_complete_for_full_vertical_slice: false
planning_sufficient_for_foundation_poc_plan: true
execution_ready: false
```
