# GM-GRILL-MERGE-CADENCE-01 — Grill Me 승인 10건 병합 주기 정책

## 1. 상태

```yaml
decision_id: GM-GRILL-MERGE-CADENCE-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02T15:16+09:00
parent_policy: GM-CANON-SYNC-01
supersedes_scope: GM-CANON-SYNC-01의 기본 PR 병합 시점만 대체
github_repository: alsdmlals4-eng/GRIMOIRE-
google_sheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
batch_threshold: 10
counter_start: 0
effective_after_flush_main: fe983e3d4ec327d8ceacc41b9976002cad88a524
product_implementation: NOT_STARTED
codex: BLOCKED
```

## 2. 결정

승인된 기획 결정은 계속 즉시 GitHub 작업 브랜치와 연결된 Google Sheet에 같은 Decision ID로 반영한다. 다만 기본 PR 병합 시점은 Grill Me에서 사용자 승인을 받은 **서로 다른 Decision ID 10건**이 누적될 때로 변경한다.

```text
Grill Me 제시
→ 사용자 승인
→ Decision ID 확정
→ GitHub 권위 문서·계획 데이터 갱신
→ authority commit
→ 연결 Sheet 갱신
→ GitHub·Sheet Readback
→ SYNCED_TO_WORKING_BRANCH
→ Grill Me 승인 카운터 +1
→ 10/10 도달 시 Batch Freeze
→ 병합 직전 GitHub·Sheet·PR 전수 점검
→ 적대적 검토 루프 PASS
→ PR 병합
→ main·Sheet 재조회
→ SYNCED_TO_MAIN
→ 카운터 0으로 Reset
```

`GM-CANON-SYNC-01`의 즉시 정본 동기화 원칙은 유지된다. 이번 결정이 바꾸는 것은 **working branch에서 main으로 병합하는 기본 주기**뿐이다.

## 3. 카운트 규칙

다음 조건을 모두 만족할 때 1건으로 센다.

1. Grill Me 형식으로 실제 대안·충돌·범위 결정이 제시됐다.
2. 사용자가 권장안·특정안·수정안을 명시적으로 승인했다.
3. 고유 Decision ID가 부여됐다.
4. GitHub 권위 문서와 Sheet가 같은 값으로 Readback됐다.

다음은 카운트하지 않는다.

- 같은 Decision ID의 문구 수정·오탈자·SHA 정정.
- 단순 진행 승인이나 이미 승인된 결정의 재확인.
- 테스트값 조정처럼 아직 `PLAYTEST_TUNING_REQUIRED`인 후보.
- 승인되지 않은 브레인스토밍·벤치마크·연구 메모.
- main 동기화 전용 PR과 영수증 PR.

한 Grill Me 응답에서 여러 독립 Decision ID가 승인되면 각 ID를 별도 1건으로 센다. 단, 하나의 결정을 문서 편의상 여러 파일로 나눈 것은 1건이다.

## 4. 기본 Batch 상태

이 정책 채택 직전에 승인된 항목은 모두 병합 완료 상태다.

```yaml
latest_decision_main: 2aec51244ea96fc4d4c9088fcb133f41862faa1d
latest_cold_start_main: fe983e3d4ec327d8ceacc41b9976002cad88a524
merged_prs: [31, 32]
open_prs_at_policy_start: 0
sheet_state: SYNCED_TO_MAIN
sheet_readback: PASS
approved_grill_me_since_last_flush: 0
next_threshold: 10
```

따라서 새 카운터는 이 정책 이후 승인되는 Grill Me Decision부터 `0/10`으로 시작한다.

## 5. 10건 이전 조기 병합 조건

10건은 기본 최대 Batch 크기다. 다음 중 하나면 사용자의 별도 지시 또는 운영 안전을 위해 더 일찍 병합할 수 있다.

- 사용자가 `지금 병합`, `승인한 것 전부 병합`처럼 명시적으로 요청.
- Gate 전환, Codex 권한 변경, 구현 시작 승인처럼 clean main이 선행돼야 하는 경계.
- P0/P1 정본 충돌·보안·데이터 손상 위험을 즉시 닫아야 하는 경우.
- 장기 작업 종료·인계 전에 승인 결정 유실을 방지해야 하는 경우.

