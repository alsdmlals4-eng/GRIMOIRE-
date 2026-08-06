# GR-SYNC-20260806-09 — SPELL-WORKFLOW-UI-V2

```yaml
sync_id: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
date: 2026-08-06
repository: alsdmlals4-eng/GRIMOIRE-
source_main: 46a4abfa6a94c732c70eb50cae365b7dc2939543
working_branch: agent/spell-workflow-ui-v2-design
pull_request: 78
design_authority_head: efae6d7d54c9d8c5aef6dd0443624450811e8e59
adversarial_review_head: 256c261b95f167e55637cbf75c89d64bded27356
status: SYNCED_TO_WORKING_BRANCH_SHEET_READBACK_PASS_USER_SPEC_REVIEW_PENDING
implementation: NOT_STARTED
runtime_migration: NOT_STARTED
human_device_validation: NOT_RUN
merge_authorized: false
grill_counter: 5_of_10
```

## 결정 요약

주문 경험을 다음 세 단계로 분리한다.

```text
1. 글자 그리기
→ 인식·획득·보관함 저장

2. 회로 배치
→ 보관함·스톡 예약
→ FIVE_POINT_STAR Preview
→ 글자 소비·완성 주문 생성

3. 주문 사용
→ 대상 선택
→ 대상 적용 최종 Preview
→ 마나 소비·실제 판정
```

## 자원·글자 계약

- 보관함 준비 수와 스톡 준비 수는 같고 각각 1~5개다.
- 표준 사건은 5대5를 사용한다.
- 핵심 글자: 열·흐름·보호·냉각·수복.
- 보조 글자: 집중·분산·안정·지속·증폭.
- 공통 경제 재화는 금화다.
- 주문 사용 비용은 마나다.
- 마나는 예상 비용 영역에 한 번만 표시한다.
- 2단계에서는 글자만 소비하고, 3단계에서 마나를 소비한다.

## 정본 변경 위치

```text
START_HERE.md
docs/ACTIVE_CONTEXT.md
docs/DEVELOPMENT_GATES.md
docs/planning/CURRENT_CONFIRMED_DECISIONS.md
docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
docs/planning/CANON_SYNC_STATE.json
docs/planning/SPELL_WORKFLOW_UI_V2_01_APPROVAL_2026-08-06.md
docs/planning/SPELL_WORKFLOW_UI_V2_ADVERSARIAL_REVIEW_2026-08-06.md
docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md
```

## 대체 관계

보존:

- FIVE_POINT_STAR
- 중앙 Main 1·Auxiliary 0~5
- 글자별 숙련도·회로 복잡도
- Exact Glyph Vault·Typed Glyph Stock
- Preview·Exactly-once

부분 대체:

```text
기존: 회로 Preview → Target → Final Preview → Commit·Mana
신규: 회로 Preview → 주문 확정·Glyph 소비 → 별도 Target → Mana·판정
```

## Sheet Write·Readback

다음 13개 범위의 값이 동일 Decision ID와 Sync ID로 Write 후 Readback 일치했다.

```text
00_프로젝트_허브!H2:K2
01_작업순서!A58:J58
02_현재_확정결정!A68:J68
04_누락_충돌_감사!A73:H73
05_GDD_요약!A23:J23
12_핵심루프!A30:J30
15_조작_게임규칙!A18:J18
40_핵심시스템_메인콘텐츠!A32:J32
41_성장_경제!A16:I16
60_UX_UI_접근성!A42:J42
71_이미지기획_생성목록!A12:J12
72_이미지검수_승인로그!A6:J6
99_변경이력!A88:H88
```

```yaml
sheet_write: PASS
sheet_readback: PASS
sheet_status: APPROVED_PENDING_MERGE
```

## 이미지 경계

생성된 1·2·3단계 화면은 `APPROVED_UI_DIRECTION`이며 다음 상태를 유지한다.

```yaml
final_game_asset: false
text_accuracy_authority: false
godot_runtime_evidence: false
font_rights_verified: false
human_visual_validation: NOT_RUN
```

## 다음 Gate

```text
사용자 Written Spec 검토
→ 구현 계획 작성
→ PR #77 기반 경계 확인
→ 별도 TDD 구현 PR
→ exact-head 자동 렌더·회귀
→ 실제 기기·사람 검증
```

이 Sync는 병합 승인이나 구현 완료를 생성하지 않는다.
