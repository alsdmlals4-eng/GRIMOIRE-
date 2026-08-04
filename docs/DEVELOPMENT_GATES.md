# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
updated_at: 2026-08-04T09:37+09:00
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 5_of_10
pending_decisions: 5
merge_authorization: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

과거 `FAIL_CLOSED_REMEDIATION_REQUIRED`, `Stage 0`, `Codex BLOCKED` 상태는 현재 게이트가 아니다. 개발환경 설치·CI probe는 완료됐지만 제품 Godot 프로젝트는 아직 없다.

## Gate 0 — 정본 복원

통과 조건:

- `AGENTS.md`, `START_HERE.md`, `ACTIVE_CONTEXT.md`가 같은 Decision·Sync를 가리킨다.
- `CANON_STATUS_INDEX_2026-08-04.md`가 구형 문서를 `[대체됨]·[보류]·[폐기]·[이력]`으로 분류한다.
- `DESIGN_DOCUMENT_REGISTRY.json`이 최신 활성 문서를 라우팅한다.

현재: `PASS_PENDING_FINAL_MERGE_READBACK`.

## Gate 1 — 핵심 재미·문법

```text
상황 조사
→ 해결 의도 선택
→ 3×3 글자·대상 노드 배치
→ 인접 방향 연결
→ Preview
→ Commit
→ 결과·대가 복기
```

통과 조건:

- 전투와 비전투가 같은 주문 문법을 쓴다.
- 교수 예시가 정답·채점키가 아니다.
- 글자 Stock이 반복 입력만 줄이고 대상·배치 판단을 대신하지 않는다.
- 집중 필사는 선택 기능이며 기본 전투에 필수가 아니다.

현재: `PLANNING_PASS / RUNTIME_NOT_RUN`.

## Gate 2 — 3×3 회로 안전성

통과 조건:

```yaml
main_glyph: exactly_1
edge_rule: adjacent_8_neighbor_only
crossing_edges: prohibited
skip_connection: prohibited
all_nodes_reachable: required
slice_target_nodes: terminal_leaf
hidden_position_bonus: prohibited
```

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — Stock·집중 필사 원자성

통과 조건:

- 글자 Stock 배치 예약과 Commit 소비가 Exactly-once다.
- 대상·연결선은 Stock을 쓰지 않는다.
- 필사 진입 시 용량 1칸을 예약한다.
- 자연충전이 필사 예약칸을 침범하지 않는다.
- 집중 중 Active Pressure가 0이 아니고 마나는 실제 시간으로 감소한다.
- 완성 주문 원터치 Stock 경로가 없다.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — 모바일 UX·접근성

통과 조건:

- 메인·보조·대상 노드가 색 없이 구분된다.
- 인접 연결 가능 셀과 잘못된 연결 이유가 읽힌다.
- 집중 필사 중 HP·마나·적 의도·시간 상태가 유지된다.
- 보정·가이드 입력이 위력 차별을 만들지 않는다.
- 텍스트 배율 `1.00`, `1.30`, Android 최대값에서 검증한다.

현재: `WIREFRAME_NEXT / DEVICE_NOT_RUN`.

## Gate 5 — 콘텐츠·서사

통과 조건:

- 서리꽃 온실에서 시설 복구·구조·정령 안정화·봉쇄·제압과 합리적 미등록 해결이 가능하다.
- 선택지는 의도만 정하고 주문을 자동 선택하지 않는다.
- 조사·관찰은 원리·정답·성공률·결말을 설명하지 않는다.
- 치명 위험 외 교수 직접 개입은 없다.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 6 — 개발환경

현재 증거:

- Godot `4.7.1.stable` 설치 도구·검증 스크립트.
- CI headless probe와 export template probe.
- 최신 PR HEAD에서 Toolchain workflow 성공 필요.

한계:

- 제품 `project.godot` 없음.
- 모바일·성능·접근성 Runtime 증거 없음.
- 공식 HTTPS 다운로드 SHA-256 고정 검증은 `[보류/비차단]`.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 7 — PR 병합

병합 전 필수:

1. PR 전체 변경 파일 검토.
2. P0/P1 문서 충돌 해소.
3. 구형 파일 상태 색인 완료.
4. GitHub·Sheet 동일 Decision ID Readback.
5. 최신 HEAD CI 전부 성공.
6. 미해결 Review Thread 0.
7. 사용자 병합 승인.

현재 사용자 승인:

```yaml
merge_trigger: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
merge_authorized: true
```

PR #57 병합 뒤 별도 finalization PR에서 main 포인터·Batch reset·Sheet readback을 확정한다.

## 현재 다음 작업

```text
PR #57 정본 감사 완료
→ 최신 HEAD CI·Review 검증
→ PR #57 병합
→ main finalization/readback
→ 3×3 Mobile Landscape Wireframe
→ Frostbloom UX Map·Art Direction
→ 선택 범위 Codex 구현 계획
```

## 금지

- 제품 구현 없이 Runtime PASS 주장.
- Draft/Working/과거 Sync를 현재 정본으로 사용.
- 완성 주문 원터치 Stock 재도입.
- 집중 필사 완전 Pause.
- 그림 실력에 위력 보너스.
- 교수 예시를 정답·자동 회로로 사용.
