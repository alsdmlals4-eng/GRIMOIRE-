# GRIMOIRE-HGB-20260830-01 R1 - Adversarial Review

```yaml
review_id: GR-REVIEW-HGB-20260830-R1
pair_id: GRIMOIRE-HGB-20260830-01
revision: R1
review_mode: ATTACK_TO_CLEAN_REVIEW_EXIT
base_contract_readback: v9.4.3 / origin/main 7ead958819a8d96b639e2641a7bbf7c10822cc69
project_origin_main_readback: 7fab8f1406ea3cb9b7e002c4c000f2fbad173c53
pair_status: USER_FINAL_REVIEW_AWAITING
implementation_authority: BLOCKED_UNTIL_USER_APPROVES_EXACT_SCOPE
```

## 1. 검토 범위와 실패 가정

대상은 아래 세 가지 retained change다.

1. `docs/planning/GRIMOIRE_HUMAN_GAME_BLUEPRINT_20260830.md`
2. `docs/planning/GRIMOIRE_AI_IMPLEMENTATION_SPEC_20260830.md`
3. `output/pdf/grimoire_HUMAN_GAME_BLUEPRINT_20260830.pdf`

실패 가정은 다음과 같다.

- 사람이 온실/묘목을 게임 전체 또는 후반 현장 사건으로 오해한다.
- 최신 사용자 방향이 기존 W6/C6 정본과 충돌하는데 PDF가 현재 구현처럼 주장한다.
- 축제가 전투의 장식이 되거나 효율 정답 메뉴로 읽힌다.
- 장기 1학년 청사진이 W6 human/device/performance gate를 우회해 대량 구현 권한처럼 읽힌다.
- 시각 참고가 runtime asset 또는 release-rights proof처럼 읽힌다.
- PDF 레이아웃이 잘리거나 내용·상태 라벨·복구 목적지가 누락된다.

## 2. 기준 정본, 비교안, 열린 작업

| 항목 | 판정 |
| --- | --- |
| 최신 사용자 방향 | 온실/묘목은 **첫 지도 실습 사건**이며, 장기 경험은 수업 → 실습 → 전투 → 축제까지 이어져야 한다. 이 방향이 기존 장기 문서보다 우선한다. |
| 기존 장기 owner | 기존 C6/W6 문서는 온실을 큰 현장 사건/압축 검증판으로 서술한다. 삭제·덮어쓰기 없이 reconciliation 대상으로 보존한다. |
| 현재 구현 | Product Root와 W6 target/Preview/explicit cast/receipt는 `PARTIAL` 기술 기준선이다. 첫 지도 실습 scene과 장기 Chapter는 구현/사람 검증 전이다. |
| 열린 PR | #187 Task8 recovery, #166 README routing. 둘 다 Draft/read-only이며 본 pair와 중복 소유가 아니다. |
| Notion/Sheets | repository-only human canon / migration-only. 새 외부 canon write 없음. |

### 최소 3개 실질 대안

| 대안 | 장점 | 위험 | 판정 |
| --- | --- | --- | --- |
| A. Frostbloom 한 사건만 PDF로 유지 | 당장 구현 기반과 가장 가깝다 | 수업/실습/전투/축제의 장기 게임 약속을 숨긴다 | `REJECTED_CRITIQUE` - 최신 사용자 방향과 충돌 |
| B. 1학년 7 Chapter 척추 + 3년 방향만 제시 | 장기 완성 목표를 보여 주면서 현재 구현과 future content를 분리한다 | 후속 Chapter의 세부 content는 별도 승인 단위가 필요 | `ADOPT` - R1 채택 |
| C. 3년 전체 장면/asset/수치를 지금 확정 | 장기 계획의 세부도가 높다 | W6 사람 검증 전 대량 생산·의미 확정·asset scope creep 위험 | `DEFER` - 현재 pair에 불필요 |

## 3. 외부 조사와 실제 구현 가능성 재확인

