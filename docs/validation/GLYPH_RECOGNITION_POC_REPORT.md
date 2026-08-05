# Glyph Recognition POC Validation Report

## 상태

```yaml
decision_id: GM-GLYPH-VOCABULARY-V1-01
implementation_pull_request: 63
parent_resource_pull_request: 62
parent_design_pull_request: 61
validated_code_head: 9518d88a745eee68a041c3057d74a0d5e7f4120f
foundation_workflow: 30976345733
planning_and_adversarial_workflow: 30976345740
godot_toolchain_workflow: 30976345725
status: SIX_GLYPH_RECOGNITION_AUTOMATED_PASS
runtime_expansion_beyond_six: BLOCKED
merge_authorized: false
synthetic_fixture_validation: PASS
physical_touch: NOT_RUN
left_right_hand_parity: NOT_RUN
human_meaning_comprehension: NOT_RUN
draw_fatigue: NOT_RUN
accessibility_assistive_technology: NOT_RUN
```

## 구현 범위

이번 POC는 승인된 20종 의미 사전을 등록하되 다음 6종에만 Runtime 템플릿과 인식 경로를 제공한다.

```text
HEAT
PROTECT
FLOW
FOCUS
DISPERSE
BURST
```

구현된 경계는 다음과 같다.

- 불변 `GlyphDefinition`과 10 Main + 10 Support Registry.
- 장식 정보를 인식 입력에서 제외한 6개 기본 실루엣 템플릿.
- 64점 재표본화·이동·크기 정규화를 수행하는 `$1` 기준선.
- 1–3획만 허용하고 최대 48개 획 순서·방향 변형을 템플릿 컴파일 때 캐시하는 `$N` 기준선.
- 글자별 최저 거리, 점수 임계치, 1·2위 차이, 입력 revision을 사용하는 결정적 후보 서비스.
- 낮은 확신·후보 혼동·오래된 revision·선택 글자 불일치의 자동 확정 금지.
- 성공할 때만 선택한 정확한 `glyph_id`의 보관함 슬롯을 완료하는 Focus Scribe Coordinator.
- 인식 결과로 범용 Stock을 생성하지 않는 경계.
- 상태를 색상이나 숫자 확률에만 의존하지 않는 읽기 전용 View Model.
- Landscape Safe Area·48dp 조작 영역·Objective/Threat/Situation 유지의 자동 Layout POC.

## TDD 결과

| 작업 | RED | GREEN |
|---|---:|---:|
| 20종 Registry·6종 Runtime 경계 | `30972468605` | `30972768931` |
| 6종 템플릿 Repository | `30972951468` | `30973230566` |
| `$1` 기하 기준선 | `30973475338` | `30973768417` |
| 제한형 `$N` 획 변형 | `30974053672` | `30974147480` |
| 후보·임계치·revision Gate | `30974453776` | `30974706440` |
| Exact Vault 연계 | `30974926939` | `30975028280` |
| Confusion Report Builder | `30975154410` | `30975222215` |
| 합성 Fixture 통합 | 초기 타입 오류 후 `30975487058` GREEN |
| 접근성 View Model·Layout | `30975690539` RED | `30975873369` GREEN |
| 6종 Scope Checker | `30976086143` RED | `30976345733` GREEN |

초기 구현 중 다음 테스트 기반 결함도 닫았다.

- 누락 Script가 정적 `preload`로 Runner를 멈추는 문제.
- 동적 호출 반환값의 GDScript 타입 추론 오류.
- `Godot | tee`가 테스트 exit code를 숨기던 Workflow 결함. 최종 Workflow는 `set -o pipefail`을 사용한다.
- 기획 전용 Gate가 승인된 Recognition 하위 PR을 오탐 차단하던 문제.
- 재시도 상태의 가장 가까운 후보가 confusion matrix의 승인 결과처럼 집계되던 문제.

## exact-head 자동화 증거

