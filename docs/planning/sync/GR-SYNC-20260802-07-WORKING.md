# GR-SYNC-20260802-07 — Working Branch Sync Receipt

```yaml
sync_id: GR-SYNC-20260802-07
decision_id: GM-PLATFORM-02
status: SYNCED_TO_WORKING_BRANCH
recorded_at: 2026-08-02 KST
authority_commit: b9279e8c690a8406035675ebbe8a007e9b3f093f
verified_code_head: 3aa1b7cd2bd49362e20982f63abb8182345e14c0
main_baseline: 3ecf67cb9e39145976c66cb1f0bc2c42d9c17d03
working_branch: chatgpt/grimoire-mobile-first-canon-20260802
pull_request: 27
primary_platform: Mobile
follow_up_platform: PC
next_product_gate: MOBILE-FOUNDATION-01
sheet_readback: PASS
generator_check: PASS
unit_tests: PASS
json_registry_check: PASS
adversarial_gate: PASS
ci_run: 30728081535
main_sync: PENDING_PR_MERGE
```

## Decision

`GM-PLATFORM-02`는 1차 플랫폼을 `Mobile`, 후속 플랫폼을 `PC`로 확정하고 `GM-PLATFORM-01 / PC 우선·Mobile 후속`을 활성 제품 방향에서 대체한다. 과거 PC-first 기록과 승인된 PC 해상도 규격은 역사·후속 적응 자료로 보존한다.

## GitHub Authority

Authority commit `b9279e8c690a8406035675ebbe8a007e9b3f093f`에서 다음 권위 경로를 먼저 반영했다.

