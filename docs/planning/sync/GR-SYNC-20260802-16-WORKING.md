# GR-SYNC-20260802-16 — 3학년 본편 + 1학년 데모 Working Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-16
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
authority_head_before_sheet: 472a886c8e3b1dd2d435f09a8c9b25076fe4cbf6
final_head_resolution: CURRENT_BRANCH_CONTAINING_FINAL_BATCH_STATE; exact SHA recorded in Google Sheet
approved_decision: GM-FULL-GAME-SCOPE-ENDING-01
approved_option: B_THREE_SCHOOL_YEAR_FULL_GAME_WITH_A_YEAR_ONE_DEMO_BOUNDARY
approved_at: 2026-08-02T18:39+09:00
current_grill_me_decision: GM-VERTICAL-SLICE-REPRESENTATIVENESS-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
grill_me_counter: 7_of_10
implementation: NOT_STARTED
codex: BLOCKED
```

## 2. 사용자 승인

사용자는 정식 본편으로 B안을, 데모 제작 범위로 A안을 선택했다.

```text
정식 본편: 3학년 전체 학교 대서사
데모: 1학년 3학기 완결형
내부 검증: 기존 46–53분 Vertical Slice
```

## 3. 제품 단계 정본

```text
Internal Vertical Slice
→ Year-One Demo Build
→ Three-School-Year Full Game
```

- Vertical Slice는 핵심 시스템과 위험을 검증하는 내부 대표 세션이다.
- Year-One Demo는 일반 짧은 체험판보다 큰 1학년 완결형 데모/프롤로그 에디션이다.
- Full Game은 입학부터 전문화·상급 연구·졸업·대규모 세계 재작성까지 3학년 전체를 다룬다.
- Demo는 Full Game의 정본 1학년이며 저장·마도서·수강·관계·결과 태그 승계를 고려한다.

## 4. 후보 범위

### Year-One Demo

- 3학기.
- 핵심 Chapter 6~8개.
- 메인 계열 3개 내외.
- 미니게임 가족 4~6개.
- 학교 Hub 1개, 현장 권역 2~3개.
- 첫 독자적 마법 원리와 책임 있는 세계 변화 엔딩.

### Full Game

- 3학년·6~9학기.
- 핵심 Chapter 12~18개 이상.
- 메인 계열 5개 이상과 복수 전문화.
- 졸업·대규모 세계 재작성 엔딩.

모든 수치는 `TEST_VALUE`다.

## 5. 적대적 보호

- Year-One Demo 검증 전 2·3학년 전용 대형 콘텐츠를 본제작하지 않는다.
- 46–53분 Vertical Slice를 건너뛰고 6~8 Chapter 제작에 들어가지 않는다.
- 학년별 신규 시스템 폭증보다 기존 시스템의 조합·책임·상황 복합성을 높인다.
- 계열별 완전 별도 캠페인을 만들지 않는다.
- Demo 배포·가격·저장 승계의 실제 방식은 후속 출시 Gate에서 결정한다.

## 6. GitHub 반영

- Scope and Ending Grill resolved.
- Scope and Ending Approval created.
- Vertical Slice Representativeness Grill created.
- Gap Audit advanced to `P2_CLOSED_7 / OPEN_0`.
- `FULL-GAME-STRUCTURE-01`을 승인 완료하고 현재 Gate를 `VERTICAL-SLICE-REPRESENTATIVENESS-01`로 전환.
- Batch State advanced to `7/10`.

## 7. Google Sheet Readback

검증 범위:

- `00·01·02·03·04·05·10·12·20·30·40·41·50·52·80·90·99`.

판정:

```text
Decision ID match = PASS
Approved B full game + A demo option = PASS
Three-stage boundary = PASS
Counter 7/10 = PASS
Pending decisions 7 = PASS
Full Game Structure gate complete = PASS
Representativeness gate current = PASS
Existing authority row overwrite = NONE
Implementation/Runtime/Device/Human boundary = PRESERVED
```

## 8. 병합 경계

- Draft PR #36은 병합하지 않는다.
- 기본 병합은 `10/10`이다.
- 조기 Trigger 발생 시 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 먼저 실행한다.
