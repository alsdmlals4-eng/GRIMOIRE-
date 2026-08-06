# SPELL-WORKFLOW-UI-V2 적대적 검토

```yaml
review_id: GR-AUD-SPELL-WORKFLOW-UI-V2-01
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
sync_id: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
source_main: 46a4abfa6a94c732c70eb50cae365b7dc2939543
design_authority_head: efae6d7d54c9d8c5aef6dd0443624450811e8e59
working_branch: agent/spell-workflow-ui-v2-design
pull_request: 78
related_ui_pull_request: 77
review_mode: ATTACK_VALIDATE_CRITIQUE_DECISION_REPORT
implementation: NOT_STARTED
runtime_validation: NOT_RUN_FOR_UI_V2
human_device_validation: NOT_RUN
```

## 1. 실패 가정

새 3단계 화면이 보기에는 명확하지만 실제로는 기존 Runtime의 대상·Commit·마나 책임과 충돌하고, 글자 자원·완성 주문·사용 판정을 중복 소비하거나 플레이어에게 같은 성공률을 두 번 다르게 보여줄 수 있다고 가정했다.

## 2. 비교한 구조

### A. 단일 화면 통합

```text
그리기 + 회로 + 대상 + 사용
```

- 장점: 화면 전환이 적다.
- 실패 위험: 중심 질문이 여러 개이며 글자 획득·설계·실행 상태가 섞인다.
- 판정: `REJECTED_CRITIQUE`가 아니라 실제 단계 혼합 위험 때문에 `AVOID`.

### B. 기존 2단계 Runtime

```text
회로 Preview → 대상 → Final Preview → Commit
```

- 장점: 이미 자동화된 FIVE_POINT_STAR Runtime과 잘 맞는다.
- 실패 위험: 사용자가 승인한 “완성 주문을 만든 뒤 별도로 사용” 경험을 표현하지 못하고 주문 제작과 실행 비용의 책임이 섞인다.
- 판정: FIVE_POINT_STAR·계산·Typed Stock은 보존하되 흐름은 부분 대체.

### C. 3단계 분리

```text
글자 획득 → 주문 설계·확정 → 대상 선택·주문 사용
```

- 장점: 각 화면의 중심 질문과 자원 소비 시점이 분리된다.
- 위험: 전환이 늘고 완성 주문 Inventory·Use Transaction이 새로 필요하다.
- 판정: 사용자 승인 방향이며 코어와 가장 잘 맞는 권장안.

## 3. MUST_FIX와 반영

### F-01 — 글자 소비와 마나 소비 시점 모호

초기 설계 문구의 `Commit`은 기존 Runtime의 마나 소비 Commit인지, 새 주문 제작 확정인지 모호했다.

**반영**

- 2단계 주문 확정: 예약된 글자만 exactly-once 소비하고 완성 주문 생성.
- 3단계 주문 사용: 최종 마나 exactly-once 소비와 결과 적용.
- 주문 확정에서는 마나를 소비하지 않는다.

### F-02 — 2단계와 3단계 성공률 중복·충돌

대상 미선택 상태에서 표시한 성공률과 대상 선택 뒤 성공률이 같은 의미처럼 보일 수 있었다.

**반영**

- 2단계: `BASE_SPELL_SUCCESS`, 글자 숙련·회로 복잡도만 반영.
- 3단계: `FINAL_TARGET_SUCCESS`, 대상 난도·상황·환경 저항 반영.
- 변화 이유를 Breakdown으로 설명한다.

### F-03 — 현행 정본의 Target-before-Commit 충돌

Main 정본과 Sheet는 회로 Preview 뒤 대상 선택과 Commit을 현행으로 기록했다.

**반영**

- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 FIVE_POINT_STAR·숙련도·Typed Stock·exactly-once는 보존.
- Target-before-Commit과 Mana-at-Commit 부분만 `GM-SPELL-WORKFLOW-UI-V2-01`이 대체한다고 명시.
- 제품 Runtime Migration은 구현 PR 전까지 `NOT_STARTED`.

