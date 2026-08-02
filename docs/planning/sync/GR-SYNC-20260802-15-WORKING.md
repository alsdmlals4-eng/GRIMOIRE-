# GR-SYNC-20260802-15 — 숨김 소폭 감점·학기말 평가 Working Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-15
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
authority_head_before_sheet: 20185faaade9b9ba7485806284ef0dc856b60701
final_head_resolution: CURRENT_BRANCH_CONTAINING_FINAL_BATCH_STATE; exact SHA recorded in Google Sheet
approved_decision: GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
approved_option: A_RESULT_TAG_RECOVERY_SPIRAL_WITH_HIDDEN_MINOR_SEMESTER_EVALUATION
approved_at: 2026-08-02T18:23+09:00
current_grill_me_decision: GM-FULL-GAME-SCOPE-ENDING-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
grill_me_counter: 6_of_10
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 사용자 승인

사용자는 권장 A안을 승인하고 다음을 명시했다.

```text
결과는 약간의 점수 감점만 진행
→ 감점은 학기 중 알려주지 않음
→ 학기 종료 때 전체 결과를 평가
```

## 3. 정본 해석

- 사건의 실제 결과·부작용·발견은 즉시 세계와 마도서에 남긴다.
- 내부 평가 점수·사건별 감점·예상 등급·장학 임계값은 학기 중 공개하지 않는다.
- 부분 성공·실패는 작은 상한형 감점만 누적한다.
- 한 번의 실패가 학기 평가·장학·전문화·진행을 지배하지 않는다.
- 학기말에는 전체 포트폴리오와 함께 종합 평가한다.
- 내부 원점수는 숨기지만 어떤 사건과 행동이 평가에 반영됐는지는 문장으로 설명한다.
- 회복 콘텐츠는 감점 삭제가 아니라 새 긍정 증거·발견·대체 해법을 제공한다.

## 4. GitHub 반영

- Failure Long-term Impact Grill resolved.
- Hidden Semester Evaluation Approval created.
- Full Game Scope and Ending Grill created.
- Gap Audit advanced to `P2_CLOSED_6 / OPEN_1`.
- Batch State advanced to `6/10`.
- 이 Working Sync Receipt 생성.

## 5. Google Sheet Readback

검증 범위:

- `00·01·02·03·04·05·10·12·30·41·50·52·80·90·99`.

판정:

```text
Decision ID match = PASS
Approved option match = PASS
Counter 6/10 = PASS
Pending decisions 6 = PASS
Immediate world/Grimoire result visibility = PASS
Internal score and per-event deduction hidden during term = PASS
Small bounded deduction rule = PASS
No immediate scholarship loss, relationship break, course/content lock = PASS
Semester-end aggregate evaluation = PASS
Representative cause explanation = PASS
GR-L-13 / GR-EC-07 / GR-CT-11 / GR-ST-07 / GR-TEST-020 = PASS
Next Grill Me match = PASS
Implementation/Runtime/Device/Human boundary = PRESERVED
```

초기 쓰기에서 `12_핵심루프`의 `GR-L-12`와 `50_메인콘텐츠`의 `GR-CT-10`이 덮어써진 것을 Readback 중 발견했다. 두 기존 행을 원문으로 복원하고 새 행을 다음 빈 행으로 이동한 뒤 재조회했다.

```text
GR-L-11 → GR-L-12 → GR-L-13 → GR-L-14 = PASS
GR-CT-08 → GR-CT-09 → GR-CT-10 → GR-CT-11 = PASS
Existing authority row overwrite after repair = NONE
```

## 6. 병합 경계

- Draft PR #36은 병합하지 않는다.
- 기본 병합은 `10/10`이다.
- 조기 Trigger 발생 시 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 먼저 실행한다.