- `AGENTS.md`
- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`
- `docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md`
- `docs/superpowers/plans/2026-08-02-mobile-first-canon-reconciliation.md`
- `skills/PROJECT_BASE_ADAPTER.json`

후속 운영 검증에서 다음 경로도 정합화했다.

- `tools/generate_project_operating_views.py`
- `tests/test_base_v9_adoption.py`
- `skills/PROJECT_SKILL_SNAPSHOT.json`
- `skills/BASE_V9_ADAPTER.json`
- `skills/PROJECT_BASE_SKILL_ADAPTER.json`

## Google Sheet

Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.

반영 탭:

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `04_누락_충돌_감사`
- `05_GDD_요약`
- `10_제품방향`
- `15_조작_게임규칙`
- `20_코어경험_데모목표`
- `30_데모범위_품질기준_제작기반`
- `60_UX_UI_접근성`
- `70_아트_오디오_에셋`
- `80_데모_버티컬슬라이스_플레이테스트`
- `90_본제작_출시_사업`
- `99_변경이력`

Readback 검증:

- Hub: `Mobile 우선 / PC 후속`, Base v9.4, Asset Spec 승인, 현재 `MOBILE-FOUNDATION-01`.
- Decision: `GM-PLATFORM-02 / USER_APPROVED_ACTIVE / authority b9279e8`.
- 입력: Touch·Stylus 우선, 화면 Undo·삭제·취소·확정·`[구현]`, PC Mouse/Keyboard 후속.
- UX: Mobile interruption 계약 `GR-UX-13`, 승인 PC 규격 보존과 Mobile 재검증 `GR-UX-14`.
- Playtest: `GR-TEST-012` App pause/resume·background/foreground·stale recognition 검증 추가.
- 출시 경로: Mobile Demo 검증 후 본제작·PC 적응.
- Audit·History: `GR-AUD-20260802-MOBILE-CANON`, `GR-SYNC-20260802-07` Readback PASS.

## Adversarial Corrections

### Sheet 위치 오류

최초 Sheet patch가 `60_UX_UI_접근성`의 `GR-UX-13` 위치를 Mobile 화면 규격으로 덮고 기존 `GR-UX-14` PC 전용 행을 남긴 것을 Readback에서 발견했다.

교정:

- `GR-UX-13`: Mobile 입력 중단·복귀·stale request·중복 Commit/Reward/Save 방지 계약.
- `GR-UX-14`: 승인 PC 해상도 규격을 후속 참고로 보존하고 Mobile 방향·비율·Safe Area·Touch 판독은 재검증 대상으로 명시.

교정 후 두 행과 Audit·History 상태를 다시 읽어 `PASS`를 확인했다. 과거 리비전 45는 식별했으나 커넥터의 과거 Spreadsheet text 변환 오류로 직접 복구하지 못했으며, 승인 PC 규격을 현재 행에서 보존해 손실을 방지했다.

### Generator 하드코딩

첫 PR CI는 단순 생성물 누락이 아니라 Generator가 다음 값을 하드코딩한 사실을 검출했다.

- 다음 Gate `ASSET_SPEC_01`.
- 1차 플랫폼 `PC`, 후속 `Mobile`.
- Touch를 후속 검증으로 취급.
- 승인된 Asset Spec 이후에도 대량 Asset 생성을 `BLOCKED_BY_ASSET_SPEC`로 표시.

Systematic debugging과 RED→GREEN 최소 재현 후 Generator를 Adapter 파생형으로 교정했다.

- `next_gate`는 `current_state.next_product_gate`에서 파생.
- 플랫폼은 `project.primary_platform/follow_up_platform`에서 파생.
- Mobile 우선이면 Touch 상태는 `PRIMARY_VALIDATION_REQUIRED`.
- Asset Spec 승인 후 Asset 제작 차단 원인은 `BLOCKED_BY_EXECUTION_PROFILE`.
- 회귀 테스트는 Adapter와 3개 생성물의 플랫폼·Gate·Asset 상태 일치를 검사.

Adapter SHA-256 `5df9840dd07b0cb93132471d9a2c7e12cc7ebf4d581c8f5cac8c3c26689aacdb`에서 Snapshot·Compatibility View를 재생성했다.

## Verification Evidence

PR #27, head `3aa1b7cd2bd49362e20982f63abb8182345e14c0`, workflow run `30728081535`:

- `python tools/generate_project_operating_views.py --check`: `PASS`.
- `python -m unittest tests.test_base_v9_adoption`: `PASS`.
- JSON·Registry·권위 경로 검증 단계: `PASS`.
- Adversarial gate: `PASS`.
- GitHub mergeability: `true`, Draft 유지.

로컬 clone은 실행 환경 DNS가 `github.com`을 해석하지 못해 `LOCAL_VERIFY_BLOCKED`였지만, 동일 검사는 GitHub Actions의 실제 PR merge ref에서 통과했다.

## Protected Scope

변경하지 않음:

- 프로젝트 코어·플레이어 약속.
- Vertical Slice와 45~50/53/60분 계약.
- `ART-STYLE-01`, `ART-BIBLE-01`, `GM-BATTLE-RULES-01`, `ASSET-SPEC-01` 승인 사실.
- 잠긴 기준 이미지 SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- `PLANNING_ONLY_PROFILE`, 구현 `NOT_STARTED`, Codex `BLOCKED`.

## Remaining Evidence Gaps

```text
GITHUB_AUTHORITY_AND_SHEET = SYNCED_TO_WORKING_BRANCH
GENERATOR_AND_GENERATED_VIEWS = PASS
UNIT_AND_JSON_REGISTRY_CHECKS = PASS
ADVERSARIAL_GATE = PASS
PR_STATE = DRAFT_OPEN
MAIN_SYNC = PENDING_USER_REVIEW_AND_MERGE
GODOT_PROJECT = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

## Next Work

```text
사용자 PR 검토
→ main 병합 승인 시 병합
→ main·Sheet 재검증 및 SYNCED_TO_MAIN 영수증
→ MOBILE-FOUNDATION-01
  → Touch·Stylus interaction contract
  → orientation/aspect/safe-area decision packet
  → mobile interruption/resume state machine
  → device/performance validation matrix
  → small-screen Battle/Writing layout proof
→ BOSS-PHASE-01·GRIMOIRE-SCREEN-01 영향 재검토
→ AUDIO-DIRECTION-01
→ 통합 검수
```

Android/iOS, Store, Landscape/Portrait, 최소 기기, 성능·메모리·배터리 수치, 인식 처리 방식은 사용자 결정과 Prototype 증거 전까지 확정하지 않는다.