| source / evidence | finding | disposition | limit |
| --- | --- | --- | --- |
| Nielsen Norman Group, Journey Mapping 101 (2026-08-30 확인) | 특정 사용자·상황·목표·행동의 큰 여정을 함께 보여 주는 것이 사람용 검수에 유효 | `ADAPT` - 1학년 여정과 장면 계약 분리 | 재미/실제 이해도를 증명하지 않음 |
| Nielsen Norman Group, User Journeys vs User Flows (2026-08-30 확인) | macro journey와 화면/행동 flow는 다른 질문을 푼다 | `ADOPT` - PDF page 5-8과 scene atlas 분리 | 실제 UI 구현을 대신하지 않음 |
| Unity, The Secret to More Efficient Playable Production (2026-08-30 확인) | 구현 전 storyboard/GDD가 플레이어 질문과 흐름을 명료하게 하는 데 유효 | `ADAPT` - PDF는 사람 검수, AI spec은 구현/QA owner | Unity 방식/표현을 복제하지 않음 |
| `project.godot`, Product Root, W6 receipt | target/Preview/explicit cast/result receipt seam은 존재 | `PARTIAL` - first practicum context/runtime equivalence는 증명하지 않음 | Human/device/performance/full-slice 미실행 |
| Visual coverage / current asset consumers | 새로운 raster asset에 concrete current-main consumer gap 없음 | `REJECT` 새 이미지 생성 | 장기 구현 승인 뒤 다시 preflight 필요 |

## 4. 5회 전체 개선 루프

| loop | full-scope attack / validated finding | 분류 | 최소 수정과 재검증 | 상태 |
| ---: | --- | --- | --- | --- |
| 1 | 기존 C6/W6의 온실 후반 배치가 최신 사용자 지시인 첫 지도 실습과 충돌 | `MUST_FIX`, `CONFLICT` | 사람용 원본, AI spec, PDF를 첫 지도 실습으로 재배치. 기존 owner/code는 무단 변경하지 않고 reconciliation boundary를 기록 | corrected |
| 2 | current W6 automated/runtime-smoke evidence가 첫 지도 실습 완성 경험으로 과장될 위험 | `MUST_FIX`, `OMISSION` | `설계 의도`, `구현 기준선`, `사람 검수 전`, `시각 참고`를 구분. W6와 first practicum의 runtime equivalence 금지 | corrected |
| 3 | PDF가 7 Chapter 지도 clipping, 참조 이미지 blank cover, 기능/분기 카드 겹침으로 읽기 실패할 위험 | `MUST_FIX`, `COMPLEMENT_GAP` | Chapter card 폭/간격, image frame, page 6 기능 카드, page 8 결과 분기를 수정. 28페이지 전체 재렌더링 | corrected |
| 4 | 장기 수업/전투/축제 설명을 위해 새 이미지나 외부 asset을 과생산할 위험 | `REJECTED_CRITIQUE` | 기존 온실 배경과 text-native flow/card만 사용. W6 board는 first practicum 규모를 오해시킬 수 있어 최종 PDF에서 제거 | clean |
| 5 | 장기 청사진이 축제의 역할, 전투 파밍 방지, first-year closure, current W6 validation 우선순위를 약화할 위험 | `SHOULD_FIX`, `COMPLEMENT_GAP` | page 18-20 축제 통제 응용/세 해법/재설계, page 17 반복 감쇠, page 26-28 포트폴리오·검수 우선순위를 명시 | corrected |

### 회차별 공통 재공격 결과

각 회차에서 아래 표면을 다시 공격했다: 최신 사용자 의도, 기획 owner와 실제 W6 consumer, spell-flow invariants, success/partial/failure/retry/return, asset/provenance, mobile landscape document readability, open PR overlap, Notion/Sheets boundary, 비용/대량 생산 위험, Human/Device/Performance evidence ceiling, rollback/reconciliation path.

