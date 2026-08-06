# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| Active Contract | `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION v4.3` |
| Contract Binding | `GM-CONTRACT-V4-3-BINDING-01` |
| Tool Authority Decision | `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01` |
| Product Decision | `GM-SPELL-WORKFLOW-UI-V2-01` |
| Preserved Runtime Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Runtime Main | `FIVE_POINT_STAR / TYPED_GLYPH_ONLY` |
| UI Kit Merge | `PR #77 / 8165ac98` |
| Spell Workflow Design·Plan Merge | `PR #78 / 6c39ab68` |
| Spell Workflow Implementation | `PR #82 / Task 1 GREEN / PAUSED` |
| Tool Authority Design | `PR #83 / merged main 252063cc` |
| GUT Adoption Spec | `PR #84 / Draft / IN_REVIEW` |
| Current Gate | `BLOCKED_BY_GUT_ADOPTION_SPEC` |
| Review Model | `GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY` |
| HiGodot | `SOLE_AUTHORING_AUTHORITY / SOURCE_VERSION_UNVERIFIED` |
| GUT | `9.7.1 / VENDORED_NOT_CONSUMED / SPEC_ONLY` |
| Audio Vault | `C:/Users/user/Documents/GitHub/shered audio vault / BLOCKED_UNVERIFIED` |
| Base | `9.4.3 pinned / main 4f98f968 observed` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |

## 활성 계약 바인딩

```text
docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
```

v4.3 원문의 Switchy-Express 경로는 범용 예시다. GRIMOIRE 권위 경로는 `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-`다.

v4.3에서는 다음이 필수다.

- Decision Ledger·미확정 목록·이미지 검수 Sheet readback 후 entry status 재판정.
- `[이미지 완료]`를 `[이미지·오디오 완료]`로 호환 해석.
- 공유 오디오 Vault 우선 inventory와 출처·권리·hash 검증.
- GUT formal installation 전 adoption-spec 전용 Draft PR 병합.
- 별도 인간 reviewer를 가장하지 않고 역할 분리 검토·사용자 결정권·GUT/CI·exact-HEAD 증거 사용.

## 주문 흐름

```text
글자 그리기 → 회로 배치 → 주문 사용
```

- 글자 그리기: 인식·획득·보관함 저장.
- 회로 배치: 보관함·스톡 글자를 사용해 FIVE_POINT_STAR 주문을 완성하고 글자만 소비.
- 주문 사용: 대상 선택·상세 예상·마나 소비·실제 판정.

PR #82 Task 1의 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환은 GREEN이다. Task 2는 GUT adoption-spec·formal installation·남은 Gate가 닫히기 전 시작하지 않는다.

## 저작·테스트 권위

- HiGodot/Godot AI는 `project.godot`, Scene·Node·Resource·Theme·Animation·signal·Project Settings의 단일 저작 권위다.
- GUT은 제품 결과를 읽고 실행하는 테스트 권위이며 production 파일을 수정하지 않는다.
- 초기 채택은 CLI-only다. GUT Editor Plugin은 활성화하지 않으며 `project.godot`을 변경하지 않는다.
- 실제 GUT product test·CI·JUnit·hash·legacy parity·HiGodot manifest Gate는 아직 `NOT_IMPLEMENTED`다.

채택 명세:

```text
docs/testing/GUT_9_7_1_ADOPTION_SPEC.md
docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md
```

## 동결된 구현 브랜치

```yaml
branch: agent/gut-9-7-1-formal-adoption-tdd
status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
merge_authorized: false
```

이 브랜치는 v4.3 adoption-spec Gate보다 먼저 시작되어 동결됐다. PR #84 병합 후 최신 main에서 새 구현 브랜치를 만든다.

## 시각·오디오 상태

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
awaiting_user_direction_approval: false
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
audio_vault_path: BLOCKED_UNVERIFIED
audio_rights: BLOCKED_UNVERIFIED
```

## Godot에서 열기

```text
GRIMOIRE-/project.godot
└─ Main Scene: res://src/ui/star_circuit_harness.tscn
```

Godot 4.7.1 CI target, 1280×720 Mobile Landscape, GL Compatibility다. 로컬 exact executable과 clean-main runtime은 접근 불가로 검증하지 못했다. UI v2 Main Scene 전환은 전체 구현·GUT/legacy 회귀·렌더·HiGodot manifest PASS 전 금지한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md`
3. `docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json`
4. `docs/ACTIVE_CONTEXT.md`
5. `docs/DEVELOPMENT_GATES.md`
6. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
8. `docs/testing/GUT_9_7_1_ADOPTION_SPEC.md`
9. `docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md`
10. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
11. `docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md`
12. `docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md`

다음 작업은 PR #84의 Sheet 동기화·exact-HEAD CI·역할 분리 검토다. PR #84가 merged main에 존재하기 전에는 GUT formal installation을 시작하지 않는다.
