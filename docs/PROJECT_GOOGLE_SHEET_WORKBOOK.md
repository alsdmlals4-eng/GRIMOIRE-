# GRIMOIRE 프로젝트 Google Sheets Workbook

```yaml
project: GRIMOIRE: 세계를 다시 쓰는 법
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
required_tabs: 27
last_full_audit: 2026-08-02
primary_platform: Mobile
follow_up_platform: PC
platform_decision: GM-PLATFORM-02
next_product_gate: MOBILE-FOUNDATION-01
base_release: 9.4.0
sync_bundle: GR-SYNC-20260802-07
sync_status: SYNCED_TO_WORKING_BRANCH
authority_commit: b9279e8c690a8406035675ebbe8a007e9b3f093f
main_baseline_commit: 3ecf67cb9e39145976c66cb1f0bc2c42d9c17d03
sheet_readback: PASS
main_sync: PENDING_PR_MERGE
sync_receipt: docs/planning/sync/GR-SYNC-20260802-07-WORKING.md
```

Sheet는 사용자가 기획을 확인·수정하는 작업면이다. GitHub 승인 책임 원본, 계획 JSON, 실제 구현과 함께 읽으며 Sheet 단독 값으로 승인·구현·검증 완료를 확정하지 않는다.

## 1. 필수 탭

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `03_근거_라이브러리`
- `04_누락_충돌_감사`
- `05_GDD_요약`
- `10_제품방향`
- `11_세계관`
- `12_핵심루프`
- `13_주요인물`
- `14_조연_세력_관계`
- `15_조작_게임규칙`
- `20_코어경험_데모목표`
- `30_데모범위_품질기준_제작기반`
- `40_핵심시스템_메인콘텐츠`
- `41_성장_경제`
- `50_메인콘텐츠`
- `51_미니게임`
- `52_글쓰기_서사`
- `60_UX_UI_접근성`
- `70_아트_오디오_에셋`
- `71_이미지기획_생성목록`
- `72_이미지검수_승인로그`
- `80_데모_버티컬슬라이스_플레이테스트`
- `90_본제작_출시_사업`
- `98_Base_반영후보`
- `99_변경이력`

## 2. 현재 핵심 상태

```yaml
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
asset_spec_01: APPROVED_SPEC
platform: MOBILE_FIRST_PC_FOLLOW_UP
next_product_gate: MOBILE-FOUNDATION-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## 3. 책임 매핑

| Sheet 의미 | GitHub 책임 원본 |
|---|---|
| 프로젝트 코어·Slice | `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md` |
| 현재 결정 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| Mobile 우선 | `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md` |
| 현재 감사 | `docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md` |
| Working Sync | `docs/planning/sync/GR-SYNC-20260802-07-WORKING.md` |
| Art Style | `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md` |
| Art Bible | `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md` |
| 전투 승패·진정 | `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md` |
| Asset Spec | `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md` |
| 개발 Gate | `docs/DEVELOPMENT_GATES.md` |
| Base Adapter | `skills/PROJECT_BASE_ADAPTER.json` |
| 동기화 정책 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` |

## 4. GR-SYNC-20260802-07 결과

Decision ID:

- `GM-PLATFORM-02` — Mobile 우선·PC 후속, `GM-PLATFORM-01` 대체.

사실 교정:

- Base `v9.4.0`과 main `3ecf67c...`.
- `ASSET-SPEC-01 / APPROVED_SPEC`.
- 다음 Gate `MOBILE-FOUNDATION-01`.
- 구현 `NOT_STARTED`, Runtime·Mobile device·Human `NOT_RUN`.

반영 Sheet:

- 공통: `00`, `01`, `02`, `04`, `05`, `99`.
- 제품 방향·Gate: `10`, `20`, `30`, `90`.
- Mobile 영향: `15`, `60`, `70`, `80`.

Readback:

- Hub·결정·입력·UX·Asset·Playtest·출시·Audit·History를 재조회해 `PASS`.
- `60_UX_UI_접근성` 최초 위치 오류를 발견해 `GR-UX-13`은 Mobile interruption, `GR-UX-14`는 승인 PC 규격 보존+Mobile 재검증으로 교정한 뒤 재조회해 `PASS`.
- Sheet `04`와 `99`에 Readback와 남은 `NOT_RUN`을 기록.

## 5. 즉시 동기화 규칙

```text
Decision ID 확정
→ GitHub Authority·State·Registry 갱신
→ Authority Commit
→ 관련 Sheet 범위 갱신
→ GitHub·Sheet Readback
→ Sync Receipt
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

## 6. 상태 계약

| 상태 | 의미 |
|---|---|
| `PROPOSED_SHEET_CHANGE` | GitHub 승인 근거 없는 Sheet 단독 편집 |
| `GITHUB_ONLY` | GitHub 반영, Sheet 실패·대기 |
| `SHEET_ONLY` | Sheet 반영, GitHub 실패 |
| `SYNCED_TO_WORKING_BRANCH` | 작업 브랜치 Commit과 Sheet가 같은 Decision ID·값으로 Readback 됨 |
| `SYNCED_TO_MAIN` | PR 병합 후 main Commit과 Sheet가 다시 일치 |
| `SYNC_CONFLICT` | 값·상태·책임 경로 충돌 |

## 7. 보존·검증 경계

- 과거 `GM-PLATFORM-01`, PR #22, Base v9.3 기록은 변경이력에서 삭제하지 않고 역사로 보존한다.
- 활성 허브·요약·결정·Gate에서는 `GM-PLATFORM-02`, Base v9.4, Asset Spec 완료를 사용한다.
- Sheet는 실제 Code·Scene·Resource·Asset·Test를 대체하지 않는다.
- 잠긴 이미지의 예시 이름·수치·파티 수는 자동 정본이 아니다.
- Prototype 수치와 사람 검증이 없는 상태는 `PLAYTEST_TUNING_REQUIRED / NOT_RUN`이다.
- Generated Views·Generator·CI·Runtime·Mobile device·Performance·Accessibility·Human은 아직 `NOT_RUN` 또는 `PENDING`이다.
- 완료 보고에는 Decision ID, GitHub 경로, authority commit, Sheet 범위, Readback, 남은 미검증을 포함한다.
