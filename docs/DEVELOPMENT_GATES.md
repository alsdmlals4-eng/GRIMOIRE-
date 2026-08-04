# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
closure_pull_request: 60
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
canon_status: MERGED_AND_FINALIZED_SHEET_READBACK_PASS
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

PR #57 결정 병합, PR #58 finalization, PR #59 Sheet Readback은 완료됐다. PR #60은 완료 상태 기록만 수행한다.

## Gate 0 — 정본 복원

상위 포인터·Registry·Batch·Sheet가 `a27b75ea… / Sync 12 / Decision / Grill 0`을 가리킨다. 구형 파일 상태 분류가 완료됐다.

현재: `PASS`.

## Gate 1 — 핵심 재미

```text
조사 → 의도 선택 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — 3×3 회로

메인 1, 인접 8방향 연결, 교차·건너뛰기 금지, 모든 노드 도달 가능, Slice 대상 끝점, 숨은 위치 보너스 금지.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — Stock·마나·필사

Typed glyph Stock, 대상·연결선 비용 0, 모든 주문 마나 사용, Stock/필사 용량 예약, 완성 주문 원터치 경로 없음, 집중 중 Active Pressure·실시간 마나 비용 유지.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 4 — 모바일 UX·접근성

노드 역할·인접 연결·오류 이유·대상 Tray·필사 중 HP/마나/적 의도·텍스트 배율·Safe Area를 Wireframe과 실기기에서 검증한다.

현재: `WIREFRAME_NEXT / DEVICE_NOT_RUN`.

## Gate 5 — 콘텐츠·서사

Frostbloom 복수 해결, 선택지=의도, 교수 예시 비정답, 조사·관찰의 성공률·결말 비공개.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 6 — 개발환경

Godot `4.7.1.stable` 계약 테스트·실제 다운로드·headless probe는 CI에서 성공했다. 제품 프로젝트·Runtime 증거는 없다. SHA-256 고정 검증은 `[보류/비차단]`이다.

현재: `TOOLCHAIN_PASS / PRODUCT_NOT_STARTED`.

## Gate 7 — 정본 병합·Readback

```text
PR57 decision merge: 839129524ba14279141add809fb400383949d5ea
PR58 finalization: 39da99fbc56ccdf90904b24b5725cb0d0779595a
PR59 sheet readback: a27b75ea9aabcbb84159356b857e22b3acd30a43
PR60 closure: exact HEAD 검증 후 병합
```

현재: `PASS_PENDING_ADMIN_CLOSURE_PR60`.

## 다음 작업

3×3 Mobile Landscape Wireframe → 집중 필사 Overlay → Frostbloom UX Map → Art Direction·Asset Brief → Codex 계획.
