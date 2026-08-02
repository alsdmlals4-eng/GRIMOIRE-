# Mobile Foundation POC Implementation Entry Design

## 1. 목적

이 설계는 GRIMOIRE의 전체 Vertical Slice를 구현하지 않는다. Mobile Landscape에서 핵심 직접 작성 경험을 무너뜨릴 가능성이 큰 기술 위험만 가장 작은 실행 가능한 POC로 검증한다.

검증 대상은 다음 다섯 가지다.

1. 직접 작성 Draft와 후보 확인 생명주기.
2. App 중단·복귀와 Save/Resume 상태 보존.
3. 중복 Commit·비용·피해·보상·기록 방지.
4. 적·목표·위험 정보를 유지하는 확장형 우측 Writing Panel.
5. Smartphone Aspect·Safe Area·Cutout·Text Scale에서 핵심 조작 가능성.

## 2. 승인 범위

Decision `GM-IMPLEMENTATION-ENTRY-01`의 승인 옵션은 다음이다.

```text
A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK
```

이 설계가 허용하는 것은 설계·테스트 계획과 Foundation POC뿐이다. 전체 46–53분 콘텐츠, 실제 인식 알고리즘, 최종 Art·Audio, Boss, 완성 Grimoire/Main 화면은 포함하지 않는다.

## 3. 실행 선행조건

코드 작성은 다음 조건을 모두 충족한 뒤 시작한다.

