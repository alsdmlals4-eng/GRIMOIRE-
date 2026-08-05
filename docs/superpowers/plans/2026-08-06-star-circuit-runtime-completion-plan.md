# 별형 회로 Runtime Completion 구현 계획 — 2026-08-06

```yaml
status: EXECUTED_IN_PR_69
mode: TEST_FIRST
branch: agent/star-circuit-runtime-godot-poc
base: main
local_engine: Godot_4.7.1
LOCAL_GODOT: READY_AFTER_MERGE
MOBILE_DEVICE_NOT_RUN: true
HUMAN_NOT_RUN: true
```

## 목표

승인된 별형 회로 정본을 실제 Godot Runtime·Low-fi 모바일 Harness·Typed Stock·집중 필사·결과 판정·Frostbloom 다중 해결 Fixture로 연결하고, 로컬 Godot에서 한 명령으로 테스트와 Editor 실행이 가능하게 한다.

## 실행 순서

### 1. RED — 완료 계약

- 남은 다섯 Gate 문서와 Runtime 파일이 없으면 실패하는 Python 계약을 추가한다.
- 기존 별형 Runtime·Base·권리 계약은 계속 통과해야 한다.

### 2. Typed Glyph Stock

- `TypedGlyphStockPool`을 추가한다.
- 공유 용량과 glyph_id별 수량을 함께 보존한다.
- 같은 glyph_id 재고만 예약·소비한다.
- 기존 범용 Stock POC는 회귀 이력으로 남기되 활성 별형 Commit은 Typed Pool을 사용한다.

### 3. 주문 결과 Policy

- `FULL_SUCCESS`, `PARTIAL_SUCCESS`, `IMPERFECT_EXECUTION`, `FAILURE`, `BACKLASH`를 경계값으로 테스트한다.
- `CIRCUIT_COLLAPSE`는 유효하지 않은 회로·Transaction에만 사용한다.
- 모든 결과에 원인 글자·새 정보·다음 기회를 요구한다.

### 4. 집중 필사

- 용량 예약, 실제 시간 마나 소모, 0.25 Active Pressure, 같은 glyph_id Stock +1을 구현한다.
- 취소·직접 HP 피해·행동 불가·마나 0·Focus loss·Background 중단을 검증한다.
- 중단 시 Stock 0, 이미 소비한 마나 환불 0을 검증한다.

### 5. Mobile Landscape Wireframe

- 중앙 메인, 외곽 5개, 숙련도, 성공률·마나 Breakdown, 경고, 대상 키워드, 최종 Preview, Commit을 노출한다.
- 마나 부족·불안정 회로·접근성 대체 입력 상태를 추가한다.
- 48dp, Text 130%, 색 외 신호, Reduced Motion 0ms를 계약으로 고정한다.

### 6. Frostbloom UX Fixture

- 시설 복구·생명 구조·정령 안정화·봉쇄 철수·제압 시간 확보·합리적 미등록 해결을 제공한다.
- 교수 예시 정답화, Best route 추천, 자동 대상·자동 Commit, 결말 Preview를 금지한다.

### 7. GREEN·적대 검토

- Godot Headless 전체 Suite를 실행한다.
- Planning/Base, 플랫폼 권리, Toolchain Workflow를 exact-head에서 확인한다.
- PR diff를 최신 main 정본과 비교해 구형 3×3·범용 Stock 활성 경로·사람 PASS 오인을 찾는다.

### 8. 병합·Main 폐쇄

- PR #69를 Ready로 전환한 뒤 예상 HEAD로 병합한다.
- main에서 동일 Workflow를 재검증한다.
- GitHub 정본과 Google Sheet에 merge SHA·Run ID·`SYNCED_TO_MAIN`을 기록한다.

## 완료 기준

- 모든 자동 계약과 Godot Suite PASS.
- PR 리뷰 스레드 0.
- 최신 main과 mergeable.
- Local runner로 `test`, `editor`, `run` 가능.
- `MOBILE_DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`, `ACCESSIBILITY_DEVICE_NOT_RUN`, `HUMAN_NOT_RUN`, `FULL_VERTICAL_SLICE_NOT_RUN`을 유지한다.
