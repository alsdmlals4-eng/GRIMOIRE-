# PR #63 정본·Base 드리프트 적대적 검토 — 2026-08-05

```yaml
review_scope:
  - Base current main vs project pin
  - GRIMOIRE authority entrypoints
  - PR 62 resource evidence
  - PR 63 recognition evidence
  - Google Sheet current rows
  - TDD and CI collection
result: CONDITIONAL_PASS_AFTER_CANON_RECONCILIATION
new_product_decision: false
grill_counter_change: false
merge_authorized: false
```

## 핵심 재미 정렬

현재 핵심 재미는 `상황 → 의미 → 회로 → Preview → Commit → 결과·대가 → Grimoire`다. Recognition, Exact Glyph Vault, Universal Glyph Stock은 이 루프의 입력과 자원 준비를 돕는 보조 시스템이다.

적대적 질문: 자동 인식 정확도가 높아져도 플레이어가 상황을 읽거나 의미 있는 선택을 하지 않는다면 게임이 재미있는가?

결론: 아니다. 따라서 PR #63 자동화 PASS는 입력 기반의 기술 위험을 낮췄을 뿐, 핵심 재미 PASS가 아니다. 다음 사람 검증은 인식 단독 정확도와 전체 의미 회로를 분리해 측정해야 한다.

## 발견 사항

### P1 — 권위 진입점 드리프트

`START_HERE`, `ACTIVE_CONTEXT`, `DEVELOPMENT_GATES`, `DOCUMENTATION_MAP`, Planning Index, `CURRENT_CONFIRMED_DECISIONS`, `CANON_SYNC_STATE`, Grill 상태가 PR #61·구현 미시작에 머물렀다. 실제 작업은 PR #62 Resource 자동화 PASS와 PR #63 Recognition 자동화 PASS까지 진행됐다.

조치: 현재 Runtime 체크포인트와 상태 인덱스를 추가하고, 진입점·기계 상태를 `GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC`로 정렬한다.

### P1 — CI 수집 사각지대

새 `tests/test_current_checkpoint_authority.py`를 추가했지만 기존 Foundation Workflow는 고정 목록만 실행해 처음에는 테스트가 수집되지 않았다.

조치: Workflow에 현재 체크포인트 계약을 명시 등록했다. RED run `31004483858`에서 기존 Resource·Vocabulary 계약은 성공하고 현재 체크포인트 계약만 실패해 결함 원인을 분리했다.

### P1 — 합성 증거 과대해석 위험

6×6 승인 matrix가 대각선이고 승인된 오인식이 0이어도 증거 범위는 `SYNTHETIC_FIXTURES_ONLY`다. 손가락 입력, 좌우손, 화면 크기, 필사 피로, 의미 혼동, 보조기술 사용성은 증명하지 않는다.

조치: `human_device_validation: NOT_RUN`, `runtime_expansion_7_plus: BLOCKED`, `merge_authorized: false`를 정본·Sheet에 유지한다.

### P1 — Base 계약 pin 드리프트

프로젝트 테스트 pin은 `c987647d01ad2baa028a16e03d85ddfc1572a727`, 관측된 Base main은 `339a48be688e312b7894e1f2372aecfe0ee3f6f4`로 54커밋 차이다. 후속 변경에는 Human/Synthetic 증거 거버넌스와 Godot Live Editor Contract v2가 포함된다.

조치: PR #63에서 단순 pin 갱신하지 않는다. 제품 인식 변경과 운영 계약 마이그레이션을 섞으면 회귀 원인을 잃는다. 별도 TDD 마이그레이션에서 변경 목록을 선별 채택하고, 기획·작업 방식 충돌은 GrillMe 승인을 받는다.

### P2 — 이력과 현재 상태의 혼재

8월 4일 스냅샷은 당시에는 정확하지만 파일명이 현재처럼 보일 수 있다.

조치: 새 날짜 인덱스를 최우선으로 연결하고 이전 인덱스를 `[이력]`으로 명시한다. 삭제하지 않는 이유는 Decision·Sync 추적성을 보존하기 위해서다.

## PR 체크 결론

```text
제품·인식 자동화 증거: 유지
정본 진입점: 보정 필요
CI 테스트 수집: 보정 필요
사람·실기기 Gate: 미실행 유지
7종 이상 확대: 차단 유지
Base 최신화: 별도 작업으로 분리
PR #63 Ready/병합: 금지
```

## 다음 GrillMe 후보

`GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`: 사람·실기기 검증을 인식 단독, 전체 Vertical Slice, 또는 단계형 혼합 중 어디까지 한 배치로 정의할지 승인받는다. 승인 전에는 사람 검증 프로토콜·이미지·애니메이션·Codex 후속 구현을 확정하지 않는다.
