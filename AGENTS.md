# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
current_main_sync: GR-SYNC-20260806-01
merged_pull_request: 68
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
grill_counter: 0_of_10
pending_decisions: 0
canon_status: SYNCED_TO_MAIN
sheet_readback: PASS
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

사용자는 2026-08-06 중앙 메인 글자 1개와 별 꼭짓점 보조 글자 5개의 새 회로, 회로 Preview 뒤 대상 키워드 선택, 숫자 성공률, 글자별 숙련도, 강한 성공률·마나 복잡도, 정밀·절감 글자를 승인했다. PR #68이 `main`에 병합됐고 같은 Decision ID와 main authority SHA가 Google Sheet에서 재조회됐다. 이 결정은 `GM-3X3-CIRCUIT-STOCK-FOCUS-01`의 회로 위상·대상 노드·보조 상한·숫자 성공률 금지 범위를 대체한다.

## 권위 우선순위

1. 사용자의 최신 명시 결정.
2. 이 파일.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. `docs/DEVELOPMENT_GATES.md`.
6. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.
7. 최신 승인 Decision 책임 원본.
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
9. 실제 제품 코드·테스트·Runtime 증거.
10. Base pin·공유 Skill 계약.
11. 과거 Draft·Working·Sync·추정.

구형 파일은 상태 색인의 `[부분 대체됨]·[대체됨]·[보류]·[구현완료 보관]·[폐기]·[이력]` 분류를 따른다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ 별형 회로 승인·Spec
→ MAGIC_LETTER_CIRCUIT_SYSTEM·MANA_SYSTEM·SUPPORT_LETTER_MASTERY_SYSTEM
→ Frostbloom 승인 문서
→ docs/planning/sync/GR-SYNC-20260806-01-MAIN.md
```

## Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 현재 권위다. 이번 주문 설계 변경은 Base adapter 마이그레이션을 수행하지 않는다.

## 역할 분리

```text
GPT → 핵심 재미·콘텐츠·대사·UX·이미지·아트·적대적 검토·정본 동기화
Codex → 승인 범위의 Godot 구현·테스트·Runtime·실기기 검증
```

제품 구현은 별형 회로 Mobile Wireframe과 Frostbloom UX·Art 범위가 준비될 때까지 `[보류]`다.

## 프로젝트 코어

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·회로·대상 키워드로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도·우선순위 → 별형 글자 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 세계 변화 → 복기·발견
```

전투와 비전투는 같은 주문 문법을 쓴다.

## FIVE_POINT_STAR 회로

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
target_nodes_inside_circuit: prohibited
hidden_vertex_bonus: prohibited
slot_order_effect: deferred_until_separately_approved
numeric_success_preview: required
```

외곽 슬롯은 초기 버전에서 기능적으로 동등하다. 별 위치·선 길이에 숨은 위력·마나·성공률 보너스를 두지 않는다. 대상은 관찰·조사로 열린 키워드 중에서 회로 Preview 뒤 선택한다.

## 글자별 숙련도·복잡도

```yaml
glyph_mastery: 0_to_100
year_direct_success_bonus: prohibited
first_year_selected_foundation_mastery_cap: 70_TEST_VALUE
success_complexity_by_auxiliary_count: [0, -10, -20, -30, -40, -50]
mana_complexity_by_auxiliary_count: [0, +10%, +20%, +30%, +40%, +50%]
precision: MANA_PLUS_25_PERCENT_SUCCESS_PLUS_MASTERY_DIV_10_PP
reduction: MANA_MINUS_10_PLUS_MASTERY_DIV_10_PERCENT_SUCCESS_PLUS_0_PP
```

숙련도는 해당 글자를 직접 그리고 의미 있게 사용하거나 수업·연습·과제·연구로 쌓는다. 학년은 성공률을 직접 주지 않고 상위 수업과 숙련도 상한을 연다.

1학년 집중 숙련 기준은 보조 1개 안정, 보조 2개 60% 이상 안정권 경계, 보조 3개부터 위험 구간이다.

## Stock·마나·필사

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana_per_real_second: 1_TEST_VALUE
focus_success: SAME_GLYPH_STOCK_PLUS_1
focus_capacity_reservation: 1
full_pause: false
```

글자 배치 시 Stock을 예약하고 Commit 성공 때 Stock·마나·결과를 원자 처리한다. 직접 그리기와 Stock은 같은 주문 효과·마나·성공 공식을 사용한다. 직접 그리기는 숙련도 근거이지 숨은 위력 보너스가 아니다.

## Frostbloom 보호 경계

교수 주문은 하나의 해결 예시이며 정답·필수 루트·최적해·채점키가 아니다. 선택지는 의도를 확인하고 주문은 플레이어가 별형 회로로 구현한다. 합리적 미등록 해결을 허용한다.

```text
완성 주문 원터치 Stock
Stock 주문 무마나 실행
집중 필사 완전 Pause
그림 위력 보너스
교수 회로 정답화·자동 복사
설계도 자동 대상·자동 Commit
숨은 별 꼭짓점 보너스
학년 직접 성공률 보너스
Runtime 검증 없는 밸런스 완료 주장
= 금지
```

## 검증 경계

설계·Prototype 수치는 사용자 승인 상태지만 제품 `project.godot`, Runtime, 모바일, 성능, 접근성, 사람 검증은 미실행이다. 모든 수치는 `PLAYTEST_TUNING_REQUIRED`다.

## 다음 우선순위

1. 별형 회로 Mobile Landscape Wireframe.
2. 부분 성공·실패·역류 세부 계약.
3. 집중 필사 Overlay.
4. Frostbloom UX Map.
5. 선택 범위 Codex 구현 계획.

## 플랫폼 출시·에셋 권리

출시·외부 자산·AI·외주·참조 기반 독립 제작 작업은 다음 프로젝트 증거를 읽는다.

- `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`
- `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`

Mobile/Android·Google Play가 우선이며 Steam·STOVE는 PC_LATER 비교 후보다. 콘텐츠 등급과 target audience를 분리하고 Families, 광고 SDK, 데이터·개인정보를 별도로 검토한다. 원본을 조금 수정하거나 AI로 변환했다는 이유만으로 독립 자산으로 보지 않고 `reference_brief`, `forbidden_expression`, 별도 `final_asset_record`, 유사성 검토를 요구한다.

필수 권리·계약·약관 버전·플랫폼 답변·build/store/questionnaire 일치가 미확인이면 `RELEASE_BLOCKED_UNVERIFIED`다. 제품 프로젝트 미생성, Runtime·모바일·사람 검증 미실행 상태를 변경하지 않는다.
