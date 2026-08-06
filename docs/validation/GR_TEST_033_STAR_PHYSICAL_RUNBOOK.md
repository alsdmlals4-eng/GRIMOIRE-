# GR-TEST-033 Star Physical Runbook

```yaml
gate_id: GR-TEST-033
runtime: FIVE_POINT_STAR
stock: TYPED_GLYPH_ONLY
participants: P01_TO_P06_TEST_VALUE
execution_status: NOT_RUN
```

## 1. 실행 전

1. `docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md`의 기기별 점검을 완료한다.
2. 개인식별정보를 수집하지 않고 `P01`~`P06` 익명 ID만 사용한다.
3. Main Scene `res://src/ui/star_circuit_harness.tscn`을 연다.
4. 참가자에게 조작법은 설명하되 해결 회로·Best Route·정답 glyph는 말하지 않는다.
5. 각 과업의 `FIRST_ATTEMPT`와 `POST_FEEDBACK_RETRY`를 별도 레코드로 저장한다.

## 2. 과업 순서

### SIMPLE_ZERO_AUX

Main glyph만 배치하고 Circuit Preview→Target Keyword→Final Preview→명시 Commit을 수행한다. 참가자가 두 Preview의 차이와 Commit 전 무변이를 설명하는지 기록한다.

### MULTI_AUX

Auxiliary 2개 이상을 사용한다. Mastery·Complexity·Mana Breakdown과 cause glyph warning을 읽을 수 있는지 기록한다.

### TYPED_STOCK_MISMATCH

다른 glyph_id Stock으로 대체를 시도한다. 차단 사유를 이해하는지, 올바른 같은 glyph Stock 또는 Vault로 복구하는지 기록한다.

### FOCUS_COMPLETE

집중 필사를 완료한다. 실제 시간 Mana 소비, 선택한 같은 glyph Stock +1, 공유 용량을 사전에 이해했는지 기록한다.

### FOCUS_CANCEL

집중 필사를 중단한다. Stock 생성 0과 이미 소비한 시간·Mana 무환불을 예측하고 설명하는지 기록한다.

### FROSTBLOOM_MULTI_SOLUTION

교수 예시를 정답으로 고정하지 않고 서로 다른 합리적 해결 의도 두 개 이상을 제시한다. 시설 복구·생명 구조·정령 안정화·봉쇄 철수·제압 시간 확보·합리적 미등록 해결 중 어느 의도를 선택했는지 기록하되 `NO_BEST_ROUTE_RECOMMENDATION`을 유지한다.

## 3. 측정 항목

- task_completed
- preview_understood
- result_cause_explained
- target_keyword_understood
- commit_control_understood
- typed_stock_rule_understood
- first_attempt_seconds
- retry_seconds
- moderator_intervention_count
- accidental_commit_count
- frame_time_p95_ms
- screen_reader_blocker
- finger_occlusion_blocker
- fatigue_reported

모든 시간·비율 임계값은 `TEST_VALUE`이며 제품 확정값이 아니다.

## 4. Hard Stop

다음 중 하나라도 발생하면 해당 세션의 분류는 `STOP`이다.

```text
ACCIDENTAL_COMMIT
MUTATION_BEFORE_COMMIT
DUPLICATE_COST_OR_RESULT
CROSS_GLYPH_STOCK_SUBSTITUTION
HIDDEN_EXTRA_MANA
RANDOM_UNPREVIEWED_TARGET
CRITICAL_SCREEN_READER_BLOCKER
MODERATOR_SOLUTION_PROMPT
PII_PRESENT
```

## 5. 증거 봉인

1. Attempt JSON의 `records`만 canonical sorted compact JSON으로 직렬화해 SHA-256을 계산한다.
2. Observation JSON도 같은 방식으로 계산한다.
3. Session에 각 SHA-256과 레코드 수를 기록한다.
4. 아래 명령으로 검증·분석한다.

```bash
python tools/analyze_gr_test_033.py \
  --session session.json \
  --attempts attempts.json \
  --observations observations.json \
  --output result.json
```

5. Analyzer 오류가 하나라도 있으면 원시 파일을 수정하지 말고 새 버전으로 다시 봉인한다.

## 6. 판정 경계

`PENDING_NOT_RUN / PROMISING / TUNE / REWORK / STOP`만 사용한다. `PROMISING`은 Human PASS·출시 준비 완료·Full Vertical Slice 대표성을 뜻하지 않는다. 실제 결과가 없으므로 현재 상태는 `NOT_RUN`이다.
