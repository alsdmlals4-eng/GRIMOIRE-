# Glyph Resource Foundation POC Validation Report

## 상태

```yaml
decision_id: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
related_decisions:
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
implementation_pull_request: 62
parent_design_pull_request: 61
validated_code_head: 8071bb395e79749900612773466ba002c6be59cc
evidence_head: aa0c3dd8fba4bc7cf581ab7644901c3791ab804a
sync_id: GR-SYNC-20260805-03-GLYPH-RESOURCE-POC
status: RESOURCE_FOUNDATION_POC_AUTOMATED_PASS
sheet_readback: PASS
merge_authorized: false
recognition_implementation: NOT_STARTED
physical_device: NOT_RUN
accessibility_human: NOT_RUN
```

## 구현 범위

이번 POC는 완성 게임 화면이 아니라 다음 자원 생명주기만 구현한다.

- `Exact Glyph Vault` 슬롯과 집중 필사 예약·완료·중단.
- `Universal Glyph Stock` 별도 용량·예약·해제·정확히 한 번 소비.
- 명시적 자원 출처 선택과 실패한 출처 교체 롤백.
- 단일 범용 자연충전 진행도·피격 정지·용량 대기.
- 주문 자원·마나·결과의 원자 Commit과 실패 롤백.
- 예약 중 저장·복원과 재개 후 exactly-once Commit.
- UI가 도메인을 변경하지 못하는 읽기 전용 View Model.
- 금지 루트와 폐기된 자원 계약을 막는 Scope Checker.

## TDD 결과

각 작업은 누락 파일 또는 누락 계약으로 RED를 먼저 확인하고 최소 GREEN을 구현했다.

| 작업 | RED | GREEN |
|---|---:|---:|
| 공통 자원 타입 | `30960857007` | `30961096498` |
| 범용 Stock | `30961213709` | `30961375056` 이후 회귀 지속 |
| Exact Vault | `30961638188` | `30961753266` |
| 명시적 출처 Ledger | `30962347231` | `30962478106` |
| 단일 자연충전 | `30962589080` | `30962659285` |
| 결과 exactly-once | `30962856483` | `30962906654` |
| 원자 Commit | `30963048312` | `30963314448` |
| 저장·복원 | `30963559676` | `30963669342` |
| 읽기 전용 View Model | `30963808534` | `30964030448` |
| Scope Checker | `30964156327` | `30964231711` |

## 최신 자동화 증거

```yaml
foundation_workflow: 30964676191
headless:
  suites: 10
  assertions: 225
  failures: 0
scope:
  required_files: 31
  scanned_gdscript_files: 12
  forbidden_root_errors: 0
  forbidden_token_errors: 0
planning_and_adversarial_workflow: 30964676130
planning_result: PASS
adversarial_result: PASS
godot_toolchain_workflow: 30964676128
godot_version: 4.7.1.stable.official.a13da4feb
toolchain_result: PASS
sheet_ranges: 7
sheet_readback: PASS
```

손상된 main Save는 이전 valid backup으로 복구하며, 손상 JSON은 자동 수정하거나 덮어쓰지 않는다. 테스트 로그에는 의도된 손상 파일이 엔진 오류처럼 출력되지 않도록 비투척형 파서를 사용했다.

## 적대적 검토

다음 실패 조건을 자동 테스트로 차단했다.

1. 범용 Stock 또는 보관함 자원의 중복 생성·중복 소비.
2. 보관함 글자를 다른 `glyph_id`로 변환.
3. 보관함·Stock 출처를 시스템이 자동 선택.
4. 예약이 자원 용량을 추가 차감.
5. 마나 없이 주문 Commit.
6. 대상·예약·마나 사전검증 실패 후 상태 변경.
7. 결과 적용 실패 후 자원·마나·예약 손실.
8. 앱 재개 후 동일 transaction 재적용.
9. 최종 콘텐츠·ML·폐기된 typed Stock 계약의 재도입.
10. 승인된 하위 구현 PR을 기획 전용 Gate가 오탐 차단.

## 증거 한계

- Godot Headless Domain POC만 검증했다.
- 실제 3×3 회로 UI·터치·Safe Area는 구현하지 않았다.
- 문양 그리기와 인식은 시작하지 않았다.
- 실제 모바일 기기, 배터리, 발열, 프레임, 접근성 보조기술, 사람 플레이테스트는 `NOT_RUN`이다.
- Stock 용량·충전 시간·마나 수치는 모두 `TEST_VALUE`다.
- `tools/setup_godot_toolchain.py`의 과거 고정 필드 `product_project_created: false`는 도구 설치 보고용이며, 이 PR에 존재하는 최소 `project.godot` 상태를 판정하는 권위가 아니다.

## 결론

```text
RESOURCE FOUNDATION AUTOMATED GATE = PASS
RECOGNITION POC = READY FOR A SEPARATE IMPLEMENTATION CHECKPOINT, NOT STARTED
PR #62 MERGE = NOT AUTHORIZED
```
