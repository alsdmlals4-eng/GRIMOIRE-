# Glyph Human Circuit Bridge Protocol

## 계약

```yaml
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
approved_option: C_STAGED_RECOGNITION_THEN_CORE_LOOP
protocol_status: SPEC_REVIEW_COMPLETE_EXECUTION_NOT_RUN
sync_id: GR-SYNC-20260805-05-GLYPH-HUMAN-CIRCUIT-BRIDGE
evidence_type: HUMAN_PHYSICAL_DEVICE_PLANNED
human_execution: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
all_numeric_thresholds: TEST_VALUE
```

필수 상태 키:

```text
STAGE_1_RECOGNITION_DIAGNOSTIC
STAGE_2_CORE_LOOP_BRIDGE
SAME_PARTICIPANT_WITH_BREAK
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
NOT_A_FULL_VERTICAL_SLICE_REPRESENTATIVENESS_PASS
HUMAN_EXECUTION_NOT_RUN
ALL_NUMERIC_THRESHOLDS_ARE_TEST_VALUE
```

## 검증 질문

1. 실제 손가락 입력에서 6종 글자를 의도대로 선택·저장할 수 있는가?
2. 실패 원인을 인식 입력, 의미 이해, 자원 출처, 회로 문법, Preview 이해 중 하나로 분리할 수 있는가?
3. 인식 과정이 상황 판단과 Commit 책임이라는 핵심 재미를 방해하지 않는가?
4. 결과를 보고 자신이 선택한 의미·회로·대가의 인과관계를 설명할 수 있는가?

## 플랫폼·접근성 기준

```text
ANDROID_TOUCH_TARGET_48DP
IOS_TOUCH_TARGET_44PT
WCAG_2_2_TARGET_SIZE_MINIMUM_24_CSS_PX
NON_DRAG_ALTERNATIVE_REQUIRED
PROJECT_USES_STRICTER_PLATFORM_TARGETS
```

- Android 상호작용 요소는 최소 48dp를 기준으로 한다.
- iOS 상호작용 요소는 최소 44×44pt를 기준으로 한다.
- WCAG 2.2의 최소 Target Size 24×24 CSS px는 웹 접근성 하한으로 참고하되, 본 프로젝트는 모바일 플랫폼 기준인 48dp/44pt를 더 엄격한 기본값으로 사용한다.
- Drag 또는 획 이동만으로 완료되는 조작에는 탭 기반 취소·초기화·후보 선택 등 비드래그 대안을 제공한다.
- 색상만으로 성공·재시도·차단 상태를 구분하지 않는다.

## 참가자·기기 계획 — TEST_VALUE

```yaml
participants: 6
participant_status: TEST_VALUE
required_phone_classes:
  - NARROW_LANDSCAPE_16_9_TO_18_9
  - TALL_LANDSCAPE_19_5_9_TO_20_9
android_physical_devices_minimum: 2
ios_physical_smoke: RECOMMENDED_IF_IOS_TARGET_IS_ACTIVE
hands:
  - DOMINANT
  - NON_DOMINANT
hand_order: COUNTERBALANCED
same_participant_across_stages: true
break_between_stages_minutes: 10
```

6명·2개 기기군은 탐색적 POC용 `TEST_VALUE`다. 통계적 일반화나 출시 합격을 주장하지 않는다. 기기별·손별 결과를 합쳐 약점을 숨기지 않는다.

# Stage 1 — Recognition Diagnostic

## 과제

```yaml
runtime_glyphs: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
warmup_attempts: 2
scored_attempts_per_glyph_per_hand: 2
scored_attempts_per_participant: 24
planned_total_scored_attempts: 144
rest_after_scored_attempts: 12
```

1. 글자의 이름과 의미를 확인한다.
2. 무작위 순서로 해당 글자를 손가락으로 작성한다.
3. 첫 시도 결과를 확정하기 전에 의도한 글자와 후보를 비교한다.
4. Retry가 요구되면 안내를 읽고 한 번 재시도한다.
5. Dominant/Non-dominant hand 순서는 참가자별로 교차 배치한다.
6. 첫 시도와 피드백 후 결과를 별도 기록한다.

## 행동 지표

- first-attempt correct accept rate.
- one-retry inclusive correct rate.
- accepted false count.
- 선택/인식 불일치 저장 수.
- stale 결과 반영 수.
- 중복 Vault 생성 수.
- 글자별·손별·기기별 시도 시간.
- 의미 식별 정확도.
- 재시도 이유 이해 여부.
- 12회·24회 시점 피로 자기보고.

## 탐색적 후보 임계값 — TEST_VALUE

```yaml
first_attempt_correct_accept_candidate: ">= 0.80"
one_retry_inclusive_correct_candidate: ">= 0.95"
semantic_identification_candidate: ">= 0.90"
median_fatigue_five_point_candidate: "<= 3"
accepted_false: 0
stale_application: 0
mismatch_save: 0
duplicate_save: 0
```

