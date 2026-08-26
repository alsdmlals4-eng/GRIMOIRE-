# GR-SYNC-20260826-37 · Spell Flow Player-Facing Simplification

```yaml
sync_id: GR-SYNC-20260826-37-SPELL-FLOW-PLAYER-FACING
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
status: CURRENT_TASK_PR_PENDING
approved_at: 2026-08-26
approval_source: 사용자 명시 승인 "좋아 그렇게하자"
baseline_project_main: 1a37460f4953a322e228daac0215b0b9dd82b22e
baseline_base_main: edb3b3376603c9f6b00d64af3126304f8c9946bf
branch: docs/spell-flow-player-facing-20260826
open_other_workstream: PR_166_READ_ONLY_README_ONLY
product_code_mutation: NONE
scene_resource_mutation: NONE
image_generation_in_this_unit: NONE
```

## 승인 내용

플레이어가 이해하는 주문 흐름을 다음처럼 단순화한다.

```text
글자
→ 주문
→ 대상
→ 시전
```

화면/행동은 두 덩어리로 정리한다.

```text
주문 만들기
= 글자 선택·작성
+ FIVE_POINT_STAR 회로 조합
+ 완성 주문 이름 확인

주문 쓰기
= 게임 장면에서 대상 지정
+ 필요한 최종 Preview
+ 명시 시전
```

## 내부 authority 보존

이번 결정은 player-facing vocabulary와 화면 묶음을 단순화하는 revision이다. 다음 구현 authority는 변경하지 않는다.

- Task4 Stage2 atomic preparation
- immutable `PreparedSpell`
- Task5 Stage3 target/use atomic transaction
- typed glyph reservation / atomic consume
- explicit target
- explicit exactly-once use
- invalid/cancel/error rollback
- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`
- `FIVE_POINT_STAR`

따라서 `Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`는 내부 구현·데이터·테스트 용어로 유지한다.

## Visual revision

- 세로 패찰·부적·charms처럼 보이는 glyph metaphor는 폐기한다.
- 글자는 획·필기감·빛나는 잉크 흔적이 있는 **직접 쓰인 마법 문자**로 읽히게 한다.
- FIVE_POINT_STAR에는 글자를 패찰째 꽂기보다 직접 쓰거나 놓는 느낌을 우선한다.
- Stage2 결과의 player-facing primary label은 `준비 주문`보다 **완성 주문 / 완성 주문 이름**이다.
- 대상 지정은 가능하면 게임 장면에서 직접 수행하고 필요한 Preview 뒤 `시전`한다.

## Naming boundary

승인된 것은 **완성 주문 이름을 회로 결과의 1차 readout으로 둔다**는 UX 원칙이다.

아래는 아직 별도 설계 대상이다.

- 이름 생성 문법
- 한국어 조사/어미 규칙
- 로컬라이징
- 중복 이름 처리
- 이름과 정확한 효과 수치의 대응 알고리즘

## Fresh-read conflict record

Google Sheet `02_현재_확정결정`의 기존 `GM-SPELL-WORKFLOW-UI-V2-01` 행에는 과거 표현인 `글자 그리기→회로 배치→주문 사용`, `Prepared Spell→explicit target→...`가 남아 있다.

```yaml
google_sheet_role: MIGRATION_ONLY_UNTIL_REMOVAL
conflict_type: STALE_PLAYER_FACING_WORDING
new_sheet_canon_write: FORBIDDEN
resolution: GITHUB_AND_NOTION_CURRENT_REVISION_SUPERSEDES_PLAYER_FACING_LABELS
```

이 충돌은 Sheet를 current writer로 복귀시키지 않고 기록만 한다.

## Notion synchronization

현재 human-facing surfaces:

- `글자 학습 → 주문 설계 루프` — 새 `글자→주문→대상→시전` 규칙과 Player Meaning 반영, `REPO_UPDATE_REQUIRED` until merge.
- `Visual Asset Coverage · 2026-08-26 · r5.4` — 새 player-facing flow, direct-written glyph direction, previous Stage2 brief generated/reviewed 상태 반영.

Post-merge에는 Core Loop `Source SHA / Sync State`와 Project System Record `Repo Main SHA / Sync State`를 merged main으로 readback한다.

## Evidence ceiling

```text
PLAYER_FACING_FLOW_DECISION: USER_APPROVED
GITHUB_BRANCH_DOCS: WRITTEN_PENDING_PR
NOTION_HUMAN_CANON: UPDATED_PENDING_REPO_MERGE
GOOGLE_SHEET: MIGRATION_ONLY_STALE_WORDING_OBSERVED_NO_WRITE
TASK8_PRODUCT_IMPLEMENTATION: NOT_AUTHORIZED
HUMAN_USABILITY: NOT_RUN
DEVICE: NOT_RUN
PERFORMANCE: NOT_RUN
FULL_VERTICAL_SLICE: NOT_RUN
```