```yaml
resource_scope:
  verdict: PASS
  required_files: 31
  scanned_gdscript_files: 22
  errors: 0
vocabulary_scope:
  verdict: PASS
  semantic_entries: 20
  main: 10
  support: 10
  runtime_glyphs: 6
  runtime_templates: 6
  scanned_recognition_files: 19
  prohibited_roots_checked: 3
  prohibited_dependency_tokens_checked: 10
  errors: 0
headless:
  suites: 19
  assertions: 913
  failures: 0
planning_gate: PASS
adversarial_gate: PASS
godot_version: 4.7.1.stable.official.a13da4feb
```

Evidence Artifact:

```yaml
artifact_id: 8918389544
artifact_sha256: 3988e106b505a5e4bc0ee6ed59702b82fd0f896e8adca9eeb812615a246f30c2
```

## 합성 Fixture 결과

사전등록 값:

```yaml
confidence_threshold: 0.80
margin_threshold: 0.10
evidence_scope: SYNTHETIC_FIXTURES_ONLY
```

결과:

```yaml
fixture_rows: 11
accepted_correct_rows: 7
accepted_false_rows: 0
retry_required_rows: 4
known_glyph_false_reject_rows: 1
fixture_first_attempt_match_rate: 0.875
confusion_matrix_scope: ACCEPTED_RESULTS_ONLY
median_recognition_us: 1712
```

승인된 결과만 집계한 6×6 confusion matrix는 모두 대각선이다.

| expected \ accepted | HEAT | PROTECT | FLOW | FOCUS | DISPERSE | BURST |
|---|---:|---:|---:|---:|---:|---:|
| HEAT | 2 | 0 | 0 | 0 | 0 | 0 |
| PROTECT | 0 | 1 | 0 | 0 | 0 | 0 |
| FLOW | 0 | 0 | 1 | 0 | 0 | 0 |
| FOCUS | 0 | 0 | 0 | 1 | 0 | 0 |
| DISPERSE | 0 | 0 | 0 | 0 | 1 | 0 |
| BURST | 0 | 0 | 0 | 0 | 0 | 1 |

`median_recognition_us`는 GitHub Actions의 작은 합성 fixture 실행 참고값이다. 실제 모바일 프레임 시간·입력 지연·배터리·발열을 증명하지 않는다.

## 적대적 검토

자동화로 차단한 실패 조건:

1. 나머지 14종에 Runtime 템플릿을 추가하는 변경.
2. ML·Cloud·훈련 데이터 의존성 도입.
3. 장식 요소를 인식 입력에 포함.
4. 4획 이상 입력이나 48개를 넘는 템플릿 변형 생성.
5. 낮은 확신·혼동 입력의 자동 확정.
6. 오래된 revision 후보의 보관함 생성.
7. 선택한 글자와 다른 후보가 보관함 슬롯을 채우는 동작.
8. 성공 중복 처리로 보관함 글자를 두 번 생성.
9. Focus Scribe 성공이 범용 Stock을 생성하는 동작.
10. 문양 입력 패널이 Objective·Threat·Situation을 가리거나 48dp 미만 조작 영역을 만드는 배치.
11. 숫자 성공 확률이나 자동 해법을 UI에 노출.
12. 합성 fixture 결과를 사람·실기기 검증으로 승격.

## 증거 한계

- 6종 기본 실루엣과 소수의 개발자 합성 변형만 검증했다.
- 실제 사용자 필체 분산, 손떨림, 왼손·오른손 차이, 화면 크기별 터치 오차는 검증하지 않았다.
- 실제 모바일 기기 성능·배터리·발열·프레임은 `NOT_RUN`이다.
- 사람의 의미 추론, 문양 간 시각 구분, 반복 필사 피로도는 `NOT_RUN`이다.
- 스크린리더·스위치 입력·확대 기능과 같은 보조기술 검증은 `NOT_RUN`이다.
- 템플릿과 임계치는 POC `TEST_VALUE`이며 제품 밸런스 값이 아니다.
- 최소 Scene은 자동 Layout 계약 확인용이며 최종 3×3 주문 화면이나 최종 아트가 아니다.

## 결론

```text
SIX-GLYPH RECOGNITION AUTOMATED GATE = PASS
HUMAN/PHYSICAL DEVICE SESSION = READY_NOT_STARTED
RUNTIME EXPANSION BEYOND SIX = BLOCKED
PR #63 MERGE = NOT_AUTHORIZED
```
