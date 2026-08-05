# GR-SYNC-20260806-01 — 별형 회로 Working Branch Sync

## 상태

```yaml
sync_id: GR-SYNC-20260806-01
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
status: SYNCED_TO_WORKING_BRANCH
working_branch: agent/star-circuit-mastery-balance
authority_commit: 209eecc5beed77920ca601a2b377b8e900a0d5ac
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_sync_status: NOT_MERGED
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
sheet_readback: PASS
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인·변경 요약

- 활성 3×3 회로 문법을 `FIVE_POINT_STAR` 회로로 대체했다.
- 중앙 메인 글자 1개와 별 꼭짓점 보조 글자 0~5개를 사용한다.
- 회로 Preview 이후 대상 키워드를 선택하고 최종 Preview에서 숫자 성공률과 마나를 확인한다.
- 메인·보조 글자별 `0~100` 숙련도를 도입했다.
- 보조 개수별 성공률은 `0,-10,-20,-30,-40,-50%p`, 마나는 `0,+10,+20,+30,+40,+50%` 복잡도를 사용한다.
- `PRECISION`은 마나 +25%와 숙련도 기반 성공률 보너스를, `REDUCTION`은 성공률 직접 보너스 없이 숙련도 기반 마나 절감을 제공한다.
- 1학년 집중 숙련 기준은 보조 1개 안정, 보조 2개 60% 안정권 경계다.

## GitHub Authority

Authority snapshot `209eecc5beed77920ca601a2b377b8e900a0d5ac`에는 다음 책임 범위가 포함된다.

- `AGENTS.md`
- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
- `docs/superpowers/plans/2026-08-06-star-glyph-circuit-canon-sync.md`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`
- `tests/test_star_glyph_circuit_canon_contract.py`
- required planning CI integration.

후속 커밋은 이 authority snapshot을 Sheet·Sync receipt·PR metadata에 기록하는 추적 보정이며 설계 수치를 변경하지 않는다.

## Google Sheet 반영 범위

| 탭 | 반영·Readback |
|---|---|
| `02_현재_확정결정` | Row 61, Decision·authority SHA·대체 Decision·`SYNCED_TO_WORKING_BRANCH` PASS |
| `04_누락_충돌_감사` | Row 65, 3×3 충돌·대체 범위·남은 NOT_RUN PASS |
| `05_GDD_요약` | Row 19, 핵심 흐름·수치·Working Sync PASS |
| `12_핵심루프` | Row 26, `GR-L-STAR-01` PASS |
| `15_조작_게임규칙` | Row 14, `GR-I-STAR-01` PASS |
| `40_핵심시스템_메인콘텐츠` | Row 28, `GR-S-STAR-01` PASS |
| `41_성장_경제` | Row 12, `GR-EC-STAR-01` PASS |
| `60_UX_UI_접근성` | Row 34, `GR-UX-STAR-01` PASS |
| `99_변경이력` | Row 79, Sync ID·authority SHA·범위·Readback PASS |

## 충돌·보존 판정

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 삭제하지 않고 역사 증거로 보존한다.

```text
SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01
```

대체: 3×3 위상, 회로 내부 대상, 인접 Edge 문법, 일반 보조 2개 상한, 숫자 성공률 Preview 금지.

보존: Typed glyph Stock, 명시적 Commit, 자동 대상·자동 Commit 금지, 모든 주문 마나 소모, 입력 방식 간 동일한 주문 의미.

## Readback 결과

- Decision ID: PASS.
- Authority snapshot SHA `209eecc5...`: PASS.
- 대체 Decision·충돌 범위: PASS.
- 회로 흐름·숙련도·성공률·마나·정밀·절감: PASS.
- UX·성장·핵심 시스템 연결: PASS.
- Working Branch Sync 상태: PASS.

## 남은 Gate

- Draft PR exact-head CI.
- 문서 Spec review와 리뷰 스레드 0개.
- 별형 회로 Mobile Landscape Wireframe.
- 부분 성공·실패·역류 세부 계약.
- 제품 Godot 프로젝트 생성 및 테스트 우선 구현.
- Runtime·모바일 실기기·성능·접근성·사람 검증.
- PR 병합 뒤 main SHA와 Sheet를 다시 읽어 `SYNCED_TO_MAIN`으로 전환.
