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
| 최신 승인 Decision | `GM-GLYPH-VOCABULARY-V1-01` |
| 승인 Decision | `자원·운영·Vocabulary 3종` |
| Grill Batch | `3/10 / pending 3` |
| 현재 Gate | `IMPLEMENTATION_PLANS_READY` |
| 병합 권한 | `false` |
| 제품 Godot 프로젝트 | `NOT_CREATED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

main의 PR #57~#60 정본은 유지된다. PR #61은 자원 의미, 작업 운영 규칙, Vocabulary v1과 두 구현 계획을 기록한 사용자 승인·병합 대기 조기 체크포인트다.

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
10. `docs/planning/GLYPH_VOCABULARY_V1_01_APPROVAL_2026-08-05.md`
11. `docs/superpowers/specs/2026-08-05-glyph-vocabulary-v1-proposal.md`
12. `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`
13. `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`
14. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

## 핵심 재미

> 상황을 조사하고 의도를 정한 뒤, 글자·대상·3×3 회로로 주문을 설계하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화 → 복기
```

## 주문·자원

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Commit = 주문

보관함 = 직접 그려 저장한 특정 글자만 사용
Stock = 습득한 핵심·보조 단어 중 원하는 글자 1개를 즉시 선택
```

- 보관함 슬롯과 범용 Stock 용량은 별도다.
- 자연충전은 단일 범용 Stock 진행도다.
- 집중 필사는 선택한 글자의 보관함을 증가시킨다.
- 대상과 연결선은 자원 비용 0이다.
- 모든 주문 Commit은 마나를 사용한다.
- 둘 다 가능하면 자원 출처를 직접 고른다.
- 완성 주문 원터치 Stock은 금지된다.

## Vocabulary v1

- 핵심 단어 10종, 보조 단어 10종.
- Slice Runtime 6종: `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST`.
- 실제 입력형은 1~3획 권장, 고급 후보 최대 4획.
- 장식형은 입력 실루엣을 유지하며 인식 입력에 포함하지 않는다.
- 사람 인지·혼동·손가락 입력 검증 전 6종 초과 확대 금지.

## 작업 규칙

- 의미 있는 작업은 벤치마크·현업 비교와 프로젝트 불일치 분석을 포함한다.
- 실행 가능한 변경은 `RED → GREEN → REFACTOR`를 지킨다.
- 기획·아트는 제작 전에 수용·거부 사례와 검증 한계를 선언한다.
- 승인 Batch 최대 크기는 10건이다.
- 고위험 충돌·세션 종료·큰 정본 영향은 조기 Draft 체크포인트를 허용한다.

## 다음 작업

1. PR #61 최신 exact-head CI·Review Thread·Sheet Readback 검증.
2. Codex에서 Resource Foundation POC 계획부터 격리 worktree·TDD로 실행.
3. Resource Stop Gate 통과 후 Recognition POC 계획 실행.

제품 구현과 Runtime 검증은 아직 시작하지 않았다.
