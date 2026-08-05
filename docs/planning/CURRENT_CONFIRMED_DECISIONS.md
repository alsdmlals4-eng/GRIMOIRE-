# GRIMOIRE 현재 확정 결정 스냅샷

## 현재 상태

```yaml
status: USER_APPROVED_CANON_WITH_STAGED_HUMAN_PROTOCOL
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE
latest_approved_decision: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
grill_counter: 4_of_10
pending_decisions: 4
current_gate: HUMAN_CIRCUIT_BRIDGE_PROTOCOL_APPROVED_NOT_RUN
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
merge_authorized: false
```

## 승인 Decision 4종

1. `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`
   - Exact Glyph Vault와 Universal Glyph Stock 분리.
   - 별도 용량·명시적 출처·원자적 Commit·Save/Resume.

2. `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01`
   - 벤치마크·현업 비교·strict RED→GREEN→REFACTOR.
   - 승인 Batch 최대 10건과 고위험 조기 Draft 체크포인트.

3. `GM-GLYPH-VOCABULARY-V1-01`
   - 의미 Registry Main 10·Support 10.
   - Runtime Slice 6종과 사람 검증 전 7종 이상 확대 금지.

4. `GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`
   - 승인안: `C_STAGED_RECOGNITION_THEN_CORE_LOOP`.
   - `STAGE_1_RECOGNITION_DIAGNOSTIC` 후 휴식.
   - 같은 참가자가 `STAGE_2_CORE_LOOP_BRIDGE` 수행.
   - first attempt와 post-feedback를 분리 집계.
   - 짧은 Bridge는 전체 Vertical Slice 대표성 PASS가 아님.
   - 사람·실기기 실행은 `HUMAN_EXECUTION_NOT_RUN`.

## 핵심 재미와 시스템 경계

```text
SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE
조사 → 의미 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

Recognition과 Vault·Stock은 입력·자원 보조 시스템이다. 핵심 검증은 상황·의도·출처·회로·Preview·Commit·결과 인과를 사람이 스스로 연결하는가다.

## 단계형 사람 검증 경계

```text
STAGE_1_RECOGNITION_DIAGNOSTIC
STAGE_2_CORE_LOOP_BRIDGE
SAME_PARTICIPANT_WITH_BREAK
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
NOT_A_FULL_VERTICAL_SLICE_REPRESENTATIVENESS_PASS
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
RUNTIME_EXPANSION_7_PLUS_BLOCKED
FINAL_ART_AND_CODEX_BLOCKED_UNTIL_REVIEW_GATE
ALL_NUMERIC_THRESHOLDS_ARE_TEST_VALUE
```

Spec·적대 검토는 완료됐지만 사람 실행과 Stage 2 Runtime Harness는 미실행이다. 검증용 최소 UX/HX 상태팩을 만든 뒤 Codex TDD로 Harness를 구현한다.

## 현재 Stop Gate

```text
RESOURCE FOUNDATION AUTOMATED = PASS
GLYPH RECOGNITION AUTOMATED = PASS
HUMAN VALIDATION PROTOCOL = APPROVED
HUMAN DEVICE EXECUTION = NOT_RUN
FULL VERTICAL SLICE REPRESENTATIVENESS = NOT_RUN
RUNTIME 7 PLUS = BLOCKED
PR 62 AND 63 MERGE = NOT_AUTHORIZED
```

모든 참가자 수·시간·비율·후보 임계값은 `TEST_VALUE`다.