- Draft PR #38과 #42가 병합·종료·supersede 중 하나로 정리된다.
- main의 Base Adapter가 단일 release identity를 가진다.
- Adapter·Snapshot·Generator·Required Workflow가 PASS한다.
- 최신 main에서 이 설계와 구현 계획을 다시 읽고 충돌을 검사한다.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01`이 P0=0, P1=0으로 PASS한다.

현재 단계에서는 `codex_plan = ALLOWED`, `codex_execution = BLOCKED`다.

## 4. 비목표

다음은 의도적으로 구현하지 않는다.

- 실제 한글·룬·글자 인식 알고리즘.
- ML 모델, 학습 데이터, 사용자 필기 수집.
- 실제 수업·축제·현장·귀환 콘텐츠.
- 최종 Dialogue, Quest, Balance, Progression.
- 최종 Asset Import, Animation, VFX, Audio.
- Boss 다중 페이즈.
- 완성 Grimoire·Main·설정 화면.
- Store·배포·결제.
- PC Mouse·Pen·Keyboard 최적화.

## 5. 설계 원칙

### 5.1 순수 상태 우선

Scene·Control·Node에서 게임 규칙을 직접 소유하지 않는다. Focus Task 전이, Commit idempotency, Snapshot 직렬화는 Scene 없이 Headless 테스트할 수 있는 순수 `RefCounted` 단위로 분리한다.

### 5.2 명시적 Commit

Draft·Candidate 확인은 비용·피해·보상·기록을 변경하지 않는다. 단일 `transaction_id`를 가진 Commit만 Atomic Result Ledger를 변경한다.

### 5.3 중단은 실패가 아니다

App pause, background, focus loss, Panel collapse는 Draft를 폐기하지 않는다. 완료 Stroke는 보존하고 입력 중이던 미완성 Stroke와 stale Recognition job만 폐기한다.

### 5.4 인식 품질을 가장하지 않는다

POC는 `DeterministicTestRecognizer`만 사용한다. 입력 특징에 따라 미리 정한 후보와 confidence를 반환해 UI·상태·복구만 검증한다. 실제 인식 품질을 증명하지 않는다.

### 5.5 무아트 Harness

모든 화면은 단색 Panel·Label·Button·Debug Overlay로 구성한다. 승인된 Art Bible의 영역 관계만 검증하며 최종 시각 품질을 주장하지 않는다.

## 6. 상태 모델

### 6.1 Focus Task 상태

```text
OBSERVE
→ ENTER_FOCUS
→ INPUT
→ REVIEW
→ COMMITTING
→ RESOLVED
→ RECORDED
→ RETURNED
```

허용 보조 전이:

- `INPUT → OBSERVE`: 명시적 전체 취소. Ledger 변경 없음.
- `REVIEW → INPUT`: 후보 수정 또는 재작성.
- `INPUT/REVIEW → SUSPENDED`: App 중단.
- `SUSPENDED → INPUT/REVIEW`: Snapshot 복구.
- `COMMITTING → RESOLVED`: 같은 transaction을 처음 적용한 경우.
- 중복 `COMMITTING`: 기존 결과 반환, 재적용 없음.

### 6.2 Writing Draft 상태

```text
EMPTY
→ DRAWING
→ DRAFT_READY
→ RECOGNIZING
→ CANDIDATE_READY
→ CONFIRMED
→ COMMITTED
```

규칙:

- 미완성 Stroke는 Snapshot에 저장하지 않는다.
- 완료 Stroke만 Snapshot에 저장한다.
- 낮은 confidence 후보는 자동 `CONFIRMED`로 전환하지 않는다.
- Panel collapse는 상태를 유지한다.
- 전체 취소만 `EMPTY`로 되돌린다.

### 6.3 Result Ledger

`AtomicResultLedger`는 transaction ID별 적용 결과를 보관한다.

```gdscript
func commit_once(transaction_id: StringName, payload: Dictionary) -> Dictionary
```

반환 형식:

```gdscript
{
    "applied": true_or_false,
    "transaction_id": transaction_id,
    "result": result_dictionary
}
```

같은 ID를 다시 Commit하면 `applied = false`이고 최초 `result`를 그대로 반환한다.

## 7. 컴포넌트

### 7.1 Toolchain Preflight

`tools/check_godot_toolchain.py`

책임:

- `GODOT_BIN` 환경변수 또는 PATH에서 실행 파일 확인.
- `--version` 실행 성공 확인.
- 프로젝트 권위의 Engine candidate와 실제 출력 차이를 보고.
- Renderer·Mobile export template·Android/iOS toolchain은 `UNVERIFIED`로 별도 출력.

이 검사는 버전을 자동 변경하거나 다운로드하지 않는다.

### 7.2 FocusTaskReducer

`src/core/focus_task_reducer.gd`

책임:

- 현재 상태와 event를 받아 다음 상태를 반환.
- 허용되지 않은 전이는 오류 결과로 반환.
- Scene, Timer, File I/O 의존 없음.

인터페이스:

```gdscript
func reduce(state: StringName, event: StringName) -> Dictionary
```

### 7.3 AtomicResultLedger

`src/core/atomic_result_ledger.gd`

책임:

- transaction 중복 적용 방지.
- Snapshot 직렬화·복구.
- 결과 계산 함수는 외부에서 주입.

### 7.4 StrokeBuffer

`src/input/stroke_buffer.gd`

책임:

- active Stroke와 completed Stroke 분리.
- pointer ID 하나만 active writer로 허용.
- multi-touch가 들어오면 두 번째 pointer를 UI gesture 후보로 분리하고 Stroke에 합치지 않음.
- focus loss 시 active Stroke 폐기.

### 7.5 Recognizer 계약

`src/input/glyph_recognizer.gd`

```gdscript
func recognize(completed_strokes: Array[PackedVector2Array], draft_revision: int) -> Dictionary
```

반환:

```gdscript
{
    "revision": draft_revision,
    "candidates": [
        {"glyph_id": "FLOW", "confidence": 0.92},
        {"glyph_id": "FOCUS", "confidence": 0.55}
    ]
}
```

`DeterministicTestRecognizer`는 Stroke 개수와 마지막 점 위치로 고정 후보를 반환한다. 결과 revision이 현재 Draft와 다르면 stale 결과로 폐기한다.

### 7.6 WritingSession

`src/input/writing_session.gd`

책임:

- StrokeBuffer·Recognizer·Focus state 연결.
- candidate 확인, Undo, current Stroke 삭제, 전체 취소.
- Commit 요청 생성.
- UI를 직접 참조하지 않음.

### 7.7 SessionSnapshot

`src/persistence/session_snapshot.gd`

Schema version 1 필드:

```text
schema_version
anchor_id
focus_state
writing_state
completed_strokes
candidate_list
confirmed_glyph_id
draft_revision
pending_transaction_id
ledger_state
scene_context
```

미완성 Stroke·실행 중 Recognition job·Node 경로는 저장하지 않는다.

### 7.8 SaveRepository

`src/persistence/save_repository.gd`

책임:

- 임시 파일에 먼저 기록.
- JSON parse와 schema 검증.
- 검증 성공 후 원자적 교체.
- 손상 파일 발견 시 직전 정상 백업 복구.

POC에서는 단일 local user path만 사용한다.

### 7.9 AppLifecycleCoordinator

`src/platform/app_lifecycle_coordinator.gd`

책임:

- pause, focus loss, background 신호 수신.
- active Stroke 폐기.
- completed Draft Snapshot 저장.
- 복귀 시 Snapshot 재적용.
- 중복 Commit이 진행 중이면 Ledger 상태로 재판정.

### 7.10 MobileSafeRoot Harness

`src/ui/mobile_safe_root.tscn`

영역:

1. Objective / Threat / Timer.
2. Player Status.
3. World / Enemy / Situation Focus.
4. Collapsed Rail 또는 Expanded Writing Panel.
5. Confirm / Recovery / System Feedback.

Harness 상태:

- `OBSERVE_BATTLE`.
- `WRITING_EXPANDED`.
- `PAUSED_WITH_DRAFT`.
- `RESULT_APPLIED`.
- `NONCOMBAT_TARGET`.

모든 상태에 `POC / TEST_VALUE / NOT_CONTENT_COMPLETE` Label을 표시한다.

## 8. 합성 시나리오

### 8.1 비전투

`synthetic_crystal_transfer`

- 목표: 취약한 대상 이동.
- 입력 후보: FLOW, FOCUS, DISPERSION.
- 결과는 단순 Dictionary로 기록.
- 실제 서사·점수·보상 없음.

### 8.2 단일 강적

`synthetic_unstable_spirit`

- 적 의도와 countdown 표시.
- 플레이어 HP·마나·환경 위험 표시.
- Writing Panel 확장 중에도 위 정보 유지.
- Commit 결과는 불안정도와 환경 상태의 합성 값만 변경.
- 실제 전투 밸런스·Animation·VFX 없음.

## 9. 오류 처리

오류 종류를 혼합하지 않는다.

```text
INPUT_ERROR
RECOGNITION_ERROR
GRAMMAR_ERROR
CONTEXT_ERROR
COST_ERROR
STALE_RESULT
DUPLICATE_TRANSACTION
SAVE_CORRUPTION
TOOLCHAIN_MISMATCH
```

각 오류는 사용자 표시 문구와 Debug code를 함께 가진다. POC에서는 오류를 숨기거나 자동 성공으로 전환하지 않는다.

## 10. 테스트 전략

### 10.1 Custom Headless Runner

외부 Test plugin을 추가하지 않는다. `tests/test_runner.gd`를 `SceneTree` script로 실행한다.

```bash
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

