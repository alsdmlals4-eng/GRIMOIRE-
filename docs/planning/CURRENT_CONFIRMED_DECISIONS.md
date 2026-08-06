# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_WITH_WORKING_DESIGN_OVERLAY
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
validation_merge_commit: 292d2b850b38945e404f81dbcf209220067729d2
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_design_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
working_branch: agent/spell-workflow-ui-v2-design
working_pull_request: 78
written_spec_review: REQUIRED_BEFORE_IMPLEMENTATION_PLAN
canon_status: SYNCED_TO_WORKING_BRANCH_PENDING_MERGE
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS_UI_V2_NOT_STARTED
runtime_validation: AUTOMATED_HEADLESS_PASS_EXISTING_RUNTIME_ONLY
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 보존되는 Runtime

`FIVE_POINT_STAR`, 중앙 Main 1개, Auxiliary 0~5개, 글자별 숙련도, Typed Glyph Stock, 명시 Preview, Exactly-once 자원 처리를 유지한다.

## 새 주문 3단계 결정

`GM-SPELL-WORKFLOW-UI-V2-01`은 주문 UX를 다음으로 분리한다.

```text
1. 글자 그리기 → 인식·획득·보관함 저장
2. 회로 배치 → 보관함/스톡 예약·Preview·글자 소비·완성 주문 생성
3. 주문 사용 → 대상 선택·상세 예상 결과·마나 소비·실제 판정
```

- 사건 상태를 누르면 문제·위험·필요 대응 방향·관찰 키워드 Overlay를 표시한다.
- 보관함과 스톡은 같은 수를 준비하며 각각 최대 5개다.
- 핵심 글자: 열·흐름·보호·냉각·수복.
- 보조 글자: 집중·분산·안정·지속·증폭.
- 공통 경제 재화는 금화, 주문 사용 비용은 마나만 사용한다.
- 마나는 예상 비용 영역에 한 번만 표시한다.
- 2단계 기본 성공률과 3단계 대상 적용 최종 성공률을 구분한다.

상세 정본은 `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`와 `docs/planning/SPELL_WORKFLOW_UI_V2_01_APPROVAL_2026-08-06.md`다.

## 대체 관계

이 결정은 기존 별형 Runtime의 다음 흐름을 대체한다.

```text
기존: 회로 Preview → 같은 화면 Target → Final Preview → Commit·마나 소비
신규: 회로 Preview → 주문 확정·글자 소비 → 별도 사용 화면 Target → 마나 소비·실제 판정
```

## 검증 경계

작성된 설계는 사용자 방향 승인 상태지만 구현 계획 전 문서 검토가 필요하다. 3단계 UI v2 코드·Scene·자동 테스트·실기기·사람 검증은 아직 실행하지 않았다.
