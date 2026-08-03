# GR-SYNC-20260803-03 — 인게임 아트 Board A·B 승인 Working Sync

## 1. 상태

```yaml
sync_id: GR-SYNC-20260803-03
status: EARLY_CHECKPOINT_APPROVED_CANON_AND_SHEET_DRIFT_CORRECTION_IN_PROGRESS
decision_ids:
  - GM-STOCK-SYSTEM-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
  - GM-GRILL-WORK-QUALITY-GATE-01
  - GM-MOBILE-SUMMON-HUD-WIREFRAME-01
  - GM-INGAME-ART-CHECKPOINT-01
latest_approved_option: A_TWO_BOARD_SCENE_SET_WITH_CANON_BOUNDARY
latest_decision_approved_at: 2026-08-03T08:40:00+09:00
early_checkpoint_approved_at: 2026-08-03T09:07:00+09:00
early_checkpoint_option: A_EARLY_CHECKPOINT_AT_6_OF_10
early_checkpoint_counts_as_new_decision: false
early_checkpoint_reason: DIFF_SIZE_AND_CANON_DRIFT
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
working_branch: agent/grimoire-stock-summon-detail-audit
pull_request: 51
last_verified_head_before_checkpoint_corrections: ba0a73cdf6760e23eb87da6222870485f2d8f650
last_verified_ci_run: 30773199505
last_verified_ahead: 68
last_verified_behind: 0
last_verified_changed_files: 27
grill_counter: 6_of_10
pending_decisions: 6
sheet_readback: RECHECK_REQUIRED_AFTER_CHECKPOINT_WRITE
sheet_text_integrity_sentinel: RECHECK_REQUIRED_AFTER_CHECKPOINT_WRITE
pre_checkpoint_ci_gate: PASS
pre_checkpoint_adversarial_gate: PASS
pre_checkpoint_text_integrity_gate: PASS
pre_checkpoint_review_threads: 0
current_head_ci: REQUIRED_AFTER_ALL_CHECKPOINT_CORRECTIONS
merge_authorization: NOT_RECEIVED
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 2. 사용자 승인

사용자는 현재 대화에서 생성된 다음 두 이미지를 모두 승인했다.

- `GR-VISUAL-CHECKPOINT-BOARD-A-01`.
- `GR-VISUAL-CHECKPOINT-BOARD-B-01`.

사용자는 이후 PR #51을 10건까지 확장하지 않고 `6/10`에서 조기 체크포인트로 닫는 권장안 A를 승인했다. 이 승인은 새 기획 Decision이 아니며 PR 병합 권한도 아니다.

## 3. 승인 Board

### Board A

```text
Main Screen
→ Daily Life / Free Schedule
→ Class / Glyph Practice
→ Festival / Campus Event
```

### Board B

```text
Battle Observe / Summon Control
→ Writing Focus / Battle
→ Summon Event / Support Activation
→ Result / Return
```

## 4. 승인 범위

- 장면 세트와 화면 간 플레이 여정.
- Soft Storybook 환경 + Clean Anime Cel 캐릭터.
- Navy/Gold Magic Academy UI 언어.
- 고정 주인공과 메인 늑대형 동반 정령의 화면 연속성.
- 좌측 `MAIN → S1 → S2 → S3` Rail과 우측 Writing Panel의 시각적 공존.
- 보조 소환수의 상시 몸체 대신 역할 배지와 짧은 Cut-in·FX 사용.
- 결과가 환경 변화와 원래 장소 복귀로 이어지는 구성.

## 5. 비정본 자리표시자

다음은 승인으로 확정되지 않는다.

- 이미지 내 영문 문구와 최종 현지화.
- 레벨·재화·HP·MP·Stock·Timer·Grade.
- 적·장소·수업·Quest 이름.
- Main·Daily 화면 최종 메뉴 구조.
- Board B의 `[공격] +3`, `[치유] +3`.
- `Support Chain Complete`의 일괄 자동 연쇄 해석.
- 최종 Pixel·Touch·Safe Area 값.

시스템 정본 `[스톡] 2 / [방어도] 2 / [공격] 2 / [치유] 2`와 5초 주기·원자 Event 계약을 계속 우선한다.

## 6. Library 보존

### Board A

- Path: `/GRIMOIRE/Visual Checkpoints/GRIMOIRE_INGAME_CHECKPOINT_BOARD_A_APPROVED_2026-08-03.png`.
- File ID: `file_00000000a31c82069fa4987ca422e01d`.
- SHA-256: `4ac1fe1f5c35e019b2941c4bffdb6b128ed8ba198e4dd68c25f7ef6fad120882`.

### Board B

- Path: `/GRIMOIRE/Visual Checkpoints/GRIMOIRE_INGAME_CHECKPOINT_BOARD_B_APPROVED_2026-08-03.png`.
- File ID: `file_00000000ca6882068e24267ec1ab4c00`.
- SHA-256: `9dd562a091fe41f92be2fc0525b49b770ecc3a2bdc151262cdd52b1085771074`.

## 7. GitHub 반영

- `docs/planning/INGAME_ART_CHECKPOINT_01_APPROVAL_2026-08-03.md`.
- `docs/planning/visual/INGAME_ART_CHECKPOINT_01_APPROVED_MANIFEST.json`.
- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- 이 Working Sync.

대형 Registry는 후속 정본 통합 때 위 승인 문서와 Manifest를 canonical route로 흡수한다. 현재 Cold-start 경로는 `ACTIVE_CONTEXT.md`와 `START_HERE.md`에서 직접 연결한다.

## 8. Benchmark·현업 비교

```yaml
benchmark_status: N_A_NO_NEW_DESIGN_CHANGE
reason: USER_APPROVAL_OF_ALREADY_GENERATED_SCENE_SET_AND_MECHANICAL_CANON_DRIFT_CORRECTION
reused_authorities:
  - ART-STYLE-01
  - ART-BIBLE-01
  - GR-BM-MOBILE-SUMMON-HUD-20260803-01
  - GM-GRILL-MERGE-CADENCE-01