- `BETTER_ALTERNATIVE_SEARCH`: B안보다 강한 범위 내 대안 없음. A는 사용자 방향과 충돌하고 C는 현재 검증 순서를 무너뜨린다.
- `LONG_TERM_PLAN_FIT_RECHECK`: 수업 → 첫 온실 실습 → 자유일정/응용 → 축제 → 전투/후속 현장 → 복기/첫 원리의 연결은 장기 완성 목표에 맞고, 전투/축제/온실 중 하나가 게임 전부가 되는 문제를 막는다.
- `reconciliation / rollback`: 이 pair는 기존 W6/C6 code/data/Scene을 바꾸지 않았으므로, user review에서 방향이 바뀌면 문서 pair만 R2로 수정하면 된다. 최종 승인 후에도 W6/C6 조정은 독립 unit으로 rollback 가능해야 한다.

## 5. 렌더·회귀 검증

| 검증 | 실제 결과 |
| --- | --- |
| PDF 구조 | A4 landscape, 28 pages, no encryption, no JavaScript, no forms |
| 내용 확인 | `첫 지도 실습`, `축제의 세 해법`, `후속 현장 책임`, `최종 검수 질문` 텍스트가 PDF에서 확인됨 |
| 시각 렌더 | Poppler로 28/28 페이지 PNG 재생성. 표지, Chapter 지도, 다섯 기능, 성공/실패/복구, 온실 첫 실습, 축제, Chapter table, 첫 실습 판단, 최종 검수 페이지를 직접 검수함 |
| 렌더 수정 | 7 Chapter 지도 clipping, 이미지 frame 덮어쓰기, 기능 카드 header overlap, 결과 분기 header overlap/줄바꿈 glyph을 수정 후 재렌더 |
| 문서 정적 검사 | `git diff --check` 통과. Markdown pair와 Project Home link의 상태/경계 용어를 재검색 |
| runtime / device / human | 실행하지 않음. `NOT_RUN`으로 유지하며 본 문서의 PASS로 승격하지 않음 |

## 6. Finding 판정과 남은 위험

| 분류 | 항목 | 판정/조건 |
| --- | --- | --- |
| `MUST_FIX` | 최신 사용자 방향과 기존 C6/W6 배치의 충돌 | R1 pair에 반영됨. 기존 owner 변경은 final approval 뒤 별도 reconciliation unit 필요 |
| `DEFER` | 후속 큰 현장 사건의 구체 content, 2-3학년 상세 장면/asset | current W6 human validation과 exact scope 승인 후 |
| `BLOCKED_UNVERIFIED` | first practicum의 실제 조작/시간/이해, W6 human/device/performance/accessibility/export/full-slice | 실제 scene/target device/player observation 필요 |
| `ALLOWED_LEGACY` | 기존 C6/W6의 온실 후반 서술 | historical/current owner로 보존. 새 pair는 사용자 방향과의 충돌을 숨기지 않음 |
| `NO_MATERIAL_FOLLOWUP` | 열린 PR 중복, Notion/Sheets 새 canon, 신규 이미지 생성 | 발견하지 않음 |

## 7. 완료 후보 재계산과 최종 판정

```yaml
remaining_work_recalculation:
  current_document_pair:
    required_document_changes: 0
    final_pdf_render_check: COMPLETED
    user_final_review: AWAITING
  product_implementation:
    authorization: BLOCKED
    required_future_units:
      - W6 human/device/performance/accessibility/export/full-slice evidence
      - first-practicum versus existing W6/C6 reconciliation decision
      - exact approved implementation unit for each later Chapter
implementation_correction_rescan: NO_NEW_DOCUMENT_PAIR_FINDING
post_change_monitor_loop: CLEAN_FOR_DOCUMENT_PAIR
clean_review_exit: DOCUMENT_PAIR_ONLY
project_completion: NOT_CLAIMED
```

R1은 사람용 검수와 AI/개발/QA 인계를 위한 **문서 pair**로는 clean exit 조건을 만족한다. 그러나 사용자 최종 검수와 exact scope 승인 전에는 구현 권한이 없고, Human/Device/Performance/Full Slice 검증도 여전히 `NOT_RUN`이다.
