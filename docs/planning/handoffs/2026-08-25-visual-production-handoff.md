# GRIMOIRE Visual Production Handoff — 2026-08-25

```yaml
handoff_id: GR-HANDOFF-VISUAL-20260825-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
source_main: 0d3f589c231b853af635a2b65d8e281f4429e5f2
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
work_scope: VISUAL_DIRECTION_AND_IMAGE_PLANNING_ONLY
implementation_authority_from_this_handoff: NONE
user_boundary: DO_NOT_START_IMPLEMENTATION_UNTIL_USER_EXPLICITLY_SAYS_IMPLEMENTATION_WORK
planning_status: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation_status: PARTIAL_FOUNDATION
sheet_status: MIGRATION_ONLY_UNTIL_REMOVAL
```

## 1. 새 채팅에서 가장 먼저 읽을 것

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`
5. `docs/planning/visual/GRIMOIRE_VISUAL_DIRECTION_APPROVAL_2026-08-25.json`
6. `docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json`
7. `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
8. `docs/planning/SPELL_WORKFLOW_UI_V2_01_APPROVAL_2026-08-06.md`
9. `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`
10. `docs/planning/STOCK_SYSTEM.md`
11. 실제 구현 확인용 `src/core/workflow/spell_workflow_coordinator.gd`와 `src/core/spells/atomic_spell_preparation_service.gd`

과거 채팅이나 이미지 자체를 정본으로 사용하지 않는다. 매 세션 GitHub main·open PR·Notion 대표 Visual을 fresh read한다.

## 2. 사용자 최신 작업 경계

사용자는 현재 **이미지/비주얼 작업을 계속**하고 있으며, 구현 작업은 보류했다.

```text
이미지/비주얼 논의
→ brief 합의
→ 이미지 생성
→ 사용자 검토/승인
→ 승인된 범위만 Notion/GitHub에 기록
```

사용자가 명시적으로 `구현 작업 하자`라고 하기 전에는 Task8, Godot, 제품 코드, 제품 구현 PR을 시작하지 않는다.

## 3. 현재 승인된 시각 방향

Decision `GM-VISUAL-DIRECTION-20260825-01`:

- Logo 01을 기본 로고 방향으로 고정.
- `SOFT_STORYBOOK_ENVIRONMENT`.
- `CLEAN_ANIME_CEL_CHARACTER_OVER_STORYBOOK_BACKGROUND`.
- `NAVY_GOLD_MAGIC_ACADEMY_FRAME`.
- 마법 판타지/애니메 인상을 기존보다 선명하게.
- 청색~청보라 마법광, 고서/양피지 질감.
- 생성 이미지의 임의 서사·숫자·영문 UI·캐릭터 설정은 자동 Canon이 아니다.
- 이 결정은 final runtime asset이나 Human/Device PASS가 아니다.

## 4. 현재 대표 화면 승인 상태

Decision `GM-REPRESENTATIVE-SCREENS-20260825-01`:

### 대표 전투/주문 화면

파일: `마법_온실의_정령_전투_ui.png`

승인된 것:
- 마법 온실 전투 분위기.
- 적·환경 중심의 전투 구도.
- Navy/Gold UI 언어.
- 청색 마법광.
- Anime character + Storybook environment 조합.

승인되지 않은 것:
- 이미지 내부의 Stock/회로/주문 작성 세부 UI.
- 이미지의 숫자·라벨·메뉴명.
- 이미지가 암시하는 자동 흐름.

상태: `SYSTEM_UI_REWORK_REQUIRED_AGAINST_CURRENT_CANON`.

### 대화 화면

파일: `마법_온실의_식물학_강의실.png`

승인된 것:
- 반신 Anime Cel 캐릭터 구성.
- 같은 장소 Storybook 배경.
- Navy/Gold 대화 Frame.
- 하단 선택지 구성.

승인되지 않은 것:
- 생성된 인물 이름.
- 생성된 대사 문구.
- 캐릭터 정확한 정체·의상·관계 설정.

상태: `DIALOGUE_VISUAL_DIRECTION_APPROVED`.

### 이동 화면

이전 생성된 3D-like 온실 회랑 탐험 화면은 **대표 화면으로 승인되지 않았다**.

현재 승인된 방향은 `3D X / 더 단순한 2D 이동·장면 전환`뿐이다. 정확한 2D 방식은 다음 채팅에서 대화로 정한 뒤 생성한다.

## 5. Stock / Circuit / Spell Authoring — 반드시 지켜야 할 의미

다음 이미지 작업에서 가장 중요한 오류 방지 구역이다.

### Stock

```text
Typed Glyph Stock 1
= 숙련한 특정 글자 1회를 직접 다시 그리지 않고 회로에 배치할 수 있는 준비량
```

- 완성 주문 Stock이 아니다.
- 자동 정답 주문이 아니다.
- Target/Edge는 Stock을 먹지 않는다.
- 직접 그리기는 획득·학습·보충 경로이며 기본 전투에 매번 의무가 아니다.

`docs/planning/STOCK_SYSTEM.md`에는 2026-08-04 시점의 역사적 3×3 표현이 일부 남아 있다. **회로 topology가 충돌하면 반드시 최신 `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`을 우선한다.**

### Circuit

```text
FIVE_POINT_STAR
center: exactly 1 Main Glyph
outer vertices: 0–5 equivalent Auxiliary Glyphs
```

