# GRIMOIRE 개발·기획 게이트 — 현재 체크포인트

```yaml
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
```

## Gate 0 — 정본 복원

현재 진입점, 상태 JSON, Sync Receipt, PR #62·#63, Sheet가 같은 상태를 가리켜야 한다.

현재: `CURRENT_PR63_CANON_SYNCED / SHEET_FINAL_READBACK_PASS`.

## Gate 1 — 핵심 재미

```text
상황 → 의미 → 3×3 회로 → Preview → Commit → 결과·대가 → Grimoire
```

Recognition과 자원 시스템이 회로 판단을 대신하면 실패다.

현재: `PLANNING_PASS / HUMAN_END_TO_END_NOT_RUN`.

## Gate 2 — 3×3 회로

메인 1, 보조 0~2, 대상 1~4, 최대 7노드·1분기, 8방향 인접, 교차·건너뛰기 금지, 전체 도달 가능, 대상 끝점.

현재: `SPEC_PASS / END_TO_END_RUNTIME_NOT_RUN`.

## Gate 3 — 자원 Foundation

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
source_selection: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

현재: `PR62_AUTOMATED_PASS / OPEN_DRAFT_UNMERGED / HUMAN_NOT_RUN`.

## Gate 4 — Vocabulary·Recognition

```yaml
semantic_registry: MAIN_10_SUPPORT_10
runtime_glyphs: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
recognizers: DOLLAR_ONE_PLUS_BOUNDED_DOLLAR_N
low_confidence_or_confusion: RETRY_NOT_AUTO_CONFIRM
stale_revision: BLOCK
selected_recognized_mismatch: BLOCK_SAVE
success_destination: EXACT_GLYPH_VAULT_ONLY
runtime_expansion_7_plus: BLOCKED
```

현재: `PR63_AUTOMATED_PASS / SYNTHETIC_FIXTURES_ONLY / HUMAN_DEVICE_NOT_RUN`.

## Gate 5 — 모바일 UX·접근성

Landscape Safe Area, 최소 48dp, 텍스트 확대 Layout POC는 존재한다. 실제 기기, 좌우손, 피로, 100/130/200% 텍스트, 스크린리더·색 외 구분 검증은 미실행이다.

현재: `LAYOUT_POC / DEVICE_A11Y_NOT_RUN`.

## Gate 6 — 콘텐츠·서사 대표성

Frostbloom 복수 해결과 교수 비정답 원칙은 유지한다. 현재 Recognition 화면만으로 Vertical Slice 대표성을 선언하지 않는다.

현재: `PLANNING_PASS / HUMAN_REPRESENTATIVENESS_NOT_RUN`.

## Gate 7 — TDD·CI

- 제품 POC: 기존 RED→GREEN 기록 유지.
- 정본 보정: `tests/test_current_checkpoint_authority.py`를 먼저 추가.
- CI 수집 누락 발견 후 Foundation Workflow에 계약 테스트를 명시 등록.
- 첫 RED run `31004483858`: 기존 Resource·Vocabulary 성공, Current Checkpoint Authority만 예상 실패.
- GREEN evidence head `c93c091be6827dbb6ff888ebb889e379c86407bb`.
- GREEN runs: Foundation `31005032419`, Planning/Base `31005032390`, Godot Toolchain `31005032414`.
- 닫힘 RED run `31005564491`: GREEN 실행 후에도 기계 상태가 pending인 결함만 예상 실패.

현재: `GREEN_CONFIRMED_AT_C93C091B / CLOSURE_METADATA_FIXED`.

## Gate 8 — Base 계약

```yaml
project_pin: c987647d01ad2baa028a16e03d85ddfc1572a727
observed_base_main: 339a48be688e312b7894e1f2372aecfe0ee3f6f4
ahead_commits: 54
migration: SEPARATE_TDD_CHANGE_REQUIRED
```

현재 PR에서 pin만 교체하지 않는다. Live Editor Contract v2와 증거 거버넌스는 별도 영향 분석·TDD·필요 시 GrillMe 대상으로 분리한다.

## Gate 9 — 사람·실기기

다음 승인 대상은 인식 단독 정확도, 의미 이해, 자원 출처, 3×3 회로, Preview/Commit, 결과 인지 중 어디까지 한 검증 배치에 넣을지다.

현재: `GRILLME_REQUIRED / HUMAN_END_TO_END_CORE_LOOP_VALIDATION_PENDING`.

## Gate 10 — 정본 동기화·병합

```yaml
pull_request: 63
draft: true
sheet_sync_id: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
grill_counter: 3_of_10
merge_required: false
merge_authorized: false
```

exact-head CI와 Sheet Readback을 마쳐도 별도 사용자 승인 없이는 Ready 전환·병합하지 않는다.
