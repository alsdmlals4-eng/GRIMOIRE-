# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base | `v9.4.3` |
| Main 정본 커밋 | `a27b75ea9aabcbb84159356b857e22b3acd30a43` |
| Main Sync | `GR-SYNC-20260804-12-CLOSURE` |
| 작업 PR | `#61 Draft` |
| 최신 승인 Decision | `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01` |
| 관련 자원 Decision | `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01` |
| Grill Batch | `2/10 / pending 2` |
| 병합 권한 | `false` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

main의 PR #57~#60 정본은 유지된다. PR #61은 자원 의미와 작업 운영 규칙을 기록한 사용자 승인·병합 대기 조기 체크포인트다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. `docs/planning/GLYPH_VAULT_UNIVERSAL_STOCK_01_APPROVAL_2026-08-05.md`
7. `docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md`
8. `docs/planning/WORKFLOW_BENCHMARK_TDD_CHECKPOINT_01_APPROVAL_2026-08-05.md`
9. `docs/superpowers/specs/2026-08-05-benchmark-tdd-checkpoint-governance-design.md`
10. `docs/research/GLYPH_INPUT_AND_MOBILE_UI_BENCHMARK_2026-08-05.md`
11. 3×3 회로·Frostbloom 승인 문서
12. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

## 핵심 재미

> 상황을 조사하고 의도를 정한 뒤, 글자·대상·3×3 회로로 주문을 설계하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화 → 복기
```

## 주문

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Commit = 주문
```

```yaml
main: exactly_1
supports: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

## 보관함·Stock

```text
보관함 = 직접 그려 저장한 특정 글자만 사용
Stock = 습득한 핵심·보조 단어 중 원하는 글자 1개를 즉시 선택
```

- 자연충전은 범용 Stock을 증가시킨다.
- 집중 필사는 선택한 글자의 보관함을 증가시킨다.
- 대상과 연결선은 자원 비용 0이다.
- 모든 주문 Commit은 마나를 사용한다.
- 둘 다 가능하면 자원 출처를 직접 고른다.
- 완성 주문 원터치 Stock은 금지된다.

## 문양

- 실제 입력형은 1~3획 권장, 고급 최대 4획 후보.
- 장식형은 입력 실루엣을 유지하고 외곽 룬·광원만 추가한다.
- 핵심 단어는 현상, 보조 단어는 방향·작동 방식을 보여준다.
- 이름·역할 아이콘·형태를 함께 사용한다.

## 작업 규칙

- 의미 있는 작업은 벤치마크·현업 비교와 프로젝트 불일치 분석을 포함한다.
- 실행 가능한 변경은 `RED → GREEN → REFACTOR`를 지킨다.
- 기획·아트는 제작 전에 수용·거부 사례와 검증 한계를 선언한다.
- 승인 Batch 최대 크기는 10건이다.
- 고위험 충돌·세션 종료·큰 정본 영향은 조기 Draft 체크포인트를 허용한다.

## 다음 작업

1. PR #61 exact-head GREEN·적대적 검토·Sheet Readback.
2. 사용자에게 두 Spec 검토 요청.
3. 승인 후 구현 계획 작성.
4. 문양 1차 세트와 3×3 Mobile Landscape Wireframe 테스트 설계.

제품 구현과 Runtime 검증은 아직 시작하지 않는다.