- 외곽 vertex별 숨은 보너스 없음.
- Target을 회로 node 안에 넣지 않는다.
- best-route/교수 정답/auto-target/auto-commit 금지.

### Spell workflow

```text
Stage 1 — Glyph Drawing / Vault acquisition
Stage 2 — Circuit Placement / Prepared Spell creation
Stage 3 — Targeted Spell Use
```

Stage 2:
- Vault + Typed Stock에서 글자를 가져와 회로를 설계.
- 배치 중에는 resource를 예약.
- Circuit Preview는 target-independent.
- 주문 확정 시 예약된 글자 자원을 exactly-once 소비하고 Prepared Spell 생성.
- 이 단계에서 Mana는 소비하지 않음.
- Target 선택 없음.

Stage 3:
- Prepared Spell 선택.
- 관찰된 Target keyword/대상 선택.
- Target 적용 Final Preview.
- final success / effect / risk / Mana 확인.
- 명시적 사용에서만 Mana exactly-once 소비 및 결과 적용.

실제 `SpellWorkflowCoordinator`와 `AtomicSpellPreparationService`도 이 Stage 2/3 분리를 구현한다.

## 6. 다음 이미지 논의 후보 — 아직 최종 Brief 아님

다음 3장 묶음이 가장 자연스러운 후보지만 **새 채팅에서 먼저 대화하고 Brief를 승인한 뒤 생성**한다.

1. Glyph Drawing / Vault 획득 화면.
2. Vault + Stock으로 FIVE_POINT_STAR 회로를 만드는 Stage 2 화면.
3. Prepared Spell을 상황의 Target에 사용하는 Stage 3 화면.

최신 사용자 지시가 `3장씩`이었더라도 그 뒤 `나머지는 다시 대화먼저`라고 했으므로, **대화/Brief 승인 없이 3장을 바로 생성하지 않는다.**

## 7. Notion 정본

사람용 Visual 정본:

- `GRIMOIRE · Home`
- `02 · 비주얼 바이블`
- `승인 시각 방향 · 2026-08-25 · Logo 01 + Magic Anime`
- `대표 화면 참고 기준 · 전투/주문 + 대화 · 2026-08-25`

대표 화면 Notion page에는 battle/spell PNG와 dialogue PNG가 Notion native file attachment로 존재한다.

## 8. Google Sheet drift

2026-08-25 fresh read에서도 `00_프로젝트_허브`가 v4.5-era binding, 과거 main SHA, `open project PR 0`을 current처럼 표시한다.

따라서:

```yaml
google_sheet: MIGRATION_ONLY
new_canon_write: PROHIBITED
stale_current_rows: AUDIT_EVIDENCE_ONLY
```

GitHub/Notion current authority와 Sheet가 충돌하면 Sheet가 이기지 않는다.

## 9. GitHub concurrency

- 현재 기존 draft PR `#166`은 다른 문서 workstream이며 READ_ONLY.
- 다른 open PR의 branch/content를 흡수·rebase·close하지 않는다.
- 새 시각 작업은 latest completed main에서 별도 branch/PR로 진행한다.

## 10. 문제와 교훈

이번 세션에서 확인한 핵심 문제:

1. 생성 이미지가 시각적으로 좋더라도 시스템 정본과 어긋날 수 있다.
2. 사용자의 `좋다/맘에 든다`는 이미지 전체의 모든 embedded mechanics/copy/fiction을 승인한다는 뜻이 아니다.
3. 시각 승인과 시스템 승인 범위를 분리하지 않으면 다음 이미지가 잘못된 메커닉을 반복한다.
4. Notion에 이미지를 올렸다고 말하려면 실제 native attachment readback이 필요하다.
5. 임시 transport를 썼다면 transport 삭제 후에도 Notion attachment가 남아 있는지 확인해야 한다.
6. 이미지 생성 전에 current domain canon을 읽고, 생성 뒤에는 drift를 `KEEP / REWORK / NONCANON`으로 분리 기록하는 것이 재작업 비용을 줄인다.

상세 교훈: `docs/planning/lessons/2026-08-25-visual-generation-approval-boundary-lessons.md`.

## 11. 새 채팅 시작 문구

아래 문구로 시작하면 된다.

```text
GRIMOIRE 비주얼 작업 이어가자.
먼저 latest Base main, GRIMOIRE latest completed main/open PR, Notion의 승인 시각 방향과 대표 화면, Google Sheet migration drift를 fresh read해.
구현은 내가 "구현 작업 하자"고 하기 전까지 시작하지 마.
현재는 Logo 01 + Magic/Anime 방향, 대표 전투 화면의 분위기/구도, 현재 대화 화면이 승인됐다.
전투 화면의 Stock/회로/주문 UI는 재작업 대상이고, 이동은 3D가 아니라 더 단순한 2D 방향이다.
Stock은 완성 주문이 아니라 Typed Glyph 1회 배치량이고, 회로는 FIVE_POINT_STAR, 주문은 Glyph Drawing → Circuit/Prepared Spell → Targeted Use의 3단계다.
다음 이미지는 먼저 대화해서 Brief를 합의한 뒤 생성해.
`docs/planning/handoffs/2026-08-25-visual-production-handoff.md`를 기준으로 계속해.
```

## 12. Evidence ceiling

이 handoff는 시각/문서 정리다.

```yaml
new_product_implementation: NOT_PERFORMED
Task8_progress_from_this_visual_session: NONE
runtime_validation: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```
