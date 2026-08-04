# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
updated_at: 2026-08-04T09:37+09:00
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
finalization_pull_request: 58
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

과거 `FAIL_CLOSED_REMEDIATION_REQUIRED`, `Stage 0`, `Codex BLOCKED`는 현재 상태가 아니다. 개발환경 CI는 통과했지만 제품 Godot 프로젝트는 아직 없다.

## Gate 0 — 정본 복원

통과 조건:

- 상위 포인터가 main SHA와 `GR-SYNC-20260804-10-MAIN`을 가리킨다.
- 구형 파일이 상태 색인에서 분류된다.
- Registry와 Sheet가 같은 Decision·Batch를 가리킨다.

현재: `PASS_PENDING_PR58_AND_EXACT_SHA_READBACK`.

## Gate 1 — 핵심 재미

```text
조사 → 의도 선택 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

- 전투·비전투가 같은 문법.
- 선택지는 의도만 확인.
- 교수 예시는 정답이 아님.
- 글자 Stock은 반복 입력만 대체.
- 필사는 기본 전투 필수가 아님.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — 3×3 회로

```yaml
main: exactly_1
edge: adjacent_8_neighbor_only
crossing: prohibited
skip_connection: prohibited
all_nodes_reachable: required
targets: terminal_leaf_in_slice
hidden_position_bonus: prohibited
```

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — Stock·마나·필사 원자성

통과 조건:

- 글자 Stock 예약·취소·Commit Exactly-once.
- 대상·연결선 Stock 비용 0.
- 모든 주문 Commit은 마나 사용.
- 필사 진입 시 용량 1 예약.
- 자연충전이 예약칸을 침범하지 않음.
- 완성 주문 원터치 경로 없음.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — 모바일 UX·접근성

통과 조건:

- 노드 역할이 색 없이 구분됨.
- 인접 연결과 오류 이유가 읽힘.
- 필사 중 HP·마나·적 의도·시간 상태 유지.
- 보정 입력에 성능 차별 없음.
- 텍스트 배율·Safe Area·터치 검증.

현재: `WIREFRAME_NEXT / DEVICE_NOT_RUN`.

## Gate 5 — 콘텐츠·서사

통과 조건:

- Frostbloom 복수 해결과 미등록 합리적 해결 허용.
- 조사·관찰은 정답·성공률·결말을 설명하지 않음.
- 교수는 치명 위험 외 핵심 목표를 대신 해결하지 않음.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 6 — 개발환경

증거:

- Godot `4.7.1.stable` 도구 계약 테스트.
- 실제 engine·export template 다운로드 검증.
- headless probe.

한계:

- 제품 `project.godot` 없음.
- 모바일·성능·접근성 Runtime 증거 없음.
- 다운로드 SHA-256 고정 검증은 `[보류/비차단]`.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 7 — Main finalization

```text
PR57 merged at 839129524ba14279141add809fb400383949d5ea
→ PR58 pointer/reset finalization
→ exact HEAD CI 3종
→ Review Thread 0
→ Sheet reset Readback
→ PR58 merge
→ exact finalization SHA Sheet-readback PR
```

현재: `PR58_IN_PROGRESS`.

## 다음 작업

```text
finalization 완료
→ 3×3 Mobile Landscape Wireframe
→ 집중 필사 Overlay
→ Frostbloom UX Map
→ Art Direction·Asset Brief
→ 선택 범위 Codex 구현 계획
```

## 금지

- 제품 구현 없이 Runtime PASS 주장.
- Draft·Working·과거 Sync를 현재 정본으로 사용.
- 완성 주문 원터치 Stock.
- 집중 필사 완전 Pause.
- 그림 위력 보너스.
- Stock 주문 무마나 실행.
- 교수 예시 정답화.