### 10.2 Unit

- 허용·금지 Focus 전이.
- 중복 Commit 0.
- active Stroke와 completed Stroke 분리.
- stale recognition 폐기.
- 낮은 confidence 자동 확정 금지.
- Snapshot round-trip.
- 손상 Save 백업 복구.

### 10.3 Integration

- 작성 중 pause→resume Draft 보존.
- Commit 직후 background→resume 결과 중복 0.
- Panel collapse→expand Draft 보존.
- 합성 비전투와 합성 전투가 같은 Focus Task 계약을 사용.

### 10.4 Layout Harness

Viewport 시험값:

```text
1280×720
1600×900
2340×1080
2400×1080
```

추가 Insets:

```text
left_cutout
right_cutout
bottom_gesture
text_scale_100
text_scale_115
text_scale_130
```

검사는 최소 Rect 겹침·핵심 Label visibility·Button hit Rect를 기록한다. 실제 기기 통과를 주장하지 않는다.

## 11. 증거 산출물

POC 실행 후 다음 파일만 증거로 추가한다.

- `artifacts/foundation-poc/headless-test-report.json`.
- `artifacts/foundation-poc/layout-matrix-report.json`.
- `artifacts/foundation-poc/save-resume-report.json`.
- `docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md`.

실행 전에는 생성하지 않는다.

## 12. Stop 조건

다음이 만족되면 POC를 종료하고 사용자 검토로 전환한다.

- Headless Unit·Integration PASS.
- 같은 transaction의 결과 적용 횟수 1.
- pause/resume 후 completed Draft 손실 0.
- Panel collapse 후 Draft 손실 0.
- 시험 Viewport에서 핵심 상황 정보 visibility PASS.
- 실제 인식·실기기·성능·접근성·사람 검증이 `NOT_RUN`임을 보고서에 유지.

## 13. 재작업 조건

- Scene이 상태 규칙을 직접 소유함.
- UI 이벤트가 Ledger를 우회해 결과를 적용함.
- 낮은 confidence 후보가 자동 확정됨.
- pause/resume에서 transaction이 재적용됨.
- 미완성 Stroke가 정상 Draft처럼 복구됨.
- 합성 Harness가 실제 콘텐츠 완료처럼 표시됨.
- Base PR 정리 전에 제품 코드가 작성됨.

## 14. 실행 전 최종 Gate

`GM-FOUNDATION-POC-EXECUTION-READINESS-01`은 다음을 확인한다.

1. 최신 main과 Base identity.
2. Open PR #38·#42의 종료 또는 명시적 의존 관계.
3. 이 설계와 구현 계획의 path·interface 일치.
4. Toolchain preflight 실행 가능성.
5. 변경 금지 경로와 POC 허용 경로.
6. P0=0, P1=0.

Gate PASS 전에는 이 문서가 코드 작성 권한을 부여하지 않는다.
