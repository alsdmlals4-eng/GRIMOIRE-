# GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01 — 단계형 사람·실기기 검증 승인

## 승인 상태

```yaml
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
status: USER_APPROVED_ACTIVE
approved_option: C_STAGED_RECOGNITION_THEN_CORE_LOOP
approved_at: 2026-08-05T21:33+09:00
grill_me_batch: 4_of_10
sync_id: GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
human_execution: NOT_RUN
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
merge_required: false
merge_authorized: false
visual_hx: REQUIRED_NEXT_FOR_STAGE_2_HARNESS
codex: BLOCKED_BY_VISUAL_HX_AND_RUNTIME_HARNESS
```

정본 상태 키:

```text
STAGE_1_RECOGNITION_DIAGNOSTIC
STAGE_2_CORE_LOOP_BRIDGE
SAME_PARTICIPANT_WITH_BREAK
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
HUMAN_EXECUTION_NOT_RUN
RUNTIME_EXPANSION_7_PLUS_BLOCKED
FINAL_ART_AND_CODEX_BLOCKED_UNTIL_REVIEW_GATE
ALL_NUMERIC_THRESHOLDS_ARE_TEST_VALUE
```

## 승인 문장

> 사람·실기기 검증은 같은 참가자가 휴식 구간을 두고 1단계 6종 Recognition 원인 분리 진단을 수행한 뒤, 2단계에서 상황 이해·자원 출처·3×3 회로·Preview·Commit·결과 인지를 연결하는 단계형 혼합 방식으로 진행한다.

## 승인 이유

Recognition만 검증하면 입력 미니게임을 최적화하면서 핵심 재미를 놓칠 수 있다. 반대로 전체 Vertical Slice를 한 번에 검증하면 실패 원인이 입력·의미·회로·콘텐츠 중 어디에 있는지 분리하기 어렵다. 단계형 혼합은 같은 참가자의 입력 문제와 핵심 루프 문제를 연결하되 지표를 분리한다.

## 범위

### 1단계 — Recognition 진단

- 승인된 Runtime 6종만 사용한다.
- 실제 손가락 입력, 좌·우손, 기기 차이, 재시도, 의미 식별, 피로를 관찰한다.
- 첫 시도와 피드백 후 재시도를 별도 집계한다.
- 오인식 승인, stale 결과 저장, 선택 불일치 저장, 중복 저장은 허용하지 않는다.

### 2단계 — 핵심 회로 연결

- 같은 참가자가 휴식 후 짧은 상황 2종을 수행한다.
- 상황·위험 이해 → 의미 선택 → Vault/Stock 출처 선택 → 3×3 회로 → Preview → Commit → 결과·대가 설명을 연결한다.
- 인식 정확도와 상황 판단·회로 판단을 별도 원인으로 기록한다.
- 46–53분 전체 Internal Vertical Slice 대표성 검증을 대체하지 않는다.

정본 경계: `NOT_A_FULL_VERTICAL_SLICE_REPRESENTATIVENESS_PASS`.

## Hard Stop

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
DATA_CORRUPTION_OR_CRASH_ZERO_HARD_STOP
```

Hard Stop 발생 시 2단계 진행 또는 7종 이상 확대를 중단하고 원인 수정 후 재검증한다.

## 진행 경계

- 모든 참가자 수, 시간, 비율, 임계값은 `TEST_VALUE`이며 실제 관측 전 제품 합격 기준이 아니다.
- 사람 실행은 아직 `NOT_RUN`이다.
- 7번째 Runtime 글자는 사람 이해·손 입력·전체 회로 검증 전 추가하지 않는다.
- 최종 아트나 대량 콘텐츠를 먼저 제작하지 않는다.
- Stage 2 최소 Harness용 UX 상태·HX를 검토한 후 Codex 작업으로 넘긴다.
- PR #63은 Draft·미병합을 유지한다.

## 다음 Gate

1. `GLYPH_HUMAN_CIRCUIT_BRIDGE_PROTOCOL.md` 기준으로 최소 Harness UX/HX 상태팩 작성.
2. Codex에서 TDD로 Stage 2 Harness 구현.
3. 사람·실기기 세션 실행 및 원자료 기록.
4. 결과 적대 검토 후 `PROMISING / TUNE / REWORK / STOP` 판정.