조기 병합도 제7절의 병합 전 전수 점검을 생략할 수 없다. 병합이 완료되면 해당 Batch의 카운터는 0으로 Reset한다.

## 6. Batch Freeze

카운터가 `10/10`에 도달하면 다음을 수행한다.

- 새 Grill Me 질문을 잠시 중단한다.
- Batch에 포함된 Decision ID·권위 경로·Sheet 범위를 고정한다.
- 승인됐지만 GitHub 또는 Sheet 한쪽만 반영된 항목을 찾는다.
- 서로 다른 PR에 흩어진 승인 변경을 main 기준으로 재정렬한다.
- `GRILL_ME_BATCH_MERGE_STATE.json`을 갱신한다.

P0/P1 충돌이 해결되기 전에는 카운터를 임의로 Reset하거나 완료로 표시하지 않는다.

## 7. 병합 직전 필수 전수 점검

병합 직전에 반드시 `PRE_MERGE_ADVERSARIAL_REVIEW_CHECKLIST_2026-08-02.md`를 실행한다.

### GitHub

- 최신 main SHA와 작업 브랜치 merge-base.
- 열린 PR·중복 PR·stale PR·병합되지 않은 승인 PR.
- 변경 파일 전부와 승인 범위 밖 파일 침범.
- Decision ID, 책임 원본, Current Decisions, Active Context, cold-start 경로.
- Registry·Adapter·Generator·생성물 drift.
- PR 본문·changed files·review thread·mergeability·CI/Adversarial Gate.
- `TODO`, `TBD`, placeholder, 구형 Gate·플랫폼·Decision 참조.

### Google Sheet

- `00_프로젝트_허브` 현재 상태·다음 Gate.
- `01_작업순서` 순서·BLOCKS·승인 상태.
- `02_현재_확정결정` Decision ID·책임 원본·commit 상태.
- 각 Decision의 도메인 탭.
- `04_누락_충돌_감사` 미해결·미검증·부분 동기화.
- `99_변경이력` Sync ID·PR·commit·Readback.

### 교차 검증

- GitHub와 Sheet의 Decision ID·값·상태·책임 경로가 동일한가.
- working branch SHA를 main SHA로 잘못 표기하지 않았는가.
- `SYNCED_TO_MAIN`을 main 병합·Sheet 재조회 전에 사용하지 않았는가.
- 승인되지 않은 후보·시험값을 확정값으로 승격하지 않았는가.
- 제품 구현·Runtime·기기·사람 검증을 실행하지 않고 완료로 주장하지 않았는가.

## 8. 병합 금지 조건

다음 중 하나라도 참이면 병합하지 않는다.

- 미해결 P0 또는 P1 정본 충돌.
- GitHub·Sheet Decision 값 불일치.
- CI, Generator, JSON/Registry, Adversarial Gate 실패.
- merge conflict 또는 mergeability 미확인.
- 미해결 review thread·requested changes.
- 승인 범위 밖 제품 코드·Scene·Resource·데이터·잠긴 Asset 변경.
- authority path 누락 또는 Sheet Readback 실패.

실패 시 `SYNC_CONFLICT`, `GITHUB_ONLY`, `SHEET_ONLY`, `CI_FAILED`, `REVIEW_BLOCKED` 중 정확한 상태를 기록하고 해결 후 처음부터 재검증한다.

## 9. 병합 후 처리

```text
PR merge SHA 확인
→ main에서 권위 문서·상태 재조회
→ Sheet에 main SHA·PR·범위 반영
→ Sheet Main Readback
→ cold-start·Active Context·Current Decisions 확인
→ SYNCED_TO_MAIN
→ Batch 영수증 저장
→ pending Decision 목록 비우기
→ approved_grill_me_since_last_flush = 0
```

main 동기화 전용 후속 PR이 필요하면 그것까지 병합한 뒤 최종 cold-start main SHA를 Sheet에 기록한다.

## 10. 현재 다음 작업

운영 정책 병합을 닫은 뒤 제품 기획은 기존 순서를 유지한다.

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
```

이 정책은 제품 구현 권한을 부여하지 않는다. `PLANNING_ONLY_PROFILE`, `implementation: NOT_STARTED`, `codex: BLOCKED`를 유지한다.
