# GM-MOBILE-SUMMON-HUD-WIREFRAME-01 — TDD Test Matrix

## 1. 상태

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
matrix_id: GR-TM-MOBILE-SUMMON-HUD-20260803-01
status: PLAN_WRITTEN_NOT_EXECUTED
approved_spec_review_at: 2026-08-03T21:11:00+09:00
working_sync: GR-SYNC-20260803-05
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

모든 행의 초기 실행 상태는 `NOT_RUN`이다. 문서 존재는 Test PASS 증거가 아니다.

## 2. 판정 규칙

- `PASS`: 명시된 자동 명령 또는 실기기 절차가 실행되고 Evidence가 저장됨.
- `FAIL`: 기대 결과 불일치 또는 보호 경계 침범.
- `BLOCKED`: 필수 Toolchain·Execution Readiness·Scope 승인이 없음.
- `NOT_RUN`: 실행 전 초기 상태.
- `TEST_VALUE`: Prototype 측정값이며 최종 수치가 아님.

## 3. View Model

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-VM-001 | Unit | MAIN만 활성 | 슬롯 순서 `MAIN/S1/S2/S3`; S1~S3 `EMPTY` | ViewModelBuilder | NOT_RUN |
| HUD-VM-002 | Unit | S2만 활성 | 위치 재정렬 없이 S2에만 데이터 | ViewModelBuilder | NOT_RUN |
| HUD-VM-003 | Unit | 빈 슬롯 | 역할·스탯·주기·대상 `null`, `timing_mode=NONE` | ViewModelBuilder | NOT_RUN |
| HUD-VM-004 | Unit | MAIN | `timing_mode=PERSISTENT`, 가짜 남은 초 없음 | ViewModelBuilder | NOT_RUN |
| HUD-VM-005 | Unit | 보조 ACTIVE | 역할별 대표 정수와 `timing_mode=CYCLIC` | ViewModelBuilder | NOT_RUN |
| HUD-VM-006 | Unit | INVALID/ERROR | 원본 오류 보존, 자동 교정 없음 | Recovery→ViewModel | NOT_RUN |
| HUD-VM-007 | Static | HUD source scan | 마나·Roster·Event 적용 코드 0건 | Scope checker | NOT_RUN |

## 4. Clock·관리 확인

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-CLK-001 | Unit | Drawer 열기 | Clock 계속 진행 | ManagementReducer | NOT_RUN |
| HUD-CLK-002 | Unit | 슬롯 비교 | Clock 계속 진행 | ManagementReducer | NOT_RUN |
| HUD-CLK-003 | Unit | Active Stroke 중 관리 요청 | Confirm 진입·Clock 정지 0건 | WritingSession/Reducer | NOT_RUN |
| HUD-CLK-004 | Unit | Draft 미보존 | Confirm 진입 차단 | WritingSession/Reducer | NOT_RUN |
| HUD-CLK-005 | Unit | Stroke 종료+Draft 안전 | `MANAGEMENT_CONFIRM`, Clock 정지 | ManagementReducer | NOT_RUN |
| HUD-CLK-006 | Unit | Confirm 취소 | State·마나·주기·Draft 변화 0 | Transaction boundary | NOT_RUN |
| HUD-CLK-007 | Integration | Confirm 완료 | Command 1회 전달, HUD 직접 변경 0 | Transaction boundary | NOT_RUN |

## 5. Event·Ledger·표시 Queue

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-EVT-001 | Unit | 같은 시각 4 Event 역순 입력 | 출력 `MAIN→S1→S2→S3` | PresentationQueue | NOT_RUN |
| HUD-EVT-002 | Unit | 같은 시각 1~4 Event | 전체 표시시간 `<=1200ms TEST_VALUE` | PresentationQueue | NOT_RUN |
| HUD-EVT-003 | Unit | Canonical Event | source/event ID/정수 Delta 보존 | PresentationQueue | NOT_RUN |
| HUD-EVT-004 | Integration | 동일 Event ID 재유입 | ResultLedger 재적용 0; HUD 판단 0 | ResultLedger | NOT_RUN |
| HUD-EVT-005 | Static | HUD 파일 | `applied_event_ids`, `commit_once` 소유 0 | Scope checker | NOT_RUN |
| HUD-EVT-006 | Integration | 공격 Event | 불안정도 하한 1, 마지막 해결 0 | Situation Transaction | NOT_RUN |
| HUD-EVT-007 | Integration | 다음 5초 주기 | 이전 표시 Queue가 판독을 막는 누적 지연 0 | PresentationQueue/UI | NOT_RUN |

## 6. 입력 소유권

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-INP-001 | Integration | Active Stroke 중 Rail 접촉 | 선택 변화 0 | WritingCanvas | NOT_RUN |
| HUD-INP-002 | Integration | Active Stroke 중 Drawer 접촉 | Focus 이동·관리 요청 0 | WritingCanvas | NOT_RUN |
| HUD-INP-003 | Integration | Stroke 종료 후 Rail 접촉 | 선택 슬롯만 변경 | Rail | NOT_RUN |
| HUD-INP-004 | Integration | 장식 초상·FX 접촉 | 입력 intercept 0 | UI Control config | NOT_RUN |
| HUD-INP-005 | Integration | Rail 선택 후 Writing 재개 | Draft·획 보존 | WritingSession | NOT_RUN |
| HUD-INP-006 | Integration | Multi-touch 우발 접촉 | Active pointer sequence 유지 | WritingCanvas | NOT_RUN |

