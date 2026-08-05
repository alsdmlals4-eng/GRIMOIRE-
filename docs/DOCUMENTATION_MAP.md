# GRIMOIRE Documentation Map — 현재 정본 경로

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
working_branch: agent/star-circuit-mastery-balance
working_authority_commit: 209eecc5beed77920ca601a2b377b8e900a0d5ac
current_working_sync: GR-SYNC-20260806-01
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 시작 경로

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 최신 승인 책임 원본
```

## 최상위 권위

- `AGENTS.md` — 작업 규칙과 활성 별형 회로 요약.
- `START_HERE.md` — 첫 화면과 읽기 순서.
- `docs/ACTIVE_CONTEXT.md` — 현재 작업 상태.
- `docs/DEVELOPMENT_GATES.md` — Gate.
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` — Sheet 계약과 Working Sync 상태.
- `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` — 구형 파일·대체 범위 상태.
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` — 결정 Snapshot.
- `docs/DESIGN_DOCUMENT_REGISTRY.json` — 기계 판독 Router.
- `docs/planning/sync/GR-SYNC-20260806-01-WORKING.md` — GitHub·Sheet Working Sync 증거.

## 주문 회로·숙련도·마나 책임 번들

### 승인·설계

- `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md` — `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` 승인 범위.
- `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md` — 상세 설계.
- `docs/superpowers/plans/2026-08-06-star-glyph-circuit-canon-sync.md` — 정본·Sheet·검증 실행 계획.

### 단일 책임 원본

- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` — `FIVE_POINT_STAR`, 대상 키워드, Preview, 성공률.
- `docs/planning/MANA_SYSTEM.md` — 보조 마나 복잡도, `PRECISION`, `REDUCTION`.
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md` — 메인·보조 글자별 0~100 숙련도와 수업 상한.
- `docs/planning/STOCK_SYSTEM.md` — 새 회로와 충돌하지 않는 Typed glyph Stock 범위.
- `docs/planning/STOCK_CAPACITY_SYSTEM.md` — Stock 용량 범위.

### 역사 보존

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`.
- `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`.

두 파일은 `SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01` 상태다. Typed glyph Stock·명시적 Commit·모든 주문 마나 소모만 유지하며 3×3 위상·회로 내 대상·Edge 문법·보조2 상한·숫자 성공률 금지는 활성 근거로 사용하지 않는다.

## Frostbloom

Heat·Flow 승인, 복수 해결 Spec·Route Guidance·내부 패턴, 교육 승인, 대사 승인, 실제 Script `[활성 연결 콘텐츠]`.

교수 회로는 정답표가 아니며 새 별형 회로 문법으로 플레이어가 독립 구현한다.

## 운영·검증

- `tests/test_star_glyph_circuit_canon_contract.py` — 활성 정본 존재·구형 토큰 부재·Sheet 경계 회귀 계약.
- `.github/workflows/validate-base-v9-adoption.yml` — 회귀 계약을 필수 Planning CI로 실행.
- `docs/planning/sync/GR-SYNC-20260806-01-WORKING.md` — Sheet `02·04·05·12·15·40·41·60·99` Readback PASS.
- 별형 회로 Mobile Wireframe `[보류/다음 작업]`.
- 부분 성공·실패·역류 세부 계약 `[보류/다음 GrillMe]`.
- Godot toolchain 자료 `[구현완료 보관]`.
- 제품 구현·Runtime·모바일·성능·접근성·사람 검증 `NOT_STARTED / NOT_RUN`.

## Base

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generated outputs만 활성 권위이며 상태 Snapshot은 비권위다. 이번 설계 PR은 Base adapter를 변경하지 않는다.

## Legacy 정책

- `[대체됨]·[폐기]`: 현재 근거로 사용 금지.
- `[부분 대체됨]`: 유지 범위만 사용.
- `[보류]`: 실행 지시로 사용 금지.
- `[이력]`: 당시 증거일 뿐 현재 상태 아님.
