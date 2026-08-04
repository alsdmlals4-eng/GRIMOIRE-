# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
main_authority_commit: 39da99fbc56ccdf90904b24b5725cb0d0779595a
current_main_sync: GR-SYNC-20260804-11-MAIN-READBACK
sheet_readback_pull_request: 59
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

PR #57 결정 병합과 PR #58 main finalization은 완료됐다. 현재는 PR #59 exact SHA·Sheet Readback을 닫는 단계다.

## Gate 0 — 정본 복원

통과 조건:

- 상위 포인터가 `39da99fb…`와 Sync `11`을 가리킴.
- 구형 파일 상태 분류 완료.
- Registry·Batch·Sheet 동일.

현재: `PASS_PENDING_PR59_MERGE_AND_POSTMERGE_SHEET_HISTORY`.

## Gate 1 — 핵심 재미

```text
조사 → 의도 선택 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — 3×3 회로

```yaml
main: exactly_1
edge: adjacent_8_neighbor_only
crossing_or_skip: prohibited
all_nodes_reachable: required
targets: terminal_leaf_in_slice
hidden_position_bonus: prohibited
```

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — Stock·마나·필사

- Typed glyph Stock만 사용.
- 대상·연결선 Stock 비용 0.
- 모든 주문 Commit은 마나 사용.
- 필사 진입 시 용량 1 예약.
- 완성 주문 원터치 Stock 없음.
- 집중 중 Active Pressure·실시간 마나 비용 유지.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — 모바일 UX·접근성

- 색 없이 노드 역할 구분.
- 인접 연결과 오류 이유 표시.
- 필사 중 HP·마나·적 의도·시간 상태 유지.
- 보정 입력 성능 차별 금지.

현재: `WIREFRAME_NEXT / DEVICE_NOT_RUN`.

## Gate 5 — 콘텐츠·서사

- Frostbloom 복수 해결과 미등록 해결 허용.
- 선택지는 의도만 확인.
- 교수 예시는 정답이 아님.
- 조사·관찰은 성공률·결말을 설명하지 않음.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 6 — 개발환경

Godot `4.7.1.stable` 계약 테스트·실제 다운로드·headless probe는 CI에서 성공했다. 제품 `project.godot`과 Runtime 검증은 없다. SHA-256 고정 검증은 `[보류/비차단]`이다.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 7 — 최종 Readback

```text
PR57 merged: 839129524ba14279141add809fb400383949d5ea
PR58 merged: 39da99fbc56ccdf90904b24b5725cb0d0779595a
→ PR59 exact HEAD CI·Review·Sheet Readback
→ PR59 merge
→ 실제 PR59 merge SHA를 Sheet 변경 이력에 기록
```

현재: `PR59_IN_PROGRESS`.

## 다음 작업

3×3 Mobile Landscape Wireframe → 집중 필사 Overlay → Frostbloom UX Map → Art Direction·Asset Brief → Codex 계획.