이 값들은 실행 전에 조작·측정 형식을 고정하기 위한 후보이며 제품 통과 기준이 아니다. 분포와 실패 원인을 본 후 유지·조정한다.

## Stage 1 Gate

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
```

다음 중 하나면 Stage 2를 중단한다.

- 승인된 오인식 1건 이상.
- stale/mismatch/duplicate 저장 1건 이상.
- 크래시·데이터 손상.
- 진행자가 정답을 알려주지 않으면 과제를 계속할 수 없는 구조적 막힘.

낮은 first-attempt 수치만으로 즉시 중단하지 않고 글자·손·기기별 원인을 분리해 `TUNE` 또는 `REWORK`한다.

# Stage 2 — Core Loop Bridge

## 진입 조건

- Stage 1 Hard Stop이 0건이다.
- 같은 참가자가 최소 10분 휴식한다.
- Stage 1 성적을 참가자에게 순위나 점수로 제시하지 않는다.
- 진행자는 회로 정답이나 최적 해법을 알려주지 않는다.

## Artifact 경계

Stage 2는 전체 46–53분 Internal Slice가 아니라 최소 연결 Harness다. 기존 승인된 3×3 회로·Vault/Stock·Preview/Commit 계약과 Runtime 6종만 사용한다. 새로운 7번째 글자, 최종 아트, 장기 콘텐츠는 추가하지 않는다.

## 상황 2종

### 상황 A — 비전투 보호·조절

- 목표와 보존해야 할 대상을 읽는다.
- 승인된 6종 안에서 적합한 Main/Support 조합을 고른다.
- Exact Vault 또는 Universal Stock 출처를 명시한다.
- 3×3 회로를 구성하고 Preview의 의미·비용·위험을 설명한다.
- Commit 후 변화와 부작용을 설명한다.

### 상황 B — 압박이 있는 현장 대응

- 위협·대상·시간 압박을 확인한다.
- 상황 A와 다른 의미 조합 또는 대상 연결을 사용한다.
- 인식 Retry가 발생해도 상황 정보를 잃지 않는지 확인한다.
- Commit 결과와 대가를 Grimoire 요약으로 회상한다.

구체적 글자 조합은 의미 Registry의 Main/Support 타입 검사를 통과하는 Fixture로 구성하며 한 가지 정답을 강요하지 않는다.

## 행동 지표

- 목표·위협 첫 회상.
- Commit 전 의도·의미 설명.
- Vault/Stock 출처 선택 정확성.
- 회로 문법 유효성.
- Preview 비용·위험 이해.
- 취소·재작성·후보 수정 횟수.
- accidental commit count.
- 결과와 선택의 인과관계 회상.
- Recognition이 핵심 판단을 방해한 구간.
- 진행자 개입 전/후 결과 분리.

## 탐색적 후보 임계값 — TEST_VALUE

```yaml
participants_explaining_intent_before_commit_candidate: ">= 5_of_6"
participants_selecting_explicit_source_candidate: ">= 5_of_6"
participants_explaining_consequence_candidate: ">= 5_of_6"
accidental_commit: 0
duplicate_cost_or_result: 0
moderator_solution_prompt: 0
```

```text
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
```

## 결과 분류

- `PROMISING`: 입력과 핵심 판단이 구분되며 핵심 인과를 대부분 스스로 설명.
- `TUNE`: 구조는 이해하지만 일부 글자·기기·문구·Target에서 반복 마찰.
- `REWORK`: 인식 문제와 회로 문제를 구분하지 못하거나 Preview가 선택을 설명하지 못함.
- `STOP`: 오인식 승인, accidental Commit, 중복 비용·결과, 손상 저장, 안전·접근성 중대 실패.

## 증거 기록

- 참가자 익명 ID.
- 기기·해상도·OS·손 입력 조건.
- 원시 시도 행과 이벤트 시간.
- 첫 시도/피드백 후 결과.
- 진행자 개입 시각과 내용.
- Stage별 자기보고.
- 개인식별정보 없는 화면 녹화 또는 이벤트 로그.
- 문제별 재현 단계와 Artifact SHA.

실행 결과가 생기기 전까지 모든 Human/Device 상태는 `NOT_RUN`이다.

## 후속 Gate

```text
RUNTIME_EXPANSION_7_PLUS_BLOCKED
FINAL_ART_AND_CODEX_BLOCKED_UNTIL_REVIEW_GATE
```

Spec·적대 검토 완료 후 Stage 2 Harness용 최소 UX/HX 상태팩을 작성한다. 그 상태팩이 승인되기 전 Codex 구현을 시작하지 않는다. 사람 결과 검토 전 7종 이상 확장과 PR #63 병합을 허용하지 않는다.