adversarial_review: REQUIRED_AND_RECORDED
```

새 외부 사례를 추가하지 않고 기존 승인 Art Bible, Mobile HUD Benchmark, Base의 최대 10건·조기 체크포인트 정책을 재사용했다.

## 9. 적대적 검토

### PASS

- 요청된 메인·일상·수업·축제 화면이 Board A에 포함된다.
- 전투·Writing·소환 Event·결과 화면이 Board B에 포함된다.
- 두 Board의 주인공·메인 동반 정령·UI Frame이 연속된다.
- 보조 3체는 상시 몸체가 아니라 배지·순간 FX로 표현된다.
- 결과가 환경 변화로 연결된다.
- `6/10`에서 새 기획을 멈추고 정본·Sheet 드리프트만 교정하므로 배치 범위가 더 커지지 않는다.

### 보호 경계

- 작은 생성 텍스트는 최종 UI 품질·현지화 증거가 아니다.
- 이미지 수치는 기획 수치를 덮어쓰지 않는다.
- 정적 Board는 Touch·Safe Area·성능·접근성 검증이 아니다.
- 승인 Board는 Runtime Screenshot 또는 최종 Asset이 아니다.
- 조기 체크포인트 승인은 병합 승인이 아니다.

## 10. Sheet Readback

기존 승인 시 다음 탭에 같은 Decision·Sync ID를 기록하고 재조회했다.

```text
00·01·02·03·04·05·60·80·99
```

- `GM-INGAME-ART-CHECKPOINT-01`: PASS.
- Board A·B 2장: PASS.
- Grill `6/10`, pending `6`: PASS.
- 비정본 자리표시자 경계: PASS.
- 대체문자 검색: 0건.
- 한글·기호 Readback: PASS.

조기 체크포인트 교정에서는 다음을 같은 `GR-SYNC-20260803-03` 범위로 다시 기록한다.

- PR #51 조기 체크포인트 승인과 병합 미승인 상태.
- 최신 기술·로드맵 상태.
- `GR-S-02`의 글자 조합과 소환수 용어 분리.
- GitHub 최종 교정 HEAD·CI·Readback.

## 11. 검증된 직전 HEAD

```text
HEAD ba0a73cdf6760e23eb87da6222870485f2d8f650
→ main ahead 68 / behind 0
→ changed files 27
→ CI run 30773199505 PASS
→ Generator PASS
→ Unit PASS
→ JSON PASS
→ UTF-8/NFC PASS
→ Adversarial Gate PASS
→ Review threads 0
→ Reviews 0
```

이 조기 체크포인트 교정으로 HEAD가 전진하므로 모든 GitHub·Sheet 수정이 끝난 현재 PR HEAD에서 동일 Gate를 다시 확인해야 한다.

## 12. 조기 체크포인트 계약

```yaml
checkpoint: USER_APPROVED
approved_option: A_EARLY_CHECKPOINT_AT_6_OF_10
counts_as_new_decision: false
counter_after_approval: 6_of_10
new_questions_allowed_before_close: false
allowed_changes:
  - CANON_STATUS_ALIGNMENT
  - SHEET_STATUS_ALIGNMENT
  - TERMINOLOGY_DISAMBIGUATION
  - EXACT_HEAD_REVALIDATION
forbidden_changes:
  - NEW_GAMEPLAY_DECISION
  - PRODUCT_IMPLEMENTATION
  - ASSET_PRODUCTION
  - MERGE_WITHOUT_EXPLICIT_APPROVAL
```

완료 순서:

```text
GitHub 정본 교정
→ Sheet 상태·용어 교정
→ 양쪽 Readback
→ 현재 PR HEAD CI·Adversarial·Text Integrity
→ 사용자에게 결과와 Commit 보고
→ 사용자 명시 병합 승인 대기
```

## 13. 다음 Gate

PR #51 체크포인트를 닫고 사용자 명시 병합 승인을 받은 뒤에만 다음 기획으로 이동한다.

```text
GM-MOBILE-SUMMON-HUD-WIREFRAME-01 사용자 명세 검토
→ TDD Plan·Test Matrix
→ Godot Toolchain preflight
→ Base v9.4.3 Plan 재검증
→ Execution Readiness
```

## 14. 보호 경계

```text
APPROVED_VISUAL_BOARDS = 2
FINAL_RUNTIME_SCREEN = NOT_APPROVED
FINAL_UI_TEXT = NOT_APPROVED
FINAL_NUMBERS = NOT_APPROVED
FINAL_ASSET_PRODUCTION = NOT_AUTHORIZED
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
USER_MERGE_APPROVAL = NOT_GIVEN
```