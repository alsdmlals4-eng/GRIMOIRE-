# GRIMOIRE 프로젝트 Google Sheets Workbook

## 현재 계약

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
project_sheet_status: PROJECT_SHEET_CONFIGURED
spreadsheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
workbook_role: USER_FACING_GDD_WORKSPACE
sheet_edit_policy: IMMEDIATE_APPROVED_CANON_SYNC
canon_sync_policy_id: GM-CANON-SYNC-01
required_tabs: 27
primary_platform: Mobile
follow_up_platform: PC
base_release: v9.4.3
base_registry_route_commit: c987647d01ad2baa028a16e03d85ddfc1572a727
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
merged_pull_request: 68
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_bundle: GR-SYNC-20260806-01
sync_status: SYNCED_TO_MAIN
sheet_readback: PASS
main_sync: MERGED_AND_READBACK_PASS
sync_receipt: docs/planning/sync/GR-SYNC-20260806-01-MAIN.md
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

Sheet는 사용자가 기획을 확인·수정하는 작업면이다. GitHub 승인 책임 원본, 계획, 실제 구현 및 검증과 함께 읽으며 Sheet 단독 값으로 승인·구현·검증 완료를 확정하지 않는다.

## 필수 탭

1. `00_프로젝트_허브`
2. `01_작업순서`
3. `02_현재_확정결정`
4. `03_근거_라이브러리`
5. `04_누락_충돌_감사`
6. `05_GDD_요약`
7. `10_제품방향`
8. `11_세계관`
9. `12_핵심루프`
10. `13_주요인물`
11. `14_조연_세력_관계`
12. `15_조작_게임규칙`
13. `20_코어경험_데모목표`
14. `30_데모범위_품질기준_제작기반`
15. `40_핵심시스템_메인콘텐츠`
16. `41_성장_경제`
17. `50_메인콘텐츠`
18. `51_미니게임`
19. `52_글쓰기_서사`
20. `60_UX_UI_접근성`
21. `70_아트_오디오_에셋`
22. `71_이미지기획_생성목록`
23. `72_이미지검수_승인로그`
24. `80_데모_버티컬슬라이스_플레이테스트`
25. `90_본제작_출시_사업`
26. `98_Base_반영후보`
27. `99_변경이력`

## 최신 결정 책임 매핑

| Sheet 의미 | GitHub 책임 원본 |
|---|---|
| 현재 결정 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| 별형 회로 승인 | `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md` |
| 상세 설계 | `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md` |
| 회로·성공률 | `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md` |
| 마나·정밀·절감 | `docs/planning/MANA_SYSTEM.md` |
| 글자별 숙련도 | `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md` |
| 상태 색인 | `docs/planning/CANON_STATUS_INDEX_2026-08-04.md` |
| Main Sync | `docs/planning/sync/GR-SYNC-20260806-01-MAIN.md` |
| 개발 Gate | `docs/DEVELOPMENT_GATES.md` |
| Base Adapter | `skills/PROJECT_BASE_ADAPTER.json` |
| 동기화 정책 | `docs/planning/PROJECT_CANON_SYNC_POLICY.md` |

## GR-SYNC-20260806-01 반영 결과

Decision ID: `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`.

반영된 핵심 계약:

- `FIVE_POINT_STAR`: 중앙 메인 1개와 별 꼭짓점 보조 0~5개.
- 회로 Preview 뒤 대상 키워드 선택, 이후 최종 마나·숫자 성공률 Preview.
- 글자별 숙련도 `0~100`.
- 보조 성공률 복잡도 `0,-10,-20,-30,-40,-50%p`.
- 보조 마나 복잡도 `0,+10,+20,+30,+40,+50%`.
- `PRECISION`: 마나 +25%, 성공률 `숙련도÷10%p`.
- `REDUCTION`: 마나 `10%+숙련도÷10` 감소, 직접 성공률 보너스 없음.
- 1학년 집중 숙련 기준: 보조 1개 안정, 보조 2개 60% 안정권 경계.

반영·Readback 탭:

| 탭 | 위치 | 결과 |
|---|---:|---|
| `02_현재_확정결정` | Row 61 | PASS / main SHA |
| `04_누락_충돌_감사` | Row 65 | PASS |
| `05_GDD_요약` | Row 19 | PASS |
| `12_핵심루프` | Row 26 | PASS |
| `15_조작_게임규칙` | Row 14 | PASS |
| `40_핵심시스템_메인콘텐츠` | Row 28 | PASS |
| `41_성장_경제` | Row 12 | PASS |
| `60_UX_UI_접근성` | Row 34 | PASS |
| `99_변경이력` | Row 79 | PASS / `SYNCED_TO_MAIN` |

## 동기화 절차

```text
Decision ID 확정
→ GitHub Authority·State·Registry 갱신
→ Authority Snapshot Commit
→ 관련 Sheet 범위 갱신
→ GitHub·Sheet Readback
→ SYNCED_TO_WORKING_BRANCH
→ PR 검증·병합
→ main authority SHA와 Sheet 재검증
→ SYNCED_TO_MAIN
```

## 상태 계약

| 상태 | 의미 |
|---|---|
| `PROPOSED_SHEET_CHANGE` | GitHub 승인 근거 없는 Sheet 단독 편집 |
| `GITHUB_ONLY` | GitHub 반영 성공, Sheet 실패·대기 |
| `SHEET_ONLY` | Sheet 반영 성공, GitHub 실패 |
| `SYNCED_TO_WORKING_BRANCH` | 작업 브랜치 Authority Snapshot과 Sheet가 같은 Decision ID·값으로 Readback 됨 |
| `SYNCED_TO_MAIN` | PR 병합 후 main authority Commit과 Sheet가 다시 일치 |
| `SYNC_CONFLICT` | 양쪽 값·상태·책임 경로 충돌 |

## 보존·검증 경계

- `GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 역사로 보존하며 새 Decision이 대체한 범위는 활성 근거로 사용하지 않는다.
- Sheet는 Code·Scene·Resource·Asset·Test·Runtime 증거를 대체하지 않는다.
- 승인된 수치는 `USER_APPROVED_PROTOTYPE_BASELINE / PLAYTEST_TUNING_REQUIRED`다.
- 제품 프로젝트·Runtime·모바일·성능·접근성·사람 검증은 `NOT_STARTED / NOT_RUN`이다.