## 7. Layout·Safe Area·Touch

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-LYT-001 | Headless | 16:9 | Rail·Drawer·Writing 영역 중첩 0 | MobileSafeRoot | NOT_RUN |
| HUD-LYT-002 | Headless | 19.5:9 | 필수 정보 가림 0 | MobileSafeRoot | NOT_RUN |
| HUD-LYT-003 | Headless | 20:9 | 필수 정보 가림 0 | MobileSafeRoot | NOT_RUN |
| HUD-LYT-004 | Headless | 좌측 Cutout | Rail Safe Area 내부 | MobileSafeRoot | NOT_RUN |
| HUD-LYT-005 | Headless | 우측 Cutout | Writing Panel Safe Area 내부 | MobileSafeRoot | NOT_RUN |
| HUD-LYT-006 | Headless | Writing 확장 | Rail 유지, Full Drawer 닫힘 | UI state binding | NOT_RUN |
| HUD-LYT-007 | Device | Android | Hit Area `>=48dp` | Device measurement | NOT_RUN |
| HUD-LYT-008 | Device | iOS | 주요 Hit Area `>=44pt` | Device measurement | NOT_RUN |

## 8. Text Scale·접근성

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-A11Y-001 | Headless/Visual | 100% | 슬롯·역할·수치·시간·상태 표시 | Layout/A11y | NOT_RUN |
| HUD-A11Y-002 | Headless/Visual | 130% | 핵심 정보·Touch target 손실 0 | Layout/A11y | NOT_RUN |
| HUD-A11Y-003 | Android Device | 최대 200% | 장식 우선 축소; 핵심 정보·Touch target 유지 | Layout/A11y | NOT_RUN |
| HUD-A11Y-004 | Unit | 슬롯 Focus | 슬롯·소환수·역할·수치·시간·상태 이름 | A11y helper | NOT_RUN |
| HUD-A11Y-005 | Unit | 타이머 3초→2초 | 자동 발표 0 | A11y helper | NOT_RUN |
| HUD-A11Y-006 | Unit | 새 Event·상태 전환 | `POLITE` 1회 발표 | A11y helper | NOT_RUN |
| HUD-A11Y-007 | Unit | 치명 오류 | `ASSERTIVE` 검토 대상 1회 | A11y helper | NOT_RUN |
| HUD-A11Y-008 | Visual | Grayscale | 역할·상태 구분 유지 | Art/UI | NOT_RUN |
| HUD-A11Y-009 | Visual | Reduced Motion | Pulse·Drawer 이동 제거, 정적 강조 | UI | NOT_RUN |

## 9. Save·Resume·오류

| ID | 유형 | 입력 | 기대 결과 | 책임 소유자 | 초기 상태 |
|---|---|---|---|---|---|
| HUD-SAVE-001 | Integration | S1/S2/S3 남은 주기 1/2/3초 | Resume 후 독립 값 유지 | SessionSnapshot | NOT_RUN |
| HUD-SAVE-002 | Integration | Background | Offline Event 생성 0 | Lifecycle/Ledger | NOT_RUN |
| HUD-SAVE-003 | Integration | 적용 직후 Save | Resume 재적용 0 | ResultLedger | NOT_RUN |
| HUD-SAVE-004 | Integration | 중복 슬롯 Save | 자동 삭제·덮어쓰기 0; 명시 오류 | Recovery | NOT_RUN |
| HUD-SAVE-005 | Integration | 중복 역할 Save | 자동 교정 0; 충돌 원인 표시 | Recovery | NOT_RUN |
| HUD-SAVE-006 | Integration | 알 수 없는 Event | 재적용 0; 경고 표시 레코드 | ResultLedger | NOT_RUN |
| HUD-SAVE-007 | Integration | Missing portrait | Silhouette+텍스트, 슬롯 유지 | HUD fallback | NOT_RUN |

## 10. 조합 Matrix

자동 Fixture 최소 조합:

```text
MAIN + 보조 0/1/2/3
× EMPTY/ACTIVE/PAUSED/SEALED/INVALID/ERROR
× Writing collapsed/expanded
× 16:9/19.5:9/20:9
× no cutout/left cutout/right cutout
× text 100/130/Android max 200
× grayscale/reduced motion
```

전체 Cartesian product를 무조건 실행하지 않는다. Pairwise 조합으로 회귀 세트를 구성하고 다음 위험 조합은 별도 고정한다.

1. `3체 + Writing 확장 + 200% + 좌측 Cutout`.
2. `4개 동시 Event + Reduced Motion + Screen reader`.
3. `Active Stroke + Rail 우발 접촉 + Timer 진행`.
4. `중복 슬롯 Save + Resume + ERROR Drawer`.
5. `관리 Confirm 요청 + Draft 미보존 + Background 전환`.

## 11. Evidence 계약

자동 Test Evidence:

```yaml
commit_sha: required
command: required
exit_code: required
passed: required
failed: required
artifact_path: required
```

실기기 Evidence:

```yaml
device_model: required
os_version: required
resolution: required
cutout_orientation: required
font_scale: required
touch_measurement: required
screen_reader: required_when_applicable
reviewer: required
result: PASS | FAIL
```

Evidence가 없으면 상태를 `PASS`로 변경하지 않는다.

## 12. 실행 전 최종 경계

```text
TDD_MATRIX = WRITTEN_NOT_EXECUTED
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODEX_EXECUTION = BLOCKED
EXECUTION_READINESS = NOT_PASSED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```