### F-04 — GrillMe 카운터 stale

Main `GRILL_ME_BATCH_MERGE_STATE.json`은 과거 3×3 상태와 0/10을 가리켰고, PR #63 체크포인트에는 4/10이 남아 있었다.

**반영**

- PR #63의 승인 네 건을 복원.
- 새 결정 한 건을 추가해 5/10으로 기록.
- 같은 목표의 Magic Visual Pass와 이미지 후속 수정은 중복 Decision으로 세지 않는다.

### F-05 — 보관함·스톡 UI와 실제 자원 계약 불일치

이미지의 대형 글자 Grid는 “현재 준비된 글자”와 전체 보유량을 혼동할 수 있었다.

**반영**

- 준비 수는 출처별 1~5개.
- `vault_prepared_count == stock_prepared_count`.
- 카드에 출처·핵심/보조·수량·품질/숙련·예약 상태를 표시.

### F-06 — 재화 오인과 마나 중복

생성 이미지의 보라색 보석과 복수 마나 표시는 실제 경제 계약을 왜곡했다.

**반영**

- 공통 경제 재화는 금화만.
- 주문 비용은 마나만.
- 마나는 단계별 예상 비용 영역에 한 번만 표시.

## 4. SHOULD_FIX와 후속 조건

### F-07 — 완성 주문 Inventory 수명주기

완성 주문의 저장 슬롯, 중복 제작, 취소·폐기, Save/Load Schema는 구현 계획에서 구체화해야 한다.

판정: `SHOULD_FIX_BEFORE_IMPLEMENTATION`.

### F-08 — 한글 폰트와 실제 정보 밀도

이미지 생성 결과는 한글 UI 방향을 보여주지만 실제 폰트 License·Text130%·1280×720 잘림을 증명하지 않는다.

판정: `DEFER_TO_GODOT_RENDER_GATE`.

### F-09 — 10종 글자의 Runtime 지원

현재 자동화된 Runtime 글자는 기존 6종이며 새 목록 10종 전체 구현은 사람 이해 검증과 데이터 설계가 필요하다.

판정: `BLOCKED_UNVERIFIED`. 이번 설계는 역할 정본만 확정하며 10종 Runtime PASS를 주장하지 않는다.

## 5. 보호한 코어와 기존 자산

- 상황을 읽고 의미를 선택하는 핵심 재미.
- FIVE_POINT_STAR 중앙 Main 1·외곽 Auxiliary 0~5.
- 글자별 숙련도와 회로 복잡도.
- Exact Glyph Vault와 Typed Glyph Stock.
- Preview·명시 확인·Exactly-once.
- PR #77 공용 Theme·Panel·Button·Badge·Glyph Slot·StarCircuitBoard.
- 자동 Target·자동 사용·숨은 비용 금지.

## 6. 이미지 판정

3개 생성 화면은 `APPROVED_UI_DIRECTION`이다. 다음은 증명하지 않는다.

- 실제 Godot 레이아웃과 입력
- 한국어 폰트 재배포 권리
- 48dp·Text130%·Safe Area
- 모션·성능·Screen Reader
- 사람 이해도
- 최종 아트 또는 출시 준비

따라서 `AI_GENERATED_DIRECTION_REFERENCE_ONLY / FINAL_ART_NOT_CLAIMED`를 유지한다.

## 7. Google Sheet 비교

같은 Decision ID를 다음 범위에 기록하고 Write 후 Readback 일치를 확인했다.

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

## 8. 최종 판정

```yaml
result: USER_APPROVED_DESIGN_CANON_SYNCED_TO_WORKING_BRANCH
sheet_write: PASS
sheet_readback: PASS
written_spec_self_review: PASS
user_written_spec_review: PENDING
implementation_plan: NOT_STARTED
product_implementation: NOT_STARTED
runtime_migration: NOT_STARTED
merge_authorized: false
```

구현 전 남은 필수 조건은 사용자의 작성 Spec 검토와 승인이다.
